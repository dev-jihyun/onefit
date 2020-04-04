package com.kh.onefit.user.model.service;

import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.payment.model.vo.Payment;
import com.kh.onefit.user.model.vo.User;

public interface UserService {  
	
	// 회원 가입 서비스를 위한 메소드
	public int insertUser(User u);
	    
	// 아이디 중복 체크    
	public int checkIdDup(String id);

	public int getUserNum(String userId);

	public int insertPhoto(Photo photo);
	
	// 회원 탈퇴
	public int deleteUser(int userNum);
	
	// 비밀번호 확인
	public User pwdCheck(int userNum, String pwdChk);
	 
	// 정보수정
	public int userUpdate(User u);
	
	// 정보수정(비밀번호 안바꿀때)
	public int userUpdate1(User u);
	
	// 몸정보 수정
	public int bodyUpdate(User u);
	
	// 몸정보 수정할때 user의 전체 정보 가져오기
	public User selectUser1(int userNum);
	
	// 결제정보 저장
	public int insertPay(Payment p,User loginUser);

	


	

	
 
}
