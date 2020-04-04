package com.kh.onefit.attendence.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onefit.attendence.model.dao.AttendenceDao;
import com.kh.onefit.attendence.model.vo.Attendence;
import com.kh.onefit.excercise.model.dao.ExcerciseDao;
import com.kh.onefit.user.model.vo.User;

@Service("AttendenceService")
public class AttendenceServiceImpl implements AttendenceService {
	
	@Autowired
	private AttendenceDao attendenceDao;

	@Override
	public ArrayList<Attendence> selectList(User u) {
		return attendenceDao.selectList(u);
	}

	@Override
	public int insertAtt(int userNum) {
		return attendenceDao.insertAtt(userNum);
	}   
	
	
	
	
	

}
