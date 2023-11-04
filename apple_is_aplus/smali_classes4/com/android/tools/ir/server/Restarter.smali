.class public Lcom/android/tools/ir/server/Restarter;
.super Ljava/lang/Object;
.source "Restarter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)V
    .locals 0
    .param p0, "x0"    # Landroid/app/Activity;

    .line 60
    invoke-static {p0}, Lcom/android/tools/ir/server/Restarter;->updateActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public static getActivities(Landroid/content/Context;Z)Ljava/util/List;
    .locals 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "foregroundOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z)",
            "Ljava/util/List<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .line 202
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 204
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Landroid/app/Activity;>;"
    :try_start_0
    const-string v1, "android.app.ActivityThread"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 205
    .local v1, "activityThreadClass":Ljava/lang/Class;
    invoke-static {p0, v1}, Lcom/android/tools/ir/server/MonkeyPatcher;->getActivityThread(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .line 206
    .local v2, "activityThread":Ljava/lang/Object;
    const-string v3, "mActivities"

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 207
    .local v3, "activitiesField":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 210
    invoke-static {p0, v1, v2}, Lcom/android/tools/ir/server/Restarter;->hasAppCrashed(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 211
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    return-object v4

    .line 215
    :cond_0
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 217
    .local v5, "collection":Ljava/lang/Object;
    instance-of v6, v5, Ljava/util/HashMap;

    if-eqz v6, :cond_1

    .line 219
    move-object v6, v5

    check-cast v6, Ljava/util/HashMap;

    .line 220
    .local v6, "activities":Ljava/util/Map;
    invoke-interface {v6}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v7

    .line 220
    .end local v6    # "activities":Ljava/util/Map;
    move-object v6, v7

    .line 221
    .local v6, "c":Ljava/util/Collection;
    goto :goto_0

    .line 221
    .end local v6    # "c":Ljava/util/Collection;
    :cond_1
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x13

    if-lt v6, v7, :cond_5

    instance-of v6, v5, Landroid/util/ArrayMap;

    if-eqz v6, :cond_5

    .line 223
    move-object v6, v5

    check-cast v6, Landroid/util/ArrayMap;

    .line 224
    .local v6, "activities":Landroid/util/ArrayMap;
    invoke-virtual {v6}, Landroid/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v7

    .line 224
    .end local v6    # "activities":Landroid/util/ArrayMap;
    move-object v6, v7

    .line 225
    .local v6, "c":Ljava/util/Collection;
    nop

    .line 226
    :goto_0
    nop

    .line 229
    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 230
    .local v8, "activityClientRecord":Ljava/lang/Object;
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    .line 231
    .local v9, "activityClientRecordClass":Ljava/lang/Class;
    if-eqz p1, :cond_2

    .line 232
    const-string v10, "paused"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 233
    .local v10, "pausedField":Ljava/lang/reflect/Field;
    invoke-virtual {v10, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 234
    invoke-virtual {v10, v8}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 235
    goto :goto_1

    .line 238
    .end local v10    # "pausedField":Ljava/lang/reflect/Field;
    :cond_2
    const-string v10, "activity"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    .line 239
    .local v10, "activityField":Ljava/lang/reflect/Field;
    invoke-virtual {v10, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 240
    invoke-virtual {v10, v8}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/Activity;

    .line 241
    .local v11, "activity":Landroid/app/Activity;
    if-eqz v11, :cond_3

    .line 242
    invoke-interface {v0, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    .end local v8    # "activityClientRecord":Ljava/lang/Object;
    .end local v9    # "activityClientRecordClass":Ljava/lang/Class;
    .end local v10    # "activityField":Ljava/lang/reflect/Field;
    .end local v11    # "activity":Landroid/app/Activity;
    :cond_3
    goto :goto_1

    .line 249
    .end local v1    # "activityThreadClass":Ljava/lang/Class;
    .end local v2    # "activityThread":Ljava/lang/Object;
    .end local v3    # "activitiesField":Ljava/lang/reflect/Field;
    .end local v5    # "collection":Ljava/lang/Object;
    .end local v6    # "c":Ljava/util/Collection;
    :cond_4
    goto :goto_2

    .line 226
    .restart local v1    # "activityThreadClass":Ljava/lang/Class;
    .restart local v2    # "activityThread":Ljava/lang/Object;
    .restart local v3    # "activitiesField":Ljava/lang/reflect/Field;
    .restart local v5    # "collection":Ljava/lang/Object;
    :cond_5
    return-object v0

    .line 245
    .end local v1    # "activityThreadClass":Ljava/lang/Class;
    .end local v2    # "activityThread":Ljava/lang/Object;
    .end local v3    # "activitiesField":Ljava/lang/reflect/Field;
    .end local v5    # "collection":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 246
    .local v1, "e":Ljava/lang/Throwable;
    const-string v2, "InstantRun"

    const/4 v3, 0x5

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 247
    const-string v2, "InstantRun"

    const-string v3, "Error retrieving activities"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 250
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_6
    :goto_2
    return-object v0
.end method

.method public static getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 195
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/android/tools/ir/server/Restarter;->getActivities(Landroid/content/Context;Z)Ljava/util/List;

    move-result-object v0

    .line 196
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Landroid/app/Activity;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    :goto_0
    return-object v1
.end method

.method private static getPackageName(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/String;
    .locals 3
    .param p0, "activityThreadClass"    # Ljava/lang/Class;
    .param p1, "activityThread"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 289
    const-string v0, "currentPackageName"

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    .line 290
    invoke-virtual {p0, v0, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 291
    .local v0, "currentPackageNameMethod":Ljava/lang/reflect/Method;
    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    return-object v1
.end method

.method private static hasAppCrashed(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/Object;)Z
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "activityThreadClass"    # Ljava/lang/Class;
    .param p2, "activityThread"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 262
    const/4 v0, 0x0

    if-eqz p0, :cond_4

    if-nez p2, :cond_0

    goto :goto_1

    .line 266
    :cond_0
    invoke-static {p1, p2}, Lcom/android/tools/ir/server/Restarter;->getPackageName(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 268
    .local v1, "currentPackageName":Ljava/lang/String;
    const-string v2, "activity"

    .line 269
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/ActivityManager;

    .line 270
    .local v2, "manager":Landroid/app/ActivityManager;
    nop

    .line 271
    invoke-virtual {v2}, Landroid/app/ActivityManager;->getProcessesInErrorState()Ljava/util/List;

    move-result-object v3

    .line 272
    .local v3, "processesInErrorState":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$ProcessErrorStateInfo;>;"
    if-eqz v3, :cond_3

    .line 273
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/ActivityManager$ProcessErrorStateInfo;

    .line 274
    .local v5, "info":Landroid/app/ActivityManager$ProcessErrorStateInfo;
    iget-object v6, v5, Landroid/app/ActivityManager$ProcessErrorStateInfo;->processName:Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    iget v6, v5, Landroid/app/ActivityManager$ProcessErrorStateInfo;->condition:I

    if-eqz v6, :cond_2

    .line 275
    const-string v0, "InstantRun"

    const/4 v4, 0x2

    invoke-static {v0, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 276
    const-string v0, "InstantRun"

    const-string v4, "App Thread has crashed, return empty activity list."

    invoke-static {v0, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 278
    :cond_1
    const/4 v0, 0x1

    return v0

    .line 280
    .end local v5    # "info":Landroid/app/ActivityManager$ProcessErrorStateInfo;
    :cond_2
    goto :goto_0

    .line 282
    :cond_3
    return v0

    .line 263
    .end local v1    # "currentPackageName":Ljava/lang/String;
    .end local v2    # "manager":Landroid/app/ActivityManager;
    .end local v3    # "processesInErrorState":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$ProcessErrorStateInfo;>;"
    :cond_4
    :goto_1
    return v0
.end method

.method private static restartActivity(Landroid/app/Activity;)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;

    .line 76
    const-string v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    const-string v0, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "About to restart "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    :cond_0
    :goto_0
    invoke-virtual {p0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 82
    const-string v0, "InstantRun"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 83
    const-string v0, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " is not a top level activity; restarting "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    invoke-virtual {p0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " instead"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 83
    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object p0

    goto :goto_0

    .line 94
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    .line 95
    return-void
.end method

.method public static restartActivityOnUiThread(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .line 63
    new-instance v0, Lcom/android/tools/ir/server/Restarter$1;

    invoke-direct {v0, p0}, Lcom/android/tools/ir/server/Restarter$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 73
    return-void
.end method

.method public static restartApp(Landroid/content/Context;Ljava/util/Collection;Z)V
    .locals 14
    .param p0, "appContext"    # Landroid/content/Context;
    .param p2, "toast"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Collection<",
            "Landroid/app/Activity;",
            ">;Z)V"
        }
    .end annotation

    .line 113
    .local p1, "knownActivities":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/app/Activity;>;"
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 115
    invoke-static {p0}, Lcom/android/tools/ir/server/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 117
    .local v0, "foreground":Landroid/app/Activity;
    const/4 v1, 0x2

    if-eqz v0, :cond_3

    .line 120
    if-eqz p2, :cond_0

    .line 121
    const-string v2, "Restarting app to apply incompatible changes"

    invoke-static {v0, v2}, Lcom/android/tools/ir/server/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 123
    :cond_0
    const-string v2, "InstantRun"

    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 124
    const-string v2, "InstantRun"

    const-string v3, "RESTARTING APP"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    :cond_1
    move-object v2, v0

    .line 128
    .local v2, "context":Landroid/content/Context;
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 129
    .local v3, "intent":Landroid/content/Intent;
    const/4 v4, 0x0

    .line 130
    .local v4, "intentId":I
    const/high16 v5, 0x10000000

    invoke-static {v2, v4, v3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 132
    .local v5, "pendingIntent":Landroid/app/PendingIntent;
    const-string v6, "alarm"

    invoke-virtual {v2, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/AlarmManager;

    .line 133
    .local v6, "mgr":Landroid/app/AlarmManager;
    const/4 v7, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x64

    add-long v12, v8, v10

    invoke-virtual {v6, v7, v12, v13, v5}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 134
    const-string v7, "InstantRun"

    invoke-static {v7, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 135
    const-string v1, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Scheduling activity "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v8, " to start after exiting process"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .end local v2    # "context":Landroid/content/Context;
    .end local v3    # "intent":Landroid/content/Intent;
    .end local v4    # "intentId":I
    .end local v5    # "pendingIntent":Landroid/app/PendingIntent;
    .end local v6    # "mgr":Landroid/app/AlarmManager;
    :cond_2
    goto :goto_0

    .line 142
    :cond_3
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    const-string v3, "Unable to restart app"

    invoke-static {v2, v3}, Lcom/android/tools/ir/server/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 143
    const-string v2, "InstantRun"

    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 144
    const-string v1, "InstantRun"

    const-string v2, "Couldn\'t find any foreground activities to restart for resource refresh"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    :cond_4
    :goto_0
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 152
    .end local v0    # "foreground":Landroid/app/Activity;
    :cond_5
    return-void
.end method

.method static showToast(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/String;

    .line 155
    const-string v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    const-string v0, "InstantRun"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "About to show toast for activity "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    :cond_0
    new-instance v0, Lcom/android/tools/ir/server/Restarter$2;

    invoke-direct {v0, p0, p1}, Lcom/android/tools/ir/server/Restarter$2;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 191
    return-void
.end method

.method private static updateActivity(Landroid/app/Activity;)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;

    .line 333
    invoke-static {p0}, Lcom/android/tools/ir/server/Restarter;->restartActivity(Landroid/app/Activity;)V

    .line 334
    return-void
.end method
