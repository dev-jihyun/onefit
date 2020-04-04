<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.question{
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
    /*모달창*/
	.modal-dialog.modal-fullsize {
	  width: 100%;
	  height: 80%;
	}
	.modal-content.modal-fullsize {
	  height: auto;
	  min-height: 100%;
	  border-radius: 2%; 
	}
	/*모달 제목 부분*/
	#modalCenterTitle{
		font-size:2.2rem;
	}
	.modal-body-container{
		
	}
	/*모달창 내용 부분*/
	.twArea{
		width:100%;
		text-align:center;
	}

	.twArea th{
		background:#BDBDBD;
		border:1px solid gray;
	}
	.twArea tr{
		border:1px solid gray;
	}
	.twArea td{
		border:1px solid gray;
	}
	#questionContent{
		resize:none;
		width:100%;
		height:200px;
		overflow-y: scroll;
	}
	/* Customize website's scrollbar like Mac OS
	Not supports in Firefox and IE */
	
	/* total width */
	#questionContent::-webkit-scrollbar {
	    background-color:#fff;
	    width:16px;
	}
	
	/* background of the scrollbar except button or resizer */
	#questionContent::-webkit-scrollbar-track {
	    background-color:#fff
	}
	
	/* scrollbar itself */
	#questionContent::-webkit-scrollbar-thumb {
	    background-color:#babac0;
	    border-radius:16px;
	    border:4px solid #fff
	}
	/* set button(top and bottom of the scrollbar) */
	#questionContent::-webkit-scrollbar-button {display:none}

	/*모달창 답변 부분*/
	.answer-area p{
		font-size:1.5rem;
	}
	#realAnswer{
		resize:none;
		width:100%;
		height:200px;
		overflow-y: scroll;
	}
	/* Customize website's scrollbar like Mac OS
	Not supports in Firefox and IE */
	
	/* total width */
	#realAnswer::-webkit-scrollbar {
	    background-color:#fff;
	    width:16px;
	}
	
	/* background of the scrollbar except button or resizer */
	#realAnswer::-webkit-scrollbar-track {
	    background-color:#fff
	}
	
	/* scrollbar itself */
	#realAnswer::-webkit-scrollbar-thumb {
	    background-color:#babac0;
	    border-radius:16px;
	    border:4px solid #fff
	}
	/* set button(top and bottom of the scrollbar) */
	#realAnswer::-webkit-scrollbar-button {display:none}
	
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
		<div class="memberList-container">
			    <div class="real-container">
	        <div class="real-table-wrapper">
	            <div class="table-title">
	                <div class="row">
	                    <div class="col-sm-4">
							<h2>2020-02-13</h2>
						</div>
						<div class="col-sm-8">						
							<a href="#" class="btn btn-primary float-right"><i class="material-icons">&#xE863;</i> <span>새로고침</span></a>
							<a href="#" class="btn btn-info float-right"><i class="material-icons">&#xE24D;</i> <span>엑셀로 변환하기</span></a>
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
							<th>질문</th>						
	                        <th>답변 여부</th>						
							<th>남은 횟수</th>
							<th>답하기</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>1</td>
	                        <td><a href="#"><img src="resource/photo/trainer/me.jpg" class="avatar" alt="Avatar">이욱재</a></td>
	                        <td>2020 / 03 / 23</td>                        
							<td>010-9941-4598</td>
							<td>50회</td>
							<td><a href="#" class="view goAsk" title="View Details" data-toggle="modal" data-target="#exampleModalCenter"><i class="material-icons">&#xE5C8;</i></a></td>
	                    </tr>
						<tr>
	                        <td>2</td>
	                        <td><a href="#"><img src="resource/photo/trainer/me.jpg" class="avatar" alt="Avatar">김지현</a></td>                      
							<td>2020 / 03 / 23</td>
							<td>010-9941-459</td>
							<td>50회</td>
							<td><a href="#" class="view goAsk" title="View Details" data-toggle="modal" data-target="#exampleModalCenter"><i class="material-icons">&#xE5C8;</i></a></td>
	                    </tr>
						<tr>
	                        <td>3</td>
	                        <td><a href="#"><img src="resource/photo/trainer/me.jpg" class="avatar" alt="Avatar">이태균</a></td>
	                        <td>2020 / 03 / 23</td>
	                        <td>010-9941-459</td>
							<td>50회</td>
							<td><a href="#" class="view goAsk" title="View Details" data-toggle="modal" data-target="#exampleModalCenter"><i class="material-icons">&#xE5C8;</i></a></td>                        
	                    </tr>
						<tr>
	                        <td>4</td>
	                        <td><a href="#"><img src="resource/photo/trainer/me.jpg" class="avatar" alt="Avatar">오재원</a></td>
	                        <td>2020 / 03 / 23</td>
	                        <td>010-9941-459</td>
							<td>50회</td>
							<td><a href="#" class="view goAsk" title="View Details" data-toggle="modal" data-target="#exampleModalCenter"><i class="material-icons">&#xE5C8;</i></a></td>                        
	                    </tr>
						<tr>
	                        <td>5</td>
	                        <td><a href="#"><img src="resource/photo/trainer/me.jpg" class="avatar" alt="Avatar">이태균</a></td>
	                        <td>2020 / 03 / 23</td>
	                        <td>010-9941-459</td>
							<td>50회</td>
							<td><a href="#" class="view goAsk" title="View Details" data-toggle="modal" data-target="#exampleModalCenter"><i class="material-icons">&#xE5C8;</i></a></td>                        
	                    </tr>                                         
	                </tbody>
	            </table>
				<div class="clearfix">
	                <ul class="pagination">
	                    <li class="page-item disabled"><a href="#">이전</a></li>
	                    <li class="page-item"><a href="#" class="page-link">1</a></li>
	                    <li class="page-item"><a href="#" class="page-link">2</a></li>
	                    <li class="page-item"><a href="#" class="page-link">3</a></li>
	                    <li class="page-item active"><a href="#" class="page-link">4</a></li>
	                    <li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link">6</a></li>
						<li class="page-item"><a href="#" class="page-link">7</a></li>
	                    <li class="page-item"><a href="#" class="page-link">다음</a></li>
	                </ul>
	            </div>
	        </div>
	    </div><!-- 표 끝 -->
	</div>
	<!-- 모달창 부분 -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="false">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-fullsize" role="document">
			<div class="modal-content modal-lg modal-fullsize">
				<form action="#" method="post">
					<div class="modal-header">
						<p class="modal-title" id="modalCenterTitle">1:1 문의 답변</p>
						<button type="button" class="close modal_close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		
		      		<div class="modal-body">
		      			<div class="modal-body-container">
		      				<div class="titleAndWriter">
		      					<table class="twArea">
		      						<tr>
		      							<th>작성자</th>
		      							<th>제목</th>
		      							<th>작성일자</th>
		      						</tr>
		      						<tr>
		      							<td>이욱재</td>
		      							<td>어깨가 아파요</td>
		      							<td>2020-02-17</td>
		      						</tr>
		      					</table>
		      				</div>
		      				<div class="questionContent-area">
		      					<textarea id="questionContent" readonly>벤치 프레스나 가슴 운동할때마다 아프네요</textarea>
		      				</div>
		      				<hr>
		      				<div class="answer-area">
		      					<p>답변하기</p>
		      					<textarea id="realAnswer" placeholder="내용을 입력해주세요."></textarea>
		      				</div>
		      			</div>
					</div>
		    		<div class="modal-footer">
		        		<!-- <button type="button" class="btn btn-secondary modal_close" data-dismiss="modal">Close</button> -->
		        		<button type="button" class="btn btn-primary modal_health_select_btn">답변완료</button>
		    		</div>
		    	</form>
	    	</div>
	  	</div>
	</div><!-- 모달창 부분 끝 -->
	<script>
		$('#exampleModalCenter').on('show.bs.modal', function () {
		       // 모달이 열릴때 로직
		       alert("열린다.");
		       $("#realAnswer").val("오");
		});
	</script>
</body>
</html>