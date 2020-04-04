package com.kh.onefit.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onefit.user.model.service.UserService;

@Controller
public class PaymentController {  
	@Autowired private UserService uService;
	
	@RequestMapping("payment.do")
	public String payment() {
		return null;
	}

}
