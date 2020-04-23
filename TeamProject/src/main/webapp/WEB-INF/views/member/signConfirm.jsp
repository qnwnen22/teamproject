<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>인증메일 발송</title>
    <%@ include file="../include/header.jsp"%>
</head>
<body>

<%@ include file="../include/fixed-topbar.jsp" %>

        <div class="container" style="margin-top: 200px;">
  	   <div class="d-flex">
  			<div class="card col-sm-8 offset-sm-2 text-center d-flex align-items-center">
				<img class="card-img-top" src="img/email.jpg" alt="Card image" style="opacity: 0.6">
				<div class="card-img-overlay"  style="margin-top: 250px;">
				    <h4 class="card-title" style="color:gray">안녕하세요. Kdemy입니다.</h4><br>
				    <h6 class="card-title">${sessionScope.useremail}으로 인증메일을 보내드렸습니다.</h6>
					<h6 class="card-title">인증메일의 링크를 누르면 회원가입이 완료됩니다.</h6>					
              </div>
		   </div>
		</div>
		
	</div>	

<%@ include file="../include/footer.jsp"%>
</body>
</html>