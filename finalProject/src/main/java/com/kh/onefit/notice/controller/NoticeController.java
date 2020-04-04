package com.kh.onefit.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.common.model.vo.Search;
import com.kh.onefit.notice.model.exception.NoticeException;
import com.kh.onefit.notice.model.service.NoticeService;
import com.kh.onefit.notice.model.vo.Notice;
import com.kh.onefit.user.model.vo.User;

@SessionAttributes({ "loginUser", "userType", "msg", "trainerInforms" })
@Controller
public class NoticeController {
	@Autowired
	private NoticeService nService;

	// pt회원의 nlist.do
	@RequestMapping("nlist.do")
	public ModelAndView NoticeList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			HttpSession session) {
		System.out.println("페이지 수 : " + page);
		// 커맨드 객체 사용시 해당 파라미터가 존재하지 않을 경우 null 값을 반환
		// 자료형이 int인 경우 null 값을 저장할 수 없음
		// 이를 해결하기 위해 Integer로 선언.
		User u = (User) session.getAttribute("loginUser");
		System.out.println("status : " + u.getStatus());
		System.out.println("userId : " + u.getUserId());
		// 페이징 처리를 위해
		// 마이바티스 프로젝트에서 PageInfo vo 클래스, Pagination의 싱글 톤 개념 클래스 복사.
		int currentPage = page != null ? page : 1;

		ArrayList<Notice> list = nService.selectList(currentPage);
		// System.out.println("list = " + list);
		System.out.println("공지사항 컨트롤러" + list);
		if (list != null) {

			mv.addObject("list", list);
			mv.addObject("pi", Pagination.getPageInfo());

			// PT회원일 때
			if (u.getStatus() == 2) {
				System.out.println("pt회원의 nlist.do");
				mv.setViewName("common/csCenter/userNoticeList");
			} else if (u.getStatus() == 3 || u.getStatus() == 1) {
				// 그중에 매니저인경우
				if (u.getUserId().equals("manager")) {
					System.out.println("매니저의 nlist.do");
					mv.setViewName("manager/managerNoticeList");
					// 매니저 아닌 일반회원인경우
				} else {
					System.out.println("일반회원의 nlist.do");
					mv.setViewName("common/csCenter/userNoticeList");
				}
			}

		} else {
			throw new NoticeException("공지사항 목록 불러오기 실패");
		}

		return mv;
	}

	@RequestMapping("ninsertView.do")
	public String boardInsertView() {
		return "notice/noticeInsertForm";
	}

	@RequestMapping("ninsert.do")
	public String NoticeInsert(Notice n, HttpServletRequest request
			/*@RequestParam(name = "uploadFile", required = false) MultipartFile file*/) {

		// 리네임으로 저장하기. oringinal네임은 언제든 저장가능하기 때문에,
		// saveFile메소드 리턴값은 rename값으로 저장하기!
		/*if (!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			if (renameFileName != null) {
				n.setOriginalFileName(file.getOriginalFilename());
				n.setRenameFileName(renameFileName);
			}
		}*/

		//n.setContent(n.getContent().replace("\n", "<br>"));


		int result = nService.insertNotice(n);
		if (result > 0) {
			return "redirect:nlist.do";
		} else {
			throw new NoticeException("게시글 등록 실패!");
		}
	}
	
	@RequestMapping("ndetail.do")
	public ModelAndView NoticeDetail(ModelAndView mv, @RequestParam("page") Integer page, int noticeNum, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session, Search search) {
		System.out.println("noticeNum: " + noticeNum);

		// 페이지
		int currentPage = page != null ? page : 1;

		Notice notice = null;

		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("noticeNum" + noticeNum)) {
					// 해당 게시글에 대한 쿠키 존재(이미 읽은 게시글)
					flag = true;
				}
			}

			if (!flag) {
				// 처음 읽는 게시글일때
				Cookie c = new Cookie("noticeNum" + noticeNum, String.valueOf(noticeNum));

				// 일정 기간동안 이 쿠키를 저장 해라.
				// 하루동안 쿠키 저장.
				c.setMaxAge(1 * 24 * 60 * 60);
				// 내가 보낸 응답에다가 쿠키 담기.
				response.addCookie(c);
			}

			notice = nService.selectNotice(noticeNum, flag);
			// 서비스까지 데려가야 조회수 증가 여부를 판단할 수 있음.
			System.out.println("ndetail.do : " + notice);
		}

		// 나갈 뷰를위해 로그인유저 세션에서 가져오기
		User u = (User) session.getAttribute("loginUser");
		
		if (notice != null) {
			mv.addObject("notice", notice)
			.addObject("currentPage", currentPage)
			.addObject("search", search);
			// PT회원일 때
			if (u.getStatus() == 2) {
				System.out.println("pt회원의 ndetail.do");
				mv.setViewName("common/csCenter/userNoticeDetail");
				
			}else if (u.getStatus() == 3 || u.getStatus() == 1) {
				// 그중에 매니저인경우
				if (u.getUserId().equals("manager")) {
					System.out.println("매니저의 ndetail.do");
					mv.setViewName("manager/managerNoticeList");

					// 매니저 아닌 일반회원인경우
				} else {
					System.out.println("일반회원의 ndetail.do");
					mv.setViewName("common/csCenter/userNoticeDetail");
				}
			}

		} else {
			throw new NoticeException("게시글 상세조회 실패!!");
		}
		// 디테일 뷰 갔다가 원래 목록으로 가기위해 페이지를 들고 다님.
		return mv;
	}

	@RequestMapping("nupView.do")
	public ModelAndView NoticeUpdateView(ModelAndView mv, int noticeNum, @RequestParam("page") Integer page) {
		// 수정하기 위한 기본 세팅.
		Notice n = nService.selectNotice(noticeNum, true); // 조회수 증가X
		n.setContent(n.getContent().replace("<br>", "\n"));

		mv.addObject("notice", n).addObject("currentPage", page).setViewName("notice/noticeUpdateForm");

		return mv;
	}

	// 1. 수정하기( *** 필요한 값 미리 jsp에서 담아서 가져오는 처리 ***)
	// 기존파일 서버에서 지우고 새로운 파일 저장.(deleteFile 메소드)
	// 현재 페이지 값 유지하면서 blist.do 재요청.

	// 삭제하기
	// 첨부파일 있으면 지우고
	// blist.do 재요청
	@RequestMapping("nupdate.do")
	public String NoticeUpdate(ModelAndView mv, Notice n, @RequestParam("currentPage") Integer page,
			@RequestParam(name = "reloadFile", required = false) MultipartFile file, HttpServletRequest request) {
		// 페이지
		int currentPage = page != null ? page : 1;
		if (file != null && !file.isEmpty()) {// 업로드 된 파일ㅇ 있따면
			// 있던 파일 지우고
			deleteFile(n.getRenameFileName(), request);
			// 새로운 파일 저장.
			String renameFileName = saveFile(file, request);

			n.setRenameFileName(renameFileName);
			n.setOriginalFileName(file.getOriginalFilename());
		}

		// 내용 띄어쓰기 변경
		n.setContent(n.getContent().replace("\n", "<br>"));
		////////////////////////////////////
		int result = nService.updateNotice(n);
		if (result > 0) {

		} else {
			throw new NoticeException("게시글 수정 실패!");
		}
		return "redirect:nlist.do?page=" + currentPage;
	}

	// 검색
	@RequestMapping("nsearch.do")
	public ModelAndView noticeSearch(Search search, ModelAndView mv,
			 @RequestParam(value = "page", required = false) Integer page,
				HttpSession session
				) {
		int currentPage = page != null ? page : 1;
			
		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchValue());
		//System.out.println(search.getExistFile());
		// 체크박스 O : on
		// 체크박스 X : null

		ArrayList<Notice> searchList = nService.searchList(search, currentPage);
		System.out.println("검색에 걸린 리스트 : " + searchList);
		mv.addObject("list", searchList);
		mv.addObject("search", search);
		mv.addObject("pi", Pagination.getPageInfo());
		
		User u = (User)session.getAttribute("loginUser");
		if (u.getStatus() == 2) {
			System.out.println("pt회원의 nsearch.do");
			mv.setViewName("common/csCenter/userNoticeList");
			
		}else if (u.getStatus() == 3 || u.getStatus() == 1) {
			// 그중에 매니저인경우
			if (u.getUserId().equals("manager")) {
				System.out.println("매니저의 nsearch.do");
				mv.setViewName("manager/managerNoticeList");

				// 매니저 아닌 일반회원인경우
			} else {
				System.out.println("일반회원의 nsearch.do");
				mv.setViewName("common/csCenter/userNoticeList");
			}
		}
		
		
		return mv;
	}

	@RequestMapping("ndelete.do")
	public String deleteBoard(Notice n, HttpServletRequest request, @RequestParam("reloadFile") MultipartFile file) {

		// 1. noticeNum 가져가서 db에서 셀렉해온 후 파일삭제

		// 2. 뷰에서 board정보 다 받아오기.

		// 파일있으면 파일삭제
		if (n.getRenameFileName() != null) {
			deleteFile(n.getRenameFileName(), request);
		}
		int result = nService.deleteNotice(n.getNoticeNum());

		if (result > 0) {
			return "redirect:nlist.do";
		} else {
			throw new NoticeException("게시글 삭제 실패!");
		}

	}
	
	@RequestMapping("dNotice.do")
	public String deleteNotice(HttpServletRequest request, @RequestParam("num")int num) {
		System.out.println(num);
		int result = nService.deleteNotice(num);
		
		if (result > 0) {
			return "redirect:nlist.do";
		} else {
			throw new NoticeException("게시글 삭제 실패!");
		}
	}

///////////////////////////첨부파일 저장메소드/////////////////////////////////////////////////////////////	
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		// webapp - '리소스폴더' 경로
		String root = request.getSession().getServletContext().getRealPath("resources");

		// 리소스 파일 저장 경로 = '리소스폴더 경로' + \\ + '게시판리소스' 폴더명
		String savePath = root + "\\nuploadFiles";

		// 경로 만듬,,,폴더 만듬,,,
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}

		// 공지사항에서는 파일명 변환없이 바로 저장했지만
		// 게시판같은 경우 많은 회원들이 동시에 올릴수도 있고 파일명이 겹치는 파일을 올릴수도 있기 때문에
		// 파일명을 rename하는 과정이 필요
		// 년월일시분초 00-24시간 단위
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		// 확장자구하려면 원래파일명 필요.
		String originFileName = file.getOriginalFilename();

		// 리네임파일명 : 년월일시분초 + 확장자
		String renameFileName = sdf.format(new Date()) + originFileName.substring(originFileName.lastIndexOf("."));

		try {
			// 리네임 이름으로 파일 저장.
			// 내가 저장할 'file(매개변수로 넘어온애)를 File(파일경로+파일명.jsp)으로 메모리에 할당시켜 내가 매개변수로 가져온 애를
			// 집어넣는것.
			// file -> File()폴더만듬.
			String renamePath = folder + "\\" + renameFileName;

			file.transferTo(new File(renamePath));

		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return renameFileName;
	}

// boardInsert 프로세스 작성하기
// saveFile 메소드 따로 분리해서 작성하며
// buploadFiles에 저장하고
// 파일명을 년월일시분초로 변경하여 orijinalFilename과
// renameFilename을 db로 저장.

	/////////////////////////// 첨부파일
	/////////////////////////// 삭제메소드/////////////////////////////////////////////////////////////
	
	
	private void deleteFile(String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nuploadFiles";

		File deleteFile = new File(savePath + "\\" + renameFileName);

		if (deleteFile.exists()) {
			deleteFile.delete();
		}
	}

}