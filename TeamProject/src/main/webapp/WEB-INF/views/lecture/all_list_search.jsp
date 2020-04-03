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
	var keyword=document.getElementById("keyword").value;
	location.href = "${path}/lecture/all_list_search.do?curPage="+page+"&keyword="+keyword;
}
function search(){
	var keyword=document.getElementById("keyword").value;
	location.href = "${path}/lecture/all_list_search.do?keyword="+keyword;
}
</script>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
<h2>현장 강의 판매 리스트</h2>
<hr>
	<form name="form_search">
		<div style="float: right;">
			<input name="keyword" id="keyword" value="${map.keyword}">
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
		</tr>
		</c:forEach>
		<!-- 페이징 처리 -->
		<tr>
			<td colspan="5" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')"> [이전]</a>
			</c:if>
			
			<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color: red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			 <c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if></td>
		</tr>
	</table>
</div>

<%@ include file="../include/footer.jsp"%>
</body>
</html>