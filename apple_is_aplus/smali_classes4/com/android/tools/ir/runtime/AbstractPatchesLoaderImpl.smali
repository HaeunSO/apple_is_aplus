.class public abstract Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;
.super Ljava/lang/Object;
.source "AbstractPatchesLoaderImpl.java"

# interfaces
.implements Lcom/android/tools/ir/runtime/PatchesLoader;


# instance fields
.field private final get:Ljava/lang/reflect/Method;

.field private final set:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const-class v0, Ljava/util/concurrent/atomic/AtomicReference;

    const-string v1, "get"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->get:Ljava/lang/reflect/Method;

    .line 35
    const-class v0, Ljava/util/concurrent/atomic/AtomicReference;

    const-string v1, "set"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Ljava/lang/Object;

    aput-object v4, v3, v2

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->set:Ljava/lang/reflect/Method;

    .line 36
    return-void
.end method

.method private patchClass(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "changeField"    # Ljava/lang/reflect/Field;
    .param p2, "patch"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 110
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 111
    .local v1, "previous":Ljava/lang/Object;
    invoke-virtual {p1, v0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 112
    return-object v1
.end method

.method private patchInterface(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "changeField"    # Ljava/lang/reflect/Field;
    .param p2, "patch"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 95
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 96
    .local v0, "atomicReference":Ljava/lang/Object;
    iget-object v1, p0, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->get:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 97
    .local v1, "previous":Ljava/lang/Object;
    iget-object v3, p0, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->set:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p2, v4, v2

    invoke-virtual {v3, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    return-object v1
.end method


# virtual methods
.method public abstract getPatchedClasses()[Ljava/lang/String;
.end method

.method public load()Z
    .locals 18

    .line 42
    move-object/from16 v1, p0

    invoke-virtual/range {p0 .. p0}, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->getPatchedClasses()[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v5, 0x0

    :goto_0
    const/4 v6, 0x1

    if-ge v5, v3, :cond_4

    aget-object v7, v2, v5

    .line 44
    .local v7, "className":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    .line 45
    .local v8, "cl":Ljava/lang/ClassLoader;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "$override"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    .line 46
    .local v9, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v9}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v10

    .line 48
    .local v10, "o":Ljava/lang/Object;
    invoke-virtual {v8, v7}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    .line 49
    .local v11, "originalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v12, "$change"

    invoke-virtual {v11, v12}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v12

    .line 52
    .local v12, "changeField":Ljava/lang/reflect/Field;
    invoke-virtual {v12, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 54
    nop

    .line 55
    invoke-virtual {v11}, Ljava/lang/Class;->isInterface()Z

    move-result v13

    if-eqz v13, :cond_0

    .line 56
    invoke-direct {v1, v12, v10}, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->patchInterface(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    goto :goto_1

    .line 57
    :cond_0
    invoke-direct {v1, v12, v10}, Lcom/android/tools/ir/runtime/AbstractPatchesLoaderImpl;->patchClass(Ljava/lang/reflect/Field;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 60
    .local v13, "previous":Ljava/lang/Object;
    :goto_1
    if-eqz v13, :cond_1

    .line 61
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v14

    const-string v15, "$obsolete"

    invoke-virtual {v14, v15}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v14

    .line 62
    .local v14, "isObsolete":Ljava/lang/reflect/Field;
    if-eqz v14, :cond_1

    .line 63
    const/4 v15, 0x0

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v14, v15, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 67
    .end local v14    # "isObsolete":Ljava/lang/reflect/Field;
    :cond_1
    sget-object v4, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v4, :cond_2

    sget-object v4, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v14, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v4, v14}, Lcom/android/tools/ir/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 68
    sget-object v4, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v14, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    const-string v15, "patched %s"

    new-array v1, v6, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v7, v1, v16

    invoke-static {v15, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v4, v14, v1}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .end local v8    # "cl":Ljava/lang/ClassLoader;
    .end local v9    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v10    # "o":Ljava/lang/Object;
    .end local v11    # "originalClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v12    # "changeField":Ljava/lang/reflect/Field;
    .end local v13    # "previous":Ljava/lang/Object;
    :cond_2
    nop

    .line 42
    .end local v7    # "className":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v1, p0

    goto :goto_0

    .line 70
    .restart local v7    # "className":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-object v1, v0

    .line 71
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v2, :cond_3

    .line 72
    sget-object v2, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v3, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v4, "Exception while patching %s"

    new-array v5, v6, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v7, v5, v6

    .line 74
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 72
    invoke-interface {v2, v3, v4, v1}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 77
    :cond_3
    const/4 v6, 0x0

    :goto_2
    return v6

    .line 80
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v7    # "className":Ljava/lang/String;
    :cond_4
    return v6
.end method
