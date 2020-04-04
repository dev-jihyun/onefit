package com.kh.onefit.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.onefit.payment.model.dao.PaymentDao;
import com.kh.onefit.payment.model.vo.Payment;

public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Override
	public int insertPay(Payment p) {
		return paymentDao.insertPay(p);  
	}

}
