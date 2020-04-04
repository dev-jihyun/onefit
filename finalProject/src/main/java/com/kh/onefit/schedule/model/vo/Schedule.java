package com.kh.onefit.schedule.model.vo;

import java.util.Date;

public class Schedule {

	private int scNum;
	private Date scDate;
	private Date scStart;
	private Date scEnd;
	private int cate;
	private String content;
	private int userNum;
	private int trNum;
	//pt일정 인서트할때 가져가려고 생성
	private String ptTime;
	private String ptmName;
	
	public Schedule() {}

	
	public Schedule(int scNum, Date scDate, Date scStart, Date scEnd, int cate, String content, int userNum, int trNum,
			String ptTime, String ptmName) {
		super();
		this.scNum = scNum;
		this.scDate = scDate;
		this.scStart = scStart;
		this.scEnd = scEnd;
		this.cate = cate;
		this.content = content;
		this.userNum = userNum;
		this.trNum = trNum;
		this.ptTime = ptTime;
		this.ptmName = ptmName;
	}


	public String getPtTime() {
		return ptTime;
	}


	public void setPtTime(String ptTime) {
		this.ptTime = ptTime;
	}


	public String getPtmName() {
		return ptmName;
	}


	public void setPtmName(String ptmName) {
		this.ptmName = ptmName;
	}


	public Schedule(int scNum, Date scDate, Date scStart, Date scEnd, int cate, String content, int userNum, int trNum,
			String ptTime) {
		super();
		this.scNum = scNum;
		this.scDate = scDate;
		this.scStart = scStart;
		this.scEnd = scEnd;
		this.cate = cate;
		this.content = content;
		this.userNum = userNum;
		this.trNum = trNum;
		this.ptTime = ptTime;
	}

	public Schedule(int scNum, Date scDate, Date scStart, Date scEnd, int cate, String content, int userNum,
			int trNum) {
		super();
		this.scNum = scNum;
		this.scDate = scDate;
		this.scStart = scStart;
		this.scEnd = scEnd;
		this.cate = cate;
		this.content = content;
		this.userNum = userNum;
		this.trNum = trNum;
	}

	public Schedule(String ptTime, int userNum, int trNum) {
		super();
		this.userNum = userNum;
		this.trNum = trNum;
		this.ptTime = ptTime;
	}


	public int getScNum() {
		return scNum;
	}

	public void setScNum(int scNum) {
		this.scNum = scNum;
	}

	public Date getScDate() {
		return scDate;
	}

	public void setScDate(Date scDate) {
		this.scDate = scDate;
	}

	public Date getScStart() {
		return scStart;
	}

	public void setScStart(Date scStart) {
		this.scStart = scStart;
	}

	public Date getScEnd() {
		return scEnd;
	}

	public void setScEnd(Date scEnd) {
		this.scEnd = scEnd;
	}

	public int getCate() {
		return cate;
	}

	public void setCate(int cate) {
		this.cate = cate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}

	@Override
	public String toString() {
		return "Schedule [scNum=" + scNum + ", scDate=" + scDate + ", scStart=" + scStart + ", scEnd=" + scEnd
				+ ", cate=" + cate + ", content=" + content + ", userNum=" + userNum + ", trNum=" + trNum + ", ptTime="
				+ ptTime + ", ptmName=" + ptmName + "]";
	}
}
