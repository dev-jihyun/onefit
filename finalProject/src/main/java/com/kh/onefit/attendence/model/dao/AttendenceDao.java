package com.kh.onefit.attendence.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.attendence.model.vo.Attendence;
import com.kh.onefit.user.model.vo.User;

@Repository("AttendenceDao")
public class AttendenceDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Attendence> selectList(User u) {
		return (ArrayList)sqlSession.selectList("attendenceMapper.selectList",u);
	}

	public int insertAtt(int userNum) {
		return sqlSession.insert("attendenceMapper.insertAtt",userNum);
	}    

}
