package com.android.tools.ir.runtime;
/* loaded from: classes4.dex */
public enum BasicType {
    I(Integer.TYPE),
    J(Long.TYPE),
    C(Character.TYPE),
    Z(Boolean.TYPE),
    F(Float.TYPE),
    D(Double.TYPE),
    V(Void.TYPE);
    
    private final Class<?> primitiveJavaType;

    BasicType(Class cls) {
        this.primitiveJavaType = cls;
    }

    public Class getJavaType() {
        return this.primitiveJavaType;
    }

    public static BasicType parse(String name) {
        BasicType[] values;
        for (BasicType basicType : values()) {
            if (basicType.getJavaType().getName().equals(name)) {
                return basicType;
            }
        }
        return null;
    }
}
