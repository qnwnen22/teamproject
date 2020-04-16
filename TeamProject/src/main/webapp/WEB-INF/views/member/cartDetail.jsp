<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp" %>
<head>
  <title>나의 정보 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container col-sm-12">
	<div class="">
	<p>카트목록</p>
	<table class="table table-hover col-sm-12">
			<thead>
			<tr class="row" align="center">
			<th class="col-1 text-center">번호</th>
			<th class="col-2 text-center">판매타입</th>
			<th class="col-2 text-center">아이디</th>
			<th class="col-2 text-center">강의 번호</th>
			<th class="col-2 text-center">카테고리</th>
			<th class="col-2 text-center">강의명</th>
			<th class="col-1 text-center">가격</th>

		</tr>
		</thead>
		<tbody >
		<c:forEach var="dto" items="${list}">
			<tr class="row" align="center">
				<td class="col-1 text-center">${dto.cart_idx}</td>
				<td class="col-2 text-center">${dto.cell_type}</td>
				<td class="col-2 text-center">${dto.userid}</td>
				<td class="col-2 text-center">${dto.lecture_idx}</td>
				<td class="col-2 text-center">${dto.main_category} &gt; ${dto.sub_category}</td>
				<td class="col-2 text-center">${dto.subject}</td>
				<td class="col-1 text-center">${dto.price}</td>	
			</tr>
		</c:forEach>
	</tbody>
	
	</table>

	</div>
	</div>
</body>
</html>