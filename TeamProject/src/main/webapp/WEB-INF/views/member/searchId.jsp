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
/* div{border:solid black 1px;} */
.searchID{
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
    height:50px;
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
    $('#searchIdbtn').on('click', function(){
        $.ajax({
            type: 'POST',
            url: "${path}/member/searchID.do",
            data: {
                "username" : $('#username').val(),
                "useremail" : $('#useremail').val()
            },
            success: function(result){
                if($.trim(result) =="x"){
					$('#text').html('가입기록이 없습니다.<br>이름 또는 이메일을 다시 한 번 확인해주세요!');
                }
                else{
                	$('#text').html('<br>회원님의 아이디는 <b>'+$.trim(result)+'</b>입니다.');
                }
            }
        });    //end ajax    
    });    //end on    
});
</script>
</head>
<body>

	<%@ include file="../include/fixed-topbar.jsp" %>

	
	
<div id="wrap">	
<div class="panel-body">
					<div class="col-sm-12">
						<h2 class="searchID">아이디 찾기</h2>
					</div>
					<hr>
					<div class="col-sm-6 inner-box-msg">
						<p>등록한 이메일 주소를 정확히 입력해주세요.</p></div>
					<div class="col-sm-6 inner-box-form">
							<div>
								<label for="name">이름</label>
								<input id="username" id="username" type="text" class="form-control required" placeholder="이름을 입력하세요" autofocus="">
							</div>
							<div>
								<label for="email">이메일 주소</label>
								<input id="useremail" id="useremail" type="email" class="form-control required" placeholder="이메일 주소를 입력하세요" autofocus="">
							</div>
							
							<br>
							<div>
								<button class="btn btn-danger btn-block" id="searchIdbtn">확인</button>
							</div>
										<div class="textBox">
						<p id="text" style="color:red;">
						</p>
					</div>
					</div>
				</div>
					</div>
					

</body>
