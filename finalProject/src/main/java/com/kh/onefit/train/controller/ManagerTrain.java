package com.kh.onefit.train.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.health.model.service.HealthService;
import com.kh.onefit.health.model.vo.Health;
import com.kh.onefit.question.model.exception.QuestionException;
import com.kh.onefit.train.model.service.TrainerService;
import com.kh.onefit.train.model.vo.ManagerTrainer;

@SessionAttributes({"loginUser", "train"})

@Controller
public class ManagerTrain {

	@Autowired
	private TrainerService Tservice;
	//건강정보 따로 가져와야해서 HEALTHSERVICE선언
	@Autowired
	private HealthService healthService;
	
	@RequestMapping("tlist.do")
	public ModelAndView mypageView( ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		System.out.println("확인");
		
		int currentPage = page != null ? page : 1;
		
		ArrayList<ManagerTrainer> tlist = Tservice.ManagerSelectList(currentPage);
		
		System.out.println("tlist = " + tlist);
		
		if (tlist != null) {
			
			for(int i = 0; i < tlist.size(); i++) {
				Health h = healthService.selectTrainerHealth(tlist.get(i).getTrNum());
				if(h !=null) {//유저 헬스정보없으면 세팅 안함
					//userVO에 세팅
					tlist.get(i).setHeight(h.getHeight());
					tlist.get(i).setWeight(h.getWeight());
					tlist.get(i).setFat(h.getFat());
				}
				
			}
			
			mv.addObject("tlist", tlist);
			
			
			mv.addObject("pi", Pagination.getPageInfo());
			
			mv.setViewName("manager/tlist");
		} else {
			throw new QuestionException("게시판 목록 불러오기 실패");
		}
		return mv;
	}
	
	
}
