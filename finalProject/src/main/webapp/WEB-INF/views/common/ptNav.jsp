<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<!-- 채팅 API -->
<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5e3cf140298c395d1ce6a646/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->




<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">

<!--	메뉴바는 어느 페이지든 포함하고 있을테니 여기에서 contextPath변수 선언 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

<!-- 부트스트랩 & 제이쿼리 - 부트스트랩 컴포넌트마다 버전이 다른게 맞을 수도 있음,,,,,아래꺼는 재찬쓰꺼 쌔빔-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
  integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
  integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
  integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
<style>
html{
	height:100%;
}

*{
	box-sizing: border-box;
}

body {
	font-family: "Lato", sans-serif;
	padding-left:240px; /*네비바와 분리하기 위해서*/
	height:90%;
}

.sidenav {
	height: 100%;
	width: 240px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #27a5ff;
	overflow-x: hidden;
	padding-top: 0;
	
}

.sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 1.2rem;
	color: #FFFFFF;
	display: block;
	margin-left:20%;
	font-family: 'Noto Sans KR', sans-serif;

}

.sidenav a:hover {
	/* background-color: #64c8fa; */
}

.sidenav a:first-child{
	
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
/*--------------아이콘------------------------*/
.icon{
	float:left;
	width:35px;
	height:35px;
	margin-left:8%;
	margin-top:2%;
}
/*-------------프로필--------------------------*/
.profile-wrapper{
	width:100%;
	height:15%;
	/* background: green; */
}
.profile-img{
	width:40%;
	height:100%;
}
.profile{
	position:relative;
	top:37px;
	left:20px;
	width:80px;
	height:80px;
	border-radius:50%;
}
.name-area{
	width:50%;
	height:40%;
	position:relative;
	padding-right:15%;
	padding-top:18%;
}
.name{
	font-size:1.8rem;
	color:white;
	font-family: 'Nanum Gothic', sans-serif;
}
.job{
	color:white;
	font-size:0.9rem;
	font-family: 'Nanum Gothic', sans-serif;
}
/*-------------로고---------------------------*/
.logo-area{
	width:100%;
	height:auto;
}
.logo{
	margin-left:20%;
	margin-top:10%;
	width:60%;
	height:50%;
}
/*---------------메뉴--------------------------*/
.menu-area{
	width:100%;
	height:45%;
	margin-top:10%;
}
dl{
margin:0;
}
.menu-wrapper{
	height:auto;
	width:100%;
	padding-left:2%;
	padding:2%;
	transition-duration:0.3s;
}
.menu-wrapper:hover{
	color: #f1f1f1;
	background-color: #64c8fa;	
}
/*-------------float 들------------------------*/
.float-left{
	float:left;
}
.float-right{
	float:right;
}
/*------------버튼-------------------------------*/
.button {
  background-color: #1488E8; /* Green */
  width:85%;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  margin-left:7%;
  font-family: 'Nanum Gothic', sans-serif;
  margin-top:12%;
}
.button2:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}
</style>
</head>
<body>
<c:if test="${ !empty msg }">
	<script>
	alert("${msg}");
	</script>
<c:remove var="msg"/>
</c:if>
	<div class="sidenav">
			<div class="logo-area">
				<img class="logo" src="resource/photo/logo/logo.png">
			</div>
		<div class="profile-wrapper">
			<div class="profile-img float-left">
			<!-- 프로필 사진은 회원가입할때 무조건 받기때문에 없을리가 없음 -->
				<img  class="profile" src="${ contextPath }/resource/profileImage/${ loginUser.chName }">
			</div>
			<div class="name-area float-right">
				<dl>
					<dt class="name float-right">
					${ loginUser.userName }
					</dt>
					<dd class="job float-right">
					P.T member
					</dd>
				</dl>
			</div>
		</div>
		<br style="clear:both;">
		<div class="menu-area">
			<div class="menu-wrapper myPage">
				<dl>
					<dt>
						<img class="icon" src="resource/photo/trainer/user.png"/>
					</dt>
					<dd>
						<a class="menuTab" href="usermypage.do">my page</a> 
					</dd>
				</dl>
			</div>
			<div class="menu-wrapper schedule">
				<dl>
					<dt>
						<img class="icon" src="resource/photo/trainer/alarm-clock.png"/>
					</dt>
					<dd>
						<a class="menuTab" href="ptScheduleList.do">P.T 일정</a>
					</dd>	
				</dl>
			</div>
			<div class="menu-wrapper food">
				<dl>
					<dt>
						<img class="icon" src="resource/photo/trainer/diet.png"/>
					</dt>
					<dd>				
						<a class="menuTab" href="ptFoodList.do">식단관리</a>
					</dd>
				</dl>
			</div>
			
			<div class="menu-wrapper exercise">
				<dl>
					<dt>
						<img class="icon" src="resource/photo/ptMember/exerciesRecord_icon.png"/>
					</dt>
					<dd>
						<a class="menuTab" href="elist.do">운동일지</a>
					</dd>
				</dl>
			</div>
			
			<div class="menu-wrapper buy">
				<dl>
					<dt>
						<img class="icon" src="resource/photo/ptMember/buy_icon.png"/>
					</dt>
					<dd>
						<a class="menuTab" href="pay.do">결제</a>
					</dd>
				</dl>
			</div>
			<div class="menu-wrapper csCenter">
				<dl>
					<dt>
						<img class="icon" src="resource/photo/trainer/question.png"/>
					</dt>
					<dd>					
						<a class="menuTab" href="nlist.do">고객센터</a>
					</dd>
				</dl>
			</div>
			<c:url var="logout" value="logout.do"/>
			<button class="button button2" onclick="location.href='${ logout }'">로그아웃</button>
		</div>
	</div>
	
	<script>
	$(function(){
		$("img.logo").click(function(){
			location="usermypage.do";	
		}).mouseenter(function(){
			$(this).css("cursor","pointer");	
		});
		
	});
	
	</script>
</body>
</html>

