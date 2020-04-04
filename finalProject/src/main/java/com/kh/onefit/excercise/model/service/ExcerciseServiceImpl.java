package com.kh.onefit.excercise.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.onefit.excercise.model.dao.ExcerciseDao;
import com.kh.onefit.excercise.model.vo.Excercise;
import com.kh.onefit.excercise.model.vo.ExcerciseContent;
import com.kh.onefit.user.model.vo.User;

@Service("excerciseService")
public class ExcerciseServiceImpl implements ExcerciseService{

	@Autowired
	private ExcerciseDao excerciseDao;
	
	//운동일지 저장하는 부분 입력 및 수정을 함
	@Override
	public int insertExcercise(Excercise excercise) {
		// TODO Auto-generated method stub
		return excerciseDao.insertExcercise(excercise);
	}
	
	//운동일지 가져오는 부분
	@Override
	public Excercise getExcercise(Excercise excer) {
		// TODO Auto-generated method stub
		return excerciseDao.getExcercise(excer);
	}
	//운동종목을 가져오는 부분
	@Override
	public ArrayList<ExcerciseContent> getExcerciseContent(int jrNum) {
		// TODO Auto-generated method stub
		return excerciseDao.getExcerciseContent(jrNum);
	}
	
	//운동 종목을 저장하는 부분 수정도 가능
	@Override
	public int insertExcerciseContent(ExcerciseContent exc) {
		// TODO Auto-generated method stub
		return excerciseDao.insertExcerciseContent(exc);
	}
	//출석체크를 완료 했을때 pt 횟수 감소 시키는 부분
	@Override
	public int decCount(int userNum) {
		// TODO Auto-generated method stub
		return excerciseDao.decCount(userNum);
	}
	//pt count가 0인 애들
	@Override
	public ArrayList<User> getDelMember() {
		// TODO Auto-generated method stub
		return excerciseDao.getDelMember();
	}
	
	//일반 회원이였던 pt 회원이 count가 종료 되면 헬스장 시작날짜와 끝나는 날짜 수정 부분
	@Override
	public int updateDate(List<User> delMember) {
		// TODO Auto-generated method stub
		return excerciseDao.updateDate(delMember);
	}
	//count가 0인 사람 pt테이블에서 없애기 위해서
	@Override
	public int delPt() {
		// TODO Auto-generated method stub
		return excerciseDao.delPt();
	}
	
	//운동일지 수정
	@Override
	public int updateExcercise(Excercise excercise) {
		// TODO Auto-generated method stub
		return excerciseDao.updateExcercise(excercise);
	}

	//운동 종목 수정
	@Override
	public int updateExcerContent(ExcerciseContent exlist) {
		// TODO Auto-generated method stub
		return excerciseDao.updateExcerContent(exlist);
	}
	
	//운동 종목을 지우기 위해서
	@Override
	public int delExcontent(int exNum) {
		// TODO Auto-generated method stub
		return excerciseDao.delExcontent(exNum);
	}

	//pt회원의 운동일지 조회
	@Override
	public ArrayList<Excercise> selectPtExerciseList(int userNum) {
		return excerciseDao.selectPtExerciseList(userNum);
	}

	@Override
	public ArrayList<Excercise> selectPtExcercise(int jrNum) {
		return excerciseDao.selectPtExercise(jrNum);
	}
	

}
