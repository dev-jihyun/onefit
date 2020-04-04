<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원관리</title>
<style>
#in-wrap {
	width: 90%;
	min-width: 700px;
	margin: 100px 50px;
	padding-top: 15px;
	text-align: center;
	padding-right: 5%;
	padding-left: 5%;
	border: 1px solid lightgray;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	border-radius: 0;
	text-align: center;
}

#title {
	width: 90%;
	min-width: 700px;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 30px;
	margin: auto;
}

#ml {
	background-color: #64c8fa;
}

table {
	text-align: center;
	border-top: 1.5px solid #27a5ff;
	border-bottom: 1.5px solid #27a5ff;
	width: 100%;
	border-collapse: collapse;
}

td {
	border-top: none;
	height: 40px;
}

tr {
	border-bottom: 1px solid lightgray;
}

th {
	background-color: #f9f9f9;
	border-bottom: 1px solid #27a5ff;
	height: 30px;
	border-bottom: 1px solid #27a5ff;
}

.mbutton {
	border: none;
	color: white;
	background-color: rgb(94, 94, 94);
	border-radius: 5px;
	width: 76px;
}

#addmember {
	width: 30px;
	height: 30px;
	border: 2px solid black;
	border-radius: 15px;
	background-color: white;
	margin: auto;
	font-weight: 900;
	
}

#addmember:hover {
	width: 32px;
	height: 32px;
	cursor: pointer;
}

#addmember>img {
	width: 100%;
	height: 100%;
}
/* -------------------- 모달 -------------------- */
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

#mpt-modal {
	width: 325px !important;
	height: 250px !important;
}

#insertname {
	display: inline-block;
	margin-left: 5%;
	margin-top: 30px;
	width: 90%
}

#mnamewrite {
	width: 100%;
}

#submitbuttondiv {
	display: inline-block;
	width: 100%;
	height: 50px;
	margin-top: 88px;
}

#submitbuttondiv>input {
	width: 100%;
	height: 100%;
	color: white;
	background-color: #27a5ff;
	border: none;
	font-weight: bold
}

#submitbuttondiv>input:hover {
	background-color: #64c8fa;
	cursor: pointer;
}

#tarea {
	display: none;
	resize: none;
	float: right;
	position: absolute;
	bottom: 49px;
	right: 17px;
}

#selectbox {
	display: inline-block;
	position: absolute;
	bottom: 102px;
	left: 20px;
}

.canceldiv {
	width: 15px;
	height: 15px;
	position: absolute;
	right: 10px;
	top: 3px;
}

.canceldiv>img {
	width: 100%;
	height: 100%;
}

.canceldiv:hover {
	cursor: pointer;
}

table input {
	width: 40px;
}

/*-------------------------*/

/*---------------페이지 스타일 -------------------*/
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
	/* display:inline-block; */
	background: rgb(39, 165, 255) !important;
}

.qnaBtn {
	background: lightgrey !important;
}

.nList_qListDiv {
	margin: 10px 10px 10px 20px;
}

.ptitle {
	width: 300px;
	font-weight: bold;
}

#title {
	width: 90%;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 30px;
}

#table{
	position: relative;		
}

#sub{
	width:55px;
	position: absolute;
	bottom: -30px;
    right: 5px;
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
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<jsp:include page="../common/managerNav.jsp" />

	<h1 id="title" class="ptitle">회원 관리</h1>
	<hr>
<div class="outer">
	<div id="in-wrap">
		<div id="table">
		<table class="tableCss" >
			<tr>
				<th>No.</th>
				<th>회원 ID</th>
				<th>회원 이름</th>
				<th>회원 정보</th>
				<th>pt정보</th>
				<th>이용 종료일</th>
				<th>마지막 로그인</th>
				<th>회원관리<br><small>정지&nbsp;&nbsp;&nbsp;&nbsp;복구</small></th>
			</tr>
			<!-- 게시판이 있다면  -->
			<c:choose>
				<c:when test="${ !empty mlist }">
					<c:forEach var="m" items="${ mlist }">
						<tr class="postRow">
							<td class="m-no">${ m.userNum }</td>
							<td class="idCols">${ m.userId }</td>
							<td class="m-name">${ m.userName }</td>
							
							<td class="m-info">
							
								<button id="${m.userNum }" class="mbutton minfo">상세보기</button>
								
								<!-- 회원정보 -->
								<input type="hidden" id="name${m.userNum }" value="${m.userName }">
								
								<input type="hidden" id="m_img${m.userNum }" value="${m.chName }">
								
								<input type="hidden" id="reason${m.userNum }" value="${m.reason }">
								<input type="hidden" id="weight${m.userNum }" value="${m.weight }">
								<input type="hidden" id="height${m.userNum }" value="${m.height }">
								<input type="hidden" id="birthday${m.userNum }" value="${m.birth }">
								<input type="hidden" id="fat${m.userNum }" value="${m.fat }">
								<input type="hidden" id="goal${m.userNum }" value="${m.goal }">
								<input type="hidden" id="startdate${m.userNum }" value="${m.startDate }">
								<input type="hidden" id="enddate${m.userNum }" value="${m.endDate }">
								
								<!-- 회원 피티정보 -->
								<input type="hidden" id="mtrName${m.userNum }" value="${m.trName }">
								<input type="hidden" id="trNum${m.userNum }" value="${m.trNum }">
								<input type="hidden" id="count${m.userNum }" value="${m.count }">
								<input type="hidden" id="ttCount${m.userNum }" value="${m.totalCount }">
								
								
							
							</td>
							
							<td class="m-pt-info">
								<c:choose>
									<c:when test="${m.status == 2 }">
										<button  id="${m.userNum }" class="mbutton mtrinfo">상세보기</button>
									</c:when>
									<c:otherwise>
										---
									</c:otherwise>
									
								</c:choose>
							</td>
							
							<td class="tdCount">
								<c:choose>
									<c:when test="${m.status == 2 }">
										pt회원
									</c:when>
									<c:when test="${m.status == 3 }">
										미결제 회원
									</c:when>
									<c:when test="${m.status == 5 }">
										탈퇴 회원
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${m.endDate }" type="date" pattern="yyyy/MM/dd" />
									</c:otherwise>
								</c:choose>	
							</td>
							<td><fmt:formatDate value="${ m.loginDate }" type="date" pattern="yyyy/MM/dd" /></td>
							<td class="">
								<form action="mManage.do" id="memberManagement"><!-- ------------------------------ -->
									<c:choose>
										<c:when test="${m.status == 5 }">
											<input disabled="disabled" type="radio" name="super" id="del${m.userNum }">
											<input type="radio" name="super" id="res${m.userNum }">						
										</c:when>
										<c:otherwise>
											<input type="radio" name="super" id="del${m.userNum }">
											<input disabled="disabled" type="radio" name="super" id="res${m.userNum }">								
										</c:otherwise>
									</c:choose>
								</form>
							</td>
						</tr>
						
					</c:forEach>
					<tr>
						<td colspan=7">
							<div id="addmember">
								<img src="${contextPath}/resource/photo/manager/plus.png">
							</div>
						</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="7"><!-- 게시판이 없다면 -->
							<div id="addmember">
								<img src="${contextPath}/resource/photo/manager/plus.png">
							</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<input id="sub" class="mbutton" type="button" onclick="mRun()" value="적용">
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
	<!-- content2 -->
	</div>
	<!-- outer끝 -->
	</div>
	</div>
	</div>


	<!-- ------------------------------------모달--------------------------------- -->
	<br>
	<br>
	<!-- 회원 정보 보기 모달 -->
	<div class="modal-back" id="minfo-modal-back">
		<div class="modal-con" id="minfo-modal">

			<h2 style="text-align: center; margin-top: 10px;" id="name"></h2>
			<hr>
			
			<div style="width: 90%; margin: auto; border-radius:3px; border: 2px dashed skyblue;  position: relative;">
				<div style="width:100px; height: 100px;">
					<img id="m_img" src="" width="100" height="100">
				</div>
				<table style="border-top:none; width:258px; position: absolute; top: 0px; right: 0px;" >
					<tr>
						<th>목적</th>
						<td><input id="reason" style="width:90%;" type="text" readonly="readonly" disabled="disabled"></td>
					</tr>
				</table>
				<table style="width:258px; position:absolute;top: 50px; right: 0px;">
					<tr>
						<th>키</th>
						<th id="height"></th>
						<th>몸무게</th>
						<th id="weight"></th>
					</tr>
				</table>
				<table style="border-bottom: none ;">
					<tr>
						<th>나이</th>
						<td id="age"></td>
					</tr>
					<tr>
						<th>체지방</th>
						<td id="fat"></td>
					</tr>
					<tr>
						<th>목표체중</th>
						<td id="goal"></td>
					</tr>
					<tr>
						<th>종료일</th>
						<td id="enddate">
							<c:choose>
								<c:when test="">
									pt회원
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${m.endDate }" type="date" pattern="yyyy/MM/dd" />
								</c:otherwise>
							</c:choose>	
						</td>
					</tr>
				</table>
			</div>
			<div class="canceldiv">
				<img src="${contextPath}/resource/photo/manager/cancel.png">
			</div>
		</div>
	</div>
	<br>
	<br>

	<!-- 회원 pt정보 보기 모달 -->
	<div class="modal-back" id="mpt-modal-back">
		<div class="modal-con" id="mpt-modal">
		
			<h2 style="text-align: center; margin-top:10px;" id="mtrname"></h2>
			
			<hr>
			<div style="width: 90%; margin: auto;">
				<div style="width: 290px;">
					<table>
						<tr>
							<th id="mtrName" colspan="2" ></th> <!-- 트레이너 이름 -->
						</tr>
						<tr>
							<th style="text-align: left;">pt 결제일</th>
							<td id="whenstart"></td>
						</tr>
						<tr>
							<th style="text-align: left;">잔여 pt 횟수</th>
							<td id="count"></td>
						</tr>
						<tr>
							<td colspan="2"><a href="tlist.do">상세보기</a></td>
						</tr>
						
					</table>
				</div>
				<div class="canceldiv">
					<img src="${contextPath}/resource/photo/manager/cancel.png">
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
			function mRun(){
				
				
				$("#memberManagement").submit();
			}
			$(function() {
				$("#addmember").click(function() {
					var ask = confirm("회원가입 창으로 이동하시겠습니까?");
					if(ask == true){
						alert("회원가입 완료 시 로그아웃 됩니다.");
						location.href = 'enrollView.do';
					}
				});
				$("#selectlist").change(function() {
					var aaaa = this.value;
					if (aaaa == "d-input") {
						$("#tarea").fadeIn(300);
					} else {
						$("#tarea").fadeOut(300);
					}
				});
				$(".canceldiv").click(function() {
					$("#minput-modal-back").fadeOut(300);
					$("#minput-modal").fadeOut(300);
					$("#minfo-modal-back").fadeOut(300);
					$("#minfo-modal").fadeOut(300);
					$("#mpt-modal-back").fadeOut(300);
					$("#mpt-modal").fadeOut(300);
					$("body").css("overflow-y", "scroll");
					$("body").css("overflow-x", "scroll");
				});

				$(document).click(function(e) {
					if (e.target.className == 'modal-back') {
						$("#minput-modal-back").fadeOut(300);
						$("#minput-modal").fadeOut(300);
						$("#minfo-modal-back").fadeOut(300);
						$("#minfo-modal").fadeOut(300);
						$("#mpt-modal-back").fadeOut(300);
						$("#mpt-modal").fadeOut(300);
						$("body").css("overflow-y", "scroll");
						$("body").css("overflow-x", "scroll");
					}
				});

				$("#input-submit").click(function() {
					$("#minput-modal-back").fadeOut(300);
					$("#minput-modal").fadeOut(300);
					$("body").css("overflow-y", "scroll");
					$("body").css("overflow-x", "scroll");
				});
				/* ------------------------ */

				$(".minfo").click(function() {
					var id = $(this).attr('id');
					
					/*var format = new SimpleDateFormat("yy-MM-dd")
					var today = new Date();
					var age = today.getFullYear() - birthday.getFullYear() + 1; */
					
					/* 생년월일 */
					var birthday = new Date($("#birthday"+id).val());
					var y = birthday.getFullYear();
					
					/* 현재시간 */
					var today = new Date();
					var ty = today.getFullYear();
					
					/* 종료일 */
					var enddate = new Date($("#enddate"+id).val());
					var em = enddate.getMonth();
					var ed = enddate.getDate();
					m_img${m.userNum }
					
					var old = ty-y;
					
					var test = $("#m_img"+id).val();
					console.log($("#m_img"+id));
					
					$("#name").text($("#name"+id).val()+"님의 회원정보");
					/* img 불러오기 실패 */
					$("#m_img").prop("src","resource/profileImage/"+$("#m_img"+id).val());
					$("#reason").val($("#reason"+id).val());
					$("#weight").text($("#weight"+id).val()+"kg");
					$("#height").text($("#height"+id).val()+"cm");
					$("#age").text(old+1+" 세");
					$("#fat").text($("#fat"+id).val()+"%");
					$("#goal").text($("#goal"+id).val()+"kg");
					$("#enddate").text();
					
					$("#minfo-modal-back").fadeIn(300);
					$("#minfo-modal").fadeIn(300);
					$("body").css("overflow-y", "hidden");
					$("body").css("overflow-x", "hidden");
				});

				$(".mtrinfo").click(function() {
					var id = $(this).attr('id');
					
					$("#mtrname").text($("#name"+id).val()+"님의 PT정보");
					$("#mtrName").text($("#mtrName"+id).val()+" 트레이너");
					$("#count").text($("#count"+id).val()+"/"+$("#ttCount"+id).val());
					$("#whenstart").text($("#startDate"+id).val());
					
					$("#mpt-modal-back").fadeIn(300);
					$("#mpt-modal").fadeIn(300);
					$("body").css("overflow-y", "hidden");
					$("body").css("overflow-x", "hidden");
				});

			});

			/* ----------------페이징------------------*/

			$(function() {
				$(".pageList").click(function() {
					var page = $(this).text();

				})

				/* var index = $(this).children().first().attr('id'); */

			})
			function goPost(index) {
				location = "userNoticeDetail.do";
			}
		</script>

</body>
</html>