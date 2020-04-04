<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
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

#a_title {
	width: 55%;
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
	width: 55%;
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

#replytitle {
	text-align: center !important;
	padding-top: 15px;
	margin-inline-start: 140px;
	margin-inline-end: 30px;
}

#table {
	border: 1px solid lightgray;
	width: 95%;
	text-align: center;
	margin: auto !important;
	margin-top: 10px !important;
	margin-bottom: 0px !important;
}

thead {
	background-color: lightgray;
}

.modalbody {
	width: 600px !important;
	padding-left: 22px !important;
}

.text_area {
	width: 95% !important;
	border-radius: 10px;
	/* 텍스트 아레아 사이즈 변경 막는 css */
	resize: none;
	margin-left: 13px !important;
}

/* ----------------------------------------- */
.Div1 {
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
	height: auto;
	text-align: center;
	padding-right: 5%;
	padding-left: 5%;
	border: 1px solid lightgray;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	border-radius: 0;
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

.thStatus {
	width: 80px;
}

.thDate {
	width: 100px !important;
}

.thCate {
	width: 90px;
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

.qnaTable {
	width: 100% !important;
	border-top: 2px solid rgb(39, 165, 255) !important;
	/* border-bottom: 1px solid rgb(39, 165, 255); */
	border-left: none;
	border-right: none;
	/* line-height: 2; */
	padding: 0px !important;
	margin: 0px !important;
}

.qnaTable tr {
	border-top: 1px solid lightgrey;
}

.qnaTable th {
	background: #f9f9f9;
	/* border-bottom: 1px solid rgb(39, 165, 255) !important; */
	/* border-left: none;
	border-right: none; */
	padding-left: 20px !important;
	font-size: 12px;
	height: 50px;
	vertical-align: middle !important;
}

.qnaTable tr:nth-last-of-type(2) {
	border-bottom: 1px solid rgb(39, 165, 255) !important;
}

.qnaTable td {
	/*  	border-left: none;
	border-right: none;  */
	/* 	border-top:none!important; */
	/* border-bottom: 1px solid lightgrey !important; */
	font-size: 12px;
	height: 250px;
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
	z-index: 0 !important;
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
	border: none !important;
	background: rgb(39, 165, 255) !important;
}

.qnaBtn {
	border: 1px solid #27a5ff !important;
	color: #27a5ff !important;
	background-color: white !important;
	font-weight: bold !important;
}

.nList_qListDiv {
	margin: 10px 10px 10px 20px;
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
	width: 400px;
	height: 410px;
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
.qnamodal{
	width: 680px;
	height: 515px;
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
	vertical-align: top;
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
.replyArea{
	width:97%;
	margin: 5px auto 0px;
	border-radius: 10px;
}
.tdNum{
	width: 80px;
}
.tdCate{
	width: 100px;
}
.tdTitle{
	width: 400px;
}
.tdmId{
	width: 100px;
}
.tdDate{
	width: 100px;
}
.thStatus{
	width: 100px;
}
#qnaTitle{
text-align:right;
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
		<h3 id="qtitle" class="ptitle">Questions</h3>
		<br>

		<!-- 버튼 (이동페이지 수정 필요)-->
		<div class="nList_qListDiv btn-group">
			<button type="button" class="btn btn-secondary noticeBtn nList_qList"
				onclick="location.href = 'qlist.do'">문의</button>

			<!-- ///////문의버튼은 로그인 한 사람만 클릭 가능. -->
			<button type="button" class="btn btn-secondary qnaBtn nList_qList"
				onclick="location.href = 'nlist.do'">공지</button>
		</div>

		<div class="board-post">
			<div class="sub_text_area" style="diplay: inline-block; width: 100%;">
				<p
					style="font-size: 16px; font-weight: 900; text-align: left; line-height: '2'; /*  border:1px solid black;  */ margin-top: 20px; margin-bottom: 20px;">
					1:1 문의게시판</p>
			</div>
			<!-- 게시판 헤더 -->
			<div class=" board-post-list table-responsive" style="margin: 0px;">
				
				<table class="qnaTable">
					<tr>
						<th class="thNum${ thNum }" scope="col">번호</th>
						<th class="thCate${ thNum }" scope="col">카테고리</th>
						<th class="thTitle${ thNum }" scope="col">제목</th>
						<th class="thWriter${ thNum }" scope="col">작성자</th>
						<th class="thDate${ thNum }" scope="col">작성일</th>
						<th class="thStatus${ thNum }" scope="col">답변여부</th>
					</tr>


					<!-- 게시판이 있다면  -->
					<c:choose>
						<c:when test="${ !empty list }">
							<c:forEach var="q" items="${ list }">
								<tr class="postRow" id="${q.askNum }">
									<td class="tdNum" id="">${q.askNum }</td>
									<td class="tdCate" id="">관리자에게</td>
									<td class="tdTitle" id="qnaTitle" style="text-align: center; margin-left:3px;">${ q.title }</td>
									<td class="tdmId" id="tdmId">${ q.userId }</td>
									<td class="tdDate" id="tdDate">${ q.writeDate }
									
									
										<input type="hidden" id="num${ q.askNum }" value="${ q.askNum }">
										<input type="hidden" id="cate${ q.askNum }" value="${ q.cate }">
										<input type="hidden" id="title${ q.askNum }" value="${ q.title }">
										<input type="hidden" id="content${ q.askNum }" value="${ q.content }">
										<input type="hidden" id="id${ q.askNum }" value="${ q.userId }">
										<input type="hidden" id="date${ q.askNum }" value="${ q.writeDate }">
										<input type="hidden" id="answer${ q.askNum }" value="${ q.answer }">
										<input type="hidden" id="stat${ q.askNum }" value="${ q.astatus }">
									</td>
									<td class="thStatus aaa" id="">${ q.astatus }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">문의사항이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td colspan="6"></td>
					</tr>
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
										<c:url var="pagination" value="qlist.do">
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

		<!-- 모달창 부분 -->
		<%-- <div class="modal-back" id="qna-modal-back">
			<div class="modal-con qnamodal" id="qna-modal">
			
				<div class=" board-post-list">
					<div style="width:97%; margin:auto;">
					<table class="qnaTable">
						<tr>
							<th class="thTitle firstCols cols1">제목</th>
							<td colspan="6" id="q-title"></td>
						</tr>
						<tr>
							<th class="thDate">작성일</th>
							<td class="tdDate cols2 qdate"></td>
							
							<th class="thCate cols3">카테고리</th>
							
							<td class="tdCate cols4" id="${ q.cate }">${ q.cate }관리자에게</td>

							
						</tr>
						<tr class="trContent">
							<!-- 문의내용 -->
							<td colspan="6" class="contentArea" id="questionArea"></td>
						</tr>
						<tr> <!-- 답변  -->
							<td colspan="6" class="replyArea">
								<form action="qReply.do" method="post" id="insertReply">
									<input type="hidden" id="R-askNum" name="num">
									<input type="hidden" id="i" name="askNum">
									<input type="hidden" id="answer" name="answer">
									<input type="hidden" id="astatus" name="astatus">
									<textarea id="reply" name="reply" class="replyArea" cols="25" rows="5"></textarea>
								</form>		
							</td>	
						</tr>
						
						<tr>
							<!-- 버튼들 -->
							<td colspan="6">
								<button class="btn listBtn threeBtn" type="button"
									style="float: right; background-color: rgb(39, 165, 255); color: white"
									onclick="location.href='${qlist}'">목록으로</button>
								
								<button class="btn editBtn threeBtn" type="button" style="float: right; background-color: rgb(39, 165, 255); color: white"
									onclick="modifyBtn();">답글달기</button>
								 <c:url var="qlist" value="qlist.do">
									<c:param name="page" value="${ pi.currentPage }" />
								</c:url>
								
							</td>
						</tr>
					</table>
					</div>
				</div>
				<!-- boardpostlist -->
			</div>
		</div> --%>
		<!-- 모달창 부분 끝 -->



	<jsp:include page="../common/footer.jsp" />
	<script>
		 $(document).ready(function(){ 
			$(".aaa:contains('N')").html("답변 없음").css("color","red");
			$(".aaa:contains('Y')").text("답변 완료").css("color","#27a5ff");
		});
		var iiii = "";
		function modifyBtn() {
			var quill_object = document.getElementById("reply").value;

			/* colsole.log(quill_object); */
			$("input[name=answer]").val(quill_object);
			document.getElementById("i").value = iiii;
			$("#insertReply").submit();
			console.log(test);
		}
		var askNum = "";
		
		$(function() {
			// 문의 답변
			$(".postRow").click(function(){
				//행 아이디
				var id = $(this).attr('id');
				
				location.href = "QnAdetail.do?askNum="+id;
				
				/* iiii = id;
				$("#R-askNum").text($("#num"+id).val());
				console.log(id);
				$("#q-title").text($("#title"+id).val());
				$(".qdate").text($("#date"+id).val());
				$("#questionArea").text($("#content"+id).val());
				$('.replyArea').val($("#answer"+id).val());
				$('#astatus').val($("#stat"+id).val());
				
				if($('#astatus').val().includes('Y')){
					$(".editBtn").css("display","none");
				}else{
					$(".editBtn").css("display","block");
				}
				$("#qna-modal-back").fadeIn(300);
				$("#qna-modal").fadeIn(300);
				$("body").css("overflow-y", "hidden");
				$("body").css("overflow-x", "hidden"); */
			});
			
				
			$(document).click(function(e){
				if(e.target.id == 'addt-modal-back' || e.target.className == 'modal-back'){
					$("#qna-modal-back").fadeOut(300);
					$("#modal-back").fadeOut(300);
					$("body").css("overflow-y", "scroll");
					$("body").css("overflow-x", "scroll");
				}
			});
			
			$(".canceldiv").click(function() {
				$("#qna-modal-back").fadeOut(300);
				$("#modal-back").fadeOut(300);
				$("body").css("overflow-y", "scroll");
				$("body").css("overflow-x", "scroll");
			});
			
		});

		/* 파일 추가 삭제 */
		/* var count = 1;
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
		}*/
	</script>
</body>
</html>