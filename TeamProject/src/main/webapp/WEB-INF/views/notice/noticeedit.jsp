<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/upper.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
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

	function GoList() {
		var go_confirm = confirm("입력하신 내용은 저장이 되지 않습니다. 그래도 나가시겠습니까?");
		if (go_confirm == true) {
			location.href = "${path}/notice/list.do";
		}
	}
</script>

</head>
<body>
	<%@ include file="../include/fixed-topbar.jsp"%>
	<div class="container-xl col-xl-8 offset-xl-2 col-lg-12">
				<div>
					<ul class="upper_shift">
						<li><a href="${path}">KDEMY</a></li>
						<li><a href="${path}/notice/list.do">공지사항</a></li>
					</ul>
				</div>

			<form id="form1" name="form1" method="post"
				action="${path}/notice/update.do">
				<div class="form-group mb-4">
					<label for="formGroupExampleInput">제목</label> <input type="text"
						class="form-control" id="title" name="title" value="${dto.title}">
				</div>




				<div class="mb-3 was-validated mb-4">
					<label for="validationTextarea">내용</label>
					<textarea class="form-control is-invalid form-control-lg "
						id="content" name="content" required cols="400">${dto.content}</textarea>
				</div>
				
				
				 <input type="hidden" name="bno" value="${dto.bno}">



				<div class="btn-group float-right mb-5" role="group"
					aria-label="Basic example">
					<button type="submit"
						class="justify-content-end  btn btn-sm btn-primary font-color-fff btn-normal-silver"
						data-toggle="button" aria-pressed="false">확인</button>
					<button type="button"
						class="btn btn-sm btn-primary justify-content-end  font-color-fff btn-normal-silver"
						data-toggle="button" aria-pressed="false" onclick="GoList()">취소</button>
				</div>
			</form>


			<br>


		</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>