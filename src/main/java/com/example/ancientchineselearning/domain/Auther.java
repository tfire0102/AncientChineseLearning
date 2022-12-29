package com.example.ancientchineselearning.domain;

public class Auther {
    private int rid;
    private String name;
    private String dynasty;
    private String btd;
    private String info;

    public Auther() {}

    public Auther(int rid, String name, String dynasty, String btd, String info) {
        this.rid = rid;
        this.name = name;
        this.dynasty = dynasty;
        this.btd = btd;
        this.info = info;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDynasty() {
        return dynasty;
    }

    public void setDynasty(String dynasty) {
        this.dynasty = dynasty;
    }

    public String getBtd() {
        return btd;
    }

    public void setBtd(String btd) {
        this.btd = btd;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "auther{" +
                "rid=" + rid +
                ", name='" + name + '\'' +
                ", dynasty='" + dynasty + '\'' +
                ", btd='" + btd + '\'' +
                ", info='" + info + '\'' +
                '}';
    }
}
