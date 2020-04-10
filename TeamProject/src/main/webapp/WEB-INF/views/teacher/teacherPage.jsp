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
	<div style="width: 30%; height: 500px; float: left; border: 1px solid;">
		<h4>test</h4>
		<a href="${path}/chatroom/room">채팅방만들기</a><br>
		<a href="${path}/chatroom/chatRoomList.do">채팅방리스트이동</a>
		<a href="${path}/chatroom/chatTest.do">채팅테스트이동</a>
		<hr>
		<h4>강의 관리</h4>
		<a href="${path}/lecture/myLecturePage.do?userid=${sessionScope.userid}">내가 올린 강의 관리</a>
		<hr>
		<h4>강의 등록</h4>
		<a href="${path}/lecture/videoPage.do">1. 동영상 강의 등록 페이지</a><br>
		<a href="${path}/lecture/onlinePage.do">2. 실시간 강의 등록 페이지</a><br>
		<a href="${path}/lecture/offlinePage.do">3. 현장 강의 등록 페이지</a><br>
		<hr>
		<h4>강의 리스트</h4>
		<a href="${path}/lecture/video_List.do">1. 동영상 리스트 페이지</a><br>
		<a href="${path}/lecture/online_list.do">2. 실시간 강의 리스트 페이지</a><br>
		<a href="${path}/lecture/offline_list.do">3. 현장 강의 리스트 페이지</a><br>
		<hr>
		<a href="${path}/lecture/all_list.do">모든 강의 리스트</a><br>
	</div>
	
	<div style="width: 68%; height: 500px; float: right; border: 1px solid;">
		<h2>테스트 중</h2>
	
	</div>
</div>
</body>
</html>
<%-- <%@ include file="../include/footer.jsp"%> --%>