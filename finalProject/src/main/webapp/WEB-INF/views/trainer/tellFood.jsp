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
.food{
	background:#64c8fa;
}
/*전체를 감싸는 부분*/
.food-area{
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
/*식단 추천 찍는 부분*/
.title-area{
	font-size:3rem;
}
/*이름 찍는 부분*/
.memberName-area{
	font-size:2rem
}
/*몸무게 찍는 부분*/
.wieght-area{

}
.weight-list{
	list-style:none;
	font-size:1.2rem;
	padding:0;
}
/*탄단지 찍는 부분*/
.tdg-area{
	font-size:1.2rem;
}
/*끼니 찍는 부분*/
.meal-area{

}
.meal{
	height:40vh;
	width:30%;
	margin-right:1%;
	margin-top:1%;
	background:#D8D8D8;
	text-align:center;
	padding:2%;
	position:relative;
}
.kcal-list{
	list-style:none;
	padding-left:0px;
}
.kcal-list li{
	margin-top:2%;
}
.plus-area{
	height:40vh;
	width:30%;
	margin-right:1%;
	margin-top:1%;
	text-align:center;
	padding-top:7%;
	position:relative;
}
.plusIcon:hover{
	cursor:pointer;
}
.cancelIcon{
	width:30px;
	height:30px;
	position:absolute;
	top:250px;
	left:185px;
}
.cancelIcon:hover{
	cursor:pointer;
}
/*조언 부분*/
.advise-area{

}
.advise-area p{
	font-size:2rem
}
#ta{
	resize:none;
	width:100%;
	height:5%:
}
/*위치 조정 부분*/
.float-left{
	float:left;
}
.margin-top{
	margin-top:3%;
}
.margin-left{
	margin-left:2%;
}
</style>
</head>
<body>
	
	<jsp:include page="../common/trainerNav.jsp"/>
	<c:if test="${ !empty checkHealth }">
		<script>
			alert('${checkHealth}');
		</script>
		<c:remove var="checkHealth"/>
		<script>
			location.href="trainerMemberList.do";
		</script>
	</c:if>		
	<div class="food-area card">
		<div class="title-area">
			<p>식단 추천</>
		</div>
		<form action="insertFood.do" method="post" onsubmit="return validate()" >
			<div class="memberName-area">
				<p>${ userName } 회원님</p>
			</div>
			<!-- 기초 대사량을 계산 하는 과정  -->
			<div class="wieght-area">
				<ul class="weight-list">
					<li class="float-left">현재 몸무게 : ${ tmh.weight }</li>
					<li class="margin-left float-left">목표 체중 : ${ tmh.goal }</li>
					<li class="margin-left float-left">운동 목적 : ${ tmh.reason }</li>
					<li class="margin-left float-left">
						평소 활동 : 
						<select id="activity" name="activity" onchange="javascript:selected(this)">
							<option value="1.1">활동량 적은</option>
							<option value="1.3">평범한 직장인</option>
							<option value="1.5">몸을 움직이는 직엄</option>
							<option value="1.8">몸을 격하게 움직이는 직업</option>
						</select>
						<!-- 활동 대사량을 계산 하는 과정  -->
						<script>
							<c:choose>
							<c:when test="${tmh.gender == 'M'}">
									var basic = 66.5 +(13.7 * ${tmh.weight}) + (5 * ${ tmh.height }) - (6.8 * ${tmh.age});
									
									function selected(ele){
										var selected = ele.value;
										
										var tdee = Math.floor(basic * selected);									
										$("#tdee").text(tdee);
									}
								</c:when>
								<c:otherwise>
									var basic = 655.1 +(9.56 * ${tmh.weight}) + (1.85 * ${ tmh.height }) - (4.68 * ${tmh.age});
									
									function selected(ele){
										var selected = ele.value;
										
										var tdee = Math.floor(basic * selected);									
										$("#tdee").text(tdee);
									}
								</c:otherwise>
							</c:choose>							
						</script>
					</li>
				</ul>
			</div>
			<br clear="both">
			<!-- db에 저장된거에서 뺴는거 -->
			<div class="tdg-area margin-top">
				<ul>
					<li>활동 대사량(TDEE) : <span id="tdee"></span></li>
					<li>칼로리 조절 : <input type="number" step="100" onchange="calKcal(this)"></li>
					<li>하루 섭취 칼로리 : <span id="oneDaykcal"></span>kcal</li>
					<li>탄수화물 : <span id="ondayCarbo">${ food.carbo }</span>g</li>
					<li>단백질 : <span id="ondayProt">${ food.prot }</span>g</li>
					<li>지방 : <span id="ondayFat">${ food.fat }</span>g</li>
					<li style="list-style:none">
						<input id="carbo" type="text" name="carbo" value="${ food.carbo }" style="display:none;"/>
						<input id="prot" type="text" name="prot" value="${ food.prot }"  style="display:none;"/>
						<input id="fat" type="text" name="fat" value="${ food.fat }" style="display:none;"/>
					</li>
				</ul>
			</div>
			<script>
				function calKcal(ele){ //이건칼로리 추가를 했을때 
					var tdee = $("#tdee").html();
					
					//모든 끼니의 탄단지를 더함
					var carboSum = 0;
					var proSum = 0;
					var fatSum = 0;
					<c:choose>
						<c:when test="${ !empty meal }">
							<c:forEach var="m" items="${ meal }">
								carboSum += ${m.oneCarbo}
								proSum += ${m.onePro}
								fatSum += ${m.oneFat}
							</c:forEach>
						</c:when>
					</c:choose>
					
					//하루동안 섭취 해야할 칼로리 양
					var calKacl = parseInt(tdee) + parseInt($(ele).val());
					$("#oneDaykcal").text(calKacl);
					
					//하루동안 먹어야 할 단백질양
					var protien = Math.floor(${ tmh.weight } * 1.5);
					var protienKcal = parseInt(protien) * 4;
					$("#ondayProt").text(protien);
					$("#prot").val(protien);
					
					protien = protien - proSum;
					$("#tellLeftP").val(protien);
					
					//하루동안 먹어야할 지방 양
					var fatKcal = Math.floor(parseInt(calKacl) * 0.25);
					var fatGram = Math.floor(parseInt(fatKcal) / 9);
					$("#ondayFat").text(fatGram);
					$("#fat").val(fatGram);
					
					fatGram = fatGram - fatSum;
					$("#tellLeftF").val(fatGram);
					
					//하루동안 먹어야할 탄수화물 양
					var carboKcal = parseInt(calKacl) - (parseInt(protienKcal)+parseInt(fatKcal));
					var carboGram = Math.floor(parseInt(carboKcal) / 4);
					$("#ondayCarbo").text(carboGram);
					$("#carbo").val(carboGram);
					
					carboGram = carboGram - carboSum;
					$("#tellLeftC").val(carboGram);
					
				}
			</script>				
			<hr>
			<div class="meal-area">
				<c:choose>
					<c:when test="${ !empty meal }">
						<div class="tellMealInfo">
							입력 가능 탄수화물 : <input type="number" id="tellLeftC" style="margin-right:70px;" readonly></span>
							입력 가능  단백질 : <input type="number" id="tellLeftP" style="margin-right:70px;" readonly></span>
							입력 가능  지방 : <input type="number" id="tellLeftF" style="margin-right:70px;" readonly></span>
						</div>
						<script>
										//그냥 DB에서 값을 가져왔을때 끼니 모든 값에다가 뺀것
										var carboSum = 0;
										var proSum = 0;
										var fatSum = 0;
										<c:choose>
											<c:when test="${ !empty meal }">
												<c:forEach var="m" items="${ meal }">
													carboSum += ${m.oneCarbo}
													proSum += ${m.onePro}
													fatSum += ${m.oneFat}
												</c:forEach>
											</c:when>
										</c:choose>
										<c:if test="${ !empty food }">
											var resultCarbo = ${food.carbo} - parseInt(carboSum);
											var resultPro = ${food.prot} - parseInt(proSum);
											var resultFat = ${food.fat} - parseInt(fatSum);
											$("#tellLeftC").val(resultCarbo);
											$("#tellLeftP").val(resultPro);
											$("#tellLeftF").val(resultFat);
										</c:if>
							</script>				
						<c:forEach var="m" items="${ meal }">
							<div class="meal float-left">
								<input type="text" class="form-control" id="oneMeal" name="oneMeal" type="text" placeholder="아침 or점심 or저녁 or간식" style="font-size:1.5rem; text-align:center;" value="${ m.oneMeal }">
								<img style="margin-top:12px;" class="cancelIcon" src="resource/photo/trainer/stop.png" onclick="remove(${ m.mNum },this)">
								<br><br>
								<ul class="kcal-list">
									<li>
										<label>탄수화물 : </label>
										<input id="oneCarbo" name="oneCarbo" type="number" min="0" style="text-align:center" onkeydown="plusCarbo(this,event)" onchange="changeCarbo(this)" min="0" value="${ m.oneCarbo }"/>
									</li>
									<li>
										<label>&nbsp;&nbsp;&nbsp;단백질 : </label>
										<input id="onePro" name="onePro" type="number" min="0" style="text-align:center" onkeydown="plusPro(this,event)" onchange="changeProt(this)" min="0" value="${ m.onePro }"/>
									</li>
									<li>
										<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지방 : </label>
										<input id="oneFat" name="oneFat" type="number" min="0" style="text-align:center" onkeydown="plusFat(this,event)" onchange="changeFat(this)" min="0" value="${ m.oneFat }"/>
									</li>
									<li>
										<input type="text" id="mNum" name="mNum" value="${ m.mNum }" style="display:none"/>
									</li>
								</ul>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="tellMealInfo">
							입력 해야할 탄수화물 : <input type="number" id="tellLeftC" value="${ food.carbo }" style="margin-right:70px;" readonly></span>
							입력 해야할  단백질 : <input type="number" id="tellLeftP" value="${ food.prot }" style="margin-right:70px;" readonly></span>
							입력 해야할  지방 : <input type="number" id="tellLeftF" value="${ food.fat }" style="margin-right:70px;" readonly></span>
						</div>										
					</c:otherwise>
				</c:choose>
				<div class="float-left plus-area">
					<img style="margin-top:12px;" class="plusIcon" src="resource/photo/trainer/add (2).png">
				</div>										
			</div>
			<br clear="both">
			<hr>
			<div class="advise-area">
				<p>조언 한마디</p>
				<textarea id="ta" name="memo">${ food.memo }</textarea>
			</div>
			
			<c:choose>
				<c:when test="${ empty food }">
					<input type="text" name="check" value="insert" style="display:none;"/>
					<input type="text" name="foodNum" value="0" style="display:none;"/>	
				</c:when>
				<c:otherwise>
					<input type="text" name="check" value="update" style="display:none;"/>
					<input type="text" name="foodNum" value="${ food.foodNum }" style="display:none;"/>	
				</c:otherwise>
			</c:choose>			
			
			<input type="text" name="userNum" value="${ tmh.userNum }" style="display:none;"/>		
			<button class="button button2 font checkBtn" style="font-size:1.5rem;">제출</button>		
		</form>
	</div>
	<script>
	$(".plus-area").click(function () {
		 $(this).before('<div class="meal float-left"><input type="text" class="form-control" id="oneMeal" name="oneMeal" type="text" placeholder="아침 or점심 or저녁 or간식" style="font-size:1.5rem; text-align:center;"><img style="margin-top:12px;" class="cancelIcon" onclick="remove2(this)" src="resource/photo/trainer/stop.png"><br><br><ul class="kcal-list"><li><label>탄수화물 : </label><input id="oneCarbo" name="oneCarbo" type="number" min="0" style="text-align:center" onkeydown="plusCarbo(this,event)" onchange="changeCarbo(this)" min="0"/></li><li><label>&nbsp;&nbsp;&nbsp;단백질 : </label><input id="onePro" name="onePro" type="number" min="0" style="text-align:center" onkeydown="plusPro(this,event)" onchange="changeProt(this)" min="0"/> </li><li><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지방 : </label><input id="oneFat" name="oneFat" type="number" min="0" style="text-align:center" onkeydown="plusFat(this,event)" onchange="changeFat(this)" min="0"/></li><li><input type="text" id="mNum" name="mNum" value="0" style="display:none"/></li></ul></div>');
	});
	
	function remove(delNum,ele){
		
		var carbo;
		if($("#tellLeftC").val() == ""){
			carbo = 0;
		}else{
			carbo = $("#tellLeftC").val();
		}
		
		if($(ele).siblings(".kcal-list").children().children("#oneCarbo").val() == ""){
			$("#tellLeftC").val(carbo);
		}else{
			var cancelCarbo = $(ele).siblings(".kcal-list").children().children("#oneCarbo").val();
			var changedCarbo = parseInt(carbo) + parseInt(cancelCarbo);
			$("#tellLeftC").val(changedCarbo);		
		}
		
		//단백질 양 다시 늘리기
		var prot;
		if($("#tellLeftP").val() == ""){
			prot = 0;
		}else{
			prot = $("#tellLeftP").val();
		}
		
		if($(ele).siblings(".kcal-list").children().children("#onePro").val() == ""){
			$("#tellLeftP").val(prot);
		}else{
			var cancelPro = $(ele).siblings(".kcal-list").children().children("#onePro").val();
			var changedProt = parseInt(prot) + parseInt(cancelPro);
			$("#tellLeftP").val(changedProt);			
		}
		
		//지방양 다시 늘리기
		var fat;
		if($("#tellLeftF").val() == ""){
			fat = 0;
		}else{
			fat = $("#tellLeftF").val();
		}
		
		if($(ele).siblings(".kcal-list").children().children("#oneFat").val() == ""){
			$("#tellLeftF").val(fat);
		}else{
			var cancelFat = $(ele).siblings(".kcal-list").children().children("#oneFat").val();
			var changedFat = parseInt(fat) + parseInt(cancelFat);
			$("#tellLeftF").val(changedFat);			
		}
		
		$.ajax({
			url:"delMeal.do",
			data:{mNum:delNum},
			success:function(data){
				// 1,2번 방법
				// if(data == "true"){
				// 3번 방법
				if(data.isUsable == true){
					$(ele).parent().remove();
				}else{
					alert("삭제가 안됨");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
		$(ele).parent().remove();
	}
		
	///취소 버튼 눌렀을때 있던 값들 돌려 놓는 부분
	function remove2(ele){
		var carbo;
		if($("#tellLeftC").val() == ""){
			carbo = 0;
		}else{
			carbo = $("#tellLeftC").val();
		}
		
		if($(ele).siblings(".kcal-list").children().children("#oneCarbo").val() == ""){
			$("#tellLeftC").val(carbo);
		}else{
			var cancelCarbo = $(ele).siblings(".kcal-list").children().children("#oneCarbo").val();
			var changedCarbo = parseInt(carbo) + parseInt(cancelCarbo);
			$("#tellLeftC").val(changedCarbo);		
		}
		
		//단백질 양 다시 늘리기
		var prot;
		if($("#tellLeftP").val() == ""){
			prot = 0;
		}else{
			prot = $("#tellLeftP").val();
		}
		
		if($(ele).siblings(".kcal-list").children().children("#onePro").val() == ""){
			$("#tellLeftP").val(prot);
		}else{
			var cancelPro = $(ele).siblings(".kcal-list").children().children("#onePro").val();
			var changedProt = parseInt(prot) + parseInt(cancelPro);
			$("#tellLeftP").val(changedProt);			
		}
		
		//지방양 다시 늘리기
		var fat;
		if($("#tellLeftF").val() == ""){
			fat = 0;
		}else{
			fat = $("#tellLeftF").val();
		}
		
		if($(ele).siblings(".kcal-list").children().children("#oneFat").val() == ""){
			$("#tellLeftF").val(fat);
		}else{
			var cancelFat = $(ele).siblings(".kcal-list").children().children("#oneFat").val();
			var changedFat = parseInt(fat) + parseInt(cancelFat);
			$("#tellLeftF").val(changedFat);			
		}
		
		$(ele).parent().remove();
	}

	
	var flag1 = false;
	var flag2 = false;
	var flag3 = false;
	//총 탄단지 양 바꾸는 부분
	function changeCarbo(ele){
		var carbo = $("#tellLeftC").val();
		if(carbo < 0){
			var cc = $("#carbo").val();
			var sumCarbo = 0;
			var nameSize = $("input[name='oneMeal']").length; //어처피 하나만 있으면 다 알수있으니까 이거 하나만 하자
			for(var i = 1;i<=nameSize;i++){ //해당 name들을 다 접근 하기 위해
				sumCarbo +=  parseInt($("input[name = 'oneCarbo']").eq(i-1).val());
			}
			var defCarbo =  (parseInt(sumCarbo) - Number(cc)) * -1;
			alert(defCarbo);
			$("#tellLeftC").val(defCarbo);
			
			flag1 = true;
		}else{
			var cc = $("#carbo").val();
			var sumCarbo = 0;
			var nameSize = $("input[name='oneMeal']").length; //어처피 하나만 있으면 다 알수있으니까 이거 하나만 하자
			for(var i = 1;i<=nameSize;i++){ //해당 name들을 다 접근 하기 위해
				sumCarbo +=  parseInt($("input[name = 'oneCarbo']").eq(i-1).val());
			}
			var changedCarbo = parseInt(cc) - parseInt(sumCarbo);
			
			$("#tellLeftC").val(changedCarbo);
			flag1 = true;
		}
	}
	
	function changeProt(ele){
		
		var prot = $("#tellLeftP").val();
		if(prot <0){
			var pp = $("#prot").val();
			var sumPro = 0;
			var nameSize = $("input[name='oneMeal']").length; //어처피 하나만 있으면 다 알수있으니까 이거 하나만 하자
			for(var i = 1;i<=nameSize;i++){ //해당 name들을 다 접근 하기 위해
				sumPro +=  parseInt($("input[name = 'onePro']").eq(i-1).val());
			}
			var defPro =  (parseInt(sumPro) - Number(pp)) * -1;
			$("#tellLeftP").val(defPro);
			
			flag2 = true;
		}else{
			var pp = $("#prot").val();
			var sumPro = 0;
			var nameSize = $("input[name='oneMeal']").length; //어처피 하나만 있으면 다 알수있으니까 이거 하나만 하자
			for(var i = 1;i<=nameSize;i++){ //해당 name들을 다 접근 하기 위해
				sumPro +=  parseInt($("input[name = 'onePro']").eq(i-1).val());
			}
			var changedPro = parseInt(pp) - parseInt(sumPro);
			$("#tellLeftP").val(changedPro);
			
			flag2 = true;
		}
	}
	
	function changeFat(ele){
		var fat = $("#tellLeftF").val();
		if(fat <0){
			var ff = $("#fat").val();
			var sumFat = 0;
			var nameSize = $("input[name='oneMeal']").length; //어처피 하나만 있으면 다 알수있으니까 이거 하나만 하자
			for(var i = 1;i<=nameSize;i++){ //해당 name들을 다 접근 하기 위해
				sumFat +=  parseInt($("input[name = 'oneFat']").eq(i-1).val());
			}
			var defFat =  (parseInt(sumFat) - Number(ff)) * -1;
			
			$("#tellLeftF").val(defFat);
			
			flag3 = true;
		}else{
			var ff = $("#fat").val();
			var sumFat = 0;
			var nameSize = $("input[name='oneMeal']").length; //어처피 하나만 있으면 다 알수있으니까 이거 하나만 하자
			for(var i = 1;i<=nameSize;i++){ //해당 name들을 다 접근 하기 위해
				sumFat +=  parseInt($("input[name = 'oneFat']").eq(i-1).val());
			}
			var changedFat = parseInt(ff) - parseInt(sumFat);
			$("#tellLeftF").val(changedFat);
			
			flag3 = true;
		}
	}
	//////////////////총 탄단지 입력했다가 지우기 눌렀을때 원래대로 돌려 놓는 부분
	function plusCarbo(ele,event){
		if(event.keyCode == 8 && flag1){
				var carbo = $("#tellLeftC").val();
				var changedCarbo = parseInt($(ele).val()) + Number(carbo);
				$(ele).val('');
				$("#tellLeftC").val(changedCarbo);
		}
		flag1 = false;
	}
	function plusPro(ele,event){
		if(event.keyCode == 8 && flag2){
			var pro = $("#tellLeftP").val();
			var changedPro = parseInt($(ele).val()) + Number(pro);
			$(ele).val('');
			$("#tellLeftP").val(changedPro);
		}
		flag2 = false;
	}
	function plusFat(ele,event){
		if(event.keyCode == 8 && flag3){
			var fat = $("#tellLeftF").val();
			var changedFat = parseInt($(ele).val()) + Number(fat);
			$(ele).val('');
			$("#tellLeftF").val(changedFat);
		}
		flag3 = false;
	}
	
	
	
	//유효성 체크하는 부분
	function validate(){ //제출하기전에 유효성 체크

		var nameSize = $("input[name='oneMeal']").length; //어처피 하나만 있으면 다 알수있으니까 이거 하나만 하자
		if(nameSize<1){
			alert("식단 정보를 기입해 주십시오");
			return false;
		}
		for(var i = 1;i<=nameSize;i++){ //해당 name들을 다 접근 하기 위해
			
			if($("input[name = 'oneMeal']").eq(i-1).val() == ""){
				alert("끼니를 입력하세요");
				$("input[name = 'oneMeal']").eq(i-1).focus();
				return false;
			} 
			
			if($("input[name = 'oneCarbo']").eq(i-1).val() == ""){
				alert("탄수화물을 입력하세요");
				$("input[name = 'oneCarbo']").eq(i-1).focus();
				return false;
			} 
			
			if($("input[name = 'onePro']").eq(i-1).val() == ""){
				alert("단백질을 입력하세요");
				$("input[name = 'onePro']").eq(i-1).focus();
				return false;
			} 	
		
			if($("input[name = 'oneFat']").eq(i-1).val() == ""){
				alert("지방을 입력하세요");
				$("input[name = 'oneFat']").eq(i-1).focus();
				return false;
			} 
		}
		
		if($("#tellLeftC").val() > 0 || $("#tellLeftC").val() < 0){
			alert("할당된 탄수화물 양을 맞춰 주세요.");
			return false;
		}
		if($("#tellLeftP").val() > 0 || $("#tellLeftP").val() < 0){
			alert("할당된 단백질 양을 맞춰 주세요.");
			return false;
		}
		if($("#tellLeftF").val() > 0 || $("#tellLeftF").val() < 0){
			alert("할당된 지방 양을 맞춰 주세요.");
			return false;
		}
		
		if($("#ta").val()==""){
			alert("조어을 입력하세요");
			$("#ta").focus();
			return false;
		}
		return true;
	}
	</script>
</body>
</html>