.class public Lcom/android/tools/ir/server/AppInfo;
.super Ljava/lang/Object;


# static fields
.field public static applicationId:Ljava/lang/String;

.field public static token:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "com.example.pc.appleisa"

    sput-object v0, Lcom/android/tools/ir/server/AppInfo;->applicationId:Ljava/lang/String;

    const-wide v0, 0x20b4bc457ce8427eL

    sput-wide v0, Lcom/android/tools/ir/server/AppInfo;->token:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
