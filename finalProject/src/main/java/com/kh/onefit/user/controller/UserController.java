package com.kh.onefit.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.health.model.service.HealthService;
import com.kh.onefit.health.model.vo.Health;
import com.kh.onefit.payment.model.vo.Payment;
import com.kh.onefit.train.model.service.TrainerService;
import com.kh.onefit.train.model.vo.TrainerInfos;
import com.kh.onefit.user.model.exception.UserException;
import com.kh.onefit.user.model.service.UserMailSendService;
import com.kh.onefit.user.model.service.UserService;
import com.kh.onefit.user.model.vo.User;

@SessionAttributes({"loginUser", "userType","msg"})

@Controller   
public class UserController {  
	@Autowired private UserService uService;  
	
    @Autowired
	private UserMailSendService mailsender;
    
    @Autowired
    private TrainerService tService;

	//건강정보 따로 가져와야해서 HEALTHSERVICE선언
	@Autowired
	private HealthService healthService;
	
	@RequestMapping("usermypage.do")
	public String MyPage(HttpServletRequest request, Model model) {
		User user = (User) request.getSession().getAttribute("loginUser");
		System.out.println("유저상태 : " + user.getStatus());
		model.addAttribute("loginUser",user);
		if(user.getStatus()==2) {
			return "pt/mypage";
		}else {
			if(user.getUserId().equals("manager")) {
				return"manager/managerNoticeList";
			}
			return "user/mypage";			
		}
	}
	
	@RequestMapping("userUpdateForm.do")
	public String updateFormView() {
		return "user/updateForm";
	}

	@RequestMapping("pay.do")
	public ModelAndView pay(ModelAndView mv, HttpSession session) {
		System.out.println("ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ");
		User user = (User)session.getAttribute("loginUser");
		
		//트레이너 리스트
		ArrayList<TrainerInfos> tr = tService.selectList();
		
		//트레이너 경력
		ArrayList<String[]> qustn = new ArrayList<String[]>(); 
		System.out.println("트레이너 경력 : " + tr.get(0).getCareer());
		System.out.println("트레이너 리스트 테스트 : " + tr);
		
		//트레이너 리스트 불러오기
		for(int i=0; i < tr.size(); i++) {
			String[] career = tr.get(i).getCareer().split(",");
			System.out.println("career : " + Arrays.toString(career));
			qustn.add(career);
		}
		
		if(tr != null) {
			mv.addObject("tr",tr);
			mv.addObject("career",qustn);
			
			if(user.getStatus()==2) {
				//pt메뉴바때문에 다른 뷰로 이동해야 함.
				mv.setViewName("pt/pay");
			}else {
				mv.setViewName("user/pay");
			}
			
		}else {
			
			throw new UserException("결제페이지 조회 실패!!");
		}
		return mv;
	}
	

///////////////////////////////////////////공지사항///////////////////////////////////////////////
	@RequestMapping("userNoticeList1.do")
	public String userNoticeListList() {
		return "user/userNoticeList";
	}

	@RequestMapping("userNoticeDetail1.do")
	public String userNoticeDetail() {
		return "user/userNoticeDetail";
	} 

	/////////////////////////////////////////////////////////////로그인/////////////////////////////////////////////////
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberjoin";
	} 
	
	//회원 가입
	@RequestMapping("uinsert.do")
	public String userInsert(User u, Model model, RedirectAttributes rd,HttpServletRequest request,
			  @RequestParam(value="profile", required=false) MultipartFile file) {
		
		int result = uService.insertUser(u);
		
		if(result > 0) {
			//제대로 입력이 됐을때
			Photo photo = new Photo();
			
			int userNum = uService.getUserNum(u.getUserId());
			
			if(!file.getOriginalFilename().equals("")) {
				String renameFileName = saveFile(file, request);
				
				if(renameFileName != null) {
					photo.setOrgName(file.getOriginalFilename());
					photo.setChName(renameFileName);
					photo.setCate(1);
					photo.setNumbs(userNum);
				}
			}else {
				//프로필 사진을 설정 하지 않았을때
				photo.setOrgName("standard.png");
				photo.setChName("standard.png");
				photo.setCate(1);
				photo.setNumbs(userNum);
			}
			
			int result2 = uService.insertPhoto(photo);
			if(result2 > 0) {
				model.addAttribute("msg", "회원가입이 완료 되었습니다. 로그인해주세요.");
				
				mailsender.mailSendWithUserKey(u.getEmail(),u.getUserId(),request);// 이메일은 보내주는 부분
				
				return "redirect:goHome.do";
			}
			else {
				throw new UserException("회원가입 실패!!");
			}
		}else {
			//제대로 입력이 되지 않았을때
			throw new UserException("회원가입 실패!!");
		}
	}

	
	//////////////////////////id 중복 검사를 위해서////////////////////////////////////////////////////////////////
	@RequestMapping("checkid.do")
	public ModelAndView idDuplicateCheck(ModelAndView mv, String id) {
		
		boolean isUsable = uService.checkIdDup(id) == 0 ? true : false;
		
		Map map = new HashMap();
		map.put("isUsable", isUsable);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		
		return mv; // json객체로 넘어감
	}	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:goHome.do";
	}

	
	// mypage 정보수정버튼->비밀번호 확인용 ajax
	@RequestMapping("checkPwd1.do")
	public ModelAndView pwdCheck(ModelAndView mv, String pwdChk, int userNum) {
		boolean isPwdCheck = true; 
		System.out.println("------user컨트롤러------");
		System.out.println("userNum : " + userNum);
		System.out.println("pwdChk : " + pwdChk);
		
		User loginUser = uService.pwdCheck(userNum, pwdChk);
		System.out.println("가져온 애 : " + loginUser);
		
		if(loginUser != null) {
			isPwdCheck = true;
			
		}else {
			isPwdCheck = false;
		}
		
		Map map = new HashMap();
		map.put("isPwdCheck", isPwdCheck);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		return mv; // json객체로 넘어감
	}
	
	//회원 탈퇴
	@RequestMapping("udelete.do")
	public String userDelete(
			Model model,
			RedirectAttributes rd,
			 SessionStatus status,
			 HttpSession session
			) {
		
		
		User user = (User) session.getAttribute("loginUser");
		System.out.println("------user컨트롤러------");
		System.out.println("[udelete.do] 탈퇴하기");
		System.out.println("userNum : " + user.getUserNum());
		
		int result = uService.deleteUser(user.getUserNum());
		
		// 결제 해놔도 걍 탈퇴시킬 거임,,,
		if(result>0) {
			rd.addFlashAttribute("msg", "회원 탈퇴가 완료 되었습니다. 환불 관련 내용은 관리자에게 문의해주세요.(OneFit@onefit.com)");
			status.setComplete();
			return "redirect:goHome.do";
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	
	// 정보수정  
	@RequestMapping("userUpdate.do")
	public String userUpdate(
			User u, Model model, RedirectAttributes rd,
			HttpServletRequest request, HttpSession session,
			@RequestParam(value="profile", required=false) MultipartFile file) { 
		
		System.out.println("------user컨트롤러------");
		System.out.println("[userUpdate.do] 회원정보수정");
		System.out.println("userNum : " + u.getUserNum());
		System.out.println("user u"+u);
		System.out.println("file : " + file);
		//프사 관련 내용
		if(file != null && !file.isEmpty()) { // 업로드 된 파일이 있다면
			
			if(u.getChName() != null) { // 기존 파일이 있다면
				deleteFile(u.getChName(), request); // 서버에서 파일 삭제
			}
			
			//사진저장
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) { // 잘 저장 되었다면
				u.setOrgName(file.getOriginalFilename());
				u.setChName(renameFileName);
			}
		}
		int result = 0;
		
		
		// 프사 + 수정된 정보 업데이트하기
		if(!u.getUserPwd().equals("")) { // 비밀번호를 입력 했을 때
			result = uService.userUpdate(u);
			
		}else {
			System.out.println("비밀번호 입력 안했을때 : "+ u.getUserPwd());
			User user = (User)request.getSession().getAttribute("loginUser");
			u.setUserPwd(user.getUserPwd());
			model.addAttribute("loginUser",u);
			 result = uService.userUpdate1(u);
		}
		
		
		System.out.println("최종수정 user : " + u);
		//일반회원정보 가져오기(세션에는...얘를 담아야되기때문...)

		if(result > 0) {
			//정보수정이 성공하면, 세션을 새로고침하기위해 db한번 갔다올것.
			User user = uService.selectUser1(u.getUserNum());
			
			//건강 정보 셀렉.
			Health h = healthService.selectHealth(user.getUserNum());
			if(h !=null) {//유저 헬스정보없으면 세팅 안함
				//userVO에 세팅
				user.setHealthNum(h.getHealthNum());
				user.setHeight(h.getHeight());
				user.setWeight(h.getWeight());
				user.setFat(h.getFat());
				user.setGoal(h.getGoal());
				user.setReason(h.getReason());
				user.setCheckDate(h.getCheckDate());
			}
			
			System.out.println("셀렉한 user : " + user);
			rd.addFlashAttribute("msg","회원정보 수정이 완료되었습니다.");
			
			model.addAttribute("loginUser",user);
			return "redirect:usermypage.do";
		}else {
			model.addAttribute("msg","회원정보수정 실패!!!");
			return "common/errorPage";
		}
	}
	
	
	// 몸상태 수정
	@RequestMapping("bodyUpdate.do")
	public String bodyUpdate(User u,Model model, RedirectAttributes rd) {
		System.out.println("뷰에서 가져온 유저 : " + u);
		int result = uService.bodyUpdate(u);
		
		if(result > 0) {
			User user = uService.selectUser1(u.getUserNum());
			//건강 정보 셀렉.
			Health h = healthService.selectHealth(user.getUserNum());
			if(h !=null) {//유저 헬스정보없으면 세팅 안함
				//userVO에 세팅
				user.setHealthNum(h.getHealthNum());
				user.setHeight(h.getHeight());
				user.setWeight(h.getWeight());
				user.setFat(h.getFat());
				user.setGoal(h.getGoal());
				user.setReason(h.getReason());
				user.setCheckDate(h.getCheckDate());
			}

			
			
			System.out.println("------user컨트롤러------");
			System.out.println("[bodyUpdate.do] 몸정보업데이트");
			System.out.println("userNum : " + u.getUserNum());
			
			model.addAttribute("loginUser",user);
			rd.addFlashAttribute("msg","회원정보 수정이 완료되었습니다.");
			
			return "redirect:usermypage.do";
			}else {
				model.addAttribute("msg","회원정보수정 실패!!!");
				return "common/errorPage";
			}
	}
	
	////////////////////결제 할때//////////////////////////////
	@RequestMapping("insertpay.do")
	public String insertPay(Payment p,Model model, RedirectAttributes rd,HttpServletRequest request) {
		//현재 접속중인 로그인 유저 가져오기.
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		
		if(p.getCate()==1) { //일반회원
			if(p.getPrice()==100000) {
				p.setMonth(1);
			}else if(p.getPrice()==500000) {
				p.setMonth(3);
			}else if(p.getPrice()==800000) {
				p.setMonth(9);
			}else if(p.getPrice()==1300000) {
				p.setMonth(12);
			}
		}else { //PT회원 
			if(p.getPrice()==700000){
				p.setPtMonth(10);
			}else if(p.getPrice()==2000000){
				p.setPtMonth(20);
			}else if(p.getPrice()==4000000){
				p.setPtMonth(30);
			}else if(p.getPrice()==6300000){
				p.setPtMonth(50);
			}
		}
		System.out.println(p+"2");
		int result = uService.insertPay(p,loginUser); //결제 테이블에다가 
		
		if(result > 0) {
			
			rd.addFlashAttribute("msg","결제가 완료되었습니다.");
			model.addAttribute("Payment",p);
			User user = uService.selectUser1(p.getUserNum()); //바뀐 정보를 로그인 유저에다가 저장하려고
			//건강 정보 셀렉.
			Health h = healthService.selectHealth(user.getUserNum());
			if(h !=null) {//유저 헬스정보없으면 세팅 안함
				//userVO에 세팅
				user.setHealthNum(h.getHealthNum());
				user.setHeight(h.getHeight());
				user.setWeight(h.getWeight());
				user.setFat(h.getFat());
				user.setGoal(h.getGoal());
				user.setReason(h.getReason());
				user.setCheckDate(h.getCheckDate());
			}
			model.addAttribute("loginUser",user);
			rd.addFlashAttribute("msg","결제완료~~~");
			return "redirect:usermypage.do"; //이걸 이제 여기로 보내서 pt면 pt 화면을 바꿈
		}else {
			model.addAttribute("msg","결제 실패!!!");
			return "common/errorPage";
		}
	}
	
	
	
	
	
	///////////////////////////파일을 다른이름으로 저장을 위해서//////////////////////////////////////
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resource");

		String savePath = root + "//profileImage"; // 파일 경로 수정

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

  