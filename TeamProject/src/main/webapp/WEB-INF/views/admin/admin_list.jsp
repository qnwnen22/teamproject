<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	function adminView(mdadmin_id) {
		var inputed = mdadmin_id;
		console.log(inputed);
		$.ajax({
			data : {
				admin_id : inputed
			},
			url : "${path}/admin/admin_view.do",
			type : "POST",
			success : function(data) {
				if (data != null) {
					$('#updateModal').html(data);
					$('#updateModal').show();
				}
			}
		});

	}
	function deleteAdmin(){
		href.location="${path}/admin/deleteAdmin.do";
	}
		
</script>
</head>
<body>
<%@ include file="../include/fixed-topbar.jsp"%>
<<<<<<< HEAD
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3 table-responsive">
=======
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3">
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/admin/managementMenu.do">관리메뉴</a></b></li>
				<li><b><a href="${path}/admin/list.do" style="color:blue;">관리자계정</a></b></li>
			</ul>
		</div>
<<<<<<< HEAD
		<br>
		<table class="table table-bordered table-hover">
=======
		<table class="table table-bordered table-hover text-center">
>>>>>>> branch 'master' of https://github.com/qnwnen22/teamproject.git
			<thead class="thead-dark">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>권한레벨</th>
					<th>가입일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}">
					<tr style="cursor:pointer;" onclick="adminView('${row.admin_id}')"
							data-toggle="modal" data-target="#updateModal">
						<td>${row.admin_id}</td>
						<td>${row.admin_name}</td>
						<td>${row.admin_email}</td>
						<td>${row.admin_hp}</td>
						<td>${row.admin_level}</td>
						<td><fmt:formatDate value="${row.join_date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<div class="d-flex">
		<button class="btn btn-outline-primary ml-auto" data-toggle="modal"
			data-target="#myModal">추가</button>
		</div>
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">관리자 추가</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form id="adminjoin" name="adminjoin"
							action="${path}/admin/insertAdmin.do" method="post">
							<div class="form-group">
								<label for="admin_id">아이디</label> <input type="text"
									class="form-control mb-1" id="admin_id" name="admin_id"><br>
								<label for="admin_passwd">비밀번호</label> <input type="password"
									class="form-control mb-1" id="badmin_passwd" name="badmin_passwd"><br>
								<label for="admin_name">이름</label> <input type="text"
									class="form-control mb-1" id="admin_name" name="admin_name"><br>
								<label for="admin_hp">연락처</label> <input type="text"
									class="form-control mb-1" id="admin_hp" name="admin_hp"
									placeholder="ex)01012345678"><br> <label
									for="admin_email">이메일</label> <input type="text"
									class="form-control mb-1" id="admin_email" name="admin_email"
									placeholder="ex)abc@naver.com"><br> <label
									for="admin_level">권한</label> <select class="form-control"
									id="admin_level" name="admin_level">
									<option value="3">Master</option>
									<option value="2">Manager</option>
									<option value="1" selected>Staff</option>
								</select>
							</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">가입</button>
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="updateModal"></div>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>