package com.kh.onefit.home.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.health.model.service.HealthService;
import com.kh.onefit.health.model.vo.Health;
import com.kh.onefit.home.model.exception.HomeException;
import com.kh.onefit.home.model.service.HomeService;
import com.kh.onefit.train.model.exception.TrainerException;
import com.kh.onefit.train.model.service.TrainerService;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.train.model.vo.TrainerLesson;
import com.kh.onefit.user.model.service.UserMailSendService;
import com.kh.onefit.user.model.vo.User;



/**
 * Handles requests for the application home page.
 */
/////////////////////로그인한사람정보//어떤 유저인지//메시지전달위해//pt정보//트레이너관련정보담기위해
@SessionAttributes({"loginUser", "userType","msg", "trainerProfile"})

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService hService;
	
	@Autowired
	private UserMailSendService mailService;
	
	//trainerMypage에 들어가기 위해서 trainer 서비스가 필요함
	@Autowired
	private TrainerService trainService;
	
	//건강정보 따로 가져와야해서 HEALTHSERVICE선언
	@Autowired
	private HealthService healthService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("home.do")
	public String home(@RequestParam("choose") int check ,String userId, String password, Model model) {
		
		switch(check) {
		case 1: //일반 회원일때 들어옴
			//해줘야 할게 일반 회원이냐 pt회윈이냐 구별 해야함
			User Check = new User(userId,password);
			User user = hService.loginUser(Check);
			
			
			System.out.println("loginUser : " + user);
			if(user!=null) { //회원테이블에 존재 할때
				
				//건강 정보 셀렉.
				Health h = healthService.selectHealth(user.getUserNum());
				if(h !=null) {
					//유저 헬스정보없으면 세팅 안함
					//userVO에 세팅
					user.setHealthNum(h.getHealthNum());
					user.setHeight(h.getHeight());
					user.setWeight(h.getWeight());
					user.setFat(h.getFat());
					user.setGoal(h.getGoal());
					user.setReason(h.getReason());
					user.setCheckDate(h.getCheckDate());
				}
				System.out.println(user);
				int check2 = user.getStatus();
				
				if(check2 == 1) { //일반 회원일때
					model.addAttribute("loginUser", user);
					
					return "user/mypage";						
					
				}else if(check2 == 2) {
					//pt 회원일때
					model.addAttribute("loginUser", user);

					//PT마이페이지로
					return "pt/mypage";
					
				}else if(check2 == 4) {
					model.addAttribute("msg", "이메일 인증을 하지 않으셨습니다.이메일이 도착하지 않았다면 hankgood958@gmail.com으로 문의 해주세요.");
					return "redirect:goHome.do";
				}else{
					
					
					//회원가입만 하고 결제 안한 회원일때(관리자도 여기 포함)
					model.addAttribute("loginUser", user);
					System.out.println("결제안한회원 유저 : " + user);
					
					if(user.getUserId().equals("manager")) {
						return "redirect:qlist.do";
						
					}else {
						model.addAttribute("msg", "결제를 아직 하지 않으셨습니다. 결제 하시겠습니까?");
						return "redirect:pay.do";
					}
				}
			}else { //user가 널일때
				model.addAttribute("msg", "아이디 혹은 비밀번호가 틀렸습니다.");
				return "redirect:goHome.do";
			}
		case 2:
			//이쪽은 그냥 트레이너 이므로 여기로 들어와야 함
			Trainer checkTrainer = new Trainer(userId,password);
			Trainer trainer = hService.loginTrainer(checkTrainer);
			System.out.println("trainer : " + trainer);
			if(trainer != null) {
				//트레이너 테이블에 존재 할때
				HashMap<String, Object> map = new HashMap<>();
				// 마이페이지 가기전에 해야할것
				//1. 건강정보 가져오기
				Health th = trainService.getHeatlInform(trainer.getTrNum());
				if(th == null) {
					map.put("th","nothing");
				}else {
					map.put("th",th);
				}
				//2. 금일 수업 리스트 가져오기
				ArrayList<TrainerLesson> tl = trainService.getTodayTrainerLesson(trainer.getTrNum());
				if(tl.isEmpty()) {
					map.put("tl", "nothing"); //nothing을 저장
				}else {
					map.put("tl", tl);
				}
				//3. 내 사진 가져오기
				// 의문점 없는 정보를 가져오게 되면 이게 NULL 값인가?
				Photo profile = trainService.getProfile(trainer.getTrNum());
				/*System.out.println(profile);*/
				if(profile == null) {
					throw new TrainerException("프로필 사진 불러오는대 실패함ㅜ");
				}
				//이걸 하나의 arrayList에 키값을 통해서 넣는다?
				model.addAttribute("trainerInforms",map); //트레이너한테 필요한 고객 정보랑 건강정보를 담은 map을 넣음
				model.addAttribute("loginUser", trainer);//로그인된 트레이너 정보를 세션에 저장
				model.addAttribute("trainerProfile",profile);//프로필을 세션에다가 저장
				return "trainer/myPage";
				
				//어느 페이지를 가도 꼭 있어야할 정보는  사진정보랑 loginUser이다.
			}else {
				//트레이너 테이블에 존재하지 않을때
				model.addAttribute("msg", "아이디 혹은 비밀번호가 틀렸습니다.");
				return "redirect:goHome.do";
			}
		}
		model.addAttribute("msg", "뭔가 잘못됐다 여기 들어 오면 안된다.");
		return "redirect:goHome.do";
	}
	
	@RequestMapping("goHome.do")
	public String gotoFirst() { //로그인 창으로 다시 넘어 가는것
		return "redirect:/";
	}
	
	@RequestMapping("checkKey.do")
	public String CheckMail(@RequestParam("userId") String userId,Model model) {
		int result = mailService.alter_userKey_service(userId);
		if(result>0) {
			//status를 성공적으로 3으로 바꿔줬을떄 진입
			model.addAttribute("msg", "이메일 인증을 완료 했습니다!로그인 하여 이용해주세요!");
			return "redirect:goHome.do";
		}else {
			throw new HomeException("이메일 인증도중 오류가 발생했습니다.");
		}
	}
}
