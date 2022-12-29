package com.example.ancientchineselearning.domain;

public class Poetry {
    private int rid;
    private Auther auther;
    private String title;
    private String content;
    private String translate;
    private String appreciate;
    private String notes;
    private String famSentence;
    private int numOfLike;

    public Poetry() {}

    public Poetry(int rid, Auther auther, String title, String content, String translate, String appreciate, String notes, String famSentence, int numOfLike) {
        this.rid = rid;
        this.auther = auther;
        this.title = title;
        this.content = content;
        this.translate = translate;
        this.appreciate = appreciate;
        this.notes = notes;
        this.famSentence = famSentence;
        this.numOfLike = numOfLike;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public Auther getAuther() {
        return auther;
    }

    public void setAuther(Auther auther) {
        this.auther = auther;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTranslate() {
        return translate;
    }

    public void setTranslate(String translate) {
        this.translate = translate;
    }

    public String getAppreciate() {
        return appreciate;
    }

    public void setAppreciate(String appreciate) {
        this.appreciate = appreciate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getFamSentence() {
        return famSentence;
    }

    public void setFamSentence(String famSentence) {
        this.famSentence = famSentence;
    }

    public int getNumOfLike() {
        return numOfLike;
    }

    public void setNumOfLike(int numOfLike) {
        this.numOfLike = numOfLike;
    }

    @Override
    public String toString() {
        return "Poetry{" +
                "rid=" + rid +
                ", auther=" + auther +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", translate='" + translate + '\'' +
                ", appreciate='" + appreciate + '\'' +
                ", notes='" + notes + '\'' +
                ", famSentence='" + famSentence + '\'' +
                ", numOfLike=" + numOfLike +
                '}';
    }
}
