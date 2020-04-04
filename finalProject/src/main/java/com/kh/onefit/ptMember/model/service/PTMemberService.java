package com.kh.onefit.ptMember.model.service;


import java.util.ArrayList;

import com.kh.onefit.ptMember.model.vo.PTMember;
import com.kh.onefit.question.model.vo.Question;
import com.kh.onefit.user.model.vo.User;

public interface PTMemberService {

	//PT회원 정보 업데이트
	public int ptUpdateMember(PTMember p);

	//마이s페이지 데이터 가져오기
	public PTMember selectMypage(int userNum);

	// 비밀번호 확인
	public User pwdCheck(int userNum, String pwdChk);

	// pt회원 탈퇴
	public int ptDeleteMember(int userNum);
	
	// 회원관리용 데이터 가져오기
	public ArrayList<PTMember> selectList(int currentPage);


}
