package com.kh.onefit.excercise.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.excercise.model.vo.Excercise;
import com.kh.onefit.excercise.model.vo.ExcerciseContent;
import com.kh.onefit.user.model.vo.User;
@Repository("excerciseDao")
public class ExcerciseDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	//Excercise 입력을 하거나 수정
	public int insertExcercise(Excercise excercise) {
		// TODO Auto-generated method stub
		return sqlSession.update("excerciseMapper.insertExcercise",excercise);
	}
	//Excercise 수정
	public int updateExcercise(Excercise excercise) {
		// TODO Auto-generated method stub
		return sqlSession.update("excerciseMapper.updateExcercise",excercise);
	}

	public Excercise getExcercise(Excercise excer) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("excerciseMapper.getExcercise",excer);
	}

	public ArrayList<ExcerciseContent> getExcerciseContent(int jrNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("excerciseMapper.getExcerciseContent",jrNum);
	}

	//운동 종목을 입력을 하거나 업데이트 하는 부분
	public int insertExcerciseContent(ExcerciseContent exc) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("excerciseMapper.insertExcerciseContent",exc);
	}

	public int decCount(int userNum) {
		// TODO Auto-generated method stub
		return sqlSession.update("excerciseMapper.decCount",userNum);
	}

	public ArrayList<User> getDelMember() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("excerciseMapper.getDelMember");
	}

	public int updateDate(List<User> delMember) {
		// TODO Auto-generated method stub
		return sqlSession.update("excerciseMapper.updateDate",delMember);
	}

	public int delPt() {
		// TODO Auto-generated method stub
		return sqlSession.delete("excerciseMapper.delPt");
	}
	public int updateExcerContent(ExcerciseContent exlist) {
		// TODO Auto-generated method stub
		return sqlSession.update("excerciseMapper.updateExcerContent",exlist);
	}
	public int delExcontent(int exNum) {
		// TODO Auto-generated method stub
		return sqlSession.delete("excerciseMapper.delExcontent",exNum);
	}
	
	//pt회원의 운동일지 조회
	public ArrayList<Excercise> selectPtExerciseList(int userNum) {
		return (ArrayList)sqlSession.selectList("excerciseMapper.selectList", userNum);
	}
	public ArrayList<Excercise> selectPtExercise(int jrNum) {
		return (ArrayList)sqlSession.selectOne("excerciseMapper.selectPtExcercise", jrNum);
	}

}
