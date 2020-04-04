package com.kh.onefit.ptMember.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.onefit.ptMember.model.dao.PTMemberDao;
import com.kh.onefit.ptMember.model.vo.PTMember;
import com.kh.onefit.user.model.dao.UserDao;
import com.kh.onefit.user.model.vo.User;

@Service("ptService")
public class PTMemberServiceImpl implements PTMemberService{

	@Autowired
	private PTMemberDao ptDao;

	@Autowired
	private UserDao uDao;
	
	//비번확인용
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 정보 수정
	@Override
	public int ptUpdateMember(PTMember p) {
		return ptDao.ptUpdateMember(p);
	}

	// 조회
	@Override
	public PTMember selectMypage(int userNum) {
		return ptDao.selectMypage(userNum);
	}

	//비밀번호 확인
	@Override
	public User pwdCheck(int userNum, String pwdChk) {
		System.out.println("------ptMemberServiceImpl------");
		System.out.println("userNum : " + userNum);
		System.out.println("pwdChk : " + pwdChk);
		
		User loginUser = ptDao.selectUser(userNum);
		System.out.println("DB에서 가져온 user : " + loginUser);
		
		//select된 아이디 값은 있으나 비밀번호가 매칭되지 않은경우
		// 앞의 조건이 빠지면 우리가 원하는 MemberException이 아닌
		// nullPointerException이 발생함
		if(loginUser !=null && !bcryptPasswordEncoder.matches(pwdChk, loginUser.getUserPwd())) {
			loginUser = null;//비밀번호가 틀린경우.
			System.out.println("비번 틀렸덩");
		}
		System.out.println("그래서  최종적으로 리턴할 loginUser 뭐야 : " + loginUser);
		
		return loginUser;
		
	}

	@Override
	public int ptDeleteMember(int userNum) {
		System.out.println("------ptMemberServiceImpl------");
		System.out.println("[ptDeleteMember] 탈퇴하기");
		System.out.println("userNum : " + userNum);
		/*return ptDao.ptDeleteMember(userNum);*/
		return 0;
	}

	@Override
	public ArrayList<PTMember> selectList(int currentPage) {
		return ptDao.selectList(currentPage);
	}
}
