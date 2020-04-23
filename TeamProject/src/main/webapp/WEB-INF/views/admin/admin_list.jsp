<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script src="${path}/include/js/adminJoin.js"></script>
<script type="text/javascript">
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);
//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
//아이디 체크하여 가입버튼 비활성화, 중복확인.
function checkId() {
    var inputed = $('#userid').val();
    $.ajax({
        data : {
            userid : inputed
        },
        url : "${path}/admin/checkId.do",
        success : function(data) {
            if (data == '0') {
                    $("#userid").css("border", "2px solid #71c9ce");
                    $("#CheckMM").html("");
            } else if (data == '1') {
                $("#userid").css("border", "2px solid red");
                $("#CheckMM").html("<b style='color:red'>중복된 아이디 입니다.</b>");
            } else if(data == '2') {
    			$("#CheckMM").html("");
                }
        }
    });
}
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
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3">
		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/admin/managementMenu.do">관리메뉴</a></b></li>
				<li><b><a href="${path}/admin/list.do" style="color:blue;">관리자계정</a></b></li>
			</ul>
		</div>
		<br>
		<table class="table table-bordered table-hover text-center">
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
								<label for="userid">아이디</label>&nbsp;<span id="CheckM"></span><span id="CheckMM"></span> <input type="text"
									class="form-control mb-1" id="userid" name="userid" oninput="checkId()"><br>
								<label for="bpasswd">비밀번호</label><span id="bpasswdM"></span><input type="password"
									class="form-control mb-1" id="bpasswd" name="bpasswd"><br>
								<label for="passwdCheck">비밀번호 확인</label><span id="passwdCheckM"></span> <input type="password"
								    class="form-control mb-1" id="passwdCheck" name="passwdCheck"><br>
								<label for="username">이름</label><span id="usernameM"></span> <input type="text"
									class="form-control mb-1" id="username" name="username"><br>
								<label for="phone">연락처</label><span id="phoneM"></span><input type="text"
									class="form-control mb-1" id="phone" name="phone"
									placeholder="ex)01012345678"><br> <label
									for="useremail">이메일</label><span id="useremailM"></span> <input type="text"
									class="form-control mb-1" id="useremail" name="useremail"
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
								<button type="submit" class="btn btn-primary" id="join-submit">가입</button>
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