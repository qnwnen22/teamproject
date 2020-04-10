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
	<div class="container-lg loginDiv">
		<div class="page-header col-xl-8 offset-xl-2 text-center">
			<h2>로그인 </h2>
		</div>
		<div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 offset-xl-2 offset-lg-2 joinForm" style="padding-left: 10px; padding-right: 10px;">
			<form method="post" id="loginForm" name="loginForm" action="${path}/member/login.do" class="form-horizontal">
				<div class="form-group">
					<label for="userid">아이디</label>
					<input type="text" class="form-control" id="userid" name="userid">
					
					<div><c:if test="${message!=null}"><b>${message}</b></c:if></div>			
				</div>
				<div class="form-group">
					<label for="passwd">비밀번호</label>
					<input type="password" class="form-control" id="passwd" name="passwd">
				</div>
				<div class="form-group text-center">
					<button type="submit" id="join-submit" class="btn btn-primary">
						로그인
					</button>
				</div>
					<div style="text-align: left;"><a href="${path}/member/searchId.do" class="more">아이디 찾기</a></div>
					<span><a href="${path}/member/searchpass.do" class="more">비밀번호 찾기</a></span>
					
			</form>
		</div>
	</div>
</body>
</html>