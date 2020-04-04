package com.kh.onefit.manager.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.user.model.vo.User;

@Repository
public class ManagerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public User chkatt(String id) {
		
		return sqlSession.selectOne("managerMapper.chkatt",id);
	}

	
}
