package com.kh.onefit.attendence.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onefit.attendence.model.service.AttendenceService;
import com.kh.onefit.user.model.vo.User;


@Controller
public class AttendenceController {  
	  
	@Autowired
	AttendenceService aService;
	

	}


