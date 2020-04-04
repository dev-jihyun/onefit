<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.6">

<!-- 제이쿼리(부트스트랩보다 위에 있어야 함) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>OneFit</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.4/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- Favicons -->
<!-- <link rel="apple-touch-icon"
   href="/docs/4.4/assets/img/favicons/apple-touch-icon.png"
   sizes="180x180">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png"
   sizes="32x32" type="image/png">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png"
   sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon"
   href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg"
   color="#563d7c">
<link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico"> -->
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Oswald&display=swap"
	rel="stylesheet">

<!--  -->
<meta name="msapplication-config"
	content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


<style>
html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #27a5ff;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: auto;
}

.form-signin .checkbox {
	font-weight: 400;
}

.form-signin .form-control {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.mt-5 mb-3 text-muted {
	color: white;
}

.logo {
	width: 500px;
	height: 250px;
	font-family: 'Oswald', sans-serif;
	margin-left: -30%;
}

.font {
	color: white;
}

.loginBtn {
	color: white;
	margin: 0 0 5px 0;
	border-radius:0px;
	background: rgb(39, 165, 255) !important;
}
.loginBtn:hover {
	background: #64c8fa !important;
	color: white;
	margin: 0 0 5px 0;
	/* background:white !important; */
	/* background: #64c8fa; */
	border: 1px solid white;

}

.enrollBtn{
	color: rgb(39, 165, 255);
	margin: 0 0 5px 0;
	border-radius:0px;
}

.enrollBtn:hover{
	color: rgb(39, 165, 255);
	margin: 0 0 5px 0;
}
.memberTxt{
	font-size: 14px !important;
	font-weight: 200;
	color:white;
}
.radioBtnTr{
	text-align:center;
}
#userId{
	font-size: 13px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
}
#password{
	font-size: 13px;
}
</style>


<!-- Custom styles for this template -->
<!-- <link href="signin.css" rel="stylesheet"> -->
</head>
<body class="text-center">
	<c:if test="${ !empty msg }">
		<script>
			alert('${msg}');
		</script>
		<c:remove var="msg" />
	</c:if>

	<!-- 로그인 창 화면 입니다. -->
	<form class="form-signin" action="home.do" method="post"
		onsubmit="return checkAll()">
		<p class="logo" style="color: white; font-size: 11rem;">OneFit</p>
		<br> <br> <label for="inputEmail" class="sr-only"></label>
		<table>
			<tr class="radioBtnTr">
				<td>
					<label class="box-radio-input">
						<input class="font" type="radio" id="choose1" name="choose" value="1" checked>
						<span class="memberTxt"> 회원</span>
					</label>
				</td>
				<td>
					<label class="box-radio-input">
						<input class="font" type="radio" name="choose" value="2">
						<span class="memberTxt"> 트레이너</span>
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="userId" id="userId"
					class="form-control" placeholder="아이디" required autofocus>
				</td>
			</tr>
			<tr>
				<td colspan="2"><label for="inputPassword" class="sr-only"></label>
					<input type="password" name="password" id="password"
					class="form-control" placeholder="비밀번호" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-light font loginBtn"
						style="width: 300px">로그인</button>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="location='enrollView.do'" class="btn btn-light enrollBtn" style="width: 300px;">
						회원가입
					</button>
				</td>
			</tr>
		</table>
		<br>

	</form>
	<script>
   		function checkAll(){
   			if($(':radio[name="choose"]:checked').length < 1){
   			    alert('위에 버튼을 선택해주세요');                        
   			    $("#choose1").focus();
   			    event.preventDefault();
   			}
   		}
   </script>
</body>
</html>