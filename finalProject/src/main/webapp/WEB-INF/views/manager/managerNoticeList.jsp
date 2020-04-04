<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link href="${ contextPath }/resource/API/quill/quill.snow.css"
	rel="stylesheet">
<script src="${ contextPath }/resource/API/quill/quill.min.js"></script>
<script src="${ contextPath }/resource/API/quill/quill.js"></script>
<script src="${ contextPath }/resource/API/quill/image-resize.min.js"></script>
<style>
#ms {
	background-color: #64c8fa;
}

textarea {
	resize: none !important;
}

/* 전체 감싸는 div*/
#in-wrap {
	width: 95%;
	min-width: 700px;
	margin: auto;
}

/* 더보기 버튼 */
#seemore {
	float: right;
	border: none;
	width: 91px;
	height: 27px;
	text-align: center;
	font-weight: bold;
	border-radius: 10px;
	position: relative;
	background-color: rgba(0, 0, 0, 0);
}

#seeIcon {
	position: absolute;
	top: 0px;
	left: 5px;
	width: 20px;
	height: 20px;
}

#msw {
	position: absolute;
	top: -2px;
	left: 27px;
}

#innerbox {
	width: 560px;
	margin: auto;
}

#a_title {
	width: 100%;
	min-width: 513.2px;
	height: 35px;
	display: table;
	border-collapse: collapse;
	border: 1px solid gray;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

#a_inner {
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	width: 100%;
	min-width: 513.2px;
}

#a_submit {
	background-color: #27a5ff;
	border: none;
	color: white;
	border-radius: 5px;
}

#a_submit:hover {
	background-color: #64c8fa;
}

/* 바디 고정값 아니여서 글자가 짜부러지는거 막는용도  */
.ptitle {
	width: 300px;
	font-weight: bold;
}

h3 {
	color: #27a5ff;
	text-decoration: underline;
	font-size: 32px !important;
}

#title {
	width: 90%;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 30px;
}

#innerbody {
	width: 1200px;
	margin: auto;
}

/* tr:hover {
	background-color: #f5f5f5;
} */

#addfilebox {
	display: inline-block;
	position: absolute;
	bottom: 10px;
	right: 140px;
}

#submitbox {
	display: inline-block;
	position: absolute;
	bottom: 10px;
	right: 10px;
}

/* 모달 */
.modal-back {
	display: none;
	position: absolute;
	top: 0px;
	left: 0xp;
	width: 85%;
	height: 2000px;;
	background-color: rgba(051, 051, 051, 0.5);
}

.modal-con {
	display: inline-block;
	border-radius: 10px;
	display: none;
	background-color: white;
	margin: auto;
	margin-top: 200px;
	box-shadow: 1px 1px 7px black;
	vertical-align: middle;
	overflow: hidden;
	position: relative;
}

#write-modal {
	width: 600px;
	height: 550px;
}

/* ----------------------------------------- */
Div1 {
	border: 1px solid grey;
	width: 1200px;
	height: 660px;
	border-radius: 10px;
	box-shadow: 3px 3px 3px 3px grey;
	position: relative;
	margin: auto;
	padding: 20px;
}

.csCenter {
	background: #64c8fa;
}

/* 게시판부분 */
.board-post {
	display: inline-block;
	width: 100%;
	padding: 0px;
	margin: 0px;
	height: 300px;
	text-align: center;
	padding-right: 5%;
	padding-left: 5%;
	border: 1px solid lightgray;
	box-shadow: 1px 1px 3px gray;
	border-radius: 10px;
}

/* 보드포스트 안쪽 div */
.board-post-list {
	float: left;
	margin-top: 10px;
	margin-bottom: 10px;
	/* border: 1px solid red; */
}

/* 제목만 왼쪽정렬 */
.tdTitle {
	text-align: left;
	padding-left: 10px !important;
}

.margin-padding-zero {
	margin: 0;
	padding: 0;
}

.postRow:hover {
	background-color: rgb(255, 243, 239);
}

.thNum {
	width: 70px;
}

.thWriter {
	width: 80px;
}

.thCount {
	width: 80px;
}

.thDate {
	width: 100px !important;
}

.admin_side_div {
	border: 1px solid black;
}

.side_txt_div1 {
	padding: 15px 5px 5px 5px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
}

.table-sm {
	border-top: 2px solid rgb(39, 165, 255) !important;
	border-bottom: 1px solid rgb(39, 165, 255);
	border-left: none;
	border-right: none;
	/* line-height: 2; */
	padding: 0px !important;
	margin: 0px !important;
}

.table-sm th {
	background: #f9f9f9;
	border-bottom: 1px solid rgb(39, 165, 255) !important;
	border-left: none;
	border-right: none;
	font-size: 12px;
	height: 50px;
	vertical-align: middle !important;
}

.table-sm td {
	border-left: none;
	border-right: none;
	border-top: none !important;
	border-bottom: 1px solid lightgrey !important;
	font-size: 12px;
	height: 35px;
	vertical-align: middle !important;
}

/*/////////// 페이지 스타일 */
.pagingDiv {
	display: inline-block;
	/* border: 1px solid red; */
	width: 100%;
}

.page-link {
	color: rgb(39, 165, 255) !important;
}

.page-link:toggle {
	background: rgb(39, 165, 255);
}

.page-item.active .page-link {
	background: rgb(39, 165, 255) !important;
	color: white !important;
	border: 1px solid rgb(39, 165, 255) !important;
}

.noticeBtn {
	background: lightgrey !important;
}

.qnaBtn {
	background-color: rgb(39, 165, 255) !important;
}

.nList_qListDiv {
	margin: 10px 10px 10px 20px;
}

/*/////////// 페이지 스타일 */
.pagingDiv {
	display: inline-block;
	/* border: 1px solid red; */
	width: 100%;
}

.page-link {
	color: rgb(39, 165, 255) !important;
}

.page-link:toggle {
	background: rgb(39, 165, 255);
}

.page-item.active .page-link {
	background: rgb(39, 165, 255) !important;
	color: white !important;
	border: 1px solid rgb(39, 165, 255) !important;
}

.noticeBtn {
	border: 1px solid #27a5ff !important;
	color: #27a5ff !important;
	background-color: white !important;
	font-weight: bold !important;
}

.qnaBtn {
	border: none !important;
	background: rgb(39, 165, 255) !important;
}

.nList_qListDiv {
	margin: 10px 10px 10px 20px;
}

.page-link {
	z-index: 0 !important;
}

#m-title {
	margin: 5px auto;
	text-align: center;
}

#fbox {
	margin-left: 10px;
}

.board-post {
	display: inline-block;
	width: 100%;
	padding: 0px;
	margin: 0px;
	height: auto;
	text-align: center;
	padding-left: 5%;
	padding-right: 5%
}

.board-post-list {
	width: 100%;
	float: left;
	margin-top: 10px;
}

.board-postnav-side {
	width: 20%;
	height: 350px;
	float: left;
	margin: 10px;
	background-color: rgb(255, 243, 239);
	/* border: 1px solid black; */
}

.board-postnav-side>ul>li>a {
	color: black;
}

.board-postnav-side>ul>li>a:hover {
	color: red;
}

.board-postnav-side>ul>li:hover {
	background-color: lightgrey;
}

.mycolSize {
	width: 70%;
}

.mycolSize2 {
	width: 10%;
}

.titles {
	width: 100px;
}

.boardTItle {
	display: inline-block;
	font-size: 1.5em;
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
	display: none;
}

.submitBTN {
	float: right;
}

.updateBox {
	width: 80%;
	padding-left: 3%;
	padding-right: 3%;
	padding-top: 3%;
	margin: auto;
}

.qna_table {
	width: 1050px;
	height: 700px;
	vertical-align: middle !important;
}

.sub_cols {
	width: 80px !important;
	text-align: center;
	background: #f9f9f9;
}
/* td :first-child{
width: 40px;
} */
.qna_table td, th {
	padding: 3px;
	/* border: 1px solid lightgrey !important; */
	vertical-align: middle !important;
}

.qTitle {
	width: 100%;
	height: 80%;
	font-size: 14px;
	border: none;
}

.custom-select {
	width: 150px !important;
	border: 1px solid rgb(39, 165, 255) !important;
	font-size: 14px !important;
	margin-bottom: 3px !important;
}

.qna_table tr {
	/* border: 1px solid lightgrey; */
	
}

.firstTr {
	height: 20px;
}

.cancel-btn {
	color: #fff !important;
	background-color: red !important;
	border-color: #0062cc;
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.cancel-btn:hover {
	background-color: #C21400;
	color: #212529;
	text-decoration: none;
}

/* 상세보기 css */
#detail-modal {
	width: 600px;
	height: 550px;
}

#notice-con {
	width: 95%;
	margin-left: 10px;
	border-radius: 10px;
	height: 90%;
}
.modal-content{
    	width: 800px !important;
}
#chkPwdTable{
	width: 100%;
	border-top:2px solid rgb(39, 165, 255) !important;
	border-bottom:1px solid rgb(39, 165, 255) !important;
}
.outer {
	display: inline-block !important;
	width: 1100px;
	background: white;
	height: auto;
	margin: 100px auto auto 100px;
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
</style>
</head>
<body>
	<jsp:include page="../common/managerNav.jsp" />
	<h1 id="title" class="ptitle">고객 센터</h1>
	<hr>
	<div class="outer">
	<div id="in-wrap">
		<h3 id="qtitle" class="ptitle">Notice.</h3>
		<br>

		<!-- 버튼 -->
		<div class="nList_qListDiv btn-group">
			<button type="button" class="btn btn-secondary noticeBtn nList_qList"
				onclick="location.href = 'qlist.do'">문의</button>

			<!-- ///////문의버튼은 로그인 한 사람만 클릭 가능. -->
			<button type="button" class="btn btn-secondary qnaBtn nList_qList"
				onclick="location.href = 'nlist.do'">공지</button>
		</div>

		<div class="board-post">
			<!-- 게시판 헤더 -->
			<div class="sub_text_area" style="diplay: inline-block; width: 100%;">
				<p
					style="font-size: 16px; font-weight: 900; text-align: left; line-height: '2'; /*  border:1px solid black;  */ margin-top: 20px; margin-bottom: 20px;">
					공지사항</p>
			</div>
			<!-- 게시판 헤더 -->
			<div class="board-post-list table-responsive" style="margin: 0px;">
				<table class="table table-sm" border="1">
					<thead>
						<tr>
							<th class="thNum" scope="col">번호</th>
							<th class="thTitle" scope="col">제목</th>
							<th class="thWriter" scope="col">작성자</th>
							<th class="thDate" scope="nDateCols">작성일</th>
							<th class="thCount" scope="countCols">조회</th>
						</tr>
					</thead>
					<tbody>
						<!-- 게시판이 있다면  -->
						<c:choose>
							<c:when test="${ !empty list }">
								<c:forEach var="n" items="${ list }">
										<input type='hidden' id="num${ n.noticeNum }" value="${ n.noticeNum }">
										<input type="hidden" id="title${ n.noticeNum }" value="${ n.title }"> 
										<input type="hidden" id="count${ n.noticeNum }" value="${ n.count }">
										<input type="hidden" id="content${ n.noticeNum }" value="${ n.content }">
										<input type="hidden" id="date${ n.noticeNum }" value="${ n.writeDate }">
									<tr class="postRow" id="${ n.noticeNum }">
										<td class="tdNum" id="nNum">${ n.noticeNum }</td>
										<td class="tdTitle" style="text-align: center;">${ n.title }</td>
										<td class="tdmNo">OneFit</td>
										<td class="tdDate">${ n.writeDate }</td>
										<td class="tdCount">${ n.count }
										
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<!-- 게시판이 없다면 -->
								<tr class="postRow">
									<td colspan="5">
										<p style="margin: 0;">게시글 없음</p>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>

					<!-- ----------------------------------------- -->
					<tfoot>
						<tr>
							<td colspan="5">
								<!-- 공지사항은 PT회원이 글 쓸 필요가 없음 -->

								<button id="writeNoticeBtn" class="btn" type="button"
									style="float: right; background-color: rgb(39, 165, 255); color: white">
									글쓰기</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>

			<br>

			<div class="pagingDiv"><!-- 페이징구역 -->
					<nav aria-label="..."
						style="display: inline-block; margin-top: 10px; margin-bottom: 10px;"
						class="paging_nav">
						<ul class="pagination pagination-sm  justify-content-center"
							style="margin: 0;">

							<!-- 이전 페이지로 (<) -->
							<c:if test="${ pi.currentPage <= 1 }">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">&laquo;</a></li>
							</c:if>

							<c:if test="${ pi.currentPage > 1 }">
								<li class="page-item"><c:url var="before" value="qlist.do">
										<c:param name="page" value="${ pi.currentPage -1 }" />
									</c:url> <a class="page-link" href="${ before }" tabindex="-1">&laquo;</a>
								</li>
							</c:if>
							<!-- 이전 페이지로  끝 -->


							<!--  페이지 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<li class="page-item active">
										<a class="page-link pageList"
										href='#' style="text-decoration: none;">${ p }</a>
									</li>
								</c:if>

								<c:if test="${ p ne pi.currentPage }">
									<li class="page-item ">
										<c:url var="pagination" value="nlist.do">
											<c:param name="page" value="${ p }" />
										</c:url> <a class="page-link pageList" href="${ pagination }">${ p }</a>
									</li>
								</c:if>

							</c:forEach>
							<!--  페이지 목록 끝 -->


							<!-- 다음 페이지로(>) -->
							<c:if test="${  pi.currentPage >= pi.maxPage }">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">&raquo;</a></li>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<li class="page-item"><c:url var="after" value="nlist.do">
										<c:param name="page" value="${ pi.currentPage + 1 }" />
									</c:url> <a class="page-link" href="${ after }">&raquo;</a></li>
							</c:if>
							<!-- 다음페이지 끝 -->
						</ul>
					</nav>
				</div><!-- 페이징구역 끝-->

		</div>
		<br> <br>
		</div>
	</div>
<br><br><br><br><br><br><br><br>
	<!-- 공지사항 작성 모달 -->
	<div class="modal-back" id="write-modal-back">
		<div class="modal-con" id="write-modal">
			<h3 class="ptitle" id="m-title">Write Announcement</h3>
			<br>
			<div class="content2" style="width: 95%; height: 100%; margin: auto;">

				<div class="board-post-list table-responsive"
					style="height: 500px !important;">
					<form action="ninsert.do" method="post" id="postInsert">
						<!-- 문의사항 작성자 hidden으로 보낼 것. -->
						<input type="hidden" name="userNum" value="${loginUser.userNum }">
						<!-- 텍스트데이터... -->
						<input type="hidden" name="content" value="11">

						<table class="qna_table table table-sm" style="height: 300px !important;">

							<tr class="firstTr">
								<th class="sub_cols">제목</th>
								<td>
									<!-- 제목 --> <input class="qTitle" type="text" name="title" required>
								</td>
								<th class="sub_cols">카테고리</th>
								<td>
									<!-- 카테고리 --> <select class="custom-select" name="cate" style="width: 90% !important;">
										<option value="1">전체 공개</option>
										<option value="2">직원 공개</option>
								</select>
								</td>
							</tr>
							<tr style="height: 100px !important;">
								<th class="sub_cols">내용</th>
								<td colspan="3">
									<!-- Include the Quill library -->
									<div id="editor-container" style="height: 270px !important;"></div>
									<div style="width: 100%;">
										<button class="cancel-btn" onclick="cancel()" type="button"
											style="position: absolute; bottom: 10px; right: 115px;">취소하기</button>
										<button class="btn btn-primary submitBTN" onclick="getQuill()"
											style="position: absolute; bottom: 10px; right: 20px;">작성하기</button>

									</div>

									<div id="testBox"></div>
								</td>
							</tr>
						</table>

						<div class="form-group"></div>
					</form>

				</div>
				<!-- content2 -->
			</div>
		</div>
	</div>

	<!-- 공지사항 상세보기 모달 -->
	<div class="modal-back" id="detail-modal-back">
		<div class="modal-con" id="detail-modal" style="height: 360px">
			<div class="content2" style="width: 95%; height: 100%; margin: auto;">

				<div class="board-post-list table-responsive"style="height: 500px !important;">
					<table class="qna_table table table-sm" style="height: 300px !important;">
						<tr class="firstTr">
							<th class="sub_cols" style="height: 20px;">제목</th>
							<td style="height: 20px;" colspan="3">
								<input id="noticeTitle" class="qTitle" type="text" name="title" readonly>
							</td>
						</tr>
						<tr>
							<th class="sub_cols" style="height: 20px;">카테고리</th>
							<td style="height: 20px;">1.전체공개 2.직원 공개</td>
							<td class="nCount" style="height: 20px;">조회수</td>
							<td id="noticeCount" style="height: 20px;">0</td>
						</tr>
						<tr style="height: 100px !important;">
							<th class="sub_cols">내용</th>
							<td colspan="5"><textarea id="notice-con" rows="8" cols="30"></textarea>
							</td>
						</tr>
					</table>
					<button onclick="nDeleteModal()" class="cancel-btn"
						style="float: right; margin-top: 5px; margin-right: 5px;">삭제하기</button>
				</div>
				<!-- content2 -->
			</div>
		</div>
	</div>

	<!-- 공지사항 삭제 비밀번호 -->
	<div class="modal-back" id="modal-ndelete-back" style="z-index: 1;">
		<div class="modal-con" id="modal-ndelete-con" style="width:500px; height:185; z-index: 2; margin-top:280px;">
			<div style="width:95%; margin:auto;">
				<h4 style="text-align: center; ">공지사항 삭제</h4>
				<hr>
				<table id="chkPwdTable" style="width:100%;">
					<tr>
						<td colspan="2" style="text-align: center; font-size: 16px; font-size: 16px; font-weight: bolder; ">비밀번호 확인</td>
					</tr>
					<tr>
						<td style="text-align: center;">비밀번호</td>
						<td style="text-align: center;"><input id="pwd" type="password" required="required"></td>
					</tr>
				</table>
				<div style="float:right; margin:5px 5px 5px 0px;">
					<input type="hidden" id="number">
					<button class="cancel-btn" onclick="deleteNotice()">삭제하기</button>
					<button class="cancel-btn" style="background:#27a5ff !important;" onclick="cancelDelete()">취소하기</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script>
		/* 모달 */
		$(function(){
			$(".postRow").click(function(){
				var id = $(this).attr('id');
				console.log(id);
				$("#number").val($("#num"+id).val());
				$("#noticeTitle").val($("#title"+id).val());
				$("#noticeCount").val($("#count"+id).val());
				$("#notice-con").val($("#content"+id).val());
				
				$("#detail-modal-back").fadeIn(300);
				$("#detail-modal").fadeIn(300);
				$("body").css("overflow-y","hidden");
				$("body").css("overflow-x","hidden");
			});
		}); 
		
		// 공지사항 삭제 모달
		function nDeleteModal(){
			$("#modal-ndelete-back").css("display","block");
			$("#modal-ndelete-con").fadeIn(300);
		}
		
		// 공지사항 삭제하기
		function deleteNotice(){
			if($("#pwd").val() != 1234){
				
				this.alert("잘못된 비밀번호입니다.");
				$("#pwd").val('');
				$("#pwd").focus();
			}else{
				var num = $("#number").val();
				
				location="dNotice.do?num="+num;  
			}
		}
		
		// 삭제취소
		function cancelDelete(){
			$("#detail-modal-back").fadeOut(300);
			$("#detail-modal").fadeOut(300);
			$("#modal-ndelete-back").fadeOut(300);
			$("#modal-ndelete-con").fadeOut(300);
			
			$("body").css("overflow-y", "scroll");
			$("body").css("overflow-x","scroll");
		}
		
		$(function() {
			$("#writeNoticeBtn").click(function(){
				$("#write-modal-back").fadeIn(300);
				$("#write-modal").fadeIn(300);
				$("body").css("overflow-y","hidden");
				$("body").css("overflow-x","hidden");
			});
			/* ------------------- 모달 백그라운드 클릭 시 모달 종료 ------------------ */
			$(document).click(function(e){
				if(e.target.id == 'addt-modal-back' || e.target.className == 'modal-back'){
				$("#write-modal-back").fadeOut(200);
				$("#write-modal").fadeOut(200);
				$("#detail-modal-back").fadeOut(200);
				$("#detail-modal").fadeOut(200);
				$("#modal-ndelete-back").fadeOut(200);
				$("#modal-ndelete-con").fadeOut(200);
				
				$("body").css("overflow-y", "scroll");
				$("body").css("overflow-x","scroll");
				}
			});
		});
		
		
		
		//모달 작성 취소버튼
		function cancel(){
			var result = confirm("정말 취소하시겠습니까?");
			if(result){
				$("#write-modal-back").fadeOut(300);
				$("#write-modal").fadeOut(300);
				$("body").css("overflow-y", "scroll");
				$("body").css("overflow-x","scroll");
				$(".qTitle").val('');
				$(".ql-editor").text('');
			}
		}
		/* 파일 추가 삭제 */
		var count = 1;
		function addFile() {
			if (count < 3) {
				$("<br class='added'><input type='file' class='added'>")
						.appendTo("#fbox");
				count++;
			} else {
				alert("파일은 최대 3개까지 추가할 수 있습니다.");
			}
		}
		function delFile() {
			if (count != 1) {
				$("input[class=added]:last").remove();
				$("br[class=added]:last").remove();
				count--;
			} else {
				alert("더 이상 제거할 수 없습니다.");
			}
		}
		
		
		$(function(){
			$("#postInsert").submit(function(){
				var cate = $(".custom-select").val();
				if(cate == 0){
					alert("공개범위를 선택해주세요.")
					return false;
				}
			});
		});
		/* <!-- Initialize Quill editor --> */
		var quill = new Quill('#editor-container', {
			modules : {
				imageResize : {
					displaySize : true
				},
				toolbar : [
						[ {
							header : [ 1, 2, false ]
						} ],
						[ 'bold', 'italic', 'underline' ],
						[
								{
									color : [ "#000000", "#e60000",
											"#ff9900", "#ffff00",
											"#008a00", "#0066cc",
											"#9933ff", "#ffffff",
											"#facccc", "#ffebcc",
											"#ffffcc", "#cce8cc",
											"#cce0f5", "#ebd6ff",
											"#bbbbbb", "#f06666",
											"#ffc266", "#ffff66",
											"#66b966", "#66a3e0",
											"#c285ff", "#888888",
											"#a10000", "#b26b00",
											"#b2b200", "#006100",
											"#0047b2", "#6b24b2",
											"#444444", "#5c0000",
											"#663d00", "#666600",
											"#003700", "#002966",
											"#3d1466", 'custom-color' ]
								},
								{
									background : [ "#000000", "#e60000",
											"#ff9900", "#ffff00",
											"#008a00", "#0066cc",
											"#9933ff", "#ffffff",
											"#facccc", "#ffebcc",
											"#ffffcc", "#cce8cc",
											"#cce0f5", "#ebd6ff",
											"#bbbbbb", "#f06666",
											"#ffc266", "#ffff66",
											"#66b966", "#66a3e0",
											"#c285ff", "#888888",
											"#a10000", "#b26b00",
											"#b2b200", "#006100",
											"#0047b2", "#6b24b2",
											"#444444", "#5c0000",
											"#663d00", "#666600",
											"#003700", "#002966",
											"#3d1466", 'custom-color' ]
								} ], [ 'image' ]

				]
			},
			theme : 'snow' // or 'bubble'
		});
		function getQuill() {
			var quill_object = quill.container.firstChild.innerHTML;
			$("input[name=content]").val(quill_object);
			//insert 폼 제출
			$("#postInsert").submit();
		}
	</script>
</body>
</html>
