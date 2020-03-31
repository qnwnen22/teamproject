<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<style type="text/css">
.upper_shift {
	padding: 10px 16px;
	list-style: none;
}

.upper_shift li {
	display: inline;
	font-size: 1.5em;
}

.upper_shift li+li:before {
	padding: 8px;
	color: black;
	content: ">\00a0";
}

.upper_shift li a {
	color: black;
	text-decoration: none;
}

.upper_shift li a:hover {
	font-size: 1.1em;
	color: #01447e;
}

</style>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/fixed-topbar.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>
<script src="${path}/include/js/common.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#content').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

		});
	});

	function attachAddr() {
		const str = `<input type="file" class="form-control-file" id="exampleFormControlFile1">`;
		$(".Plus_one").append(str);
	}


	function GoList(){
		location.href="${path}/board/list.do";
		}

	function GoUpdate(){
		var str="";
		$("#form1").append(str);
		document.form1.action="${path}/board/edit/${dto.bno}";
		document.form1.submit();
		}

	function GoDelete(){
		var passwd=prompt("비밀번호를 입력하세요");
		if(sessionScope.passwd==passwd){
			var del_confirm=confirm("삭제하시겠습니까?");
			if(del_confirm==true){
					document.form1.action="${path}/board/delete.do";
					document.form1.submit();
				}
			}else{
				alert("비밀번호가 틀렸습니다.");
				}
		}
</script>

</head>
<body>
	<br>
	<br>
	<div class="container">
		<div class="justify-content-md-center">
			<form id="form1" name="form1" method="post"
				action="${path}/board/insert.do">
				<div>
					<ul class="upper_shift">
						<li><a href="${path}">KDEMY</a></li>
						<li><a href="${path}/board/list.do">공지사항</a></li>
					</ul>
				</div>
				<br> <br>

				<div>
					<table class="table" border="1">
						<tr>
							<td>제목</td>
							<td>${dto.title}</td>
							<td>조회수</td>
							<td>${dto.viewcnt}</td>
						</tr>

						<tr>
							<td>작성자</td>
							<td colspan="3">${dto.writer}</td>
						</tr>

						<tr >
							<td>내용</td>
							<td colspan="3">${dto.content}</td>
						</tr>

						<tr>
							<td>첨부파일</td>
							<td colspan="3"></td>
						</tr>

					</table>
				</div>
			</form><br>

			<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
			<input type="hidden" name="bno" value="${dto.bno}">
			<div class="btn-group float-right" role="group" aria-label="Basic example">
						<%-- <c:if test="${sessionScope.userid == dto.writer}"> --%>
							<button type="button" class="justify-content-end  btn btn-sm btn-primary font-color-fff btn-normal-silver"
								data-toggle="button" aria-pressed="false" onclick="GoUpdate()">
								수정</button>
							<button type="button" class="justify-content-end  btn btn-sm btn-primary font-color-fff btn-normal-silver"
								data-toggle="button" aria-pressed="false" id="btnDelete" onclick="GoDelete()">
								삭제</button>
					<%-- 	</c:if> --%>
						<button type="button" class="btn btn-sm btn-primary justify-content-end  font-color-fff btn-normal-silver" data-toggle="button"
							aria-pressed="false" onclick="GoList()">목록</button>
				</div>
		</div>

		<br>
		<br>
		<br>







		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>

