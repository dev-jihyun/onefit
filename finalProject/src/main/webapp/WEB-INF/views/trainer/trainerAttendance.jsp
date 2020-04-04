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
.attendancy{
	background:#64c8fa;
}
/*회원 테이블 부트스트랩*/
	.table-wrapper {
        background: white;
        padding: 20px 25px;
        margin: 30px auto;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-wrapper .btn {
		float: right;
		color: #333;
    	background-color: #fff;
		border-radius: 3px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-wrapper .btn:hover {
        color: #333;
		background: #f2f2f2;
	}
	.table-wrapper .btn.btn-primary {
		color: #fff;
		background: #03A9F4;
	}
	.table-wrapper .btn.btn-primary:hover {
		background: #03a3e7;
	}
	.table-title .btn {		
		font-size: 13px;
		border: none;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
	.table-title {
		color: #fff;
		background: #4b5366;		
		padding: 16px 25px;
		margin: -20px -22px 10px 0px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.show-entries select.form-control {        
        width: 60px;
		margin: 0 5px;
	}
	.table-filter .filter-group {
        float: right;
		margin-left: 15px;
    }
	.table-filter input, .table-filter select {
		height: 34px;
		border-radius: 3px;
		border-color: #ddd;
        box-shadow: none;
	}
	.table-filter {
		padding: 5px 0 15px;
		border-bottom: 1px solid #e9e9e9;
		margin-bottom: 5px;
	}
	.table-filter .btn {
		height: 34px;
	}
	.table-filter label {
		font-weight: normal;
		margin-left: 10px;
	}
	.table-filter select, .table-filter input {
		display: inline-block;
		margin-left: 5px;
	}
	.table-filter input {
		width: 200px;
		display: inline-block;
	}
	.filter-group select.form-control {
		width: 110px;
	}
	.filter-icon {
		float: right;
		margin-top: 7px;
	}
	.filter-icon i {
		font-size: 18px;
		opacity: 0.7;
	}	
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 60px;
	}
	table.table tr th:last-child {
		width: 80px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.view {        
		width: 30px;
		height: 30px;
		color: #2196F3;
		border: 2px solid;
		border-radius: 30px;
		text-align: center;
    }
    table.table td a.view i {
        font-size: 22px;
		margin: 2px 0 0 1px;
    }   
	table.table .avatar {
		height:40px;
		width:40px;
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
	.status {
		font-size: 30px;
		margin: 2px 2px 0 0;
		display: inline-block;
		vertical-align: middle;
		line-height: 10px;
	}
    .text-success {
        color: #10c469;
    }
    .text-info {
        color: #62c9e8;
    }
    .text-warning {
        color: #FFC107;
    }
    .text-danger {
        color: #ff5b5b;
    }
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    
    .pagination li p {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    } 
    
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
	.pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }
    /*크기 맞추기 위해서*/
    .real-container{
    	height:100%;
    	width:98%;
    	padding-top:1%;
    	margin-top:5.5%;
    	background:white;
    	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    }
    .real-table-wrapper{
    	padding-right:22px;
    	
    }
    #date{
    	font-size:1.5rem;
    }
</style>
<!-- 회원 목록 부트스트랩 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 페이징 버튼 부분 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><base>
</head>
<body>
	<jsp:include page="../common/trainerNav.jsp"/>
	<div class="today-container">
	    <div class="real-container">
	        <div class="real-table-wrapper">
	            <div class="table-title">
	                <div class="row">
	                    <div class="col-sm-4">
	                    	<c:choose>
	                    		<c:when test="${ todayLesson == 'nothing' }">
	                    			<input id="date" type="date" onchange="dateChange(event)" value="${ date }"/>
	                    		</c:when>
	                    		<c:otherwise>
									<input id="date" type="date" onchange="dateChange(event)" value="${ todayLesson[0].scDate }"/>	                    			
	                    		</c:otherwise>
	                    	</c:choose>
						</div>
						<div class="col-sm-8">						
							<a href="trainerAttendance.do" class="btn btn-primary float-right"><i class="material-icons">&#xE863;</i> <span>새로고침</span></a>
							<c:url value="sendExcel.do" var="se">
								<c:param name="place" value="trainerAttendance.do"/>
		                    	<c:choose>
		                    		<c:when test="${ todayLesson == 'nothing' }">
		                    			<c:param name="date" value="${ date }" />
		                    			<input id="date" type="date" onchange="dateChange(event)" value="${ date }"/>
		                    		</c:when>
		                    		<c:otherwise>
		                    			<c:param name="date" value="${ todayLesson[0].scDate }" />                   			
		                    		</c:otherwise>
		                    	</c:choose>								
							</c:url>
							<a href="${ se }" class="btn btn-info float-right"><i class="material-icons">&#xE24D;</i> <span>엑셀로 변환하기</span></a>
						</div>
	                </div>
	            </div>
				<div class="table-filter">
					<div class="row">
	                    <div class="col-sm-12">
							<div class="filter-group">
								<label>이름</label>
								<input type="text" class="form-control">
								<button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
							</div>
							<span class="filter-icon"><i class="fa fa-filter"></i></span>
	                    </div>
	                </div>
				</div>
	            <table class="table table-striped table-hover tableSize">
	                <thead>
	                    <tr>
	                        <th>#</th>
	                        <th>회원명</th>
							<th>시간</th>						
	                        <th>핸드폰번호</th>						
							<th>남은 횟수</th>
							<th>출석 체크</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:choose>
	                		<c:when test="${ todayLesson == 'nothing' }">
	                			<tr>
	                				<td colspan="6">수업이 없습니다.</td>
	                			</tr>
	                		</c:when>
	                		<c:otherwise>
			                	<c:forEach var="lesson"  items="${ todayLesson }" varStatus="status">
			                		<tr>
			                			<td>${ status.count }</td>
			                			<td><a href="#"><img src="resource/profileImage/${ lesson.chName }" class="avatar" alt="Avatar">${ lesson.userName }</a></td>
			                			<td>${ lesson.scStartString }~${ lesson.scEndtString }</td>
			                			<td>${ lesson.phone }</td>
			                			<td>${ lesson.count }/${ lesson.totalCount }</td>
			                			<c:url value="doAttendance.do" var="goCheck">
			                				<c:param name="date" value="${ lesson.scDate }" />
			                				<c:param name="userNum" value="${ lesson.userNum }" />
			                				<c:param name="userName" value="${ lesson.userName }" />
			                			</c:url>
			                			<td><a href="${ goCheck }" class="view goAttendance" title="View Details" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>
			                		</tr>
			                	</c:forEach> 	                		
	                		</c:otherwise>
	                	</c:choose>                                      
	                </tbody>
	            </table>
	            
	            <!-- 페이징 부분 시작 -->
				<div class="clearfix">
	                <ul class="pagination">
	                    <li class="page-item disabled">
	                    	<c:choose>
	                    		<c:when test="${ pi.currentPage <=1 }">
	                    			<p>이전</p>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<c:url var="before" value="trainerAttendance.do">
	                    				<c:param name="page" value="${ pi.currentPage - 1 }" />
	                    			</c:url>
	                    			<a href="${ before }">이전</a>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </li>
	                    <!-- forEach 시작 -->
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<c:if test="${ p eq pi.currentPage }">
	                    		<li class="page-item" active>
	                    			<font class="page-link"><b>${ p }</b></font>
	                    		</li>
	                    	</c:if>
	                    	<c:if test="${ p ne pi.currentPage }">
	                    		<c:url var="pagination" value="trainerAttendance.do">
	                    			<c:param name="page" value="${ p }" />
	                    		</c:url>
	                    		<li class="page-item">
	                     			<a href="${ pagination }" class="page-link">${ p }</a>                   			
	                    		</li>
	                    	</c:if>
	                    </c:forEach>
						<!-- forEach 끝 -->
						
	                    <li class="page-item">
	                    	<c:choose>
	                    		<c:when test="${ pi.currentPage >=pi.maxPage }">
	                    			<p>다음</p>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<c:url var="after" value="trainerAttendance.do">
	                    				<c:param name="page" value="${ pi.currentPage + 1 }" />
	                    			</c:url>
	                    			<a href="${ before }" class="page-link">다음</a>
	                    		</c:otherwise>
	                    	</c:choose>                    	
	                    </li>
	                </ul>
	            </div>
	            <!-- 페이징 부분 끝 -->	            
	        </div>
	    </div><!-- 표 끝 -->
	</div>
	<script>
	$(function(){
		$(".goAttendance").click(function(){
			location.href="doAttendance.do";
		});
		
		
	});
	
	//날짜를 바꿀때마다
	function dateChange(e){
		location.href="trainerAttendance.do?date="+e.target.value;
	}
	
	</script> 
</body>
</html>