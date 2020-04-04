package com.kh.onefit.ptMember.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.ptMember.model.vo.PTMember;
import com.kh.onefit.user.model.vo.User;

@Repository("ptDao")
public class PTMemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession; // root-context에서 작성한 bean으로 생성된다.

	public int ptUpdateMember(PTMember p) {
		return sqlSession.update("ptMapper.ptUpdateMember", p);
	}

	public PTMember selectMypage(int userNum) {
		return sqlSession.selectOne("ptMapper.selectMypage", userNum);
	}

	// 마이페이지에서 비번확인용 메소드
	public User selectUser(int userNum) {
		return sqlSession.selectOne("ptMapper.selectUser", userNum);
	}

	// 회원관리 회원정보
	public ArrayList<PTMember> selectList(int currentPage) {
		return (ArrayList)sqlSession.selectList("ptMapper.selectList");
	}



}
