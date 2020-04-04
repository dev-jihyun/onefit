package com.kh.onefit.train.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onefit.common.model.vo.PageInfo;
import com.kh.onefit.common.model.vo.Pagination;
import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.health.model.vo.Health;
import com.kh.onefit.train.model.dao.TrainerDao;
import com.kh.onefit.train.model.vo.ManagerTrainer;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.train.model.vo.TrainerInfos;
import com.kh.onefit.train.model.vo.TrainerLesson;
import com.kh.onefit.train.model.vo.TrainerMemberHealth;
import com.kh.onefit.train.model.vo.TrainerMemberList;

@Service("TrainerService")
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	private TrainerDao tDao;
	
	//트레이너의 건강정보를 가져오기 위해서
	@Override
	public Health getHeatlInform(int trNum) {
		// TODO Auto-generated method stub
		return tDao.getHealthInform(trNum);
	}
	
	//트레이너의 수업 정보를 가져오기 위해서
	@Override
	public ArrayList<TrainerLesson> getTodayTrainerLesson(int trNum) {
		// TODO Auto-generated method stub
		return tDao.getTodayTrainerLesson(trNum);
	}

	//트레이너의 프로필 사진을 가져오기 위해서
	@Override
	public Photo getProfile(int trNum) {
		// TODO Auto-generated method stub
		return tDao.getProfile(trNum);
	}

	//트레이너의 정보를 업데이트 하기 위해
	@Override
	public int updateTrainer(Trainer t) {
		// TODO Auto-generated method stub
		return tDao.updateTrainer(t);
	}

	//트레이너의 사진 정보를 업데이트 하기위해
	@Override
	public int update(Photo photo) {
		// TODO Auto-generated method stub
		return tDao.updatePhoto(photo);
	}

	//해당 트레이너의 회원정보를 담기 위해
	@Override
	public ArrayList<TrainerMemberList> getMemberList(int trNum, int currentPage) {
		// TODO Auto-generated method stub
		
		//몇개 있는지 세기 위해서
		int listCount = tDao.getListCount(trNum); //해당 트레이너의 총 회원수를 가져오는 부분
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return tDao.getMemberList(pi,trNum);
	}

	//해당 트레이너 회원의 건강정보를 담기 위해서
	@Override
	public ArrayList<TrainerMemberHealth> getMemberHealth(int trNum) {
		// TODO Auto-generated method stub
		return tDao.getMemberHealth(trNum);
	}
	
	// 트레이너 정보를 뽑아오기 위해서
	@Override
	public ArrayList<TrainerInfos> selectList(){  
		return tDao.selectList();  
	}

	//해당 회원의 건강정보를 뽑아 오기 위해서
	@Override
	public TrainerMemberHealth memberHealthInform(int userNum) {
		// TODO Auto-generated method stub
		return tDao.memberHealthInform(userNum);
	}

	//해당 회원의 건강 정보를 수정하기 위해서
	@Override
	public int updateMemberHealth(TrainerMemberHealth tmh) {
		// TODO Auto-generated method stub
		return tDao.updateMemberHealth(tmh);
	}
	
	//해당 트레이너의 회원 정보를 모두 뽑아오기 위해서
	@Override
	public ArrayList<Object> excelMemberList(int trNum) {
		// TODO Auto-generated method stub
		return tDao.excelMemberList(trNum);
	}

	//이름을 검색해서 결과 가져오고 그에따른 페이징
	@Override
	public ArrayList<TrainerMemberList> searchName(int trNum, int currentPage, String memberName) {
		// TODO Auto-generated method stub
		//몇개 있는지 세기 위해서
		Trainer t = new Trainer();
		t.setTrName(memberName);
		t.setTrNum(trNum);
		int listCount = tDao.searchNameCount(t); //해당 트레이너의 총 회원수를 가져오는 부분
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		return tDao.searchNameList(pi,t);
	}
	
	//해당 날짜의 트레이너 수업을 가져오기 위해서
	@Override
	public ArrayList<TrainerLesson> trainerLesson(int trNum, String getDate, int currentPage) {
		// TODO Auto-generated method stub
		
		int listCount = tDao.getLessonCount(trNum,getDate); //해당 트레이너의 총 회원수를 가져오는 부분
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return tDao.traineLessonList(pi,trNum,getDate);
	}
	
	//해당 날짜의 트레이너 수업을 가져오기 위해서
	@Override
	public ArrayList<Object> excelLessonList(String getDate, int trNum) {
		// TODO Auto-generated method stub
		return tDao.excelLessonList(trNum,getDate);
	}

	@Override
	public ArrayList<ManagerTrainer> ManagerSelectList(int currentPage) {
		
		int listCount = tDao.getTrainerListCount(); //해당 트레이너의 총 회원수를 가져오는 부분
		System.out.println("사이즈 : " + listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		return tDao.ManagerSelectList(pi);
}

	public ArrayList<Object> excelMemberHealth(int trNum) {
		// TODO Auto-generated method stub
		return tDao.excelMemberHealth(trNum);

	}
	
	
	
	



}
