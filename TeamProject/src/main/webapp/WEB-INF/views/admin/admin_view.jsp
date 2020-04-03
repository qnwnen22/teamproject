<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">관리자 수정</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<form id="adminUpdate" name="adminUpdate"
					action="${path}/admin/updateAdmin.do" method="post">

					<div class="form-group">
						<label for="admin_id">아이디</label> <input type="text"
							class="form-control mb-1" id="mdadmin_id" name="admin_id"
							value="${dto.admin_id}"><br> <label
							for="admin_passwd">비밀번호</label> <input type="password"
							class="form-control mb-1" id="mdadmin_passwd" name="admin_passwd"
							value="${dto.admin_passwd}"><br> <label
							for="admin_name">이름</label> <input type="text"
							class="form-control mb-1" id="mdadmin_name" name="admin_name"
							value="${dto.admin_name}"><br> <label for="admin_hp">연락처</label>
						<input type="text" class="form-control mb-1" id="mdadmin_hp"
							name="admin_hp" value="${dto.admin_hp}"><br> <label
							for="admin_email">이메일</label> <input type="text"
							class="form-control mb-1" id="mdadmin_email" name="admin_email"
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
						<button type="submit" class="btn btn-outline-warning">수정</button>
						<button type="submit" class="btn btn-outline-danger">삭제</button>
						<button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>