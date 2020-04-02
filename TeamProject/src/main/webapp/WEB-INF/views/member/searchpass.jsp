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
    $('#searchPasswdbtn').on('click', function(){
        $.ajax({
            type: 'POST',
            url: "${path}/member/searchPW.do",
            data: {
                "userid" : $('#userid').val(),
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
	<div id="searchIdPwSearch">
		<br><br><br>
 
		<div id="sipTitle">FIND PASSWORD</div>
			<div id="pwBoxes">
			<div id="spwTextbox">
				<p id="spwTextTitle">비밀번호 찾기</p>
				<p id="spwText">본인인증으로 비밀번호를 변경하세요</p>
			</div>
	        <div id="siInputTextBoxes">
			<div class="siInputText">
				<input type="text" maxlength="20" class="spwInputTextBox" id="userid"
					placeholder="아이디">
			</div>
			<div class="spwInputText">
				<input type="text" maxlength="50" class="siInputTextBox_Email" id="useremail"
						placeholder="이메일">
			</div>
				<div class="modalTextBox">
						<p id="modalText">
						</p>
					</div>
					</div>
            <img id="searchPasswdbtn" class="sendEmail" src="${path}/member/img/email.png" style="cursor: pointer;">
			
	</div>
</div>
</div>
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="${path}/member/js/id_modal.js"></script>	 --%>
</body>
