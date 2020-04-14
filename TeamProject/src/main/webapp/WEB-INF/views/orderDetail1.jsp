<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%@ include file="include/header.jsp" %>
<style>
ul {
  padding: 0;
}
li {
  display: inline-block;
}
</style>

<c:forEach var="dto" items="${list2}">
<ul>
  <li>${dto.cart_idx}</li>
  <li>${dto.cell_type}</li>
  <li>${dto.userid}</li>
</ul>
</c:forEach>

