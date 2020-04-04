package com.kh.onefit.health.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.health.model.vo.Health;

@Repository("hDao")
public class HealthDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원 건강 정보 조회
	public Health selectHealth(int userNum) {
		return sqlSession.selectOne("healthMapper.selectHealth", userNum);
	}	
	
	//건강 정보 업데이트
	public int updateHealth(Health healthInfo) {
		return sqlSession.update("healthMapper.updateHealth", healthInfo);
	}

	public int insertTrainerHealth(Health health) {
		// TODO Auto-generated method stub
		return sqlSession.insert("healthMapper.insertTrainerHealth",health);
	}

	public int updateTrainerHealth(Health health) {
		// TODO Auto-generated method stub
		return sqlSession.update("healthMapper.updateTrainerHealth",health);
	}

	public Health selectTrainerHealth(int trNum) {
		return sqlSession.selectOne("healthMapper.selectTrainerHealth", trNum);
	}


}
