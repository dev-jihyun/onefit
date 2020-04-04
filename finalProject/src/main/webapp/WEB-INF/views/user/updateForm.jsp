<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
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

.myPage {
	background: #64c8fa;
}

.Div1 {
	border: 1px solid lightgrey;
	width: 900px;
	/* height: 750px; */
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
	height: 350px;
	margin: auto;
	padding-top: 20px;
	/*    border: 1px solid black; */
}

.myInfoDiv {
	/* position: absolute;
      top: 200px; */
	/* border: 1px solid grey; */
	width: 80%;
	height: 70%;
	border-radius: 10px;
	padding: 20px;
}

.bbbtn {
	position: absolute;
	left: 400px;
	top: 420px;
	/* border-radius: 5px; */
	background: #27a5ff;
	color: white;
	border: 1px solid #27a5ff;
	width: 80px;
	height: 30px;
	margin: 5px;
}

.bbbtn:hover {
	background: #64c8fa !important;
	border: 1px solid #64c8fa !important;
}

.subTitle {
	color: #27a5ff;
	font-weight: bold;
	text-align: center;
	margin: 0;
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
	margin-left: 40px;
	font-size: 15px;
	margin: auto;
	/* border-top: none !important; */
	border-bottom: 2px solid rgb(39, 165, 255);
	border-left: none;
	border-right: none;
}

.colsLine {
	border-top: 2px solid rgb(39, 165, 255) !important;
}

.profileTr {
	height: 350px !important;
	border-top: none !important;
	background: white !important;
}

.myInfoTable tr {
	height: 35px;
	border: 1px solid lightgrey;
	border-left: none;
	border-right: none;
}

input[type='password'], [type='text'], [type='email'], [type='tel'] {
	width: 300px;
	height: 40px;
	border: 1px solid lightgrey;
	border-radius: 3px;
	padding-left: 10px;
}

input[name='userId'], [name='email'], [name="birth"] {
	background: lightgrey;
}

.myInfoTable th:first-child {
	width: 150px;
	height: 50px;
	background: #f9f9f9;
	font-weight: bold;
	padding-left: 10px;
}

.threeBtn {
	border-radius: 0px !important;
	background: #27a5ff !important;
	color: white;
	border: 1px solid #27a5ff !important;
	width: 80px;
	height: 30px;
	font-size: 12px !important;
}

.threeBtn:hover {
	background: #64c8fa !important;
	border: 1px solid #64c8fa !important;
}

.outBtn {
	background: rgb(170, 57, 57) !important;
	border: 1px solid rgb(170, 57, 57) !important;
}

.outBtn:hover {
	background: rgb(200, 70, 70) !important;
	border: 1px solid rgb(200, 70, 70) !important;
}

.image-wrapper {
	height: 20vh;
	position: relative;
	margin-bottom: 20px;
}

.hidden {
	display: none;
}
/*    #change-profile{
      width:50px;
      height:50px;
      cursor:pointer;
      position:absolute;
      top:140px;
      right:70px;
   } */
#show-profile {
	/*       position:absolute; */
	/*       height:180px;
      width:180px; */
	border-radius: 50%;
	/*       left:50px; */
}
</style>
</head>
<body>
	<jsp:include page="../common/userNav.jsp" />
	<div class="outer">

		<div class="pageName"><p>내 정보 수정하기</p></div>
		<div class="Div1" align="center">




			<!-- 내정보영역 -->
			<div class="myInfoDiv" align="center">
				<p class="subTitle myInfoTxt">my Information</p>
				<br>
				<form action="userUpdate.do" method="post"
					enctype="multipart/form-data">
					<!-- 아이디 가져가기위해 히든으로 처리. -->
					<input type="hidden" name="userNum" value="${ loginUser.userNum }">

					<table class="myInfoTable" align="center">
						<tr class="profileTr">
							<td colspan="2">
								<!-- 프사구간 -->
								<div class="proImgDiv" align="center">
									<img id="show-profile"
										src="${ contextPath }/resource/profileImage/${ loginUser.chName }"
										width="250" height="250">
									<!-- 사진 변경 버튼  -->
								</div>
								<button type="button" class="chgImgBtn bbbtn"
									id="change-profile">사진변경</button>
							</td>
						</tr>
						<tr class="colsLine">
							<th>아이디 :</th>
							<td><input type="text" name="userId"
								value="${ loginUser.userId }" readonly></td>
						</tr>
						<tr>
							<th>비밀번호 :</th>
							<td><input type="password" name="userPwd"
								placeholder="비밀번호 바꿀때만 쓰세요"></td>
						</tr>
						<tr>
							<th>이름 :</th>
							<td><input type="text" name="userName"
								value="${ loginUser.userName }" required></td>
						</tr>
						<tr>
							<th>이메일 :</th>
							<td><p>한번 인증한 메일은 변경할 수 없습니다.</p> <input type="email"
								value="${ loginUser.email }" name="email" readonly></td>
						</tr>
						<tr>
							<th>핸드폰 번호 :</th>
							<td><input type="tel" value="${ loginUser.phone }"
								name="phone"></td>
						</tr>
						<tr>
							<th>생년월일 :</th>
							<td><input type="text"
								value="<fmt:formatDate value="${ loginUser.birthDate }" pattern="yyyy-MM-dd"/>"
								name="birth" readonly></td>
						</tr>
						<tr style="border-bottom: 1px solid rgb(39, 165, 255);">
							<th>성별 :</th>
							<td>&nbsp;<input type="radio" value="M" name="gender"
								checked>남자&nbsp;&nbsp; <input type="radio" value="F"
								name="gender">여자
							</td>
						</tr>
						<tr>

						</tr>

					</table>
					<button class="btn btn-primary threeBtn backToMypageBtn"
						type="button">뒤로가기</button>

					<c:url var="usermypage" value="usermypage.do">
						<c:param name="userNum" value="${ loginUser.userNum }" />
					</c:url>
					<button class="btn btn-primary threeBtn editBtn" type="submit">수정하기</button>
					<button class="btn btn-primary threeBtn outBtn" type="button">탈퇴하기</button>
					<!-- 프로필 부분 -->
					<input type="file" name="profile" class="hidden" id="profile"
						onchange="loadImg(this)">
				</form>

			</div>
		</div>
		<!-- Div1끝 -->
	</div>
	<!-- outer 끝 -->
	<br>
	<br>
	<script>
	
	$(function(){ //프로필 이미지 부분 누르면
	    $("#change-profile").click(function(e){
	       $("#profile").click(); //input type="file" 누르기
	    });
	 });
	
	function loadImg(value){  
		  //value => input type="file";
		  //num => 조건문을 통해 미리보기 div 지정
		  
		  //file이 존재하는지 조건문
		  if(value.files && value.files[0]){
		     //파일을읽오들일 FileReader 객체 생성
		     var reader = new FileReader();
		     
		     //파일 읽기가 완료 되었을때 실행되는 메소드 설정
		     reader.onload = function(e){  
				$("#show-profile").attr("src",e.target.result);//src에다가 읽어온 값 넣는다
		     }   
		     //파일 읽기 하는 메소드
		     reader.readAsDataURL(value.files[0]);
		  }
		}
	
	$(function(){
		// 뒤로가기
	$(".backToMypageBtn").click(function(){  
			<c:url var="usermypage" value="usermypage.do">
				<c:param name="userNum" value="${ loginUser.userNum }"/>
			</c:url>
			location="${ usermypage }";	
		});		
		// 탈퇴하기
		$(".outBtn").click(function(){
			<c:url var="udelete" value="udelete.do">
				<c:param name="userNum" value="${ loginUser.userNum }"/>			
			</c:url>
			location="${ udelete }";
			
		});
	});
	
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>