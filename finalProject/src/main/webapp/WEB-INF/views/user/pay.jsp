
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Jquery CDN -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 결제 -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
.thro {
	padding: 2%;
}

.pay { 
	background: #64c8fa;
}

.totla {
display: inline-block;
	width: 1100px;
	height: auto;
	margin: 50px;
}

.pt::-webkit-scrollbar {
	background-color: #fff;
	width: 16px;
}

/* background of the scrollbar except button or resizer */
.pt::-webkit-scrollbar-track {
	background-color: #fff
}

/* scrollbar itself */
.pt::-webkit-scrollbar-thumb {
	background-color: #babac0;
	border-radius: 16px;
	border: 4px solid #fff
}

/* 일반회원으로 결제시 */
.user {
	width: 70%;		
	height: 700px;
	border: 1px solid #E6E6E6;
	border-radius: 10px;
	float: left;
	margin-left: 15%;
	box-shadow: 1px 1px 6px lightgrey;
}

/* PT회원으로 결제시 */
.pt {
	width: 70%;
	height: auto;
	border: 1px solid #E6E6E6;
	border-radius: 10px;
	float: left;
	margin-left: 15%;
	overflow: scroll;
	box-shadow: 1px 1px 6px lightgrey;
}
/* 라디오 버튼  */
.box-radio-input {
	margin: 30px 10px 20px 50px;
}

.box-radio-input input[type="radio"] {
	display: none;
}

.box-radio-input input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 10px;
	text-align: center;
	height: 35px;
	line-height: 33px;
	font-weight: 500;
	cursor: pointer;
}

.box-radio-input input[type="radio"]:checked+span {
	border: 1px solid #23a3a7;
	background: #2E9AFE;
	color: #fff;
}

.box-radio-input {
	margin: 20px 5px 5px 30px;
}

.box-radio2-input input[type="radio"] {
	display: none;
}

.box-radio2-input input[type="radio"]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 5px;
	text-align: center;
	height: 35px;
	line-height: 33px;
	font-weight: 500;
	cursor: pointer;
}

.box-radio2-input input[type="radio"]:checked+span {
	border: 1px solid #23a3a7;
	background: #2E9AFE;
	color: #fff;
}

/* 라디오버튼감싸고 있는 div */
.radio {
	width: 30%;
	height: 500px;
	float: left;
}

.radio2 {
	width: 100%;
	height: 300px;
	float: left;
}

/* 결제 버튼 */
.select {
	float: right;
	width: 200px;
	height: 60px;
	margin-top: 3%;
}

/* 강사소개 div */
.ptinfo {
	width: 45%;
	height: 600px;
	margin-left: 5%;
}
/* 강사 사진 */
.photo {
	width: 40%;
	height: 20%;
	border-radius: 50%;
	margin-left: 100px;
	margin-top: 15%;
	margin-bottom: 15%;
}

.photo  img {
	width: 100%;
	height: 100%;
	border-radius: 50%;
	/* border: 1px solid red; */
}

/* 일반회원,PT버튼 */
.btn1 {
	border: none;
	background: none;
	border-bottom: 1.5px solid #2E9AFE;
	font-weight: bold;
	color: #2E9AFE;
	font-size: 20px;
	width: 150px;
	height: 48px;
}

.btn2 {
	border: none;
	background: none;
	border-bottom: 1.5px solid #2E9AFE;
	font-weight: bold;
	color: #2E9AFE;
	font-size: 20px;
	width: 150px;
	height: 48px;
}

/* 헬스장 소개 전체 폼 */
.thro {
	width: 1100px;
	height: 1500px;
	float: left;
	margin-left: 5%;
}

/* 출입 관련 폼 */
.cnfdlq {
	width: 100%;
	height: 320px;
	float: left;
	border: 1px solid lightgray;
}

.cnfdlq img {
	width: 350px;
	height: 220px;
	margin: 3%;
}

.cnfdlq1 {
	width: 490px;
	height: 220px;
	margin: 3%;
	float: right;
}

/* 락카 관련 폼 */
.fkrzk {
	width: 100%;
	height: 320px;
	float: right;
	border: 1px solid lightgray;
}

.fkrzk img {
	width: 350px;
	height: 220px;
	margin: 3%;
}

.fkrzk1 {
	width: 490px;
	height: 220px;
	margin: 3%;
	float: left;
}

/* 유산소 관련 폼 */
.dbtksth {
	width: 100%;
	height: 320px;
	float: left;
	border: 1px solid lightgray;
}

.dbtksth img {
	width: 350px;
	height: 220px;
	margin: 3%;
}

.dbtksth1 {
	width: 490px;
	height: 220px;
	margin: 3%;
	float: right;
}

/* 스마트 운동 기구 */
.tmakxm {
	width: 100%;
	height: 320px;
	float: right;
	border: 1px solid lightgray;
}

.tmakxm img {
	width: 350px;
	height: 220px;
	margin: 3%;
}

.tmakxm1 {
	width: 490px;
	height: 220px;
	margin: 3%;
	float: left;
}

.footer1 {
	width: 100%;
	float: left;
}

.btn {
	width: 300px;
}

.Spec1 {
	text-align: center;
}

/* 트레이너 소개 */
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 40%;
	border-radius: 5px;
	float: right;
	margin-right: 4%;
	margin-top: 3%;
	margin-bottom: 5%;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.btn-primary2 {
	width: 200px;
}

/*결제하기 버튼*/
.payment{
	/* border-radius: 5px; */
	background: #27a5ff !important;
	color: white;
	border: 1px solid #27a5ff !important;
	border-radius: 0px !important;
}

.payment:hover {
	background: #64c8fa !important;
	border: 1px solid #64c8fa !important;
}
.submitBtnDiv{
	display:inline-block;
	width: 750px;
	margin:auto;
}
</style>
</head>
<body>
	<jsp:include page="../common/userNav.jsp" />


	<script>
		$(function() {
			$('.user').show(); //페이지를 로드할 때 표시할 요소
			$('.pt').hide();

			$('.btn2').css("color", "lightgray");
			$('.btn2').css("border-bottom", "1px solid white");

			$('.btn2').click(function() {
				$('.pt').show(); //클릭 시 두 번째 요소 표시
				$('.user').hide();

				$('.btn1').css("color", "lightgray");
				$('.btn1').css("border-bottom", "1px solid white");
				$('.btn2').css("color", "#2E9AFE");
				$('.btn2').css("border-bottom", "1.5px solid #2E9AFE");

				/* $("input:radio[name='price']:radio[cate=1]").prop('checked',false); */
				$(".user input[type='radio']").prop('checked', false);

				$(".btn1").click(function() {
					$('.user').show(); //클릭 시 첫 번째 요소 숨김
					$('.pt').hide(); //클릭 시 두 번째 요소 표시

					$('.btn2').css("color", "lightgray");
					$('.btn2').css("border-bottom", "1px solid white");
					$('.btn1').css("color", "#2E9AFE");
					$('.btn1').css("border-bottom", "1.5px solid #2E9AFE");

					$(".pt input[type='radio']").prop('checked', false);

					return false;
				});
			});
		});
	</script>





	<div class="totla">
		<div class="thro">
			<div class="cnfdlq">
				<img src="resource/photo/user/스마트 출입.PNG">
				<div class="cnfdlq1">
					<h1>스마트 출입 시스템</h1>
					<h4>
						운영중인 센터 입구나 GX룸/필라테스 룸 등 수업장소에 게이트를 설치하여 인증받은 회원만 입장할 수 있습니다.
						출입관리를 통해 회원들에게 만족도 높은 환경을 제공하세요.
					</h4>
				</div>

			</div>


			<div class="fkrzk">
				<img src="resource/photo/user/스마트 락카.PNG">
				<div class="fkrzk1">
					<h1>스마트 락커</h1>
					<h4>회원들이 스스로 락카를 발급받고 회원 밴드로 락카를 개폐할 수 있습니다. 시스템에서 이용현황을 실시간으로
						모니터링 할 수 있어 더욱 체계적인 운영이 가능합니다.</h4>
				</div>
			</div>


			<div class="dbtksth">
				<img src="resource/photo/user/스마트 유산소.PNG">
				<div class="dbtksth1">
					<h1>스마트 유산소 운동 기구</h1>
					<h4>IOT 기반 유산소 운동 솔루션입니다. 패턴, 가이드, 심박수 기반 운동 등 다양한 운동 방법을 제시하고
						칼로리 소모량, 심박수 추이 등 과학적인 운동 결과를 안내해 드립니다.</h4>
				</div>
			</div>

			<div class="tmakxm">
				<img src="resource/photo/user/스마트.PNG">
				<div class="tmakxm1">
					<h1>스마트 웨이트 운동 기구</h1>
					<h4>IOT 기반 웨이트 운동기기 입니다. 자동 카운팅, 목표 세트/횟수/무게 제시, 운동 가이드 영상 등
						첨단 피트니스 환경을 경험할 수 있습니다.</h4>
				</div>
			</div>


		</div>

		<div class="user">

			<button class="btn1" onclick="btn1">
				<span>일반회원</span>
			</button>
			<button class="btn2" onclick="btn2">
				<span>PT회원</span>
			</button>
			<br>
			<br>
			<br>
			<br>
			<div class="radio">
				<form action="insertpay.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="cate" value="1"> <input
						type="hidden" name="userNum" value="${loginUser.userNum }">
					<input type="hidden" name="status" value="${loginUser.status }">
					<label class="box-radio-input"><input type="radio"
						name="price" value="100000"> <span>1개월(10만원)</span></label><br>
					<br>
					<br> <label class="box-radio-input"><input
						type="radio" name="price" value="500000"> <span>3개월(50만원)</span></label><br>
					<br>
					<br> <label class="box-radio-input"><input
						type="radio" name="price" value="800000"> <span>6개월(80만원)</span></label><br>
					<br>
					<br> <label class="box-radio-input"><input
						type="radio" name="price" value="1300000"> <span>12개월(130만원)</span></label>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
						<div class="submitBtnDiv" align="center">
							<button type="button" class="btn btn-primary payment"
								onclick="payment(1);">결제하기</button>
							<button type="submit" id="reserv-btn1" style="display: none;"></button>
						</div>
				</form>
			</div>
		</div>




		<div class="pt">
			<div>
				<button class="btn1" onclick="btn1">일반회원</button>
				<button class="btn2" onclick="btn2">PT회원</button>
			</div>
			<c:forEach var="t" items="${ tr }" varStatus="status">
				<div class="ptinfo card">

					<div class="photo">
						<img src="${contextPath }/resource/profileImage/${t.chName}">

					</div>

					<div class="ptname">
						<h1 style="text-align: center">${t.trName }강사</h1>
					</div>
					<br>

					<div class="Spec">
						<h2 style="text-align: center">수상경력</h2>
					</div>


					<div class="Spec1">
						<c:forEach var="r" items="${career.get(status.index) }">


							<span>${ r }</span>
							<br>
						</c:forEach>
						<!-- 				<span>-주부 18단</span><br>
				<span>-전국 팔씨름 56등</span><br> -->

					</div>
				</div>


			</c:forEach>


			<div class="radio2">
				<form action="insertpay.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="cate" value="2"> <input
						type="hidden" name="userNum" value="${loginUser.userNum }">
					<!-- 로그인 유저의 회원 번호 -->
					<input type="hidden" name="status" value="${loginUser.status }">
					<!-- 로그인된 유저의 상태 -->
					<label class="box-radio-input"><input type="radio"
						name="price" value="700000"> <span>10회(70만원)</span></label> <label
						class="box-radio-input"><input type="radio" name="price"
						value="2000000"> <span>20회(200만원)</span></label> <label
						class="box-radio-input"><input type="radio" name="price"
						value="4000000"> <span>30회(400만원)</span></label> <label
						class="box-radio-input"><input type="radio" name="price"
						value="6300000"> <span>50회(630만원)</span></label>




					<div class="select">
						<select name="trNum">
							<c:forEach var="t" items="${ tr }">
								<option name="trNum" value="${t.trNum }">${t.trName }
									강사</option>
							</c:forEach>
						</select>
					</div>


					<br>
					<br>
					<br>
					<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="submitBtnDiv" align="center">
					<button type="button" class="btn btn-primary payment" onclick="payment(2);">결제하기</button>
					<button type="submit" id="reserv-btn2" style="display: none;"></button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<br>
	<div class="footer1">
		<jsp:include page="../common/footer.jsp" />
	</div>

	<script>
		var cate = 0;

		function payment(number) {
			cate = number;
			console.log(cate);

			var result = $('input[name="price"]:checked').val();
			if (result == null) {
				alert("결제 금액을 선택해주세요.")
				$('input[name="price"]').focus();
				return;
			}

			if (!window.confirm("결제하시겠습니까?" + "(" + result + "원)")) {
				console.log("왜ㅡㅡ");
				return;
			}

			//결제 시작
			var IMP = window.IMP; // 생략가능
			IMP.init('imp20522573'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원. 이건 어떤 방식으로 결제를 할것인지가 들어감
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '온핏',
				amount : result,
				buyer_email : "${loginUser.email}",
				buyer_name : '${loginUser.userName}',
				buyer_tel : '${loginUser.phone}',
				buyer_addr : '',
				buyer_postcode : '123-456',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
/* 					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num; */
					alert(msg);
					if (cate == 1) {
						$("#reserv-btn1").click();
					} else if (cate == 2) {
						$("#reserv-btn2").click();
					}

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					check = false;
					checkMsg = "결제 실패";
					alert(msg);
					location.href = "pay.do";
				}
			});
			//결제 끝
		}
	</script>






</body>
</html>