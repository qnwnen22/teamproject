<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
<script type="text/javascript">
function list(page) {
	location.href = "${path}/lecture/offline_list.do?curPage="+page;
}
function search(){
	var keyword=document.getElementById("keyword").value;
	location.href = "${path}/lecture/offline_list_search.do?keyword="+keyword;
}
</script>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
<h2>현장 강의 판매 리스트</h2>
<hr>
	<form name="form_search">
		<div style="float: right;">
			<input name="keyword" id="keyword">
			<input type="button" value="조회" onclick="search()">
		</div>
	</form>
	<table style="width: 100%; border: 1px solid">
		<tr>
			<th>번호</th>
			<th>썸네일</th>
			<th>제목</th>
			<th>제작자</th>
			<th>가격</th>
			<th>조회수</th>
			<th>좋아요?</th>
		</tr>
		<c:forEach var="dto" items="${map.list}">
		<tr>
			<td>${dto.lecture_idx}</td>
			<!-- 썸네일 -->
			<td><a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
				<img width="300px" height="100px" src="../upload/${dto.main_img}"></a>
			</td>
			<!-- 제목 -->
			<td>${dto.subject}</td>
			<!-- 사용자 아이디 -->	
			<td>${dto.userid}</td>
			<!-- 가격 -->
			<td>${dto.price}</td>
			<!--  -->
			<td>{dto.readCount}</td>
			<!--  -->
			<td>{dto.like}</td>
			</tr>
			</c:forEach>
	</table>
</div>
<br>
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

<%@ include file="../include/footer.jsp"%>
</body>
</html>