package com.kh.onefit.schedule.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onefit.schedule.model.dao.ScheduleDao;
import com.kh.onefit.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao sDao;
	
	@Override
	public ArrayList<Schedule> selectList(int trNum) {
		return sDao.selectList(trNum);
	}
	
	@Override
	public int insertSchedule(Schedule s) {
		return sDao.insertSchedule(s);
	}
	
	@Override
	public int deletePtSchedule(int scNum) {
		return sDao.deleteSchedule(scNum);
	}

	@Override
	public int updatePtSchedule(int scNum) {
		return 0;
	}

	@Override
	public ArrayList<Schedule> selectList2(int trNum) {
		return sDao.selectList2(trNum);
	}




}
