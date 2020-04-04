package com.kh.onefit.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.schedule.model.vo.Schedule;

@Repository("sDao")
public class ScheduleDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// PT일정 조회(내 트레이너 일정 가져오기)
	public ArrayList<Schedule> selectList(int trNum) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectList", trNum);
	}
	
	// PT일정 예약
	public int insertSchedule(Schedule s) {
		return sqlSession.insert("scheduleMapper.insertSchedule", s);
	}
	
	// pt일정 변경
	public int updateSchedule(int scNum) {
		return sqlSession.update("scheduleMapper.updateSchedule", scNum);
	}
	
	// pt일정 삭제
	public int deleteSchedule(int scNum) {
		return sqlSession.update("scheduleMapper.deleteSchedule", scNum);
	}

	public ArrayList<Schedule> selectList2(int trNum) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectList2", trNum);
	}


}
