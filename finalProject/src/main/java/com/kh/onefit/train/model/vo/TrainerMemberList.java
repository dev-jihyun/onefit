package com.kh.onefit.train.model.vo;

import java.sql.Date;

public class TrainerMemberList {
	private int userNum;
	private String userName;
	private String phone;
	private int count;
	private int totalCount;
	private int trNum;
	private Date payDate;
	private String chName;
	
	public TrainerMemberList() {}

	public TrainerMemberList(int userNum, String userName, String phone, int count, int totalCount, int trNum,
			Date payDate, String chName) {
		super();
		this.userNum = userNum;
		this.userName = userName;
		this.phone = phone;
		this.count = count;
		this.totalCount = totalCount;
		this.trNum = trNum;
		this.payDate = payDate;
		this.chName = chName;
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

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getChName() {
		return chName;
	}

	public void setChName(String chName) {
		this.chName = chName;
	}

	@Override
	public String toString() {
		return "TrainerMemberList [userNum=" + userNum + ", userName=" + userName + ", phone=" + phone + ", count="
				+ count + ", totalCount=" + totalCount + ", trNum=" + trNum + ", payDate=" + payDate + ", chName="
				+ chName + "]";
	}
	
	
}
