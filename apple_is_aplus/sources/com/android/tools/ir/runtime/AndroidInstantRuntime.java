package com.android.tools.ir.runtime;

import com.android.tools.ir.common.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.NoSuchElementException;
import java.util.logging.Level;
import java.util.logging.Logger;
/* loaded from: classes2.dex */
public class AndroidInstantRuntime {

    /* loaded from: classes.dex */
    protected interface Logging {
        boolean isLoggable(Level level);

        void log(Level level, String str);

        void log(Level level, String str, Throwable th);
    }

    public static void setLogger(final Logger logger) {
        Log.logging = new Log.Logging() { // from class: com.android.tools.ir.runtime.AndroidInstantRuntime.1
            @Override // com.android.tools.ir.common.Log.Logging
            public void log(Level level, String string) {
                logger.log(level, string);
            }

            @Override // com.android.tools.ir.common.Log.Logging
            public boolean isLoggable(Level level) {
                return logger.isLoggable(level);
            }

            @Override // com.android.tools.ir.common.Log.Logging
            public void log(Level level, String string, Throwable throwable) {
                logger.log(level, string, throwable);
            }
        };
    }

    public static Object getStaticPrivateField(Class targetClass, String fieldName) {
        return getPrivateField(null, targetClass, fieldName);
    }

    public static void setStaticPrivateField(Object value, Class targetClass, String fieldName) {
        setPrivateField(null, value, targetClass, fieldName);
    }

    public static void setPrivateField(Object targetObject, Object value, Class targetClass, String fieldName) {
        try {
            Field declaredField = getField(targetClass, fieldName);
            declaredField.set(targetObject, value);
        } catch (IllegalAccessException e) {
            if (Log.logging != null) {
                Log.logging.log(Level.SEVERE, String.format("Exception during setPrivateField %s", fieldName), e);
            }
            throw new RuntimeException(e);
        }
    }

    public static Object getPrivateField(Object targetObject, Class targetClass, String fieldName) {
        try {
            Field declaredField = getField(targetClass, fieldName);
            return declaredField.get(targetObject);
        } catch (IllegalAccessException e) {
            if (Log.logging != null) {
                Log.Logging logging = Log.logging;
                Level level = Level.SEVERE;
                Object[] objArr = new Object[2];
                objArr[0] = targetObject == null ? " static" : "";
                objArr[1] = fieldName;
                logging.log(level, String.format("Exception during%1$s getField %2$s", objArr), e);
            }
            throw new RuntimeException(e);
        }
    }

    private static Field getField(Class target, String name) {
        Field declareField = getFieldByName(target, name);
        if (declareField == null) {
            throw new RuntimeException(new NoSuchElementException(name));
        }
        declareField.setAccessible(true);
        return declareField;
    }

    public static Object invokeProtectedMethod(Object receiver, Object[] params, Class[] parameterTypes, String methodName) throws Throwable {
        if (Log.logging != null && Log.logging.isLoggable(Level.FINE)) {
            Log.logging.log(Level.FINE, String.format("protectedMethod:%s on %s", methodName, receiver));
        }
        try {
            Method toDispatchTo = getMethodByName(receiver.getClass(), methodName, parameterTypes);
            if (toDispatchTo == null) {
                throw new RuntimeException(new NoSuchMethodException(methodName));
            }
            toDispatchTo.setAccessible(true);
            return toDispatchTo.invoke(receiver, params);
        } catch (IllegalAccessException e) {
            Log.logging.log(Level.SEVERE, String.format("Exception while invoking %s", methodName), e);
            throw new RuntimeException(e);
        } catch (InvocationTargetException e2) {
            throw e2.getCause();
        }
    }

    public static Object invokeProtectedStaticMethod(Object[] params, Class[] parameterTypes, String methodName, Class receiverClass) throws Throwable {
        if (Log.logging != null && Log.logging.isLoggable(Level.FINE)) {
            Log.logging.log(Level.FINE, String.format("protectedStaticMethod:%s on %s", methodName, receiverClass.getName()));
        }
        try {
            Method toDispatchTo = getMethodByName(receiverClass, methodName, parameterTypes);
            if (toDispatchTo == null) {
                throw new RuntimeException(new NoSuchMethodException(methodName + " in class " + receiverClass.getName()));
            }
            toDispatchTo.setAccessible(true);
            return toDispatchTo.invoke(null, params);
        } catch (IllegalAccessException e) {
            Log.logging.log(Level.SEVERE, String.format("Exception while invoking %s", methodName), e);
            throw new RuntimeException(e);
        } catch (InvocationTargetException e2) {
            throw e2.getCause();
        }
    }

    public static <T> T newForClass(Object[] params, Class[] paramTypes, Class<T> targetClass) throws Throwable {
        try {
            Constructor declaredConstructor = targetClass.getDeclaredConstructor(paramTypes);
            declaredConstructor.setAccessible(true);
            try {
                return targetClass.cast(declaredConstructor.newInstance(params));
            } catch (IllegalAccessException e) {
                Log.logging.log(Level.SEVERE, String.format("Exception while instantiating %s", targetClass), e);
                throw new RuntimeException(e);
            } catch (InstantiationException e2) {
                Log.logging.log(Level.SEVERE, String.format("Exception while instantiating %s", targetClass), e2);
                throw new RuntimeException(e2);
            } catch (InvocationTargetException e3) {
                throw e3.getCause();
            }
        } catch (NoSuchMethodException e4) {
            Log.logging.log(Level.SEVERE, "Exception while resolving constructor", e4);
            throw new RuntimeException(e4);
        }
    }

    private static Field getFieldByName(Class<?> aClass, String name) {
        if (Log.logging != null && Log.logging.isLoggable(Level.FINE)) {
            Log.logging.log(Level.FINE, String.format("getFieldByName:%s in %s", name, aClass.getName()));
        }
        for (Class<?> currentClass = aClass; currentClass != null; currentClass = currentClass.getSuperclass()) {
            try {
                return currentClass.getDeclaredField(name);
            } catch (NoSuchFieldException e) {
            }
        }
        return null;
    }

    private static Method getMethodByName(Class<?> aClass, String name, Class[] paramTypes) {
        if (aClass == null) {
            return null;
        }
        Class<?> currentClass = aClass;
        while (currentClass != null) {
            try {
                return currentClass.getDeclaredMethod(name, paramTypes);
            } catch (NoSuchMethodException e) {
                currentClass = currentClass.getSuperclass();
                if (currentClass != null && Log.logging != null && Log.logging.isLoggable(Level.FINE)) {
                    Log.logging.log(Level.FINE, String.format("getMethodByName:Looking in %s now", currentClass.getName()));
                }
            }
        }
        return null;
    }

    public static void trace(String s) {
        if (Log.logging != null) {
            Log.logging.log(Level.FINE, s);
        }
    }

    public static void trace(String s1, String s2) {
        if (Log.logging != null) {
            Log.logging.log(Level.FINE, String.format("%s %s", s1, s2));
        }
    }

    public static void trace(String s1, String s2, String s3) {
        if (Log.logging != null) {
            Log.logging.log(Level.FINE, String.format("%s %s %s", s1, s2, s3));
        }
    }

    public static void trace(String s1, String s2, String s3, String s4) {
        if (Log.logging != null) {
            Log.logging.log(Level.FINE, String.format("%s %s %s %s", s1, s2, s3, s4));
        }
    }
}
