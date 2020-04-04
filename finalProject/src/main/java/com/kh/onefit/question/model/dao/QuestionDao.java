package com.kh.onefit.question.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.common.model.vo.PageInfo;
import com.kh.onefit.common.model.vo.Search;
import com.kh.onefit.question.model.vo.Question;

@Repository
public class QuestionDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Question> selectList(PageInfo pi, int userNum) {
		
		// 마이바티스에서 페이징처리는 RowBounds를 이용
				int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
				RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		if(userNum == 0) {
			//관리자용 리스트 cate=1인거 가져오기
			return (ArrayList)sqlSession.selectList("questionMapper.selectList", null, rowBounds);
			
		}else {
			//일반회원용 리스트 내글만 가져오기
			return (ArrayList)sqlSession.selectList("questionMapper.selectUserQnaList", userNum, rowBounds);
		}
	}

	public int insertQuestion(Question q) {
		return sqlSession.insert("questionMapper.insertQuestion", q);
	}

	//글하나 조회
	public Question selectQuestion(int askNum) {
		return sqlSession.selectOne("questionMapper.selectOne", askNum);
	}

	public ArrayList<Question> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("questionMapper.searchList", search);
	}

	public int deleteQuestion(int askNum) {
		return sqlSession.delete("questionMapper.deleteOne", askNum);
	}
	
	public int insertAswer(Question q) {
		return sqlSession.update("questionMapper.deleteOne", q);
	}


	public int getListCount() {
		return sqlSession.selectOne("questionMapper.getListCount");
	}

	public String selectTrainer(int trNum) {
		return sqlSession.selectOne("questionMapper.selectTrainer", trNum);
	}

	public int updateReply(String reply, int num) {
		HashMap<String, Integer> ha = new HashMap<>();
		ha.put(reply,num);
		return sqlSession.update("questionMapper.updateReply",ha);
	}

	public int updateReply2(Question q) {
		System.out.println("question의 updateReply2: "+ q);
		return sqlSession.update("questionMapper.updateReply2",q);
	}

	public int updateQuestion(Question q) {
		return sqlSession.update("questionMapper.updateQuestion",q);
	}


	
}
