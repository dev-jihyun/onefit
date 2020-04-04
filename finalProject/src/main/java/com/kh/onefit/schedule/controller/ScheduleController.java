package com.kh.onefit.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onefit.schedule.model.exception.ScheduleException;
import com.kh.onefit.schedule.model.service.ScheduleService;
import com.kh.onefit.schedule.model.vo.Schedule;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.user.model.vo.User;

@SessionAttributes({ "loginUser", "userType", "msg", "trainerInforms", "trainerProfile" })

@Controller
public class ScheduleController {

	@Autowired
	private ScheduleService sService;

	// PT회원의 내 트레이너 일정 조회
	@RequestMapping("ptScheduleList.do")
	public ModelAndView scheduleList(ModelAndView mv, HttpSession session) {
		
		User u = (User)session.getAttribute("loginUser");
		ArrayList<Schedule> list = sService.selectList(u.getTrNum());
		System.out.println("셀렉해온 일정 리스트: " + list);
		if (list != null) {
			mv.addObject("list", list);			
			mv.setViewName("pt/ptSchedule");

		} else {
			throw new ScheduleException("일정목록 불러오기 실패");
		}
		
		return mv;
	}
	
	
	// PT회원의 내 트레이너 일정 조회
	@RequestMapping("trainScheduleList.do")
	public ModelAndView trainScheduleList(ModelAndView mv, HttpSession session) {
		
		Trainer u = (Trainer)session.getAttribute("loginUser");
		ArrayList<Schedule> list = sService.selectList2(u.getTrNum());
		System.out.println("셀렉해온 일정 리스트: " + list);
		if (list != null) {
			mv.addObject("list", list);			
			mv.setViewName("trainer/trainerSchedule");

		} else {
			throw new ScheduleException("일정목록 불러오기 실패");
		}
		
		return mv;
	}
	
	
	// 일정추가 ajax
	@RequestMapping("insertSchedule.do")
	public ModelAndView inserSchedule(ModelAndView mv, String ptDay, HttpSession session) {
		System.out.println("ptDay : "+ ptDay);
		System.out.println("------일정 컨트롤러------");
		System.out.println("[일정 추가메소드]");

		User u = (User)session.getAttribute("loginUser");
		
		Schedule s = new Schedule(ptDay, u.getUserNum(), u.getTrNum());
		int result = sService.insertSchedule(s);
		/*int result = 1;*/
		if(result > 0) {
			mv.setViewName("redirect:ptScheduleList.do");
		}else {
			throw new ScheduleException("일정 추가 실패");
		}
/*		
		Map map = new HashMap();
		map.put("isPwdCheck", isPwdCheck);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");*/
		return mv; // json객체로 넘어감
	}
	
	// pt회원 일정 삭제
	@RequestMapping("deletePtSchedule.do")
	public ModelAndView deletePtSchedule(int scNum, ModelAndView mv) {
		boolean isDeleteEvent = true; 
		System.out.println("삭제할 scNum : "+ scNum);
		System.out.println("------일정 컨트롤러------");
		System.out.println("[일정 삭제메소드]");
		
		int result = sService.deletePtSchedule(scNum);
		/*int result = 1;*/
		if(result > 0) {
			isDeleteEvent = true;
			
		}else {
			isDeleteEvent = false;
		}
		
		Map map = new HashMap();
		map.put("isDeleteEvent", isDeleteEvent);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		return mv; // json객체로 넘어감
	}
	
	//pt회원 일정 변경
	@RequestMapping("updatePtSchedule.do")
	public String updatePtSchedule(int scNum) {

		int result = sService.updatePtSchedule(scNum);

		if(result > 0) {
			return "redirect:ptScheduleList.do";
		}else {
			throw new ScheduleException("일정 변경 실패!");
		}
	}
	
	//트레이너 휴가부분
	
	
	
	
	
	
}
