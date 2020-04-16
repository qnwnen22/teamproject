<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>구매목록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ include file="../include/header.jsp" %>
</head>
<body>
	<div class="container">
	<div class="col-sm-10">
		<div>
		</div>
	<p>구매목록</p>
	  <c:forEach var="dto" items="${list2}">
			<div class="row" align="center">
			    <div class="col-sm-6">${dto.lecture_idx}</div>
				<div class="col-sm-6"><%-- ${dto.box_idx}</td> --%>
				<div class="short-div">${dto.cell_type}</div>
				<div class="short-div">${dto.userid}</div></div>
				
				<%-- <td class="col-2">${dto.buy_date}</td> --%>
				</div>
		</c:forEach>

	</div>
	</div>
	</body>
</html>