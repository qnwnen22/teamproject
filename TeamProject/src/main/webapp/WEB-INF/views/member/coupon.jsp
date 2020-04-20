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
  <div class="container fluid-row">
             <!-- 만들기 포인트 -->
            <div class="row">
           <div class="card mb-5 mb-lg-0">
           <div class="card-body">
            <img class="card-img-top" src="img/coupon_box.jpg" alt="Card image" style="opacity: 0.6">
            <div class="card-img-overlay"  style="margin-top: 240px;">
              <form name="form" id="form" action="insertCoupon.do" method="post" class="form-horizontal">
                <strong>쿠폰정보를 입력해주세요</strong>
	           <div class="form-group form-inline">
					<label for="coupon_name">쿠폰 이름</label>&nbsp;<span>
					<input class="form-control"  name="coupon_name" id="coupon_name" placeholder="쿠폰이름을 입력하세요."></span>
				</div>
				  <div class="form-group form-inline">
					<label for="coupon_name">쿠폰번호</label>&nbsp;
					<input class="form-control"  name="coupon" id="coupon"  placeholder="4자리의 유니크한 쿠폰을 만들어주세요." oninput="checkCoupon()" maxlength="4">
					<span id="CheckM"></span><span id="couponM"></span>				
				</div>
				<div class="form-group form-inline">
					<label for="coupon_name">포인트</label>&nbsp;
					<input class="form-control" name="point"  id="point" placeholder="포인트를 입력하세요.">				
				</div>
				<div class="form-group form-inline">
					<label for="coupon_name">쿠폰설명</label>&nbsp;
					<input class="form-control"  name="coupon_text"  id="coupon_text" placeholder="쿠폰에 대한 설명을 입력하세요.">				
				</div>
				<div class="form-group align-center">
				<button type="submit" class="btn btn-block btn-danger text-uppercase text-center" id="listButton">쿠폰 만들기</button>
				</div>
           </form>
       
            <div class="textBox"><p id="SuccessText2" style="color:blue;"></p></div>
            
          </div>
          </div>
        </div>
      </div>
      <!--  -->
          </div>
    <br>
    <hr>
   <div id="listDiv"></div>


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