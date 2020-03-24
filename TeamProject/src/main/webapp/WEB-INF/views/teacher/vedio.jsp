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
<div style="width:100%; margin: 0 auto; width: 500px; background: gray;">
<h2>영상 강의 페이지</h2>
<p>동영상 강의를 올리는 페이지 입니다.</p>
판매타입 : 3<input type="hidden" value="1" name="number" id="number"><br>
카테고리 선택1
<select>
	<option>HTML</option>
	<option>DB</option>
	<option>JSP</option>
	<option>Spring</option>
</select><br>
카테고리 선택2
<select>
	<option>HTML</option>
	<option>DB</option>
	<option>JSP</option>
	<option>Spring</option>
</select><br>

아이디 : <input name="userid" id="userid" value="아이디" readonly><br>
영상 제목 : <input name="vedio" id="vedio"><br>
영상 설명 : <textarea style="width: 100%;" rows="10" cols="40"></textarea><br>
<input type="submit" value="영상 등록">  <input type="button" value="취소">





</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>