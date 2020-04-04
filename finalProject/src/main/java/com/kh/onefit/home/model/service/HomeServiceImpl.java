package com.kh.onefit.home.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.onefit.home.model.dao.HomeDao;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.user.model.vo.User;

@Service("homeService")
public class HomeServiceImpl implements HomeService{
	@Autowired
	private HomeDao hDao;
	
	// 암호화 처리 위해
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public User loginUser(User Check) {
		User loginUser = hDao.loginUser(Check);
		//select된 아이디 값은 있으나 비밀번호가 매칭되지 않은경우
		// 앞의 조건이 빠지면 우리가 원하는 MemberException이 아닌
		// nullPointerException이 발생함
		System.out.println(loginUser);
		User u = null;
		if(loginUser != null && !bcryptPasswordEncoder.matches(Check.getUserPwd(), loginUser.getUserPwd())) {
			loginUser = null;
		}
		if(loginUser !=null && bcryptPasswordEncoder.matches(Check.getUserPwd(), loginUser.getUserPwd())) {
			int result = hDao.updateLoginDate(loginUser.getUserNum());
			//바뀐 로그인데이트로 업데이트할 것.
			u = new User();
			//다시 셀렉해올 것.
			System.out.println("로그인데이트 업데이트.");
			u=hDao.loginUser(Check);
		}
		
		return u;
	}

	@Override
	public Trainer loginTrainer(Trainer checkTrainer) {
		// TODO Auto-generated method stub
		return hDao.loginTrainer(checkTrainer);
	}
	
}
