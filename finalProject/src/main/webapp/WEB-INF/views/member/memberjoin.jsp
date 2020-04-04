
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


.total{
	height:1000px;
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
   
   .enroll{
   	width:500px;
   	height:auto;
   	border:1px solid lightgray;
   	float:left;
   	margin-left:35%;
   	margin-bottom:3%;
   	
   }
   
   .enroll td{
   	padding:2%;
	display:block;
   	width:300px;
   	margin-left:20%;
   }
   
   
   .logo1{
   	width:500px;
   	height:600px;
   	border:1px solid red;
   	float:left;
   }
   .logo{
   	width:500px;
   	height:170px;
   	float:left;
   	background:#27a5ff;
   	float:left;  
   }
   .logo img{
   	width:500px;
   	height:120px;
   }
   
   .name{
   	border:none;
   	border-bottom:1.5px solid lightgray;
   }
   
   input{
   	width:200px;
   }
   .image-wrapper{
   	height:20vh;
   	position:relative;
   	margin-bottom:20px;
   }
   
	.hidden{
	   display:none;
	}   
	#change-profile{
		width:50px;
		height:50px;
		cursor:pointer;
		position:absolute;
		top:140px;
		right:70px;
	}
	#show-profile{
		position:absolute;
		border:1px solid gray;
		height:180px;
		width:180px;
		border-radius:50%;
		left:50px;
	}
	.enrollBtn{
	width: 230px !important;
	color: white;
	margin: 0 0 5px 0;
	border-radius:0px !important;
	background: rgb(39, 165, 255) !important;
	border: 1px solid  rgb(39, 165, 255);

	}
	
	.enrollBtn:hover {
	background: #64c8fa !important;
	color: white;
	margin: 0 0 5px 0;
	/* background:white !important; */
	/* background: #64c8fa; */
	border: 1px solid #64c8fa;

}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script><!-- jquery 쓰기 위해서 -->
<!-- 프로필 부분 -->
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
<!-- 프로필 부분 끝-->
</head>
<body>
	
	 <h1 align="center">OneFit</h1>
	 <div class="total">
   <div class="enroll" >
   <h3 align="center">회원가입</h3>
      <form action="uinsert.do" method="post" id="joinForm" onsubmit="return validate()" enctype="multipart/form-data">
         <table width="500" cellspacing="5">
         	<!-- 프로필 부분 -->
         	<tr>
         		<td width="350">프로필 사진</td>
         		<td width="450">
         			<div class="image-wrapper">
         				<img src="resource/profileImage/standard.png" id="show-profile"/>
         				<img src="resource/photo/trainer/gear.png" id="change-profile"/>
         			</div>
         		</td>
         	</tr>
         	<!-- 프로필 부분 끝 -->
            <tr>
               <td width="350">아이디</td>
               
               <td width="450">
                  <input class="name" type="text" name="userId" id="userId" placeholder="아이디를 입력하세요">
                  <br>
                  <span class="guide ok">사용가능한 아이디입니다.</span>
                  <span class="guide error">사용 불가능한 아이디입니다.</span>
                  <input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
               </td>
            </tr>
            
            <tr>
               <td>이름</td>
               <td><input class="name" type="text" name="userName"  placeholder="이름을 입력하세요" required></td>
            </tr>
            
            
            
            <tr>
               <td>비밀번호</td>
               <td><input id="pass1" class="name" type="password" name="userPwd" placeholder="비밀번호" required></td>
                <td><input id="pass2" class="name" type="password" name="pwd2"  placeholder="비밀번호확인" required>
                	<br>
                	<span id="pwd-error" class="guide error">비밀번호가 맞지 않습니다.</span>
                </td>
            </tr>
            
            
              
            
            <tr>
               <td>성별</td>
               <td>
               	  <label for="man">남자</label>
                  <input type="radio" id="man" name="gender" value="M" style="width:20px; height:15px">
                  <label for="women">여자</label>
                  <input type="radio" id="women" name="gender" value="F" style="width:20px; height:15px">
               </td>
            </tr>
            
            
            <tr>
               <td>생년월일</td>
               <td><input class="name" type="text" name="birth" placeholder="ex)19951108" required></td>
            </tr>
            
            
            <tr>
               <td>이메일</td>
               <td>
               	<input class="name" type="email" name="email"  placeholder="이메일" required>
               </td>
            </tr>
            
            
            <tr>
               <td>전화번호</td>
               <td><input class="name" type="tel" name="phone"  placeholder="전화번호" required></td>
            </tr>
            
           
            
            
            <tr>
               <td colspan="2" align="center">
                  <button class="enrollBtn" style="background:#27a5ff; color:white; border-radius:5px; width:150px; height:35px;">가입하기</button>
                  &nbsp;
               </td>
            </tr>
         </table>
         <!-- 프로필 부분 -->
         <input type="file" name="profile" class="hidden" id="profile" onchange="loadImg(this)">
         <!-- 프로필 부분 끝 -->
      </form>
      <br>
      <br>
   </div> 
   </div>

   <!-- ajax 이후 추가 : 아이디 중복 확인 -->
   <script>
	$(function(){
		$("#userId").on("keyup", function(){
			var userId = $(this).val();
			
			if(userId.length < 4){
				$(".guide").hide(); // 보여졌던 글 사라지게
				$("#idDuplicateCheck").val(0); // 가입 가능 여부를 불가로 지정
				return; // 4글자 이하는 아래 ajax를 시행하지 않고 리턴
			}
			
			$.ajax({
				url:"checkid.do",
				data:{id:userId},
				success:function(data){
					// 1,2번 방법
					// if(data == "true"){
					// 3번 방법
					if(data.isUsable == true){
						$(".guide.error").hide();
						$(".guide.ok").show();
						$("#idDuplicateCheck").val(1); // 회원 가입 가능 값
					}else{
						$(".guide.error").show();
						$(".guide.ok").hide();
						$("#idDuplicateCheck").val(0); // 회원 가입 가능 값
					}
				},
				error:function(e){
					console.log(e);
				}
			});
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
         // 아이디 중복 체크 후 가입 가능 여부
         if($("#idDuplicateCheck").val() == 0){
            alert("사용 가능한 아이디를 입력해주세요.");
            $("#userId").focus();
            return false;
         }
         if($(':radio[name="gender"]:checked').length<1){
        	 alert("성별을 입력해주세요.");
        	 $(':radio[name="gender"]').focus();
        	 return false;
         }
         alert("인증 이메일을 보내드렸습니다. 확인 부탁 드립니다.")
         return true;
      }
   </script>
	
</body>
</html>