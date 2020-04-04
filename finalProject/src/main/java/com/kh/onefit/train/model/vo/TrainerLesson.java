package com.kh.onefit.train.model.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class TrainerLesson {

	private int userNum; //pt회원번호
	private String userName; //pt회원 이름
	private String phone; //pt회원 전화번호
	private int trNum; //트레이너 번호
	private int count; //pt 남은 횟수
	private int totalCount; //총 결제한 pt 개수
	private int scNum; //스케줄 번호
	private Date scDate; //수업일자
	private Date scStart; //수업시작 시간
	private Date scEnd; //수업 끝나는 시간
	private String chName;
	
	private String scDateString;
	private String scStartString;
	private String scEndtString;
	
	public TrainerLesson() {}

	public TrainerLesson(int userNum, String userName, String phone, int trNum, int count, int totalCount, int scNum,
			Date scDate, Date scStart, Date scEnd, String chName, String scDateString, String scStartString,
			String scEndtString) {
		super();
		this.userNum = userNum;
		this.userName = userName;
		this.phone = phone;
		this.trNum = trNum;
		this.count = count;
		this.totalCount = totalCount;
		this.scNum = scNum;
		this.scDate = scDate;
		this.scStart = scStart;
		this.scEnd = scEnd;
		this.chName = chName;
		this.scDateString = scDateString;
		this.scStartString = scStartString;
		this.scEndtString = scEndtString;
	}



	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
	
	//시간을 저장하기 위해사
	public String getScStartString() {
		return scStartString;
	}

	public void setScStartString(String scStartString) {
		this.scStartString = scStartString;
	}

	public String getScEndtString() {
		return scEndtString;
	}

	public void setScEndtString(String scEndtString) {
		this.scEndtString = scEndtString;
	}
	
	public String getScDateString() {
		return scDateString;
	}

	public void setScDateString(String scDateString) {
		this.scDateString = scDateString;
	}

	public String getChName() {
		return chName;
	}

	public void setChName(String chNum) {
		this.chName = chNum;
	}

	@Override
	public String toString() {
		return "TrainerLesson [userNum=" + userNum + ", userName=" + userName + ", phone=" + phone + ", trNum=" + trNum
				+ ", count=" + count + ", totalCount=" + totalCount + ", scNum=" + scNum + ", scDate=" + scDate
				+ ", scStart=" + scStart + ", scEnd=" + scEnd +", scStartString=" +scStartString+", scEndtString=" +scEndtString
				+", scDatetString=" +scDateString+", chName=" +chName+"]";
	}
	
}
