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
<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><a href="${path}/packages/list.do"">패키지구매</a></li>
			</ul>
		</div>
<div class="d-flex row col-12">
<c:forEach var="dto" items="${list}">
<div class="col-3 mb-4">
<div class="card mr-.5 rounded-lg shadow p-4 mb-4 bg-white">
  <a href="#"><img class="img-responsive card-img-top center-block mb-3" width="400" height="130" src="../include/images/coupon/${dto.packages_image}" alt="Card image"></a>
  <div class="kdemycard-body">
    <h4 class="card-title h5">${dto.packages_name}</h4>
    <h5 class="text-danger"><fmt:formatNumber value="${dto.packages_price}" pattern="#,###" /></h5>
    <p class="card-text">${dto.packages_text}</p>
  </div>
</div>
</div>
<br>
</c:forEach>
</div>
</div>
<br>
<%@include file="../include/footer.jsp" %>
</body>
</html>