package com.uneti.doan.common.model;

import java.util.Objects;

public class TestModel {
    private String nhietDo;
    private String doAm;
    private String result;

    public TestModel() {
    }

    public TestModel(String nhietDo, String doAm, String result) {
        this.nhietDo = nhietDo;
        this.doAm = doAm;
        this.result = result;
    }

    public String getNhietDo() {
        return nhietDo;
    }

    public void setNhietDo(String nhietDo) {
        this.nhietDo = nhietDo;
    }

    public String getDoAm() {
        return doAm;
    }

    public void setDoAm(String doAm) {
        this.doAm = doAm;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
