<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<title>Insert title here</title>
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
/* 	.outer{
		display:inline-block;
		width: 1100px;
		height: auto;
		margin: 100px; 
		background: white;
	 	margin: 30px auto;
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
		transition: 0.3s;
		border-radius: 5px;
	} */
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
}

.bbbtn:hover {
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
	/* border:1px solid black !important; */
	text-align: center !important;
	width: 100%;
	padding-top: 7px;
	vertical-align: middle;
	float: left !important;
}

.modal_close {
	line-height: 1 !important;
	margin: 0 !important;
	/* border:1px solid black !important; */
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

.modal-content {
	width: 800px !important;
}

/* ////건강정보 모달창//// */
.modal_health_div {
	width: 100%;
	height: 100px;
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

/*//////비밀번호 확인 모달창///////*/
.chk_modal_table {
	width: 350px !important;
	border-top: 2px solid rgb(29, 165, 255);
	border-bottom: 1px solid rgb(29, 165, 255);
}

.chk_modal_table th {
	padding-left: 20px !important;
	background: #f9f9f9;
	width: 100px;
}

.modal_health_select_btn{
	text-align: center !important;;
	border-radius: 0 !important;
	background: #27a5ff !important;
	color: white !important;
	border: 1px solid #27a5ff !important;
	width: 80px !important;
	height: 30px !important;
	line-height: 0 !important;
}
</style>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			alert('${msg}');
		</script>
		<c:remove var="msg" />
	</c:if>
	<jsp:include page="../common/ptNav.jsp" />
	<div class="outer">
		<div class="pageName">
			<p>My Page</p>
		</div>
		<div class="Div1">

			<!-- 프사구간 -->
			<div class="proImgDiv" align="center">
				<!-- 프로필 사진은 회원가입할때 무조건 받기때문에 없을리가 없음 -->
				<img id="profile"
					src="${ contextPath }/resource/profileImage/${ loginUser.chName }"
					width="250" height="250">
			</div>

			<button class="editBtn bbbtn">정보수정</button>

			<!-- 내정보영역 -->
			<div class="myInfoDiv">
				<p class="subTitle myInfoTxt">my Information</p>
				<br>
				<table class="myInfoTable table table-sm">
					<tr>
						<th class="cols1">아이디 :</th>
						<td class="cols2">${ loginUser.userId }</td>
					</tr>
					<tr>
						<th>이름 :</th>
						<td>${ loginUser.userName }</td>
					</tr>
					<tr>
						<th>핸드폰 :</th>
						<td>${ loginUser.phone }</td>
					</tr>
					<tr>
						<th>회원등급 :</th>
						<td><span class="membership">PT회원</span></td>
					</tr>
					<tr>
						<th>생년월일 :</th>
						<td><fmt:formatDate value="${ loginUser.birthDate }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<th>마지막로그인 :</th>
						<td><fmt:formatDate value="${ loginUser.loginDate }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
				<br>
				<br>
			</div>

			<!-- 운동정보영역 -->
			<div class="exerciseDiv">
				<p class="subTitle exerTxt">exercise</p>
				<!-- 		<p>서비스 종료예정입니다. 추가 서비스가 필요하신경우 <a href="#">여기</a>를 눌러주세요.</p> -->
				<br>
				<table class="myInfoTable table table-sm" align="left">
					<tr>
						<th>PT 잔여횟수 :</th>
						<td>${ loginUser.count }회 / ${ loginUser.totalCount } 회</td>
					</tr>
					<tr>
						<th>헬스장 이용기간 :</th>
						<td><span class="membership">PT회원</span></td>
					</tr>
					<tr>
						<th>담당 트레이너 :</th>
						<td>${ loginUser.trName }</td>
					</tr>
					<tr>
						<th>운동목적 :</th>
						<td>${ loginUser.reason }</td>
					</tr>
					<tr>
						<th>목표체중 :</th>
						<td>${ loginUser.goal }</td>
					</tr>
				</table>
				<br>
				<br>
			</div>

		</div>
		<!-- Div1끝 -->


		<br>
		<br>


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
				<button class="bodyEditBtn bbbtn">정보수정</button>
				<table class="myInfoTable table table-sm" align="left">
					<tr>
						<th>키 :</th>
						<td>${ loginUser.height }cm</td>
					</tr>
					<tr>
						<th>몸무게 :</th>
						<td>${ loginUser.weight }kg</td>
					</tr>
					<tr>
						<th>나이 :</th>
						<td>만 ${ loginUser.age }세</td>
					</tr>
					<tr>
						<th>마지막 체크일 :</th>
						<td><fmt:formatDate value="${ loginUser.checkDate }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<th>체지방 지수 :</th>
						<td>${ loginUser.fat }</td>
					</tr>
				</table>

			</div>

			<!-- BMI정도 -->
			<div class="bmi">
				<p class="subTitle exerTxt" style="color: black; font-size: 16px;">현재
					BMI</p>
				<br>
				<div style="display: inline-block; width: 300">
					<img class="bmi-img"
						src="${ contextPath }/resource/photo/user/비만도.jpg">
				</div>
				<div id="selected" class="selected"></div>
			</div>
			<script>			
			window.onload = function(){
				
				var selected = document.getElementById('selected');
				var bmi = ${ loginUser.fat };
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
		<div class="modal-dialog modal-dialog-centered" role="document">
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
							회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.<br>
							<br> 비밀번호를 입력하면 정보수정 페이지로 이동합니다.
						</p>
						<table align="center" class="table table-sm chk_modal_table">
							<tr>
								<th class="cols1">아이디</th>
								<td class="cols2">${ loginUser.userId }</td>
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
	
	/* ********1. 폼제출시 유효성검사 */
	
	$(".modal_select_btn").on("click", function(){
		var pwdChk = $(".modal_pwdChk").val();
	    var userNum = "${ loginUser.userNum }";
			console.log(pwdChk);
	    
 	       $.ajax({
 	    	  url:"checkPwd1.do",
	          data:{
	        	  pwdChk: pwdChk,
	        	  userNum:userNum
	        	  },
	          success:function(data){
	             if(data.isPwdCheck == true){
					// 비번확인완료
	                console.log("성공");
					location = "ptUpdateForm.do";
	             }else{
	           		//비번 불일치
	            	alert("비밀번호가 일치하지 않습니다.");
	             }
	          },
	          error:function(request,status,error){
	        	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          
	        	  console.log("에러");
	        	  
	          }
	       }); 
	    });
});


</script>

	<!-- /////////////////////////////////건강정보 Modal//////////////////////////////////// -->
	<div class="modal fade ggg" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="false">
		<div class="modal-dialog modal-dialog-centered" style="width: 300px;"
			role="document">
			<div class="modal-content health_modal_content">
				<div class="modal-header">
					<p class="modal-title" id="exampleModalCenterTitle">건강정보 수정</p>
					<button type="button" class="close modal_close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body health_modal_content">
					<div class="modal_health_div">
						<form id="healthForm" action="bodyUpdate.do" method="post" onsubmit="return validate();">
							<input type="hidden" name="userNum" value="${loginUser.userNum }">

							<table align="center" class="table table-sm modalHealthTable">

								<tr>
									<th>키</th>
									<td><input type="text" class="height" name="height" id="height"
										placeholder="${ loginUser.height }" required>cm</td>
								</tr>
								<tr>
									<th>몸무게</th>
									<td><input type="text" class="weight" name="weight" id="weight"
										placeholder="${ loginUser.weight }" required>kg</td>
								</tr>								
							</table>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-secondary modal_close" data-dismiss="modal">Close</button> -->
					<button type="submit"
						class="btn btn-primary modal_health_select_btn">확인</button>
				</div>
			</div>
		</div>
	</div>

	<script>
$(function(){
	$(".modal_health_select_btn").click(function(){
		$("#healthForm").submit();
	});
	
	$(".bodyEditBtn").click(function(){
		$(".ggg").modal("show");
	});
	

});
function validate(){
/* 	
	var numReg = /^[0-9]&/;
	var weight = document.getElementById("weight").value;
	var height = document.getElementById("height").value;
	console.log(weight);
	console.log(height);
	console.log(!numReg.test(weight));
	console.log(!numReg.test(height));
	if(!numReg.test(parseInt(weight))){
		alert("숫자만 입력 가능합니다.");
		return false;
	}
	if(!numReg.test(parseInt(height))){
		alert("숫자만 입력 가능합니다.");
		return false;
	} */
};

</script>
	<br>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>