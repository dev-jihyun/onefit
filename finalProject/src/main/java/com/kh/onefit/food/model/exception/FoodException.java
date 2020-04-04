package com.kh.onefit.food.model.exception;

public class FoodException extends RuntimeException {
	//Exception을 상속받지 않고 RuntimeException을 상속 받기
	public FoodException(String msg) {
		super(msg);
	}
}
