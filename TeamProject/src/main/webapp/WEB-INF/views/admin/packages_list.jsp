<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp"%>
</head>
<body>
	<%@include file="../include/fixed-topbar.jsp"%>
	<div class="container" style="margin-top: 170px;">
		<div class="table-responsive">
			<br>
			<button class="btn btn-outline-primary mb-1" data-toggle="modal"
				data-target="#addModal">패키지 추가</button>
			<div class="modal" id="addModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">패키지 추가</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<form id="adminjoin" name="adminjoin" action="#" method="post">
								<div class="form-group">
									<label for="packages_name">패키지명</label> <input type="text"
										class="form-control mb-1" id="packages_name"
										name="packages_name"><br> <label for="packages_text">내용</label>
									<input type="text" class="form-control mb-1" id="packages_text"
										name="packages_text"><br> <label for="packages_price">가격</label>
									<input type="text" class="form-control mb-1"
										id="packages_price" name="packages_price"><br>
									<label for="packages_date">이용기간</label> <input type="text"
										class="form-control mb-1" id="packages_date"
										name="packages_date"><br>
									<label for="packages_image">패키지 이미지</label>
									<input type="file" class="mb-1" name="packages_image" id="packages_image">
									<br>
								</div>
								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-outline-primary">등록</button>
									<button type="button" class="btn btn-outline-danger"
										data-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>이미지</th>
						<th>이름</th>
						<th>내용</th>
						<th>가격</th>
						<th>이용기간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="#" items="#">
						<tr>
							<td><img src="../include/images/coupon/kdemycoupon1.png"
								class="align-self-center" style="width: 200px"></td>
							<td>${dto.packages_name}정기이용권(30일)</td>
							<td>${dto.packages_text}30일간VOD서비스를 무제한으로 즐기실 수 있습니다.</td>
							<td>${dto.packages_price}20000</td>
							<td>${dto.packages_date}30일</td>
						</tr>
						<tr>
							<td><img src="../include/images/coupon/kdemycoupon3.png"
								class="align-self-center" style="width: 200px"></td>
							<td>${dto.packages_name}정기이용권(90일)</td>
							<td>${dto.packages_text}90일간VOD서비스를 무제한으로 즐기실 수 있습니다.</td>
							<td>${dto.packages_price}55000</td>
							<td>${dto.packages_date}90일</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 페이징 처리 -->
		<div class="row justify-content-center">
			<nav aria-label="Page navigation example center-block">
				<ul class="pagination">
					<c:if test="${map.pager.curBlock>1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('1')">&lt;&lt;</a></li>
					</c:if>
					<c:if test="${map.pager.curBlock >1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.prevPage}')">&lt;</a></li>
					</c:if>
					<c:forEach var="num" begin="${map.pager.blockBegin}"
						end="${map.pager.blockEnd}">
						<c:choose>
							<c:when test="${num==map.pager.curPage}">
								<li class="page-item"><a class="page-link">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#"
									onclick="list('${num}')">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.pager.curBlock < map.pager.totBlock}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.nextPage}')">&gt;</a></li>
					</c:if>
					<c:if test="${map.pager.curPage <map.pager.totPage}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.totPage}')">&gt;&gt;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>