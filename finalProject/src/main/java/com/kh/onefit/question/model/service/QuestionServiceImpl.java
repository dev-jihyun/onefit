package com.kh.onefit.question.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onefit.common.model.vo.PageInfo;
import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.common.model.vo.Search;
import com.kh.onefit.question.model.dao.QuestionDao;
import com.kh.onefit.question.model.vo.Question;
import com.kh.onefit.train.model.vo.Trainer;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDao qDao;
	
	@Override
	public ArrayList<Question> selectList(int currentPage, int userNum) {
		// 1. 게시글 개수 조회
		int listCount = qDao.getListCount();
		
		// 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
		// 2. 게시글 리스트 조회
		return qDao.selectList(pi, userNum);
	}

	@Override
	public int insertQuestion(Question q) {
		return qDao.insertQuestion(q);
	}

	@Override
	public Question selectQuestion(int askNum) {
		return qDao.selectQuestion(askNum);
	}

	@Override
	public int updateQuestion(Question q) {
		return qDao.updateQuestion(q);
	}

	@Override
	public int deleteQuestion(int askNum) {
		return qDao.deleteQuestion(askNum);
	}

	@Override
	public int updateAnswer(Question q) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Question> searchList(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectTrainer(int writer) {
		return qDao.selectTrainer(writer);
	}

	@Override
	public int updateReply2(Question q) {
		return qDao.updateReply2(q);
	}


}
