package com.kh.onefit.health.model.vo;

import java.util.Date;

public class Health {
	private int healthNum;//건강정보테이블 고유번호
	private int userNum;//회원번호
	private int height;//키
	private int weight;//몸무게
	private int fat;//체지방량
	private int goal;//목표체중
	private String reason;//운동목적
	private Date checkDate;//건강정보 체크일
	private int cate;
	
	public Health() {}

	public Health(int healthNum, int userNum, int height, int weight, int fat, int goal, String reason,
			Date checkDate,int cate) {
		super();
		this.healthNum = healthNum;
		this.userNum = userNum;
		this.height = height;
		this.weight = weight;
		this.fat = fat;
		this.goal = goal;
		this.reason = reason;
		this.checkDate = checkDate;
		this.cate = cate;
	}

	
	
	public int getCate() {
		return cate;
	}

	public void setCate(int cate) {
		this.cate = cate;
	}

	public int getHealthNum() {
		return healthNum;
	}

	public void setHealthNum(int healthNum) {
		this.healthNum = healthNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
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

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	@Override
	public String toString() {
		return "Health [healthNum=" + healthNum + ", userNum=" + userNum + ", height=" + height + ", weight=" + weight
				+ ", fat=" + fat + ", goal=" + goal + ", reason=" + reason + ", checkDate=" + checkDate + ", cate="+cate+"]";
	}
	
	
}
