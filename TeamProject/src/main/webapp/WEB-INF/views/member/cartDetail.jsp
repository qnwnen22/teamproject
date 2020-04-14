<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
	<div class="container">
	<div class="">
	<p>카트목록</p>
	<table class="table table-hover">
			<thead>
				<tr class="row" align="center">
				<th class="col-1"><input type="checkbox" name="chkAll" id="chkAll" > </th>
			<th class="col-1">번호</th>
			<th class="col-1">판매타입</th>
			<th class="col-1">아이디</th>
			<th class="col-1">강의 번호</th>
			<th class="col-3">카테고리</th>
			<th class="col-2">강의명</th>
			<th class="col-1">가격</th>
			<td class="col-1"></td>
		</tr>
		</thead>
		<tbody >
		<c:forEach var="dto" items="${list}">
			<tr class="row" align="center">
			<th class="col-1"><input type="checkbox" name="chk" class="chk"> </th>
				<td class="col-1">${dto.cart_idx}</td>
				<td class="col-1">${dto.cell_type}</td>
				<td class="col-1">${dto.userid}</td>
				<td class="col-1">${dto.lecture_idx}</td>
				<td class="col-3">${dto.main_category} &gt; ${dto.sub_category}</td>
				<td class="col-2">${dto.subject}</td>
				<td class="col-1">${dto.price}</td>	
			</tr>
		</c:forEach>
	</tbody>
	
	</table>

	</div>
	</div>
</body>
</html>