<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#title_css .display-4 {
	font-size: 2.3rem !important;
}

#title_css .jumbotron {
	background-color: white !important;
}
</style>

<%@ include file="../include/header.jsp"%>
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

	function GoList() {
		location.href = "${path}/notice/list.do";
	}

	function GoUpdate() {
		var str = "";
		$("#form1").append(str);
		document.form1.action = "${path}/notice/edit/${dto.bno}";
		document.form1.submit();
	}

	function GoDelete() {
		var del_confirm = confirm("삭제하시겠습니까?");
		if (del_confirm == true) {
			document.form1.action = "${path}/notice/delete/${dto.bno}";
			document.form1.submit();
		}
	}

	var currentPosition = parseInt($("#dif_view").css("top"));
	$(window).scroll(function() {
		var position = $(window).scrollTop();
		$("#dif_view").stop().animate({
			"top" : position + currentPosition + "px"
		}, 1000);
	});
</script>

</head>
<body>
	<%@ include file="../include/fixed-topbar.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="justify-content-md-center">
			<div>
				<ul class="upper_shift">
					<li><a href="${path}">KDEMY</a></li>
					<li><a href="${path}/notice/list.do">공지사항</a></li>
				</ul>
			</div>
			<br> <br>
			<form name="form1" id="form1">
				<div class="container">
					<div class="row">
						<!--  옆에 다른글 보기-->
						<div id="dif_view">
							<div class="list-group col-sm-2">
								<a href="#" class="list-group-item list-group-item-action">
									Cras justo odio </a> <a href="#"
									class="list-group-item list-group-item-action">Dapibus ac
									facilisis in</a> <a href="#"
									class="list-group-item list-group-item-action">Morbi leo
									risus</a> <a href="#"
									class="list-group-item list-group-item-action">Porta ac
									consectetur ac</a> <a href="#"
									class="list-group-item list-group-item-action disabled"
									tabindex="-1" aria-disabled="true">Vestibulum at eros</a>
							</div>
						</div>
						<div class="col-sm-10">

							<div id="title_css">
								<div class="jumbotron jumbotron-fluid">
									<div class="container">
										<h3 class="display-4">[공지] ${dto.title}</h3>
									</div>
								</div>
							</div>

							<img src="${path}/include/images/review/notice.jpg"
								class="img-fluid" alt="Responsive image">

	<div id="title_css">
							<div class="jumbotron jumbotron-fluid">
								<div class="container">
									<h1 class="display-4"
										style="font-size: 1.4rem !important; white-space: pre-wrap;">
										<br>${dto.content}</h1>
									<br> <br>
								</div>
									</div>
							</div>
						</div>
					</div>
				</div>

				<br>

				<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
				<input type="hidden" name="bno" value="${dto.bno}">
				<div class="btn-group float-right" role="group"
					aria-label="Basic example">
					<c:choose>
						<c:when test="${dto.writer == sessionScope.userid }">
							<button type="button"
								class="justify-content-end  btn btn-sm btn-primary font-color-fff btn-normal-silver"
								data-toggle="button" aria-pressed="false" onclick="GoUpdate()">
								수정</button>

							<button type="button"
								class="justify-content-end  btn btn-sm btn-primary font-color-fff btn-normal-silver"
								data-toggle="button" aria-pressed="false" id="btnDelete"
								onclick="GoDelete()">삭제</button>
							<button type="button"
								class="btn btn-sm btn-primary justify-content-end  font-color-fff btn-normal-silver"
								data-toggle="button" aria-pressed="false" onclick="GoList()">목록</button>
						</c:when>
						<c:otherwise>
							<button type="button"
								class="btn btn-sm btn-primary justify-content-end  font-color-fff btn-normal-silver"
								data-toggle="button" aria-pressed="false" onclick="GoList()">목록</button>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
		<br> <br> <br>
	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>