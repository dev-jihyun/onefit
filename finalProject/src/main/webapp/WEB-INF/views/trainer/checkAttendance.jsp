<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.attendancy{
	background:#64c8fa;
}
/*전체를 감싸는 부분*/
.check-area{
	width:95%;
	margin-top:5%;
	margin-left:2%;
	margin-bottom:1.5%;
	padding:2%;
	font-family: 'Noto Sans KR', sans-serif;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  border-radius: 5px;
}
/*날짜 찍는 부분*/
.date-area{
	font-size:3.5rem;
}
/*운동 부위 체크 부분*/
.excercise-part{
	font-size:1.2rem;
}
.excercise-part input{
	margin-left:1%;
}
.excercise-part input[type=checkbox]
{
  /* Double-sized Checkboxes */
  -ms-transform: scale(2); /* IE */
  -moz-transform: scale(2); /* FF */
  -webkit-transform: scale(2); /* Safari and Chrome */
  -o-transform: scale(2); /* Opera */
  padding: 10px;  
}

/*운동 종목*/
.plusIcon{
	width:32px;
	height:32px;
	margin-left:0.8%;
}
.minus{
	width:32px;
	height:32px;
	margin-left:2%;
	margin-top:2%;
}
.plusIcon:hover{
	cursor:pointer;
}
.minus:hover{
	cursor:pointer;
}
.excercise-tb td{
	padding:10px;
}
/*사용자 동의*/
.user-check{
	font-size:1.5rem;
}
.user-check label{
	font-size:1.2rem;
}

.user-check input[type=checkbox]
{
	margin-left:1%;
  /* Double-sized Checkboxes */
  -ms-transform: scale(2); /* IE */
  -moz-transform: scale(2); /* FF */
  -webkit-transform: scale(2); /* Safari and Chrome */
  -o-transform: scale(2); /* Opera */
  padding: 10px;
  
}
/*오늘 총정리*/
.last-word #ta{
	resize:none;
	width:100%;
	height:5%:
}
/*위치 조정 부분*/
.float-left{
	float:left;
	margin-left:2%;
}
.margin-top{
	margin-top:5%;
}
.margin-left{
	margin-left:50px;
}
</style>
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 체크박스 부트스트랩 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../common/trainerNav.jsp"/>
	<div class="check-area card">
		<div class="date-area">
			<p>${ excercise.jrDate }</>
		</div>
		<form id="checkAttendance" action="insertExcercise.do" method="post" onsubmit="return validate()">
			<div class="excercise-part margin-top">
				<h2>운동부위</h2>
				<div class="custom-control custom-checkbox float-left">
				  <input type="checkbox" class="custom-control-input" id="chest" name="exPart" value="가슴" ${ checkedExpart[0] }>
				  <label class="custom-control-label" for="chest">가슴</label>
				</div>
				<div class="custom-control custom-checkbox float-left">
				  <input type="checkbox" class="custom-control-input" id="shoulder" name="exPart" value="어깨" ${ checkedExpart[1] }>
				  <label class="custom-control-label" for="shoulder">어깨</label>
				</div>
				<div class="custom-control custom-checkbox float-left">
				  <input type="checkbox" class="custom-control-input" id="back" name="exPart" value="등" ${ checkedExpart[2] }>
				  <label class="custom-control-label" for="back">등</label>
				</div>
				<div class="custom-control custom-checkbox float-left">
				  <input type="checkbox" class="custom-control-input" id="arm" name="exPart" value="팔" ${ checkedExpart[3] }>
				  <label class="custom-control-label" for="arm">팔</label>
				</div>
				<div class="custom-control custom-checkbox float-left">
				  <input type="checkbox" class="custom-control-input" id="abdomen" name="exPart" value="복부" ${ checkedExpart[4] }>
				  <label class="custom-control-label" for="abdomen">복부</label>
				</div>
				<div class="custom-control custom-checkbox float-left">
				  <input type="checkbox" class="custom-control-input" id="lower" name="exPart" value="하체" ${ checkedExpart[5] }>
				  <label class="custom-control-label" for="lower">하체</label>
				</div>																																					
			</div>
			<div class="excercise-name margin-top">
				<h2>운동</h2>
				<table class="excercise-tb">
					<c:choose>
						<c:when test="${ excerciseContent != 'nothing' }"><!-- 비어있지 않을때 진입 -->
                		    <c:forEach var="ec" items="${ excerciseContent }" varStatus="status">
								<tr>
									<td>
										<dl>
											<dt>
											운동종목
											</dt>
											<dd>
											<input type="text" id="eName" name="eName" value="${ ec.eName }" />
											</dd>
										</dl>
									</td>
									<td>
										<dl>
											<dt>
											횟수
											</dt>
											<dd>
											<input type="number" id="count" name="count" min="0" value="${ ec.count }"/>
											</dd>
										</dl>
									</td>
									<td>
										<dl>
											<dt>
											세트
											</dt>
											<dd>
											<input type="number" id="set" name="set" min="0" value="${ ec.set }"/>
											</dd>
										</dl>
									</td>
									<td>
										<dl>
											<dt>
											메모
											</dt>
											<dd>
											<input type="text" id="memo" name="memo" value="${ ec.memo }"/>
											</dd>
										</dl>
									</td>
									<td>
										<img style="margin-top:12px;" class="minus" src="resource/photo/trainer/minus.png" onclick="remove(${ ec.exNum },this)">
										<input type="text" name="exNum" value="${ ec.exNum }" style="display:none;"/>
									</td>
								</tr>
	                		</c:forEach>							
						</c:when>
						<c:otherwise>
							<tr>
								<td>
									<dl>
										<dt>
										운동종목
										</dt>
										<dd>
										<input type="text" id="eName" name="eName"/>
										</dd>
									</dl>
								</td>
								<td>
									<dl>
										<dt>
										횟수
										</dt>
										<dd>
										<input type="number" id="count" name="count" min="0"/>
										</dd>
									</dl>
								</td>
								<td>
									<dl>
										<dt>
										세트
										</dt>
										<dd>
										<input type="number" id="set" name="set" min="0"/>
										</dd>
									</dl>
								</td>
								<td>
									<dl>
										<dt>
										메모
										</dt>
										<dd>
										<input type="text" id="memo" name="memo"/>
										</dd>
									</dl>
								</td>
							</tr>			
						</c:otherwise>
					</c:choose>
				</table>
				<br clear="both">							
			</div>
			<br>
			<img style="margin-top:12px;" class="plusIcon" src="resource/photo/trainer/add (2).png">
			<hr clear="both">
			<div class="user-check margin-top">
				<p>${ userName } 회원 님은 수업 내용을 확인했으며 pt 수업에 임하였음을 동의 합니다.</p>
				<div class="custom-control custom-checkbox float-left">
					<c:choose>
						<c:when test="${ excercise.jrNum == 0 }">
							<input type="checkbox" class="custom-control-input" id="confirm" name="confirm" value="confirm" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" class="custom-control-input" id="confirm" name="confirm" value="confirm" checked onclick="return false;"/>
						</c:otherwise>
					</c:choose>					
				  <label class="custom-control-label" for="confirm">동의</label>
				</div>					
			</div>
			<div class="last-word margin-top">
				<textarea id="ta" name="oneLine" placeholder="오늘의 한줄 평">${ excercise.oneLine }</textarea>
			</div>
			<button class="button button2 font checkBtn" style="font-size:1.5rem;">출석 확인</button>
			<input type="date" name="jrDate" value="${ excercise.jrDate }" style="display:none;"/>
			<input type="text" name="userNum" value="${ excercise.userNum }" style="display:none;"/>
			<input type="text" name="jrNum" value="${ excercise.jrNum }" style="display:none;"/>
			<c:choose>
				<c:when test="${ excercise.jrNum == 0 }">
					<input type="text" name="check" value="insert" style="display:none;"/>
				</c:when>
				<c:otherwise>
					<input type="text" name="check" value="update" style="display:none;"/>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
	<script>
	$(".plusIcon").click(function () { //버튼 클릭했을때 추가 하는 부분
		  $(".excercise-tb").append('<tr><td><dl><dt>운동종목</dt><dd><input type="text" id="eName" name="eName"/></dd></dl></td><td><dl><dt>횟수</dt><dd><input type="number" id="count" name="count" min="0"/></dd></dl></td><td><dl><dt>세트</dt><dd><input type="number" id="set" name="set" min="0"/></dd></dl></td><td><dl><dt>메모</dt><dd><input type="text" id="memo" name="memo"/></dd></dl></td><td><img style="margin-top:12px;" class="minus" src="resource/photo/trainer/minus.png"><input type="text" name="exNum" value="0" style="display:none;"/></td></tr>');
	});
 	$(document).on('click',".minus",function () {
		$(this).parent().parent().remove();
	});
	function remove(delNum,ele){
		$.ajax({
			url:"delExcontent.do",
			data:{exNum:delNum},
			success:function(data){
				// 1,2번 방법
				// if(data == "true"){
				// 3번 방법
				if(data.isUsable == true){
					$(ele).parent().parent().remove();
				}else{
					alert("삭제가 안됨");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
		$(ele).parent().parent().remove();
	}
	function validate(){ //제출하기전에 유효성 체크
		if($("input:checkbox[name='exPart']:checked").length<1){
			alert("운동부위 적어도 한개 이상은 입력하세요.");
			$("input:checkbox[name='exPart']").focus();
			return false;
		}
		var nameSize = $("input[name='eName']").length; //어처피 하나만 있으면 다 알수있으니까 이거 하나만 하자
		for(var i = 1;i<=nameSize;i++){ //해당 name들을 다 접근 하기 위해
			if($("input[name = 'eName']").eq(i-1).val() == ""){
				alert("운동종목 적어도 한개 이상은 입력하세요");
				$("input[name = 'eName']").eq(i-1).focus();
				return false;
			}
			if($("input[name= 'count']").eq(i-1).val() < 1){
				alert("횟수 한개 이상은 입력하세요");
				$("input[name= 'count']").eq(i-1).focus();
				return false;
			}
			if($("input[name='set']").eq(i-1).val() < 1 ){
				alert("세트 적어도 한개 이상은 입력하세요");
				$("input[name='set']").eq(i-1).focus()
				return false;
			}
			if($("input[name='memo']").eq(i-1).val() == ""){
				alert("메모를 입력하세요");
				$("input[name='memo']").eq(i-1).focus();
				return false;
			} 
		}
		
		if($("input:checkbox[name='confirm']:checked").length<1){
			alert("회원의 동의를 구해야만 진행할수 있습니다.");
			$("input:checkbox[name='confirm']").focus();
			return false;
		}
		if($("#ta").val()==""){
			alert("오늘의 한줄 평을 입력하세요");
			$("#ta").focus();
			return false;
		}
		return true;
	}
	
	
	</script>
</body>
</html>