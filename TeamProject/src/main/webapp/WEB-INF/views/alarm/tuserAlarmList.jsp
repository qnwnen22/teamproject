<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div>
<table class="table table-bordered table-hover">
<c:forEach var="alarm" items="${map.alarmlist}">
<tr>
  <td>${alarm.alarmmsg}</td>
</tr>
</c:forEach>
</table>
<c:if test="${sessionScope.userid != null}">
	<input type="hidden" id="userid" name="userid" value="${sessionScope.userid}"> 
</c:if>
<div class="row justify-content-center">
			<nav aria-label="Page navigation example center-block">
				<ul class="pagination">
					<c:if test="${map.pager.curBlock>1}">
						<li class="page-item"><a class="page-link" href="javascript:void(0)"
							onclick="tuserAlarmPage('1')">&lt;&lt;</a></li>
					</c:if>
					<c:if test="${map.pager.curBlock >1}">
						<li class="page-item"><a class="page-link" href="javascript:void(0)"
							onclick="tuserAlarmPage('${map.pager.prevPage}')">&lt;</a></li>
					</c:if>
					<c:forEach var="num" begin="${map.pager.blockBegin}"
						end="${map.pager.blockEnd}">
						<c:choose>
							<c:when test="${num==map.pager.curPage}">
								<li class="page-item"><a class="page-link">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="javascript:void(0)"
									onclick="tuserAlarmPage('${num}')">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.pager.curBlock < map.pager.totBlock}">
						<li class="page-item"><a class="page-link" href="javascript:void(0)"
							onclick="tuserAlarmPage('${map.pager.nextPage}')">&gt;</a></li>
					</c:if>
					<c:if test="${map.pager.curPage <map.pager.totPage}">
						<li class="page-item"><a class="page-link" href="javascript:void(0)"
							onclick="tuserAlarmPage('${map.pager.totPage}')">&gt;&gt;</a></li>
					</c:if>
				</ul>
			</nav>
	</div>
</div>
