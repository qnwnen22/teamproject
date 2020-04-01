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
<h2>전문가 등록 페이지</h2>
<c:choose>
	<c:when test="${sessionScope.teacher == 'n'}">
		<form method="post"
			enctype="multipart/form-data"
			action="${path}/teacher/teacherInsert.do">
			아이디 : <input type="text" value="${sessionScope.userid}" readonly name="userid"><br>
			이름 : <input type="text" value="${sessionScope.username}" readonly name="username" ><br>
			프로필 사진 등록 : <input type="file" name="file1" id="file1"><br>
			졸업한 고등학교 : <input type="text" name="highschool"><br>
			졸업한 대학교 : <input type="text" name="university"><br>
			자격증 이름 : <input type="text" name="spec1"> | <input type="button" value="자격증 검색(기능 미구현)"><br>
			자격증 이미지 : <input type="file" name="file2" id="file2"><br>
			자격증 획득 일자 <input type="date" name="spec1_getDate"><br>
			<input type="button" value="추가"><br>
			<p>자격증은 최대 5개 까지 등록할 수 있습니다.(미구현)</p>
			<input type="submit" value="강사 신청하기">
		</form>
	</c:when>
	
	<c:when test="${sessionScope.teacher == 'w'}">
		<h1>신청 대기중 입니다...</h1>
		
	</c:when>
	
	<c:when test="${sessionScope.teacher == 'y'}">
		<h1>이미 강사 회원입니다.</h1>
	</c:when>
	<c:otherwise>
		<h2>세션이 없습니다. 로그인 에러</h2>
	</c:otherwise>
</c:choose>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>