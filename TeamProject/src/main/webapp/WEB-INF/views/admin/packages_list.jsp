<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp"%>
<script type="text/javascript">
$(function(){
	listview();
});
function listview(){
	$.ajax({
		type: "post",
		url: "${path}/packages/adminlist.do",
	});
}
	function packagesView(packages_name) {
		var inputed = packages_name;
		console.log(inputed);
		$.ajax({
			data : {
				packages_name : inputed
			},
			url : "${path}/packages/packages_view.do",
			type : "POST",
			success : function(data) {
				if (data != null) {
					$("#updateModal").html(data);
					$("#updateModal").show();
				}
			}
		});

	}
</script>
</head>
<body>
	<%@include file="../include/fixed-topbar.jsp"%>
	<div id="list"></div>
<<<<<<< HEAD
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12" style="margin-top: 170px;">
=======
	<div class="container">
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
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
							<form id="addPackages" name="addPackages"
								action="${path}/packages/insert.do" method="post"
								enctype="multipart/form-data">
								<div class="form-group">
									<label for="packages_name">패키지명</label> <input type="text"
										class="form-control mb-1" id="packages_name"
										name="packages_name"><br> <label
										for="packages_text">내용</label> <input type="text"
										class="form-control mb-1" id="packages_text"
										name="packages_text"><br> <label
										for="packages_price">가격</label> <input type="text"
										class="form-control mb-1" id="packages_price"
										name="packages_price"><br> <label
										for="packages_date">이용기간</label> <input type="text"
										class="form-control mb-1" id="packages_date"
										name="packages_date"><br> <label for="file1">패키지
										이미지</label><br> <input type="file" class="mb-1" name="file1"
										id="file1"> <br>
								</div>
								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-outline-primary">등록</button>
									<button type="button" class="btn btn-outline-secondary"
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
				<c:forEach var="row" items="${list}">
					<tr onclick="packagesView('${row.packages_name}')" style="cursor:pointer;" data-toggle="modal" data-target="#updateModal">
						<td><img src="../include/images/coupon/${row.packages_image}"
							class="align-self-center" style="width: 200px"></td>
						<td>${row.packages_name}</td>
						<td>${row.packages_text}</td>
						<td><fmt:formatNumber value="${row.packages_price}"
								pattern="#,###" /></td>
						<td>${row.packages_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="modal" id="updateModal"></div>
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
	<div class="modal" id="updateModal"></div>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>