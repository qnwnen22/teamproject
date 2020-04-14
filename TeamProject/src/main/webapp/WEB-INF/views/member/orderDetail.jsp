<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
	<p>구매목록</p>
	<table class="table table-hover">
			<thead>
				<tr class="row" align="center">
				<th class="col-1"><input type="checkbox" name="chkAll" id="chkAll" > </th>
			<th class="col-1">번호</th>
			<th class="col-1">판매타입</th>
			<th class="col-1">아이디</th>
			<th class="col-1">강의 번호</th>
			<th class="col-3">구입일자</th>
			<td class="col-1"></td>
		</tr>
		</thead>
		<tbody >
		<c:forEach var="dto" items="${list2}">
			<tr class="row" align="center">
			<th class="col-1"><input type="checkbox" name="chk" class="chk"> </th>
				<td class="col-1">${dto.box_idx}</td>
				<td class="col-1">${dto.cell_type}</td>
				<td class="col-1">${dto.userid}</td>
				<td class="col-1">${dto.lecture_idx}</td>
				<td class="col-1">${dto.buy_date}</td>
				<td class="col-1">
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>