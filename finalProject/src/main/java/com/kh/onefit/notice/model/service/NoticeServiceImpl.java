package com.kh.onefit.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onefit.notice.model.dao.NoticeDao;
import com.kh.onefit.notice.model.vo.Notice;
import com.kh.onefit.common.model.vo.Search;
import com.kh.onefit.common.model.vo.PageInfo;
import com.kh.onefit.common.model.vo.Pagination;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	NoticeDao nDao;
	
	@Override
	public ArrayList<Notice> selectList(int currentPage) {
		// 1. 게시글 개수 조회
		int listCount = nDao.getListCount();
		
		// 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 2. 게시글 리스트 조회
		return nDao.selectList(pi);
	}

	@Override
	public int insertNotice(Notice n) {
		
		return nDao.insertNotice(n);
	}

	@Override
	public Notice selectNotice(int noticeNum, boolean flag) {
		// 1. 조회수 증가
		if(!flag) { // 해당 글을 읽지 않았다면(flag가 false)
			nDao.addReadCount(noticeNum);
		}
		
		// insert시 에러 발생 유도
		// 내가 클릭했던 글이 조회수가 증가하지 않았는지 확인해보기
		// Exception으로 인해 rollback이 일어남
		// bDao.insertBoard(new Board());
		
		// 2. 게시글 조회
		return nDao.selectNotice(noticeNum);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int num) {
		return nDao.deleteNotice(num);
	}

	// 게시글 검색
	@Override
	public ArrayList<Notice> searchList(Search search, int curentpage) {
		return nDao.searchList(search, curentpage);
	}


}
