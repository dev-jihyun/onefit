<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

.submitBTN {
	float: right;
}

.updateBox {
	width: 80%;
	padding-left: 3%;
	padding-right: 3%;
	padding-top: 3%;
	margin: auto;
}

.qna_table {
	width: 1050px;
	height: 700px;
	vertical-align: middle !important;
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
	<jsp:include page="../common/userNav.jsp"/> 
	<div class="content2">
		<div class="board-post">
			<div class="sub_text_area" style="diplay: inline-block; width: 100%;">
				<p
					style="font-size: 16px; font-weight: 900; text-align: left; line-height: '2'; /*  border:1px solid black;  */ margin-top: 20px; margin-bottom: 20px;">
					1:1 문의게시판</p>
			</div>

			<div class="board-post-list table-responsive">
				<form action="userQnaInsert.do" method="post" id="postInsert">
					<table class="qna_table table table-sm">
						<tr class="firstTr">
							<th class="sub_cols">제목</th>
							<td>
								<!-- 제목 쓰는 칸 --> <input class="qTitle" type="text" name="qTitle"
								required>
							</td>
							<th class="sub_cols">카테고리</th>
							<td><select class="custom-select" name="qCate">
									<option value="없음" selected>--선택--</option>
									<option value="PT">결제-PT</option>
									<option value="헬스">결제-헬스장</option>
									<option value="건의">건의</option>
									<option value="트레이너">트레이너</option>
									<option value="시설">시설</option>
							</select></td>
						</tr>
						<tr>
							<th class="sub_cols">내용</th>
							<td colspan="3">
								<!-- Include the Quill library -->
								<div id="editor-container" style="height: 500px;">
								
								</div>
								<div style="width: 100%;">
								
								</div>
								<div id="testBox">
								
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<button class="btn btn-primary submitBTN" onclick="getQuill()">작성하기</button>
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
	<script>
		/* 모달 */
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
									color : [ "#000000", "#e60000", "#ff9900",
											"#ffff00", "#008a00", "#0066cc",
											"#9933ff", "#ffffff", "#facccc",
											"#ffebcc", "#ffffcc", "#cce8cc",
											"#cce0f5", "#ebd6ff", "#bbbbbb",
											"#f06666", "#ffc266", "#ffff66",
											"#66b966", "#66a3e0", "#c285ff",
											"#888888", "#a10000", "#b26b00",
											"#b2b200", "#006100", "#0047b2",
											"#6b24b2", "#444444", "#5c0000",
											"#663d00", "#666600", "#003700",
											"#002966", "#3d1466",
											'custom-color' ]
								},
								{
									background : [ "#000000", "#e60000",
											"#ff9900", "#ffff00", "#008a00",
											"#0066cc", "#9933ff", "#ffffff",
											"#facccc", "#ffebcc", "#ffffcc",
											"#cce8cc", "#cce0f5", "#ebd6ff",
											"#bbbbbb", "#f06666", "#ffc266",
											"#ffff66", "#66b966", "#66a3e0",
											"#c285ff", "#888888", "#a10000",
											"#b26b00", "#b2b200", "#006100",
											"#0047b2", "#6b24b2", "#444444",
											"#5c0000", "#663d00", "#666600",
											"#003700", "#002966", "#3d1466",
											'custom-color' ]
								} ], [ 'image' ]

				]
			},

			theme : 'snow' // or 'bubble'
		});
		function getQuill() {
			var quill_object = quill.container.firstChild.innerHTML;
			$("input[name=quillData]").val(quill_object);
			//insert 폼 제출
			$("#postInsert").submit();
		}

		function update() {
			var quill_object = quill.container.firstChild.innerHTML;
			$("input[name=quillData]").val(quill_object);

			$("#postInsert").submit();
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>