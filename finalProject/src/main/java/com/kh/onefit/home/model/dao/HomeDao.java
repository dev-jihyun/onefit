package com.kh.onefit.home.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.user.model.vo.User;

@Repository("homeDao")
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public User loginUser(User Check) { //user를 체크하는 부분
		// TODO Auto-generated method stub
		return sqlSession.selectOne("homeMapper.loginUser",Check);
	}

	public Trainer loginTrainer(Trainer checkTrainer) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("homeMapper.loginTrainer",checkTrainer);
	}

	//로그인 완료 시 로그인 날짜업데이트 메소드
	public int updateLoginDate(int userNum) {
		return sqlSession.update("homeMapper.updateLoginDate",userNum);
	}

}
