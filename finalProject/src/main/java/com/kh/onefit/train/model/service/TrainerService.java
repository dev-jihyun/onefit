package com.kh.onefit.train.model.service;

import java.util.ArrayList;

import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.health.model.vo.Health;
import com.kh.onefit.train.model.vo.ManagerTrainer;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.train.model.vo.TrainerInfos;
import com.kh.onefit.train.model.vo.TrainerLesson;
import com.kh.onefit.train.model.vo.TrainerMemberHealth;
import com.kh.onefit.train.model.vo.TrainerMemberList;

public interface TrainerService {

	Health getHeatlInform(int trNum);

	ArrayList<TrainerLesson> getTodayTrainerLesson(int trNum);

	Photo getProfile(int trNum);

	int updateTrainer(Trainer t);

	int update(Photo photo);

	ArrayList<TrainerMemberHealth> getMemberHealth(int trNum);

	ArrayList<TrainerMemberList> getMemberList(int trNum, int currentPage);


	// 트레이너 정보 뽑아오기
	ArrayList<TrainerInfos> selectList();    
  
	TrainerMemberHealth memberHealthInform(int userNum);

	int updateMemberHealth(TrainerMemberHealth tmh);

	ArrayList<Object> excelMemberList(int trNum);

	ArrayList<TrainerMemberList> searchName(int trNum, int currentPage, String memberName);

	ArrayList<TrainerLesson> trainerLesson(int trNum, String getDate, int currentPage);

	ArrayList<Object> excelLessonList(String getDate, int trNum);
	
	ArrayList<ManagerTrainer> ManagerSelectList(int currentPage);

	ArrayList<Object> excelMemberHealth(int trNum);

}
