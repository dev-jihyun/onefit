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
.memberList{
	background:#64c8fa;
}
/*부트스트랩 부분*/
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
    	width:98%;
    	padding-top:1%;
    	margin-top:1%;
    	background:white;
    	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    }
    .real-table-wrapper{
    	padding-right:22px;
    	
    }
/* 최근 등록 회원 리스트 부트스트랩*/
.user-widget-2 .media {
    margin-bottom: 20px;
}

.user-widget-2 h5 {
    font-size: 1rem;
    font-weight: 400;
    margin-bottom: 10px;
}

.user-widget-2 p {
    font-size: 1rem;
    margin-bottom: 10px;
}

.user-widget-2 p .badge {
    margin-right: 10px;
}
.imgSize{
	height:65px;
	width:65px;	
}
/*위치 수정하기 위해 있는것*/
.float-right{
	float:right;
}
.float-left{
	float:left;
}
.margin-left{
	margin-left:15px;
}
.margin-top{
	margin-top:2%;
}
.center{
	text-align:center;
}
/*나머지 정보 넣는 부분*/
.rest-area{
	margin-top:1%;
	height:40%;
	width:100%;
	margin-bottom:4%;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 40%;
  border-radius: 5px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
/*총 회원수*/
.memberCount{
	border:1px solid black;
	height:100%;
	width:25%;
	margin-right:4%;
}
.memberCountIcon{
	width:180px;
	height:180px;
	margin-top:5%;
	margin-left:25%;
}
/*이번달 등록 회원*/
.thisMonthMember{
	padding:2%;
	overflow:scroll;
	border:1px solid black;
	height:100%;
	width:33%;
	overflow-x:hidden;
	margin-right:3%;
}
/* Customize website's scrollbar like Mac OS
Not supports in Firefox and IE */

/* total width */
.thisMonthMember::-webkit-scrollbar {
    background-color:#fff;
    width:16px;
}

/* background of the scrollbar except button or resizer */
.thisMonthMember::-webkit-scrollbar-track {
    background-color:#fff
}

/* scrollbar itself */
.thisMonthMember::-webkit-scrollbar-thumb {
    background-color:#babac0;
    border-radius:16px;
    border:4px solid #fff
}

/* set button(top and bottom of the scrollbar) */
.thisMonthMember::-webkit-scrollbar-button {display:none}



/*건강정보 등록 해야할 회원*/
.memberHealth{
	padding:2%;
	overflow:scroll;
/* 	border:1px solid black; */
	height:100%;
	width:33%;
	overflow-x:hidden;
	margin-right:2%;
}
/* Customize website's scrollbar like Mac OS
Not supports in Firefox and IE */

/* total width */
.memberHealth::-webkit-scrollbar {
    background-color:#fff;
    width:16px;
}

/* background of the scrollbar except button or resizer */
.memberHealth::-webkit-scrollbar-track {
    background-color:#fff
}

/* scrollbar itself */
.memberHealth::-webkit-scrollbar-thumb {
    background-color:#babac0;
    border-radius:16px;
    border:4px solid #fff
}
.healthBtn:hover{
	cursor:pointer;
}
/* set button(top and bottom of the scrollbar) */
.memberHealth::-webkit-scrollbar-button {display:none}

/*모달창 */
    .modal-title{
    	font-weight: bold;
    	/* border:1px solid black !important; */
    	text-align: center !important;
    	width: 100%;
    	padding-top: 7px;
    	vertical-align:middle;
    	float:left !important;
    	
    }
    .modal_close{
    	line-height:1 !important;
    	margin:0 !important;
    	/* border:1px solid black !important; */
    	float:right !important;
    	display: inline-block !important;
    	padding: 5px !important;
    }
    
    .modal-header{
    	float:left;
    }
    
    .modal_table tr{
    	height: 40px;
    }
 .modal_table th{
    	width: 150px !important;
    }
       
    .modal_select_btn{
    	text-align:center !important;;
		border-radius: 5px !important;
		background: #27a5ff !important;
		color: white !important;
		border: 1px solid #27a5ff !important;
		width: 80px !important;
		height: 30px !important;
		line-height: 0  !important;
    }
    
    .modal_health_div input[type=text]{
    	width: 40px;
    }
    
    .modal-content{
    width: 300px !important;
    }
    .hidden{
    	display:none;
    }
</style>
<!-- 모달창 부트스트랩 -->

<!--회원목록 부트스트랩 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 페이징 버튼 부분 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><base>
<!-- 최근 등록 회원 부트스트랩 -->
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
</head>
<body>
	<jsp:include page="../common/trainerNav.jsp"/>
	<!-- 회원목록 테이블 -->
    <div class="real-container">
    	<!-- 회원 목록 표 시작 -->
        <div class="real-table-wrapper">
        	<!-- 회원 테이블 제목 부분 시작 -->
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-4">
						<h2>회원목록</h2>
					</div>
					<div class="col-sm-8">						
						<a href="trainerMemberList.do" class="btn btn-primary float-right"><i class="material-icons">&#xE863;</i> <span>새로고침</span></a>
						<c:url value="sendExcel.do" var="se">
							<c:param name="place" value="trainerMemberList.do"/>
						</c:url>
						<a href="${ se }" class="btn btn-info float-right"><i class="material-icons">&#xE24D;</i> <span>엑셀로 변환하기</span></a>
					</div>
                </div>
            </div>
            <!-- 회원 테이블 제목 부분 끝 -->
            
            <!-- 회원 목록 이름 검색 부분  시작-->
			<div class="table-filter">
				<div class="row">
                    <div class="col-sm-12">
                    	<form action="searchName.do" onsubmit="return checkName()">
							<div class="filter-group">
								<label>이름</label>
								<input id="nameArea" type="text" name="memberName" class="form-control">
								<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
							</div>
							<span class="filter-icon"><i class="fa fa-filter"></i></span>
                    	</form>
                    </div>
                </div>
			</div>
			<!-- 회원 목록 이름 검색 부분 끝-->
			<!-- 회원 목록 부분 시작 -->
            <table class="table table-striped table-hover tableSize">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>회원명</th>
						<th>시작일</th>						
                        <th>핸드폰번호</th>						
						<th>남은 횟수</th>
						<th>건강 정보</th>
                    </tr>
                </thead>
                <tbody>
                	<!-- 총 회원수 만큼 돌려야 함 -->
                	<c:choose>
                		<c:when test="${ trainerMemberInform['tml'] != 'nothing' }"><!-- 비어있지 않을때 진입 -->
                		    <c:forEach var="member" items="${ trainerMemberInform['tml'] }" varStatus="status">
	                			<tr>
	                				<td>${ status.count }</td>
	                				<td><img src="resource/profileImage/${ member.getChName() }" class="avatar" alt="Avatar">${ member.getUserName() }</td>
	                				<td>${ member.getPayDate() }</td>
	                				<td>${ member.getPhone() }</td>
	                				<td>${ member.getCount() } / ${ member.getTotalCount() }</td>
	                				<td><a href="javascript:memberClick(${ member.getUserNum() })" class="view healthEdit" title="View Details" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></a></td>
	                			</tr>	
	                		</c:forEach>
                		</c:when>
                		<c:otherwise>
                			<tr>
                				<td colspan="6">회원이 아직 없습니다.</td>
                			</tr>
                		</c:otherwise>
                	</c:choose>                                        
                </tbody>
            </table>
            <!-- 회원 목록 부분 끝 -->
            <!-- 페이징 부분 시작 -->
			<div class="clearfix">
                <ul class="pagination">
                    <li class="page-item disabled">
                    	<c:choose>
                    		<c:when test="${ pi.currentPage <=1 }">
                    			<p>이전</p>
                    		</c:when>
                    		<c:otherwise>
                    			<c:url var="before" value="trainerMemberList.do">
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
                    		<c:url var="pagination" value="trainerMemberList.do">
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
                    			<c:url var="after" value="trainerMemberList.do">
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
        <!-- 회원 목록 표 끝 -->
    </div>
	<!-- 회원목록 테이블 끝 -->
    <hr>
    <div class="rest-area">
    	<!-- 총 회원 부분 시작 -->
    	<div class="memberCount float-left rest-info card">
    		<dl>
				<dt>
					<img class="memberCountIcon" src="resource/photo/trainer/groupColor.png"/>
				</dt>
				<c:choose>
					<c:when test="${ trainerMemberInform['tml'] != 'nothing' }">
						<dd>
							<h1 class="center">회원 : ${ trainerMemberInform['tml'].size() }명</h1>
						</dd>
					</c:when>
					<c:otherwise>
						<dd>
							<h1 class="center">회원 : 0명</h1>
						</dd>
					</c:otherwise>
				</c:choose>
			</dl>    		
    	</div>
    	<!-- 총 회원 부분 끝 -->
    	<div class="thisMonthMember float-left rest-info card">
    		<h4>이번달 등록 회원</h4>
    		<hr>
    		<!-- 리스트 부분 -->
			<div class="row">
			    <div class="col">
			        <div class="user-widget-2">
			            <ul class="list-unstyled">
			            	<c:choose>
			            		<c:when test="${ trainerMemberInform['newMember'] != 'nothing' }">
			            			<c:forEach var="nm" items="${ trainerMemberInform['newMember'] }">
						                <li class="media margin-top">
						                    <img class="rounded-circle d-flex align-self-center imgSize" src="resource/profileImage/${ nm.getChName() }" alt="">
						                    <div class="media-body margin-left margin-top">
						                    	<h5>${ nm.getUserName() }</h5>
						                        <p><span class="badge badge-outline badge-sm badge-info badge-pill">${ nm.getPhone() }</span></p>
						                    </div>
						                </li>			            				
			            			</c:forEach>
			            		</c:when>
			            		<c:otherwise>
			            			<li class="media margin-top">
			            				<h5>회원이 없습니다ㅜㅜ</h5>
			            			</li>
			            		</c:otherwise>
			            	</c:choose>
			            </ul>
			        </div>
			    </div>
			</div>
			<!-- 리스트 부분  끝-->
    	</div>
    	<div class="memberHealth float-left rest-info card">
    		<!-- 건강정보 입력 안한 회원 리스트 -->
    		<h4>건강정보 갱신 필요 회원</h4>
    		<hr>
			<div class="row">
			    <div class="col">
			        <div class="user-widget-2">
			            <ul class="list-unstyled">
			            	<c:choose>
			            		<c:when test="${ trainerMemberInform['needUpdate'] != 'nothing' }">
			            			<c:forEach var="nu" items="${ trainerMemberInform['needUpdate'] }">
						                <li class="media margin-top">
						                    <img class="rounded-circle d-flex align-self-center imgSize" src="resource/profileImage/${ nu.getChName() }" alt="">
						                    <div class="media-body margin-left margin-top healthBtn" onclick="memberClick(${ nu.getUserNum() })">
						                    	<h5>${ nu.getUserName() }</h5>
						                    	<c:choose>
						                    		<c:when test="${ nu.getCheckDate() == null }">
						                    			<p><span class="badge badge-outline badge-sm badge-info badge-pill">아직 등록 안함</span></p>
						                    		</c:when>
						                    		<c:otherwise>
						                    			<p><span class="badge badge-outline badge-sm badge-info badge-pill">${ nu.getCheckDate() }</span></p>
						                    		</c:otherwise>
						                    	</c:choose>
						                    </div>
						                </li>			            				
			            			</c:forEach>
			            		</c:when>
			            		<c:otherwise>
			            			<li class="media margin-top">
			            				<h5>없습니다.</h5>
			            			</li>			            			
			            		</c:otherwise>
			            	</c:choose>
			            </ul>
			        </div>
			    </div>
			</div>    		
    		<!-- 건강정보 입력 안한 회원 리스트 끝-->
    	</div>
    </div>
    <!-- 나머지 정보 입력 div -->
    <!-- 모달창 -->
	<div class="modal fade ggg" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="false">
		<div class="modal-dialog modal-dialog-centered" style="width:300px;" role="document">
			<div class="modal-content">
				<div class="modal-header">
				<c:choose>
					<c:when test="${ trainerInforms['tmh'].getHeight() != null }"><!-- pt회원의 건강정보가 비어있지 않을때 -->
						<p class="modal-title" id="exampleModalCenterTitle">건강정보 수정</p>
					</c:when>
					<c:otherwise>
						<p class="modal-title" id="exampleModalCenterTitle">건강정보 입력</p>
					</c:otherwise>
				</c:choose>
					<button type="button" class="close modal_close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
				<form method="post" onsubmit="return validate()" action="updateTrainerMemberHealth.do">
		      		<div class="modal-body">
		      			<div class="modal_health_div">
								<table align="center" class="table table-sm modal_table">
									<tr>
										<th>몸무게 </th>
										<td><input id="memberWeight" name="weight" type="text" class="weight" placeholder="">kg</td>
									</tr>
									<tr>
										<th>키 </th>
										<td><input id="memberHeight" name="height" type="text" class="height" placeholder="">cm</td>
									</tr>
									<tr>
										<th>체지방 </th>
										<td><input id="memberFat" name="fat" type="text" class="fat" placeholder="">%</td>
									</tr>
									<tr>
										<th>목표 체중 </th>
										<td><input id="memberGoal" name="goal" type="text" class="goal" placeholder="">kg</td>
									</tr>
									<tr>
										<th>운동 목적</th>
										<td>
											<select id="select_id" name="reason">
												<option value="다이어트">다이어트</option>
												<option value="유지">유지</option>
												<option value="린매스업">린매스업</option>
												<option value="벌크업">벌크업</option>
											</select>
										</td>
									</tr>																	
								</table>
								<input id="userNum" type="text" name="userNum" class="hidden"/>
						</div>
					</div>
		    		<div class="modal-footer">
		        		<!-- <button type="button" class="btn btn-secondary modal_close" data-dismiss="modal">Close</button> -->
		        		<button type="submit" class="btn btn-primary modal_health_select_btn">확인</button>
		    		</div>
	    		</form>
	    	</div>
	  	</div>
	</div>
	<script>
	$(function(){
		
		$(".healthBtn").click(function(){
			
		});
	});
	
	function memberClick(ptMember){ //회원 목록에서 건강정보 버튼을 눌렀을때 해당 회원의 회원 번호를 가져옴
		$(".ggg").modal("show");
		console.log(ptMember);
		//받아온 ptMember의 번호를 가지고 DB ajax로 한번 갓다가 와야 할거 같다.
		$.ajax({
			url:"getPtMemberHealth.do",
			data:{userNum:ptMember},
			dataType:"json",
			success:function(data){
				console.log(data);
				$("#userNum").val(data.userNum);
				if(data.weight == 0 || data.height == 0 || data.fat == 0 || data.goal == 0 || data.reason == ""){
					alert(data.userName+"님의 건강정보가 비어있음");
				}else{
					$("#memberWeight").val(data.weight);
					$("#memberHeight").val(data.height);
					$("#memberFat").val(data.fat);
					$("#memberGoal").val(data.goal);
					$("#memberGoal").val(data.goal);
					$("#select_id").val(data.reason).prop("selected", true);
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	//건강정보를 입력하기전에 유효성 검사하는 부분
	function validate(){
		if($("#memberWeight").val()==""){
			alert("몸무게를 입력해주세요.")
			$("#memberWeight").focus();
			return false;
		}
		if($("#memberHeight").val()==""){
			alert("키를 입력해주세요.")
			$("#memberHeight").focus();
			return false;
		}
		if($("#memberFat").val()==""){
			alert("체지방을 입력해주세요.")
			$("#memberFat").focus();
			return false;
		}
		
		return true;
	}
	
	function checkName(){
		if($("#nameArea").val() == ""){
			alert("이름을 입력하세요.");
			$("#nameArea").focus();
			return false;
		}
		return true;
	}
	</script> 
</body>
</html>