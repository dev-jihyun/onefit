package com.kh.onefit.food.model.service;

import java.util.ArrayList;

import com.kh.onefit.food.model.vo.Food;
import com.kh.onefit.food.model.vo.MealInfo;
import com.kh.onefit.train.model.vo.TrainerMemberHealth;

public interface FoodService {
	
	public int insertFood(Food food); //식단 추천 저장	
	
	public int updateFood(Food food); //식단 추천 수정
	
	public int deleteFood(int foodNum); // 식단 삭제
	
	public ArrayList<Food> selectAllFood(); //식단 출력

	//pt회원 식단 출력
	public ArrayList<Food> selectList(int userNum);

	public ArrayList<TrainerMemberHealth> getMemberHealth(int trNum, int currentPage);

	public Food getFoodInfo(Food check);

	public ArrayList<MealInfo> getMealInfo(int foodNum);

	public int insertMealInfo(MealInfo mi);

	public int updateMealInfo(MealInfo mi);

	public int delMeal(int mNum);
}
