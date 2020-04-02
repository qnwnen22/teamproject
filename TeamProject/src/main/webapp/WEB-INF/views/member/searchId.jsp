<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
					$('#modalText').html('가입기록이 없습니다.<br>이름 또는 이메일을 다시 한 번 확인해주세요!');
                }
                else{
                	$('#modalText').html('<br>회원님의 아이디는 <b>'+$.trim(result)+'</b>입니다.');
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
	<div id="searchIdPwSearch">
		<br><br><br>

		<div id="sipTitle">FIND ID</div>
		<div id="siBoxes">
			<div id="siTextbox">
				<p id="siTextTitle">아이디 찾기</p>
				<p id="siText">회원정보를 확인하여 아이디를 찾아드립니다</p>
			</div>
			<div id="siInputTextBoxes">
				<div class="siInputText">
					<input type="text" maxlength="20" class="siInputTextBox"  id="username"
						placeholder="이름">
				</div>
				<div class="siInputText">
					<input type="text" maxlength="50" class="siInputTextBox_Email"  id="useremail"
						placeholder="이메일">
				</div>
			<div class="modalTextBox">
						<p id="modalText">
						</p>
					</div>
			</div>
			<img id="searchIdbtn" class="showMask" src="${path}/member/img/ok.png" style="cursor: pointer;">
        </div>
	</div>
	</div>
	
</body>
