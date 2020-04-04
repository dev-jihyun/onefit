package com.kh.onefit.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.onefit.manager.model.dao.ManagerDao;
import com.kh.onefit.user.model.vo.User;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDao mDao;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public User chkatt(String id, String pwd) {
		User user = mDao.chkatt(id);
		
		//select된 아이디 값은 있으나 비밀번호가 매칭되지 않은경우
		// 앞의 조건이 빠지면 우리가 원하는 MemberException이 아닌
		// nullPointerException이 발생함
		if(user !=null && !bcryptPasswordEncoder.matches(pwd, user.getUserPwd())) {
			user = null;
		}
		
		return user;
	}
	
	
}
