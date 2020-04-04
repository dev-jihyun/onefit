package com.kh.onefit.excercise.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onefit.attendence.exception.AttendenceException;
import com.kh.onefit.attendence.model.service.AttendenceService;
import com.kh.onefit.attendence.model.vo.Attendence;
import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.excercise.model.exception.ExcerciseException;
import com.kh.onefit.excercise.model.service.ExcerciseService;
import com.kh.onefit.excercise.model.vo.Excercise;
import com.kh.onefit.excercise.model.vo.ExcerciseContent;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.user.model.vo.User;



@SessionAttributes({ "loginUser", "userType", "msg" })

@Controller
public class ExcerciseController {

	@Autowired
	ExcerciseService excerciseService;

	@Autowired
	AttendenceService aService;

	// 출석체크 화면으로 가는 부분
	@RequestMapping("doAttendance.do")
	public ModelAndView checkAttendance(HttpServletRequest request, ModelAndView mv, Date date, int userNum,
			String userName) {
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		mv.addObject("trainerProfile", profile);
		mv.addObject("loginUser", trainer);

		Excercise excer = new Excercise();
		excer.setUserNum(userNum);
		excer.setJrDate(date);
		excer.setTrNum(trainer.getTrNum());

		Excercise userExcer = excerciseService.getExcercise(excer); // 운동일지 가져오는 부분
		String[] checkedExpart = new String[6];

		System.out.println(userExcer);
		if (userExcer == null) { // 걍 비어있기 때문에 당연히 운동 종목 데이터도 비어있다.
			mv.addObject("excercise", excer); // 들어올때 받아온 정보
			mv.addObject("userName", userName); // 들어올때 받아온 이름
			mv.addObject("excerciseContent", "nothing");
		} else { // 비어있지 않으니까 운동종목 테이블에서 운동 종목들을 가지고 온다.

			String[] expart = userExcer.getExPart().split(",");

			ArrayList<ExcerciseContent> ecl = excerciseService.getExcerciseContent(userExcer.getJrNum());
			if (ecl.isEmpty()) {
				throw new ExcerciseException("운동 종목 내용을 가져오는데 오류가 발생함");
			} else {
				mv.addObject("excercise", userExcer); // 운동 정보 가져오는 부분
				mv.addObject("userName", userName); // 회원 이름 넣는곳
				mv.addObject("excerciseContent", ecl); // 만약에 비어있지않으면 회원이 이전에 한 운동정보를 담아두는곳
			}
			// 회원의 운동 부위 배열에 담기
			for (int i = 0; i < expart.length; i++) {
				switch (expart[i]) {
				case "가슴":
					checkedExpart[0] = "checked";
					break;
				case "어깨":
					checkedExpart[1] = "checked";
					break;
				case "등":
					checkedExpart[2] = "checked";
					break;
				case "팔":
					checkedExpart[3] = "checked";
					break;
				case "복부":
					checkedExpart[4] = "checked";
					break;
				case "하체":
					checkedExpart[5] = "checked";
					break;
				}
			}
			mv.addObject("checkedExpart", checkedExpart);
		}
		// 운동일지 테이블에서 해당 날짜와 해당 회원번호 그리고 트레이너번호 인 정보를 가져온다.
		mv.setViewName("trainer/checkAttendance");

		return mv;
	}

	// 운동일지 저장하는 부분
	@RequestMapping("insertExcercise.do")
	public String insertExcercise(HttpServletRequest request, Excercise excercise, Model model, String check) {
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		model.addAttribute("trainerProfile", profile);
		model.addAttribute("loginUser", trainer);

		excercise.setTrNum(trainer.getTrNum());

		String[] eName = request.getParameterValues("eName");
		String[] count = request.getParameterValues("count");
		String[] set = request.getParameterValues("set");
		String[] memo = request.getParameterValues("memo");
		String[] exNum = request.getParameterValues("exNum");

		int excerContentlength = eName.length;
		List<ExcerciseContent> exlist = new ArrayList<>(); // jsp에서 가져온 운동 종목 정보를 입력하는 부분
		for (int i = 0; i < excerContentlength; i++) {
			ExcerciseContent ec = new ExcerciseContent();
			// 일지 번호는 그 이전에 가장 최근 시퀀스를 가져오면 된다.
			ec.seteName(eName[i]);
			ec.setCount(Integer.parseInt(count[i]));
			ec.setSet(Integer.parseInt(set[i]));
			ec.setMemo(memo[i]);
			ec.setJrNum(excercise.getJrNum());
			exlist.add(ec);
		}
		// 기존에 DB에 저장되어있던 운동 종목

		switch (check) {
		case "insert":
			// 운동 일지 입력
			int result1 = excerciseService.insertExcercise(excercise);

			if (result1 > 0) { // 운동일지가 올바르게 저장이 되었다면 여기에 진입
				// 1. 운동 종목을 입력
				for (int i = 0; i < excerContentlength; i++) {
					ExcerciseContent ec = new ExcerciseContent();
					// 일지 번호는 그 이전에 가장 최근 시퀀스를 가져오면 된다.
					ec.seteName(eName[i]);
					ec.setCount(Integer.parseInt(count[i]));
					ec.setSet(Integer.parseInt(set[i]));
					ec.setMemo(memo[i]);
					int result2 = excerciseService.insertExcerciseContent(ec);
					if (result2 < 0) {
						throw new ExcerciseException("이거 입력하는데 오류가 생겼다.");
					}
				}
				// 2. count 줄이는 부분
				int result3 = excerciseService.decCount(excercise.getUserNum());
				if (result3 < 0) {
					throw new ExcerciseException("카운트 줄이는데 오류가 생겼다.");
				}

				// 3. pt테이블에서 count가 0인 애들 조회
				List<User> delMember = excerciseService.getDelMember();

				// 4. 0인애들 시작 날짜와 끝나는 날짜 수정
				if (!delMember.isEmpty()) { // 0인 애들 리스트가 비어있지 않으면 진입
					for (User u : delMember) { // 0인 애들 날짜 수정하기 위해서
						long calDate = u.getEndDate().getTime() - u.getStartDate().getTime();
						long calDateDays = calDate / (24 * 60 * 60 * 1000);

						calDateDays = Math.abs(calDateDays);
						Calendar startDate = Calendar.getInstance();
						Calendar endDate = Calendar.getInstance();
						endDate.add(Calendar.DATE, (int) calDateDays);

						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

						u.setStartDate(startDate.getTime());
						u.setEndDate(endDate.getTime());
					}

					// 5. 0인애들 시작 날짜와 끝나는 날짜 DB에서 수정
					int result4 = excerciseService.updateDate(delMember);
					// 6. 0인 애들 PT테이블에서 삭제
					if (result4 > 0) { // 수정이 완료 되지 않으면
						int result5 = excerciseService.delPt();
						if (result5 < 0) {
							throw new ExcerciseException("PT테이블 삭제하는데 문제 생김");
						}
					} else { // 수정중 오류 생기면
						throw new ExcerciseException("날짜 수정하는데 오류가 생겼다.");
					}

				} else {
					System.out.println("0인 애들이 없거나 오류임");
				}
			} else {
				throw new ExcerciseException("운동 일지를 입력을 못함");
			}
			break;
		////////////////////////////////// 수정
		////////////////////////////////// 부분//////////////////////////////////////////
		case "update":
			// 업데이트 할때는 count 줄이면 안됨 그냥 업데이트만 해야함
			// 1. 운동 종목 부분의 리스트를 가져온다.
			int updateResult1 = excerciseService.insertExcercise(excercise);
			if (updateResult1 > 0) {
				for (int i = 0; i < excerContentlength; i++) {
					ExcerciseContent ec = new ExcerciseContent();
					ec.setExNum(exlist.get(i).getExNum());
					ec.setJrNum(exlist.get(i).getJrNum());
					ec.seteName(exlist.get(i).geteName());
					ec.setCount(exlist.get(i).getCount());
					ec.setSet(exlist.get(i).getSet());
					ec.setMemo(exlist.get(i).getMemo());

					System.out.println(ec);

					int updateResult2 = excerciseService.updateExcerContent(ec);
					if (updateResult2 <= 0) {
						throw new ExcerciseException("운동 종목 수정하는데 실패함");
					}
				}
			} else {
				throw new ExcerciseException("운동 일지 수정하는데 실패함");
			}

			break;
		}

		return "redirect:trainerAttendance.do";
	}

	// jsp에서 -버튼 누르면 삭제 되어지는것
	@RequestMapping("delExcontent.do")
	public ModelAndView idDuplicateCheck(ModelAndView mv, int exNum) {

		boolean isUsable = excerciseService.delExcontent(exNum) > 0 ? true : false;

		Map map = new HashMap();
		map.put("isUsable", isUsable);

		mv.addAllObjects(map);

		mv.setViewName("jsonView");

		return mv; // json객체로 넘어감
	}

	// 운동일지, 헬스장 이력 조회
	@RequestMapping("elist.do")
	public ModelAndView selectExerciseList(ModelAndView mv, HttpSession session) {
		User u = (User) session.getAttribute("loginUser");
		
		//pt회원의 헬스장 출석
		ArrayList<Attendence> alist = aService.selectList(u);
		// 나의 PT 운동일지 조회용,,,
		ArrayList<Excercise> elist = excerciseService.selectPtExerciseList(u.getUserNum());
System.out.println("elist : "+ elist);
System.out.println("alist : "+ alist);
		mv.addObject("elist", elist);
		mv.addObject("alist", alist);
		mv.setViewName("pt/exercise");

		return mv;
	}

	// 운동일지 조회
	@RequestMapping("exercise.do")
	public ModelAndView exercise(ModelAndView mv, HttpSession session) {
		User u = (User) session.getAttribute("loginUser");
		ArrayList<Attendence> list = aService.selectList(u);

		// 일반회원
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("user/exercise");

		} else {
			throw new AttendenceException("조회실패!");
		}

		return mv;
	}
	// 운동일지 조회
	@RequestMapping("ptExDetail.do")
	public ModelAndView exercise(ModelAndView mv, HttpSession session, int jrNum) {
		
		Excercise t = new Excercise();
		t.setJrNum(jrNum);
		ArrayList<Excercise> list = excerciseService.selectPtExcercise(jrNum);
		// 일반회원
		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("pt/exerciseDetail");

		} else {
			throw new AttendenceException("조회실패!");
		}

		return mv;
	}	
	
}
