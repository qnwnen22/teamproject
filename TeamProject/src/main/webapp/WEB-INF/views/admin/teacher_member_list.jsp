<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	function list(page) {
		location.href = "${path}/member/list.do?curPage="+page+"&location=teacher"+"&keyword=${map.keyword}";
	}
</script>
</head>
<body>
<%@ include file="../include/fixed-topbar.jsp"%>
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12" style="margin-top: 170px;">
	<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/admin/managementMenu.do">관리메뉴</a></b></li>
				<li><b><a href="${path}/member/list.do">회원관리</a></b></li>
				<li><b><a href="${path}/member/list.do?location=teacher" style="color:blue;">강사회원</a></b></li>
			</ul>
		</div>
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link"
				href="${path}/member/list.do">전체회원</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${path}/member/list.do?location=normal">일반회원</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="${path}/member/list.do?location=teacher">강사회원</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${path}/member/list.do?location=request">강사신청</a></li>
			<li class="input-group col-3 ml-auto mr-0">
				<form class="input-group" action="${path}/member/list.do">
					<input type="text" class="form-control" placeholder="검색어 입력"
						value="${map.keyword}" id="keyword" name="keyword"> <input type="hidden"
						id="location" name="location" value="teacher">
					<div class="input-group-append">
						<button class="btn btn-outline-primary" type="submit">검색</button>
					</div>
				</form>
			</li>
		</ul>
	</div>

	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 table-responsive">
		<table class="table table-bordered table-hover">
			<thead class="thead-dark">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>생년월일</th>
					<th>가입일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${map.list}">
					<tr>
						<td>${row.userid}</td>
						<td><a href="#"> ${row.username}</a></td>
						<td>${row.phone}</td>
						<td>${row.birthday}</td>
						<td><fmt:formatDate value="${row.join_date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 처리 -->
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
	</div>
	<br>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>