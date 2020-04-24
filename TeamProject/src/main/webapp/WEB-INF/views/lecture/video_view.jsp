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
<body style="background-color: black">
<div class="row col-12 mx-auto my-0">
	<div class="col-12 d-flex">
		<div class="col-2 px-0 card" style="background-color: white;">
			<div class="p-0 mx-0 card-header">
				<img class="img-fluid" style="width: 100%; max-height: 197px" alt="" src="../upload${dto.main_img}">
			</div>
			
			<div class="mt-2 card-body">
				<h2 class="card-title">${dto.subject}</h2>
				<p class="cart-text">여기엔 뭐넣지?</p>
			</div>

			<div class="card-footer">
				<input class="btn btn-primary col-12 mb-1" type="button" value="구매한 강의 목록" onclick="location.href='${path}/member/orderDetail1.do'">
				<input class="btn btn-success col-12 mb-1" type="button" value="다른 강의 보기" onclick="location.href='${path}/lecture/all_list.do'">
				<input class="btn btn-secondary col-12 mb-1" type="button" value="나가기" onclick="history.back()">
			</div>
		</div>
		
		<div class="col-10 w-100">
			<video controls="controls" muted="muted" height="100%" width="100%">
				<source src="../upload${dto.videofile}" type="video/mp4">
			</video>
		</div>
	</div>
</div>
<%-- <%@ include file="../include/footer.jsp"%> --%>
</body>
</html>