package com.kh.onefit.food.model.vo;

public class Food {
	private int foodNum;
	private int carbo; // 탄수화물
	private int prot; // 단백질
	private int fat; // 지방
	private String meal; // 끼니
	private String memo; // 조언
	private int userNum; // 회원번호
	private int trainNum; // 트레이너 번호

	public Food() {
	}

	public Food(int userNum, int trainNum) {
		super();
		this.userNum = userNum;
		this.trainNum = trainNum;
	}

	public Food(int foodNum, int carbo, int prot, int fat, String meal, String memo, int userNum, int trainNum) {
		super();
		this.foodNum = foodNum;
		this.carbo = carbo;
		this.prot = prot;
		this.fat = fat;
		this.meal = meal;
		this.memo = memo;
		this.userNum = userNum;
		this.trainNum = trainNum;
	}

	public int getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(int foodNum) {
		this.foodNum = foodNum;
	}

	public int getCarbo() {
		return carbo;
	}

	public void setCarbo(int carbo) {
		this.carbo = carbo;
	}

	public int getProt() {
		return prot;
	}

	public void setProt(int prot) {
		this.prot = prot;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public String getMeal() {
		return meal;
	}

	public void setMeal(String meal) {
		this.meal = meal;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getTrainNum() {
		return trainNum;
	}

	public void setTrainNum(int trainNum) {
		this.trainNum = trainNum;
	}

	@Override
	public String toString() {
		return "Food [foodNum=" + foodNum + ", carbo=" + carbo + ", prot=" + prot + ", fat=" + fat + ", meal=" + meal
				+ ", memo=" + memo + ", userNum=" + userNum + ", trainNum=" + trainNum + "]";
	}

}
