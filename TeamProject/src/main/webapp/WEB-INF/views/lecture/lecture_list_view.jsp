<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
<c:choose>
	<c:when test="${dto.cell_type == 1}"><h2>동영상 강의</h2></c:when>
	<c:when test="${dto.cell_type == 2}"><h2>실시간 강의</h2></c:when>
	<c:when test="${dto.cell_type == 3}"><h2>현장 강의</h2></c:when>
</c:choose>
<hr>
인덱스 번호 : ${dto.lecture_idx}<br>
판매타입 : ${dto.cell_type}<br>
메인 카테고리 : ${dto.main_category}<br>
서브 카테고리 : ${dto.sub_category}<br>
유저아이디 : ${dto.userid}<br>
제목 : ${dto.subject}<br>
썸네일 : <img width="300px" height="100px" src="../upload/${dto.main_img}"><br>

<c:if test="${dto.cell_type != 3}">
비디오 파일 : ${dto.videofile}<br> 
<video controls="controls" width="100%" preload="metadata">
	<source src="../upload${dto.videofile}" type="video/mp4">
</video><br>
</c:if>
컨텐츠 : ${dto.content}<br>
업로드 날짜 : ${dto.upload_date}<br>
가격 : ${dto.price}<br>
강의 날짜 : ${dto.lecture_date}<br>
강의 시작시간 : ${dto.lecture_start}<br>
강의 시간 : ${dto.lecture_time}<br>
강의주소 : ${dto.lecture_address}<br>
강의 상세주소 : ${dto.lecture_address2}<br>
<hr>
<input type="button" value="구입">
 <input type="button" value="뒤로" onclick="history.back()">
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>