package com.android.tools.ir.runtime;
/* loaded from: classes2.dex */
public class PatchesLoaderDumper {
    public static void main(String[] args) {
        try {
            Class<?> aClass = Class.forName("com.android.tools.ir.runtime.AppPatchesLoaderImpl");
            PatchesLoader patchesLoader = (PatchesLoader) aClass.newInstance();
            patchesLoader.load();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e2) {
            e2.printStackTrace();
        } catch (InstantiationException e3) {
            e3.printStackTrace();
        }
    }
}
