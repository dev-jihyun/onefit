<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />


    <link href="${ contextPath }/resource/API/quill/quill.snow.css" rel="stylesheet">
    <script src="${ contextPath }/resource/API/quill/quill.min.js"></script>
    <script src="${ contextPath }/resource/API/quill/quill.js"></script>
    <script src ="${ contextPath }/resource/API/quill/image-resize.min.js"></script>
    
<style>
body {
	background: rgb(240, 240, 240) !important;
	margin: auto;
}
.outer {
	/*min-height: 600px;
	width: 1200px; */
	/* border: 1px solid green; */
	display: inline-block !important;
	width: 1100px;
	background: white;
	height: auto;
	margin: 100px auto 50px 100px;
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

.board-post {
	display: inline-block;
	width: 100%;
	padding: 0px;
	margin: 0px;
	height: auto;
	text-align: center;
	padding-left: 5%;
	padding-right: 5%
}

.board-post-list {
	width: 100%;
	float: left;
	margin-top: 10px;
}

.board-postnav-side {
	width: 20%;
	height: 350px;
	float: left;
	margin: 10px;
	background-color: rgb(255, 243, 239);
	/* border: 1px solid black; */
}

.board-postnav-side>ul>li>a {
	color: black;
}

.board-postnav-side>ul>li>a:hover {
	color: red;
}

.board-postnav-side>ul>li:hover {
	background-color: lightgrey;
}

.mycolSize {
	width: 70%;
}

.mycolSize2 {
	width: 10%;
}

.titles {
	width: 100px;
}

.boardTItle {
	display: inline-block;
	font-size: 1.5em;
}

.margin-padding-zero {
	margin: 0;
	padding: 0;
	padding-left: 10%;
	padding-right: 10%;
}

.commentBox {
	width: 100%;
	float: left;
}

.commentShow {
	display: none;
}

.submitBTN,.listBTN {
	float: right;
	margin: 3px;
		/* border-radius: 5px; */
		background: #27a5ff !important;
		color: white;
		border: 1px solid #27a5ff !important;
		width: 80px;
		height: 30px;	
}
	.submitBTN:hover{
		background: #64c8fa !important;
		border: 1px solid #64c8fa !important;
	}
.updateBox {
	width: 80%;
	padding-left: 3%;
	padding-right: 3%;
	padding-top: 3%;
	margin: auto;
}

.qna_table {
	width: 100% !important;
	border-top: 2px solid rgb(39, 165, 255) !important;
	border-bottom: 1px solid rgb(39, 165, 255); 
	border-left: none !important;
	border-right: none !important;
	margin: 0px !important;
	/* margin-bottom:20px !important; */
	padding: 0 !important;
}

.sub_cols {
	width: 80px !important;
	text-align: center;
	background: #f9f9f9;
}
/* td :first-child{
width: 40px;
} */
.qna_table td, th {
	padding: 3px;
	/* border: 1px solid lightgrey !important; */
	vertical-align:middle !important;
}

.qTitle {
	width: 100%;
	font-size: 14px;
}

.custom-select {
	width: 150px !important;
	border: 1px solid rgb(39, 165, 255) !important;
	font-size: 14px !important;
	margin-bottom: 3px !important;
}

.qna_table tr {
	/* border: 1px solid lightgrey; */
	
}

.firstTr {
	height: 50px;
}
</style>
</head>
<body>
<c:if test="${ loginUser.status eq 3 or loginUser.status eq 1}">
	<jsp:include page="../userNav.jsp" />
</c:if>
<c:if test="${loginUser.status eq 2 }">
<jsp:include page="../ptNav.jsp" />
</c:if>

<div class="outer">
	<div class="content2">
		<div class="board-post">
			<div class="sub_text_area" style="diplay: inline-block; width: 100%;">
				<p
					style="font-size: 16px; font-weight: 900; text-align: left; line-height: '2'; /*  border:1px solid black;  */ margin-top: 20px; margin-bottom: 20px;">
					1:1 문의게시판</p>
			</div>

			<div class="board-post-list table-responsive">
				<form action="qinsert.do" method="post" id="postInsert">
					<!-- 문의사항 작성자 hidden으로 보낼 것. -->
					<input type="hidden" name="userNum" value="${loginUser.userNum }">
					<!-- 텍스트데이터... -->
					<input type="hidden" name="content" value="11">
					<table class="qna_table table table-sm">
						<tr class="firstTr">
							<th class="sub_cols">제목</th>
							<td>
								<!-- 제목 -->
								<input class="qTitle" type="text" name="title" required>
							</td>
							<th class="sub_cols">카테고리</th>
							<td>
								<!-- 카테고리 -->
								<select class="custom-select" name="cate">
									<option value="1">관리자에게 문의</option>
									
									<c:if test="${ loginUser.status eq 2 }">
										<option value="2">트레이너에게 문의</option>
									</c:if>
									
								</select>
							</td>
						</tr>
						<tr>
							<th class="sub_cols">내용</th>
							<td colspan="3">
								<!-- Include the Quill library -->
								<div id="editor-container" style="height: 500px;"></div>
								<div style="width: 100%;">
								
									<button class="submitBTN" onclick="getQuill()">작성하기</button>
							<button class="listBTN" type="button" onclick="location='qlist.do'">목록으로</button>
								</div>
					
								<div id="testBox"></div>
							</td>
						</tr>
					</table>

					<div class="form-group">

					</div>
				</form>
			</div>
		</div>
		<!-- content2 -->
	</div>
	</div>


	<script type="text/javascript">
	$(function(){
		$("#postInsert").submit(function(){
			var cate = $(".custom-select").val();
			if(cate == 0){
				alert("누구에게 문의할 건지 선택해주세요.")
				return false;
			}
		});
	});
	/* <!-- Initialize Quill editor --> */
	var quill = new Quill('#editor-container', {
		modules : {
			imageResize : {
				displaySize : true
			},
			toolbar : [
					[ {
						header : [ 1, 2, false ]
					} ],
					[ 'bold', 'italic', 'underline' ],
					[
							{
								color : [ "#000000", "#e60000",
										"#ff9900", "#ffff00",
										"#008a00", "#0066cc",
										"#9933ff", "#ffffff",
										"#facccc", "#ffebcc",
										"#ffffcc", "#cce8cc",
										"#cce0f5", "#ebd6ff",
										"#bbbbbb", "#f06666",
										"#ffc266", "#ffff66",
										"#66b966", "#66a3e0",
										"#c285ff", "#888888",
										"#a10000", "#b26b00",
										"#b2b200", "#006100",
										"#0047b2", "#6b24b2",
										"#444444", "#5c0000",
										"#663d00", "#666600",
										"#003700", "#002966",
										"#3d1466", 'custom-color' ]
							},
							{
								background : [ "#000000", "#e60000",
										"#ff9900", "#ffff00",
										"#008a00", "#0066cc",
										"#9933ff", "#ffffff",
										"#facccc", "#ffebcc",
										"#ffffcc", "#cce8cc",
										"#cce0f5", "#ebd6ff",
										"#bbbbbb", "#f06666",
										"#ffc266", "#ffff66",
										"#66b966", "#66a3e0",
										"#c285ff", "#888888",
										"#a10000", "#b26b00",
										"#b2b200", "#006100",
										"#0047b2", "#6b24b2",
										"#444444", "#5c0000",
										"#663d00", "#666600",
										"#003700", "#002966",
										"#3d1466", 'custom-color' ]
							} ], [ 'image' ]

			]
		},

		theme : 'snow' // or 'bubble'
	});
	function getQuill() {
		var quill_object = quill.container.firstChild.innerHTML;
		$("input[name=content]").val(quill_object);
		//insert 폼 제출
		$("#postInsert").submit();
	}

	</script>
	
	
	<jsp:include page="../footer.jsp" />
</body>
</html>