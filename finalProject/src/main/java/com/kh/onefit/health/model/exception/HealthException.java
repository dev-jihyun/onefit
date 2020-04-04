package com.kh.onefit.health.model.exception;

public class HealthException extends RuntimeException {
	//Exception을 상속받지 않고 RuntimeException을 상속 받기
	public HealthException(String msg) {
		super(msg);
	}
}
