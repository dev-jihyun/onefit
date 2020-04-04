package com.kh.onefit.common.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onefit.train.model.service.TrainerService;
import com.kh.onefit.train.model.vo.Trainer;
import com.kh.onefit.train.model.vo.TrainerLesson;
import com.kh.onefit.train.model.vo.TrainerMemberHealth;
import com.kh.onefit.train.model.vo.TrainerMemberList;

/*@SessionAttributes({"url", "userType"})*/

@Controller
public class CommonController {
/*	@Autowired
	private CommonService cService;*/
	
	@Autowired
	private TrainerService trainService;
	
	///////////////////////////////////////////공지사항///////////////////////////////////////////////
	@RequestMapping("userNoticeList.do")
	public String userNoticeListList() {
		//고객센터 기본 뷰는 공지사항 뷰.
		return "common/csCenter/userNoticeList";
	}
	
	@RequestMapping("userNoticeDetail.do")
	public String userNoticeDetail() {
		return "common/csCenter/userNoticeDetail";
	}

	
	///////////////////////////////////////////문의사항///////////////////////////////////////////////
	//문의사항 글쓰기
	@RequestMapping("userQnaList.do")
	public String userQnaList() {
		return "common/csCenter/userQnaList";
	}
	
	//문의사항 글쓰기 화면으로 이동
	@RequestMapping("userQnaInsertForm.do")
	public String userQnaInsertForm() {
		return "common/csCenter/userQnaInsertForm";
	}
	
	//문의사항 글 추가.
	@RequestMapping("userQnaInsert.do")
	public String userQnaInser() {
		
		return"common/csCenter/userQnaList";
	}
	
	@RequestMapping("userQnaDetail.do")
	public String userQnaDetail() {
		return "common/csCenter/userQnaDetail";
	}
	
	
	
	//////////////////////////////////////////엑셀로 변환하기//////////////////////////////////////////////////////
	@RequestMapping("sendExcel.do")
	public void excelDownload(String place,HttpServletRequest request, HttpServletResponse response ,
			@RequestParam(value="date", required = false) String date) throws Exception {
		
		ArrayList<Object> list = new ArrayList<>(); 
		Trainer t = (Trainer) request.getSession().getAttribute("loginUser");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String getDate = date != null ? date : format.format(new Date());
		
		switch(place) {
		case "trainerMemberList.do" :
			list = trainService.excelMemberList(t.getTrNum());
			downLoadExcel(list,response,1);
			break;
		case "trainerAttendance.do" :
			list = trainService.excelLessonList(getDate,t.getTrNum());
			downLoadExcel(list,response,2);
			break;
		case "trainerFood.do" :
			list = trainService.excelMemberHealth(t.getTrNum());
			downLoadExcel(list,response,3);
		}
	}
	
	//////////////////////////////////////////엑셀로 변환 시키기 위한 메소드////////////////////////////////////////////
	public void downLoadExcel(ArrayList<Object> list,HttpServletResponse response, int num) throws Exception {
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("PT회원 목록");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 배경색은 노란색입니다.
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    
	    for (int i=0;i<4;i++) //autuSizeColumn after setColumnWidth setting!!  

	    { 
	        sheet.autoSizeColumn(i);
	        sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+1500 ); // 이건 자동으로 조절 하면 너무 딱딱해 보여서 자동조정한 사이즈에 (short)512를 추가해 주니 한결 보기 나아졌다.
	    }
	    
	    switch(num) {
	    case 1: //그냥 회원 정보 뽑을때
	    	
		    // 헤더 생성
		    row = sheet.createRow(rowNo++);
		    cell = row.createCell(0);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("회원명");
		    
		    cell = row.createCell(1);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("시작일");
		    
		    cell = row.createCell(2);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("핸드폰번호");

		    cell = row.createCell(3);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("남은횟수");
		    // 데이터 부분 생성
	    	
		    for(Object vo : list) {
		        row = sheet.createRow(rowNo++);
		        
		        cell = row.createCell(0);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerMemberList) vo).getUserName());
		        
		        cell = row.createCell(1);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(sdf.format(((TrainerMemberList) vo).getPayDate()));
		        
		        cell = row.createCell(2);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerMemberList) vo).getPhone());
		        
		        cell = row.createCell(3);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerMemberList) vo).getCount()+"/"+((TrainerMemberList) vo).getTotalCount());
		    }
		    
		    // 컨텐츠 타입과 파일명 지정
		    response.setContentType("ms-vnd/excel");
		    response.setHeader("Content-Disposition", "attachment;filename=PTmember.xls");

		    break;
		    
	    case 2: //출석 정보 출력
		    // 헤더 생성
		    row = sheet.createRow(rowNo++);
		    cell = row.createCell(0);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("회원명");
		    
		    cell = row.createCell(1);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("시작시간");
		    
		    cell = row.createCell(2);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("핸드폰번호");

		    cell = row.createCell(3);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("남은횟수");
		    // 데이터 부분 생성
	    	
		    for(Object vo : list) {
		        row = sheet.createRow(rowNo++);
		        
		        cell = row.createCell(0);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerLesson) vo).getUserName());
		        
		        cell = row.createCell(1);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerLesson) vo).getScStartString()+"~"+((TrainerLesson) vo).getScEndtString());
		        
		        cell = row.createCell(2);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerLesson) vo).getPhone());
		        
		        cell = row.createCell(3);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerLesson) vo).getCount()+"/"+((TrainerLesson) vo).getTotalCount());
		    }
		    
		    // 컨텐츠 타입과 파일명 지정
		    response.setContentType("ms-vnd/excel");
		    response.setHeader("Content-Disposition", "attachment;filename=PTschedule.xls");
	    	break;
	    case 3:
		    // 헤더 생성
		    row = sheet.createRow(rowNo++);
		    cell = row.createCell(0);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("회원명");
		    
		    cell = row.createCell(1);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("현재 체중");
		    
		    cell = row.createCell(2);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("목표체중");

		    cell = row.createCell(3);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("남은횟수");
		    // 데이터 부분 생성
	    	
		    for(Object vo : list) {
		        row = sheet.createRow(rowNo++);
		        
		        cell = row.createCell(0);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerMemberHealth) vo).getUserName());
		        
		        cell = row.createCell(1);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerMemberHealth) vo).getWeight());
		        
		        cell = row.createCell(2);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerMemberHealth) vo).getGoal());
		        
		        cell = row.createCell(3);
		        cell.setCellStyle(bodyStyle);
		        cell.setCellValue(((TrainerMemberHealth) vo).getCount()+"/"+((TrainerMemberHealth) vo).getTotalCount());
		    }
		    
		    // 컨텐츠 타입과 파일명 지정
		    response.setContentType("ms-vnd/excel");
		    response.setHeader("Content-Disposition", "attachment;filename=PTFood.xls");
		    break;
	    }

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	}
}
