package com.kh.onefit.user.model.vo;

import java.util.Date;

public class User {   
	private int userNum; // 1회원번호
	private String userId; // 2일반회원 아이디
	private String userPwd; // 3일반회원 비밀번호
	private String userName; // 4일반회원 이름
	private String phone; // 5일반회원 전화번호        
	private String birth; // 6일반회원 생년월일 문자열 형식
	private Date birthDate; //6-5생년 월일 Date 형식
	private String email; // 7일반회원 이메일
	private Date enrollDate; // 8일반회원 가입일
	private String gender; // 9성별
	private Date modifyDate; // 10일반회원 정보수정일
	private Date loginDate; // 11일반회원 마지막 로그인
	private Date startDate; // 12일반회원 시작날짜
	private Date endDate; // 13일반회원 종료날짜
	private int status; // 14상태 
	private int age; // 15나이
	private int day; // 남은 일수
	
	// 건강정보
	private int healthNum;// 16건강정보 번호
	private int height;// 17키
	private int weight;// 18몸무게
	private int fat;// 19체지방
	private int goal;// 20목표체중
	private String reason;// 21운동 목적
	private Date checkDate;// 22몸무게체크일
	
	//사진
	private int photoNum; //23
	private String orgName; //24
	private String chName;//25
	private int cate;//26
	private int numbs;//27
	
	// PT, 트레이너 정보
	private int trNum;// 28. 트레이너 번호
	private int count;// 29. PT횟수
	private int totalCount;// 30총 PT횟수
	private String trName;//31트레이너 이름
	private String trGender; // 32.트레이너 성별
	
	public User() { }

	public User(int userNum, String userId, String userPwd, String userName, String phone, String birth, Date birthDate,
			String email, Date enrollDate, String gender, Date modifyDate, Date loginDate, Date startDate, Date endDate,
			int status, int age, int healthNum, int height, int weight, int fat, int goal, String reason,
			Date checkDate, int photoNum, String orgName, String chName, int cate, int numbs, int trNum, int count,
			int totalCount, String trName, String trGender) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.birth = birth;
		this.birthDate = birthDate;
		this.email = email;
		this.enrollDate = enrollDate;
		this.gender = gender;
		this.modifyDate = modifyDate;
		this.loginDate = loginDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.age = age;
		this.healthNum = healthNum;
		this.height = height;
		this.weight = weight;
		this.fat = fat;
		this.goal = goal;
		this.reason = reason;
		this.checkDate = checkDate;
		this.photoNum = photoNum;
		this.orgName = orgName;
		this.chName = chName;
		this.cate = cate;
		this.numbs = numbs;
		this.trNum = trNum;
		this.count = count;
		this.totalCount = totalCount;
		this.trName = trName;
		this.trGender = trGender;
	}



	public User(int userNum, String userId, String userPwd, String userName, String phone, String birth, Date birthDate,
			String email, Date enrollDate, String gender, Date modifyDate, Date loginDate, Date startDate, Date endDate,
			int status, int age, int healthNum, int height, int weight, int fat, int goal, String reason,
			Date checkDate, int photoNum, String orgName, String chName, int cate, int numbs) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.birth = birth;
		this.birthDate = birthDate;
		this.email = email;
		this.enrollDate = enrollDate;
		this.gender = gender;
		this.modifyDate = modifyDate;
		this.loginDate = loginDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.age = age;
		this.healthNum = healthNum;
		this.height = height;
		this.weight = weight;
		this.fat = fat;
		this.goal = goal;
		this.reason = reason;
		this.checkDate = checkDate;
		this.photoNum = photoNum;
		this.orgName = orgName;
		this.chName = chName;
		this.cate = cate;
		this.numbs = numbs;
	}







	public User(int userNum, String userId, String userPwd, String userName, String phone, String birth, String email,
			Date enrollDate, String gender, Date modifyDate, Date loginDate, Date startDate, Date endDate, int status) {
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
	}

	public User(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}

	//jsp에서 입력 받기 위해서 만든 생성자
	public User(int userNum, String userId, String userPwd, String userName, String phone, String email,
			String gender, int status) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.status = status;
	}

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

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public int getNumbs() {
		return numbs;
	}

	public void setNumbs(int numbs) {
		this.numbs = numbs;
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

	public String getTrGender() {
		return trGender;
	}

	public void setTrGender(String trGender) {
		this.trGender = trGender;
	}

	@Override
	public String toString() {
		return "User [userNum=" + userNum + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", birth=" + birth + ", birthDate=" + birthDate + ", email=" + email
				+ ", enrollDate=" + enrollDate + ", gender=" + gender + ", modifyDate=" + modifyDate + ", loginDate="
				+ loginDate + ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status + ", age="
				+ age + ", healthNum=" + healthNum + ", height=" + height + ", weight=" + weight + ", fat=" + fat
				+ ", goal=" + goal + ", reason=" + reason + ", checkDate=" + checkDate + ", photoNum=" + photoNum
				+ ", orgName=" + orgName + ", chName=" + chName + ", cate=" + cate + ", numbs=" + numbs + ", trNum="
				+ trNum + ", count=" + count + ", totalCount=" + totalCount + ", trName=" + trName + ", trGender="
				+ trGender + "]";
	}

}