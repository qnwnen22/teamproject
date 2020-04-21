<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>

</head>
<body>
<%@ include file="../include/fixed-topbar.jsp" %>
  <div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3">
  <div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/admin/managementMenu.do">관리메뉴</a></b></li>
				<li><b><a href="${path}/admin/list.do" style="color:blue;">쿠폰관리</a></b></li>
			</ul>
		</div>
		<hr>
             <!-- 만들기 포인트 -->
           <h4 class="mx-3 mt-3">쿠폰생성</h4>
           <div class="card mb-5 mb-lg-0 shadow mb-3 bg-white mx-auto col-10">
            <img class="card-img-top" src="${path}/include/images/coupon/쿠폰박스.png" alt="Card image">
            <div class="card-img-overlay col-12 ml-3"  style="margin-top: 160px;">
              <form name="form" id="form" action="insertCoupon.do" method="post" class="form-horizontal">
	           <div class="form-group form-inline mb-4">
					<label for="coupon_name">쿠폰 이름</label>
					<input class="form-control col-4"  name="coupon_name" id="coupon_name" placeholder="쿠폰이름을 입력하세요.">
				</div>
				  <div class="form-group form-inline mb-4">
					<label for="coupon_name">쿠폰번호</label>
					<input class="form-control col-4"  name="coupon" id="coupon"  placeholder="4자리의 유니크한 쿠폰을 만들어주세요." oninput="checkCoupon()">
					<span id="CheckM"></span><span id="couponM"></span>				
				</div>
				<div class="form-group form-inline mb-4">
					<label for="coupon_name">포인트</label>
					<input class="form-control col-4" name="point"  id="point" placeholder="포인트를 입력하세요.">				
				</div>
				<div class="form-group form-inline mb-4">
					<label for="coupon_name">쿠폰설명</label>
					<input class="form-control col-4"  name="coupon_text"  id="coupon_text" placeholder="쿠폰에 대한 설명을 입력하세요.">
				</div>
				<div class="mx-auto col-4 mt-5">
				<button type="submit" class="btn-sm btn-block btn-danger text-uppercase text-center" id="listButton">쿠폰 만들기</button>
				</div>
           </form>
       
            <div class="textBox"><p id="SuccessText2" style="color:blue;"></p></div>
            
          </div>
        </div>
      </div>
      <!--  -->
    <br>
    <hr>
   <div id="listDiv"></div>
   <hr>
   <div id="memberlistDiv"></div>

 <script>
$(function(){
		  $.ajax({
		          type: 'post'
		        , url: 'couponDetail.do'
		        , dataType : 'text'
		        , success: function(data) {
		        	$("#listDiv").html(data);
		          }
		  });	
	})
	$(function(){
		  $.ajax({
		          type: 'post'
		        , url: '${path}/member/list.do'
		        , dataType : 'text'
		        , success: function(data) {
		        	$("#memberlistDiv").html(data);
		          }
		  });	
	})	

document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);
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
                    $("#couponM").html("<b style='color:#71c9ce'>사용할 수 있는 쿠폰번호 입니다.</b>");
                    return false
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
	
	$(function(){
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


		$('#submit').click(function(e){
					if($('#couponConfirm').val()!="y") {
						$('#coupon').focus();
						alert("1");
						return false;
					}
					document.form.submit();
				});
});	
</script>
</body>
</html>