package com.kh.onefit.food.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onefit.common.model.vo.PageInfo;
import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.food.model.dao.FoodDao;
import com.kh.onefit.food.model.vo.Food;
import com.kh.onefit.food.model.vo.MealInfo;
import com.kh.onefit.train.model.vo.TrainerMemberHealth;

@Service("foodService")
public class FoodServiceImpl implements FoodService{

	@Autowired
	private FoodDao foodDao;
	
	//식단 정보 입력
	@Override
	public int insertFood(Food food) {
		// TODO Auto-generated method stub
		return foodDao.insertFood(food);
	}

	@Override
	public int updateFood(Food food) {
		// TODO Auto-generated method stub
		return foodDao.updateFood(food);
	}

	@Override
	public int deleteFood(int foodNum) {
		// TODO Auto-generated method stub
		return foodDao.deleteFood(foodNum);
	}

	@Override
	public ArrayList<Food> selectAllFood() {
		// TODO Auto-generated method stub
		return foodDao.selectAllFood();
	}

	//pt회원의 식단 출력
	@Override
	public ArrayList<Food> selectList(int userNum) {
		return foodDao.selectList(userNum);
	}
	
	//pt회원의 건강정보를 가져오기 위해서
	@Override
	public ArrayList<TrainerMemberHealth> getMemberHealth(int trNum, int currentPage) {
		// TODO Auto-generated method stub
		//몇개 있는지 세기 위해서
		int listCount = foodDao.getListCount(trNum); //해당 트레이너의 총 회원수를 가져오는 부분
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return foodDao.getMemberList(pi,trNum);
	}

	//회원의 식단정보를 불러오기 위해서
	@Override
	public Food getFoodInfo(Food check) {
		// TODO Auto-generated method stub
		return foodDao.getFoodInfo(check);
	}
	
	//회원의 식단 정보를 불러오기 윟새ㅓ
	@Override
	public ArrayList<MealInfo> getMealInfo(int foodNum) {
		// TODO Auto-generated method stub
		return foodDao.getMealInfo(foodNum);
	}
	//끼니 정보를 입력하기 위해서
	@Override
	public int insertMealInfo(MealInfo mi) {
		// TODO Auto-generated method stub
		return foodDao.insertMealInfo(mi);
	}
	
	//끼니 정보 수정하기 위해서
	@Override
	public int updateMealInfo(MealInfo mi) {
		// TODO Auto-generated method stub
		return foodDao.updateMealInfo(mi);
	}
	
	//끼니 정보를 삭제하기 위해
	@Override
	public int delMeal(int mNum) {
		// TODO Auto-generated method stub
		return foodDao.delMeal(mNum);
	}
}
