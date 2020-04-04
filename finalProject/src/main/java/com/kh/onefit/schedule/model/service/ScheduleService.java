package com.kh.onefit.schedule.model.service;

import java.util.ArrayList;

import com.kh.onefit.schedule.model.vo.Schedule;

public interface ScheduleService {

	// PT일정 조회(내 트레이너 일정 가져오기)
	ArrayList<Schedule> selectList(int trNum);

	// pt회원의 일정 삭제
	int deletePtSchedule(int scNum);

	// pt회원의 일정 업데이트
	int updatePtSchedule(int scNum);

	// pt회원의 일정 추가
	int insertSchedule(Schedule s);

	ArrayList<Schedule> selectList2(int trNum);


}
