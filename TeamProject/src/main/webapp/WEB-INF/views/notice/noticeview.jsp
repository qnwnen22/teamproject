<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/upper.css">
<style type="text/css">
#title_css .display-4 {
	font-size: 2.3rem !important;
}

#title_css .jumbotron {
	background-color: white !important;
}

#content_css .display-4 {
	font-size: 1.6rem !important;
	white-space: pre-wrap;
}

#content_css .jumbotron {
	background-color: white !important;
}

#dif_view {
	position: relative !important;
}



</style>
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

	$(function() {
		var $win = $(window);
		var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.

		/*사용자 설정 값 시작*/
		var speed = '1100'; // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
		var easing = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
		var $layer = $('#dif_view'); // 레이어 셀렉팅
		var layerTopOffset = 0; // 레이어 높이 상한선, 단위:px
		$layer.css('position', 'absolute');
		/*사용자 설정 값 끝*/

		// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
		if (top > 0)
			$win.scrollTop(layerTopOffset + top);
		else
			$win.scrollTop(0);

		//스크롤이벤트가 발생하면
		$(window).scroll(function() {
			yPosition = $win.scrollTop() - 123;
			if (yPosition < 0) {
				yPosition = 0;
			}
			$layer.animate({
				"top" : yPosition
			}, {
				duration : speed,
				easing : easing,
				queue : false
			});
		});
	});

	
</script>

</head>
<body>
	<%@ include file="../include/fixed-topbar.jsp"%>
	<div class="container-xl col-xl-8 offset-xl-2 col-lg-12">
			<div>
				<ul class="upper_shift">
					<li><a href="${path}">KDEMY</a></li>
					<li><b><a href="${path}/notice/list.do" style="color: blue;">공지사항</a></b></li>
				</ul>
			</div>
			
			<form name="form1" id="form1">
				<div class="row">
					<div class="d-none d-lg-block d-xl-block col-lg-2 col-xl-2 col-md-2">
						<!--  옆에 다른글 보기-->
							<div id="dif_view">
								<div class="list-group">
									<c:forEach var="rows" items="${map.list }" begin="0" end="9">
										<c:choose>
											<c:when test="${rows.bno==dto.bno }">
											<a href="${path}/notice/view.do?bno=${rows.bno}"
											class="list-group-item list-group-item-action active">
											&gt;&gt;&ensp;${rows.title} </a>
											</c:when>
											<c:otherwise>
										<a href="${path}/notice/view.do?bno=${rows.bno}"
											class="list-group-item list-group-item-action">
											${rows.title} </a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
						</div>
						</div>
						
						<div class="col-lg-10 col-xl-10 col-md-10 col-sm-12 col-xs-12">
							<div id="title_css" class="mb-4">
								<div class="jumbotron jumbotron-fluid">
									<div class="container">
										<h3 class="display-4">[공지] ${dto.title}</h3>
									</div>
								</div>
							</div>
							
							<img src="${path}/include/images/review/notice.jpg"
								class="img-fluid mb-4 " alt="Responsive image">
								
								
							<div id="content_css" class="mb-4">
								<div class="jumbotron jumbotron-fluid">
									<div class="container">
										<h1 class="display-4">
											<br>${dto.content}</h1>
									</div>
								</div>
							</div>
						</div>
					</div>


				<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
				<input type="hidden" name="bno" value="${dto.bno}">
				<div class="btn-group float-right mt-3" role="group"
					aria-label="Basic example">
					<c:choose>
						<c:when test="${dto.writer == sessionScope.admin_id }">
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
								class="btn btn-sm btn-primary justify-content-end  font-color-fff btn-normal-silver "
								data-toggle="button" aria-pressed="false" onclick="GoList()">목록</button>
						</c:otherwise>
					</c:choose>
				</div>
			</form> 

	</div>
		<br> <br> <br>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
