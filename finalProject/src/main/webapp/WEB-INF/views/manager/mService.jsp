<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

tr:hover {
	background-color: #f5f5f5;
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

/* 모달 */
.modal-header {
	padding: 0px;
}

.modal-content {
	width: 600px !important;
	background-color: white;
	border-radius: 6px !important;
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

/*모달창*/
.modal-dialog.modal-fullsize {
	width: 100%;
	height: 80%;
}

.modal-content.modal-fullsize {
	height: auto;
	min-height: 100%;
	border-radius: 2%;
}
/*모달 제목 부분*/
#modalCenterTitle {
	font-size: 2.2rem;
}

.modal-body-container {
	
}
/*모달창 내용 부분*/
.twArea {
	width: 100%;
	text-align: center;
}

.twArea th {
	background: #BDBDBD;
	border: 1px solid gray;
}

.twArea tr {
	border: 1px solid gray;
}

.twArea td {
	border: 1px solid gray;
}

#questionContent {
	resize: none;
	width: 100%;
	height: 200px;
	overflow-y: scroll;
}
/* Customize website's scrollbar like Mac OS
	Not supports in Firefox and IE */

/* total width */
#questionContent::-webkit-scrollbar {
	background-color: #fff;
	width: 16px;
}

/* background of the scrollbar except button or resizer */
#questionContent::-webkit-scrollbar-track {
	background-color: #fff
}

/* scrollbar itself */
#questionContent::-webkit-scrollbar-thumb {
	background-color: #babac0;
	border-radius: 16px;
	border: 4px solid #fff
}
/* set button(top and bottom of the scrollbar) */
#questionContent::-webkit-scrollbar-button {
	display: none
}

/*모달창 답변 부분*/
.answer-area p {
	font-size: 1.5rem;
}

#realAnswer {
	resize: none;
	width: 100%;
	height: 200px;
	overflow-y: scroll;
}
/* Customize website's scrollbar like Mac OS
	Not supports in Firefox and IE */

/* total width */
#realAnswer::-webkit-scrollbar {
	background-color: #fff;
	width: 16px;
}

/* background of the scrollbar except button or resizer */
#realAnswer::-webkit-scrollbar-track {
	background-color: #fff
}

/* scrollbar itself */
#realAnswer::-webkit-scrollbar-thumb {
	background-color: #babac0;
	border-radius: 16px;
	border: 4px solid #fff
}
/* set button(top and bottom of the scrollbar) */
#realAnswer::-webkit-scrollbar-button {
	display: none
}

/* ----------------------------------------- */
.Div1{
		border: 1px solid grey;
		width:1200px;
		height: 660px;
		border-radius:10px;
		box-shadow: 3px 3px 3px 3px grey;
		position:relative;
		margin:auto;
		padding:20px;
	}
	.csCenter{
        background: #64c8fa;
	}

/* 게시판부분 */
.board-post {
	display:inline-block;
	width: 100%;
	padding: 0px;
	margin: 0px;
	height: auto;
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

.thNum{
	width:70px;

}
.thWriter{
	width: 80px;
}
.thStatus{
	width: 80px;
}
.thDate {
	width: 100px !important;
}
.thCate{
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
	margin:0px !important;
}
.qnaTable tr{
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
	vertical-align:middle !important;
}
.qnaTable tr:nth-last-of-type(2){
	border-bottom:1px solid rgb(39, 165, 255) !important;
}

.qnaTable td {
/*  	border-left: none;
	border-right: none;  */
/* 	border-top:none!important; */
	/* border-bottom: 1px solid lightgrey !important; */
	font-size: 12px;
	height: 35px;
	vertical-align:middle !important;
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
	border:none !important;
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
</style>
</head>
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<jsp:include page="../common/managerNav.jsp" />
	<h1 id="title" class="ptitle">고객 센터</h1>
	<hr>
	<div id="in-wrap">
		<h3 id="qtitle" class="ptitle">Questions</h3>
		<br>

		<!-- 버튼 (이동페이지 수정 필요)-->
		<div class="nList_qListDiv btn-group"> 
			<button type="button" class="btn btn-secondary noticeBtn nList_qList"
				onclick="location.href = 'managerQnaList.do'">문의</button>

			<!-- ///////문의버튼은 로그인 한 사람만 클릭 가능. -->
			<button type="button" class="btn btn-secondary qnaBtn nList_qList"
				onclick="location.href = 'managerNoticeList.do'">공지</button>
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
						<th class="thNum" scope="col">번호</th>
						<th class="thCate" scope="col">카테고리</th>
						<th class="thTitle" scope="col">제목</th>
						<th class="thWriter" scope="col">작성자</th>
						<th class="thDate" scope="col">작성일</th>
						<th class="thStatus" scope="col">답변여부</th>
					</tr>


					<!-- 게시판이 있다면  -->
					<c:choose>
						<c:when test="${ !empty list }">
							<c:forEach var="q" items="${ list }">
								<tr class="postRow">
									<td class="tdNum" id="${ q.qId }">${q.qId }</td>
									<td class="tdCate" id="${ q.Cate }">${ q.Cate }</td>
									<td class="tdTitle">${ q.qTitle }</td>
									<td class="tdmId">${ q.writer }</td>
									<td class="tdDate">${ q.qDate }</td>
									<td class="thStatus">${ q.Status }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<!-- 게시판이 없다면 -->
							<tr class="postRow">
								<!-- 								<td colspan="6">
									<p style="margin:0;">게시글 없음</p>
								</td> -->
								<td class="tdNum" id="${ q.qId }">t</td>
								<td class="tdCate" id="${ q.Cate }">t</td>
								<td class="tdTitle">t</td>
								<td class="tdmId">t</td>
								<td class="tdDate">t</td>
								<td class="thStatus">t</td>
							</tr>
							<tr class="postRow">
								<!-- 								<td colspan="6">
									<p style="margin:0;">게시글 없음</p>
								</td> -->
								<td class="tdNum" id="${ q.qId }">y</td>
								<td class="tdCate" id="${ q.Cate }">y</td>
								<td class="tdTitle">y</td>
								<td class="tdmId">y</td>
								<td class="tdDate">y</td>
								<td class="thStatus">y</td>
							</tr>
						</c:otherwise>
					</c:choose>

					<tr>
						<td colspan="6">

						</td>
					</tr>

				</table>
			</div>

			<br>

			<!-- 페이징 -->
			<div class="pagingDiv">
				<ul class="pagination pagination-sm justify-content-center"
					style="margin-top: 10px; margin-bottom: 10px;">
					<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
					</li>
					<li class="page-item active"><a class="page-link" href="#">1</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">&raquo;</a>
					</li>
				</ul>
			</div>
			<br>

			<div class="pagingDiv">
				<!-- 페이징구역 -->
				<nav aria-label="..."
					style="display: inline-block; margin-top: 10px; margin-bottom: 10px;"
					class="paging_nav">
					<ul class="pagination pagination-sm  justify-content-center"
						style="margin: 0;">

						<!-- 이전 페이지로 (<) -->
						<c:if test="${ pi.currentPage <= 1 }">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1">&laquo;</a></li>
						</c:if>

						<c:if test="${ pi.currentPage > 1 }">
							<li class="page-item"><c:url var="before" value="blist.do">
									<c:param name="page" value="${ pi.currentPage -1 }" />
								</c:url> <a class="page-link" href='${ before }' tabindex="-1">&laquo;</a>
							</li>
						</c:if>
						<!-- 이전 페이지로  끝 -->


						<!--  페이지 숫자 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p == pi.currentPage }">
								<li class="page-item active"><a class="page-link pageList"
									href='#'>${ p }</a></li>
							</c:if>

							<c:if test="${ pi.currentPage > 1 }">
								<li class="page-item "><c:url var="pagination"
										value="blist.do">
										<c:param name="page" value="${ p }" />
									</c:url> <a class="page-link pageList" href="${ pagination }">${ p }</a>
								</li>
							</c:if>
						</c:forEach>
						<!--  페이지 목록 끝 -->


						<!-- 다음 페이지로(>) -->
						<c:if test="${  pi.currentPage == pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1">&raquo;</a></li>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<li class="page-item"><c:url var="after" value="blist.do">
									<c:param name="page" value="${ pi.currentPage + 1 }" />
								</c:url> <a href="${ after }">&raquo;</a></li>
						</c:if>
						<!-- 다음페이지 끝 -->
					</ul>
				</nav>
			</div>
			<!-- 페이징구역 끝-->

		</div>
		<br> <br>



		<!-- 문의사항 답변 모달 -->
		<div class="modal fade ttt" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="false">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 id="replytitle">
							문의 사항 답변
							</h3>
							<button type="button" class="close modal_close"
								data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
					</div>
					<div id="modal_body">
						<table id="table">
							<thead>
								<tr>
									<th>작성자</th>
									<th>제목</th>
									<th>작성일자</th>
								</tr>
							</thead>
							<tr>
								<td>홍길동</td>
								<td>유자차</td>
								<td>2020/02/07</td>
							</tr>
						</table>
						<br>
						<textarea style="margin: auto; !important" readonly="readonly"
							name="" class="text_area" cols="30" rows="10"></textarea>

						<h3 style="padding-left: 23px;">답변하기</h3>
						<textarea style="margin: auto; !important" name=""
							class="text_area" cols="30" rows="10"></textarea>
					</div>
					<br>
					<button type="button" class="btn btn-primary modal_select_btn">확인</button>
				</div>
			</div>
		</div>



		<!-- 모달창 부분 -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="false">
			<div
				class="modal-dialog modal-lg modal-dialog-centered modal-fullsize"
				role="document">
				<div class="modal-content modal-lg modal-fullsize">
					<form action="#" method="post">
						<div class="modal-header">
							<p class="modal-title" id="modalCenterTitle">1:1 문의 답변</p>
							<button type="button" class="close modal_close"
								data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<div class="modal-body-container">
								<div class="titleAndWriter">
									<table class="twArea">
										<tr>
											<th>작성자</th>
											<th>제목</th>
											<th>작성일자</th>
										</tr>
										<tr>
											<td>이욱재</td>
											<td>어깨가 아파요</td>
											<td>2020-02-17</td>
										</tr>
									</table>
								</div>
								<div class="questionContent-area">
									<textarea id="questionContent" readonly>벤치 프레스나 가슴 운동할때마다 아프네요</textarea>
								</div>
								<hr>
								<div class="answer-area">
									<p>답변하기</p>
									<textarea id="realAnswer" placeholder="내용을 입력해주세요."></textarea>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<!-- <button type="button" class="btn btn-secondary modal_close" data-dismiss="modal">Close</button> -->
							<button type="button"
								class="btn btn-primary modal_health_select_btn">답변완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 모달창 부분 끝 -->

		<div class="">
			<div class="">
			
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
		<script>
		/* 모달 */
		$(function() {
			$(".editBtn").click(function() {
				// 모달 보이게 하기
				$('.ttt').modal("show");

				/* 
				var i = $(this).attr("id").substring(7);
				// i를 전달하기 위해...
				$('input[name=putProductId]').val(i);
				
				var pName = $('input[name=pName'+i+']').val();
				$("#putProduct").text(pName); */

			});

			//모달 x버튼 누르면 창 종료
			$(".modal_close").click(function() {
				// 모달 창을 닫으면 모달 안에 있는 데이터 모두 초기화해야함
				$(".ttt").modal("hide");
			});

		});

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
	</script>
</body>
</html>