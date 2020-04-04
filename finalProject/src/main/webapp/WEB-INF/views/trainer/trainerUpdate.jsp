<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
body {
	margin: auto;
}

.pageTitle {
	padding-left: 60px;
}

.outer {
	
}
	
.myPage{
	background: #64c8fa;
}
.Div1 {
	border: 1px solid grey;
	width: 800px;
	
	border-radius: 10px;
	box-shadow: 3px 3px 3px 3px grey;
	position: relative;
	margin: auto;
	padding: 20px;
}

.proImgDiv {
	porision:relative;
	width: 300px;
	height: 35%;
	margin: auto;
	padding-top: 20px;
}

.myInfoDiv {
	/* position: absolute;
		top: 200px; */
	border: 1px solid grey;
	width: 80%;
	height: 70%;
	border-radius: 10px;
	
	padding: 20px;
}

.bbbtn {
	position: absolute;
	left: 62%;
	top: 28%;
	/* border-radius: 5px; */
	background: #27a5ff;
	color: white;
	border: 1px solid #27a5ff;
	width: 80px;
	height: 30px;
}

.bbbtn:hover {
	background: #64c8fa !important;
	border: 1px solid #64c8fa !important;
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
	margin-left: 40px;
	font-size: 15px;
	margin: auto;
	border-top:2px solid rgb(39, 165, 255);
	border-bottom:2px solid rgb(39, 165, 255);
	border-left:none;
	border-right:none;
}

.myInfoTable tr {
	height: 35px;
	border: 1px solid lightgrey;
	border-left:none;
	border-right:none;
}

input[type='password'], [type='text'], [type='email'] {
	width: 300px;
	height: 40px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}

.myInfoTable tr td:first-child {
	width: 150px;
	height: 50px;
	background: #f9f9f9;
	font-weight: bold;
	padding-left:10px;
}


.threeBtn{
	border-radius: 0px !important;
	background: #27a5ff !important;
	color: white;
	border: 1px solid #27a5ff !important;
	width: 80px;
	height: 30px;
	font-size:12px !important;
}

.threeBtn:hover {
	background: #64c8fa !important;
	border: 1px solid #64c8fa !important;
}

.outBtn{
	background: rgb(170,57,57) !important;
	border: 1px solid rgb(170, 57, 57) !important;
}
.outBtn:hover{
	background:rgb(200, 70, 70)!important;
	border: 1px solid rgb(200, 70, 70)!important;
	
	
}
/*경력 입력하는 부분*/
#career{
	resize:none;
	width:100%;
	height:150px;
}
span.guide{
      display:none;
      font-size:12px;
      top:12px;
      right:10px;
   }
   
   span.ok {
      color:green;
   }
   
   span.error {
      color:red;
   }
   	.hidden{
	   display:none;
	}
	#show-profile{
		border-radius:50%;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script><!-- jquery 쓰기 위해서 -->
</head>
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
</script>
<body>
	<jsp:include page="../common/trainerNav.jsp" />
	<div class="outer">

		<h2 class="pageTitle">내 정보 수정하기</h2>
		<div class="Div1" align="center">

			<!-- 프사구간 -->
			<div class="proImgDiv" align="center">
				<img id="show-profile" src="resource/profileImage/${ trainerProfile.chName }"
					width="250" height="250">
					<button id="change-profile" class="editBtn bbbtn">사진변경</button>
			</div>
			<!-- 내정보영역 -->
			<div class="myInfoDiv" align="center">
				<p class="subTitle myInfoTxt">my Information</p>
				<br>
				<form  action="trainerUpdate.do" method="post" onsubmit="return validate()" enctype="multipart/form-data">
					<table class="myInfoTable" align="center">
						<tr>
							<td>아이디 :</td>
							<td><input name="trId" type="text" value="${ loginUser.trId }" readonly /></td>
						</tr>
						<tr>
							<td>비밀번호 :</td>
							<td><input name="trPwd" id="pass1" type="password"></td>
							
						</tr>
						<tr>
							<td>비밀번홍 확인 :</td>
							<td><input id="pass2" type="password"/><span id="pwd-error" class="guide error"><br>비밀번호가 맞지 않습니다.</span></td>
						</tr>
						<tr>
							<td>이메일 :</td>
							<td><input name="email" type="email" value="${ loginUser.email }" required></td>
						</tr>
						<tr style="border-bottom: 1px solid rgb(39, 165, 255);">
                     		<td>성별 :</td>
                     		<td>
	                     		&nbsp;
	                     		<input id="gender1" type="radio" value="M" name="gender">남자
	                     		&nbsp;&nbsp;
	                        	<input type="radio" value="F" name="gender">여자
                        	</td>
                  		</tr>
						<tr>
							<td>이름 :</td>
							<td><input name="trName" type="text" value="${ loginUser.trName }" required/></td>
						</tr>						
						<tr>
							<td>핸드폰 번호 :</td>
							<td><input name="phone" type="text" value="${ loginUser.phone }" required/></td>
						</tr>
						<tr>
							<td>경력 :</td>
							<td>
								<textarea name="career" id="career" required>${ loginUser.career }</textarea>
							</td>
						</tr>

					</table>
				<button type="button" class="btn btn-primary threeBtn backToMypageBtn">뒤로가기</button>
				<button class="btn btn-primary threeBtn editBtn" type="submit">수정하기</button>
				<button class="btn btn-primary threeBtn outBtn" type="button">탈퇴하기</button>
				<input type="file" name="profile" class="hidden" id="profile" onchange="loadImg(this)">				
				</form>

			</div>
		</div><!-- Div1끝 -->
	</div><!-- outer 끝 -->
	<br><br>
	<script>
	$(function(){
		$(".backToMypageBtn").click(function(){
			location.href="trainerMyPage.do";
		});
		$("#pass2").on("keyup", function(){
			if($("#pass1").val()!=$("#pass2").val()){
				$("#pwd-error").show();
			}else{
				$("#pwd-error").hide();
			}
		
		});
	});
    function validate(){
        //비밀번호를 안바꿀수도 있을때의 대비를 위해서
        if($("#pass1").val()==""){
        	$("#pass1").val('${loginUser.trPwd}'); //값을 바꾸지 않으면 session에 로그인 되어있는 비밀번호로 값을 넣는다.
        }
		if($(':radio[name="gender"]:checked').length < 1){
   		    alert('성별을 선택해주세요');                        
   		    $("#gender1").focus();
   		    event.preventDefault();
   		}
     }
	</script>
</body>
</html>