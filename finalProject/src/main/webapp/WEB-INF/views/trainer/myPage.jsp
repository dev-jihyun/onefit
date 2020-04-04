<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 마이페이지</title>
<!-- jstl -->
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<!-- 부트스트랩 -->

<!--  -->

<style>
#profile {
	border-radius: 50%;
}

body {
	margin: auto;
	background: rgb(240, 240, 240) !important;
}

.pageName {
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
	margin: 0;
	font-weight: bolder;
	text-align: center;
	color: rgb(0, 0, 0);
	/* text-shadow: 2px 2px 2px gray; */
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
	width: 900px;
	height: 750px;
	position: relative;
	margin: auto;
	background: white;
	padding: 50px 25px;
	margin: 60px auto;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	border-radius: 5px;
}

.Div1:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.proImgDiv {
	width: 300px;
	height: 300px;
	margin: auto;
	padding-top: 20px;
}

.myInfoDiv {
	/* position: absolute;
		top: 200px; */
	/* border: 1px solid grey; */
	/* 		border-top: 1px solid grey;
		border-bottom: 1px solid grey;		 */
	width: 50%;
	height: 350px;
	float: left;
	padding: 30px;
	border-right: 1px solid grey;
}
/*-----건강정보 부분----*/
.myHealth {
	/* position: absolute;
		top: 200px; */
	position: relative;
	border: 1px solid grey;
	width: 50%;
	height: 85%;
	border-radius: 10px;
	float: left;
	padding: 20px;
}

/*---------*/
.exerciseDiv {
	/* position: absolute;
		top: 200px;
		left: 300px; */
	/* border: 1px solid grey; */
	width: 50%;
	height: 350px;
	float: left;
	padding: 30px;
}
/*----------------건강정보 없을때 보여줄 화면---------------------*/
.noHealth {
	position: absolute;
	width: 100%;
	height: 100%;
	background: #E6E6E6;
	border-radius: 10px;
	top: 0;
	opacity: 0.5;
	left: 0px;
}

.insert-health {
	position: absolute;
	background: #27a5ff;
	color: white;
	border: 1px solid #27a5ff;
	width: 150px !important;
	height: 30px;
	top: 50%;
	left: 40%;
	z-index: 1;
}

.bbbtn:hover {
	background: #64c8fa;
	border: 1px solid #64c8fa;
}

.insert-health:hover {
	background: #64c8fa;
	border: 1px solid #64c8fa;
}

/*------------------------------비만도 부분----------------------*/
.bmi {
	/* position: absolute;
		top: 200px;
		left: 300px; */
	width: 50%;
	height: 350px;
	float: left;
	padding: 20px;
}

.bmi-img {
	width: 100%;
	height: 250px;
}

.selected {
	position: absolute;
	top: 36%;
	/*1. left:52%;*/
	/*2. left:58.5%;*/
	/*3. left:65%;*/
	/*4. left:71.5%;*/
	/*5.left:79%;*/
	/*6. left:86.5%;*/
	border: 5px solid #27a5ff;
	height: 280px;
	width: 7.5%;
	/*6. width:10%;*/
	/*5. width:8%;*/
	border-radius: 5%;
}
/*----------------*/
.bbbtn {
	position: absolute;
	left: 780px;
	top: 30px;
	/* border-radius: 5px; */
	background: #27a5ff;
	color: white;
	border: 1px solid #27a5ff;
	width: 80px;
	height: 30px;
	top: 30px;
}

.bbbtn:hover {
	background: #64c8fa;
	border: 1px solid #64c8fa;
}

.insert-health {
	background: #27a5ff;
	color: white;
	border: 1px solid #27a5ff;
	width: 120px;
	height: 30px;
}

.insert-health:hover {
	background: #64c8fa;
	border: 1px solid #64c8fa;
}

.subTitle {
	color: #27a5ff;
	font-weight: bold;
	font-size: 20px;
	text-align: left;
	/* padding-left: 20px; */
}

.membership {
	background: rgb(26, 188, 156);
	border-radius: 10px;
	font-size: 14px;
	color: white;
	display: inline-block;
	width: 80px;
	height: 20px;
	text-align: center;
}

.myInfoTable {
	font-size: 13px;
	border-top: 2px solid rgb(39, 165, 255) !important;
	border-bottom: 1px solid rgb(39, 165, 255) !important;
}

.myInfoTable tr {
	height: 40px;
}

.myInfoTable th {
	background: #f9f9f9;
	padding-left: 20px !important;
	width: 150px;
	vertical-align: middle !important;
}

.myInfoTable td {
	padding-left: 20px !important;
	vertical-align: middle !important;
}

.Div2:after, .Div2:before {
	background: #e6e6e6;
	content: '';
	height: 50px;
	position: absolute;
	top: -25px;
	width: 100px;
	box-shadow: 0 5px 10px -7px hsla(0, 0%, 0%, 0.5);
}

.Div2:after {
	left: -50px;
	transform: rotate(-45deg);
}

.Div2:before {
	right: -50px;
	transform: rotate(45deg);
}

.Div2 {
	border: 1px solid lightgrey;
	width: 900px;
	height: 550px;
	position: relative;
	margin: auto;
	background: white;
	padding: 20px 25px;
	margin: 30px auto;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	border-radius: 5px;
}

.Div2:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.myPage {
	background: #64c8fa;
}

.bodyTxt {
	padding-left: 20px;
}

/* 모달창 */
.modal-title {
	font-weight: bold;
	text-align: center !important;
	width: 100%;
	padding-top: 7px;
	vertical-align: middle;
	float: left !important;
}

.modal_close {
	line-height: 1 !important;
	margin: 0 !important;
	float: right !important;
	display: inline-block !important;
	padding: 5px !important;
}

.modal-header {
	float: left;
}

.modal_table tr {
	height: 40px;
}

.modal_select_btn {
	text-align: center !important;;
	border-radius: 0 !important;
	background: #27a5ff !important;
	color: white !important;
	border: 1px solid #27a5ff !important;
	width: 80px !important;
	height: 30px !important;
	line-height: 0 !important;
}

.modal_health_div input[type=text] {
	width: 40px;
}

.modal-content {
	width: 800px !important;
}

/* ////건강정보 모달창//// */
.modal_health_div {
	width: 100%;
	height: 200px;
	padding-top: 10px;
	/* border: 1px solid #27a5ff !important; */
}

.health_modal_content {
	width: 300px !important;
}

.modalHealthTable {
	width: 200px;
	border-top: 2px solid rgb(29, 165, 255);
	border-bottom: 1px solid rgb(29, 165, 255);
}

.modal_health_div input[type=text] {
	width: 40px;
}

.modalHealthTable th {
	background: #f9f9f9;
	padding-left: 20px !important;
}


/*----------수업일정 테이블------------*/
/* 스크롤바 색 */
/* Customize website's scrollbar like Mac OS
Not supports in Firefox and IE */

/* total width */
#todayClass::-webkit-scrollbar {
	background-color: #fff;
	width: 16px;
}

/* background of the scrollbar except button or resizer */
#todayClass::-webkit-scrollbar-track {
	background-color: #fff
}

/* scrollbar itself */
#todayClass::-webkit-scrollbar-thumb {
	background-color: #babac0;
	border-radius: 16px;
	border: 4px solid #fff
}

}
/* set button(top and bottom of the scrollbar) */
#todayClass::-webkit-scrollbar-button {
	display: none
}

td {
	text-align: center;
}

.hidden {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../common/trainerNav.jsp" />
	<c:if test="${ !empty msg }">
		<script>
			alert('${msg}');
		</script>
		<c:remove var="msg" />
	</c:if>
	<div class="outer">

		<div class="pageName">
			<p>My Page</p>
		</div>
		<div class="Div1" align="center">

			<!-- 프사구간 -->
			<div class="proImgDiv" align="center">
				<img id="profile"
					src="resource/profileImage/${ trainerProfile.chName }" width="250"
					height="250">
			</div>
			<button class="editBtn bbbtn" style="width: 110px;">정보수정</button>

			<!-- 내정보영역 -->
			<div class="myInfoDiv">
				<p class="subTitle myInfoTxt">my Information</p>
				<br>
				<table class="myInfoTable table table-sm" align="left">
					<tr>
						<th>아이디 :</th>
						<td>${ loginUser.trId }</td>
					</tr>
					<tr>
						<th>이름 :</th>
						<td>${ loginUser.trName }</td>
					</tr>
					<tr>
						<th>핸드폰 :</th>
						<td>${ loginUser.phone }</td>
					</tr>
				</table>
				<br> <br>
			</div>

			<!-- 수업시간 영역 -->
			<div id="todayClass" class="exerciseDiv">
				<p class="subTitle exerTxt" style="margin: 0;">금일 수업</p>
				<br>
				<table id="todayClass table table-sm" class="table" style="font-size:13px;">
					<thead class="thead-dark">
						<tr>
							<th scope="col">회원번호</th>
							<th scope="col">회원명</th>
							<th scope="col">수업시간</th>
							<th scope="col">전화번호</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ trainerInforms['tl'] != 'nothing' }">
								<c:forEach var="member" items="${ trainerInforms['tl'] }"
									varStatus="status">
									<tr>
										<th scope="row">${ member.getUserNum() }</th>
										<td>${ member.getUserName() }</td>
										<td>${ member.getScStartString() }~${ member.getScEndtString() }</td>
										<td>${ member.getPhone() }</td>
									<tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">수업 없음</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<br> <br>
			</div>
			<script>
		</script>

		</div>
		<!-- Div1끝 -->


		<br> <br>


		<!-- 내몸정보영역 전체 -->
		<div class="Div2">
			<p class="subTitle bodyTxt">My Body</p>
			<p class="bodyTxt" style="font-size: 12px;">
				BMI를 통해 내 몸 정보를 확인하세요.<br> *BMI(body mass index):신체질량지수.
				신체질량지수란 신장과 체중의 비율을 사용한 체중의 객관적인 지수로 일반적인 사람의 체지방량과 상관관계가 크다.
			</p>
			<!-- 내몸정보(키몸무게등) -->
			<div class="myInfoDiv">
				<p class="subTitle bodyTxt" style="color: black; font-size: 16px;">나의
					몸상태</p>

				<c:choose>
					<c:when test="${ trainerInforms['th'] != 'nothing' }">
						<!-- 트레이너 Health 정보가 비어있지 않을때 -->
						<button class="bodyEditBtn bbbtn">정보수정</button>
						<table class="myInfoTable table table-sm" align="left">
							<tr>
								<th>키 :</th>
								<td>${ trainerInforms['th'].getHeight()}cm</td>
							</tr>
							<tr>
								<th>몸무게 :</th>
								<td>${ trainerInforms['th'].getWeight()}kg</td>
							</tr>
							<tr>
								<th>체지방 지수 :</th>
								<td>${ trainerInforms['th'].getFat()}%</td>
							</tr>
							<tr>
								<th>마지막 체크 :</th>
								<td>
								<fmt:formatDate value="${ trainerInforms['th'].getCheckDate()}"
								pattern="yyyy-MM-dd" />
								</td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<div class="noHealth"></div>
						<button class="insert-health" type="button">건강 정보 입력</button>
					</c:otherwise>
				</c:choose>
			</div>
			<!--  -->

			<!-- BMI정도 -->
			<div class="bmi">
				<p class="subTitle exerTxt" style="color: black; font-size: 16px;">현재
					BMI</p>
				<br>
				<div style="display: inline-block; width: 300">
					<img class="bmi-img"
						src="${ contextPath }/resource/photo/user/비만도.jpg">
				</div>
				<c:choose>
					<c:when test="${ trainerInforms['th'] != 'nothing' }">
						<!-- 건강정보가 비어있지 않을때 -->
						<div id="selected" class="selected"></div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
			<script>			
			window.onload = function(){
				
				var selected = document.getElementById('selected');
				<c:if test="${ trainerInforms['th'] != 'nothing' }">
					var bmi = ${trainerInforms['th'].getWeight()}/${trainerInforms['th'].getHeight()}/${trainerInforms['th'].getHeight()}*10000;
					console.log(bmi);
					if(bmi<18){
						selected.style.left="52%";
					}else if(bmi>=18 && bmi<23){
						selected.style.left="58.5%";
					}else if(bmi>=23 && bmi<27){
						selected.style.left="65%";
					}else if(bmi>=27 && bmi<32){
						selected.style.left="71.5%";
					}else if(bmi>=32 && bmi<37){
						selected.style.left="79%";
						selected.style.width="8%";
					}else{
						selected.style.left="86.5%";
						selected.style.width="10%";
					}	
				</c:if>
			}
		</script>

		</div>
		<!-- Div2끝 -->

	</div>
	<!-- outer끝 -->



	<!-- /////////////////////////////////비번확인용 Modal//////////////////////////////////// -->
	<div class="modal fade ttt" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="false">
		<div class="modal-dialog modal-dialog-centered" style="width: 300px"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" id="exampleModalCenterTitle">비밀번호 재확인</p>
					<button type="button" class="close modal_close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="orderList_div">
						<p align="center">
							회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.<br> <br>
							비밀번호를 입력하면 정보수정 페이지로 이동합니다.
						</p>
						<table border="1" align="center"
							class="table table-sm chk_modal_table">
							<tr>
								<th class="cols1">아이디</th>
								<td>${ loginUser.trId }</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" class="modal_pwdChk"
									style="text-align: center;"></td>
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
	$(".editBtn").click(function(){
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
	$(".modal_close").click(function(){
		// 모달 창을 닫으면 모달 안에 있는 데이터 모두 초기화해야함
		$(".ttt").modal("hide");
	});
	
	$(".modal_select_btn").click(function(){
		var pwdChk = $(".modal_pwdChk").val();
		/* ********1. 확인버튼 누르면 인풋창에 비번 쳤는지부터 확인(유효성검사) */
		if(pwdChk == ""){ //비밀번호를 입력하지 않았을때
			alert("비밀번호를 입력해주세요.");
		}else{
			//원래는 비밀번호를 입력받을때 암호화를 하지만 아직 암호화를 하지 않았으므로 그냥이대로 간다.
			var pwd = '<c:out value="${loginUser.trPwd}"/>';
			if(pwd == pwdChk){
				location.href="trainerUpdateForm.do"
			}
		}
	});
	

});
	
	
	
</script>

	<!-- /////////////////////////////////건강정보 Modal//////////////////////////////////// -->
	<div class="modal fade ggg" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="false">
		<div class="modal-dialog modal-dialog-centered" style="width: 300px"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<c:choose>
						<c:when test="${ trainerInforms['th'] != 'nothing' }">
							<!-- 트레이너 건강정보가 비어있지 않을때 -->
							<p class="modal-title" id="exampleModalCenterTitle">건강정보 수정</p>
						</c:when>
						<c:otherwise>
							<p class="modal-title" id="exampleModalCenterTitle">건강정보 입력</p>
						</c:otherwise>
					</c:choose>
					<button type="button" class="close modal_close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body health_modal_content">
					<div class="modal_health_div">
						<form method="post" onsubmit="return validate()"
							action="trainerHealthInform.do">
							<table align="center" class="table table-sm modalHealthTable">
								<c:choose>
									<c:when test="${ trainerInforms['th'] != 'nothing' }">
										<!-- 트레이너 건강정보 테이블이 비어있지 않을때 -->
										<tr>
											<th>몸무게</th>
											<td><input id="weight" name="weight" type="text"
												class="weight" value="${ trainerInforms['th'].weight }">kg</td>
										</tr>
										<tr>
											<th>키</th>
											<td><input id="height" name="height" type="text"
												class="height" value="${ trainerInforms['th'].height }">cm</td>
										</tr>
										<tr>
											<th>체지방</th>
											<td><input id="fat" name="fat" type="text" class="fat"
												value="${ trainerInforms['th'].fat }">%</td>
											
										</tr>
										<input type="text" name="type" class="hidden"
												value="update" />
									</c:when>
									<c:otherwise>
										<tr>
											<th>몸무게</th>
											<td><input id="weight" name="weight" type="text"
												class="weight">kg</td>
										</tr>
										<tr>
											<th>키</th>
											<td><input id="height" name="height" type="text"
												class="height">cm</td>
										</tr>
										<tr>
											<th>체지방</th>
											<td><input id="fat" name="fat" type="text" class="fat">%</td>
											<td><input type="text" name="type" class="hidden"
												value="insert" /></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>

							<div class="modal-footer">
								<!-- <button type="button" class="btn btn-secondary modal_close" data-dismiss="modal">Close</button> -->
								<button type="submit"
									class="btn btn-primary modal_health_select_btn">확인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
$(function(){
	$(".bodyEditBtn").click(function(){
		$(".ggg").modal("show");
	});
	$(".insert-health").click(function(){
		$(".ggg").modal("show");
	})
	$(".modal_health_select_btn").click(function(){
		//1. 빈칸 유효성검사
		//2. 디비 저장.
		//3. 모달닫기/
	});
});

function validate(){
	if($("#weight").val()==""){
		alert("체중을 입력해주세요.");
		$("#weight").focus();
		return false;
	}
	if($("#height").val()==""){
		alert("키를 입력해주세요.");
		$("#height").focus();
		return false;
	}
	if($("#fat").val()==""){
		alert("체지방을 입력해주세요.");
		$("#fat").focus();
		return false;
	}
	return true;
}

</script>


	<br>
	<br>
</body>

</html>