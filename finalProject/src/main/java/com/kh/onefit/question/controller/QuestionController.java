package com.kh.onefit.question.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.common.model.vo.Search;
import com.kh.onefit.question.model.exception.QuestionException;
import com.kh.onefit.question.model.service.QuestionService;
import com.kh.onefit.question.model.vo.Question;
import com.kh.onefit.user.model.vo.User;

@SessionAttributes({"loginUser", "userType","msg", "trainerInforms"})


@Controller
public class QuestionController {
	@Autowired
	private QuestionService qService;

	@RequestMapping("qlist.do")
	public ModelAndView selectQuestionList(HttpSession session, ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		int currentPage = page != null ? page : 1;
		
		User user = (User) session.getAttribute("loginUser");
		System.out.println("status : " + user.getStatus());
		System.out.println("userId : " + user.getUserId());
		System.out.println("userNum : " + user.getUserNum());
		ArrayList<Question> list = new ArrayList<Question>();
		
		if(user.getUserId().equals("manager")) {
			//회원번호랑 안겹치려고 0으로 함. 트레이너는 메소드 따로만들어서하는게 나을것같습니당
			list = qService.selectList(currentPage,0);
			
		}else {
			list = qService.selectList(currentPage,user.getUserNum());
		}
		
		System.out.println("list = " + list);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", Pagination.getPageInfo());
			

			
			// PT회원일 때
			if (user.getStatus() == 2) {
				System.out.println("pt회원의 qlist.do");
				mv.setViewName("common/csCenter/userQnaList");
			} else if (user.getStatus() == 3 || user.getStatus() ==1) {
				// 그중에 매니저인경우
				if (user.getUserId().equals("manager")) {
					System.out.println("매니저의 qlist.do");
					mv.setViewName("manager/managerQnaList");

					// 매니저 아닌 일반회원인경우
				} else {
					System.out.println("일반회원의 qlist.do");
					mv.setViewName("common/csCenter/userQnaList");
				}
			}
			
			
		} else {
			throw new QuestionException("게시판 목록 불러오기 실패");
		}

		return mv;
	}

	@RequestMapping("qinsertView.do")
	public String boardInsertView(HttpSession session) {
		User u = (User) session.getAttribute("loginUser");
		String jspUrl = "";
		// PT회원일 때
		if (u.getStatus() == 2) {
			System.out.println("pt회원의 문의글쓰기뷰.do");
			jspUrl = "common/csCenter/userQnaInsertForm";
		} else if (!u.getUserId().equals("manager")) {
		// 일반회원일때
			System.out.println("일반회원의 문의글쓰기뷰.do");
			jspUrl = "common/csCenter/userQnaInsertForm";
		}
		return jspUrl;
	}

	@RequestMapping("qinsert.do")
	public String questionInsert(Question q, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {
		System.out.println("오냐?");
		System.out.println("q내용 : " + q);
		// 리네임으로 저장하기. oringinal네임은 언제든 저장가능하기 때문에,
		// saveFile메소드 리턴값은 rename값으로 저장하기!
/*		if (!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);

			if (renameFileName != null) {
				q.setOriginalFileName(file.getOriginalFilename());
				q.setRenameFileName(renameFileName);
			}
		}*/
		
		//q.setContent(q.getContent().replace("\n", "<br>"));

		int result = qService.insertQuestion(q);
		if (result > 0) {
			return "redirect:qlist.do";
		} else {
			throw new QuestionException("게시글 등록 실패!");
		}
	}
	
	//--------------------------------
	@RequestMapping("qReply.do")
	public String questionReply(Question q, HttpServletRequest request) {
		System.out.println("답변 : " + q);
		int result = qService.updateReply2(q);

		return "redirect:qlist.do";
	}
	//--------------------------------
	
///////////////////////////첨부파일 저장메소드/////////////////////////////////////////////////////////////	
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		// webapp - '리소스폴더' 경로
		String root = request.getSession().getServletContext().getRealPath("resources");

		// 리소스 파일 저장 경로 = '리소스폴더 경로' + \\ + '게시판리소스' 폴더명
		String savePath = root + "\\quploadFiles";

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
			String renamePath = folder +"\\"+ renameFileName;

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

	@RequestMapping("qdetail.do")
	public ModelAndView NoticeDetail(int askNum, ModelAndView mv, @RequestParam("page") Integer page,
			HttpServletResponse response, HttpSession session) {
		// 페이지
		int currentPage = page != null ? page : 1;

		Question q = qService.selectQuestion(askNum);
		System.out.println("qselectOne : " + q);
		
		User u = (User)session.getAttribute("loginUser");
		
		if(q != null) {
			//가져온 Q의 Cate에 따라서 select from trainer의 아이디나 이름이 필요하면 가져오기
			if(q.getCate()==2) {
				String t = qService.selectTrainer(q.getWriter());
				q.setUserId(t);
			}else {
				//매니저는 걍 관리자로 퉁치면됨
				q.setUserId("관리자");
			}
			mv.addObject("q", q)
			.addObject("currentPage", currentPage);
			
			if(u.getStatus()==2) {
				mv.setViewName("common/csCenter/userQnaDetail");
				
			}else {
				mv.setViewName("common/csCenter/userQnaDetail");
			}
		}else {
			throw new QuestionException("게시글 상세조회 실패!!");
		}
		// 디테일 뷰 갔다가 원래 목록으로 가기위해 페이지를 들고 다님.
		return mv;
	}
	
	@RequestMapping("qupView.do")
	public ModelAndView NoticeUpdateView(ModelAndView mv, int askNum) {
		// 수정하기 위한 기본 세팅.
		Question q = qService.selectQuestion(askNum);		
		
		mv.addObject("q", q)

		.setViewName("common/csCenter/userQnaUpdate");
		
		return mv;
	}
	
	// 1. 수정하기( *** 필요한 값 미리 jsp에서 담아서 가져오는 처리 ***)
	// 기존파일 서버에서 지우고 새로운 파일 저장.(deleteFile 메소드)
	// 현재 페이지 값 유지하면서 blist.do 재요청.
	
	// 삭제하기
	// 첨부파일 있으면 지우고
	// blist.do 재요청
	
	@RequestMapping("qupdate.do")
	public ModelAndView questionUpdate(ModelAndView mv, Question q) {
			
		int result = qService.updateQuestion(q);
		System.out.println(q);
		if(result > 0) {
			System.out.println("문의사항 글 수정 완료");
		}else {
			System.out.println("문의사항 글 수정 실패");
		}
			mv.setViewName("redirect:qlist.do");
			
		return mv;
	}
	
	
	///////////////////////////첨부파일 삭제메소드/////////////////////////////////////////////////////////////	
	private void deleteFile(String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\quploadFiles";
		
		File deleteFile = new File(savePath + "\\" + renameFileName);
		
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	@RequestMapping("qsearch.do")
	public String noticeSearch(Search search, Model model) {
		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchValue());
		System.out.println(search.getExistFile());
		// 체크박스 O : on
		// 체크박스 X : null

		ArrayList<Question> searchList = qService.searchList(search);
		
		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		
		return "question/questionListView";
	}
	
	@RequestMapping("qdelete.do")
	public String deleteQuestion(int askNum
			/*, HttpServletRequest request
			,@RequestParam("reloadFile") MultipartFile file*/
			) {
		Question q = qService.selectQuestion(askNum);
		
		//1. askNum 가져가서 db에서 셀렉해온 후 파일삭제
		
		//2. 뷰에서 board정보 다 받아오기.
		
		//파일있으면 파일삭제
		/*if(q.getRenameFileName() != null) {
			deleteFile(q.getRenameFileName(), request);
		}*/
		int result = qService.deleteQuestion(askNum);
		
		if(result > 0) {
			return "redirect:qlist.do";
		}else {
			throw new QuestionException("게시글 삭제 실패!");
		}
		
	}

	
}
