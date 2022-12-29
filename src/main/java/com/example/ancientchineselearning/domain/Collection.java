package com.example.ancientchineselearning.domain;

public class Collection {
    private int rid;
    private Poetry poetry;
    private int accountID;

    public Collection() {}

    public Collection(int rid, Poetry poetry, int accountID) {
        this.rid = rid;
        this.poetry = poetry;
        this.accountID = accountID;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public Poetry getPoetry() {
        return poetry;
    }

    public void setPoetry(Poetry poetry) {
        this.poetry = poetry;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    @Override
    public String toString() {
        return "Collection{" +
                "rid=" + rid +
                ", poetry=" + poetry +
                ", accountID=" + accountID +
                '}';
    }
}
