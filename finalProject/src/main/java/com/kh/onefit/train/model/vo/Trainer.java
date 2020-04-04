package com.kh.onefit.train.model.vo;

import java.sql.Date;

public class Trainer {
	private int trNum;
	private String trId;
	private String trPwd;
	private String trName;
	private String phone;
	private String email;
	private Date enrollDate;
	private String gender;
	private Date modifyDate;
	private String career;
	private String status;
	
	public Trainer() { }

	public Trainer(String trId, String trPwd) {
		super();
		this.trId = trId;
		this.trPwd = trPwd;
	}

	public Trainer(int trNum, String trId, String trPwd, String trName, String phone, String email, Date enrollDate,
			String gender, Date modifyDate, String career, String status) {
		super();
		this.trNum = trNum;
		this.trId = trId;
		this.trPwd = trPwd;
		this.trName = trName;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.gender = gender;
		this.modifyDate = modifyDate;
		this.career = career;
		this.status = status;
	}

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}

	public String getTrId() {
		return trId;
	}

	public void setTrId(String trId) {
		this.trId = trId;
	}

	public String getTrPwd() {
		return trPwd;
	}

	public void setTrPwd(String trPwd) {
		this.trPwd = trPwd;
	}

	public String getTrName() {
		return trName;
	}

	public void setTrName(String trName) {
		this.trName = trName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Trainer [trNum=" + trNum + ", trId=" + trId + ", trPwd=" + trPwd + ", trName=" + trName + ", phone="
				+ phone + ", email=" + email + ", enrollDate=" + enrollDate + ", gender=" + gender + ", modifyDate="
				+ modifyDate + ", career=" + career + ", status=" + status + "]";
	}
	
}
