.class public final Lcom/android/tools/ir/server/InstantRunContentProvider;
.super Landroid/content/ContentProvider;
.source "InstantRunContentProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method private isMainProcess()Z
    .locals 8

    .line 66
    const/4 v0, 0x0

    .line 67
    .local v0, "isMainProcess":Z
    sget-object v1, Lcom/android/tools/ir/server/AppInfo;->applicationId:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 68
    const/4 v1, 0x0

    .line 69
    .local v1, "foundPackage":Z
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v2

    .line 70
    .local v2, "pid":I
    invoke-virtual {p0}, Lcom/android/tools/ir/server/InstantRunContentProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "activity"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager;

    .line 72
    .local v3, "manager":Landroid/app/ActivityManager;
    invoke-virtual {v3}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 73
    .local v5, "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    sget-object v6, Lcom/android/tools/ir/server/AppInfo;->applicationId:Ljava/lang/String;

    iget-object v7, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 74
    const/4 v1, 0x1

    .line 75
    iget v6, v5, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I

    if-ne v6, v2, :cond_0

    .line 76
    const/4 v0, 0x1

    .line 77
    goto :goto_1

    .line 80
    .end local v5    # "processInfo":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_0
    goto :goto_0

    .line 81
    :cond_1
    :goto_1
    if-nez v0, :cond_2

    if-nez v1, :cond_2

    .line 85
    const/4 v0, 0x1

    .line 86
    const-string v4, "InstantRun"

    const-string v5, "considering this process main process:no process with this package found?!"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .end local v1    # "foundPackage":Z
    .end local v2    # "pid":I
    .end local v3    # "manager":Landroid/app/ActivityManager;
    :cond_2
    return v0
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .line 97
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "not a real content provider"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .line 102
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "not a real content provider"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .line 107
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "not a real content provider"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreate()Z
    .locals 2

    .line 47
    invoke-direct {p0}, Lcom/android/tools/ir/server/InstantRunContentProvider;->isMainProcess()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    const-string v0, "InstantRun"

    const-string v1, "starting instant run server: is main process"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    invoke-virtual {p0}, Lcom/android/tools/ir/server/InstantRunContentProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/tools/ir/server/Server;->create(Landroid/content/Context;)Lcom/android/tools/ir/server/Server;

    goto :goto_0

    .line 51
    :cond_0
    const-string v0, "InstantRun"

    const-string v1, "not starting instant run server: not main process"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .line 113
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "not a real content provider"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .line 118
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "not a real content provider"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
