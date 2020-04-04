package com.kh.onefit.ptMember.model.exception;

public class PTMemberException extends RuntimeException {
	//Exception을 상속받지 않고 RuntimeException을 상속 받기
	public PTMemberException(String msg) {
		super(msg);
	}
}
