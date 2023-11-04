.class public Lcom/android/tools/ir/runtime/PatchesLoaderDumper;
.super Ljava/lang/Object;
.source "PatchesLoaderDumper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 2
    .param p0, "args"    # [Ljava/lang/String;

    .line 23
    :try_start_0
    const-string v0, "com.android.tools.ir.runtime.AppPatchesLoaderImpl"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 24
    .local v0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/tools/ir/runtime/PatchesLoader;

    .line 25
    .local v1, "patchesLoader":Lcom/android/tools/ir/runtime/PatchesLoader;
    invoke-interface {v1}, Lcom/android/tools/ir/runtime/PatchesLoader;->load()Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .end local v0    # "aClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "patchesLoader":Lcom/android/tools/ir/runtime/PatchesLoader;
    goto :goto_0

    .line 30
    :catch_0
    move-exception v0

    .line 31
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    .line 31
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    goto :goto_1

    .line 28
    :catch_1
    move-exception v0

    .line 29
    .local v0, "e":Ljava/lang/InstantiationException;
    invoke-virtual {v0}, Ljava/lang/InstantiationException;->printStackTrace()V

    .line 29
    .end local v0    # "e":Ljava/lang/InstantiationException;
    goto :goto_0

    .line 26
    :catch_2
    move-exception v0

    .line 27
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    .line 32
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :goto_0
    nop

    .line 33
    :goto_1
    return-void
.end method
