<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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

<script>
  document.addEventListener('DOMContentLoaded', function() {
	// 1. 디폴트 날짜 : 오늘날짜가되게 하기.
	var todayDate = new Date();
  	var myEventColor = "palevioletred";
  	var otherEventColor = "pink";
  	
    var calendarEl = document.getElementById('calendar'); 
    var calendar = new FullCalendar.Calendar(calendarEl, {
      //-----설정 시작
	  plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      height:500,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      disableDragging: true,
      slotDuration: '01:00:00',  // 2 hours
      defaultView: 'timeGridWeek',
      defaultDate: todayDate,
      navLinks: true, // can click day/week names to navigate views
      selectable: false,
      selectMirror: true,
      timeZone: 'Asia/Seoul',
      locale: 'local',
      /* allDayDefault:true, */
      allDay:true,
      /* editable: true, */
      eventLimit: true, // allow "more" link when too many events
      minTime: "09:00:00",
      maxTime: "18:00:00",
      /*
		select: function(arg) {
		var reservedTime = (arg.start.getMonth() + 1 ) + "월 " + arg.start.getDate()+"일 " + (arg.start.getHours()-9)+":00시";
		console.log("클릭시간 : " + arg.start.getFullYear()+"년" );
		var title = confirm("'"+ reservedTime + "' 로 예약하시겠습니까?");

    	console.log(title);
    	if (title==true) {
	      	calendar.addEvent({
		        id:'이벤트',
		    	title: title,
		        start: arg.start,
		        end: arg.end,
		        allDay: arg.allDay
	      	})
    	}
    	calendar.unselect();
  	}, */
    //-----설정 끝
    
    	//이벤트 출력부분
      events: [
    	  // DB에서 가져온 날짜 출력하기
    	  <c:if test="${ !empty list }">
    	  	
    	  <c:forEach var="s" items="${ list }"> 
	    	  	
    	  		// cate==1
	    	  	<c:if test="${ s.cate == 1 }">
	    	  		//내 일정.
		    	  	<c:if test="${ s.userNum eq loginUser.userNum }">
		             {
		            	id: "${ s.scNum }"+"N"+"${ s.userNum }",
		                title: "${ s.content }",
		                start: '<fmt:formatDate value="${ s.scStart }" pattern="yyyy-MM-dd" />'+"T"+'<fmt:formatDate value="${ s.scStart }" pattern="HH:mm:ss" />',
		               	end:'<fmt:formatDate value="${ s.scEnd }" pattern="yyyy-MM-dd" />'+"T"+'<fmt:formatDate value="${ s.scEnd }" pattern="HH:mm:ss" />',
		                		/* yyyy-MM-dd HH:mm:ss */
		                		/* 2020-02-09T16:00:00 */
		                color: "black",//테두리색
		               	textColor: "white",//글자색
		               	backgroundColor: myEventColor//이벤트 색깔
		            },
		            </c:if>
	            
		            //다른사람 일정.
		            <c:if test="${ s.userNum ne loginUser.userNum }">
		            {
		            	id: "${ s.scNum }"+"N"+"${ s.userNum }",
		                title: "${ s.content }",
		                start: '<fmt:formatDate value="${ s.scStart }" pattern="yyyy-MM-dd" />'+"T"+'<fmt:formatDate value="${ s.scStart }" pattern="HH:mm:ss" />',
		               	end:'<fmt:formatDate value="${ s.scEnd }" pattern="yyyy-MM-dd" />'+"T"+'<fmt:formatDate value="${ s.scEnd }" pattern="HH:mm:ss" />',
		               	color: "black",//테두리색
		                textColor: "black",
		               	backgroundColor: otherEventColor
		            },
		            </c:if>
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
        } ,
        {
          title: 'Long Event',
          start: '2020-03-07',
          end: '2020-03-10'
        }/*,
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-03-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2020-03-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2020-03-11',
          end: '2020-03-13'
        }*/
      ]
  	
  	//////////////////////////빈 날짜 클릭때 발생하는 함수////////////////////////
      ,dateClick: function(info) {
    	  //클릭 날짜와 시간.
    	  var yy = info.date.getFullYear();//년
    	  var mm = info.date.getMonth()+1;//월
    	  var dd = info.date.getDate();//일
    	  var hh = info.date.getHours();//시작시간
    	  var endhh= hh+1;//끝나는시간
    	  
    	  //오늘 날짜.
    	  var toyy = todayDate.getFullYear();//년
    	  var tomm = todayDate.getMonth();//월
    	  var todd = todayDate.getDate();//일
    	  
    	  /////////////////////////오늘날짜보다 지난날짜클릭안되도록.
    	  //클릭날짜 포맷변환
    	  var indexNum = info.dateStr.indexOf("T");
    	  var ptDate = info.dateStr.substring(0, indexNum);
    	  var ptTime = info.dateStr.substring(indexNum+1, info.dateStr.length);
    	  
    	  var todayDate2 = new Date(toyy, tomm, todd);
    	  var clickDate = new Date(ptDate+" 00:00:00");
    	  console.log("오늘 날짜 : " + todayDate2);
    	  console.log("클릭한 날짜" + clickDate);

    	  //오늘날짜보다 과거 클릭 시엔 아무반응 없고,
    	  //오늘날짜보다 미래 선택시 1. 당일예약있는지 확인 후  2. PT일정 예약 가능하게 할 것.
    	  if(todayDate2 < clickDate){
	    	  /////////////////////////이미 하루에 예약이 있으면 예약못하게해야함
	    	  var isReserved= false;
	    	  
    		  // 1. 당일예약있는지 확인.
    		  <c:forEach var="s" items="${ list }"> 
	    		  var scStartDatemm = parseInt('<fmt:formatDate value="${ s.scStart }" pattern="MM"/>');
	    		  var scStartDatedd = parseInt('<fmt:formatDate value="${ s.scStart }" pattern="dd"/>');
	    		  var scEndDatemm = parseInt('<fmt:formatDate value="${ s.scEnd }" pattern="MM"/>');
	    		  var scEndDatedd = parseInt('<fmt:formatDate value="${ s.scEnd }" pattern="dd"/>');
	    		  
	    		  var cate = "${ s.cate }";
	    		  var content = "${ s.content }";
	    		 console.log("cate: " + cate);
	    		 var mmm= clickDate.getMonth()+1;
	    		 console.log("내용 : " + content);
 		  		console.log("클릭날짜 월 : " + mmm);
		  		console.log("예약 월 : " + scStartDatemm);
		  		console.log("클릭날짜 일 : " + clickDate.getDate());
		  		console.log("예약 일 : " + scStartDatedd);
		  		console.log("scEndDate : " + "${s.scEnd }")
				//월일이 같고 
    		  	if(mmm >= scStartDatemm && clickDate.getDate()>=scStartDatedd && mmm <= scEndDatemm && clickDate.getDate()<=scEndDatedd){
					 	isReserved=true;
					 if(cate == 1){// 예약있으면 flag값 true
					 	alert("해당 날짜에 이미 예약되어있습니다.");
					 }else{//
						alert("선택하신 날짜는 트레이너 휴가일입니다. 다른 날을 예약해주세요.")				 
					 }					 
				 }
			 </c:forEach>
			 if(isReserved == false){
				 // 2. 당일예약이 없다면 일정 예약 프로세스로.
	    		  var Dateformat = mm+"월 " + dd+"일 " + hh+":00시 - "+ endhh+":00시";
	              var ptDay = ptDate + " " + ptTime;
	              if(confirm("'"+ ptDate + " " + ptTime +"' 로 예약하시겠습니까?")){
	          	  	location = "insertSchedule.do?ptDay="+ptDay;
	          	}
				 
			 }

    	  }
    	  
    	  else{

    	  }
    	  
    	  /////////////////////////트레이너 휴가면 예약 불가
	  
/*     	  console.log("날짜 클릭 콜백함수");
    	  console.log("clickday : " + info.dateStr);
    	  
	        $.ajax({
		 	   url:"insertSchedule.do",
			    data:{
			    	  info: info.dateStr
			    	  
			   	},
			    success:function(data){
			       if(data.isPwdCheck == true){
					// 일정추가완료
			          console.log("일정추가 성공");
					//이벤트 앙
					
			       }else{
			     	//
			      	alert("비밀번호가 일치하지 않습니다.");
			       }
			    },
			    error:function(request,status,error){
			    	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    	  console.log("에러");
			    }
	       }); */
	  }

      , eventClick:function(info) {
    	  
    	  var loginUserNum = "${ loginUser.userNum }";
    	  var eventId = info.event.id;
    	  var indexNum = eventId.indexOf("N");
    	  var eventIdNum = eventId.substring(indexNum+1, eventId.length);
    	  var eventDate = info.event.start.toUTCString();
    	  var eventDate2 = new Date(eventDate);
    	  
    	  console.log("eventDate : " + eventDate);
    	  console.log("eventId : " + eventId);
    	  console.log("indexNum : " + indexNum);
    	  console.log("userNum : " + eventIdNum);
    	  
		/////////////////////////오늘날짜보다 지난날짜클릭해서 삭제 안되도록
    	  console.log("eventDate1 : " + eventDate);
    	  console.log("eventDate2 : " + eventDate2);
          console.log("todayDate : " + todayDate);
          console.log("todayDate.getMonth() : " + todayDate.getMonth());
          console.log("eventDate2.getMonth() : " + eventDate2.getMonth());
          console.log("todayDate.getDate() : " + todayDate.getDate());
          console.log("eventDate2.getDate() : " + eventDate2.getDate());
          console.log(todayDate < eventDate2);
          
		if(todayDate < eventDate2){
    		  //오늘날짜보다 클릭한 날짜가 더 미래일때 삭제가능하게 
        	  
    		  
    		  
    		  if(loginUserNum == eventIdNum){
    			  
        		  
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
        	  }else{
        		  
        	  }
        	

    		  
    		  
    		  
    	  }

    	  
      }
      
      , eventRender:function(info) {
    	  console.log("렌더되는 이벤트 월 수 : " +info.event.end);
    		  info.event.end="Thu Apr 30 2020 23:59:59 GMT+0900";

	 }
      
    });
    
    calendar.render();
	/*     var event = calendar.getEventById('a') // an event object!
    var start = event.start // a property (a Date object)
   */ 
   //이벤트 클릭 후 삭제확인 버튼 눌렀을때 발생하는 이벤트 삭제 메소드
    function removeMethod(info){
  	  var loginUserNum = "${ loginUser.userNum }";
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
			    	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    	  console.log("에러");
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

td .fc-time {
	/* height: 50px !important; */
	
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

/* .fc-event {
	color: white !important;
} */
</style>
</head>
<body>
	<jsp:include page="../common/ptNav.jsp" />

	<div class="outer">
		<div class="pageName">
			<p>PT일정</p>
		</div>
		<div class="Div1" align="center">
			<br> <br> <br>
			<p style="text-align: right; font-size: 12px;">* PT 예약 가능 시간 : 오전
				09:00 - 오후 06:00</p>
			<p style="text-align: right; font-size: 12px;">* 일정 수정이 필요한 경우에는
				일정 취소 후 재예약 해주세요.</p>
			<p style="text-align: right; font-size: 12px;">* 당일 일정 취소나 예약은
				불가합니다. 필요할 경우 관리자에게 문의해주세요.</p>
			
			<p style="text-align:right;"><span class="myEventColor" style="color:palevioletred;">■</span>내 PT일정</p>
			<p style="text-align:right;"><span class="otherEventColor" style="color:pink;">■</span><span>다른 회원 일정</p>

			<div id='calendar' style="user-select: all"></div>
		</div>
		<br> <br>
	</div>
	<br>
	<br>
	<jsp:include page="../common/footer.jsp" />


	<script>

  
  </script>
</body>
</html>