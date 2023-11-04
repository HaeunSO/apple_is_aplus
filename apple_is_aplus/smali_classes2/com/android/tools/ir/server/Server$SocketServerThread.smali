.class Lcom/android/tools/ir/server/Server$SocketServerThread;
.super Ljava/lang/Thread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/tools/ir/server/Server;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SocketServerThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/tools/ir/server/Server;


# direct methods
.method private constructor <init>(Lcom/android/tools/ir/server/Server;)V
    .locals 0

    .line 134
    iput-object p1, p0, Lcom/android/tools/ir/server/Server$SocketServerThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/tools/ir/server/Server;Lcom/android/tools/ir/server/Server$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/tools/ir/server/Server;
    .param p2, "x1"    # Lcom/android/tools/ir/server/Server$1;

    .line 134
    invoke-direct {p0, p1}, Lcom/android/tools/ir/server/Server$SocketServerThread;-><init>(Lcom/android/tools/ir/server/Server;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 161
    :goto_0
    const/4 v0, 0x2

    :try_start_0
    iget-object v1, p0, Lcom/android/tools/ir/server/Server$SocketServerThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-static {v1}, Lcom/android/tools/ir/server/Server;->access$100(Lcom/android/tools/ir/server/Server;)Landroid/net/LocalServerSocket;

    move-result-object v1

    .line 162
    .local v1, "serverSocket":Landroid/net/LocalServerSocket;
    if-nez v1, :cond_0

    .line 163
    goto :goto_1

    .line 165
    :cond_0
    invoke-virtual {v1}, Landroid/net/LocalServerSocket;->accept()Landroid/net/LocalSocket;

    move-result-object v2

    .line 167
    .local v2, "socket":Landroid/net/LocalSocket;
    const-string v3, "InstantRun"

    invoke-static {v3, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 168
    const-string v3, "InstantRun"

    const-string v4, "Received connection from IDE: spawning connection thread"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    :cond_1
    new-instance v3, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;

    iget-object v4, p0, Lcom/android/tools/ir/server/Server$SocketServerThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-direct {v3, v4, v2}, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;-><init>(Lcom/android/tools/ir/server/Server;Landroid/net/LocalSocket;)V

    .line 175
    .local v3, "socketServerReplyThread":Lcom/android/tools/ir/server/Server$SocketServerReplyThread;
    invoke-virtual {v3}, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->run()V

    .line 177
    invoke-static {}, Lcom/android/tools/ir/server/Server;->access$200()I

    move-result v4

    const/16 v5, 0x32

    if-le v4, v5, :cond_3

    .line 178
    const-string v4, "InstantRun"

    invoke-static {v4, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 179
    const-string v4, "InstantRun"

    const-string v5, "Stopping server: too many wrong token connections"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    :cond_2
    iget-object v4, p0, Lcom/android/tools/ir/server/Server$SocketServerThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-static {v4}, Lcom/android/tools/ir/server/Server;->access$100(Lcom/android/tools/ir/server/Server;)Landroid/net/LocalServerSocket;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/LocalServerSocket;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    nop

    .line 195
    .end local v1    # "serverSocket":Landroid/net/LocalServerSocket;
    .end local v2    # "socket":Landroid/net/LocalSocket;
    .end local v3    # "socketServerReplyThread":Lcom/android/tools/ir/server/Server$SocketServerReplyThread;
    :goto_1
    return-void

    .line 186
    :catch_0
    move-exception v1

    .line 187
    .local v1, "e":Ljava/lang/Throwable;
    const-string v2, "InstantRun"

    invoke-static {v2, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 188
    const-string v0, "InstantRun"

    const-string v2, "Fatal error accepting connection on local socket"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 193
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_3
    goto :goto_0
.end method
