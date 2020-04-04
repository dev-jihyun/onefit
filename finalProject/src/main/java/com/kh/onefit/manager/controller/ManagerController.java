package com.kh.onefit.manager.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onefit.attendence.model.service.AttendenceService;
import com.kh.onefit.manager.model.service.ManagerService;
import com.kh.onefit.question.model.service.QuestionService;
import com.kh.onefit.question.model.vo.Question;
import com.kh.onefit.user.model.vo.User;


@SessionAttributes({"loginUser", "userType","msg", "trainerInforms"})

@Controller
public class ManagerController {
		@Autowired
		private QuestionService qService;
	
		@Autowired
		private AttendenceService aService;
		
		@Autowired
		private ManagerService mmService;
	
		// 고객센터
		@RequestMapping("mService.do")
		public String mService() {
			return "manager/managerQnaList";
		}

		// 회원 관리
		@RequestMapping("mlist.do")
		public String memberList() {

			return "manager/mlist";
		}

		// 트레이너 관리
		/*@RequestMapping("tlist.do")
		public String trainerList() {

			return "manager/tlist";
		}*/
		
		// 헬스장 관리
		@RequestMapping("gymOf.do")
		public String gManager() {

			return "manager/gymOffice";
		}
		
		// 출석 체크 페이지
		@RequestMapping("att.do")
		public String checkAtt() {

			return "manager/Attendance";
		}
		
		// 1:1 문의 페이지
		@RequestMapping("managerQnaList.do")
		public String selectQnaList() {
			
			return "manager/managerQnaList";
		}
		
		// 공지사항 페이지
		@RequestMapping("managerNoticeList.do")
		public String selectNoticeList() {
			
			return "manager/managerNoticeList";
		}
		
		//로그아웃
		@RequestMapping("managerLogout.do")
		public String ptLogout(SessionStatus status) {
		    status.setComplete();
		      
		    return "redirect:/";
		}
		
		
		@RequestMapping("chkatt.do")
		public ModelAndView chkatt(ModelAndView mv, String id, String pwd) {
			boolean isCheck = true; 
			System.out.println("------manger컨트롤러------");
			System.out.println("userNum : " + id);
			System.out.println("pwdChk : " + pwd);
			
			User user = mmService.chkatt(id, pwd);
			
			
			if(user != null) {
				isCheck = true;
				// 출석테이블에 추가
				/*int result = aService.*/
				int result = aService.insertAtt(user.getUserNum());
				
			}else {
				isCheck = false;
			}
			
			Map map = new HashMap();
			map.put("isCheck", isCheck);
			
			mv.addAllObjects(map);
			
			mv.setViewName("jsonView");
			return mv; // json객체로 넘어감
		}
		
		@RequestMapping("QnAdetail.do")
		public ModelAndView QnAdetail(ModelAndView mv, int askNum) {
			System.out.println("확인");
			
			Question q = qService.selectQuestion(askNum);
			mv.addObject("q",q);
			mv.setViewName("manager/managerQnaDetail");
			return mv;
		}
		
		
}
