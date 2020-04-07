<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function(){
    $('#bnt').on('click', function(){
        $.ajax({
            type: 'POST',
            url: "${path}/member/updatePoint.do",
            data: {
                 "coupon" : $('#coupon').val()
                 
            },
            success: function(data){
            	$('#modalText').html('10000포인트가 적립되었습니다.');
            	}
        });    //end ajax    
    });    //end on   
});
</script>
</head>
<body>
<p>쿠폰 정보 입력하기</p>
<input type="text" id="key1">
<input type="text" id="key2">
<input type="text" id="key3">
<input type="text" id="coupon">
<button type="submit" id="bnt">입력하기</button>
<div class="modalTextBox">
						<p id="modalText" style="color:blue;">
						</p>
					</div>
</body>
</html>