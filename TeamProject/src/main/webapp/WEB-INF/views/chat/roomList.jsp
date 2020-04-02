<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<table class="table table-hover">
   <tr align="center">
     <th>방번호</th>
     <th>방이름</th>
     <th>방장아이디</th>
     <th>생성날짜</th>
   </tr>
   <c:forEach var="row" items="${list}">
     <tr align="center">
        <td>${row.chatroom_id}</td>
        <td><a href="${path}/chatroom/chatRoomView.do?chatroom_id=${row.chatroom_id}">${row.chatroom_name}</a></td>
        <td>${row.create_user_id}</td>
        <td><fmt:formatDate value="${row.room_join_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
     </tr>
   </c:forEach>
</table>
</body>
</html>