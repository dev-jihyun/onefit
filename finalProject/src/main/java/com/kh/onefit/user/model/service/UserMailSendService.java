package com.kh.onefit.user.model.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.onefit.user.model.dao.UserDao;
import com.kh.onefit.user.model.exception.UserException;


@Service
public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;  
	 
	@Autowired
	private UserDao uDao;

	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String e_mail, String userId, HttpServletRequest request) {
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 원핏 입니다!</h2><br><br>" 
				+ "<h3>" + userId + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다!!!" 
				+ "<a href='http://localhost:8800"+request.getContextPath()+"/checkKey.do?userId="+ userId+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] MS 원핏의 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	//인증 확인 메소드
	// 인증 확인 메서드 (3 값으로 바꿔주는 메서드)
		public int alter_userKey_service(String userId) {
			return uDao.checkKey(userId);
		}

}
