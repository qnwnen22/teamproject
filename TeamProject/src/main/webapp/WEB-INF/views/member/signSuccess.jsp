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
        <div class="container" style="margin-top: 200px;">
  	   <div class="d-flex">
  			<div class="card col-sm-8 offset-sm-2 col-xs-8 offset-xs-2 text-center d-flex align-items-center">
				<img class="card-img-top" src="img/success.jpg" alt="Card image" style="opacity: 0.9">
				<div class="card-img-overlay" >
				 <div class="col-sm-8" style="margin-top:50px"> <h4 class="card-title"><font color=gray>홈페이지 회원가입이 </font></h4>
				    <h4 class="card-title"><font color=gray>                  완료되었습니다.</font></h4><br><br>
				    <h6 class="card-text"><a href="http://localhost/Kdemy"> 메인으로 이동</a></h6>
					<h6 class="card-text"><a class="plain cursor" data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal"><b>로그인 하기</b></a></h6>					
                </div>
		   </div>
		</div>		
	</div>	
	
	
<%@ include file="../include/footer.jsp"%>
</body>
</html>