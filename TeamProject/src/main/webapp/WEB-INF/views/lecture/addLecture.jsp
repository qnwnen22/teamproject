<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/css/notice.css">
</head>
<body>
<%@include file="../include/fixed-topbar.jsp" %>
<div class="container">
<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><a href="${path}/lecture/addLecturePage.do">강의등록</a></li>
			</ul>
		</div>
	<div>
	<hr>
<div class="d-flex mb-3">
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3>실시간 강의등록</h3>
		<a href="${path}/lecture/onlinePage.do"><img class="img-fluid d-block" src="${path}/include/images/teacher/실시간강의.png"></a><br>
	</div>
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3>동영상 강의등록</h3><br>
		<a href="${path}/lecture/videoPage.do"><img class="img-fluid d-block" src="${path}/include/images/teacher/동영상강의.jpeg"></a><br>
	</div>
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3>오프라인 강의등록</h3>
		<a href="${path}/lecture/offlinePage.do"><img class="img-fluid d-block"class="img-fluid d-block" src="${path}/include/images/teacher/현장강의.jpg"></a><br>
	</div>
</div>
</div>
</div>
<%@include file="../include/footer.jsp" %>
</body>
</html>