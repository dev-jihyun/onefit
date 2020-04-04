<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background: rgb(240, 240, 240) !important;
	margin: auto;
}

.csCenter {
	background: #64c8fa;
}

.outer {
	/*min-height: 600px;
	width: 1200px; */
	/* border: 1px solid green; */
	display: inline-block !important;
	width: 1100px;
	background: white;
	height: auto;
	margin: 100px auto 50px 100px;
	/* max-width: 600px; */
	position: relative;
	/* width: 80%; */
	box-shadow: 0 1px 7px hsla(0, 0%, 0%, 0.2);
}
/* Corner Effect */
.outer:after, .outer:before {
	background: #e6e6e6;
	content: '';
	height: 50px;
	position: absolute;
	top: -25px;
	width: 100px;
	box-shadow: 0 5px 10px -7px hsla(0, 0%, 0%, 0.5);
}

.outer:after {
	left: -50px;
	transform: rotate(-45deg);
}

.outer:before {
	right: -50px;
	transform: rotate(45deg);
}

.board-post {
	display: inline-block;
	width: 100%;
	height: auto !important;
	padding: 0px;
	margin: 0px;
	padding-right: 5%;
	padding-left: 5%;
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

.noticeTable {
	width: 100% !important;
	border-top: 3px solid rgb(39, 165, 255) !important;
	/* border-bottom: 1px solid rgb(170, 57, 57); */
	border-left: none !important;
	border-right: none !important;
	margin: 0px !important;
	/* margin-bottom:20px !important; */
	padding: 0 !important;
}

.noticeTable tr {
	border-top: 1px solid lightgrey;
}

.noticeTable th {
	background: #f9f9f9;
	padding-left: 20px !important;
	height: 50px;
	font-size: 12px;
	vertical-align: middle !important;
}

.noticeTable td:not (.contentArea ){
	vertical-align: middle !important;
	font-size: 12px;
	height: 35px;
	padding-left: 20px !important;
}

.cols1 {
	width: 200px !important;
}

.cols2 {
	width: 200px;
}

.cols3 {
	width: 200px;
}

.cols4 {
	width: 200px;
}

.contentArea {
	font-size: 12px;
	padding: 10px !important;
	height: 300px;
	vertical-align: top;
}

.threeBtn {
	border-radius: none !important;
	font-size: 12px !important;
	margin-left: 3px !important;
	margin-right: 3px !important;
	border-radius: 0 !important;
}

.deleteBtn:hover {
	background: rgb(200, 70, 70) !important;
}

.listBtn:hover {
	background: #64c8fa !important;
}

.editBtn:hover {
	background: #64c8fa !important;
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

.answerBtn {
	float: right;
	height: 70px;
	font-size: 12px !important;
}

.answerBtn:hover {
	background: rgb(200, 70, 70) !important;
}

.tdAnswerBtn {
	padding-right: 5px;
}

.answerDiv {
	display: inline-block;
	width: 100%;
	border-top: 1px solid lightgrey;;
}

.answerTable1 {
	width: 100%;
}

.answerTable1 td {
	padding-left: 10px !important;
}

.regiAnswerDiv {
	width: 100%;
}

.tdWriter_a {
	width: 150px;
}

.answerTable2 {
	width: 100%;
}

.td_aContent {
	width: 90%;
	padding-left: 10px;
}

.aContent {
	width: 100%;
}

td {
	padding: 3px;
}

.qTitle {
	width: 100%;
	font-size: 14px;
}

.trContent {
	border-bottom: 2px solid rgb(39, 165, 255);
}
</style>
</head>
<body>
	<jsp:include page="../common/ptNav.jsp" />
	<div class="outer">
		<div class="content2">
			<div class="board-post">
				<div class="sub_text_area" style="display: inline-block;">
					<p
						style="font-size: 16px; font-weight: 900; text-align: left; line-height: '2'; /*  border:1px solid black;  */ margin-top: 20px; margin-bottom: 20px;">
						운동일지 세부사항</p>
				</div>
				<!-- 게시판 글 -->
				<div class=" board-post-list">
					<table class="noticeTable">
						<tr>
							<th class="thTitle firstCols cols1">제목</th>
							<td colspan="6">${ notice.title }</td>
						</tr>
						<tr>
							<th class="thDate">작성일</th>
							<td class="tdDate cols2"><fmt:formatDate
									value="${ e.jrDate }" pattern="yyyy-MM-dd" /></td>
							<th class="thCate cols3">작성자</th>
							<td class="tdCate cols4">OneFit</td>
							<th class="thAstatus cols5">조회수</th>
							<td class="tdAstatus cols6"></td>
						</tr>
						<tr class="trContent">
							
							<td colspan="6" class="contentArea"></td>
						</tr>
						<tr>
							<!-- 버튼들 -->
							<td colspan="6">

							</td>
						</tr>
					</table>
					<br><br>
				</div>
				<!-- boardpostlist -->
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>