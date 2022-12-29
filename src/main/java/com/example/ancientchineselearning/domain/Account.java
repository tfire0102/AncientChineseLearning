package com.example.ancientchineselearning.domain;

public class Account {
	private int acn_rid;
	private String acn_eml;
	private String acn_pwd;
	private String acn_perm;
	
	public Account(int acn_rid, String acn_eml, String acn_pwd, String acn_perm) {
		super();
		this.acn_rid = acn_rid;
		this.acn_eml = acn_eml;
		this.acn_pwd = acn_pwd;
		this.acn_perm = acn_perm;
	}
	
	public Account() {
		super();
	}
	
	public int getAcn_rid() {
		return acn_rid;
	}
	public void setAcn_rid(int acn_rid) {
		this.acn_rid = acn_rid;
	}
	public String getAcn_eml() {
		return acn_eml;
	}
	public void setAcn_eml(String acn_eml) {
		this.acn_eml = acn_eml;
	}
	public String getAcn_pwd() {
		return acn_pwd;
	}
	public void setAcn_pwd(String acn_pwd) {
		this.acn_pwd = acn_pwd;
	}
	public String getAcn_perm() {
		return acn_perm;
	}
	public void setAcn_perm(String acn_perm) {
		this.acn_perm = acn_perm;
	}
	
}
