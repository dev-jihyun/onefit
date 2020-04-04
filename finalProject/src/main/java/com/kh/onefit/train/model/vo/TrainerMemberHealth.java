package com.kh.onefit.train.model.vo;

import java.sql.Date;

public class TrainerMemberHealth {
	private int userNum;
	private String chName;
	private String userName;
	private Date birth;
	private String gender;
	private int height;
	private int weight;
	private int fat;
	private int goal;
	private String reason;
	private int count;
	private int totalCount;
	private Date checkDate;
	private int trNum;
	private int age;
	
	public TrainerMemberHealth() {}

	public TrainerMemberHealth(int userNum, String chName, String userName, Date birth, String gender, int height,
			int weight, int fat, int goal, String reason, int count, int totalCount, Date checkDate, int trNum,
			int age) {
		super();
		this.userNum = userNum;
		this.chName = chName;
		this.userName = userName;
		this.birth = birth;
		this.gender = gender;
		this.height = height;
		this.weight = weight;
		this.fat = fat;
		this.goal = goal;
		this.reason = reason;
		this.count = count;
		this.totalCount = totalCount;
		this.checkDate = checkDate;
		this.trNum = trNum;
		this.age = age;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getChName() {
		return chName;
	}

	public void setChName(String chName) {
		this.chName = chName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}
	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "TrainerMemberHealth [userNum=" + userNum + ", chName=" + chName + ", userName=" + userName + ", birth="
				+ birth + ", height=" + height + ", weight=" + weight + ", goal=" + goal + ", totalCount=" + totalCount
				+ ", checkDate=" + checkDate + ", trNum=" + trNum + ", age=" + age+", fat=" + fat+", reason=" + reason+
				", count=" + count+", gender=" + gender+"]";
	}
	
	
	
	
	
}
