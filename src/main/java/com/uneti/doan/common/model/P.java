package com.uneti.doan.common.model;

public class P {
    protected String field;
    protected String x;
    protected String c;
    protected double value;

    public P() {
    }

    public P(String field, String x, String c, double value) {
        this.field = field;
        this.x = x;
        this.c = c;
        this.value = value;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getC() {
        return c;
    }

    public void setC(String c) {
        this.c = c;
    }

    public double getValue() {
        return value;
    }

    public void setValue(double value) {
        this.value = value;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }
}
