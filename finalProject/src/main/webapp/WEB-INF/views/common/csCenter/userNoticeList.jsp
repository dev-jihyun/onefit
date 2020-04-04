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
body {
	background: rgb(240, 240, 240) !important;
	margin: auto;
}

.csCenter {
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
.content2 {
	/* order: 1px solid red; */
	
}

/* 게시판부분 */
.board-post {
	display: inline-block;
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

.thNum {
	width: 70px;
}

.thWriter {
	width: 80px;
}

.thCount {
	width: 80px;
}

.thDate {
	width: 100px !important;
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

.table-sm {
	border-top: 2px solid rgb(39, 165, 255) !important;
	border-bottom: 1px solid rgb(39, 165, 255);
	border-left: none;
	border-right: none;
	/* line-height: 2; */
	padding: 0px !important;
	margin: 0px !important;
}

.table-sm th {
	background: #f9f9f9;
	border-bottom: 1px solid rgb(39, 165, 255) !important;
	border-left: none;
	border-right: none;
	font-size: 12px;
	height: 50px;
	vertical-align: middle !important;
}

.table-sm td {
	border-left: none;
	border-right: none;
	border-top: none !important;
	border-bottom: 1px solid lightgrey !important;
	font-size: 12px;
	height: 35px;
	vertical-align: middle !important;
}

/*/////////// 페이지 스타일 */
.pagingDiv {
	display: inline-block;
	/* 	border: 1px solid red; */
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

.noticeBtn {
	/* display:inline-block; */
	background: rgb(39, 165, 255) !important;
}

.qnaBtn {
	background: lightgrey !important;
}

.nList_qListDiv {
	margin: 10px 10px 10px 20px;
}

#searchArea {
	display: inline-block;
	margin: 30px;
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
		<!-- <div class="pageName"><p>공지사항</p></div> -->
		<!-- content2 -->
		<!-- 게시판 영역 -->
		<div class="content2">
			<br>
			<br>
			<div class="nList_qListDiv btn-group">
				<button type="button"
					class="btn btn-secondary noticeBtn nList_qList"
					onclick="location.href = 'nlist.do'">공지</button>

				<!-- ///////문의버튼은 로그인 한 사람만 클릭 가능. -->
				<button type="button" class="btn btn-secondary qnaBtn nList_qList"
					onclick="location.href = 'qlist.do'">문의</button>
			</div>


			<div class="board-post">
							<div class="sub_text_area"
					style="diplay: inline-block; width: 100%;">
					<p
						style="font-size: 16px; font-weight: 900; text-align: left; line-height: '2'; /*  border:1px solid black;  */ margin-top: 20px; margin-bottom: 20px;">
						공지사항</p>
				</div>
				<!-- 게시판 헤더 -->
				<div class="board-post-list table-responsive" style="margin: 0px;">
					<table class="table table-sm" border="1">
						<thead>
							<tr>
								<th class="thNum" scope="col">번호</th>
								<th class="thTitle" scope="col">제목</th>
								<th class="thWriter" scope="col">작성자</th>
								<th class="thDate" scope="col">작성일</th>
								<th class="thCount" scope="col">조회</th>
							</tr>
						</thead>
						<tbody>
							<!-- 게시판이 있다면  -->
							<c:choose>
								<c:when test="${ !empty list }">
									<c:forEach var="n" items="${ list }">
										<!-- //////////공지사항 상세뷰로 가기위한 변수 설정(현재페이지, 공지사항번호) -->
										<c:url var="ndetail" value="ndetail.do">
											<c:param name="noticeNum" value="${ n.noticeNum }" />
											<c:param name="page" value="${ pi.currentPage }" />
											<c:param name="searchValue" value="${ search.searchValue }" />
										</c:url>
										<tr class="postRow" onclick='location.href="${ ndetail }"'>
											<td class="tdNum" id="${ n.noticeNum }">${ n.noticeNum }</td>
											<td class="tdTitle">${ n.title }</td>
											<td class="tdmNo">OneFit</td>
											<td class="tdDate">
												<fmt:formatDate value="${ n.writeDate }" pattern="yyyy-MM-dd" />
											</td>
											<td class="tdCount">${ n.count }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<!-- 게시판이 없다면 -->
									<tr class="postRow">
										<td colspan="5">
											<p style="margin: 0;">게시글 없음</p>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>


				<!-- 게시물 검색하기 -->
				<div id="searchArea" align="center">
					<form action="nsearch.do" name="searchForm" method="get">
						<select id="searchCondition" name="searchCondition">
							<option value="all"
								<c:if test="${ search.searchCondition == 'all'}">selected</c:if>>
								전체</option>
							<%-- <option value="writer"
				<c:if test="${ search.searchCondition == 'writer'}">selected</c:if>>
				작성자</option> --%>
							<option value="title"
								<c:if test="${ search.searchCondition == 'title'}">selected</c:if>>
								제목</option>
							<option value="content"
								<c:if test="${ search.searchCondition == 'content'}">selected</c:if>>
								내용</option>
						</select> <input type="search" name="searchValue"
							value="${ search.searchValue }">
						<button>검색</button>
						<br>

					</form>
				</div>
				<br>

				<div class="pagingDiv">
					<!-- 페이징구역 -->
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
								<li class="page-item"><c:url var="before" value="nlist.do">
										<c:param name="page" value="${ pi.currentPage -1 }" />
									</c:url> <a class="page-link" href="${ before }" tabindex="-1">&laquo;</a>
								</li>
							</c:if>
							<!-- 이전 페이지로  끝 -->


							<!--  페이지 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<li class="page-item active"><a class="page-link pageList"
										href='#' style="text-decoration: none;">${ p }</a></li>
								</c:if>

								<c:if test="${ p ne pi.currentPage }">
									<li class="page-item "><c:url var="pagination"
											value="nlist.do">
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
		</div>
		<!-- content2 -->
		<br>
		<br>
		<br>
		<br>
	</div>
	<!-- outer끝 -->

	<jsp:include page="../footer.jsp" />
</body>
</html>