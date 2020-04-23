<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style type="text/css">

.searchPass{
text-align:center;
}
#wrap{
    width:100%;
    height:100%;
}
  
.panel-body{ 
    width:1000px;
    height:500px;
    margin:0 auto;
}
.inner-box-msg{
    width: 800px;
    height:70px;
    margin:0 auto;
}
.inner-box-form{
    width: 800px;
    height:300px;
    margin:0 auto;
}
</style>
<script>
$(document).ready(function(){
    $('#searchPasswdbtn').on('click', function(){
        $.ajax({
            type: 'POST',
            url: "${path}/member/searchPW.do",
            data: {
                "userid" : $('#userid').val(),
                "useremail" : $('#useremail').val()
            },
            success: function(data){
            	$('#text').html('이메일이 발송되었습니다. <br>이메일을 확인하세요.');
            }
        });        
    });      
});
</script>
</head>
<body>

	<%@ include file="../include/fixed-topbar.jsp" %>
<div id="wrap">	
<div class="panel-body">
					<div class="col-sm-12">
						<h2 class="searchPass">비밀번호 찾기</h2>
					</div>
					<hr>
					<div class="col-sm-6 inner-box-msg">
						<p>아이디와 이메일 주소를 정확히 입력해주세요.</p>
						<p>이메일로 임시비밀번호를 보내드립니다.</p></div>
					<div class="col-sm-6 inner-box-form">
							<div>
								<label for="userid">아이디</label>
								<input id="userid" id="userid" type="text" class="form-control required" placeholder="아이디를 입력하세요" autofocus="">
							</div>
							<div>
								<label for="email">이메일 주소</label>
								<input id="useremail" id="useremail" type="email" class="form-control required" placeholder="이메일 주소를 입력하세요" autofocus="">
							</div>
							
							<br>
							<div>
								<button class="btn btn-warning btn-block" id="searchPasswdbtn">확인</button>
							</div>
										<div class="textBox">
						<p id="text" style="color:blue;">
						</p>
					</div>
					</div>
				</div>
					</div>					
					


</body>
