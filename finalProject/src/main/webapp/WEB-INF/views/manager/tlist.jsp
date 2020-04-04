<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 관리</title>

<link href='resource/fullcalendar-4.3.1/packages/core/main.css' rel='stylesheet' />
<link href='resource/fullcalendar-4.3.1/packages/daygrid/main.css' rel='stylesheet' />
<link href='resource/fullcalendar-4.3.1/packages/timegrid/main.css' rel='stylesheet' />
<link href='resource/fullcalendar-4.3.1/packages/list/main.css' rel='stylesheet' />
<script src='resource/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/core/locales-all.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/interaction/main.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/daygrid/main.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/timegrid/main.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/list/main.js'></script>
<link href='resource/fullcalendar-4.3.1/packages/bootstrap/main.css' rel='stylesheet' />
<script src='resource/fullcalendar-4.3.1/packages/bootstrap/main.js'></script>>

<script>
  document.addEventListener('DOMContentLoaded', function() {
	  var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd
		} 
		if(mm<10) {
		    mm='0'+mm
		} 
		today = yyyy + '-' + mm + '-' + dd;

    var initialLocaleCode = 'ko';
    var localeSelectorEl = document.getElementById('locale-selector');
    var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list'],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      },
      defaultDate: today,
      /* themeSystem: 'bootstrap', */

      selectable : true,
      selectMirror: true,
      select: function(arg) {
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
      locale: initialLocaleCode,
      buttonIcons: false, // show the prev/next text
      weekNumbers: true,
      //navLinks: true,  can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2019-08-01'
        },
        {
          title: 'Long Event',
          start: '2020-02-09',
          end: '2020-02-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-02-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-08-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2019-08-11',
          end: '2019-08-13'
        },
        {
          title: 'Meeting',
          start: '2019-08-12T10:30:00',
          end: '2019-08-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2019-08-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2019-08-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2019-08-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2019-08-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2019-08-13T07:00:00',
        },
        {
          start: '2019-08-28',
          imageurl: '<%-- <%= request.getContextPath() %>/resources/images/강원도.jpg --%>'
        }
        
    				<%-- ,{
    					title: '<%= p.getpName()%>',
    					start: '<%= p.getStartDate() + "T" + p.getStartTime() %>',
    					end: '<%= p.getEndDate() + "T" + p.getEndTime() %>',
							imageurl: '<%= request.getContextPath() %>/resources/festival_uploadFile/<%= p.getFileName() %>',
    					id: '<%= p.getpSeq() %>',
    					locationid: '<%= p.getmSeq() %>',
    					url: '<%= p.getUrl() %>'
    				} --%>
    			
      ]
      ,dateClick: function(info) {
    	  console.log("날짜 클릭 메소드");
    	 /*  $('.ttt').modal("show"); */
    	   /* var ttt =  document.getElementById("exampleModalCenter");
    	   console.log(ttt);
    	   ttt.display="show !important"; */
<%--     	  sessionStorage.setItem("clickday", info.dateStr);
    	  var left = (screen.width/2)-350;
    	  var top = (screen.height/2)-300;
    	  var url = "<%= request.getContextPath() %>/views/myPage/PlanList.jsp";
    	  var uploadWin = window.open(url,"Calendar","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=700, height=600" + ",top=" + top + ",left=" + left);
    	  uploadWin.moveTo(left, top);
    	  uploadWin.focus(); --%>
	  }
      , eventRender:function(info) {   
    	  	if (info.event.extendedProps.imageurl) {
           	   info.el.firstChild.innerHTML = "<img src='" + info.event.extendedProps.imageurl +"' width='60' height='40' style='display:block; margin-left:auto; margin-right:auto;'>" + "<div style='text-align:center'>" + info.event.title + "</div>";
    	  	}
      }
      , eventClick:function(info) {
    	  console.log(info.event.start);
    	  if(info.event.start.getMonth() <= 8) {
    		  sessionStorage.setItem("clickday", info.event.start.getFullYear() + "-0" + (info.event.start.getMonth() + 1) + "-" + info.event.start.getDate());
    	  }else {
    		  sessionStorage.setItem("clickday", info.event.start.getFullYear() + "-" + (info.event.start.getMonth() + 1) + "-" + info.event.start.getDate());
    	  }
    	  
    	  var left = (screen.width/2)-350;
    	  var top = (screen.height/2)-300;
    	  var url = "<%-- <%= request.getContextPath() %>/views/myPage/PlanList.jsp --%>";
    	  var uploadWin = window.open(url,"Calendar","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=700, height=600" + ",top=" + top + ",left=" + left);
    	  uploadWin.moveTo(left, top);
    	  uploadWin.focus();
      }
      
    });

    calendar.render();

    // build the locale selector's options
    calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
      var optionEl = document.createElement('option');
      optionEl.value = localeCode;
      optionEl.selected = localeCode == initialLocaleCode;
      optionEl.innerText = localeCode;
      /* localeSelectorEl.appendChild(optionEl); */
    });

  });
</script>

<style>
#calendar {
	max-width: 900px;
	margin: 0 auto;
	font-size: 12px;
}

.pageName {
	margin: 100px;
}

.pageName span {
	font-size: 40px;
	font-weight: bolder;
}

.fc-event {
	color: white !important;
}

/* 기본 */
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

#tl {
	background-color: #64c8fa;
}

#title {
	width: 90%;
	min-width: 700px;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 30px;
	margin: auto;
}

/* 테이블 */
.tableCss {
	text-align: center;
	border-top: 1.5px solid #27a5ff;
	border-bottom: 1.5px solid #27a5ff;
	width: 100%;
	border-collapse: collapse;
}

.tableCss td {
	border-top: none;
	height: 40px;
}

.tableCss tr {
	border-bottom: 1px solid lightgray;
}

.tableCss th {
	background-color: #f9f9f9;
	border-bottom: 1px solid #27a5ff;
	height: 50px;
	border-bottom: 1px solid #27a5ff;
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

.mbutton {
	border: none;
	color: white;
	background-color: rgb(94, 94, 94);
	border-radius: 5px;
	width: 76px;
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

#addt-modal {
	width: 450px;
	height: 260px;
}

#infot-modal {
	width: 400px;
	height: 480px;
}

#mt-modal {
	width: 400px;
	height: 180px;
}

/*---------------------------------- -------------- -------------------------------------------------- */
/*---------------------------------- -------------- -------------------------------------------------- */
/*---------------------------------- 테이블 디자인 오류수정 -------------------------------------------------- */
/*---------------------------------- 테이블 디자인 오류수정 -------------------------------------------------- */
/*---------------------------------- -------------- -------------------------------------------------- */
/*---------------------------------- -------------- -------------------------------------------------- */
.tableCss input {
	width: 100px;
}

.submitcss {
	width: 50px;
	border: 2px solid #27a5ff;
	color: #27a5ff;
	background-color: white;
	font-weight: bold;
	border-radius: 5px;
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

#yesbtn {
	width: 70px;
	height: 35px;
	background-color: #27a5ff;
	border: none;
	border-radius: 5px;
	color: white;
	font-weight: 900;
	position: absolute;
	left: 20px;
}

#canbtn {
	width: 70px;
	height: 35px;
	background-color: #c03546;
	border: none;
	border-radius: 5px;
	color: white;
	font-weight: 900;
	position: absolute;
	right: 20px;
	"
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

#mts-modal {
	width: 700px;
	height: 626px;
	margin-top: 50px;
}

.fc-scroller {
	
}

#random-modal {
	width: 350px;
	height: 100px;
}
.pagingDiv {
	display: inline-block;
	/* 	border: 1px solid red; */
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
.ti td{
	width: 45%;
}
.tp{
	height: 20px;
	margin-bottom: 10px;
	
}
#carry{
	width:100%;
	height: 100px;
	border-radius: 10px;
	resize: none;
}
#addtmember{
	width:90%;
	background: #27a5ff;
	border: none;
	margin: auto;
	border-radius: 5px;
	height: 40px;
}

#addttable td{
	height: 35px;
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
	<h1 id="title" class="ptitle">트레이너 관리</h1>
	<hr>
<div class="outer">
	<div id="in-wrap">
		<div id="table">
		<table class="tableCss" >
			<tr>
				<th>No.</th>
				<th>트레이너 이름</th>
				<th>트레이너 정보</th>
				<th>회원 수 </th>
				<th>트레이너 일정</th>
				<th>직원관리</th>
			</tr>
			<!-- 게시판이 있다면  -->
			<c:choose>
				<c:when test="${ !empty tlist }">
					<c:forEach var="t" items="${ tlist }">
						<tr class="postRow">
							<td class="t-no">${ t.trNum }</td>
							<td class="t-name">${ t.trName }</td>
							<td class="t-info"><button id="${t.trNum }" class="mbutton tinfo">상세보기</button>
							
							<!-- 트레이너 정보 -->
							<input type="hidden" id="name${t.trNum }" value="${ t.trName }"><!-- 이름 --> 
							<%-- <input type="hidden" id="t_img${t.trNum }" value="${t.chName }"> --%><!-- 사진--> 
							<input type="hidden" id="gender${t.trNum }" value="${ t.gender }"><!-- 성별--> 
							<input type="hidden" id="phone${t.trNum }" value="${ t.phone }"><!-- 전화번호 -->
							<input type="hidden" id="email${t.trNum }" value="${ t.email }"><!-- 이메일 -->
							<input type="hidden" id="status${t.trNum }" value="${ t.status }"><!-- 상태 --> 
							<input type="hidden" id="enroll${t.trNum }" value="<fmt:formatDate value='${ t.enrollDate }' pattern='yyyy/MM/dd' />"><!-- 가입일 -->
							<input type="hidden" id="carrer${t.trNum }" value="${ t.carrer }"><!-- 경력 --> 
							
							<input type="hidden" id="height${t.trNum }" value="${t.height }"><!-- 키 -->
							<input type="hidden" id="weight${t.trNum }" value="${t.weight }"><!-- 몸무게 -->
							<input type="hidden" id="fat${t.trNum }" value="${t.fat }"><!-- 지방 -->
							
							</td>
							<td class="m-date"></td>
							
							<td class="schedule">
								<button class="mbutton"type="button">일정보기</button>
								
								<!-- 일정 -->
								<input type="hidden" id="scNum${t.trNum }" value="${t.scNum}"><!-- 일정번호 -->
								<input type="hidden" id="date${t.trNum }" value="${t.scDate}"><!-- 날짜 -->
								<input type="hidden" id="start${t.trNum }" value="${t.scStart}"><!-- 시작시간 -->
								<input type="hidden" id="end${t.trNum }" value="${t.scEnd}"><!-- 종료시간 -->
								<input type="hidden" id="cate${t.trNum }" value="${t.cate}"><!-- 카테고리 -->
								<input type="hidden" id="con${t.trNum }" value="${t.content}"><!-- 내용 -->
								<input type="hidden" id="uNum${t.trNum }" value="${t.userNum}"><!-- 회원번호 -->
							</td>
							
							<td class="trainer-m">
								<button class="mbutton">자세히</button>
							</td>
						</tr>
						 
					</c:forEach>
					<tr>
						<td colspan="7">
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
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">&laquo;</a></li>
							</c:if>

							<c:if test="${ pi.currentPage > 1 }">
								<li class="page-item"><c:url var="before" value="tlist.do">
										<c:param name="page" value="${ pi.currentPage -1 }" />
									</c:url> <a class="page-link" href="${ before }" tabindex="-1">&laquo;</a>
								</li>
							</c:if>
							<!-- 이전 페이지로  끝 -->


							<!--  페이지 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<li class="page-item active"><a class="page-link pageList"
										href='#' style="text-decoration: none;">${ p }</a></li>
								</c:if>

								<c:if test="${ p ne pi.currentPage }">
									<li class="page-item "><c:url var="pagination"
											value="tlist.do">
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
								<li class="page-item"><c:url var="after" value="tlist.do">
										<c:param name="page" value="${ pi.currentPage + 1 }" />
									</c:url> <a class="page-link" href="${ after }">&raquo;</a></li>
							</c:if>
							<!-- 다음페이지 끝 -->
						</ul>
					</nav>
				</div>
			</div>
		<!-- 페이징구역 끝-->
	</div>
	<!-- 캘린더 -->
	<!-- <div class="outer">
		<div class="Div1" align="center">
			<div id='calendar' style="margin-top: 15px; user-select: all;"></div>
		</div>
		
	</div> -->

	<!-- 트레이너 추가 모달 -->
	<div class="modal-back" id="addt-modal-back">
		<div class="modal-con" id="addt-modal">
			<form action="">
				<div style="width: 100%; margin: 20px auto; text-align: center;">
					<h3>트레이너 추가</h3>
					<table id="addttable" style="border-top: 1px solid #27a5ff; width: 90%; margin: 15px auto 15px;">
						<tr>
							<th>이름</th>
							<td><input id="tname" required="required" style="width: 100%; margin: auto;" type="text" placeholder="이름을 입력하세요"></td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input id="tid" required="required"
								style="width: 100%; margin: auto;" type="text"
								placeholder="사용하실 아이디를 입력하세요"></td>
						</tr>
						<tr style="border-bottom:1px solid #27a5ff;">
							<td colspan="2"><p style="color:lightgray; margin-top:5px;">*임시 비밀번호는 1234입니다.<p></td>
						</tr >
					</table>
					<input id="addtmember" type="submit" value="추가하기">
				</div>
			</form>
			<div class="canceldiv">
				<img src="${contextPath}/resource/photo/manager/cancel.png">
			</div>
		</div>
	</div>
	
	<!-- 트레이너 정보 보기 모달 -->
	<div class="modal-back" id="infot-modal-back">
		<div class="modal-con" id="infot-modal">
			<h3 style="text-align: center; margin-top: 10px;" id="name" ></h3>
			<div style="width: 90%; margin: auto;">
				<hr>
				<div>
					<table class="tableCss tp">
						<tr style="border-bottom: 1px solid #27a5ff !important;">
							<th>키</th>
							<td id="height"></td>
							<th>몸무게</th>
							<td id="weight"></td>
							<th>체지방</th>
							<td id="fat"></td>
						</tr>
					</table>
				</div>
				<table class="tableCss ti">
					<tr>
						<th style="height: 30px !important;">가입일</th>
						<td id="enrollDate"></td>
					</tr>
					<tr>
						<th style="height: 30px !important;">이메일</th>
						<td id="email"></td>
					</tr>
					<tr>
						<th style="height: 30px !important;">전화번호</th>
						<td id="phone"></td>
					</tr>
					<tr>
						<th style="height: 30px !important;">회원수</th>
						<td id="mCount"></td>
					</tr>
				</table>
				<div style="width: 105px; margin: 20px auto 15px;">
					<h4 style="text-align: center;">경력사항</h4>
				</div>
				<textarea id="carry"></textarea>
			</div>
			<div class="canceldiv">
				<img src="${contextPath}/resource/photo/manager/cancel.png">
			</div>
		</div>
	</div>

	<!-- 트레이너 일정 보기 모달 -->
	<div class="modal-back" id="mts-modal-back">
		<div class="modal-con" id="mts-modal">
		
			<div class="outer">
				<div class="Div1" align="center">
					<div id='calendar' style="margin-top: 15px; user-select: all;"></div>
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- 트레이너 관리 모달 -->
	<div class="modal-back" id="mt-modal-back">
		<div class="modal-con" id="mt-modal">
			<h3 style="text-align: center; margin-top: 10px;">직원 관리</h3>
			<br>
			<p style="text-align: center">정말 홍길동 트레이너를 탈퇴 시키겠습니까?</p>
			<br>
			<div style="position: relative;">
				<button onclick="yes()" id="yesbtn">예</button>
				<button onclick="cancel()" id="canbtn">아니오</button>
			</div>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br>
	<jsp:include page="../common/footer.jsp" />

	<script>

		$(function() {
			$(".tinfo").click(function(){
				var id = $(this).attr('id');
				console.log(id);
				
				$("#name").text($("#name"+id).val()+" 트레이너 정보");
				
				$("#height").text($("#height"+id).val()+"cm");
				$("#weight").text($("#weight"+id).val()+"kg");
				$("#fat").text($("#fat"+id).val()+"%");

				$("#enrollDate").text($("#enroll"+id).val());
				$("#email").text($("#email"+id).val());
				$("#phone").text($("#phone"+id).val());
				$("#fat").text($("#fat"+id).val()+"%");	//회원수

				$("#carry").text($("#carrer"+id).val()); //경력
				
				$("#infot-modal-back").fadeIn(300);
				$("#infot-modal").fadeIn(300);
				$("body").css("overflow-y", "hidden");
				$("body").css("overflow-x", "hidden");
				
			});
			
			$("#addmember").click(function() {
				$("#addt-modal-back").fadeIn(300);
				$("#addt-modal").fadeIn(300);
				$("body").css("overflow-y", "hidden");
				$("body").css("overflow-x", "hidden");
			});

			// 트레이너 랜덤 비밀번호
			/* $("#new-train").click(function() {
				$("#random-modal-back").fadeIn(300);
				$("#random-modal").fadeIn(300);
				$("body").css("overflow-y", "hidden");
				$("body").css("overflow-x", "hidden");
			}); */

			/* 트레이너 추가 완료버튼 */
			$("#addtmember").click(function() {
				var tname = document.getElementById('tname').value;
				var tid = document.getElementById('tid').value;
				var tpwd = document.getElementById('tpwd').value;
				if (tname != "" && tid != "" && tpwd != "") {
					$("#addt-modal-back").fadeOut(300);
					$("#addt-modal").fadeOut(300);
					$("body").css("overflow-y", "scroll");
					$("body").css("overflow-x", "scroll");
				}
			});


			$(".2").click(function() {
				$("#mts-modal-back").fadeIn(300);
				$("#mts-modal").fadeIn(300);
				$("body").css("overflow-y", "hidden");
				$("body").css("overflow-x", "hidden");
			});

			$(".3").click(function() {
				$("#mt-modal-back").fadeIn(300);
				$("#mt-modal").fadeIn(300);
				$("body").css("overflow-y", "hidden");
				$("body").css("overflow-x", "hidden");
			});

			/* 전체 취소버튼 */
			$(".canceldiv").click(function() {
				$("#addt-modal-back").fadeOut(300);
				$("#addt-modal").fadeOut(300);
				$("#infot-modal-back").fadeOut(300);
				$("#infot-modal").fadeOut(300);
				$("#mts-modal-back").fadeOut(300);
				$("#mts-modal").fadeOut(300);

				$("body").css("overflow-y", "scroll");
				$("body").css("overflow-x", "scroll");
			});

			/* ------------------- 모달 백그라운드 클릭 시 모달 종료 ------------------ */
			$(document).click(
					function(e) {
						if (e.target.id == 'addt-modal-back'
								|| e.target.className == 'modal-back') {
							$("#addt-modal-back").fadeOut(300);
							$("#addt-modal").fadeOut(300);
							$("#infot-modal-back").fadeOut(300);
							$("#infot-modal").fadeOut(300);
							$("#mt-modal-back").fadeOut(300);
							$("#mt-modal").fadeOut(300);
							$("#mts-modal-back").fadeOut(300);
							$("#mts-modal").fadeOut(300);

							$("#random-modal-back").fadeOut(300);
							$("#random-modal").fadeOut(300);

							$("body").css("overflow-y", "scroll");
							$("body").css("overflow-x", "scroll");
						}
					});
		
		});

		function yes() {
			$("#mt-modal-back").fadeOut(300);
			$("#mt-modal").fadeOut(300);
			alert("탈퇴 완료");
			//------------------------ 작성 더 해야됌
		}
		function cancel() {
			$("#mt-modal-back").fadeOut(300);
			$("#mt-modal").fadeOut(300);
			$("body").css("overflow-y", "scroll");
			$("body").css("overflow-x", "scroll");
		}
	</script>
</body>
</html>