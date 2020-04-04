package com.kh.onefit.train.model.vo;

import java.util.Date;

public class ManagerTrainer {
	private int trNum;		//번호
	private String trId;	//아이디
	private String trPwd;	//비밀번호
	private String trName;	//이름
	private String phone;	//전화번호
	private String email;	//이메일
	private Date enrollDate;//가입일
	private String gender;	//성별
	private Date modifyDate;//정보수정일
	private String carrer;	//경력
	private String status;	//상태
	
	// 일정
	private int scNum;		//일정번호

	private Date scDate;	//날짜
	private Date scStart;	//시작시간
	private Date scEnd;		//종료시간
	private int cate;		//카테고리
	private String content;	//내용
	private int userNum;	//회원번호
	
	//건강정보
	private int height;		//몸무게
	private int weight;		//키
	private int fat;		//체지방
	
	public ManagerTrainer() {}

	public ManagerTrainer(int trNum, String trId, String trPwd, String trName, String phone, String email,
			Date enrollDate, String gender, Date modifyDate, String carrer, String status, int scNum, Date scDate,
			Date scStart, Date scEnd, int cate, String content, int userNum, int height, int weight, int fat) {
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
		this.carrer = carrer;
		this.status = status;
		this.scNum = scNum;
		this.scDate = scDate;
		this.scStart = scStart;
		this.scEnd = scEnd;
		this.cate = cate;
		this.content = content;
		this.userNum = userNum;
		this.height = height;
		this.weight = weight;
		this.fat = fat;
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

	public String getCarrer() {
		return carrer;
	}

	public void setCarrer(String carrer) {
		this.carrer = carrer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	@Override
	public String toString() {
		return "ManagerTrainer [trNum=" + trNum + ", trId=" + trId + ", trPwd=" + trPwd + ", trName=" + trName
				+ ", phone=" + phone + ", email=" + email + ", enrollDate=" + enrollDate + ", gender=" + gender
				+ ", modifyDate=" + modifyDate + ", carrer=" + carrer + ", status=" + status + ", scNum=" + scNum
				+ ", scDate=" + scDate + ", scStart=" + scStart + ", scEnd=" + scEnd + ", cate=" + cate + ", content="
				+ content + ", userNum=" + userNum + ", height=" + height + ", weight=" + weight + ", fat=" + fat + "]";
	}
	
	
}
