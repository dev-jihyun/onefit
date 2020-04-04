package com.kh.onefit.payment.model.service;

import com.kh.onefit.payment.model.vo.Payment;

public interface PaymentService {
	
	// 결제하기
	public int insertPay(Payment p);

}
  