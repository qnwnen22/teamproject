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
<<<<<<< HEAD
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3 d-flex mb-3" style="margin-top: 170px;">
=======
<div class="container d-flex mb-3">
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
<div class="card col-3 d-flex align-items-center" style="width:400px">
  <img class="card-img-top" src="../include/images/chart/회원.jpg" alt="Card image">
  <div class="card-body align-items-center">
    <h4 class="card-title">가입자수</h4>
    <h4 class="card-title">120,000</h4>
    <a href="${path}/chart/memberchart.do" class="btn btn-primary">차트보기</a>
  </div>
</div>
<div class="card col-3" style="width:400px">
  <img class="card-img-top" src="../include/images/chart/강의.jpg" alt="Card image">
  <div class="card-body">
    <h4 class="card-title">등록된 강의</h4>
    <p class="card-text">Some example text.</p>
    <a href="#" class="btn btn-primary">차트보기</a>
  </div>
</div>
<div class="card col-3" style="width:400px">
  <img class="card-img-top" src="../include/images/chart/매출.jpg" alt="Card image">
  <div class="card-body">
    <h4 class="card-title">매출현황</h4>
    <p class="card-text">Some example text.</p>
    <a href="#" class="btn btn-primary">차트보기</a>
  </div>
</div>
<div class="card col-3" style="width:400px">
  <img class="card-img-top" src="img_avatar1.png" alt="Card image">
  <div class="card-body">
    <h4 class="card-title">기타</h4>
    <p class="card-text">Some example text.</p>
    <a href="#" class="btn btn-primary">차트보기</a>
  </div>
</div>
</div>
<div id="chart_div"></div>
<!-- <button id="btn" type="button" onclick="drawChart()">
refresh</button> -->
<%@include file="../include/footer.jsp" %>
</body>
</html>