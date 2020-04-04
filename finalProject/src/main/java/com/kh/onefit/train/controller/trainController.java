package com.kh.onefit.train.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.health.model.vo.Health;
import com.kh.onefit.train.model.exception.TrainerException;
import com.kh.onefit.train.model.service.TrainerService;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.train.model.vo.TrainerLesson;
import com.kh.onefit.train.model.vo.TrainerMemberHealth;
import com.kh.onefit.train.model.vo.TrainerMemberList;
import com.kh.onefit.user.model.exception.UserException;
import com.kh.onefit.user.model.vo.User;


@SessionAttributes({"msg","loginUser"})

@Controller
public class trainController {

	@Autowired
	private TrainerService trainService;
	
	//트레이너 마이페이지
	@RequestMapping("trainerMyPage.do")
	public String trainerMyPage(HttpServletRequest request, Model model){
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		model.addAttribute("trainerProfile",profile);
		model.addAttribute("loginUser",trainer);
		
		//건강정보와 금일 수업 리스트를 받아오기 위해서
		
		HashMap<String, Object> map = new HashMap<>();
		
		//건강정보
		Health th = trainService.getHeatlInform(trainer.getTrNum());
		if(th == null) {
			map.put("th","nothing");
		}else {
			map.put("th", th);

		}
		//2. 금일 수업 리스트 가져오기
		ArrayList<TrainerLesson> tl = trainService.getTodayTrainerLesson(trainer.getTrNum());
		if(tl.isEmpty()) {
			map.put("tl","nothing");
		}else {
			map.put("tl", tl);
		}
		model.addAttribute("trainerInforms", map);
		return "trainer/myPage";
	}
	///////////////////////////////////////트레이너 회원 관리/////////////////////////////////////////////////////////
	@RequestMapping("trainerMemberList.do")
	public ModelAndView trainerMemberList(HttpServletRequest request, ModelAndView mv,@RequestParam(value="page", required = false) Integer page){
		
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		mv.addObject("trainerProfile",profile);
		mv.addObject("loginUser",trainer);
		
		HashMap<String, Object> map = new HashMap<>(); //정보들을 담을 map
		
		int currentPage = page != null ? page : 1; //현재 페이지를 나타내기 위해서
		
		//DB에서 가져올 정보
		//일단 어떤 트레이너의 페이징을 할지 알아야 하기 때문에 트레이너 번호를 Pagination에 집어 넣어야 한다.
		
		//1. 회원 리스트
		ArrayList<TrainerMemberList> tml = trainService.getMemberList(trainer.getTrNum(),currentPage);
		if(tml.isEmpty()) {
			map.put("tml", "nothing");
		}else {
			map.put("tml", tml);
		}
		
		//2. 회원 건강정보 리스트
		ArrayList<TrainerMemberHealth> tmh = trainService.getMemberHealth(trainer.getTrNum());
		if(tmh.isEmpty()) {
			map.put("tmh", "nothing");
		}else {
			map.put("tmh",tmh);
		}
		
		//3. 이번달 등록한 회원 list 구할라고
		if(newMember(tml).isEmpty()) {
			map.put("newMember", "nothing");
		}else {
			map.put("newMember", newMember(tml));
		}
		
		//4. 건강정보 등록 필요한 회원
		if(needUpdate(tmh).isEmpty()) {
			map.put("needUpdate", "nothing");
		}else {
			map.put("needUpdate", needUpdate(tmh));
		}
		
		////////////////전달////////////////////
		mv.addObject("trainerMemberInform",map);
		mv.setViewName("trainer/memberList");
		mv.addObject("pi",Pagination.getPageInfo());
		return mv;
	}
	
	@RequestMapping("updateTrainerMemberHealth.do")
	public ModelAndView updateTrainerMemberHealth(TrainerMemberHealth tmh,ModelAndView mv) {
		
		int result = trainService.updateMemberHealth(tmh);
		
		if(result>0) {
			mv.setViewName("redirect:trainerMemberList.do");
		}else {
			new TrainerException("회원 건강 정보 수정 실패!!");
		}
		
		mv.setViewName("redirect:trainerMemberList.do");
		
		return mv;
	}
	//해당 회원의 건강 정보를 가져오는 부분
	@RequestMapping(value="getPtMemberHealth.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public String getMemberHealth(ModelAndView mv, int userNum) {;
		
		TrainerMemberHealth tmh = trainService.memberHealthInform(userNum);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		return gson.toJson(tmh);//왜 이렇게 하는지 모르겠다.
	}
	
	//이번달 등록 회원 목록 구하는 메소드
	public ArrayList<TrainerMemberList> newMember(ArrayList<TrainerMemberList> tml){
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String thisMonth = sdf.format(today);
		
		ArrayList<TrainerMemberList> thisMonthList = new ArrayList<>();
		
		//3. 이번달 등록 회원만 가져옴
		for(int i = 0; i<tml.size();i++) {
			String payDate = sdf.format(tml.get(i).getPayDate());
			if(thisMonth.equals(payDate)) {
				thisMonthList.add(tml.get(i));
			}
		}
		return thisMonthList;
		
	}
	
	//건강 정보 갱신 필요한 회원리스트를 구하는 메소드
	public ArrayList<TrainerMemberHealth> needUpdate(ArrayList<TrainerMemberHealth> tmh){
		
		ArrayList<TrainerMemberHealth> needUpdate = new ArrayList<>();
		Calendar today = Calendar.getInstance();
		today.add(today.MONTH,-2); //오늘로부터 두달전으로 시간 설정함
		
		for(int i = 0;i<tmh.size();i++) {
			Calendar checkDate = Calendar.getInstance();
			if(tmh.get(i).getCheckDate() == null) { //애초에 비어있을때
				System.out.println(tmh.get(i));
				needUpdate.add(tmh.get(i));
			}else {
				checkDate.setTime(tmh.get(i).getCheckDate());
				int result = today.compareTo(checkDate);
				switch(result) {
				case 0:
				case 1: //건강정보 체크된 날짜가 오늘로부터 두달전보다 작거나 같으면 needUpdate에 추가시킨다.
					needUpdate.add(tmh.get(i));
					break;
				}
				
			}
		}
		return needUpdate;
	}
	
	//이름을 검색해서 페이징
	@RequestMapping("searchName.do")
	public ModelAndView searchName(String memberName,HttpServletRequest request, ModelAndView mv,@RequestParam(value="page", required = false) Integer page) {
		
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		mv.addObject("trainerProfile",profile);
		mv.addObject("loginUser",trainer);
		
		HashMap<String, Object> map = new HashMap<>(); //정보들을 담을 map
		
		int currentPage = page != null ? page : 1; //현재 페이지를 나타내기 위해서
		
		//DB에서 가져올 정보
		//일단 어떤 트레이너의 페이징을 할지 알아야 하기 때문에 트레이너 번호를 Pagination에 집어 넣어야 한다.
		
		//1. 회원 리스트
		ArrayList<TrainerMemberList> tml = trainService.searchName(trainer.getTrNum(),currentPage,memberName);
		
		if(tml.isEmpty()) {
			map.put("tml", "nothing");
		}else {
			map.put("tml", tml);
		}
		
		//2. 회원 건강정보 리스트
		ArrayList<TrainerMemberHealth> tmh = trainService.getMemberHealth(trainer.getTrNum());
		if(tmh.isEmpty()) {
			map.put("tmh", "nothing");
		}else {
			map.put("tmh",tmh);
		}
		
		//3. 이번달 등록한 회원 list 구할라고
		if(newMember(tml).isEmpty()) {
			map.put("newMember", "nothing");
		}else {
			map.put("newMember", newMember(tml));
		}
		
		//4. 건강정보 등록 필요한 회원
		if(needUpdate(tmh).isEmpty()) {
			map.put("needUpdate", "nothing");
		}else {
			map.put("needUpdate", needUpdate(tmh));
		}
		
		////////////////전달////////////////////
		mv.addObject("trainerMemberInform",map);
		mv.setViewName("trainer/memberList");
		mv.addObject("pi",Pagination.getPageInfo());
		return mv;
	}
	
	
	/////////////////////////////////트레이너 회원 관리 끝//////////////////////////////
	@RequestMapping("trainerSchedule.do")
	public String trainerSchedule(HttpServletRequest request, Model model) {
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		model.addAttribute("trainerProfile",profile);
		model.addAttribute("loginUser",trainer);
		return "trainer/trainerSchedule";
	}
	
	/////////////////////////////트레이너 출석체크 리스트 구하는 부분//////////////////////////////
	@RequestMapping("trainerAttendance.do")
	public String trainerAttendance(HttpServletRequest request, Model model,@RequestParam(value="page", required = false) Integer page,
			@RequestParam(value="date", required = false) String date) {
		
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		model.addAttribute("trainerProfile",profile);
		model.addAttribute("loginUser",trainer);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String getDate = date != null ? date : format.format(new Date()); //받은 날짜가 있으면 date를 그대로 집어 넣고 아니면 오늘 날짜를 date로 집어 넣는다.
		int currentPage = page != null ? page : 1;
		
		
		//위에서 날짜를 구했다.
		
		//이제 해야할것
		
		//해당날짜의 회원 정보를 가져와야 한다.
		ArrayList<TrainerLesson> todayLesson = trainService.trainerLesson(trainer.getTrNum(),getDate,currentPage);
		
		if(todayLesson.isEmpty()) {
			model.addAttribute("todayLesson","nothing");
			model.addAttribute("date",getDate);
		}else {
			model.addAttribute("todayLesson",todayLesson);
		}
		model.addAttribute("pi",Pagination.getPageInfo());
		return "trainer/trainerAttendance";
	}
	@RequestMapping("trainerQuestion.do")
	public String answer(HttpServletRequest request, Model model) {
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		model.addAttribute("trainerProfile",profile);
		model.addAttribute("loginUser",trainer);
		return "trainer/answer";
	}
	
	////////트레이너 정보 수정 부분/////////////
	@RequestMapping("trainerUpdate.do")
	public String updateTrainerInform(Trainer t, Model model, RedirectAttributes rd,HttpServletRequest request,
			  @RequestParam(value="profile", required=false) MultipartFile file) {
		
		int result = trainService.updateTrainer(t);
		if(result > 0) {
			//제대로 입력이 됐을때
			Trainer loginUser = (Trainer) request.getSession().getAttribute("loginUser");
			t.setTrNum(loginUser.getTrNum());
			model.addAttribute("loginUser",t);
			Photo photo = (Photo) request.getSession().getAttribute("trainerProfile");;
			
			int tNum = loginUser.getTrNum();

			
			if(!file.getOriginalFilename().equals("")) { //파일이 바뀌었을때만
				String renameFileName = saveFile(file, request);
				
				if(renameFileName != null) {
					photo.setOrgName(file.getOriginalFilename());
					photo.setChName(renameFileName);
					photo.setCate(2);
					photo.setNumbs(tNum);
				}
				
				int result2 = trainService.update(photo);
				if(result2 > 0) {
					model.addAttribute("msg", "개인정보 수정이 완료되었습니다.");
					
					return "redirect:trainerMyPage.do";
				}
				else {
					throw new TrainerException("사진 수정 실패!!");
				}				
			}
		}else {
			//제대로 입력이 되지 않았을때
			throw new TrainerException("정보수정 실패!!");
		}
		return "redirect:trainerMyPage.do";
	}
	//////////사진 저장을 위해서 사용하는 메소드///////////
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
	
	@RequestMapping("trainerUpdateForm.do")
	public String trainerUpdate(HttpServletRequest request, Model model) {
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		model.addAttribute("trainerProfile",profile);
		model.addAttribute("loginUser",trainer);
		return "trainer/trainerUpdate";
	}
	
	
	
}
