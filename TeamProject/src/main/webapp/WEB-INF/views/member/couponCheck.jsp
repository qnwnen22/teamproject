<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script src="${path}/member/js/coupon.js"></script>
<%@ include file="../include/fixed-topbar.jsp"%>
<script>
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
	}, true);

	$(function() {
		var responseMessage = "<c:out value="${message}" />";
		if (responseMessage != "") {
			alert(responseMessage)
		}
	})

	/*  $(function(){
	 $('#btn').on('click', function(){
	 $.ajax({
	 type: 'POST',
	 url: "${path}/member/updatePoint.do",
	 data: {
	 "userid":$('#userid'.val(),
	 "coupon" : $('#coupon').val()   
	 },success: function(data){
	 $('#successText').html('포인트가 적립되었습니다.');
	 }
	 });    //end ajax    
	 });    //end on   
	 }); */
</script>
</head>
<body class="Kdemy">
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3 Kdemy-content">
		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/member/updatePointPage.do"
						style="color: blue;">쿠폰등록</a></b></li>
			</ul>
		</div>
		<hr>
		<div class="d-flex">
			<div
				class="card col-sm-8 offset-sm-2 text-center d-flex align-items-center">
				<img class="card-img-top" src="img/coupon_box.jpg" alt="Card image"
					style="opacity: 0.6">
				<div class="card-img-overlay" style="margin-top: 140px;">
					<h4 class="card-title mb-5"></h4>
					<h6 class="card-title ">쿠폰 번호를 입력해 주세요</h6>
					<form method="post" id="form1" name="form1"
						action="${path}/member/updatePoint.do" class="form-horizontal">
						<div class="input-group input-group-sm my-5 ml-4 col-sm-11 align-items-center">
							<input type="text" class="form-control" id="key1" maxlength="4"><span
								class="input-group-addon">-</span> <input type="text"
								class="form-control" id="key2" maxlength="4"><span
								class="input-group-addon">-</span> <input type="text"
								class="form-control" id="key3" maxlength="4"><span
								class="input-group-addon">-</span> <input type="text"
								class="form-control" id="coupon" name="coupon" maxlength="4">
						</div>
						<div class=" mb-1" id="keyM"></div>
						<input class="mb-3" type="hidden" id="userid" name="userid"
							value="${sessionScope.userid}">
						<button class="btn btn-primary" type="submit" id="btn">쿠폰등록</button>
						
						<!--     	<div class="TextBox">
			<p id="successText" style="color:blue;"></p> -->
					</form>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>