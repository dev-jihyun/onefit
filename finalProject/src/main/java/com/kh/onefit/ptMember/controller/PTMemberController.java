package com.kh.onefit.ptMember.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onefit.health.model.exception.HealthException;
import com.kh.onefit.health.model.service.HealthService;
import com.kh.onefit.ptMember.model.exception.PTMemberException;
import com.kh.onefit.ptMember.model.service.PTMemberService;
import com.kh.onefit.ptMember.model.vo.PTMember;
import com.kh.onefit.user.model.dao.UserDao;
import com.kh.onefit.user.model.service.UserService;
import com.kh.onefit.user.model.vo.User;
@SessionAttributes({"loginUser"})

@Controller
public class PTMemberController {
	@Autowired
	private UserService uService;
	@Autowired
	private UserDao uDao;
	@Autowired
	private PTMemberService ptService;
	// 마이페이지 버튼을 눌렀을때, 건강정보를 가져오기 위한 서비스 선언
	
	//개인정보수정 폼으로 가기
	@RequestMapping("ptUpdateForm.do")
	public String updateFormView() {
		return "pt/updateForm";
	}

	
	@RequestMapping("ptExercise.do")
	public String ptExercise() {
		return "pt/exercise";
	}
	
	@RequestMapping("ptPay.do")
	public String ptPay() {
		return "pt/pay";
	}
	
	
	
	///////////////////////////////// 파일 저장, 삭제
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resource");

		String savePath = root + "\\profileImage"; // 파일 경로 수정

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 공지사항에서는 파일명 변환없이 바로 저장했지만
		// 게시판같은 경우 많은 회원들이 동시에 올릴수도 있고 겹치는 파일을 올릴수도 있기 때문에
		// 파일명을 rename하는 과정이 필요
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); //년월일시분초
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) 
				+ originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath)); // 전달받은 file이 rename명으로 저장

		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return renameFileName;

	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\profileImage"; // 경로 수정
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) 
			f.delete();
	}
	
	
}
