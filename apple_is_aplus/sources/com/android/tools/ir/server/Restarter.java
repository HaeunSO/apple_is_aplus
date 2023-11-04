package com.android.tools.ir.server;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.os.Build;
import android.util.ArrayMap;
import android.util.Log;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes4.dex */
public class Restarter {
    public static void restartActivityOnUiThread(final Activity activity) {
        activity.runOnUiThread(new Runnable() { // from class: com.android.tools.ir.server.Restarter.1
            @Override // java.lang.Runnable
            public void run() {
                if (Log.isLoggable(Logging.LOG_TAG, 2)) {
                    Log.v(Logging.LOG_TAG, "Resources updated: notify activities");
                }
                Restarter.updateActivity(activity);
            }
        });
    }

    private static void restartActivity(Activity activity) {
        if (Log.isLoggable(Logging.LOG_TAG, 2)) {
            Log.v(Logging.LOG_TAG, "About to restart " + activity.getClass().getSimpleName());
        }
        while (activity.getParent() != null) {
            if (Log.isLoggable(Logging.LOG_TAG, 2)) {
                Log.v(Logging.LOG_TAG, activity.getClass().getSimpleName() + " is not a top level activity; restarting " + activity.getParent().getClass().getSimpleName() + " instead");
            }
            activity = activity.getParent();
        }
        activity.recreate();
    }

    public static void restartApp(Context appContext, Collection<Activity> knownActivities, boolean toast) {
        if (!knownActivities.isEmpty()) {
            Activity foreground = getForegroundActivity(appContext);
            if (foreground != null) {
                if (toast) {
                    showToast(foreground, "Restarting app to apply incompatible changes");
                }
                if (Log.isLoggable(Logging.LOG_TAG, 2)) {
                    Log.v(Logging.LOG_TAG, "RESTARTING APP");
                }
                Intent intent = new Intent(foreground, foreground.getClass());
                PendingIntent pendingIntent = PendingIntent.getActivity(foreground, 0, intent, 268435456);
                AlarmManager mgr = (AlarmManager) foreground.getSystemService("alarm");
                mgr.set(1, System.currentTimeMillis() + 100, pendingIntent);
                if (Log.isLoggable(Logging.LOG_TAG, 2)) {
                    Log.v(Logging.LOG_TAG, "Scheduling activity " + foreground + " to start after exiting process");
                }
            } else {
                showToast(knownActivities.iterator().next(), "Unable to restart app");
                if (Log.isLoggable(Logging.LOG_TAG, 2)) {
                    Log.v(Logging.LOG_TAG, "Couldn't find any foreground activities to restart for resource refresh");
                }
            }
            System.exit(0);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void showToast(final Activity activity, final String text) {
        if (Log.isLoggable(Logging.LOG_TAG, 2)) {
            Log.v(Logging.LOG_TAG, "About to show toast for activity " + activity + ": " + text);
        }
        activity.runOnUiThread(new Runnable() { // from class: com.android.tools.ir.server.Restarter.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Context context = activity.getApplicationContext();
                    if (context instanceof ContextWrapper) {
                        Context base = ((ContextWrapper) context).getBaseContext();
                        if (base == null) {
                            if (Log.isLoggable(Logging.LOG_TAG, 5)) {
                                Log.w(Logging.LOG_TAG, "Couldn't show toast: no base context");
                                return;
                            }
                            return;
                        }
                    }
                    int duration = 0;
                    duration = (text.length() >= 60 || text.indexOf(10) != -1) ? 1 : 1;
                    Toast.makeText(activity, text, duration).show();
                } catch (Throwable e) {
                    if (Log.isLoggable(Logging.LOG_TAG, 5)) {
                        Log.w(Logging.LOG_TAG, "Couldn't show toast", e);
                    }
                }
            }
        });
    }

    public static Activity getForegroundActivity(Context context) {
        List<Activity> list = getActivities(context, true);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    public static List<Activity> getActivities(Context context, boolean foregroundOnly) {
        Class activityThreadClass;
        Object activityThread;
        Field activitiesField;
        Collection c;
        List<Activity> list = new ArrayList<>();
        try {
            activityThreadClass = Class.forName("android.app.ActivityThread");
            activityThread = MonkeyPatcher.getActivityThread(context, activityThreadClass);
            activitiesField = activityThreadClass.getDeclaredField("mActivities");
            activitiesField.setAccessible(true);
        } catch (Throwable e) {
            if (Log.isLoggable(Logging.LOG_TAG, 5)) {
                Log.w(Logging.LOG_TAG, "Error retrieving activities", e);
            }
        }
        if (hasAppCrashed(context, activityThreadClass, activityThread)) {
            return new ArrayList();
        }
        Object collection = activitiesField.get(activityThread);
        if (collection instanceof HashMap) {
            Map activities = (HashMap) collection;
            c = activities.values();
        } else if (Build.VERSION.SDK_INT >= 19 && (collection instanceof ArrayMap)) {
            ArrayMap activities2 = (ArrayMap) collection;
            c = activities2.values();
        } else {
            return list;
        }
        for (Object activityClientRecord : c) {
            Class activityClientRecordClass = activityClientRecord.getClass();
            if (foregroundOnly) {
                Field pausedField = activityClientRecordClass.getDeclaredField("paused");
                pausedField.setAccessible(true);
                if (pausedField.getBoolean(activityClientRecord)) {
                }
            }
            Field activityField = activityClientRecordClass.getDeclaredField("activity");
            activityField.setAccessible(true);
            Activity activity = (Activity) activityField.get(activityClientRecord);
            if (activity != null) {
                list.add(activity);
            }
        }
        return list;
    }

    private static boolean hasAppCrashed(Context context, Class activityThreadClass, Object activityThread) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        if (context == null || activityThread == null) {
            return false;
        }
        String currentPackageName = getPackageName(activityThreadClass, activityThread);
        ActivityManager manager = (ActivityManager) context.getSystemService("activity");
        List<ActivityManager.ProcessErrorStateInfo> processesInErrorState = manager.getProcessesInErrorState();
        if (processesInErrorState != null) {
            for (ActivityManager.ProcessErrorStateInfo info : processesInErrorState) {
                if (info.processName.equals(currentPackageName) && info.condition != 0) {
                    if (Log.isLoggable(Logging.LOG_TAG, 2)) {
                        Log.v(Logging.LOG_TAG, "App Thread has crashed, return empty activity list.");
                        return true;
                    }
                    return true;
                }
            }
        }
        return false;
    }

    private static String getPackageName(Class activityThreadClass, Object activityThread) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        Method currentPackageNameMethod = activityThreadClass.getDeclaredMethod("currentPackageName", new Class[0]);
        return (String) currentPackageNameMethod.invoke(activityThread, new Object[0]);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void updateActivity(Activity activity) {
        restartActivity(activity);
    }
}
