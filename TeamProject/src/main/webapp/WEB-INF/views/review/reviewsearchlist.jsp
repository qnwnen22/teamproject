<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
<link rel="stylesheet" href="${path}/include/css/notice.css">
<script type="text/javascript">
	function list(page) {
		location.href = "${path}/review/searchlist.do?curPage=" + page+"&search_option=${map.search_option}"+"&keyword=${map.keyword}";
	}
</script>
</head>
<body>
<%@ include file="../include/fixed-topbar.jsp"%>
<<<<<<< HEAD
	<br><br><br><br><br><br><br><br>
=======
	<br><br><br><br><br><br>
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
	<div class="board_table">
		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li>수강후기</li>
			</ul>
		</div>
		<br>
		
		
		<form action="${path}/review/searchlist.do" name="form1" method="post"> 
	 	<select name="search_option" class=" search_option" >
				<option value="subject"
					<c:if test="${map.search_option=='subject' }">selected</c:if>>과목</option>
				<option value="teacher"
					<c:if test="${map.search_option=='teacher' }">selected</c:if>>강사</option>
				<option value="all"
					<c:if test="${map.search_option=='all' }">selected</c:if>>내용+제목</option>
			</select><!--분류 삭제  -->
		
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="검색"
					aria-label="Recipient's username" aria-describedby="basic-addon2"
					name="keyword" value="${map.keyword}">
				<div class="input-group-append">
				<input type="submit" class="input-group-text input_submit" id="basic-addon2" value="검색">
				</div>
		</div>
		</form>

			<br>
		<table class="table table-hover ">
			<thead>
				<tr class="row" align="center">
					<th class="col-1">번호</th>
					<th class="col-1">과목</th>
					<th class="col-2">강사</th>
					<th class="col-3">제목</th>
					<th class="col-2">작성자</th>
					<th class="col-2">날짜</th>
					<th class="col-1">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="rows" items="${map.reviewlist}">
					<tr class="row" align="center">
						<td class="col-1">${rows.bno}</td>
						<td class="col-1">${rows.subject}</td>
						<td class="col-2">${rows.teacher}</td>
						<td class="col-3"><a
							href="${path}/review/view.do?bno=${rows.bno}">${rows.title}</a> <c:if
								test="${rows.cnt>0}">
							<span style="color: white;" class="badge badge-pill badge-dark">${rows.cnt}</span>
							</c:if></td>
						<td class="col-2">${rows.writer}</td>
						<td class="col-2"><fmt:formatDate value="${rows.regdate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td class="col-1">${rows.viewcnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><br>
		<%-- 	<c:choose>
				<c:when test="${sessionScope.userid != null }">
					<!-- 관리자로 로그인했을때 아이디 바꾸기--> --%>
					<div class="container">
					<div class="row">
						<div class="write_btn_align col align-self-end">
						<a class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
							href="${path}/review/write.do" data-ga-category="header"> 글쓰기
						</a>
						</div>
						</div>
					</div>
				<%-- </c:when>
			</c:choose> --%>
	
	<br>
	<div class="row justify-content-center">
			<nav aria-label="Page navigation example center-block">
				<ul class="pagination">
					<c:if test="${map.pager.curBlock>1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('1')">&lt;&lt;</a></li>
					</c:if>
					<c:if test="${map.pager.curBlock >1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.prevPage}')">&lt;</a></li>
					</c:if>
					<c:forEach var="num" begin="${map.pager.blockBegin}"
						end="${map.pager.blockEnd}">
						<c:choose>
							<c:when test="${num==map.pager.curPage}">
								<li class="page-item"><a class="page-link">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#"
									onclick="list('${num}')">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.pager.curBlock < map.pager.totBlock}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.nextPage}')">&gt;</a></li>
					</c:if>
					<c:if test="${map.pager.curPage <map.pager.totPage}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.totPage}')">&gt;&gt;</a></li>
					</c:if>
				</ul>
			</nav>
	</div>
	<br><br>


<<<<<<< HEAD





=======
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
<%@ include file="../include/footer.jsp"%>
</body>
</html>

