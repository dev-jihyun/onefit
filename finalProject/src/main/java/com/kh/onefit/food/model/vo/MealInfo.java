package com.kh.onefit.food.model.vo;

public class MealInfo {
	private int mNum;
	private int foodNum;
	private String oneMeal;
	private int oneCarbo;
	private int onePro;
	private int oneFat;
	private int cate;
	
	
	public MealInfo() {}

	public MealInfo(int mNum, int foodNum, String oneMeal, int oneCarbo, int onePro, int oneFat, int cate) {
		super();
		this.mNum = mNum;
		this.foodNum = foodNum;
		this.oneMeal = oneMeal;
		this.oneCarbo = oneCarbo;
		this.onePro = onePro;
		this.oneFat = oneFat;
		this.cate = cate;
	}


	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public int getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(int foodNum) {
		this.foodNum = foodNum;
	}

	public String getOneMeal() {
		return oneMeal;
	}

	public void setOneMeal(String oneMeal) {
		this.oneMeal = oneMeal;
	}

	public int getOneCarbo() {
		return oneCarbo;
	}

	public void setOneCarbo(int oneCarbo) {
		this.oneCarbo = oneCarbo;
	}

	public int getOnePro() {
		return onePro;
	}

	public void setOnePro(int onePro) {
		this.onePro = onePro;
	}

	public int getOneFat() {
		return oneFat;
	}

	public void setOneFat(int oneFat) {
		this.oneFat = oneFat;
	}

	public int getCate() {
		return cate;
	}

	public void setCate(int cate) {
		this.cate = cate;
	}
	

	@Override
	public String toString() {
		return "MealInfo [mNum=" + mNum + ", foodNum=" + foodNum + ", oneMeal=" + oneMeal + ", oneCarbo=" + oneCarbo
				+ ", onePro=" + onePro + ", oneFat=" + oneFat + ", cate=" + cate + "]";
	}
}
