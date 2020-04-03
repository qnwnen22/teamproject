<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">


</script>
</head>
<body>
<div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>채팅방 리스트</h3>
            </div>
        </div>
        <div class="input-group">
         <form action="${path}/chatroom/createRoomInsert.do" method="post">
            <div class="input-group-prepend">
                <label class="input-group-text">방제목</label>
            </div>
            <div class="input-group">
               <input type="text" id="userid" name="userid" value="${sessionScope.userid}">
            </div>
            <input type="text" class="form-control" id="chatroom_name" name="chatroom_name" >
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit" >채팅방 개설</button>
            </div>
         </form>
        </div>
    </div>


</body>
</html>