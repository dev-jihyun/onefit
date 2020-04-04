package com.kh.onefit.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onefit.common.model.vo.Photo;
import com.kh.onefit.payment.model.vo.Payment;
import com.kh.onefit.user.model.vo.User;

@Repository("uDao")
public class UserDao {
   @Autowired
   private SqlSessionTemplate sqlSession;        

   // 회원 추가
   public int insertUser(User u) {
      return sqlSession.insert("userMapper.insertUser",u );
   }
   
   // 중복아이디 
   public int checkIdDup(String id) {
      return sqlSession.selectOne("userMapper.idCheck",id);
   }  
   
      // 결제 정보 저장
      public int insertPay(Payment p) {
         int result = sqlSession.insert("userMapper.insertPay",p);
         System.out.println(p);
         if(result>0) { //만약에 payment table에 잘 들어갔을 경우
            // 일반회원으로 결제 했을 경우
            System.out.println("Dao result안으로 왔니?");
            if(p.getCate() ==1) {//결제가 일반이면 
               if(p.getStatus()==1) { // 일반회원이 일반회원으로 연장
                  return sqlSession.update("userMapper.userUser1",p); //기간 연장
               }else if(p.getStatus()==3){
                  return sqlSession.update("userMapper.userUser",p);// status3인 사람이 일반회원으로 결제
               }
               
            }else { //pt회원으로 결제했을경우
               if(p.getStatus()==3) {                               // status == 3, 결제를 안한 일반회원이 PT 결제했을 경우
                  if(sqlSession.insert("userMapper.userPt",p)>0) {//PT테이블에 입력
                     //PT테이블에 입력이 잘됐을 경우 user테이블 수정
                     return sqlSession.update("userMapper.updateStatus2",p); //   
                  }   
               }else if(p.getStatus()==2) {                          // status == 2, PT회원이 연장한 경우
                  return sqlSession.update("userMapper.ptPt",p);
               }else{                                                //status == 1, 일반 회원으로 결제를 한 회원이 pt결제를 한경우
                  if(sqlSession.insert("userMapper.userPt",p)>0) { //일단 PT테이블에 입력
                   return sqlSession.update("userMapper.updateStatus2",p); // status1 -> status2로 바꾸기
                  }
               }
            }
         }
         return 0;
      }


      
   

   public int getUserNum(String userId) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("userMapper.getUserNum",userId);
   }

   public int insertPhoto(Photo photo) {
      // TODO Auto-generated method stub
      return sqlSession.insert("userMapper.insertPhoto",photo);
   }

   public int checkKey(String userId) {
      // TODO Auto-generated method stub
      return sqlSession.update("userMapper.updateStatus",userId);
   }

   // 회원 탈퇴
   public int deleteUser(int userNum) {
      return sqlSession.update("userMapper.deleteUser",userNum);
   }

   // 마이페이지에서 비밀번호 확인 메소드
   public User selectUser(int userNum) {
      return sqlSession.selectOne("userMapper.selectUser", userNum);
   }

   public int userUpdate(User u) { 
      if(u.getChName()!= null) { // 바꼈을 때
         int result = sqlSession.update("userMapper.updatePhoto",u);
      }
      return sqlSession.update("userMapper.userUpdate",u);
   }
   
   // 몸정보 수정
   public int bodyUpdate(User u) {
      return sqlSession.update("userMapper.bodyUpdate",u);
   }

   public User selectUser1(int userNum) {
      return sqlSession.selectOne("userMapper.selectUser1",userNum);
   }

   // user정보 수정(비밀번호 입력하지 않았을 때)
   public int userUpdate1(User u) {
      if(u.getChName()!= null) { // 바꼈을 때
         int result = sqlSession.update("userMapper.updatePhoto",u);
      }
      return sqlSession.update("userMapper.userUpdate1",u);
   }
   

} 