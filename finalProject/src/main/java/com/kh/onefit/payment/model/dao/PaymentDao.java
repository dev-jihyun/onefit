package com.kh.onefit.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.onefit.payment.model.vo.Payment;

public class PaymentDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPay(Payment p) {  
		return sqlSession.insert("PaymentMapper.insert",p);
	}
	

}
