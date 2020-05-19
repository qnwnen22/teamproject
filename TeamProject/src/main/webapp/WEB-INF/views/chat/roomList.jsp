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
     <th>문의자</th>
     <th>생성날짜</th>
   </tr>
   <c:forEach var="row" items="${list}">
   <c:if test="${row.chatalarm == 'n'}">
     <tr align="center">
        <td><a onclick="chatOpen()">${row.chatroom_name}
        <span class="badge badge-danger">new</span></a></td>
        <td><fmt:formatDate value="${row.room_join_date}" pattern="yyyy-MM-dd"/>
        <input type="hidden" value="${row.admin_id}" id="target">
        <input type="hidden" value="${row.chatroom_id}" id="num">
        <input type="hidden" value="${row.chatroom_name}" id="sender">
        </td>
     </tr>
   </c:if>
   </c:forEach>
</table>
<script>
function chatOpen() {
	var num=$("#num").val();
	var target=$("#target").val();
	var sender=$("#sender").val();
	location.href="${path}/chat/popup/"+num+"?sender="+sender+"&target="+target+"&num="+num;
	
	
}

</script>
</body>
</html>