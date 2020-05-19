<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kdemy 강의</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
</head>
<body style="background-color: black">
<div class="row col-12 mx-auto my-0">
	<div class="col-12 d-block d-xl-flex" style="clear: ">
		<div id="videoDiv" class="col-12 col-lg-10 w-100 mx-auto">
			<video class="mx-auto" controls="controls" muted="muted" height="100%" width="100%">
				<source src="../include/images/upload${dto.videofile}" type="video/mp4">
			</video>
		</div> 
		
		<div class="d-none d-xl-flex col-xl-2 px-0 card" style="background-color: white;">
			<img class="card-img-top img-fluid" style="max-height: 197px" alt="" src="${path}/lecture/displayFile?fileName=${dto.main_img}">
			
			<div class="card-body">
				<h2 class="card-title">${dto.subject}</h2>
				<p class="cart-text">영상에 대한 강의 상세 정보...</p>
			</div>

			<div class="card-footer">
				<input class="btn btn-primary col-12 mb-1" type="button" value="구매한 강의 목록" onclick="location.href='${path}/member/orderDetail1.do'">
				<input class="btn btn-success col-12 mb-1" type="button" value="다른 강의 보기" onclick="location.href='${path}/lecture/all_list.do'">
				<input class="btn btn-secondary col-12 mb-1" type="button" value="나가기" onclick="history.back()">
			</div>
		</div>
		
		<div class="d-block d-xl-none col-12 px-0" style="background-color: white">
			<div class="mx-0 mb-3 p-0 d-flex">
				<div class="col-sm-6 col-md-3">
					<img class="img-fluid" style="max-height: 197px" alt="" src="../upload${dto.main_img}">
				</div>
				<div class="col-sm-6 col-md-9">
					<h2 class="card-title">${dto.subject}</h2>
					<p class="cart-text">영상에 대한 강의 상세 정보...</p>
				</div>
			</div>
			
			<div class="col-12 d-flex d-md-block">
				<input class="btn btn-primary col-4 col-md-12 mb-1" type="button" value="구매한 강의 목록" onclick="location.href='${path}/member/orderDetail1.do'">
				<input class="btn btn-success col-4 col-md-12 mb-1" type="button" value="다른 강의 보기" onclick="location.href='${path}/lecture/all_list.do'">
				<input class="btn btn-secondary col-4 col-md-12 mb-1" type="button" value="나가기" onclick="history.back()">
			</div>
		</div>
	</div>
</div>
<%-- <%@ include file="../include/footer.jsp"%> --%>
</body>
</html>