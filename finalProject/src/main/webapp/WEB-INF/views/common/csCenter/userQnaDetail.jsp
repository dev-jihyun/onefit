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

.qnaTable {
	width: 100% !important;
	border-top: 2px solid rgb(39, 165, 255) !important;
	/* border-bottom: 1px solid rgb(170, 57, 57); */
	border-left: none !important;
	border-right: none !important;
	margin: 0px !important;
	/* margin-bottom:20px !important; */
	padding: 0 !important;
}

.qnaTable tr {
	border-top: 1px solid lightgrey;
}

.qnaTable th {
	background: #f9f9f9;
	padding-left: 20px !important;
	height: 50px;
	font-size: 12px;
	vertical-align: middle !important;
}

.qnaTable td:not (.contentArea ){
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
	border-bottom: 1px solid rgb(39, 165, 255);
}
</style>
</head>
<body>
	<c:if test="${ loginUser.status eq 3 or loginUser.status eq 1}">
		<jsp:include page="../userNav.jsp" />
	</c:if>
	<c:if test="${loginUser.status eq 2 }">
		<jsp:include page="../ptNav.jsp" />
	</c:if>
	<div class="outer">
		<div class="content2">
			<div class="board-post">
				<div class="sub_text_area" style="display: inline-block;">
					<p
						style="font-size: 16px; font-weight: 900; text-align: left; line-height: '2'; /*  border:1px solid black;  */ margin-top: 20px; margin-bottom: 20px;">
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
							<td class="tdDate cols2">${ q.writeDate }</td>
							<th class="thCate cols3">카테고리</th>
							<c:if test="${ q.cate eq 1 }">
								<td class="tdCate cols4" id="${ q.cate }">관리자에게</td>

							</c:if>
							<c:if test="${ q.cate eq 2 }">
								<td class="tdCate cols4" id="${ q.cate }">트레이너에게</td>

							</c:if>
							<c:if test="${ q.cate eq 0 }">
								<td class="tdCate cols4" id="${ q.cate }">대상없음</td>

							</c:if>
							<th class="thAstatus cols5">답변여부</th>
							<td class="tdAstatus cols6">${ q.astatus }</td>
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
									onclick="modifyBtn();">수정하기</button>
								<button class="btn deleteBtn threeBtn" type="button"
									style="float: right; background-color: rgb(170, 57, 57); color: white"
									onclick="deleteBtn();">삭제하기</button> <c:url var="qlist"
									value="qlist.do">
									<c:param name="page" value="${ pi.currentPage }" />
								</c:url>
								<button class="btn listBtn threeBtn" type="button"
									style="float: right; background-color: rgb(39, 165, 255); color: white"
									onclick="location.href='${qlist}'">목록으로</button>
							</td>
						</tr>
					</table>
				</div>
				<!-- boardpostlist -->


				<!--//////////////////////////////////////////////////////////// 답변구역 -->
				<div class="answerDiv">
					<div class="sub_text_area" style="display: inline-block;">
						<p
							style="font-size: 16px; font-weight: 900; text-align: left; line-height: '2'; /*  border:1px solid black;  */ margin-top: 20px; margin-bottom: 20px;">
							답변</p>
					</div>
					<table class="answerTable1" style="border: 1px solid lightgrey;">
						<!-- 답변이 있으면 -->
						<c:if test="${ !empty q.answer  }">
							<tr class="liComment" style="border: 1px solid lightgrey;">
								<!-- 관리자/트레이너 이름 -->
								<td class="tdWriter_a" style="border: 1px solid lightgrey;"><b>${ q.userId }</b></td>
								<!-- 답변 내용 -->
								<td rowspan="2" colspan="3" style="vertical-align: top;">${ q.answer }</td>
							</tr>

							<!-- 답변 날짜 -->
							<tr>
								<td>${ q.answerDate }</td>
							</tr>
						</c:if>
						<c:if test="${ empty q.answer  }">
							<!-- 답변이 없으면 -->
							<tr>
								<td>등록된 답변이 없습니다</td>
							</tr>
						</c:if>
					</table>
				</div>
				<!-- answerDiv -->
			<br><br>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />


	<script>
		function modifyBtn() {
			console.log("동작!");
			//답변이 있으면
			<c:if test="${ q.astatus eq 'Y' }">
			console.log("동작1!");
			alert("답변이 달린 상태에서는 수정이 불가합니다.");
			</c:if>
			//답변이 없으면 수정페이지로 이동
			<c:if test="${ q.astatus eq 'N' }">
			console.log("동작2!");
			location = "qupView.do?askNum="+ ${ q.askNum };
			</c:if>

		}
		function deleteBtn() {
			console.log("동작!");
			//답변이 있으면
			<c:if test="${ q.astatus eq 'Y' }">
			alert("답변이 달린 상태에서는 삭제가 불가합니다.");
			</c:if>
			//답변이 없으면 삭제 컨트롤러이동
			<c:if test="${ q.astatus eq 'N' }">
			<c:url var="qdelete" value="qdelete.do">
			<c:param name="askNum" value="${ q.askNum }"/>
			</c:url>
			location = "${ qdelete }";
			</c:if>

		}
	</script>
</body>
</html>