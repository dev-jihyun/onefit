package com.kh.onefit.food.controller;

import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.servlet.ModelAndView;

import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.food.model.exception.FoodException;
import com.kh.onefit.food.model.service.FoodService;
import com.kh.onefit.food.model.vo.Food;
import com.kh.onefit.food.model.vo.MealInfo;
import com.kh.onefit.train.model.service.TrainerService;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.train.model.vo.TrainerMemberHealth;
import com.kh.onefit.user.model.vo.User;



@SessionAttributes({"loginUser", "userType","msg"})

@Controller
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private TrainerService trainService;
	
	//pt회원의 식단조회
	@RequestMapping("ptFoodList.do")
	public ModelAndView foodList(ModelAndView mv, HttpSession session ) {

		User user = (User)session.getAttribute("loginUser");
		Food finfo = new Food(user.getUserNum(), user.getTrNum());
		Food f = foodService.getFoodInfo(finfo);
		if(f != null) {
			ArrayList<MealInfo> mealList = foodService.getMealInfo(f.getFoodNum());
			if(mealList != null) {
				
				System.out.println("food : " + f);
				System.out.println("mealList : " + mealList);
				mv.addObject("food", f);
				mv.addObject("mealList", mealList);
				
			}else {
				throw new FoodException("식단 조회 실패");
				
			}
			
		}
		mv.setViewName("pt/foodList");
		return mv;
	}
	
	//트레이너 식단 화면 회원 리스트 출력 부분
	
	@RequestMapping("trainerFood.do")
	public String trainerFood(HttpServletRequest request, Model model,@RequestParam(value="page", required = false) Integer page) {
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		model.addAttribute("trainerProfile",profile);
		model.addAttribute("loginUser",trainer);
		
		int currentPage = page != null ? page : 1; //현재 페이지를 나타내기 위해서
		
		ArrayList<TrainerMemberHealth> tmh = foodService.getMemberHealth(trainer.getTrNum(),currentPage);
		
		if(tmh.isEmpty()) {
			model.addAttribute("tmh","nothing");
		}else {
			model.addAttribute("pi",Pagination.getPageInfo());
			model.addAttribute("tmh",tmh);
		}
		
		return "trainer/trainerFood";
	}
	
	//식단 추천해주는 화면으로 가는 부분
	@RequestMapping("tellFood.do")
	public String tellFood(HttpServletRequest request, Model model,int userNum,String userName) {
		
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		model.addAttribute("trainerProfile",profile);
		model.addAttribute("loginUser",trainer);
		
		Food check = new Food();
		check.setTrainNum(trainer.getTrNum());
		check.setUserNum(userNum);
		
		System.out.println(userName);
		
		TrainerMemberHealth tmh = trainService.memberHealthInform(check.getUserNum());
		
		if(tmh.getHeight() != 0 && tmh.getWeight()!=0 && tmh.getFat()!=0 && tmh.getGoal()!=0) { //건강 정보가 있어야지만 식단을 짤수 있기 때문에
			
			Calendar today = Calendar.getInstance();
			today.add(today.MONTH,-2); //오늘로부터 두달 전
			Calendar checkDate = Calendar.getInstance();
			System.out.println("건강정보 날짜"+tmh.getCheckDate());
			System.out.println("오늘 : "+today.getTime());
			checkDate.setTime(tmh.getCheckDate());
			int result = today.compareTo(checkDate);
			switch(result) {
			case 0:
			case 1: //건강정보 체크된 날짜가 오늘로부터 두달전보다 작거나 같으면 갱신하라고 해준다.
				System.out.println(result);
				model.addAttribute("checkHealth","건강 정보가 너무 오래됐습니다. 갱신후 식단을 짜주세요.");
				break;
			}
			
			//건강 정보 갱신이 두달 안된 사람들의 식단 정보를 가져옴
			Food food = foodService.getFoodInfo(check);
			if(food!=null) {
				System.out.println(food);
				ArrayList<MealInfo> mList = foodService.getMealInfo(food.getFoodNum());
				if(mList.isEmpty()) { //끼니정보만 비어있을떄
					System.out.println("끼니 정보가 없거나 못가져옴");
					model.addAttribute("food",food);
				}else { //식단 정보랑 끼니정보 모두 있을때
					model.addAttribute("meal",mList);
					model.addAttribute("food",food);
				}
			}else { //식단정보도 없고 끼니 정보도 없을떄
				System.out.println("식단 정보가 없거나 못가져옴");
			}
			model.addAttribute("tmh",tmh);
		}else {
			model.addAttribute("checkHealth","건강정보가 입력 되어 있어야지만 식단을 짜줄수가 있습니다.");
		}
		model.addAttribute("userName",userName);
		
		return "trainer/tellFood";
	}
	
	
	@RequestMapping("insertFood.do")
	public String insertFood(Food food,MealInfo mealInfo, HttpServletRequest request,Model model,String check) {
		
		Photo profile = (Photo) request.getSession().getAttribute("trainerProfile");
		Trainer trainer = (Trainer) request.getSession().getAttribute("loginUser");
		model.addAttribute("trainerProfile",profile);
		model.addAttribute("loginUser",trainer);
		
		food.setTrainNum(trainer.getTrNum());
		
		String[] carbo = request.getParameterValues("oneCarbo");
		String[] pro = request.getParameterValues("onePro");
		String[] fat = request.getParameterValues("oneFat");
		String[] mNum = request.getParameterValues("mNum");
		String[] meal = request.getParameterValues("oneMeal");
		
		int mealLength = carbo.length;
					
		switch (check) {
		case "insert":
			//운동 일지 입력
			int result1 = foodService.insertFood(food);

			if (result1 > 0) { // 운동일지가 올바르게 저장이 되었다면 여기에 진입
				//1. 운동 종목을 입력
				for (int i = 0; i < mealLength; i++) {
					MealInfo mi = new MealInfo();
					// 끼니 번호는 NEXTVAL
					//식단 정보를 CURVAL쓰면 된다.
					mi.setOneMeal(meal[i]); //끼니 입력
					mi.setOneCarbo(Integer.parseInt(carbo[i])); //탄수화물 입력
					mi.setOnePro(Integer.parseInt(pro[i])); //단백질 입력
					mi.setOneFat(Integer.parseInt(fat[i])); //지방 입력
					
					int result2 = foodService.insertMealInfo(mi);
					if (result2 < 0) {
						throw new FoodException("끼니 입력하는데 오류가 생겼다.");
					}
				}
	
			} else {
				throw new FoodException("식단 정보를 입력을 못함");
			}
			break;
		//////////////////////////////////수정 부분//////////////////////////////////////////
		case "update":
			
			int updateResult1 = foodService.insertFood(food);
			if(updateResult1>0) {
				for(int i = 0;i<mealLength;i++) {
					MealInfo mi = new MealInfo();
					
					if(!carbo[i].equals("")) {
						mi.setOneCarbo(Integer.parseInt(carbo[i])); //탄수화물 입력
					}else {
						mi.setOneCarbo(0); //탄수화물 입력
					}
					if(!pro[i].equals("")) {
						mi.setOnePro(Integer.parseInt(pro[i])); //단백질 입력
					}else {
						mi.setOnePro(0); //단백질 입력
					}
					if(!fat[i].equals("")) {
						mi.setOneFat(Integer.parseInt(fat[i])); //지방 입력
					}else{
						mi.setOneFat(0); //지방 입력
					}
					if(i >= mNum.length) {
						mi.setmNum(0); //끼니 번호 입력
					}else {
						mi.setmNum(Integer.parseInt(mNum[i])); //끼니 번호 입력
					}
					mi.setOneMeal(meal[i]);
					mi.setFoodNum(food.getFoodNum());
					int updateResult2 = foodService.updateMealInfo(mi);
					if(updateResult2<=0) {
						throw new FoodException("끼니 수정하는데 실패함");
					}
				}	
			}else {
				throw new FoodException("식단 정보 수정하는데 실패함");
			}
			break;
		}
		
		System.out.println(food);
		
		return "redirect:trainerFood.do";
	}
	
	//jsp에서 -버튼 누르면 삭제 되어지는것
	@RequestMapping("delMeal.do")
	public ModelAndView idDuplicateCheck(ModelAndView mv, int mNum) {
		
		boolean isUsable = foodService.delMeal(mNum) > 0 ? true : false;
		
		Map map = new HashMap();
		map.put("isUsable", isUsable);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		
		return mv; // json객체로 넘어감
	}
}
