<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/upper.css">
<script type="text/javascript">
	function list(page) {
		location.href = "${path}/notice/list.do?curPage=" + page;
	}

</script>
</head>
<body>
<%@ include file="../include/fixed-topbar.jsp"%>
	<div class="container-xl col-xl-8 offset-xl-2 col-lg-12">
		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li>공지사항</li>
			</ul>
		</div>
		
		<form action="${path}/notice/searchlist.do" name="form1" method="post"> 
		<div class="d-none">
	 	<select name="search_option" class=" search_option" >
			<%--	<option value="username"
					<c:if test="${map.search_option=='username' }">selected</c:if>>이름</option>
				<option value="title"
					<c:if test="${map.search_option=='title' }">selected</c:if>>제목</option>
				<option value="content"
					<c:if test="${map.search_option=='content' }">selected</c:if>>내용</option> --%>
				<option value="all"
					<c:if test="${map.search_option=='all' }">selected</c:if>>이름+내용+제목</option>
			</select><!--분류 삭제  -->
			</div>
		<div class="col-lg-5 col-xl-5 col-md-5 col-sm-4 align-self-start mt-5 mb-2">
			<div class="input-group ">
				<input type="text" class="form-control" placeholder="검색"
					aria-label="Recipient's username" aria-describedby="basic-addon2"
					name="keyword" value="${map.keyword}">
				<div class="input-group-append">
				<input type="submit" class="input-group-text input_submit" id="basic-addon2" value="검색">
				</div>
				</div>
		</div>
		</form>

		<div id="table_css" class="table-responsive col-12">
		<table class="table text-center table-hover table-bordered" >
		<thead>
				<tr>
					<th class="d-none d-xl-block d-lg-block"> 번호</th>
					<th>제목</th>
					<th >작성자</th>
					<th class="d-none d-xl-block d-lg-block">날짜</th>
					<th>조회수</th>
				</tr>
				</thead >
				<tbody>
				<c:forEach var="rows" items="${map.list}">
					<tr>
					<td class="d-none d-xl-block d-lg-block">${rows.bno}</td>
						<td><a
							href="${path}/notice/view.do?bno=${rows.bno}">${rows.title}</a> <c:if
								test="${rows.cnt>0}">
							</c:if></td>
						<td>${rows.writer}</td>
						<td class="d-none d-xl-block d-lg-block"><fmt:formatDate value="${rows.regdate}"
								pattern="yyyy-MM-dd" /></td>
						<td>${rows.viewcnt}</td>
					</tr>
				</c:forEach>
				</tbody>
		</table>
		</div>

	 <c:if test="${sessionScope.admin_id != null }">
					<div class="d-flex justify-content-end mt-3">
						<a class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
							href="${path}/notice/write.do" data-ga-category="header"> 글쓰기
						</a>
						</div>
			</c:if>	
	<br>
	<div class="d-flex justify-content-center">
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
	</div>	</div>
	<br><br>

 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>