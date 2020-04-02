<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입 성공</title>
    <link rel="stylesheet" href="${path}/member/css/signSuccess.css">
    <%@ include file="../include/header.jsp"%>

</head>
<body>
    <div id="ssWrapper">
<%@ include file="../include/fixed-topbar.jsp" %>
    <br><br><br><br><br><br><br><br><br><br><br>
    <div id="ssBoxes">
        <div class="ssImg"></div>
        <div class="ssTextBox">
        <p class="ssText"><font color=gray>홈페이지 회원가입이 완료되었습니다.</font></p>
        <div id="ssBtnBox">
                <a href="http://localhost/Kdemy"><div class="ssBtn" style=" cursor: pointer;"><p class="ssBtnText">메인으로 이동</p></div></a>
                <a href="http://localhost/Kdemy/member/loginPage.do"><div class="ssBtn" style=" cursor: pointer;"><p class="ssBtnText">로그인하기</p></div></a>
            </div>
    </div>

    </div>
<%@ include file="../include/footer.jsp"%>
</div>
</body>
</html>