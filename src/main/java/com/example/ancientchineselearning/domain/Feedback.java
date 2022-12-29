package com.example.ancientchineselearning.domain;

public class Feedback {
    private int rid;
    private String poemName;
    private String account;
    private String connect;

    public Feedback() {}
    public Feedback(int rid, String poemName, String account, String connect) {
        this.rid = rid;
        this.poemName = poemName;
        this.account = account;
        this.connect = connect;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getPoemName() {
        return poemName;
    }

    public void setPoemName(String poemName) {
        this.poemName = poemName;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getConnect() {
        return connect;
    }

    public void setConnect(String connect) {
        this.connect = connect;
    }

    @Override
    public String toString() {
        return "feedback4Dao{" +
                "rid=" + rid +
                ", poemName='" + poemName + '\'' +
                ", account='" + account + '\'' +
                ", connect='" + connect + '\'' +
                '}';
    }
}
