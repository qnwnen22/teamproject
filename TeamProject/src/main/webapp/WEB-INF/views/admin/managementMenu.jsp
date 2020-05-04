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
<body class="Kdemy">
<%@ include file="../include/fixed-topbar.jsp"%>
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3 Kdemy-content">
<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/admin/managementMenu.do" style="color:blue;">관리메뉴</a></b></li>
			</ul>
		</div>
	<hr>
<div class="d-flex mb-3">
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">관리자계정</h3>
		<a href="${path}/admin/list.do"><img class="mx-auto d-block" src="${path}/include/images/main/관리자계정.png"></a><br>
	</div>
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">회원관리</h3>
		<a href="${path}/member/list.do"><img class="mx-auto d-block" src="${path}/include/images/main/회원관리.png"></a><br>
	</div>
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">강의관리</h3>
		<a href="${path}/admin/lectureMenu.do"><img class="mx-auto d-block" src="${path}/include/images/main/강의관리.png"></a><br>
	</div>
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">패키지관리</h3>
		<a href="${path}/packages/adminlist.do"><img class="mx-auto d-block" src="${path}/include/images/main/패키지관리.png"></a><br>
	</div>
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">쿠폰관리</h3>
		<a href="${path}/member/couponMaker.do"><img class="mx-auto d-block" src="${path}/include/images/main/쿠폰관리.png"></a><br>
	</div>
</div>
<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/admin/lectureMenu.do" style="color:blue;">강의관리</a></b></li>
			</ul>
		</div>
<div class="d-flex mb-3">
	<div class="col-2 rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">실시간강의</h3>
		<a href="${path}/lecture/online_list.do?admin=admin"><img class="img-fluid d-block" src="${path}/include/images/teacher/실시간강의.png"></a>
	</div>
	<div class="col-2 rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">동영상강의</h3><br>
		<a href="${path}/lecture/video_list.do?admin=admin"><img class="img-fluid d-block" src="${path}/include/images/teacher/동영상강의.jpeg"></a>
	</div>
	<div class="col-2 rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">현장강의</h3>
		<a href="${path}/lecture/offline_list.do?admin=admin"><img class="img-fluid d-block"class="img-fluid d-block" src="${path}/include/images/teacher/현장강의.jpg"></a>
	</div>
</div>
</div>
<%@include file="../include/footer.jsp" %>
</body>
</html>