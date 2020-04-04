package com.kh.onefit.ptMember.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.health.model.service.HealthService;
import com.kh.onefit.health.model.vo.Health;
import com.kh.onefit.ptMember.model.service.PTMemberService;
import com.kh.onefit.ptMember.model.vo.PTMember;
import com.kh.onefit.question.model.exception.QuestionException;

@SessionAttributes({"loginUser", "ptMember"})

@Controller
public class ManagerPtMember {

	@Autowired
	private PTMemberService PTService;
	@Autowired
	private HealthService healthService;
	
	@RequestMapping("memberList.do")
	public ModelAndView mypageView( ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		
		System.out.println("확인");
		
		int currentPage = page != null ? page : 1;
		ArrayList<PTMember> mlist = PTService.selectList(currentPage);
		System.out.println("mlist = " + mlist);
		ArrayList<Health> hlist = new ArrayList<Health>();
		if (mlist != null) {
			

			for(int i = 0; i < mlist.size(); i++) {
				Health h = healthService.selectHealth(mlist.get(i).getUserNum());
				if(h !=null) {//유저 헬스정보없으면 세팅 안함
					//userVO에 세팅
					mlist.get(i).setHealthNum(h.getHealthNum());
					mlist.get(i).setHeight(h.getHeight());
					mlist.get(i).setWeight(h.getWeight());
					mlist.get(i).setFat(h.getFat());
					mlist.get(i).setGoal(h.getGoal());
					mlist.get(i).setReason(h.getReason());
					mlist.get(i).setCheckDate(h.getCheckDate());
				}
				
			}
			mv.addObject("mlist", mlist);
			mv.addObject("pi", Pagination.getPageInfo());
			mv.setViewName("manager/mlist");
		} else {
			throw new QuestionException("게시판 목록 불러오기 실패");
		}
		
		return mv;
	}
	

}
