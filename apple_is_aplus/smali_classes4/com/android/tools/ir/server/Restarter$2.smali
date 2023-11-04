.class final Lcom/android/tools/ir/server/Restarter$2;
.super Ljava/lang/Object;
.source "Restarter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/tools/ir/server/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 159
    iput-object p1, p0, Lcom/android/tools/ir/server/Restarter$2;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/android/tools/ir/server/Restarter$2;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 163
    const/4 v0, 0x5

    :try_start_0
    iget-object v1, p0, Lcom/android/tools/ir/server/Restarter$2;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 164
    .local v1, "context":Landroid/content/Context;
    instance-of v2, v1, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_1

    .line 165
    move-object v2, v1

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    .line 166
    .local v2, "base":Landroid/content/Context;
    if-nez v2, :cond_1

    .line 167
    const-string v3, "InstantRun"

    invoke-static {v3, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 168
    const-string v3, "InstantRun"

    const-string v4, "Couldn\'t show toast: no base context"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    :cond_0
    return-void

    .line 175
    .end local v2    # "base":Landroid/content/Context;
    :cond_1
    const/4 v2, 0x0

    .line 176
    .local v2, "duration":I
    iget-object v3, p0, Lcom/android/tools/ir/server/Restarter$2;->val$text:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x3c

    if-ge v3, v4, :cond_2

    iget-object v3, p0, Lcom/android/tools/ir/server/Restarter$2;->val$text:Ljava/lang/String;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_3

    .line 177
    :cond_2
    const/4 v2, 0x1

    .line 183
    :cond_3
    iget-object v3, p0, Lcom/android/tools/ir/server/Restarter$2;->val$activity:Landroid/app/Activity;

    iget-object v4, p0, Lcom/android/tools/ir/server/Restarter$2;->val$text:Ljava/lang/String;

    invoke-static {v3, v4, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .end local v1    # "context":Landroid/content/Context;
    .end local v2    # "duration":I
    goto :goto_0

    .line 184
    :catch_0
    move-exception v1

    .line 185
    .local v1, "e":Ljava/lang/Throwable;
    const-string v2, "InstantRun"

    invoke-static {v2, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 186
    const-string v0, "InstantRun"

    const-string v2, "Couldn\'t show toast"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 189
    .end local v1    # "e":Ljava/lang/Throwable;
    :cond_4
    :goto_0
    return-void
.end method
