<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.input-group {
	width: auto !important;
}

#title_css .display-8 {
	font-size: 1.8rem !important;
}

#title_css .jumbotron {
	background-color: white !important;
	height: 2rem !important;
}

#content_css .display-4 {
	font-size: 1.6rem !important;
	white-space: pre-wrap;
}

#content_css .jumbotron {
	background-color: white !important;
}

#fullName_css .jumbotron {
	background-color: white !important;
}

</style>
<script type="text/javascript">
	$(document).ready(function() {
		listReply();
		$("#btnReply").click(function(evt) {
			evt.preventDefault();
			var replytext = $("#replytext").val(); //댓글 내용
			var bno = "${dto.bno}"; //게시물 번호
			var param = {
				"replytext" : replytext,
				"bno" : bno
			};
			$.ajax({
				type : "post",
				url : "${path}/review/replyinsert.do",
				data : param,
				success : function() {
					listReplyLoad();
					$("#replytext").val("");
				}
			});				
			if (socket.readyState !== 1) return;
					let replyer = $('input#replyer').val();
					let gbwriter = $('input#gbwriter').val();
					let gbno = $('input#gbno').val();
					// websocket에 보내기!! (reply,댓글작성자,게시글작성자,글번호)
					socket.send("reply,"+replyer+","+gbwriter+","+gbno);
		});
		$(document).keydown(function(event) {
			if (event.keyCode == 13) {
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


	function listReply() {
		var replyCurPage=$("#replyCurPage").val();
		$.ajax({
			type : "post",
			url : "${path}/review/replylist.do?bno=${dto.bno}&replyCurPage="+replyCurPage,
			success : function(result) {
				$("#replyList").html(result);
			}
		});
	}

	function listReplyLoad() {
		$.ajax({
			type : "post",
			url : "${path}/review/replylist.do?bno=${dto.bno}&replyCurPage=1",
			success : function(result) {
				$("#replyList").html(result);
			}
		});
	}
	function list(page) {
		location.href = "${path}/review/list.do?curPage="+page;
	}

</script>

</head>
<body>
	<%@ include file="../include/fixed-topbar.jsp"%>
	<div class="container-xl col-xl-8 offset-xl-2 col-lg-12">
		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/review/list.do" style="color: blue;">수강후기</a></b></li>
			</ul>
		</div>
		
		<form id="form1" name="form1" method="post">
			<div class="col-sm-12 col-xl-12 col-lg-12">
				<div id="title_css" class="mb-2">
					<div class="jumbotron jumbotron-fluid">
						<h3 class="display-8">
							<span style="background-color: yellow;">[${dto.subject}]</span>
							${dto.title}
						</h3>
						<h6 class="mt-3">${dto.username}|&nbsp;&nbsp;강사&nbsp;
							${dto.teacher} | &nbsp;&nbsp; 조회&nbsp; ${dto.viewcnt}</h6>
						<hr>
					</div>
				</div>

				<div id="content_css">
					<div class="jumbotron jumbotron-fluid">
						<div class="container">
							<h1 class="display-4">
								<br>${dto.content}</h1>
							<br> <br>
						</div>
					</div>
				</div>
				<hr>
			</div>

		</form>
		<div id="replyList" style="border: 1px solid lightgray;" class="mb-3">
		
		
		
		
		
		</div>


		<c:choose>
			<c:when test="${sessionScope.userid !=null }">
				<label for="content">댓글</label>
				<div class="mb-3 input-group justify-content-md-center">
					<input type="text" class="form-control" placeholder="댓글을 입력해주세요"
						id="replytext">
					<div class="input-group-append">
						<button type="button"
							class="justify-content-end btn-outline-secondary btn btn-sm btn-primary font-color-fff btn-normal-silver"
							data-toggle="button" id="btnReply">
							입력</button>
					</div>
				</div>
				<br>

			</c:when>
			<c:otherwise>
				<label for="content">댓글</label>
				<div class="mb-2 input-group justify-content-md-center">
					<input type="text" class="form-control"
						value="로그인한 후 댓글작성권한이 있을 경우 이용하실 수 있습니다." disabled="disabled">
					<div class="input-group-append">
						<button type="button"
							class="justify-content-end btn-outline-secondary btn btn-sm btn-primary font-color-fff btn-normal-silver"
							data-toggle="button" aria-pressed="false" id="btnReply"
							disabled="disabled">입력</button>
					</div>
				</div>
			</c:otherwise>
		</c:choose>


		<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="replyCurPage" id="replyCurPage" value="${map.replyCurPage}">
		<input type="hidden" name="bno" value="${dto.bno}"> <input
			type="hidden" name="bno" value="${dto.writer}">
		<div class="btn-group float-right mb-5 mt-3" role="group"
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
		<br> <br> <input type="hidden"
			value="${sessionScope.userid}" id="replyer"> <input
			type="hidden" value="${dto.writer}" id="gbwriter"> <input
			type="hidden" value="${dto.bno}" id="gbno">

		<div id="table_css" class="table-responsive mt-4">
			<table class="table text-center table-hover">
				<thead>
					<tr>
						<th class="d-none d-lg-block">번호</th>
						<th>과목</th>
						<th class="d-none d-lg-block">강사</th>
						<th>제목</th>
						<th>작성자</th>
						<th class="d-none  d-lg-block">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="rows" items="${map.reviewlist}">
						<c:choose>
							<c:when test="${dto.bno==rows.bno}">
								<tr class="table-primary">
									<td class="d-none  d-lg-block">&gt;&gt;</td>
									<td>${rows.subject}</td>
									<td class="d-none d-lg-block">${rows.teacher}</td>
									<td><a href="${path}/review/view.do?bno=${rows.bno}">${rows.title}</a>
										<c:if test="${rows.cnt>0}">
											<span style="color: white;"
												class="badge badge-pill badge-dark">${rows.cnt}</span>
										</c:if></td>
									<td>${rows.writer}</td>
									<td class="d-none d-lg-block">${rows.viewcnt}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="d-none  d-lg-block">${rows.bno}</td>
									<td>${rows.subject}</td>
									<td class="d-none d-lg-block">${rows.teacher}</td>
									<td><a href="${path}/review/view.do?bno=${rows.bno}">${rows.title}</a>
										<c:if test="${rows.cnt>0}">
											<span style="color: white;"
												class="badge badge-pill badge-dark">${rows.cnt}</span>
										</c:if></td>
									<td>${rows.writer}</td>
									<td class="d-none d-lg-block">${rows.viewcnt}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<br>
		<div class="d-flex justify-content-center mb-4">
			<nav aria-label="Page navigation example center-block">
				<ul class="pagination">
					<c:if test="${map.pager.curBlock>1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('1')">&lt;&lt;</a></li>
					</c:if>
					<c:if test="${map.pager.curBlock >1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.prevPage}')">&lt;</a></li>
					</c:if>
					<c:forEach var="num" begin="${map.pager.blockBegin}"
						end="${map.pager.blockEnd}">
						<c:choose>
							<c:when test="${num==map.pager.curPage}">
								<li class="page-item"><a class="page-link">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#"
									onclick="list('${num}')">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.pager.curBlock < map.pager.totBlock}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.nextPage}')">&gt;</a></li>
					</c:if>
					<c:if test="${map.pager.curPage <map.pager.totPage}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.totPage}')">&gt;&gt;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>



	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>