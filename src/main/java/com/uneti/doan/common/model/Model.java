package com.uneti.doan.common.model;


import javax.persistence.*;

@Entity
@Table(name = "survey_answer")
public class Model {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;
    private String hocLuc;
    private String sucKhoe;
    private String ngoaiHinh;
    private String kinhTe;
    private String gioiTinh;
    private String tuoi;
    private String huongNganh;
    private String huongNoiNgoai;
    private String result;

    public String getHocLuc() {
        return hocLuc;
    }

    public void setHocLuc(String hocLuc) {
        this.hocLuc = hocLuc;
    }

    public String getSucKhoe() {
        return sucKhoe;
    }

    public void setSucKhoe(String sucKhoe) {
        this.sucKhoe = sucKhoe;
    }

    public String getNgoaiHinh() {
        return ngoaiHinh;
    }

    public void setNgoaiHinh(String ngoaiHinh) {
        this.ngoaiHinh = ngoaiHinh;
    }

    public String getKinhTe() {
        return kinhTe;
    }

    public void setKinhTe(String kinhTe) {
        this.kinhTe = kinhTe;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getTuoi() {
        return tuoi;
    }

    public void setTuoi(String tuoi) {
        this.tuoi = tuoi;
    }

    public String getHuongNganh() {
        return huongNganh;
    }

    public void setHuongNganh(String huongNganh) {
        this.huongNganh = huongNganh;
    }

    public String getHuongNoiNgoai() {
        return huongNoiNgoai;
    }

    public void setHuongNoiNgoai(String huongNoiNgoai) {
        this.huongNoiNgoai = huongNoiNgoai;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
