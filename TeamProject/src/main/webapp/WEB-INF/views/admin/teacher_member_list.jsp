<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/fixed-topbar.jsp"%>
<script type="text/javascript">
function list(page){
	location.href="${path}/member/list.do?curPage="+page;
} 
</script>
</head>
<body>
	<div class="container" style="margin-top: 170px;">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link" href="${path}/member/list.do">전체회원</a></li>
			<li class="nav-item"><a class="nav-link" href="${path}/member/list.do?location=normal">일반회원</a></li>
			<li class="nav-item"><a class="nav-link active" href="${path}/member/list.do?location=teacher">강사회원</a></li>
			<li class="nav-item"><a class="nav-link" href="${path}/member/list.do?location=request">강사신청</a></li>
			<li class="input-group col-3 ml-auto mr-0">
			<form class="input-group" action="${path}/member/list.do">
					<input type="text" class="form-control" placeholder="검색어 입력" value="" id="keyword" name="keyword">
					<input type="hidden" id="location" name="location" value="teacher">
					<div class="input-group-append">
						<button class="btn btn-outline-primary" type="submit">검색</button>
					</div>
					</form>
				</li>
		</ul>
	</div>

	<div class="container table-responsive">
		<div>
			<br>
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
				<!-- 페이지 네비게이션 출력 -->
				<tr>
					<td colspan="5" align="center"><c:if
							test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('1')">[처음]</a>
						</c:if> <c:if test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('${map.pager.prevPage}')"> [이전]</a>
						</c:if> <c:forEach var="num" begin="${map.pager.blockBegin}"
							end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
									<span style="color: red;">${num}</span>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="list('${num}')">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> <c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
						</c:if> <c:if test="${map.pager.curPage < map.pager.totPage}">
							<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
						</c:if></td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>