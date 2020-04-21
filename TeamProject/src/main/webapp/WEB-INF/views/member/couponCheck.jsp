<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/member/js/coupon.js"></script>
<%@ include file="../include/fixed-topbar.jsp" %>
<script>
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);

$(document).ready(function(){
    $('#bnt').on('click', function(){
        $.ajax({
            type: 'POST',
            url: "${path}/member/updatePoint.do",
            data: {
                 "userid":$('#userid'.val())
                 "coupon" : $('#coupon').val()   
            },success: function(data){
            	$('#successText').html('포인트가 적립되었습니다.');
            	}
        });    //end ajax    
    });    //end on   
});


</script>
</head>
<body>
<div class="container" style="margin-top: 200px;">
  	<div class="d-flex">
  			<div class="card col-sm-8 offset-sm-2 text-center d-flex align-items-center">
				<img class="card-img-top" src="img/coupon_box.jpg" alt="Card image" style="opacity: 0.6">
				<div class="card-img-overlay"  style="margin-top: 140px;">
				    <h4 class="card-title"></h4>
					<h6 class="card-title ">쿠폰 번호를 입력해 주세요</h6>
 <form method="post" id="form1" name="form1" class="form-horizontal">
	<div class="input-group input-group-sm m-3 col-sm-11 align-items-center">
      <input type="text" class="form-control" id="key1" maxlength="4"><span class="input-group-addon">-</span>
      <input type="text" class="form-control" id="key2" maxlength="4"><span class="input-group-addon">-</span>
      <input type="text" class="form-control" id="key3" maxlength="4"><span class="input-group-addon">-</span>
      <input type="text" class="form-control" id="coupon" minlength="4" maxlength="4">
    </div>
          <div id="keyM"></div>
     <input class=""  type="hidden" id="userid" name="userid" value="${sessionScope.userid}">
    <button class="btn btn-primary" type="submit" id="bnt">쿠폰 생성</button>
    	<div class="TextBox">
			<p id="successText" style="color:blue;"></p>
			</div>
    </form>
     </div>
		</div>
		</div>
		
	</div>				
</body>
</html>