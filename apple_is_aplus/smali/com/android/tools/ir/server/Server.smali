.class public Lcom/android/tools/ir/server/Server;
.super Ljava/lang/Object;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/tools/ir/server/Server$SocketServerReplyThread;,
        Lcom/android/tools/ir/server/Server$SocketServerThread;
    }
.end annotation


# static fields
.field private static final POST_ALIVE_STATUS:Z = false

.field private static final RESTART_LOCALLY:Z = false

.field private static wrongTokenCount:I


# instance fields
.field private final context:Landroid/content/Context;

.field private serverSocket:Landroid/net/LocalServerSocket;


# direct methods
.method private constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 4
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p2, p0, Lcom/android/tools/ir/server/Server;->context:Landroid/content/Context;

    .line 91
    :try_start_0
    new-instance v0, Landroid/net/LocalServerSocket;

    invoke-direct {v0, p1}, Landroid/net/LocalServerSocket;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/tools/ir/server/Server;->serverSocket:Landroid/net/LocalServerSocket;

    .line 92
    const-string v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    const-string v0, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Starting server socket listening for package "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/tools/ir/server/Server;->serverSocket:Landroid/net/LocalServerSocket;

    .line 98
    invoke-virtual {v3}, Landroid/net/LocalServerSocket;->getLocalSocketAddress()Landroid/net/LocalSocketAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 93
    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    :cond_0
    nop

    .line 104
    invoke-direct {p0}, Lcom/android/tools/ir/server/Server;->startServer()V

    .line 106
    const-string v0, "InstantRun"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 107
    const-string v0, "InstantRun"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Started server for package "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    :cond_1
    return-void

    .line 100
    :catch_0
    move-exception v0

    .line 101
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IO Error creating local socket at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 102
    return-void
.end method

.method static synthetic access$100(Lcom/android/tools/ir/server/Server;)Landroid/net/LocalServerSocket;
    .locals 1
    .param p0, "x0"    # Lcom/android/tools/ir/server/Server;

    .line 58
    iget-object v0, p0, Lcom/android/tools/ir/server/Server;->serverSocket:Landroid/net/LocalServerSocket;

    return-object v0
.end method

.method static synthetic access$200()I
    .locals 1

    .line 58
    sget v0, Lcom/android/tools/ir/server/Server;->wrongTokenCount:I

    return v0
.end method

.method static synthetic access$208()I
    .locals 2

    .line 58
    sget v0, Lcom/android/tools/ir/server/Server;->wrongTokenCount:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/android/tools/ir/server/Server;->wrongTokenCount:I

    return v0
.end method

.method static synthetic access$300(Lcom/android/tools/ir/server/Server;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/android/tools/ir/server/Server;

    .line 58
    iget-object v0, p0, Lcom/android/tools/ir/server/Server;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$400(Ljava/util/List;)Z
    .locals 1
    .param p0, "x0"    # Ljava/util/List;

    .line 58
    invoke-static {p0}, Lcom/android/tools/ir/server/Server;->hasResources(Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/android/tools/ir/server/Server;Ljava/util/List;ZI)I
    .locals 1
    .param p0, "x0"    # Lcom/android/tools/ir/server/Server;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z
    .param p3, "x3"    # I

    .line 58
    invoke-direct {p0, p1, p2, p3}, Lcom/android/tools/ir/server/Server;->handlePatches(Ljava/util/List;ZI)I

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/android/tools/ir/server/Server;IZZ)V
    .locals 0
    .param p0, "x0"    # Lcom/android/tools/ir/server/Server;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z
    .param p3, "x3"    # Z

    .line 58
    invoke-direct {p0, p1, p2, p3}, Lcom/android/tools/ir/server/Server;->restart(IZZ)V

    return-void
.end method

.method public static create(Landroid/content/Context;)Lcom/android/tools/ir/server/Server;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 85
    new-instance v0, Lcom/android/tools/ir/server/Server;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/android/tools/ir/server/Server;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    return-object v0
.end method

.method private handleHotSwapPatch(ILcom/android/tools/ir/runtime/ApplicationPatch;)I
    .locals 12
    .param p1, "updateMode"    # I
    .param p2, "patch"    # Lcom/android/tools/ir/runtime/ApplicationPatch;

    .line 478
    const-string v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 479
    const-string v0, "InstantRun"

    const-string v2, "Received incremental code patch"

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 482
    :cond_0
    :try_start_0
    invoke-virtual {p2}, Lcom/android/tools/ir/runtime/ApplicationPatch;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/tools/ir/server/FileManager;->writeTempDexFile([B)Ljava/lang/String;

    move-result-object v0

    .line 483
    .local v0, "dexFile":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 484
    const-string v1, "InstantRun"

    const-string v2, "No file to write the code to"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 485
    return p1

    .line 486
    :cond_1
    const-string v2, "InstantRun"

    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 487
    const-string v2, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Reading live code from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    :cond_2
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->getNativeLibraryFolder()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 490
    .local v2, "nativeLibraryPath":Ljava/lang/String;
    new-instance v3, Ldalvik/system/DexClassLoader;

    iget-object v4, p0, Lcom/android/tools/ir/server/Server;->context:Landroid/content/Context;

    .line 491
    invoke-virtual {v4}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 492
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-direct {v3, v0, v4, v2, v5}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 495
    .local v3, "dexClassLoader":Ldalvik/system/DexClassLoader;
    const-string v4, "com.android.tools.ir.runtime.AppPatchesLoaderImpl"

    const/4 v5, 0x1

    invoke-static {v4, v5, v3}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 498
    .local v4, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_1
    const-string v5, "InstantRun"

    invoke-static {v5, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 499
    const-string v5, "InstantRun"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Got the patcher class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 502
    :cond_3
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/tools/ir/runtime/PatchesLoader;

    .line 503
    .local v5, "loader":Lcom/android/tools/ir/runtime/PatchesLoader;
    const-string v6, "InstantRun"

    invoke-static {v6, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 504
    const-string v6, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Got the patcher instance "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    :cond_4
    const-string v6, "getPatchedClasses"

    const/4 v7, 0x0

    new-array v8, v7, [Ljava/lang/Class;

    .line 507
    invoke-virtual {v4, v6, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    new-array v8, v7, [Ljava/lang/Object;

    invoke-virtual {v6, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    .line 508
    .local v6, "getPatchedClasses":[Ljava/lang/String;
    const-string v8, "InstantRun"

    invoke-static {v8, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 509
    const-string v1, "InstantRun"

    const-string v8, "Got the list of classes "

    invoke-static {v1, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    array-length v1, v6

    :goto_0
    if-ge v7, v1, :cond_5

    aget-object v8, v6, v7

    .line 511
    .local v8, "getPatchedClass":Ljava/lang/String;
    const-string v9, "InstantRun"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    .end local v8    # "getPatchedClass":Ljava/lang/String;
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 514
    :cond_5
    invoke-interface {v5}, Lcom/android/tools/ir/runtime/PatchesLoader;->load()Z

    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    if-nez v1, :cond_6

    .line 515
    const/4 p1, 0x3

    .line 521
    .end local v5    # "loader":Lcom/android/tools/ir/runtime/PatchesLoader;
    .end local v6    # "getPatchedClasses":[Ljava/lang/String;
    :cond_6
    goto :goto_1

    .line 517
    :catch_0
    move-exception v1

    .line 518
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    const-string v5, "InstantRun"

    const-string v6, "Couldn\'t apply code changes"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 519
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 520
    const/4 p1, 0x3

    .line 525
    .end local v0    # "dexFile":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "nativeLibraryPath":Ljava/lang/String;
    .end local v3    # "dexClassLoader":Ldalvik/system/DexClassLoader;
    .end local v4    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    goto :goto_2

    .line 522
    :catch_1
    move-exception v0

    .line 523
    .local v0, "e":Ljava/lang/Throwable;
    const-string v1, "InstantRun"

    const-string v2, "Couldn\'t apply code changes"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 524
    const/4 p1, 0x3

    .line 526
    .end local v0    # "e":Ljava/lang/Throwable;
    :goto_2
    return p1
.end method

.method private handlePatches(Ljava/util/List;ZI)I
    .locals 4
    .param p2, "hasResources"    # Z
    .param p3, "updateMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/tools/ir/runtime/ApplicationPatch;",
            ">;ZI)I"
        }
    .end annotation

    .line 446
    .local p1, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/ir/runtime/ApplicationPatch;>;"
    if-eqz p2, :cond_0

    .line 447
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->startUpdate()V

    .line 450
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/tools/ir/runtime/ApplicationPatch;

    .line 451
    .local v1, "change":Lcom/android/tools/ir/runtime/ApplicationPatch;
    invoke-virtual {v1}, Lcom/android/tools/ir/runtime/ApplicationPatch;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 452
    .local v2, "path":Ljava/lang/String;
    const-string v3, "classes.dex.3"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 453
    invoke-direct {p0, p3, v1}, Lcom/android/tools/ir/server/Server;->handleHotSwapPatch(ILcom/android/tools/ir/runtime/ApplicationPatch;)I

    move-result p3

    goto :goto_1

    .line 454
    :cond_1
    invoke-static {v2}, Lcom/android/tools/ir/server/Server;->isResourcePath(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 455
    invoke-static {p3, v1, v2}, Lcom/android/tools/ir/server/Server;->handleResourcePatch(ILcom/android/tools/ir/runtime/ApplicationPatch;Ljava/lang/String;)I

    move-result p3

    .line 457
    .end local v1    # "change":Lcom/android/tools/ir/runtime/ApplicationPatch;
    .end local v2    # "path":Ljava/lang/String;
    :cond_2
    :goto_1
    goto :goto_0

    .line 459
    :cond_3
    if-eqz p2, :cond_4

    .line 460
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/tools/ir/server/FileManager;->finishUpdate(Z)V

    .line 463
    :cond_4
    return p3
.end method

.method private static handleResourcePatch(ILcom/android/tools/ir/runtime/ApplicationPatch;Ljava/lang/String;)I
    .locals 4
    .param p0, "updateMode"    # I
    .param p1, "patch"    # Lcom/android/tools/ir/runtime/ApplicationPatch;
    .param p2, "path"    # Ljava/lang/String;

    .line 468
    const-string v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 469
    const-string v0, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Received resource changes ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    :cond_0
    invoke-virtual {p1}, Lcom/android/tools/ir/runtime/ApplicationPatch;->getBytes()[B

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/tools/ir/server/FileManager;->writeAaptResources(Ljava/lang/String;[B)V

    .line 473
    invoke-static {p0, v1}, Ljava/lang/Math;->max(II)I

    move-result p0

    .line 474
    return p0
.end method

.method private static hasResources(Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/tools/ir/runtime/ApplicationPatch;",
            ">;)Z"
        }
    .end annotation

    .line 434
    .local p0, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/ir/runtime/ApplicationPatch;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/tools/ir/runtime/ApplicationPatch;

    .line 435
    .local v1, "change":Lcom/android/tools/ir/runtime/ApplicationPatch;
    invoke-virtual {v1}, Lcom/android/tools/ir/runtime/ApplicationPatch;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 436
    .local v2, "path":Ljava/lang/String;
    invoke-static {v2}, Lcom/android/tools/ir/server/Server;->isResourcePath(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 437
    const/4 v0, 0x1

    return v0

    .line 440
    .end local v1    # "change":Lcom/android/tools/ir/runtime/ApplicationPatch;
    .end local v2    # "path":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 441
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private static isResourcePath(Ljava/lang/String;)Z
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .line 428
    const-string v0, "resources.ap_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "res/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private restart(IZZ)V
    .locals 10
    .param p1, "updateMode"    # I
    .param p2, "incrementalResources"    # Z
    .param p3, "toast"    # Z

    .line 530
    const-string v0, "InstantRun"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 531
    const-string v0, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Finished loading changes; update mode ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 534
    :cond_0
    if-eqz p1, :cond_10

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    goto/16 :goto_2

    .line 551
    :cond_1
    iget-object v2, p0, Lcom/android/tools/ir/server/Server;->context:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/android/tools/ir/server/Restarter;->getActivities(Landroid/content/Context;Z)Ljava/util/List;

    move-result-object v2

    .line 553
    .local v2, "activities":Ljava/util/List;, "Ljava/util/List<Landroid/app/Activity;>;"
    if-eqz p2, :cond_4

    if-ne p1, v1, :cond_4

    .line 555
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->getExternalResourceFile()Ljava/io/File;

    move-result-object v4

    .line 557
    .local v4, "file":Ljava/io/File;
    const-string v5, "InstantRun"

    invoke-static {v5, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 558
    const-string v5, "InstantRun"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "About to update resource file="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, ", activities="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    :cond_2
    if-eqz v4, :cond_3

    .line 564
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 565
    .local v5, "resources":Ljava/lang/String;
    iget-object v6, p0, Lcom/android/tools/ir/server/Server;->context:Landroid/content/Context;

    invoke-static {v6, v5, v2}, Lcom/android/tools/ir/server/MonkeyPatcher;->monkeyPatchExistingResources(Landroid/content/Context;Ljava/lang/String;Ljava/util/Collection;)V

    .line 566
    .end local v5    # "resources":Ljava/lang/String;
    goto :goto_0

    .line 567
    :cond_3
    const-string v5, "InstantRun"

    const-string v6, "No resource file found to apply"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 568
    const/4 p1, 0x3

    .line 572
    .end local v4    # "file":Ljava/io/File;
    :cond_4
    :goto_0
    iget-object v4, p0, Lcom/android/tools/ir/server/Server;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/android/tools/ir/server/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    .line 573
    .local v4, "activity":Landroid/app/Activity;
    if-ne p1, v1, :cond_c

    .line 574
    if-eqz v4, :cond_a

    .line 575
    const-string v5, "InstantRun"

    invoke-static {v5, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 576
    const-string v5, "InstantRun"

    const-string v6, "Restarting activity only!"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    :cond_5
    move v5, v3

    .line 584
    .local v5, "handledRestart":Z
    :try_start_0
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "onHandleCodeChange"

    new-array v8, v0, [Ljava/lang/Class;

    sget-object v9, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v9, v8, v3

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 585
    .local v6, "method":Ljava/lang/reflect/Method;
    new-array v0, v0, [Ljava/lang/Object;

    const-wide/16 v7, 0x0

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v0, v3

    invoke-virtual {v6, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 586
    .local v0, "result":Ljava/lang/Object;
    const-string v3, "InstantRun"

    invoke-static {v3, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 587
    const-string v1, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Activity "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, " provided manual restart method; return "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 594
    :cond_6
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 595
    const/4 v5, 0x1

    .line 596
    if-eqz p3, :cond_7

    .line 597
    const-string v1, "Applied changes"

    invoke-static {v4, v1}, Lcom/android/tools/ir/server/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 601
    .end local v0    # "result":Ljava/lang/Object;
    .end local v6    # "method":Ljava/lang/reflect/Method;
    :cond_7
    goto :goto_1

    .line 600
    :catch_0
    move-exception v0

    .line 603
    :goto_1
    if-nez v5, :cond_9

    .line 604
    if-eqz p3, :cond_8

    .line 605
    const-string v0, "Applied changes, restarted activity"

    invoke-static {v4, v0}, Lcom/android/tools/ir/server/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 607
    :cond_8
    invoke-static {v4}, Lcom/android/tools/ir/server/Restarter;->restartActivityOnUiThread(Landroid/app/Activity;)V

    .line 609
    :cond_9
    return-void

    .line 612
    .end local v5    # "handledRestart":Z
    :cond_a
    const-string v0, "InstantRun"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 613
    const-string v0, "InstantRun"

    const-string v3, "No activity found, falling through to do a full app restart"

    invoke-static {v0, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    :cond_b
    const/4 p1, 0x3

    .line 620
    :cond_c
    const/4 v0, 0x3

    if-eq p1, v0, :cond_e

    .line 621
    const-string v0, "InstantRun"

    const/4 v1, 0x6

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 622
    const-string v0, "InstantRun"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected update mode: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 624
    :cond_d
    return-void

    .line 634
    :cond_e
    const-string v0, "InstantRun"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 635
    const-string v0, "InstantRun"

    const-string v1, "Waiting for app to be killed and restarted by the IDE..."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 638
    :cond_f
    return-void

    .line 535
    .end local v2    # "activities":Ljava/util/List;, "Ljava/util/List<Landroid/app/Activity;>;"
    .end local v4    # "activity":Landroid/app/Activity;
    :cond_10
    :goto_2
    const-string v0, "InstantRun"

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 536
    const-string v0, "InstantRun"

    const-string v2, "Applying incremental code without restart"

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 539
    :cond_11
    if-eqz p3, :cond_13

    .line 540
    iget-object v0, p0, Lcom/android/tools/ir/server/Server;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/tools/ir/server/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 541
    .local v0, "foreground":Landroid/app/Activity;
    if-eqz v0, :cond_12

    .line 542
    const-string v1, "Applied code changes without activity restart"

    invoke-static {v0, v1}, Lcom/android/tools/ir/server/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_3

    .line 544
    :cond_12
    const-string v2, "InstantRun"

    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 545
    const-string v1, "InstantRun"

    const-string v2, "Couldn\'t show toast: no activity found"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 548
    .end local v0    # "foreground":Landroid/app/Activity;
    :cond_13
    :goto_3
    return-void
.end method

.method private startServer()V
    .locals 3

    .line 113
    :try_start_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/android/tools/ir/server/Server$SocketServerThread;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/tools/ir/server/Server$SocketServerThread;-><init>(Lcom/android/tools/ir/server/Server;Lcom/android/tools/ir/server/Server$1;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 114
    .local v0, "socketServerThread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    .end local v0    # "socketServerThread":Ljava/lang/Thread;
    goto :goto_0

    .line 115
    :catch_0
    move-exception v0

    .line 118
    .local v0, "e":Ljava/lang/Throwable;
    const-string v1, "InstantRun"

    const/4 v2, 0x6

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 119
    const-string v1, "InstantRun"

    const-string v2, "Fatal error starting Instant Run server"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 122
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method public shutdown()V
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/android/tools/ir/server/Server;->serverSocket:Landroid/net/LocalServerSocket;

    if-eqz v0, :cond_0

    .line 127
    :try_start_0
    iget-object v0, p0, Lcom/android/tools/ir/server/Server;->serverSocket:Landroid/net/LocalServerSocket;

    invoke-virtual {v0}, Landroid/net/LocalServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    goto :goto_0

    .line 128
    :catch_0
    move-exception v0

    .line 130
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/tools/ir/server/Server;->serverSocket:Landroid/net/LocalServerSocket;

    .line 132
    :cond_0
    return-void
.end method
