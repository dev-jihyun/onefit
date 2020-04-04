package com.kh.onefit.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.notice.model.vo.Notice;
import com.kh.onefit.common.model.vo.PageInfo;
import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.common.model.vo.Search;

@Repository("nDao")
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}
	
	// 전체조회
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		// 마이바티스에서 페이징처리는 RowBounds를 이용
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public int insertNotice(Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public int addReadCount(int noticeNum) {
		return sqlSession.update("noticeMapper.updateCount", noticeNum);
	}

	public Notice selectNotice(int noticeNum) {
		return sqlSession.selectOne("noticeMapper.selectOne", noticeNum);
	}

	// 검색
	public ArrayList<Notice> searchList(Search search, int currentPage) {
		//검색 리스트 수 먼저 가져오기.
		int listCount = sqlSession.selectOne("noticeMapper.getListCountSearch", search);
		
		System.out.println("검색 리스트 수 : " + listCount );
		// 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 마이바티스에서 페이징처리는 RowBounds를 이용
				int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
				RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		// 2. 게시글 리스트 조회
		return (ArrayList)sqlSession.selectList("noticeMapper.searchList", search, rowBounds);
		
	}

	public int deleteNotice(int num) {
		return sqlSession.update("noticeMapper.deleteNotice", num);
	}
}
