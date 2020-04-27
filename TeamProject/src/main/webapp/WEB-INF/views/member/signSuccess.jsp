<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입 성공</title>
    <%@ include file="../include/header.jsp"%>

</head>
<body>
<%@ include file="../include/fixed-topbar.jsp" %>
        <div class="container">
  	   <div class="d-flex">
  			<div class="card col-md-8 offset-md-2 col-xl-8 offset-xl-2 text-center d-flex align-items-center">
				<img class="card-img-top" src="img/success.jpg" alt="Card image" style="opacity: 0.9">
				<div class="card-img-overlay col-sm-8 col-xs-6">
				 <div class="short-div">
				 <h4 class="card-title m-5"></h4>
				 <h4 class="card-title m-5"></h4>
				 <h4 class="card-title m-5"></h4>
				 <h4 class="card-title m-5"></h4>
				 <h4 class="card-title m-5"></h4></div>
				    <div class="short-div">
				    <h4 class="card-title"><font color=gray>홈페이지 회원가입이 </font></h4>
				    <h4 class="card-title"><font color=gray>                  완료되었습니다.</font></h4><br><br>
				    <h6 class="card-text"><a href="http://localhost/Kdemy"> 메인으로 이동</a></h6>
					<h6 class="card-text"><a class="plain cursor" data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal"><b>로그인 하기</b></a></h6>					
                </div>
		   </div>
		</div>		
	</div>	
	</div>
	
<%@ include file="../include/footer.jsp"%>
</body>
</html>