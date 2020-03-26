<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/fixed-topbar.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#btnUpdate").click(function() {
			document.adminupdate.action = "${path}/admin/updateAdmin.do";
			document.adminupdate.submit();
		});
		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.adminupdate.action = "${path}/admin/deleteAdmin.do";
				document.adminupdate.submit();
			}
		});
	});
</script>
</head>
<body>
	<div class="container" style="margin-top: 170px;">
		<!-- Modal Header -->
		<div class="modal-header">
			<h4 class="modal-title">관리자 정보 수정</h4>
		</div>
		<div class="modal-body">
			<form id="adminupdate" name="adminupdate" method="post">
				<div class="form-group">
					<label for="admin_id">아이디</label> <input type="text"
						class="form-control mb-1" id="admin_id" name="admin_id"
						value="${dto.admin_id}"><br> <label
						for="admin_passwd">비밀번호</label> <input type="password"
						class="form-control mb-1" id="admin_passwd" name="admin_passwd"
						value="${dto.admin_passwd}"><br> <label
						for="admin_name">이름</label> <input type="text"
						class="form-control mb-1" id="admin_name" name="admin_name"
						value="${dto.admin_name}"><br> <label for="admin_hp">연락처</label>
					<input type="text" class="form-control mb-1" id="admin_hp"
						name="admin_hp" placeholder="ex)01012345678"
						value="${dto.admin_hp}"><br> <label for="admin_email">이메일</label>
					<input type="text" class="form-control mb-1" id="admin_email"
						name="admin_email" placeholder="ex)abc@naver.com"
						value="${dto.admin_email}"><br> <label
						for="admin_level">권한</label> <select class="form-control"
						id="admin_level" name="admin_level">
						<option value="3">Master</option>
						<option value="2">Manager</option>
						<option value="1" selected>Staff</option>
					</select>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" id="btnUpdate"
						class="btn btn-outline-warning">수정</button>
					<button type="submit" id="btnDelete" class="btn btn-outline-danger">삭제</button>
					<button type="button" class="btn btn-outline-secondary"
						data-dismiss="modal"
						onclick="location.href='${path}/admin/list.do'">취소</button>
				</div>
			</form>
		</div>
	</div>
	<br>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>