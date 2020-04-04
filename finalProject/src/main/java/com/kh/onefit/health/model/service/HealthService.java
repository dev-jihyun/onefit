package com.kh.onefit.health.model.service;

import com.kh.onefit.health.model.vo.Health;

public interface HealthService {

	//회원의 건강 정보 조회해오기
	public Health selectHealth(int userNum);
	
	//회원의 건강정보 업데이트
	public int updateHealth(Health healthInfo);

	public int insertTrainerHealth(Health health);

	public int updateTrainerHealth(Health health);

	public Health selectTrainerHealth(int trNum);

}
