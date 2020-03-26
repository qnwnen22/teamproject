<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/fixed-topbar.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
<link rel="stylesheet" href="${path}/include/css/board.css">
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<div class="board_table">
	<div>
		<ul class="upper_shift">
			<li><a href="${path}">KDEMY</a></li>
			<li>공지사항</li>
		</ul>
	</div>
		<form action="${path}/board/list.do" name="form1" method="post">
			<select name="search_option" class=" search_option">
				<option value="username"
				<c:if test="${map.search_option=='username' }">selected</c:if>>이름</option>
				<option value="title"
				<c:if test="${map.search_option=='title' }">selected</c:if>>제목</option>
				<option value="content"
				<c:if test="${map.search_option=='content' }">selected</c:if>>내용</option>
				<option value="all"
				<c:if test="${map.search_option=='all' }">selected</c:if>>이름+내용+제목</option>
			</select>
				<input class="search-input kdemi" placeholder="키워드를 입력해주세요."
				name="keyword" maxlength="20" value="${map.keyword}">
				<button style="border: none; background: white;" >
				<img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png" width="20px;">
				</button>
									
					<c:choose>
				<c:when test="${sessionScope.userid != null }"> <!-- 관리자로 로그인했을때 아이디 바꾸기-->
							<div class="write_btn_align"><a class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
								href="${path}/board/write.do" data-ga-category="header" >
								글쓰기 </a></div>
				</c:when>
				</c:choose>
				</form>
				
				<table class="table table-hover table-bordered ">
					<thead>
						<tr class="row">
							<th class="col-md-1">번호</th>
							<th class="col-md-6">제목</th>
							<th class="col-md-3">이름</th>
							<th class="col-md-2">날짜</th>
							<th class="col-md-1">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr><tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr><tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
					</tbody>
				</table>
				
				
	</div>










	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>
</html>
<%@ include file="../include/footer.jsp"%>

