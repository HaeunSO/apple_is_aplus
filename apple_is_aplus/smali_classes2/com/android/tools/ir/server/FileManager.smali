.class public Lcom/android/tools/ir/server/FileManager;
.super Ljava/lang/Object;
.source "FileManager.java"


# static fields
.field public static final CLASSES_DEX_SUFFIX:Ljava/lang/String; = ".dex"

.field private static final FILE_NAME_ACTIVE:Ljava/lang/String; = "active"

.field private static final FOLDER_NAME_LEFT:Ljava/lang/String; = "left"

.field private static final FOLDER_NAME_RIGHT:Ljava/lang/String; = "right"

.field private static final RELOAD_DEX_PREFIX:Ljava/lang/String; = "reload"

.field private static final RESOURCE_FILE_NAME:Ljava/lang/String; = "resources.ap_"

.field private static final RESOURCE_FOLDER_NAME:Ljava/lang/String; = "resources"

.field static final USE_EXTRACTED_RESOURCES:Z = false

.field private static havePurgedTempDexFolder:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static delete(Ljava/io/File;)V
    .locals 4
    .param p0, "file"    # Ljava/io/File;

    .line 150
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 153
    .local v0, "files":[Ljava/io/File;
    if-eqz v0, :cond_0

    .line 154
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 155
    .local v3, "child":Ljava/io/File;
    invoke-static {v3}, Lcom/android/tools/ir/server/FileManager;->delete(Ljava/io/File;)V

    .line 154
    .end local v3    # "child":Ljava/io/File;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 161
    .end local v0    # "files":[Ljava/io/File;
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 162
    .local v0, "deleted":Z
    if-nez v0, :cond_1

    .line 163
    const-string v1, "InstantRun"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to delete file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    :cond_1
    return-void
.end method

.method public static extractZip(Ljava/io/File;[B)Z
    .locals 2
    .param p0, "destination"    # Ljava/io/File;
    .param p1, "zipBytes"    # [B

    .line 362
    const-string v0, "InstantRun"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    const/4 v0, 0x0

    return v0
.end method

.method public static finishUpdate(Z)V
    .locals 0
    .param p0, "wroteResources"    # Z

    .line 373
    if-eqz p0, :cond_0

    .line 374
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->swapFolders()V

    .line 376
    :cond_0
    return-void
.end method

.method public static getCheckSum(Ljava/io/File;)[B
    .locals 1
    .param p0, "file"    # Ljava/io/File;

    .line 514
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getCheckSum(Ljava/lang/String;)[B
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .line 471
    const/4 v0, 0x0

    return-object v0
.end method

.method private static getDataFolder()Ljava/io/File;
    .locals 2

    .line 93
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/android/tools/ir/server/AppInfo;->applicationId:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/tools/ir/runtime/Paths;->getDataDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getExternalResourceFile()Ljava/io/File;
    .locals 3

    .line 217
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->getReadFolder()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/android/tools/ir/server/FileManager;->getResourceFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 218
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 219
    const-string v1, "InstantRun"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 220
    const-string v1, "InstantRun"

    const-string v2, "Cannot find external resources, not patching them in"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    :cond_0
    const/4 v1, 0x0

    return-object v1

    .line 225
    :cond_1
    return-object v0
.end method

.method public static getFileSize(Ljava/lang/String;)J
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .line 456
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public static getNativeLibraryFolder()Ljava/io/File;
    .locals 3

    .line 112
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/android/tools/ir/server/AppInfo;->applicationId:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/tools/ir/runtime/Paths;->getMainApkDataDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "lib"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getReadFolder()Ljava/io/File;
    .locals 3

    .line 120
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->leftIsActive()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "left"

    goto :goto_0

    :cond_0
    const-string v0, "right"

    .line 121
    .local v0, "name":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method private static getResourceFile(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .param p0, "base"    # Ljava/io/File;

    .line 99
    new-instance v0, Ljava/io/File;

    const-string v1, "resources.ap_"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getTempDexFile()Ljava/io/File;
    .locals 13

    .line 232
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v0

    .line 233
    .local v0, "dataFolder":Ljava/io/File;
    invoke-static {v0}, Lcom/android/tools/ir/server/FileManager;->getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 234
    .local v1, "dexFolder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_1

    .line 235
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    .line 236
    .local v2, "created":Z
    if-nez v2, :cond_0

    .line 237
    const-string v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to create directory "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    const/4 v3, 0x0

    return-object v3

    .line 242
    :cond_0
    sput-boolean v3, Lcom/android/tools/ir/server/FileManager;->havePurgedTempDexFolder:Z

    .line 243
    .end local v2    # "created":Z
    goto :goto_0

    .line 249
    :cond_1
    sget-boolean v2, Lcom/android/tools/ir/server/FileManager;->havePurgedTempDexFolder:Z

    if-nez v2, :cond_2

    .line 250
    invoke-static {v0}, Lcom/android/tools/ir/server/FileManager;->purgeTempDexFiles(Ljava/io/File;)V

    .line 254
    :cond_2
    :goto_0
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 255
    .local v2, "files":[Ljava/io/File;
    const/4 v4, -0x1

    .line 258
    .local v4, "max":I
    const/4 v5, 0x0

    if-eqz v2, :cond_6

    .line 259
    array-length v6, v2

    move v7, v4

    const/4 v4, 0x0

    .line 259
    .end local v4    # "max":I
    .local v7, "max":I
    :goto_1
    if-ge v4, v6, :cond_5

    aget-object v8, v2, v4

    .line 260
    .local v8, "file":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    .line 261
    .local v9, "name":Ljava/lang/String;
    const-string v10, "reload"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    const-string v10, ".dex"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 262
    const-string v10, "reload"

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    .line 263
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v11

    const-string v12, ".dex"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    sub-int/2addr v11, v12

    .line 262
    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 265
    .local v10, "middle":Ljava/lang/String;
    :try_start_0
    invoke-static {v10}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 266
    .local v11, "version":I
    if-le v11, v7, :cond_3

    .line 267
    move v7, v11

    .line 270
    .end local v11    # "version":I
    :cond_3
    goto :goto_2

    .line 269
    :catch_0
    move-exception v11

    .line 259
    .end local v8    # "file":Ljava/io/File;
    .end local v9    # "name":Ljava/lang/String;
    .end local v10    # "middle":Ljava/lang/String;
    :cond_4
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 275
    :cond_5
    move v4, v7

    .line 275
    .end local v7    # "max":I
    .restart local v4    # "max":I
    :cond_6
    const-string v6, "%s0x%04x%s"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const-string v8, "reload"

    aput-object v8, v7, v5

    add-int/lit8 v5, v4, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v7, v3

    const-string v3, ".dex"

    const/4 v5, 0x2

    aput-object v3, v7, v5

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 277
    .local v3, "fileName":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 279
    .local v6, "file":Ljava/io/File;
    const-string v7, "InstantRun"

    invoke-static {v7, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 280
    const-string v5, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Writing new dex file: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    :cond_7
    return-object v6
.end method

.method private static getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .param p0, "base"    # Ljava/io/File;

    .line 108
    new-instance v0, Ljava/io/File;

    const-string v1, "dex-temp"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getWriteFolder(Z)Ljava/io/File;
    .locals 6
    .param p0, "wipe"    # Z

    .line 137
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->leftIsActive()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "right"

    goto :goto_0

    :cond_0
    const-string v0, "left"

    .line 138
    .local v0, "name":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 139
    .local v1, "folder":Ljava/io/File;
    if-eqz p0, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 140
    invoke-static {v1}, Lcom/android/tools/ir/server/FileManager;->delete(Ljava/io/File;)V

    .line 141
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    .line 142
    .local v2, "mkdirs":Z
    if-nez v2, :cond_1

    .line 143
    const-string v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to create folder "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    .end local v2    # "mkdirs":Z
    :cond_1
    return-object v1
.end method

.method private static leftIsActive()Z
    .locals 6

    .line 168
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v0

    .line 169
    .local v0, "folder":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "active"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 170
    .local v1, "pointer":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_0

    .line 171
    return v3

    .line 174
    :cond_0
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, v1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    .local v2, "reader":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 177
    .local v4, "line":Ljava/lang/String;
    const-string v5, "left"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 179
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 177
    return v5

    .line 179
    .end local v4    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v4

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    throw v4
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 181
    .end local v2    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v2

    .line 182
    .local v2, "ignore":Ljava/io/IOException;
    return v3
.end method

.method public static purgeTempDexFiles(Ljava/io/File;)V
    .locals 9
    .param p0, "dataFolder"    # Ljava/io/File;

    .line 424
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/tools/ir/server/FileManager;->havePurgedTempDexFolder:Z

    .line 426
    invoke-static {p0}, Lcom/android/tools/ir/server/FileManager;->getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 427
    .local v0, "dexFolder":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    .line 428
    return-void

    .line 430
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 431
    .local v1, "files":[Ljava/io/File;
    if-nez v1, :cond_1

    .line 432
    return-void

    .line 435
    :cond_1
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, v1, v3

    .line 436
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    const-string v6, ".dex"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 437
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v5

    .line 438
    .local v5, "deleted":Z
    if-nez v5, :cond_2

    .line 439
    const-string v6, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Could not delete temp dex file "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 435
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "deleted":Z
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 443
    :cond_3
    return-void
.end method

.method private static setLeftActive(Z)V
    .locals 6
    .param p0, "active"    # Z

    .line 187
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v0

    .line 188
    .local v0, "folder":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    const-string v2, "active"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 189
    .local v1, "pointer":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 190
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v2

    .line 191
    .local v2, "deleted":Z
    if-nez v2, :cond_0

    .line 192
    const-string v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to delete file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    .end local v2    # "deleted":Z
    :cond_0
    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_3

    .line 195
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v2

    .line 196
    .local v2, "create":Z
    if-nez v2, :cond_2

    .line 197
    const-string v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to create directory "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    :cond_2
    return-void

    .line 203
    .end local v2    # "create":Z
    :cond_3
    :goto_0
    :try_start_0
    new-instance v2, Ljava/io/BufferedWriter;

    new-instance v3, Ljava/io/OutputStreamWriter;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .local v2, "writer":Ljava/io/Writer;
    if-eqz p0, :cond_4

    :try_start_1
    const-string v3, "left"

    goto :goto_1

    .line 208
    :catchall_0
    move-exception v3

    goto :goto_2

    .line 206
    :cond_4
    const-string v3, "right"

    :goto_1
    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 208
    :try_start_2
    invoke-virtual {v2}, Ljava/io/Writer;->close()V

    .line 209
    nop

    .line 211
    .end local v2    # "writer":Ljava/io/Writer;
    goto :goto_3

    .line 208
    .restart local v2    # "writer":Ljava/io/Writer;
    :goto_2
    invoke-virtual {v2}, Ljava/io/Writer;->close()V

    throw v3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 210
    .end local v2    # "writer":Ljava/io/Writer;
    :catch_0
    move-exception v2

    .line 212
    :goto_3
    return-void
.end method

.method public static startUpdate()V
    .locals 1

    .line 369
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/tools/ir/server/FileManager;->getWriteFolder(Z)Ljava/io/File;

    .line 370
    return-void
.end method

.method public static swapFolders()V
    .locals 1

    .line 129
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->leftIsActive()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/android/tools/ir/server/FileManager;->setLeftActive(Z)V

    .line 130
    return-void
.end method

.method public static writeAaptResources(Ljava/lang/String;[B)V
    .locals 7
    .param p0, "relativePath"    # Ljava/lang/String;
    .param p1, "bytes"    # [B

    .line 380
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/tools/ir/server/FileManager;->getWriteFolder(Z)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/android/tools/ir/server/FileManager;->getResourceFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 381
    .local v0, "resourceFile":Ljava/io/File;
    move-object v1, v0

    .line 385
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 386
    .local v2, "folder":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_1

    .line 387
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v3

    .line 388
    .local v3, "created":Z
    if-nez v3, :cond_1

    .line 389
    const-string v4, "InstantRun"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 390
    const-string v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot create local resource file directory "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    :cond_0
    return-void

    .line 396
    .end local v3    # "created":Z
    :cond_1
    const-string v3, "resources.ap_"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 401
    invoke-static {v1, p1}, Lcom/android/tools/ir/server/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    goto :goto_0

    .line 404
    :cond_2
    invoke-static {v1, p1}, Lcom/android/tools/ir/server/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    .line 406
    :goto_0
    return-void
.end method

.method public static writeRawBytes(Ljava/io/File;[B)Z
    .locals 5
    .param p0, "destination"    # Ljava/io/File;
    .param p1, "bytes"    # [B

    .line 288
    const/4 v0, 0x1

    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 290
    .local v1, "output":Ljava/io/BufferedOutputStream;
    :try_start_1
    invoke-virtual {v1, p1}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 291
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 292
    nop

    .line 294
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    .line 292
    return v0

    .line 294
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    throw v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 296
    .end local v1    # "output":Ljava/io/BufferedOutputStream;
    :catch_0
    move-exception v1

    .line 297
    .local v1, "ioe":Ljava/io/IOException;
    const-string v2, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to write file, clean project and rebuild "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 301
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "InstantRun could not write file %1$s, clean project and rebuild "

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v0, v4

    .line 302
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static writeTempDexFile([B)Ljava/lang/String;
    .locals 3
    .param p0, "bytes"    # [B

    .line 410
    invoke-static {}, Lcom/android/tools/ir/server/FileManager;->getTempDexFile()Ljava/io/File;

    move-result-object v0

    .line 411
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_0

    .line 412
    invoke-static {v0, p0}, Lcom/android/tools/ir/server/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    .line 413
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 415
    :cond_0
    const-string v1, "InstantRun"

    const-string v2, "No file to write temp dex content to"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    const/4 v1, 0x0

    return-object v1
.end method
