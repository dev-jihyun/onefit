package com.kh.onefit.food.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.common.model.vo.PageInfo;
import com.kh.onefit.food.model.vo.Food;
import com.kh.onefit.food.model.vo.MealInfo;
import com.kh.onefit.train.model.vo.TrainerMemberHealth;

@Repository("foodDao")
public class FoodDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertFood(Food food) {
		// TODO Auto-generated method stub
		return sqlSession.insert("foodMapper.insert",food);
	}

	public ArrayList<Food> selectAllFood() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("foodMapper.selectAllFood");
	}

	public int updateFood(Food food) {
		// TODO Auto-generated method stub
		return sqlSession.update("foodMapper.updateFood",food);
	}

	public int deleteFood(int foodNum) {
		// TODO Auto-generated method stub
		return sqlSession.update("foodMapper.deleteFood",foodNum);
	}
	
	
	//pt회원의 식단조회
	public ArrayList<Food> selectList(int userNum) {
		return (ArrayList)sqlSession.selectList("foodMapper.selectList", userNum);
	}

	//pt회원의 회원수를 가져오기 위해서
	public int getListCount(int trNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("foodMapper.getListCount",trNum);
	}

	public ArrayList<TrainerMemberHealth> getMemberList(PageInfo pi, int trNum) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("foodMapper.getMemberList",trNum,rowBounds);
	}

	public Food getFoodInfo(Food check) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("foodMapper.getFoodInfo",check);
	}

	public ArrayList<MealInfo> getMealInfo(int foodNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("foodMapper.getMealInfo",foodNum);
	}

	public int insertMealInfo(MealInfo mi) {
		// TODO Auto-generated method stub
		return sqlSession.insert("foodMapper.insertMealInfo",mi);
	}

	public int updateMealInfo(MealInfo mi) {
		// TODO Auto-generated method stub
		return sqlSession.update("foodMapper.updateMealInfo",mi);
	}

	public int delMeal(int mNum) {
		// TODO Auto-generated method stub
		return sqlSession.delete("foodMapper.delMeal",mNum);
	}

}
