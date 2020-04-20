<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<% pageContext.setAttribute("newLineChar","\n"); %>
	<c:forEach var="row" items="${replylist}">
		<c:set var="str" value="${fn:replace(row.replytext,'<','&lt;') }" />
		<c:set var="str" value="${fn:replace(str,'>','&gt;') }" />
		<c:set var="str" value="${fn:replace(str,'  ','&nbsp;&nbsp;')}" />
		<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />


		<div>
			<input type="hidden" name="bno" value="${row.bno}"> <input
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
</body>
</html>