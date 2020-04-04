package com.kh.onefit.excercise.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.onefit.excercise.model.vo.Excercise;
import com.kh.onefit.excercise.model.vo.ExcerciseContent;
import com.kh.onefit.user.model.vo.User;


public interface ExcerciseService {

	public int insertExcercise(Excercise excercise); //운동일지 입력

	public Excercise getExcercise(Excercise excer);

	public ArrayList<ExcerciseContent> getExcerciseContent(int jrNum);

	public int insertExcerciseContent(ExcerciseContent exc);

	public int decCount(int userNum);

	public ArrayList<User> getDelMember();

	public int updateDate(List<User> delMember);

	public int delPt();

	public int updateExcercise(Excercise excercise);

	public int updateExcerContent(ExcerciseContent exlist);

	public int delExcontent(int exNum);

	//pt회원의 운동일지 조회
	public ArrayList<Excercise> selectPtExerciseList(int userNum);

	public ArrayList<Excercise> selectPtExcercise(int jrNum);

	
}
