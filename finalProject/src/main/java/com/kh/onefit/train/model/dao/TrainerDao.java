package com.kh.onefit.train.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.common.model.vo.PageInfo;
import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.health.model.vo.Health;
import com.kh.onefit.train.model.vo.ManagerTrainer;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.train.model.vo.TrainerInfos;
import com.kh.onefit.train.model.vo.TrainerLesson;
import com.kh.onefit.train.model.vo.TrainerMemberHealth;
import com.kh.onefit.train.model.vo.TrainerMemberList;

@Repository("TrainerDao")
public class TrainerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Health getHealthInform(int trNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainMapper.getHealthInform",trNum);
	}

	public ArrayList<TrainerLesson> getTodayTrainerLesson(int trNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("trainMapper.getTodayTrainerLesson", trNum);
	}

	public Photo getProfile(int trNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainMapper.getProfile",trNum);
	}

	public int updateTrainer(Trainer t) {
		// TODO Auto-generated method stub
		return sqlSession.update("trainMapper.updateTrainer",t);
	}

	public int updatePhoto(Photo photo) {
		// TODO Auto-generated method stub
		return sqlSession.update("trainMapper.updatePhoto",photo);
	}

	//페이징 하는 부분
	public ArrayList<TrainerMemberList> getMemberList(PageInfo pi,int trNum) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("trainMapper.getMemberList",trNum,rowBounds);
	}

	public ArrayList<TrainerMemberHealth> getMemberHealth(int trNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("trainMapper.getMemberHealth",trNum);
	}
	
	//여기서는 해당 트레이너의 총 회원수를 가져와야 한다.
	public int getListCount(int trNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainMapper.getListCount",trNum);
	}
	
	// 트레이너 정보 뽑아오기
	public ArrayList<TrainerInfos> selectList() {    
		return (ArrayList)sqlSession.selectList("trainMapper.selectList");
	}

	public TrainerMemberHealth memberHealthInform(int userNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainMapper.memberHealth",userNum);
	}

	public int updateMemberHealth(TrainerMemberHealth tmh) {
		// TODO Auto-generated method stub
		return sqlSession.update("trainMapper.updateMemberHealth",tmh);
	}

	public ArrayList<Object> excelMemberList(int trNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("trainMapper.getMemberList",trNum);
	}

	public int searchNameCount(Trainer t) {
		// TODO Auto-generated method stub
		System.out.println(t);
		return sqlSession.selectOne("trainMapper.searchNameCount",t);
	}

	public ArrayList<TrainerMemberList> searchNameList(PageInfo pi, Trainer t) {
		// TODO Auto-generated method stub
		System.out.println(t);
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("trainMapper.searchNameList",t,rowBounds);
	}

	public int getLessonCount(int trNum, String getDate) {
		// TODO Auto-generated method stub
		TrainerLesson tl = new TrainerLesson();
		tl.setScDateString(getDate);
		tl.setTrNum(trNum);
		
		return sqlSession.selectOne("trainMapper.getLessonCount",tl);
	}

	public ArrayList<TrainerLesson> traineLessonList(PageInfo pi, int trNum, String getDate) {
		// TODO Auto-generated method stub
		TrainerLesson tl = new TrainerLesson();
		tl.setScDateString(getDate);
		tl.setTrNum(trNum);
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("trainMapper.traineLessonList",tl,rowBounds);
		
	}

	public ArrayList<Object> excelLessonList(int trNum, String getDate) {
		// TODO Auto-generated method stub
		TrainerLesson tl = new TrainerLesson();
		tl.setScDateString(getDate);
		tl.setTrNum(trNum);
		
		return (ArrayList)sqlSession.selectList("trainMapper.traineLessonList",tl);
	}


	public int getTrainerListCount() {
		return sqlSession.selectOne("trainMapper.getTrainerListCount");
	}

	public ArrayList<ManagerTrainer> ManagerSelectList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("trainMapper.MselectList",null,rowBounds);
	}
  
	public ArrayList<Object> excelMemberHealth(int trNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("foodMapper.getMemberList",trNum);
	}

}
