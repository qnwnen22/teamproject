<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${path}/member/css/searchID.css?ver=5" rel="stylesheet" type="text/css">
<%@ include file="../include/header.jsp"%>
<style type="text/css">
#wrap{
    width:100%;
    height:100%;
}
  
#searchIdPwSearch{ 
    width:300px;
    height:300px;
    margin:0 auto;
}
</style>
<script>
$(document).ready(function(){
    $('#Couponbtn').on('click', function(){
        $.ajax({
            type: 'POST',
            url: "${path}/member/makeCouponA.do",
            data: {
                 "useremail" : $('#useremail').val()
            },
            success: function(data){
            	$('#modalText').html('이메일이 발송되었습니다. <br>이메일을 확인하세요.');
            }
        });    //end ajax    
    });    //end on   
});
</script>
</head>
<body>

	<%@ include file="../include/fixed-topbar.jsp" %>
	<div id="wrap">
	<div id="makeCoupon">
		<br><br><br>
 
		<div id="sipTitle"> 10000포인트 쿠폰 생성기</div>
			<div id="pwBoxes">
			<div id="spwTextbox">
			</div>
	        <div id="siInputTextBoxes">
			<div class="spwInputText">
				<input type="text" maxlength="50" class="siInputTextBox_Email" id="useremail"
						placeholder="이메일">
			</div>
					</div>
            <button id="Couponbtn" class="makeCoupon" style="cursor: pointer;">쿠폰 보내기</button>
			<div class="modalTextBox">
						<p id="modalText" style="color:blue;">
						</p>
					</div>
	</div>
</div>
</div>
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="${path}/member/js/id_modal.js"></script>	 --%>
</body>

<div class="container-fluid">
 <div class="row">
  <div class="col-xs-12">
  	<form method="post" id="couponMaker" name="couponMaker" action="${path}/member/coupon.do" class="form-horizontal">
    <div class="input-group input-group-lg">
      <input type="text" class="form-control" id="useremail"><span class="input-group-addon">-</span>
      <input type="text" class="form-control" id="key2"><span class="input-group-addon">-</span>
      <input type="text" class="form-control" id="key3"><span class="input-group-addon">-</span>
      <input type="text" class="form-control" id="key4">
      <button class="btn btn-primary" type="submit">쿠폰 생성</button>
    </div>
    </form>
  </div>
  </div>
</div>

<div class="container-fluid">
 <div class="row">
  <div class="col-xs-12">
      <a href="${path}/member/coupon.do" class="more">쿠폰 생성</a>
    </div>
  </div>
  </div>


</body>
</html>