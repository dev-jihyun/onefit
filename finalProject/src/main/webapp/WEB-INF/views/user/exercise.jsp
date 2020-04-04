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
  
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      //-----설정 시작
     plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      
      slotDuration: '01:00:00',  // 2 hours
      defaultView: 'dayGridMonth',
      defaultDate: todayDate,
      navLinks: true, // can click day/week names to navigate views
      selectable: false,
      selectMirror: true,
      draggable:false,
      timeZone: 'Asia/Seoul',
      locale: 'local',
      editable: true,
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
                {
                  id: "${ s.atNum }",
                  title:"${ s.content }",
                  start: '<fmt:formatDate value="${ s.atDate }" pattern="yyyy-MM-dd" />',
                  color: "black",//테두리색
                  textColor: "white",//글자색
                  backgroundColor: "blue"//이벤트 색깔
               },
               </c:forEach>
          </c:if>
            
       
       
       //for문에 콤마처리때문에 오류 방지용 가상데이터 넣어주기
       {
          id:'a',
           title: '왜안나왕',
           start: '2200-20-26T16:00:00'
        }/* ,
        {
          title: 'Long Event',
          start: '2020-03-07',
          end: '2020-03-10'
        },
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
      ,dateClick: function(info) {
     
/*          console.log("날짜 클릭 콜백함수");
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
/////////////////////////오늘날짜보다 지난날짜클릭해서 삭제 안되도록

         var loginUserNum = "${ loginUser.userNum }";
         var infoStr = info.event.id;
         var indexNum = infoStr.indexOf("N");
         
         var eventIdNum = infoStr.substring(indexNum+1, infoStr.length);
          
         console.log("infoStr : " + infoStr);
         console.log("indexNum : " + indexNum);
         console.log("userNum : " + eventIdNum);
         if(loginUserNum == eventIdNum){
         // 내 일정이면 취소가능
             if(confirm("취소하시겠습니까" + info.event.id)){
                /* var aaa = info. */
                /* calendarId.removeAllEvents(); */
                /* calendar.removeEvents(info); */
                removeMethod(info);
             }
         }else{
            /* alert("다른 사람의 일정은 선택 안됩니다."); */
            
         }
        /* if(userNum==) */
         // 내 일정이 아니면 예약불가 얼럿

         
      }
      
      , eventRender:function(info) {
         console.log("추가된 이벤트 아이디 : " +info.event.id);
         console.log(info.event.start);
         console.log("렌더가 몬데");

    }
      
    });
    
    calendar.render();
/*     var event = calendar.getEventById('a') // an event object!
    var start = event.start // a property (a Date object)
   */ 
    
    function removeMethod(info){
       var loginUserNum = "${ loginUser.userNum }";
     var infoStr = info.event.id;
     var indexNum = infoStr.indexOf("N");
     //스케줄ID구하기(scNum)
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
   <jsp:include page="../common/userNav.jsp" />

   <div class="outer">
      <div class="pageName">
         <p>출석체크</p>
      </div>
      <div class="Div1" align="center">
         <br> <br> <br>
         

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