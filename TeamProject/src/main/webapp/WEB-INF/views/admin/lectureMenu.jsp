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
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3">
<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/admin/managementMenu.do">관리메뉴</a></b></li>
				<li><b><a href="${path}/admin/lectureMenu.do" style="color:blue;">강의관리</a></b></li>
			</ul>
		</div>
	<div>
	<hr>
<div class="d-flex mb-3">
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">실시간강의</h3>
		<a href="${path}/lecture/online_list.do?admin=admin"><img class="img-fluid d-block" src="${path}/include/images/teacher/현장강의.jpg"></a><br>
	</div>
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">동영상강의</h3><br>
		<a href="${path}/lecture/video_List.do?admin=admin"><img class="img-fluid d-block" src="${path}/include/images/teacher/현장강의.jpg"></a><br>
	</div>
	<div class="col rounded-lg shadow p-4 mb-4 bg-white border border-secondary mx-1">
		<h3 class="text-center">오프라인강의</h3>
		<a href="${path}/lecture/offline_list.do?admin=admin"><img class="img-fluid d-block"class="img-fluid d-block" src="${path}/include/images/teacher/현장강의.jpg"></a><br>
	</div>
</div>
</div>
</div>
<%@include file="../include/footer.jsp" %>
</body>
</html>