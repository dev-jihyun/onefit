package com.kh.onefit.question.model.service;

import java.util.ArrayList;

import com.kh.onefit.common.model.vo.Search;
import com.kh.onefit.question.model.vo.Question;
import com.kh.onefit.train.model.vo.Trainer;

public interface QuestionService {

	
	// 1. 게시판 전체 조회
	ArrayList<Question> selectList(int currentPage, int i);
	
	// 2. 게시판 글쓰기
	int insertQuestion(Question q);
	
	// 3. 게시글 상세 -> 조회수 증가 방지
	Question selectQuestion(int askNum);
	
	// 4. 게시판 수정
	int updateQuestion(Question q);
	
	// 5. 게시판 삭제
	int deleteQuestion(int askNum);
	
	// 6. 답변 추가
	int updateAnswer(Question q);

	
	public ArrayList<Question> searchList(Search search);

	//트레이너 이름가져오기
	String selectTrainer(int writer);

	int updateReply2(Question q);
		

}
