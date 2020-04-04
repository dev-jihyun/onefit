<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.csCenter{
	background: #64c8fa;
}

.outer_m {
	display: block;
	width: 1050px;
	height: auto !important;
	/* border: 1px solid red; */
	margin: auto;
	margin: 5%;
}

.board-post {
	display:inline-block;
	width: 100%;
	height: auto !important;
	padding: 0px;
	margin: 0px;
	/* text-align: center; */
	/* border: 1px solid green; */
	margin: auto;
}

.board-post-list {
	width: 100%;
	float: left;
	height: auto !important;
	margin-top: 10px;
	/* border: 1px solid blue; */
}

.margin-padding-zero {
	margin: 0;
	padding: 0;
	padding-left: 10%;
	padding-right: 10%;
}
.qnaTable{
	width: 100% !important;
	border-top: 2px solid rgb(39, 165, 255) !important;
	/* border-bottom: 1px solid rgb(170, 57, 57); */
	border-left: none !important;
	border-right: none !important;
	margin:0px !important;
	/* margin-bottom:20px !important; */
	padding:0 !important;
}
.qnaTable tr{
	border-top: 1px solid lightgrey;
}
.qnaTable th{
	background: #f9f9f9;
	padding-left: 20px !important;
	height: 50px;
	font-size: 12px;
	vertical-align:middle !important;

}
.qnaTable td:not(.contentArea){
	vertical-align:middle !important;
	font-size: 12px;
	height: 35px;
	padding-left: 20px !important;
}

.cols1{
	width: 200px !important;
}
.cols2{
	width: 200px;
}
.cols3{
	width: 200px;
}
.cols4{
	width: 200px;
}
.contentArea{
	font-size: 12px;
	padding: 10px !important;
	height:300px;
}

.threeBtn{
	border-radius: none !important;
	font-size: 12px !important;
	margin-left:3px !important;
	margin-right:3px !important;
	border-radius:0 !important;
}
.deleteBtn:hover{
	background:rgb(200, 70, 70)!important;
}
.listBtn:hover{
	background:#64c8fa !important;
}
.editBtn:hover{
	background:#64c8fa !important;
}
.margin-padding-zero {
	margin: 0;
	padding: 0;
	padding-left: 10%;
	padding-right: 10%;
}

.commentBox {
	width: 100%;
	float: left;
}

.commentShow {
	display: none !important;
}

.answerBtn{
	float: right;
	height: 70px;
	font-size: 12px !important;
}

.answerBtn:hover{
background:rgb(200, 70, 70)!important;
}
.tdAnswerBtn{
	padding-right: 5px;
}


.answerDiv{
	display:inline-block;
	width: 100%;
	border-top:1px solid lightgrey;;
}
.answerTable1{
	width: 100%;
	
}
.answerTable1 td{
	padding-left:10px !important;
}
.regiAnswerDiv{
	width: 100%;
}

.tdWriter_a{
	width: 150px;
}
.answerTable2{
	width: 100%;
}
.td_aContent{
	width: 90%;
	padding-left:10px;

}
.aContent{
	width: 100%;
}

td{
padding: 3px;
}

.qTitle{
width: 100%;
font-size: 14px;
}
.trContent{
 border-bottom: 1px solid rgb(39, 165, 255);
}
</style>
</head>
<body>
	<jsp:include page="../common/userNav.jsp"/>
	<div class="outer_m">
		<div class="board-post">
			<div class="sub_text_area" style="display:inline-block;/*  border:1px solid black; */">				
				<p style="font-size: 16px; font-weight: 900; text-align: left; line-height:'2';/*  border:1px solid black;  */margin-top:20px; margin-bottom:20px;">
				1:1 문의내역</p>
			</div>		
			<!-- 게시판 글 -->
			<div class=" board-post-list">
				<table class="qnaTable">
					<tr> 
						<th class="thTitle firstCols cols1">제목</th>
						<td colspan="6">${ q.title }</td>
					</tr>
					<tr>
						<th class="thDate">작성일</th>
						<td class="tdDate cols2">${ q.date } 2020-01-01</td>
						<th class="thCate cols3">카테고리</th>
						<td class="tdCate cols4">${ q.cate }</td>							
						<th class="thAstatus cols5">답변여부</th>
						<td class="tdAstatus cols6">${ q.status }N</td>
					</tr>
					<tr class="trContent">						
						<!-- 문의내용 -->
						<td colspan="6" class="contentArea">${ q.content }</td>
					</tr>
					<tr>
						<!-- 버튼들 -->
						<td colspan="6">
							<button class="btn editBtn threeBtn" type="button"
									style="float: right; background-color: rgb(39, 165, 255); color: white"
									onclick="location.href='userQnaList1.do'">수정하기</button>
							<button class="btn deleteBtn threeBtn" type="button"
									style="float: right; background-color: rgb(170, 57, 57); color: white"
									onclick="location.href='userQnaList1.do'">삭제하기</button>									
							<button class="btn listBtn threeBtn" type="button"
									style="float: right; background-color: rgb(39, 165, 255); color: white"
									onclick="location.href='userQnaList1.do'">목록으로</button>									
						</td>
					</tr>
				</table>
			</div><!-- boardpostlist -->


<!--//////////////////////////////////////////////////////////// 답변구역 -->
			<div class="answerDiv">
				<div class="sub_text_area" style="display:inline-block;/*  border:1px solid black; */">
					<p style="font-size: 16px; font-weight: 900; text-align: left; line-height:'2';/*  border:1px solid black;  */margin-top:20px; margin-bottom:20px;">
					답변</p>
				</div>		
				<table class="answerTable1" style="border:1px solid lightgrey;">
					<!-- 답변이 있으면 -->
					<c:if test="${ !empty answer  }">
						<tr class="liComment" style="border: 1px solid lightgrey;">
							<!-- 관리자이름 -->
							<td class="tdWriter_a" style="border:1px solid lightgrey;"><b>${ answer.writer }</b></td>
							<!-- 답변 내용 -->
							<td rowspan="2"  colspan="3" style="vertical-align:top;">${ answer.content }</td>
						</tr>
					
						<!-- 답변 날짜 -->
						<tr>
							<td>${ answer.date }</td>
						</tr>
					</c:if>
						<!-- 답변이 없으면 -->
						<tr>
							<td>등록된 답변이 없습니다</td>
						</tr>
					</table>															
				</div><!-- answerDiv -->				
			</div>
		</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>