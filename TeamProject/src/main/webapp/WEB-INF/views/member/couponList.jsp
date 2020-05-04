<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style type="text/css">
label {
	width: 20%;
}
.form-control {
	width: 80%;
}
/* div{border: 1px solid black;} */
</style>
</head>
<body>
	<div class="row mb-0">
		<c:forEach var="dto" items="${couponList}">
			<br>
			<div class="col-sm-3">
				<div class="card mb-5 mb-lg-0">
					<div class="card-body">
						<h5 class="card-title text-muted text-uppercase text-center">${dto.coupon_name}</h5>
						<h6 class="card-price text-center">￦${dto.point}</h6>
						<hr>
						<form name="form" id="form" action="selectCoupon.do" method="post">
							<ul class="fa-ul">
								<li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰번호는
									${dto.coupon}입니다.</li>
								<li><span class="fa-li"><i class="fas fa-check"></i></span>${dto.point}포인트</li>
								<li><span class="fa-li"><i class="fas fa-check"></i></span>${dto.coupon_text}</li>
							</ul>
							<input type="hidden" value="${dto.coupon}" id="coupon"
								name="coupon"> <input type="hidden" value="${dto.point}"
								id="point" name="point"> <input type="hidden"
								value="${dto.coupon_text}" id="coupon_text" name="coupon_text">
							<input type="hidden" value="${dto.coupon_name}" id="coupon_name"
								name="coupon_name">
								<div class="d-flex justify-content-center">
							<button type="submit"
								class="btn btn-outline-primary mr-3 col-5"
								id="selectCoupon">선택</button>
								<button type="button"
								class="btn btn-outline-danger col-5" onclick="location.href='${path}/member/deleteCoupon.do?coupon=${dto.coupon}'"
								id="deleteCoupon">삭제</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>