<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<h2>lectureView_success</h2>
강의 고유 번호(lecture_idx) : ${ldto.lecture_idx}<br>
아이디 : ${sessionScope.userid}<br>
비디오 파일 : ${ldto.videofile}<br> 
		<video controls="controls" width="100%" preload="metadata">
			<source src="../upload${ldto.videofile}" type="video/mp4">
		</video><br>
</body>
</html>