<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<body class="Kdemy">
	<%@ include file="../include/fixed-topbar.jsp"%>
	<div
		class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 Kdemy-content">
		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/admin/managementMenu.do">관리메뉴</a></b></li>
				<li><b><a href="${path}/admin/list.do" style="color: blue;">쿠폰관리</a></b></li>
			</ul>
		</div>
		<hr>
		<!-- 만들기 포인트 -->
		<div class="card mb-lg-0 shadow mb-3 bg-white mx-auto col-10">
			<div class="mb-3">
				<img class="card-img-top"
					src="${path}/include/images/coupon/쿠폰박스.png" alt="Card image">
				<div class="card-img-overlay col-12">
					<div class="h-25 my-4"></div>
					<form name="form" id="form" action="insertCoupon.do" method="post"
						class="form-horizontal">
						<div class="form-group form-inline ml-4">
							<label for="coupon_name">쿠폰 이름</label> <input
								class="form-control col-6" name="coupon_name" id="coupon_name"
								placeholder="쿠폰이름을 입력하세요." required>
						</div>
						<div class="form-group form-inline ml-4">
							<label for="coupon">쿠폰번호</label> <input
								class="form-control col-6" name="coupon" id="coupon"
								placeholder="4자리의 유니크한 쿠폰을 만들어주세요." oninput="checkCoupon()"
								required> <span id="CheckM"></span><span id="couponM"></span>
						</div>
						<div class="form-group form-inline ml-4">
							<label for="point">포인트</label> <input class="form-control col-6"
								name="point" id="point" placeholder="포인트를 입력하세요." required>
						</div>
						<div class="form-group form-inline ml-4">
							<label for="coupon_text">쿠폰설명</label> <input
								class="form-control col-6" name="coupon_text" id="coupon_text"
								placeholder="쿠폰에 대한 설명을 입력하세요." required>
						</div>
						<div class="mx-auto col-4 mt-5 pt-4">
							<button type="submit"
								class="btn-sm btn-block btn-danger text-uppercase text-center"
								id="listButton">쿠폰 생성</button>
						</div>
					</form>
				</div>
			</div>
			<div class="textBox">
				<p id="SuccessText2" style="color: blue;"></p>
			</div>

		</div>
		<hr>
		<div id="listDiv"></div>
		<hr>
		<div id="memberlistDiv"></div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	<div id="view"
		class="reounded fixed-top shadow mb-3 mr-3 col-lg-2 col-xl-2 col-md-2 h6 ml-auto d-none d-xl-block d-lg-block d-md-block d-sm-block "
		style="margin-top: 170px;">
		<form method="post" name="form1" id="form1" action="makeCoupon.do">
			<h6 class="mt-3">선택한 쿠폰</h6>
			<hr>
			<c:choose>
				<c:when test="${select.coupon_name != null}">
					<div class="col-12 mx-0">
						<div class="card mb-3 mb-lg-0">
							<div class="card-body mx-0">
								<h5 class="card-title text-muted text-uppercase text-center">${select.coupon_name}</h5>
								<h6 class="card-price text-center">￦${select.point}</h6>
								<hr>
								<ul class="fa-ul ml-4">
									<li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰번호는
										${select.coupon}입니다.</li>
									<li><span class="fa-li"><i class="fas fa-check"></i></span>${select.point}포인트</li>
									<li><span class="fa-li"><i class="fas fa-check"></i></span>${select.coupon_text}</li>
								</ul>
								<input type="hidden" value="${select.coupon}" id="coupon"
									name="coupon" required>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<h6 class="text-center">쿠폰을 선택해 주세요</h6>
				</c:otherwise>
			</c:choose>
			<hr>
			<h6>수신자</h6>
			<div class="col-12 border border-secondary py-3" id="useremailBox"
				style="min-height: 100px; max-height: 340px; overflow: auto;"></div>
			<hr>
			<button type="submit"
				class="btn btn-outline-primary btn-lg btn-block text-center">발송</button>
		</form>
		<br>
	</div>
	<script>

 $(function(){
     var responseMessage = "<c:out value="${message}" />";
     if (responseMessage != ""){
         alert(responseMessage)
     }
 })
 
$(function(){
	couponDetail();
	couponMemberList();
	
	 $('#coupon').change(function(e){
			var coupon=document.getElementById("coupon");
			if(coupon.value=="") {
				alert("쿠폰번호는 필수 입력입니다.");
				coupon.focus();
				return false;
			}
			var exp1=/^[A-Za-z0-9]{4,4}$/;
			if(!exp1.test(coupon.value)) {
				$("#coupon").css("border", "2px solid red");
				$("#CheckM").html("<b style='color:red'>쿠폰번호는 영문자,숫자 4자리로 입력하세요.</b>");
				coupon.val("");
				coupon.focus();
				return false;
			} else {
				var input="<input id='couponConfirm' type='hidden' value='y'>";
				$("#coupon").css("border", "2px solid #71c9ce");
				$("#CheckM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
			}			
		 });
});
function couponDetail() {
	 $.ajax({
         type: 'post'
       , url: 'couponDetail.do'
       , dataType : 'text'
       , success: function(data) {
       	$("#listDiv").html(data);
         }
 });	
}
	
function couponMemberList() {
	$.ajax({
        type: 'post'
      , url: '${path}/member/couponMemberlist.do'
      , dataType : 'text'
      , success: function(data) {
      	$("#memberlistDiv").html(data);
        }
	});	
}

//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
var couponCheck = 0;
//아이디 체크하여 가입버튼 비활성화, 중복확인.
function checkCoupon() {
    var inputed = $('#coupon').val();
    console.log(inputed);
    $.ajax({
        data : {
        	coupon : inputed
        },
        url : "${path}/member/checkCoupon.do",
        success : function(data) {
            if (data == '0') {
            	couponCheck = 1;
                if(couponCheck==1) {
                    $(".coupon").css("border", "2px solid #71c9ce");
                    if($("#CheckM").val() == ""){
                    $("#couponM").html("<b style='color:#71c9ce'>사용할 수 있는 쿠폰번호 입니다.</b>");
                    return false
                    }
                } 
            } else if (data == '1') {
                $(".coupon").css("border", "2px solid red");
                $("#couponM").html("<b style='color:red'>중복된 쿠폰번호 입니다.</b>");
                idCheck = 0;
                return false
            } else if(data == '2') {
    			$("#couponM").html("");
    			return false
                }
        }
    });
}
</script>
</body>
</html>