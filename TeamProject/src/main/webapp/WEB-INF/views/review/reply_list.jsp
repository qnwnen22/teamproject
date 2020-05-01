<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

	<% pageContext.setAttribute("newLineChar","\n"); %>
	<c:forEach var="row" items="${map.replylist}">
		<c:set var="str" value="${fn:replace(row.replytext,'<','&lt;') }" />
		<c:set var="str" value="${fn:replace(str,'>','&gt;') }" />
		<c:set var="str" value="${fn:replace(str,'  ','&nbsp;&nbsp;')}" />
		<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />

		<div>
			<input type="hidden" name="bno" id="bno" value="${row.bno}"> <input
				type="hidden" name="rno" value="${row.rno}"> ${row.replyer}
			(
			<fmt:formatDate value="${row.regdate}"
				pattern="yyyy-MM-dd a HH:mm:ss" />
			)
			<c:if test="${sessionScope.userid ==row.replyer }">
				<a href="${path}/review/replydelete/${row.rno}+${row.bno}"> 삭제</a>
			</c:if>
			<br>
			<br> <span style="font-size: 1rem;">${str}</span><br>
			<hr>
		</div>
	</c:forEach>
	<div class="d-flex justify-content-center mb-4 paging">
			<nav aria-label="Page navigation example center-block">
				<ul class="pagination">
					<c:if test="${map.pager2.curBlock>1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="listreplyPage('1')">&lt;&lt;</a></li>
					</c:if>
					<c:if test="${map.pager2.curBlock >1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="listreplyPage('${map.pager2.prevPage}')">&lt;</a></li>
					</c:if>
					<c:forEach var="num" begin="${map.pager2.blockBegin}"
						end="${map.pager2.blockEnd}">
						<c:choose>
							<c:when test="${num==map.pager2.curPage}">
								<li class="page-item"><a class="page-link">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#"
									onclick="listreplyPage('${num}')">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.pager2.curBlock < map.pager2.totBlock}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="listreplyPage('${map.pager2.nextPage}')">&gt;</a></li>
					</c:if>
					<c:if test="${map.pager2.curPage <map.pager2.totPage}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="listreplyPage('${map.pager2.totPage}')">&gt;&gt;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
<script type="text/javascript">

function listreplyPage(page) {
	var bno =$("#bno").val();
	location.href ="${path}/review/view.do?bno="+bno+"&replyCurPage="+page
}

</script>