<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/css/login.css">
</head>
<body>
<%@ include file="../include/fixed-topbar.jsp" %>
	<%-- <div class="container-lg joinDiv">

	<div class="container-lg loginDiv">
		<div class="page-header col-xl-8 offset-xl-2 text-center">
			<h2>로그인 </h2>
		</div>
		<div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 offset-xl-2 offset-lg-2 joinForm" style="padding-left: 10px; padding-right: 10px;">
			<form method="post" id="loginForm" name="loginForm" action="${path}/member/login.do" class="form-horizontal">
				<div class="form-group">
					<label for="userid">아이디</label>
					<input type="text" class="form-control" id="userid" name="userid">
					
					<div><c:if test="${message!=null}"><b>${message}</b></c:if></div>			
				</div>
				<div class="form-group">
					<label for="passwd">비밀번호</label>
					<input type="password" class="form-control" id="passwd" name="passwd">
				</div>
				<div class="form-group text-center">
					<button type="submit" id="join-submit" class="btn btn-primary">
						로그인
					</button>
				</div>
					<div style="text-align: left;"><a href="${path}/member/searchId.do" class="more">아이디 찾기</a></div>
					<span><a href="${path}/member/searchpass.do" class="more">비밀번호 찾기</a></span>
					
			</form>
		</div>
	</div> --%>

<%-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#kdemyLoginModal">
  Launch demo modal
</button>
<div class="modal fade kdemy-login-form" id="#kdemyLoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center">KDEMY LOGIN</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form method="post" id="signInForm" name="signInForm" action="${path}/member/login.do" class="form-horizontal">
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요.">
					<div><c:if test="${message!=null}"><b>${message}</b></c:if></div>			
				</div>
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
				</div>
			<div class="form-check pt-2 pb-1">
				  <input class="form-check-input" type="checkbox" name="loginsave" id="loginsave" value="option1" checked>
				  <label class="form-check-label" for="exampleRadios1">
				   <b>로그인유지</b>
				  </label>
		    </div>
				<div class="input-group input-group-lg text-center pt-2 pb-1">
					<button type="submit" id="join-submit" class="btn btn-outline-dark btn-lg btn-block">
						로그인
					</button>
				</div>

					<div class="float-left pt-2 pb-1">
					  <a href="${path}/member/searchId.do" class="more"><b>아이디 찾기</b></a>
					</div>
					<div class="float-right pt-2 pb-1">
				 	 <a href="${path}/member/searchpass.do" class="more"><b>비밀번호 찾기</b></a>
					</div>
					
				<br><br>
				<div class="text-center pt-2 pb-2">
				   <b>SNS계정으로 편한하게 로그인하세요.</b>
				</div>
				
			   <div class="d-flex row justify-content-md-center pt-2 pb-1">
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_fb.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_ist.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_tw.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_yt.png"></a></div>
 			   </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-dark btn-lg btn-block">신규 가입하기</button>
      </div>
    </div>
  </div> 
</div>--%>

	
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>