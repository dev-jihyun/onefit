package com.kh.onefit.health.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onefit.health.model.dao.HealthDao;
import com.kh.onefit.health.model.vo.Health;


@Service("hService")
public class HealthServiceImpl implements HealthService{
	
	@Autowired
	private HealthDao hDao;
	
	
	//회원 건강정보 조회하기
	@Override
	public Health selectHealth(int userNum) {
		return hDao.selectHealth(userNum);
	}
	
	@Override
	public int updateHealth(Health healthInfo) {
		return hDao.updateHealth(healthInfo);
	}
	
	//트레이너의 건강정보를 입력하기 위해
	@Override
	public int insertTrainerHealth(Health health) {
		// TODO Auto-generated method stub
		return hDao.insertTrainerHealth(health);
	}
	
	//트레이너의 건강정보를 수정하기 위해
	@Override
	public int updateTrainerHealth(Health health) {
		// TODO Auto-generated method stub
		return hDao.updateTrainerHealth(health);
	}

	@Override
	public Health selectTrainerHealth(int trNum) {
		// TODO Auto-generated method stub
		return hDao.selectTrainerHealth(trNum);
	}


}
