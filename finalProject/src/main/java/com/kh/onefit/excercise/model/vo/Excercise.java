package com.kh.onefit.excercise.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Excercise {

	private int jrNum; // 운동일지 번호
	private Date jrDate; // 운동일지 날짜
	private String exPart; // 운동 부위
	private int trNum; // 트레이너 번호
	private int userNum; // 회원 번호
	private String oneLine; // 한줄 평
	private ArrayList<ExcerciseContent> eclist;

	public Excercise() {
	}

	public Excercise(int jrNum, Date jrDate, String exPart, int trNum, int userNum, String oneLine,
			ArrayList<ExcerciseContent> eclist) {
		super();
		this.jrNum = jrNum;
		this.jrDate = jrDate;
		this.exPart = exPart;
		this.trNum = trNum;
		this.userNum = userNum;
		this.oneLine = oneLine;
		this.eclist = eclist;
	}

	public Excercise(int jrNum, Date jrDate, String exPart, int trNum, int userNum, String oneLine) {
		super();
		this.jrNum = jrNum;
		this.jrDate = jrDate;
		this.exPart = exPart;
		this.trNum = trNum;
		this.userNum = userNum;
		this.oneLine = oneLine;
	}

	public ArrayList<ExcerciseContent> getEclist() {
		return eclist;
	}

	public void setEclist(ArrayList<ExcerciseContent> eclist) {
		this.eclist = eclist;
	}

	public int getJrNum() {
		return jrNum;
	}

	public void setJrNum(int jrNum) {
		this.jrNum = jrNum;
	}

	public Date getJrDate() {
		return jrDate;
	}

	public void setJrDate(Date jrDate) {
		this.jrDate = jrDate;
	}

	public String getExPart() {
		return exPart;
	}

	public void setExPart(String exPart) {
		this.exPart = exPart;
	}

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getOneLine() {
		return oneLine;
	}

	public void setOneLine(String oneLine) {
		this.oneLine = oneLine;
	}

	@Override
	public String toString() {
		return "Excercise [jrNum=" + jrNum + ", jrDate=" + jrDate + ", exPart=" + exPart + ", trNum=" + trNum
				+ ", userNum=" + userNum + ", oneLine=" + oneLine + ", eclist=" + eclist + "]";
	}
}
