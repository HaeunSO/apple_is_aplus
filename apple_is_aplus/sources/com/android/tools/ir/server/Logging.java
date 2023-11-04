package com.android.tools.ir.server;

import com.android.tools.ir.common.Log;
import java.util.logging.Level;
/* loaded from: classes.dex */
public class Logging {
    public static final String LOG_TAG = "InstantRun";

    static {
        Log.logging = new Log.Logging() { // from class: com.android.tools.ir.server.Logging.1
            @Override // com.android.tools.ir.common.Log.Logging
            public void log(Level level, String string) {
                log(level, string, null);
            }

            @Override // com.android.tools.ir.common.Log.Logging
            public boolean isLoggable(Level level) {
                if (level == Level.SEVERE) {
                    return android.util.Log.isLoggable(Logging.LOG_TAG, 6);
                }
                if (level == Level.FINE) {
                    return android.util.Log.isLoggable(Logging.LOG_TAG, 2);
                }
                return android.util.Log.isLoggable(Logging.LOG_TAG, 4);
            }

            @Override // com.android.tools.ir.common.Log.Logging
            public void log(Level level, String string, Throwable throwable) {
                if (level == Level.SEVERE) {
                    if (throwable == null) {
                        android.util.Log.e(Logging.LOG_TAG, string);
                    } else {
                        android.util.Log.e(Logging.LOG_TAG, string, throwable);
                    }
                } else if (level == Level.FINE) {
                    if (android.util.Log.isLoggable(Logging.LOG_TAG, 2)) {
                        if (throwable == null) {
                            android.util.Log.v(Logging.LOG_TAG, string);
                        } else {
                            android.util.Log.v(Logging.LOG_TAG, string, throwable);
                        }
                    }
                } else if (android.util.Log.isLoggable(Logging.LOG_TAG, 4)) {
                    if (throwable == null) {
                        android.util.Log.i(Logging.LOG_TAG, string);
                    } else {
                        android.util.Log.i(Logging.LOG_TAG, string, throwable);
                    }
                }
            }
        };
    }
}
