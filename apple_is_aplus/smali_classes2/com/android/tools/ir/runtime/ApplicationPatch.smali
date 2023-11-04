.class public Lcom/android/tools/ir/runtime/ApplicationPatch;
.super Ljava/lang/Object;
.source "ApplicationPatch.java"


# instance fields
.field public final data:[B

.field public final path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/android/tools/ir/runtime/ApplicationPatch;->path:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lcom/android/tools/ir/runtime/ApplicationPatch;->data:[B

    .line 40
    return-void
.end method

.method public static read(Ljava/io/DataInputStream;)Ljava/util/List;
    .locals 7
    .param p0, "input"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/DataInputStream;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/tools/ir/runtime/ApplicationPatch;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 53
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    .line 55
    .local v0, "changeCount":I
    sget-object v1, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    invoke-interface {v1, v2}, Lcom/android/tools/ir/common/Log$Logging;->isLoggable(Ljava/util/logging/Level;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 56
    sget-object v1, Lcom/android/tools/ir/common/Log;->logging:Lcom/android/tools/ir/common/Log$Logging;

    sget-object v2, Ljava/util/logging/Level;->FINE:Ljava/util/logging/Level;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Receiving "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " changes"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/android/tools/ir/common/Log$Logging;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 59
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 60
    .local v1, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/ir/runtime/ApplicationPatch;>;"
    const/4 v2, 0x0

    .line 60
    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 61
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, "path":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 63
    .local v4, "size":I
    new-array v5, v4, [B

    .line 64
    .local v5, "bytes":[B
    invoke-virtual {p0, v5}, Ljava/io/DataInputStream;->readFully([B)V

    .line 65
    new-instance v6, Lcom/android/tools/ir/runtime/ApplicationPatch;

    invoke-direct {v6, v3, v5}, Lcom/android/tools/ir/runtime/ApplicationPatch;-><init>(Ljava/lang/String;[B)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .end local v3    # "path":Ljava/lang/String;
    .end local v4    # "size":I
    .end local v5    # "bytes":[B
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 68
    .end local v2    # "i":I
    :cond_1
    return-object v1
.end method


# virtual methods
.method public getBytes()[B
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/android/tools/ir/runtime/ApplicationPatch;->data:[B

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/android/tools/ir/runtime/ApplicationPatch;->path:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ApplicationPatch{path=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/tools/ir/runtime/ApplicationPatch;->path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", data.length=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/tools/ir/runtime/ApplicationPatch;->data:[B

    array-length v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
