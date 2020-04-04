package com.kh.onefit.notice.model.service;

import java.util.ArrayList;

import com.kh.onefit.notice.model.vo.Notice;
import com.kh.onefit.common.model.vo.Search;

public interface NoticeService {

	// 1. 게시판 전체 조회
	ArrayList<Notice> selectList(int currentPage);
	
	// 2. 게시판 글쓰기
	int insertNotice(Notice n);
	
	// 3. 게시글 상세 -> 조회수 증가 방지
	Notice selectNotice(int nId, boolean flag);
	
	//4. 게시판 수정
	int updateNotice(Notice n);
	
	// 5. 게시판 삭제
	//int deleteNotice(int nId);

	// 6. 게시글 검색
	ArrayList<Notice> searchList(Search search, int currentPage);
		

	// 5. 게시글 삭제
	int deleteNotice(int num);


		
	
}
