<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body{
	background: rgb(240, 240, 240) !important;
	margin:auto;
}

.csCenter{
    background: #64c8fa;
}
.outer {
	/*min-height: 600px;
	width: 1200px; */
	/* border: 1px solid green; */
	display:inline-block !important;
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
.outer:after,
.outer:before {
  background: #e6e6e6;
  content: '';
  height: 50px;
  position: absolute;
  top: -25px;
  width: 100px;
  box-shadow: 0 5px 10px -7px hsla(0, 0% ,0%, 0.5);
}
.outer:after {
  left: -50px;
  transform: rotate(-45deg);
}
.outer:before {
  right: -50px;
  transform: rotate(45deg);
}

/* 게시판부분 */
.board-post {
	display:inline-block;
	width: 100%;
	padding: 0px;
	margin: 0px;
	height: auto;
	text-align: center;
	padding-right: 5%;
	padding-left: 5%;
	/* border:1px solid blue; */
}

/* 보드포스트 안쪽 div */
.board-post-list {
	float: left;
	margin-top: 10px;
	margin-bottom: 10px;
	/* border: 1px solid red; */
}

/* 제목만 왼쪽정렬 */
.tdTitle {
	text-align: left;
	padding-left: 10px !important;
}

.margin-padding-zero {
	margin: 0;
	padding: 0;
}

.postRow:hover {
	background-color: rgb(255, 243, 239);
}

.thNum{
	width:70px;

}
.thWriter{
	width: 80px;
}
.thStatus{
	width: 80px;
}
.thDate {
	width: 100px !important;
}
.thCate{
	width: 90px;
}
.admin_side_div {
	border: 1px solid black;
}

.side_txt_div1 {
	padding: 15px 5px 5px 5px;
	font-size: 20px;
	font-weight: 700;
	text-align: center;
}
.qnaTable {
	width: 100% !important;
	border-top: 2px solid rgb(39, 165, 255) !important;
	/* border-bottom: 1px solid rgb(39, 165, 255); */
	border-left: none;
	border-right: none;
	/* line-height: 2; */
	padding: 0px !important;
	margin:0px !important;
}
.qnaTable tr{
	border-top: 1px solid lightgrey;
}
.qnaTable th {
	background: #f9f9f9;
	/* border-bottom: 1px solid rgb(39, 165, 255) !important; */
 	/* border-left: none;
	border-right: none; */
	padding-left: 20px !important; 
	font-size: 12px;
	height: 50px;
	vertical-align:middle !important;
}
.qnaTable tr:nth-last-of-type(2){
	border-bottom:1px solid rgb(39, 165, 255) !important;
}

.qnaTable td {
/*  	border-left: none;
	border-right: none;  */
/* 	border-top:none!important; */
	/* border-bottom: 1px solid lightgrey !important; */
	font-size: 12px;
	height: 35px;
	vertical-align:middle !important;
}





/*/////////// 페이지 스타일 */
.pagingDiv{
	display:inline-block;
	/* border: 1px solid red; */
	width: 100%;
}

.page-link {
	color: rgb(39, 165, 255) !important;
}

.page-link:toggle {
	background: rgb(39, 165, 255);
}

.page-item.active .page-link {
	background: rgb(39, 165, 255) !important;
	color: white !important;
	border: 1px solid rgb(39, 165, 255) !important;
}

.qnaBtn{
	/* display:inline-block; */
	background: rgb(39, 165, 255) !important;
}
.noticeBtn{
	background: lightgrey !important;
}
.nList_qListDiv{
	margin: 10px 10px 10px 20px;
}
.writeBtn{
	float: right;
	height: 40px !important;
	background-color: rgb(39, 165, 255) !important;
	color: white !important;
	border-radius: 0px !important;
}
.writeBtn:hover{
	background: #64c8fa !important;
	border: 1px solid #64c8fa !important;
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
	<!-- content2 -->
		<!-- 게시판 영역 -->
		<div class="content2">
			<br>
			<br>		
			<div class="nList_qListDiv btn-group">
			  <button type="button" class="btn btn-secondary noticeBtn nList_qList"
			  onclick="location.href = 'nlist.do'">공지</button>
			  
			  <!-- ///////문의버튼은 로그인 한 사람만 클릭 가능. -->
			  <button type="button" class="btn btn-secondary qnaBtn nList_qList"
			  onclick="location.href = 'qlist.do'">문의</button>
			 </div>
					

			<div class="board-post">
	
				<div class="sub_text_area" style="diplay:inline-block; width: 100%;/*  border:1px solid black; */">				
				<p style="font-size: 16px; font-weight: 900; text-align: left; line-height:'2';/*  border:1px solid black;  */margin-top:20px; margin-bottom:20px;">
				1:1 문의게시판</p>
				</div>
				<!-- 게시판 헤더 -->
				<div class=" board-post-list table-responsive"  style="margin:0px;">
					<table class="qnaTable">
						
							<tr>
								<th class="thNum" scope="col">번호</th>
								<th class="thCate" scope="col">카테고리</th>
								<th class="thTitle" scope="col">제목</th>
								<th class="thWriter" scope="col">작성자</th>
								<th class="thDate" scope="col">작성일</th>
								<th class="thStatus" scope="col">답변여부</th>
							</tr>
						
						
							<!-- 게시판이 있다면  -->
						<c:choose>
							<c:when test="${ !empty list }">
								<c:forEach var="q" items="${ list }">
										<c:url var="qdetail" value="qdetail.do">
											<c:param name="askNum" value="${ q.askNum }" />
											<c:param name="page" value="${ pi.currentPage }" />
										</c:url>								
								<tr class="postRow" onclick='location.href="${ qdetail }"'>
									<td class="tdNum" id="${ q.askNum }">${q.askNum }</td>
									
									<c:if test="${ q.cate eq 1 }">
									<td class="tdCate" id="${ q.cate }">관리자에게</td>
									
									</c:if>
									<c:if test="${ q.cate eq 2 }">
									<td class="tdCate" id="${ q.cate }">트레이너에게</td>
									
									</c:if>
									<c:if test="${ q.cate eq 0 }">
									<td class="tdCate" id="${ q.cate }">대상없음</td>
									
									</c:if>
									<td class="tdTitle">&nbsp;&nbsp;&nbsp;${ q.title }</td>
									<td class="tdmId">${ q.userId }</td>
									
									
									<td class="tdDate">${ q.writeDate }</td>
									<td class="thStatus">${ q.astatus }</td>
								</tr>
								</c:forEach>
							</c:when>
						<c:otherwise>
						<!-- 게시판이 없다면 -->
							<tr class="postRow">
 								<td colspan="6">
									<p style="margin:0;">문의사항이 없습니다.</p>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
							<tr>
								<td colspan="6">
										<button class="btn writeBtn" type="button"
											onclick="location.href = 'qinsertView.do'">문의하기</button>
								</td>
							</tr>
					
					</table>
				</div>
		<br>

		<br>
				
					<div class="pagingDiv"><!-- 페이징구역 -->
					<nav aria-label="..."
						style="display: inline-block; margin-top: 10px; margin-bottom: 10px;"
						class="paging_nav">
						<ul class="pagination pagination-sm  justify-content-center"
							style="margin: 0;">

							<!-- 이전 페이지로 (<) -->
							<c:if test="${ pi.currentPage <= 1 }">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">&laquo;</a></li>
							</c:if>

							<c:if test="${ pi.currentPage > 1 }">
								<li class="page-item"><c:url var="before" value="qlist.do">
										<c:param name="page" value="${ pi.currentPage -1 }" />
									</c:url> <a class="page-link" href="${ before }" tabindex="-1">&laquo;</a>
								</li>
							</c:if>
							<!-- 이전 페이지로  끝 -->


							<!--  페이지 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<li class="page-item active">
										<a class="page-link pageList"
										href='#' style="text-decoration: none;">${ p }</a>
									</li>
								</c:if>

								<c:if test="${ p ne pi.currentPage }">
									<li class="page-item ">
										<c:url var="pagination" value="qlist.do">
											<c:param name="page" value="${ p }" />
										</c:url> <a class="page-link pageList" href="${ pagination }">${ p }</a>
									</li>
								</c:if>

							</c:forEach>
							<!--  페이지 목록 끝 -->


							<!-- 다음 페이지로(>) -->
							<c:if test="${  pi.currentPage >= pi.maxPage }">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">&raquo;</a></li>
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<li class="page-item"><c:url var="after" value="nlist.do">
										<c:param name="page" value="${ pi.currentPage + 1 }" />
									</c:url> <a class="page-link" href="${ after }">&raquo;</a></li>
							</c:if>
							<!-- 다음페이지 끝 -->
						</ul>
					</nav>
				</div><!-- 페이징구역 끝-->
			</div>
		</div><!-- content2 -->

		</div><!-- outer끝 -->
<!-- 	<script>
	$(function(){
		$(".pageList").click(function(){
    		var page = $(this).text();
    	});
    		
    	$(".postRow").click(function(){
            $(this).each(function(){
            	var index = $(this).children().first().attr('id'); 
                console.log(index);
                goPost(index);
             });
        });	
    });
    	
	function goPost(index){
  		location.href="userQnaDetail.do";
	}
	</script> -->
		<jsp:include page="../footer.jsp" />
</body>
</html>