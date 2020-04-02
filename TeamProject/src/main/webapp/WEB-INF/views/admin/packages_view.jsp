<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="modal-dialog">
	<div class="modal-content">

		<!-- Modal Header -->
		<div class="modal-header">
			<h4 class="modal-title">패키지 수정</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>

		<!-- Modal body -->
		<div class="modal-body">
			<form id="packagesUpdate" name="packagesUpdate"
				action="${path}/packages/packagesUpdate.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="packages_name">상품명</label> <input type="text"
						class="form-control mb-1" id="packages_name" name="packages_name"
						value="${dto.packages_name}"><br> <label
						for="packages_text">내용</label> <input type="text"
						class="form-control mb-1" id="packages_text" name="packages_text"
						value="${dto.packages_text}"><br> <label
						for="packages_price">가격</label> <input type="text"
						class="form-control mb-1" id="packages_price"
						name="packages_price" value="${dto.packages_price}"><br>
					<label for="packages_date">이용기간</label> <input type="text"
						class="form-control mb-1" id="packages_date" name="packages_date"
						value="${dto.packages_date}"><br> <label
						for="packages_image">현재 이미지</label><input type="hidden"
						class="form-control mb-1" id="packages_image"
						name="packages_image" value="${dto.packages_image}"><br><img src="../include/images/coupon/${dto.packages_image}"
							class="align-self-center mx-auto d-block" style="width: 300px"><br>
							<label
						for="file2">이미지 변경</label><br>
							<input type="file" class="mb-1" name="file1"
										id="file1">
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-outline-warning">수정</button>
					<button type="button" class="btn btn-outline-danger"
						onclick="location.href='${path}/packages/deletepackages.do?packages_name=${dto.packages_name}'">삭제</button>
					<button type="button" class="btn btn-outline-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>