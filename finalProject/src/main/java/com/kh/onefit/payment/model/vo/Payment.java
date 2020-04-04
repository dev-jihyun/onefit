package com.kh.onefit.payment.model.vo;

import java.util.Date;

public class Payment {
	private int payNum; // 결제 번호
	private int price; //가격
	private Date payDate; // 결제일자
	private int cate; // 카테고리
	private int userNum; // 회원 번호
	private int month; // 개월수
	private int ptMonth; // PT횟수  
	private int status; //로그인된 회원의 상태?가 들어감
	private int trNum;//
	
	public Payment() {}

	public Payment(int payNum, int price, Date payDate, int cate, int userNum, int month, int ptMonth, int status,
			int trNum) {
		super();
		this.payNum = payNum;
		this.price = price;
		this.payDate = payDate;
		this.cate = cate;
		this.userNum = userNum;
		this.month = month;
		this.ptMonth = ptMonth;
		this.status = status;
		this.trNum = trNum;
	}

	public int getPayNum() {
		return payNum;
	}

	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getCate() {
		return cate;
	}

	public void setCate(int cate) {
		this.cate = cate;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getPtMonth() {
		return ptMonth;
	}

	public void setPtMonth(int ptMonth) {
		this.ptMonth = ptMonth;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}

	@Override
	public String toString() {
		return "Payment [payNum=" + payNum + ", price=" + price + ", payDate=" + payDate + ", cate=" + cate
				+ ", userNum=" + userNum + ", month=" + month + ", ptMonth=" + ptMonth + ", status=" + status
				+ ", trNum=" + trNum + "]";
	}
	
	




	
	
	
	
	
	
	

}
