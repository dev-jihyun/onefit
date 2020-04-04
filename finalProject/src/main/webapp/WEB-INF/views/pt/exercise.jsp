<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<script src='resource/fullcalendar-4.3.1/packages/bootstrap/main.js'></script>

<script>
  document.addEventListener('DOMContentLoaded', function() {
	  var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
	  	var healthColor = "pink";
		var ptColor = "palevioletred";
	  	var otherEventColor = "pink";
	  	
	  	
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
        left: 'prev, next, today',
        center: 'title',
        right: 'dayGridMonth,listMonth,timeGridWeek,timeGridDay'
      },
      defaultDate: today,
      /* themeSystem: 'bootstrap', */

      
      locale: initialLocaleCode,
      buttonIcons: false, // show the prev/next text
      weekNumbers: true,
      //navLinks: true,  can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
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
          calendar.unselect();
        },
      events: [
    	  
    	  //헬스장 출석정보 뿌리기.
    	  <c:if test="${ !empty alist }">
	    	  <c:forEach var="a" items="${ alist }"> 
			             {
			            	id: "${ a.atNum }"+"A"+"${ a.userNum }",
			                title: "헬스장 출석",
			                start: '<fmt:formatDate value="${ a.atDate }" pattern="yyyy-MM-dd" />'+"T"+'<fmt:formatDate value="${  a.atDate }" pattern="HH:mm:ss" />',
			                		/* yyyy-MM-dd HH:mm:ss */
			                		/* 2020-02-09T16:00:00 */
			                color: "black",//테두리색
			               	textColor: "white",//글자색
			               	backgroundColor: healthColor//이벤트 색깔
			            },
			    </c:forEach>
		    </c:if>
		    
		  //PT운동 일지 조회하기.
	    	  <c:if test="${ !empty elist }">
		    	  <c:forEach var="e" items="${ elist }"> 
				             {
				        id: "${ e.jrNum }"+"E",
				        title: "PT출석",
				        start: '<fmt:formatDate value="${ e.jrDate }" pattern="yyyy-MM-dd" />'+"T"+'<fmt:formatDate value="${  e.jrDate }" pattern="HH:mm:ss" />',
				        		/* yyyy-MM-dd HH:mm:ss */
				        		/* 2020-02-09T16:00:00 */
				        color: "black",//테두리색
				        textColor: "white",//글자색
				        backgroundColor: ptColor,//이벤트 색깔
				        content: "e.exPart"
				            },
				    </c:forEach>
			    </c:if>
		            
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
          start: '2020-03-09T16:00:00'
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

	  }
      , eventRender:function(info) {   
    	  	if (info.event.extendedProps.imageurl) {
           	   //info.el.firstChild.innerHTML = "<img src='" + info.event.extendedProps.imageurl +"' width='60' height='40' style='display:block; margin-left:auto; margin-right:auto;'>" + "<div style='text-align:center'>" + info.event.title + "</div>";
    	  	}
      }
      , eventClick:function(info) {
    	  //이벤트 클릭했을때, 헬스장 출석이면 반응 없게.
    	  var eventId = info.event.id;
    	  console.log(eventId);
    	  var indexNum = eventId.indexOf("E");
    	  
    	  if(eventId.includes("E")){
    		  //PT상세정보 뿌리기
    		  var jrNum2 = eventId.substring(0, indexNum);
    		  console.log(info.event.content);
				
    		  location.href="ptExDetail.do?jrNum="+jrNum2;
    		  /* $('.ttt').modal("show"); */
        	  console.log(info.event.start);	  
    	  }
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
	body{
		margin:auto;
		background: rgb(240, 240, 240) !important;
		
	}
.outer {
 	display:inline-block !important;
 	width: 1100px; 
	background: white;
	height: auto;
	margin: 100px auto auto 100px;
	/* max-width: 600px; */
	position: relative;
	/* width: 80%; */
	box-shadow: 0 1px 7px hsla(0, 0%, 0%, 0.2);
}
	.pageName{
		width: 100%;
		/* height: 90%; */
		display: inline-block;
		/* background: rgb(89, 89, 89); */
		padding: 30px 0 30px 0;
	}
.pageName p {
		/* margin:0 50px 50px 50px; */
		font-size: 50px;
		padding: 0;
		margin:0;
		font-weight: bolder;
		text-align:center;
		color:rgb(0, 0, 0);
		/* text-shadow: 2px 2px 2px gray; */
}
.outer:after,
.outer:before {
  background: #e6e6e6;
  content: '';
  height: 50px;
  position: absolute;
  top: -25px;
  width: 100px;
  box-shadow: 0 5px 10px -7px hsla(0, 0% ,0%, 0.5);
}
.outer:after {
  left: -50px;
  transform: rotate(-45deg);
}
.outer:before {
  right: -50px;
  transform: rotate(45deg);
}
.Div1 {
	border: 1px solid lightgrey;
	width: 900px;
	height: 900px;
	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
	transition: 0.3s;
	border-radius: 5px;
	position: relative;
	margin: 60px auto;
	padding: 20px;
}
  #calendar {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    font-size: 12px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
    padding: 0 10px;
    z-index:-1;
    <%-- background-image : url(<%= request.getContextPath() %>/resources/images/PlanBackground.jpeg);
    background-size : 100%;
    /* opacity:0.5!important; */
    filter:alpha(opacity=50);
    z-index:-1;
    width:100%;
    height:100%; --%>
  }
	
  .fc-rigid {
  	cursor: pointer;
  	/* fc-widget-content fc-week-number */
  }
  
  .fc-week-number {
  	display:none;
  }
  
</style>
</head>
<body>
<jsp:include page="../common/ptNav.jsp"/>

	<div class="outer">
		<div class="pageName">
			<p>운동일지</p>
		</div>
		<div class="Div1" align="center">
	<br><br><br>
  <div id='calendar' style="user-select:all"></div>
  </div>
  </div>
  <br>
  <br>
  	<!-- /////////////////////////////////비번확인용 Modal//////////////////////////////////// -->
<div class="modal fade ttt" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="false">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p class="modal-title" id="exampleModalCenterTitle">비밀번호 재확인</p>
				<button type="button" class="close modal_close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
        		</button>
      		</div>

      		<div class="modal-body">
      			<div class="orderList_div">
						<p align="center">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.<br><br>
							비밀번호를 입력하면 정보수정 페이지로 이동합니다.
						</p>
						<table align="center" class="table table-sm chk_modal_table">
							<tr>
								<th class="cols1">아이디 </th>
								<td class="cols2">${ loginUser.userId }</td>
							</tr>
							<tr>
								<th>비밀번호 </th>
								<td> <input type="password" class="modal_pwdChk" required></td>
							</tr>
						</table>
				</div>
			</div>
    		<div class="modal-footer">
        		<!-- <button type="button" class="btn btn-secondary modal_close" data-dismiss="modal">Close</button> -->
        		<button type="button" class="btn btn-primary modal_select_btn">확인</button>
    		</div>
    	</div>
  	</div>
</div>

<script>/* 모달 */
$(function() {
	// 개인정보 비번확인용 모달창
	$(".editBtn").click(function(){
		// 모달 보이기
		$('.ttt').modal("show");
	});
	
	//모달 x버튼 누르면 창 종료
	$(".modal_close").click(function(){
		// 모달 창을 닫으면 모달 안에 있는 데이터 모두 초기화해야함
		$(".ttt").modal("hide");
	});
});
  </script>
  
  	<jsp:include page="../common/footer.jsp" />
  
</body>
</html>