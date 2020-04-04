package com.kh.onefit.attendence.model.vo;

import java.util.Date;

public class Attendence {
	private int atNum; // 고유번호
	private Date atDate;
	private int userNum;
	private String content;
	
	public Attendence() {}    

	public Attendence(int atNum, Date atDate, int userNum, String content) {
		super();
		this.atNum = atNum;
		this.atDate = atDate;
		this.userNum = userNum;
		this.content = content;
	}

	public int getAtNum() {
		return atNum;
	}

	public void setAtNum(int atNum) {
		this.atNum = atNum;
	}

	public Date getAtDate() {
		return atDate;
	}

	public void setAtDate(Date atDate) {
		this.atDate = atDate;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Attendence [atNum=" + atNum + ", atDate=" + atDate + ", userNum=" + userNum + ", content=" + content
				+ "]";
	}
	
	

}
