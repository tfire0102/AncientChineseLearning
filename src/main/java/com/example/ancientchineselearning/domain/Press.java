package com.example.ancientchineselearning.domain;

public class Press {
    private int rid;
    private int poemID;
    private String poem;
    private String account;
    private String content;

    public Press() {}
    public Press(int rid, int poemID, String poem, String account, String content) {
        this.rid = rid;
        this.poemID = poemID;
        this.poem = poem;
        this.account = account;
        this.content = content;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getPoemID() {
        return poemID;
    }

    public void setPoemID(int poemID) {
        this.poemID = poemID;
    }

    public String getPoem() {
        return poem;
    }

    public void setPoem(String poem) {
        this.poem = poem;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String auther) {
        this.account = auther;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Press{" +
                "rid=" + rid +
                ", poem='" + poem + '\'' +
                ", auther='" + account + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
