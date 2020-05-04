<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/include/css/upper.css">
<script type="text/javascript">
	function buyList() {
		var point = Number(document.getElementById("point").value);
		var price = Number(document.getElementById("price").value);
		
		if (point < price) {
			alert("포인트가 모자랍니다.");
			return false;
		} else {
			if (confirm("구매하시겠습니까?") == true) {
				alert("구매가 완료되었습니다.");
				if (socket.readyState !== 1) return;
				let replyer = $('input#buyuserid').val();
				let lecture_idx = $('input#lecture_idx').val();
				// websocket에 보내기!! (reply,댓글작성자,게시글작성자,글번호)
				socket.send("buyAlarm,"+replyer+","+lecture_idx);
				document.buyListform.submit();
			} else {
				alert("구매를 취소하셨습니다.");
			}
		}
	}

	function Godeletecart(){
		if(confirm("삭제하시겠습니까?")==true){
			alert("삭제되었습니다");
			}
		}

	$(function() {
		$("#btnDeleteAll").click(function() {
			if (confirm("장바구니를 비우시겠습니까?")) {
				location.href = "${path}/cart/deleteAll.do";
			}
		});

		$("#chkAll").click(function() { //만약 전체 선택 체크박스가 체크된상태일경우 
			if ($("#chkAll").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked", true); // 전체선택 체크박스가 해제된 경우 
			} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked", false);
			}
		});
	});

	$(function() {
		var $win = $(window);
		var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.

		/*사용자 설정 값 시작*/
		var speed = '1100'; // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
		var easing = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
		var $layer = $('#AllList'); // 레이어 셀렉팅
		var layerTopOffset = 0; // 레이어 높이 상한선, 단위:px
		$layer.css('position', 'relative');
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

		$("#chkALL").click(function(){
			 //만약 전체 선택 체크박스가 체크된상태일경우
			 if($("#chkALL").prop("checked")) { 
				 //해당화면에 전체 checkbox들을 체크해준다
				  $("input[name=chk]").prop("checked",true); // 전체선택 체크박스가 해제된 경우
				   } else { //해당화면에 모든 checkbox들의 체크를해제시킨다.
					    $("input[name=chk]").prop("checked",false); 
					    } 
			    });


			 
	});


	

</script>
</head>
<body class="Kdemy">
	<%@ include file="../include/fixed-topbar.jsp"%>
	<input type="hidden" name="buyuserid" id="buyuserid" value="${sessionScope.userid}">
	<div class="container-xl col-xl-8 offset-xl-2 col-lg-12 Kdemy-content">

		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b style="color: blue;">장바구니</b></li>
			</ul>
		</div>

		<h4 class="mb-3 col-12">${sessionScope.username}님의보유중인 포인트</h4>
		<div class="mb-5 d-flex col-12">
			<input type="hidden" name="point" id="point" value="${point }">
			<input type="text"
				value="<fmt:formatNumber pattern="###,###,###원" value="${point}" />"
				readonly
				class="bg-dark text-white mr-xl-2 form-control form-control-lg col-lg-3 col-sm-5 col-md-5 text-center" onclick="location.href='${path}/cart/pointCharge.do'">
		</div>
		
		
		<div class="col-12">
		
	<!-- 	<div class="col-12">
				<input type="checkbox" id="chkALL" class="mb-3 ml-3 chk" checked="checked">
				</div> -->
			<div class="row ml-0">
				<div class="col-lg-9 col-xl-9 col-md-9 border-right">
					<c:forEach var="dto" items="${list}">
						<div id="totOne"
							class="row col-12 border shadow p-3 mb-5 bg-white rounded">

							<div
								class="align-self-center align-middle h4 d-inline-block d-flex col-lg-1 col-xl-1 col-md-1 align-self-start ">
								${dto.cart_idx }
							</div>

							<div class="col-lg-3 col-xl-3 col-md-3 mr-3 d-none d-xl-block d-lg-block d-md-block d-sm-block">
								<img src="${path}/cart/displayFile?fileName=${dto.main_img}" class="img-thumbnail "
									width="120">
									
							</div>

							<div class="col-lg-4 col-xl-4 col-md-4 mr-4 mt-2">
								<div class="mb-4 col-12 ">${dto.main_category}&nbsp;&gt;&nbsp;
									${dto.sub_category}</div>
								<div class="font-weight-bold h3 mt-4 mb-5 col-12">${dto.subject}</div>
							</div>

							<div class="col-lg-3 col-xl-3 col-md-3">
								<div
									class="float-lg-right float-xl-right float-md-right float-sm-right h6 mr-0 d-none d-xl-block d-lg-block d-md-block d-sm-block">
									<a href="${path}/cart/delete.do?cart_idx=${dto.cart_idx}" onclick="Godeletecart()">
										<svg class="bi bi-trash-fill" width="1em" height="1em"
											viewBox="0 0 16 16" fill="currentColor"
											xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd"
												d="M2.5 1a1 1 0 00-1 1v1a1 1 0 001 1H3v9a2 2 0 002 2h6a2 2 0 002-2V4h.5a1 1 0 001-1V2a1 1 0 00-1-1H10a1 1 0 00-1-1H7a1 1 0 00-1 1H2.5zm3 4a.5.5 0 01.5.5v7a.5.5 0 01-1 0v-7a.5.5 0 01.5-.5zM8 5a.5.5 0 01.5.5v7a.5.5 0 01-1 0v-7A.5.5 0 018 5zm3 .5a.5.5 0 00-1 0v7a.5.5 0 001 0v-7z"
												clip-rule="evenodd" />
						</svg>
									</a>
								</div>

								<div class="mt-5 row align-items-end price">
									<span
										class="d-flex justify-content-end h3 align-self-end mt-5 align-bottom col loat-lg-right float-xl-right float-md-right float-sm-right mr-0 mb-0 pr-0"
										style="color: red;"> <fmt:formatNumber
											pattern="￦###,###,###원" value="${dto.price}" /></span>

								</div>
							</div>

						</div>


					</c:forEach>
					<button
						class="btn btn-sm btn-primary font-color-fff btn-normal-silver mb-5"
						id="btnDeleteAll">전체삭제</button>
				</div>



				<div id="AllList"
					class=" col-lg-3 col-xl-3 col-md-3 h6 table-responsive mt-4 d-none d-xl-block d-lg-block d-md-block d-sm-block ">
					<div class="h6 table-responsive">
						<table class="table text-center">
							<thead>
								<tr>
									<th class="">강의명</th>
									<th class="">가격</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="dto" items="${list}">
									<tr>
										<td>${dto.subject}</td>
										<td>${dto.price}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<c:set var="sum" value="0" />
					<c:forEach var="dto" items="${list}" begin="0" end="${list.size()}">
						<c:set var="sum" value="${sum + dto.price}" />
					</c:forEach>


					<form method="post" name="buyListform" id="buyListform"
						action="${path}/cart/buyList.do">
						<input type="hidden" name="count" value="${count}" readonly>

						<c:forEach var="dto" items="${list}" begin="0" end="${count}">
					    	<input type="hidden" name="userid" id="userid" value="${dto.userid}">
					     	<%-- <input type="hidden" name="nickname" value="${dto.nickname}"> --%>
						    <input type="hidden" name="main_img" value="${dto.main_img}">
							<input type="hidden" name="cell_type" value="${dto.cell_type}">
							<input type="hidden" name="lecture_idx" id="lecture_idx"
								value="${dto.lecture_idx}">
								<input type="hidden" name="">
						</c:forEach>
						<input type="hidden" name="price" id="price" value="${sum}">
						<div class="p-3 mb-2  text-center h5 bg-dark text-white ">
							총가격 :
							<fmt:formatNumber pattern="###,###,###원" value="${sum}" />
						</div>
						<button type="button"
							class="btn btn-primary btn-lg btn-block text-center h6 "
							onclick="buyList()">일괄 구매</button>
					</form>
					<br>
				</div>
					
			</div>
		</div>


	</div>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>