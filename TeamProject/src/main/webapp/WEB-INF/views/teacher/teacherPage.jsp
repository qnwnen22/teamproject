<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>

<link rel="stylesheet" href="${path}/include/css/home.css">
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
	<h2>강의 등록</h2>
	<a href="${path}/lecture/videoPage.do">동영상 강의 등록 페이지</a><br>
	<a href="${path}/lecture/onlinePage.do">실시간 강의 등록 페이지</a><br>
	<a href="${path}/lecture/offlinePage.do">현장 강의 등록 페이지</a><br>
	<hr>
	<h2>강의 리스트</h2>
	<a href="${path}/lecture/video_List.do">동영상 리스트 페이지</a><br>
	<a href="${path}/lecture/online_list.do">실시간 강의 리스트 페이지</a><br>
	<a href="${path}/lecture/offline_list.do">현장 강의 리스트 페이지</a><br>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>