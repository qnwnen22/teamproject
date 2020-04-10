<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

  <!-- Bootstrap Core CSS -->
  <link href="${path}/member/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="${path}/member/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="${path}/member/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="${path}/member/css/stylish-portfolio.min.css" rel="stylesheet">
  
<link href="${path}/member/css/searchID.css?ver=5" rel="stylesheet" type="text/css">

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


<section class="pricing py-5">
  <div class="container">
    <div class="row">
      <!-- 1만 포인트 -->
      <div class="col-lg-4">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body">
            <h5 class="card-title text-muted text-uppercase text-center">10000포인트</h5>
            <h6 class="card-price text-center">$10000</h6>
            <hr>
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰 포인트가 10000포인트 충전됩니다.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>이메일 및 회원정보를 확인하세요.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰 발송 성공시 아래 메시지가 출력됩니다.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span><div class="modalTextBox"><p id="modalText" style="color:blue;"></p></div></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span> <input type="text" maxlength="50" class="siInputTextBox_Email" id="useremail" placeholder="이메일">
             </li>
            </ul>
            	
            <a href="#" class="btn btn-block btn-primary text-uppercase" id="Couponbtn">쿠폰 보내기</a>
            <div class="modalTextBox"><p id="modalText" style="color:blue;"></p></div>
          </div>
        </div>
      </div>
        <!-- 3만 포인트 -->
      <div class="col-lg-4">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body">
            <h5 class="card-title text-muted text-uppercase text-center">30000포인트</h5>
            <h6 class="card-price text-center">$30000</h6>
            <hr>
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰 포인트가 30000포인트 충전됩니다.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>이메일 및 회원정보를 확인하세요.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰 발송 성공시 아래 메시지가 출력됩니다.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span><div class="modalTextBox"><p id="modalText" style="color:blue;"></p></div></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span> <input type="text" maxlength="50" class="siInputTextBox_Email" id="useremail" placeholder="이메일">
             </li>
            </ul>
            	
            <a href="#" class="btn btn-block btn-primary text-uppercase" id="Couponbtn">쿠폰 보내기</a>
            <div class="modalTextBox"><p id="modalText" style="color:blue;"></p></div>
          </div>
        </div>
      </div>
        <!-- 5만 포인트 -->
      <div class="col-lg-4">
        <div class="card mb-5 mb-lg-0">
          <div class="card-body">
            <h5 class="card-title text-muted text-uppercase text-center">50000포인트</h5>
            <h6 class="card-price text-center">$50000</h6>
            <hr>
            <ul class="fa-ul">
              <li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰 포인트가 50000포인트 충전됩니다.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>이메일 및 회원정보를 확인하세요.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span>쿠폰 발송 성공시 아래 메시지가 출력됩니다.</li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span><div class="modalTextBox"><p id="modalText" style="color:blue;"></p></div></li>
              <li><span class="fa-li"><i class="fas fa-check"></i></span> <input type="text" maxlength="50" class="siInputTextBox_Email" id="useremail" placeholder="이메일">
             </li>
            </ul>
            	
            <a href="#" class="btn btn-block btn-primary text-uppercase" id="Couponbtn">쿠폰 보내기</a>
            <div class="modalTextBox"><p id="modalText" style="color:blue;"></p></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>