package com.android.tools.ir.server;

import android.util.Log;
import com.android.tools.ir.runtime.Paths;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
/* loaded from: classes2.dex */
public class FileManager {
    public static final String CLASSES_DEX_SUFFIX = ".dex";
    private static final String FILE_NAME_ACTIVE = "active";
    private static final String FOLDER_NAME_LEFT = "left";
    private static final String FOLDER_NAME_RIGHT = "right";
    private static final String RELOAD_DEX_PREFIX = "reload";
    private static final String RESOURCE_FILE_NAME = "resources.ap_";
    private static final String RESOURCE_FOLDER_NAME = "resources";
    static final boolean USE_EXTRACTED_RESOURCES = false;
    private static boolean havePurgedTempDexFolder;

    private static File getDataFolder() {
        return new File(Paths.getDataDirectory(AppInfo.applicationId));
    }

    private static File getResourceFile(File base) {
        return new File(base, "resources.ap_");
    }

    private static File getTempDexFileFolder(File base) {
        return new File(base, "dex-temp");
    }

    public static File getNativeLibraryFolder() {
        return new File(Paths.getMainApkDataDirectory(AppInfo.applicationId), "lib");
    }

    public static File getReadFolder() {
        String name = leftIsActive() ? FOLDER_NAME_LEFT : FOLDER_NAME_RIGHT;
        return new File(getDataFolder(), name);
    }

    public static void swapFolders() {
        setLeftActive(!leftIsActive());
    }

    public static File getWriteFolder(boolean wipe) {
        String name = leftIsActive() ? FOLDER_NAME_RIGHT : FOLDER_NAME_LEFT;
        File folder = new File(getDataFolder(), name);
        if (wipe && folder.exists()) {
            delete(folder);
            boolean mkdirs = folder.mkdirs();
            if (!mkdirs) {
                Log.e(Logging.LOG_TAG, "Failed to create folder " + folder);
            }
        }
        return folder;
    }

    private static void delete(File file) {
        File[] files;
        if (file.isDirectory() && (files = file.listFiles()) != null) {
            for (File child : files) {
                delete(child);
            }
        }
        boolean deleted = file.delete();
        if (!deleted) {
            Log.e(Logging.LOG_TAG, "Failed to delete file " + file);
        }
    }

    private static boolean leftIsActive() {
        File folder = getDataFolder();
        File pointer = new File(folder, FILE_NAME_ACTIVE);
        if (pointer.exists()) {
            try {
                BufferedReader reader = new BufferedReader(new FileReader(pointer));
                String line = reader.readLine();
                boolean equals = FOLDER_NAME_LEFT.equals(line);
                reader.close();
                return equals;
            } catch (IOException e) {
                return true;
            }
        }
        return true;
    }

    private static void setLeftActive(boolean active) {
        File folder = getDataFolder();
        File pointer = new File(folder, FILE_NAME_ACTIVE);
        if (pointer.exists()) {
            boolean deleted = pointer.delete();
            if (!deleted) {
                Log.e(Logging.LOG_TAG, "Failed to delete file " + pointer);
            }
        } else if (!folder.exists()) {
            boolean create = folder.mkdirs();
            if (!create) {
                Log.e(Logging.LOG_TAG, "Failed to create directory " + folder);
                return;
            }
            return;
        }
        try {
            Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(pointer), "UTF-8"));
            writer.write(active ? FOLDER_NAME_LEFT : FOLDER_NAME_RIGHT);
            writer.close();
        } catch (IOException e) {
        }
    }

    public static File getExternalResourceFile() {
        File file = getResourceFile(getReadFolder());
        if (!file.exists()) {
            if (Log.isLoggable(Logging.LOG_TAG, 2)) {
                Log.v(Logging.LOG_TAG, "Cannot find external resources, not patching them in");
                return null;
            }
            return null;
        }
        return file;
    }

    public static File getTempDexFile() {
        File dataFolder = getDataFolder();
        File dexFolder = getTempDexFileFolder(dataFolder);
        if (!dexFolder.exists()) {
            boolean created = dexFolder.mkdirs();
            if (!created) {
                Log.e(Logging.LOG_TAG, "Failed to create directory " + dexFolder);
                return null;
            }
            havePurgedTempDexFolder = true;
        } else if (!havePurgedTempDexFolder) {
            purgeTempDexFiles(dataFolder);
        }
        File[] files = dexFolder.listFiles();
        int max = -1;
        if (files != null) {
            int max2 = -1;
            for (File file : files) {
                String name = file.getName();
                if (name.startsWith(RELOAD_DEX_PREFIX) && name.endsWith(CLASSES_DEX_SUFFIX)) {
                    String middle = name.substring(RELOAD_DEX_PREFIX.length(), name.length() - CLASSES_DEX_SUFFIX.length());
                    try {
                        int version = Integer.decode(middle).intValue();
                        if (version > max2) {
                            max2 = version;
                        }
                    } catch (NumberFormatException e) {
                    }
                }
            }
            max = max2;
        }
        String fileName = String.format("%s0x%04x%s", RELOAD_DEX_PREFIX, Integer.valueOf(max + 1), CLASSES_DEX_SUFFIX);
        File file2 = new File(dexFolder, fileName);
        if (Log.isLoggable(Logging.LOG_TAG, 2)) {
            Log.v(Logging.LOG_TAG, "Writing new dex file: " + file2);
        }
        return file2;
    }

    public static boolean writeRawBytes(File destination, byte[] bytes) {
        try {
            BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(destination));
            output.write(bytes);
            output.flush();
            output.close();
            return true;
        } catch (IOException ioe) {
            Log.wtf(Logging.LOG_TAG, "Failed to write file, clean project and rebuild " + destination, ioe);
            throw new RuntimeException(String.format("InstantRun could not write file %1$s, clean project and rebuild ", destination));
        }
    }

    public static boolean extractZip(File destination, byte[] zipBytes) {
        Log.wtf(Logging.LOG_TAG, "");
        return USE_EXTRACTED_RESOURCES;
    }

    public static void startUpdate() {
        getWriteFolder(true);
    }

    public static void finishUpdate(boolean wroteResources) {
        if (wroteResources) {
            swapFolders();
        }
    }

    public static void writeAaptResources(String relativePath, byte[] bytes) {
        File resourceFile = getResourceFile(getWriteFolder(USE_EXTRACTED_RESOURCES));
        File folder = resourceFile.getParentFile();
        if (!folder.isDirectory()) {
            boolean created = folder.mkdirs();
            if (!created) {
                if (Log.isLoggable(Logging.LOG_TAG, 2)) {
                    Log.v(Logging.LOG_TAG, "Cannot create local resource file directory " + folder);
                    return;
                }
                return;
            }
        }
        if (relativePath.equals("resources.ap_")) {
            writeRawBytes(resourceFile, bytes);
        } else {
            writeRawBytes(resourceFile, bytes);
        }
    }

    public static String writeTempDexFile(byte[] bytes) {
        File file = getTempDexFile();
        if (file != null) {
            writeRawBytes(file, bytes);
            return file.getPath();
        }
        Log.e(Logging.LOG_TAG, "No file to write temp dex content to");
        return null;
    }

    public static void purgeTempDexFiles(File dataFolder) {
        File[] files;
        havePurgedTempDexFolder = true;
        File dexFolder = getTempDexFileFolder(dataFolder);
        if (!dexFolder.isDirectory() || (files = dexFolder.listFiles()) == null) {
            return;
        }
        for (File file : files) {
            if (file.getPath().endsWith(CLASSES_DEX_SUFFIX)) {
                boolean deleted = file.delete();
                if (!deleted) {
                    Log.e(Logging.LOG_TAG, "Could not delete temp dex file " + file);
                }
            }
        }
    }

    public static long getFileSize(String path) {
        return -1L;
    }

    public static byte[] getCheckSum(String path) {
        return null;
    }

    public static byte[] getCheckSum(File file) {
        return null;
    }
}
