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
.input-group{
	width: auto !important;
}
</style>

<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="${path}/include/css/home.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>
<script src="${path}/include/js/common.js"></script>

<script type="text/javascript">

$(document).ready(function() {
		listReply();
		$('#content').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정

		});


		$("#btnReply").click(function(evt){
			evt.preventDefault();
			var replytext=$("#replytext").val(); //댓글 내용
			var bno="${dto.bno}"; //게시물 번호
			var param={ "replytext": replytext, "bno": bno};
			$.ajax({
				type: "post",
				url: "${path}/review/replyinsert.do",
				data: param,
				success: function(){
					listReply();
					$("#replytext").val("");
				}
			});
			if (socket.readyState !== 1) return;
					console.log(socket);	
					let replyer = $('input#replyer').val();
					let gbwriter = $('input#gbwriter').val();
					let gbno = $('input#gbno').val();
					// websocket에 보내기!! (reply,댓글작성자,게시글작성자,글번호)
					socket.send("reply,"+replyer+","+gbwriter+","+gbno);
					
		});

		$(document).keydown(function(event){
			if(event.keyCode ==13){
				$("#btnReply").click();
				}
			});
});



	function GoList() {
		location.href = "${path}/review/list.do";
	}

	function GoUpdate() {
		var str = "";
		$("#form1").append(str);
		document.form1.action = "${path}/review/edit/${dto.bno}";
		document.form1.submit();
	}

	function GoDelete() {
		var del_confirm = confirm("삭제하시겠습니까?");
		if (del_confirm == true) {
			document.form1.action = "${path}/review/delete/${dto.bno}";
			document.form1.submit();
		}
	}
		
		function listReply(){
			$.ajax({
				type: "get",
				url: "${path}/review/replylist.do?bno=${dto.bno}",
				success: function(result){
					$("#replyList").html(result);
				}
			});
		}
		
</script>

</head>
<body>
<%@ include file="../include/fixed-topbar.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="justify-content-md-center">
			<form id="form1" name="form1" method="post"
				action="${path}/review/insert.do">
				<div>
					<ul class="upper_shift">
						<li><a href="${path}">KDEMY</a></li>
						<li><a href="${path}/review/list.do">수강후기</a></li>
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
							<td>과목</td>
							<td>${dto.subject}</td>
							<td>강사</td>
							<td>${dto.teacher}</td>
						</tr>

						<tr>
							<td>작성자</td>
							<td colspan="3">${dto.writer}</td>
						</tr>

						<tr>
							<td>내용</td>
							<td colspan="3">${dto.content}</td>
						</tr>

						<tr>
							<td>첨부파일</td>
							<td colspan="3"></td>
						</tr>

					</table>
				</div>
			</form>
			<br>
			
			<div id="replyList" style="border: 1px solid lightgray;">
			</div>



			<c:choose>
				<c:when test="${sessionScope.userid !=null }">
					<div class="container">
						<label for="content">댓글</label>
						<div
							class="mb-3 input-group row justify-content-md-center">
							<input type="text" class="form-control"
								placeholder="댓글을 입력해주세요" id="replytext">
							<div class="input-group-append">
								<button type="button"
									class="justify-content-end btn-outline-secondary btn btn-sm btn-primary font-color-fff btn-normal-silver"
									data-toggle="button" aria-pressed="false" id="btnReply">
									입력</button>
							</div>
						</div>
					</div>
					<br>

				</c:when>
				<c:otherwise>
				<div class="container">
						<label for="content">댓글</label>
						<div
							class="mb-3 input-group row justify-content-md-center">
							<input type="text" class="form-control"
								value="로그인한 후 댓글작성권한이 있을 경우 이용하실 수 있습니다." disabled="disabled">
							<div class="input-group-append">
								<button type="button"
									class="justify-content-end btn-outline-secondary btn btn-sm btn-primary font-color-fff btn-normal-silver"
									data-toggle="button" aria-pressed="false" id="btnReply" disabled="disabled">
									입력</button>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>


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
		</div>
		<br> <br> <br>

	<input type="hidden" value="${sessionScope.userid}" id="replyer">
	<input type="hidden" value="${dto.writer}" id="gbwriter">
	<input type="hidden" value="${dto.bno}" id="gbno">
	</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>

