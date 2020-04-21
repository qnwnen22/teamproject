<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="modal-dialog">
	<div class="modal-content">

		<!-- Modal Header -->
		<div class="modal-header">
			<h4 class="modal-title">강사권한 승인</h4>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>

		<!-- Modal body -->
		<div class="modal-body">
			<form id="requestApproval" name="requestApproval"
				action="#" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="teacher_thumbnail">프로필</label><br>
					<img src="../include/images/teacher/${dto.teacher_thumbnail}"
							class="align-self-center mx-auto d-block" style="width: 200px"><br>
					<label for="userid">아이디</label> <input type="text"
						class="form-control mb-1" id="userid" name="userid"
						value="${dto.userid}" readonly><br> <label
						for="username">성명</label> <input type="text"
						class="form-control mb-1" id="username" name="username"
						value="${dto.username}" readonly><br>
					<label for="university">대학교</label> <input type="text"
						class="form-control mb-1" id="schoolname" name="schoolname"
						value="${dto.schoolname}" readonly><br>
						<label for="spec1_img">자격증</label><br>
						<img src="../include/images/teacher/${dto.spec1_img}"
							class="align-self-center mx-auto d-block" style="width: 200px"><br>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-success" onclick="location.href='${path}/member/approval.do?userid=${dto.userid}'">승인</button>
					<button type="submit" class="btn btn-outline-danger" onclick="location.href='${path}/member/reject.do?userid=${dto.userid}'">거절</button>
					<button type="button" class="btn btn-outline-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>