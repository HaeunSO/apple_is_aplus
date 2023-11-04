.class Lcom/android/tools/ir/server/Server$SocketServerReplyThread;
.super Ljava/lang/Thread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/tools/ir/server/Server;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SocketServerReplyThread"
.end annotation


# instance fields
.field private final socket:Landroid/net/LocalSocket;

.field final synthetic this$0:Lcom/android/tools/ir/server/Server;


# direct methods
.method constructor <init>(Lcom/android/tools/ir/server/Server;Landroid/net/LocalSocket;)V
    .locals 0
    .param p2, "socket"    # Landroid/net/LocalSocket;

    .line 202
    iput-object p1, p0, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 203
    iput-object p2, p0, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->socket:Landroid/net/LocalSocket;

    .line 204
    return-void
.end method

.method private authenticate(Ljava/io/DataInputStream;)Z
    .locals 6
    .param p1, "input"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 412
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    .line 413
    .local v0, "token":J
    sget-wide v2, Lcom/android/tools/ir/server/AppInfo;->token:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 414
    const-string v2, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Mismatched identity token from client; received "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, " and expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v4, Lcom/android/tools/ir/server/AppInfo;->token:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    invoke-static {}, Lcom/android/tools/ir/server/Server;->access$208()I

    .line 421
    const/4 v2, 0x0

    return v2

    .line 423
    :cond_0
    const/4 v2, 0x1

    return v2
.end method

.method private handle(Ljava/io/DataInputStream;Ljava/io/DataOutputStream;)V
    .locals 9
    .param p1, "input"    # Ljava/io/DataInputStream;
    .param p2, "output"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 231
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    .line 232
    .local v0, "magic":J
    const-wide/32 v2, 0x35107124

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 233
    const-string v2, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unrecognized header format "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    return-void

    .line 236
    :cond_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    .line 239
    .local v2, "version":I
    const/4 v3, 0x4

    invoke-virtual {p2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 241
    if-eq v2, v3, :cond_1

    .line 242
    const-string v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Mismatched protocol versions; app is using version 4 and tool is using version "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    return-void

    .line 253
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    .line 254
    .local v3, "message":I
    const/4 v4, 0x1

    const/4 v5, 0x6

    const/4 v6, 0x2

    packed-switch v3, :pswitch_data_0

    .line 399
    const-string v4, "InstantRun"

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 400
    const-string v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected message type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 257
    :pswitch_0
    const-string v4, "InstantRun"

    invoke-static {v4, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 258
    const-string v4, "InstantRun"

    const-string v5, "Received EOF from the IDE"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    :cond_2
    return-void

    .line 385
    :pswitch_1
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v4

    .line 386
    .local v4, "text":Ljava/lang/String;
    iget-object v5, p0, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-static {v5}, Lcom/android/tools/ir/server/Server;->access$300(Lcom/android/tools/ir/server/Server;)Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/android/tools/ir/server/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v5

    .line 387
    .local v5, "foreground":Landroid/app/Activity;
    if-eqz v5, :cond_3

    .line 388
    invoke-static {v5, v4}, Lcom/android/tools/ir/server/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0

    .line 389
    :cond_3
    const-string v7, "InstantRun"

    invoke-static {v7, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 390
    const-string v6, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Couldn\'t show toast (no activity) : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 346
    .end local v4    # "text":Ljava/lang/String;
    .end local v5    # "foreground":Landroid/app/Activity;
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->authenticate(Ljava/io/DataInputStream;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 347
    return-void

    .line 350
    :cond_4
    iget-object v4, p0, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-static {v4}, Lcom/android/tools/ir/server/Server;->access$300(Lcom/android/tools/ir/server/Server;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/android/tools/ir/server/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    .line 351
    .local v4, "activity":Landroid/app/Activity;
    if-eqz v4, :cond_1

    .line 352
    const-string v5, "InstantRun"

    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 353
    const-string v5, "InstantRun"

    const-string v6, "Restarting activity per user request"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    :cond_5
    invoke-static {v4}, Lcom/android/tools/ir/server/Restarter;->restartActivityOnUiThread(Landroid/app/Activity;)V

    goto/16 :goto_0

    .line 337
    .end local v4    # "activity":Landroid/app/Activity;
    :pswitch_3
    const-string v4, "InstantRun"

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 338
    const-string v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected message type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 296
    :pswitch_4
    const-string v4, "InstantRun"

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 297
    const-string v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected message type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 268
    :pswitch_5
    iget-object v5, p0, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-static {v5}, Lcom/android/tools/ir/server/Server;->access$300(Lcom/android/tools/ir/server/Server;)Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/android/tools/ir/server/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v5

    if-eqz v5, :cond_6

    goto :goto_1

    :cond_6
    const/4 v4, 0x0

    .line 269
    .local v4, "active":Z
    :goto_1
    invoke-virtual {p2, v4}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 270
    const-string v5, "InstantRun"

    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 271
    const-string v5, "InstantRun"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Received Ping message from the IDE; returned active = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 361
    .end local v4    # "active":Z
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->authenticate(Ljava/io/DataInputStream;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 362
    return-void

    .line 365
    :cond_7
    invoke-static {p1}, Lcom/android/tools/ir/runtime/ApplicationPatch;->read(Ljava/io/DataInputStream;)Ljava/util/List;

    move-result-object v5

    .line 366
    .local v5, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/ir/runtime/ApplicationPatch;>;"
    if-nez v5, :cond_8

    .line 367
    goto/16 :goto_0

    .line 370
    :cond_8
    invoke-static {v5}, Lcom/android/tools/ir/server/Server;->access$400(Ljava/util/List;)Z

    move-result v6

    .line 371
    .local v6, "hasResources":Z
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v7

    .line 372
    .local v7, "updateMode":I
    iget-object v8, p0, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-static {v8, v5, v6, v7}, Lcom/android/tools/ir/server/Server;->access$500(Lcom/android/tools/ir/server/Server;Ljava/util/List;ZI)I

    move-result v7

    .line 374
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v8

    .line 377
    .local v8, "showToast":Z
    invoke-virtual {p2, v4}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 379
    iget-object v4, p0, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/ir/server/Server;

    invoke-static {v4, v7, v6, v8}, Lcom/android/tools/ir/server/Server;->access$600(Lcom/android/tools/ir/server/Server;IZZ)V

    .line 380
    goto/16 :goto_0

    .line 405
    .end local v5    # "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/ir/runtime/ApplicationPatch;>;"
    .end local v6    # "hasResources":Z
    .end local v7    # "updateMode":I
    .end local v8    # "showToast":Z
    :cond_9
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 209
    :try_start_0
    new-instance v0, Ljava/io/DataInputStream;

    iget-object v1, p0, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->socket:Landroid/net/LocalSocket;

    invoke-virtual {v1}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 210
    .local v0, "input":Ljava/io/DataInputStream;
    new-instance v1, Ljava/io/DataOutputStream;

    iget-object v2, p0, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->socket:Landroid/net/LocalSocket;

    invoke-virtual {v2}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 212
    .local v1, "output":Ljava/io/DataOutputStream;
    :try_start_1
    invoke-direct {p0, v0, v1}, Lcom/android/tools/ir/server/Server$SocketServerReplyThread;->handle(Ljava/io/DataInputStream;Ljava/io/DataOutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 215
    :try_start_2
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 217
    goto :goto_0

    .line 216
    :catch_0
    move-exception v2

    .line 219
    :goto_0
    :try_start_3
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 221
    goto :goto_1

    .line 220
    :catch_1
    move-exception v2

    .line 222
    nop

    .line 227
    .end local v0    # "input":Ljava/io/DataInputStream;
    .end local v1    # "output":Ljava/io/DataOutputStream;
    :goto_1
    goto :goto_4

    .line 214
    .restart local v0    # "input":Ljava/io/DataInputStream;
    .restart local v1    # "output":Ljava/io/DataOutputStream;
    :catchall_0
    move-exception v2

    .line 215
    :try_start_4
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 217
    goto :goto_2

    .line 216
    :catch_2
    move-exception v3

    .line 219
    :goto_2
    :try_start_5
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 221
    goto :goto_3

    .line 220
    :catch_3
    move-exception v3

    .line 221
    :goto_3
    :try_start_6
    throw v2
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 223
    .end local v0    # "input":Ljava/io/DataInputStream;
    .end local v1    # "output":Ljava/io/DataOutputStream;
    :catch_4
    move-exception v0

    .line 224
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "InstantRun"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 225
    const-string v1, "InstantRun"

    const-string v2, "Fatal error receiving messages"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 228
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    :goto_4
    return-void
.end method
