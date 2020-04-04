<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	/* 	height: 750px; */
	position: relative;
	margin: auto;
	background: white;
	padding: 50px 25px;
	margin: 60px auto;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	border-radius: 5px;
}

.myInfoDiv {
	display: inline-block;
	width: 90%;
	padding: 50px;
	/* background: #e6e6e6; */
	margin: auto;
	box-shadow: 1px 1px 6px lightgrey;
	border-radius: 5px;
}

.subTitle {
	color: black;
	font-weight: bold;
	font-size: 20px;
	text-align: left;
	/* padding-left: 20px; */
}

.food {
	background: #64c8fa;
}

.bodyTxt {
	padding-left: 20px;
}

.subTitle {
	text-align: center;
}

.foodTable {
	font-size: 15px;
	/* 	border-top: 2px solid rgb(39, 165, 255) !important;
	border-bottom: 1px solid rgb(39, 165, 255) !important; */
	text-align: center;
	width: 200px !important;
	float: left;
	margin: 10px;
	box-shadow: 1px 1px 6px lightgrey;
	border-radius: 5px;
}

.foodTable td {
	vertical-align: middle !important;
	padding-left: 20px !important;
	width: 150px;
	background: white !important;
}

.foodTable th {
	vertical-align: middle !important;
	background: #f9f9f9;
	width: 80px;
}

.imgDiv {
	display: inline-block;
	width: 900px;
	height: auto;
}
.allCal{
	text-align: center;
	box-shadow: 1px 1px 6px lightgrey;
	border-radius: 5px;
	width: 640px !important;
	margin:10px !important;
	float:left;
}
.allCal th{
background: rgb(0, 128, 255);
border-right: 1px solid white;
color: white;


}
.allCal td{
background: white;


}
.foodCal{
	display: inline-block;
	width: 100%;
	margin: auto;
	text-align:center;
}
.foodDiv {
	display: inline-block;
	width: 100%;
	margin: auto;

	/* border: 1px solid black; */
}
.carboCols1{

width: 33%;}
</style>
</head>
<body>
	<jsp:include page="../common/ptNav.jsp" />
	<div class="outer">
		<div class="pageName">
			<p>식단관리</p>
		</div>
		<div class="Div1" align="center">

			<p class="subTitle">트레이너 추천 식단</p>
			<p style="text-align: center;">트레이너가 추천해준 식단을 활용하여 건강한 몸을 가꿔보세요.</p>

			<div class="imgDiv" align="center">
				<img src="${ contextPath }/resource/photo/ptMember/food.jpg"
					width=700">
			</div>
			<!-- 식단(아침, 점심, 저녁) -->
			<div class="myInfoDiv">
				<div class="trainerAdviceDiv">
					<p class="trainerAdvice1"
						style="text-align: left; font-size: 18px; font-weight: bold;">트레이너
						조언</p>
					<c:if test="${ !empty mealList }">
						<p class="trainerAdvice2" style="text-align: left;">- ${ food.memo }</p>
					</c:if>
					<c:if test="${ empty mealList }">
						<p class="trainerAdvice2" style="text-align: left;">- 트레이너의
							조언을 기다려보세요.</p>
					</c:if>

				</div>
				
				
				<div class="foodCal">
				<table class="allCal table table-sm" align="center">
					<tr>
						<td colspan="3">
						하루에 필요한 총 영양분 양
						</td>
					</tr>
					<tr>
						<th class="carboCols1">
						탄수화물
						</th>
						<th>
						단백질
						</th>
						<th>
						지방
						</th>
					</tr>
					<tr>
						<td>
						${ food.carbo }g
						</td>
						<td>
						${ food.prot }g
						</td>
						<td>
						${ food.fat }g
						</td>
					</tr>					
				</table>
				</div>
				<div class="foodDiv">
						<!-- 식단 있을때 -->
						<c:if test="${ !empty mealList }">
							<c:forEach var="f" items="${ mealList }">
					<table class="foodTable table table-sm" align="center">
								<tr>
									<th rowspan="4" class="cols1"
										style="background: rgb(0, 128, 255); color: white">${ f.oneMeal }</th>
								</tr>
								<tr>
									<td>탄수화물 ${ f.oneCarbo }g</td>
								</tr>
								<tr>
									<td>단백질 ${ f.onePro }g</td>
								</tr>
								<tr>
									<td>지방 ${ f.oneFat }g</td>
								</tr>
								</table>
							</c:forEach>
						</c:if>
						<!-- 식단 없을때 -->
						<c:if test="${ empty mealList }">
						<table class="foodTable table table-sm" align="center">
							<tr>
								<th rowspan="4" class="cols1"
									style="background: rgb(0, 128, 255); color: white">추천식단 없음</th>
							</tr>
					</table>
						</c:if>

				</div>
			</div>
		</div>
		<!-- Div1끝 -->
	</div>

	<br>
	<br>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>