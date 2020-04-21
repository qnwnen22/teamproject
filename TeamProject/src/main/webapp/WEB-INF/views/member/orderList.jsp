<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <%@ include file="../include/header.jsp" %>
<head>
  <title>구매목록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<div class="col-sm-8">
	<br>
	  <c:forEach var="dto" items="${list2}">
			<div class="row">
			    <div class="col-sm-5" ><img src="{path}${dto.main_img}" class="img-responsive"></div>
				<div class="col-sm-7" >
				<div class="short-div m-5"><strong>${dto.subject}</strong></div>
				<div class="short-div">${dto.userid}</div>
				<div class="short-div">${dto.userid}</div>
				<div class="short-div">${dto.userid}</div>
				<div class="short-div">&nbsp;&nbsp;<span>${dto.buy_date}</span></div>
				</div>
				</div>
				
				<%-- ${dto.box_idx}</td> align="center" --%>
				<%-- <td class="col-2">${dto.buy_date}</td> --%>
         	<br>
         </c:forEach>
		</div>
			
	</div>
	</body>
</html>