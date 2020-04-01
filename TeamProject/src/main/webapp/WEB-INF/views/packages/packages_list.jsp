<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp" %>
</head>
<body>
<%@include file="../include/fixed-topbar.jsp" %>
<div class="container">
<div class="row col-12">
<h2 class="col-4">패키지 구매</h2>
</div>
<br>
<c:forEach var="dto" items="${list}">
<div class="card" style="width:400px">
  <a href="#"><img class="card-img-top" src="../include/images/coupon/${dto.packages_image}" alt="Card image"></a>
  <div class="card-body">
    <h4 class="card-title">${dto.packages_name}</h4>
    <h5 class="text-danger"><fmt:formatNumber value="${dto.packages_price}" pattern="#,###" /></h5>
    <p class="card-text">${dto.packages_text}</p>
  </div>
</div>
<br>
</c:forEach>
</div>
<br>
<%@include file="../include/footer.jsp" %>
</body>
</html>