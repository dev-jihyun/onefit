package com.kh.onefit.attendence.model.service;

import java.util.ArrayList;

import com.kh.onefit.attendence.model.vo.Attendence;
import com.kh.onefit.user.model.vo.User;

public interface AttendenceService {

	ArrayList<Attendence> selectList(User u);

	int insertAtt(int userNum);

}    
