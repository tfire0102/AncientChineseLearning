package com.example.ancientchineselearning.domain;

public class Dynasty {
    private int rid;
    private String content;

    public Dynasty() {}

    public Dynasty(int rid, String content) {
        this.rid = rid;
        this.content = content;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Dynasty{" +
                "rid=" + rid +
                ", content='" + content + '\'' +
                '}';
    }
}
