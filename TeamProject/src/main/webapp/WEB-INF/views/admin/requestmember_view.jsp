<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="modal-dialog modal-lg">
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
				<div class="d-flex col-12">
					<label for="teacher_thumbnail">프로필</label><br>
					<img src="${path}/include/images/teacher/${dto.teacher_thumbnail}"
							class="align-self-center mx-auto d-block" style="width: 200px"><br>
							</div>
							<div class="d-flex">
							<div class="col-6">
					<label for="userid">아이디</label> <input type="text"
						class="form-control mb-1" id="userid" name="userid"
						value="${dto.userid}" readonly><br>
						</div> 
						</div>
						<div class="d-flex">
						<div class="col-6">
						<label
						for="username">성명</label> <input type="text"
						class="form-control mb-1" id="username" name="username"
						value="${dto.username}" readonly><br>
						</div>
						<div class="col-6">
						<label for="nickname">닉네임</label> <input type="text"
						class="form-control mb-1" id="nickname" name="nickname"
						value="${dto.nickname}" readonly><br>
						</div>
						</div>
						<hr>
						<div class="d-flex">
						<div class="col-6">
					<label for="finalEducation">학력</label> <input type="text"
						class="form-control mb-1" id="finalEducation" name="finalEducation"
						value="${dto.finalEducation}" readonly><br>
						</div>
						<div class="col-6">
						<label for="schoolname">학교</label>	<input type="text"
						class="form-control mb-1" id="schoolname" name="schoolname"
						value="${dto.schoolName}" readonly><br>
						</div>
						</div>
						<div class="d-flex">
						<div class="col-6">
						<label for="department">학과</label> <input type="text"
						class="form-control mb-1" id="department" name="department"
						value="${dto.department}" readonly><br>
						</div>
						</div>
						<hr>
						<div class="d-flex">
						<div class="col-6">
						<label for="spec1">자격증</label>
						<input type="text"
						class="form-control mb-1" id="spec1" name="spec1"
						value="${dto.spec1}" readonly><br>
						<img src=" ${path}/include/images/teacher/${dto.spec1_img}"
							class="align-self-center mx-auto d-block" style="width: 200px"><br>
							</div>
							</div>
							<div class="d-flex">
							<div class="col-12">
						<label for=career>경력사항</label>
						<input type="text"
						class="form-control mb-1" id="career" name="career"
						value="${dto.career}" readonly><br>
						</div>
						</div>
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