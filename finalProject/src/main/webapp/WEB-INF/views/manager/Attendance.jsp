<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>출결체크</title>
<style>
#backimg {
	width: 100px;
	height: 100px;
}

#backimg:hover {
	cursor: pointer;
}

body {
	background-color: #27a5ff;
	overflow-x:hidden;
	margin: 0px;
}

#back {
	position: absolute;
	top: 20px;
	left: 0px;
}

#logo-wrap {
	width: 270px;
	height: 115px;
	margin: auto;
}

.logo {
	width: 270px;
	height: 115px;
}

#checkid {
	margin: auto;
	margin-top: 200px;
	border: none;
	background-color: white;
	border-radius: 10px;
	width: 500px;
	height: 255px;
	text-align: center;
	color: #27a5ff;
}

h1 {
	padding-top: 20px;
}

.id-pwdbox {
	width: 200px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid lightgray;
}

#btnbox {
	width: 230px;
	height: 75px;
	margin: auto;
	margin-top: 170px;
}

#idbox {
	width: 224px;
}

#check-btn {
	background-color: white;
	width: 230px;
	height: 75px;
	border: none;
	border-radius: 10px;
	box-shadow: 1px 1px 20px 3px lightgray;
}

#check-btn:hover {
	cursor: pointer;
}

button>h1 {
	padding-top: 0px;
	color: #27a5ff;
}

/* 출석 확인 여부*/
@keyframes trans{
	50% {
		display:block;
	}
	100% {
		display:none;
	}
}

#icon-back{
	position: absolute;
	top: 0px;
	bottom: 0px;
	width:100%;
	height: 100%;
	display: none;
}

.show-hide {
	width: 400px;
	height: 400px;
	display: none;
	z-index: 1;
	border-radius: 10px;
	margin: auto;
	margin-top:250px;
}

#passimg {
	background-color: rgba(139, 248, 117, 0.9);
}

#passimg>img {
	width: 90%;
	height: 90%;
	margin: 5%;
}

#failimg {
	background-color: red;
}

#failimg>img {
	width: 90%;
	height: 90%;
	margin: 5%;
}

.modal-back {
	display: none;
	margin-left:0px !important;
	position: absolute;
	top: 0px;
	left: 0xp !important;
	width: 100%;
	height: 2000px;
	background-color: rgba(051, 051, 051, 0.5);
}

.modal-con {
	display: inline-block;
	border-radius: 10px;
	display: none;
	background-color: white;
	margin: auto;
	margin-top: 200px;
	box-shadow: 1px 1px 7px black;
	vertical-align: middle;
	overflow: hidden;
	position: relative;
}
.cancel-btn {
	color: #fff !important;
	background-color: red !important;
	border-color: #0062cc;
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.cancel-btn:hover {
	background-color: #C21400;
	color: #212529;
	text-decoration: none;
	cursor: pointer;
}
#chkPwdTable{
	width: 100%;
	border-top:2px solid rgb(39, 165, 255) !important;
	border-bottom:1px solid rgb(39, 165, 255) !important;
}
</style>
</head>
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<c:url var="mService" value="mService.do" />

	<div id="logo-wrap">
		<img class="logo" src="resource/photo/logo/logo.png">
	</div>
	
	
	
	<div id="checkid">
		<h1>OneFit 헬스장 출석 체크</h1>
		<br>
		<h2>
			아이디 : <input id="idbox" class="id-pwdbox" type="text"
				placeholder="  아이디를 입력해 주세요">
		</h2>
		<h2>
			비밀번호 : <input id="pwdbox" class="id-pwdbox" type="password"
				placeholder="  비밀번호를 입력해 주세요">
		</h2>
	</div>

	<div id="back">
		<img onclick="backpwd()" id="backimg"
			src="${contextPath}/resource/photo/manager/back.png">
	</div>

	<div id=btnbox>
		<button id="check-btn">
			<h1>출석하기</h1>
		</button>
	</div>
	
	<div class="modal-back" id="modal-ndelete-back" style="z-index: 1;">
		<div class="modal-con" id="modal-ndelete-con" style="width:500px; height:185; z-index: 2; margin-top:280px;">
			<div style="width:95%; margin:auto;">
				<h2 style="text-align: center; ">메인으로</h2>
				<table id="chkPwdTable" style="width:100%;">
					<tr style="height:30px; margin-top: 5px;">
						<td colspan="2" style="text-align: center; font-size: 16px; font-size: 16px; font-weight: bolder; ">비밀번호 확인</td>
					</tr>
					<tr style="height: 30px;">
						<td style="text-align: center;">비밀번호</td>
						<td style="text-align: center;"><input id="pwd" type="password" required="required"></td>
					</tr>
				</table>
				<div style="float:right; margin:5px 5px 5px 0px;">
					<input type="hidden" id="number">
					<button class="cancel-btn" style="background:#27a5ff !important;" onclick="deleteNotice()">확인</button>
					<button class="cancel-btn" onclick="cancelDelete()">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 출석 완료 -->
	<div id="icon-back">
		<div id="passimg" class="show-hide">
			<img id="pass" alt="" src="${contextPath }/resource/photo/manager/check.png">
		</div>
		<!-- 실패  -->
		<div id="failimg" class="show-hide">
			<img id="fail" alt="" src="${contextPath }/resource/photo/manager/cancel2.png">
		</div>
	</div>
	<script>
		
	
		function backpwd() {
				$("#modal-ndelete-back").css("display","block");
				$("#modal-ndelete-con").css("display","block")
			}
			
			function deleteNotice(){
				if($("#pwd").val() != 1234){
					this.alert("잘못된 비밀번호입니다.");
					$("#pwd").val('');
					$("#pwd").focus();
				}else{
					var num = $("#number").val();
					location="qlist.do"; 
				}
			}
			
			// 삭제취소
			function cancelDelete(){
				$("#modal-ndelete-back").css("display","none");
				$("#modal-ndelete-con").css("display","none");
				
				$("body").css("overflow-y", "scroll");
				$("body").css("overflow-x","scroll");
			}
			
			$(document).click(function(e){
				if(e.target.id == 'addt-modal-back' || e.target.className == 'modal-back'){
				$("#write-modal-back").css("display", "none");
				$("#write-modal").css("display", "none");
				$("#detail-modal-back").css("display","none");
				$("#detail-modal").css("display","none");
				$("#modal-ndelete-back").css("display","none");
				$("#modal-ndelete-con").css("display","none");
				
				$("body").css("overflow-y", "scroll");
				$("body").css("overflow-x","scroll");
				}
			});
			
		$(function() {
			$("#check-btn").click(function() {
				
				
				
				var id = document.getElementById('idbox').value;
				var pwd = document.getElementById('pwdbox').value;
				
				$.ajax({
					url:"chkatt.do",
					data:{
						id:id,
						pwd:pwd
						},
					success:function(data){
			             if(data.isCheck == true){
							// 비번확인완료
			                $("#passimg").css({'display': 'block', 'opacity': 0}).animate({'opacity':0.9},700);
							$("#icon-back").css({'display': 'block', 'opacity': 0}).animate({'opacity':1},300);
							$("#passimg").css({'display': 'block', 'opacity': 0.7}).animate({'opacity':0},300);
			             }else{
			           		//비번 불일치
			            	 $("#failimg").css({'display': 'block', 'opacity': 0}).animate({'opacity':0.9},700);
							 $("#icon-back").css({'display': 'block', 'opacity': 0}).animate({'opacity':1},300);
							 $("#failimg").css({'display': 'block', 'opacity': 0.7}).animate({'opacity':0},300);
			             }
			        },
			        error:function(request,status,error){
			        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			          
			        	
			        	  
			        }
				});
				
				if (id == "${ptMember.userId}" && pwd == "${ptMember.userPwd}") { 
					
				} else {
					
				}
				$("#idbox").val("");
				$("#pwdbox").val("");
			})
			
			$(document).click(function(e){
				if(e.target.id == 'icon-back' || e.target.id == 'passimg' || e.target.id == 'failimg' || e.target.id == 'pass' || e.target.id == 'fail'){
					$("#icon-back").css("display", "none");
					$("#passimg").css("display","none");
					$("#failimg").css("display","none");
				}
			});
		});
		
		
	</script>
</body>
</html>