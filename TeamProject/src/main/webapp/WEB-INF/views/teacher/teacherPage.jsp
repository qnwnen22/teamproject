<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/topbar.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
</head>
<body>
<h2>강사 등록</h2>
<a href="${path}/teacher/videoPage.do">동영상 강의 등록 페이지</a><br>
<a href="${path}/teacher/onlinePage.do">실시간 강의 등록 페이지</a><br>
<a href="${path}/teacher/offlinePage.do">현장 강의 등록 페이지</a><br>
<hr>
<h2>강의 리스트</h2>
<a href="${path}/teacher/videoList.do">동영상 리스트 페이지</a><br>
<a href="${path}/teacher/online_list.do">실시간 강의 리스트 페이지</a><br>
<a href="${path}/teacher/offline_list.do">현장 강의 리스트 페이지</a><br>

<%@ include file="../include/footer.jsp"%>
</body>
</html>