package com.kh.onefit.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.payment.model.vo.Payment;
import com.kh.onefit.user.model.dao.UserDao;
import com.kh.onefit.user.model.vo.User;


@Service("uService")  
public class UserServiceImpl implements UserService{
	// 암호화 처리하는 곳
	@Autowired    
	private BCryptPasswordEncoder bcryptPasswordEncoder;     
	
	@Autowired
	private UserDao uDao;
	
	//회원가입을 위한 메소드
	@Override
	public int insertUser(User u) {
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		
		u.setUserPwd(encPwd);
		
		return uDao.insertUser(u);
	}
	
	//아이디 중복 확인을 위한 메소드
	@Override
	public int checkIdDup(String id) {
		return uDao.checkIdDup(id);
	}

	//회원의 회원번호를 가져오기 위한 메소드
	@Override
	public int getUserNum(String userId) {
		// TODO Auto-generated method stub
		return uDao.getUserNum(userId);
	}

	@Override
	public int insertPhoto(Photo photo) {
		// TODO Auto-generated method stub
		return uDao.insertPhoto(photo);
	}
	
	// 회원탈퇴
	@Override
	public int deleteUser(int userNum) {
		return uDao.deleteUser(userNum);
	}
	
	
	// 비밀번호 확인
	@Override
	public User pwdCheck(int userNum, String pwdChk) {
		System.out.println("------userServiceImpl------");
		System.out.println("pwdCheck");
		System.out.println("userNum : " + userNum + " / pwdChk" + pwdChk);
		System.out.println("");
		
		User loginUser = uDao.selectUser(userNum);
		
		//select된 아이디 값은 있으나 비밀번호가 매칭되지 않은경우
		// 앞의 조건이 빠지면 우리가 원하는 MemberException이 아닌
		// nullPointerException이 발생함
		if(loginUser !=null && !bcryptPasswordEncoder.matches(pwdChk, loginUser.getUserPwd())) {
			loginUser = null;//비밀번호가 틀린경우.
			System.out.println("비밀번호 틀림");
		}
		
		return loginUser;
	}

	
	// user정보수정(비밀번호 입력 했을 때)
	@Override
	public int userUpdate(User u) {
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		u.setUserPwd(encPwd);
		
		return uDao.userUpdate(u);

	}
	
	//user정보 수정(비밀번호 입력 안했을 때)
	@Override
	public int userUpdate1(User u) {
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		u.setUserPwd(encPwd);
		
		return uDao.userUpdate1(u);
	}
	
	// 몸정보 수정
	@Override
	public int bodyUpdate(User u) {
		return uDao.bodyUpdate(u);
	}
	
	// 몸정보 수정할때 필요한 user 정보
	@Override
	public User selectUser1(int userNum) {
		return uDao.selectUser1(userNum);
	}
	
	// 결제 정보 저장
	@Override
	public int insertPay(Payment p,User loginUser) {
		return uDao.insertPay(p); 
	}


	
	

}
