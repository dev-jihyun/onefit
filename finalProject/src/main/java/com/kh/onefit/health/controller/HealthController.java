package com.kh.onefit.health.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onefit.health.model.exception.HealthException;
import com.kh.onefit.health.model.service.HealthService;
import com.kh.onefit.health.model.vo.Health;
import com.kh.onefit.train.model.vo.Trainer;


@Controller
public class HealthController {
	
	@Autowired
	private HealthService hService;
	
	//건강정보 업데이트
	@RequestMapping("ptUpdateHealthInfo.do")
	public String updateHealth(
			Health healthInfo,
			Model model,
			RedirectAttributes rd) {
		
		int result = hService.updateHealth(healthInfo);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "건강정보가 수정되었습니다.");
			
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "건강정보수정 실패!!");
			return "common/errorPage";
		}
	}
	
	//트레이너의 건강정보를 입력하거나 업데이트 하기위해
	@RequestMapping("trainerHealthInform.do")
	public String trainerHealthInform(HttpServletRequest request, Model model,Health health,
			@RequestParam(value="type") String type) {
		
		Trainer t = (Trainer) request.getSession().getAttribute("loginUser");
		
		health.setUserNum(t.getTrNum());
		
		switch(type) {
		case "insert":
			int result = hService.insertTrainerHealth(health);
			if(result<0) {
				throw new HealthException("트레이너 건강정보 입력 실패");
			}else {
				return "redirect:trainerMyPage.do";
			}
		case "update":
			int result2 = hService.updateTrainerHealth(health);
			if(result2<0) {
				throw new HealthException("트레이너 건강정보 수정 실패");
			}else {
				return "redirect:trainerMyPage.do";
			}
		}
		
		return "redirect:trainerMyPage.do";
	}
}
