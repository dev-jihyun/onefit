package com.kh.onefit.ptMember.model.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PTMember {
	private int userNum; // 1회원 번호
	private String userId; // 2일반회원 아이디
	private String userPwd; // 3일반회원 비밀번호
	private String userName; // 4일반회원 이름
	private String phone; // 5일반회원 전화번호
	private String birth; // 6일반회원 생년월일
	private String email; // 7일반회원 이메일
	private Date enrollDate; // 8일반회원 가입일
	private String gender; // 9성별
	private Date modifyDate; // 10일반회원 정보수정일
	private Date loginDate; // 11일반회원 마지막 로그인
	private Date startDate; // 12일반회원 시작날짜
	private Date endDate; // 13일반회원 종료날짜
	private int status; // 14상태
	
	// 건강정보
	private int healthNum;// 15건강정보 번호
	private int height;// 16키
	private int weight;// 17몸무게
	private int fat;// 18체지방
	private int goal;// 19목표체중
	private String reason;// 20운동 목적
	private Date checkDate;// 21몸무게체크일
	
	// PT, 트레이너 정보
	private int trNum;// 22. 트레이너 번호
	private int count;// 23. PT횟수
	private int totalCount;// 총 PT횟수
	private String trName;//24트레이너 이름
	private String trGender; // 25.트레이너 성별
	private int recount;	// 잔여 pt 횟수
	
	//사진
	private int photoNum; //27
	private String orgName; //28
		
	public PTMember() {}

	


	public PTMember(int userNum, String userId, String userPwd, String userName, String phone, String birth,
			String email, Date enrollDate, String gender, Date modifyDate, Date loginDate, Date startDate, Date endDate,
			int status, int healthNum, int height, int weight, int fat, int goal, String reason,
			Date checkDate, int trNum, int count, int totalCount, String trName, String trGender, int recount,
			int photoNum, String orgName, String chName, int cate) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.enrollDate = enrollDate;
		this.gender = gender;
		this.modifyDate = modifyDate;
		this.loginDate = loginDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		
		this.healthNum = healthNum;
		this.height = height;
		this.weight = weight;
		this.fat = fat;
		this.goal = goal;
		this.reason = reason;
		this.checkDate = checkDate;
		this.trNum = trNum;
		this.count = count;
		this.totalCount = totalCount;
		this.trName = trName;
		this.trGender = trGender;
		this.recount = recount;
		this.photoNum = photoNum;
		this.orgName = orgName;
		this.chName = chName;
		this.cate = cate;
	}

	public int getRecount() {
		int result = totalCount-count;
		return result;
	}


	public void setRecount(int recount) {
		this.recount = recount;
	}


	public String getTrGender() {
		return trGender;
	}


	public void setTrGender(String trGender) {
		this.trGender = trGender;
	}


	private String chName;//29
	private int cate;//30
	
	
	public int getUserNum() {
		return userNum;
	}


	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
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


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
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


	public Date getLoginDate() {
		return loginDate;
	}


	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getHealthNum() {
		return healthNum;
	}


	public void setHealthNum(int healthNum) {
		this.healthNum = healthNum;
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


	public String getTrName() {
		return trName;
	}


	public void setTrName(String trName) {
		this.trName = trName;
	}


	public int getPhotoNum() {
		return photoNum;
	}


	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}


	public String getOrgName() {
		return orgName;
	}


	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}


	public String getChName() {
		return chName;
	}


	public void setChName(String chName) {
		this.chName = chName;
	}


	public int getCate() {
		return cate;
	}


	public void setCate(int cate) {
		this.cate = cate;
	}


	@Override
	public String toString() {
		return "PTMember [userNum=" + userNum + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", birth=" + birth + ", email=" + email + ", enrollDate=" + enrollDate
				+ ", gender=" + gender + ", modifyDate=" + modifyDate + ", loginDate=" + loginDate + ", startDate="
				+ startDate + ", endDate=" + endDate + ", status=" + status +  ", healthNum="
				+ healthNum + ", height=" + height + ", weight=" + weight + ", fat=" + fat + ", goal=" + goal
				+ ", reason=" + reason + ", checkDate=" + checkDate + ", trNum=" + trNum + ", count=" + count
				+ ", totalCount=" + totalCount + ", trName=" + trName + ", trGender=" + trGender + ", recount="
				+ recount + ", photoNum=" + photoNum + ", orgName=" + orgName + ", chName=" + chName + ", cate=" + cate
				+ "]";
	}

	
}
