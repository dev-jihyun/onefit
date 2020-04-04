<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='resource/fullcalendar-4.3.1/packages/core/main.css'
	rel='stylesheet' />
<link href='resource/fullcalendar-4.3.1/packages/daygrid/main.css'
	rel='stylesheet' />
<link href='resource/fullcalendar-4.3.1/packages/timegrid/main.css'
	rel='stylesheet' />
<link href='resource/fullcalendar-4.3.1/packages/list/main.css'
	rel='stylesheet' />
<script src='resource/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/core/locales-all.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/interaction/main.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/daygrid/main.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/timegrid/main.js'></script>
<script src='resource/fullcalendar-4.3.1/packages/list/main.js'></script>
<link href='resource/fullcalendar-4.3.1/packages/bootstrap/main.css'
	rel='stylesheet' />
<script src='resource/fullcalendar-4.3.1/packages/bootstrap/main.js'></script>
<title>Insert title here</title>
<script>
  document.addEventListener('DOMContentLoaded', function() {
	// 1. 디폴트 날짜 : 오늘날짜가되게 하기.
		var todayDate = new Date();
	  	var myEventColor = "palevioletred";
	  	var otherEventColor = "pink";
    var initialLocaleCode = 'ko';
    var localeSelectorEl = document.getElementById('locale-selector');
    var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
    	 //-----설정 시작
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list'],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      },
      defaultDate: todayDate,
      /* themeSystem: 'bootstrap', */

      selectable : false,
      selectMirror: true,
/*       select: function(arg) {
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
        }, */
        locale: 'local',
        timeZone: 'UTC',
      buttonIcons: false, // show the prev/next text
      weekNumbers: true,
      //navLinks: true,  can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
    	  <c:if test="${ !empty list }">
  	  	
    	  <c:forEach var="s" items="${ list }"> 
	    	  	
    	  		// cate==1
	    	  	<c:if test="${ s.cate == 1 }">
	    	  		//내 일정.
		    
		             {
		            	id: "${ s.scNum }"+"N"+"${ s.userNum }",
		                title: "${ s.ptmName }",
		                start: '<fmt:formatDate value="${ s.scStart }" pattern="yyyy-MM-dd" />'+"T"+'<fmt:formatDate value="${ s.scStart }" pattern="HH:mm:ss" />',
		               	end:'<fmt:formatDate value="${ s.scEnd }" pattern="yyyy-MM-dd" />'+"T"+'<fmt:formatDate value="${ s.scEnd }" pattern="HH:mm:ss" />',
		                		/* yyyy-MM-dd HH:mm:ss */
		                		/* 2020-02-09T16:00:00 */
		                color: "black",//테두리색
		               	textColor: "white",//글자색
		               	backgroundColor: myEventColor//이벤트 색깔
		            },
		           
	            </c:if>
	            
	            //cate==2
	            <c:if test="${ s.cate == 2}">
	            
	            //트레이너 휴가 일정
	            {
	            	id: "${ s.scNum }"+"N"+"${ s.userNum }",
	                title: "${ s.content }",
	                start: '<fmt:formatDate value="${ s.scStart }" pattern="yyyy-MM-dd" />',
	               	end:'<fmt:formatDate value="${ s.scEnd }" pattern="yyyy-MM-dd" />',
	               	/* T23:59:00 */
	                		/* yyyy-MM-dd*/
	                		/* 2020-02-09*/
	               	color: "black",//테두리색
	                textColor: "white",
	               	backgroundColor: "grey"
	                		
	            },
	            </c:if> 
	            
    	  	</c:forEach>
    	</c:if>

    	//for문에 콤마처리때문에 오류 방지용 가상데이터 넣어주기
    	{
    		id:'a',
        	title: 'data',
        	start: '2020-03-01T16:00:00'
        }
    			
      ]
      ,dateClick: function(info) {
    	  console.log("날짜 클릭 메소드");

	  }
      , eventRender:function(info) {   
    	  
      }
      , eventClick:function(info) {

    	  
    	  var eventId = info.event.id;
    	  var indexNum = eventId.indexOf("N");
    	  var eventIdNum = eventId.substring(indexNum+1, eventId.length);
    	  var eventDate = info.event.start;
    	  var eventDate2 = new Date(eventDate);
    	  
    	  console.log("eventDate1 : " + eventDate);
    	  console.log("eventDate2 : " + eventDate2);
          console.log("todayDate : " + todayDate);
          console.log("todayDate.getMonth() : " + todayDate.getMonth());
          console.log("eventDate2.getMonth() : " + eventDate2.getMonth());
          console.log("todayDate.getDate() : " + todayDate.getDate());
          console.log("eventDate2.getDate() : " + eventDate2.getDate());
/*     	  console.log("eventId : " + eventId);
    	  console.log("indexNum : " + indexNum);
    	  console.log("userNum : " + eventIdNum); */
    	  
		/////////////////////////오늘날짜보다 지난날짜클릭해서 삭제 안되도록
          
		if(todayDate < eventDate2){
    		  //오늘날짜보다 클릭한 날짜가 더 미래일때 삭제가능하게 
        	  if(todayDate.getMonth()==eventDate2.getMonth()&&todayDate.getDate()<eventDate2.getDate()){
        			  
        			 
        			if(confirm("취소하시겠습니까?" + info.event.id)){
        				/* var aaa = info. */
        				/* calendarId.removeAllEvents(); */
        				/* calendar.removeEvents(info); */
        				removeMethod(info);
        			}
    		  
        	  }else if(todayDate.getMonth()<eventDate2.getMonth()){
      			if(confirm("취소하시겠습니까?" + info.event.id)){
    				/* var aaa = info. */
    				/* calendarId.removeAllEvents(); */
    				/* calendar.removeEvents(info); */
    				removeMethod(info);
    			}
        	  }
		}
      }
      
    });

    calendar.render();
    //이벤트 클릭 후 삭제확인 버튼 눌렀을때 발생하는 이벤트 삭제 메소드
    function removeMethod(info){
	  var infoStr = info.event.id;
	  var indexNum = infoStr.indexOf("N");
	  //스케줄Id구하기(scNum)
	  var eventIdNum = infoStr.substring(0, indexNum);
	  console.log("-jsp-삭제할 스케줄 넘버 : " + eventIdNum);
	//DB삭제
        $.ajax({
		 	   url:"deletePtSchedule.do",
			    data:{
			    	  scNum: eventIdNum,  
			   	},
			    success:function(data){
			       if(data.isDeleteEvent == true){
					// 일정추가완료
			          console.log("일정삭제 성공");
					
			       }else{
			     	//
			      	alert("일정삭제 실패");
			       }
			    },
			    error:function(request,status,error){
			    	 
			    }
	       
	       });
		
        //화면에서도 삭제.
    	var event = calendar.getEventById(info.event.id); // an event object!
       	event.remove();
    }
    

  });
</script>
<style>
body {
	background: rgb(240, 240, 240) !important;
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
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

.Div1 {
	border: 1px solid lightgrey;
	width: 950px;
	position: relative;
	margin: auto;
	background: white;
	padding: 50px 25px;
	margin: auto;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	border-radius: 5px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
	font-size: 14px;
}

.pageName {
	width: 100%;
	display: inline-block;
	padding: 30px 0 30px 0;
}

.pageName p {
	font-size: 50px;
	padding: 0;
	margin: 0;
	font-weight: bolder;
	text-align: center;
	color: rgb(0, 0, 0);
}

#top {
	background: #eee;
	border-bottom: 1px solid #ddd;
	padding: 0 10px;
	line-height: 40px;
	font-size: 12px;
}

.fc-rigid {
	cursor: pointer;
	/* fc-widget-content fc-week-number */
}

.fc-week-number {
	display: none;
}

.margin-bottom {
	margin-bottom: 2%;
}
</style>
</head>
<body>
	<jsp:include page="../common/trainerNav.jsp" />
	<div class="outer margin-bottom">
		<div class="pageName">
			<p>트레이너 PT일정</p>
		</div>
		<div class="Div1" align="center">
			<br>
			<br>
			<br>
			<div id='calendar' style="user-select: all"></div>
		</div>
		<button class="button button2 font checkBtn"
			style="margin-top: 2%; font-size: 1.5rem;">휴가 제출</button>

	</div>
	<br>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>