<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/topbar.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
<script src="${path}/include/js/common.js"></script>


</head>
<body>
<h2>현장 강의 페이지</h2>
<p>현장 강의를 올리는 페이지 입니다.</p>

<div class="row">
<br>
 <c:forEach var="dto" items="${map.list}">
<h2 class="text-center">${dto.sub_category}</h2>


    <div class="col-xs-4 col-sm-4 col-md-3 col-lg-3 text-center">  
    <a href="${path}/teacher/view.do?lecture_idx=${dto.subject}"></a>
    <input type="hidden" name="lecture_idx" value="${dto.lecture_idx}">
     <img src="../upload/2020/03/26/left.jpg" class="img-rounded img-responsive"> 
     <video controls="controls" width="100%" preload="metadata">
        <source src="../upload${dto.videofile}" type="video/mp4">
      </video>
     <b>${dto.content}</b><br>
     <b><fmt:formatNumber value="${dto.price}" pattern="###,###,###"/>원</b><br>
    </div>


 </c:forEach>
</div>


<div class="text-center">
     <ul class="pagination">
      <c:if test="${map.page.curBlock > 1 }">
        <li><a href="#" onclick="list('1')">&lt;&lt;</a></li>
      </c:if>
      <c:if test="${map.page.curBlock > 1 }">
        <li><a href="#" onclick="list('${map.page.prevPage}')">&lt;</a></li>
      </c:if>
      <c:forEach var="num" begin="${map.page.blockStart}" end="${map.page.blockEnd}">
        <c:choose>
          <c:when test="${num == map.page.curPage}">
            <li><span style="color: red">${num}</span></li>
          </c:when>
          <c:otherwise>
            <li><a href="#" onclick="list('${num}')">${num}</a></li>
          </c:otherwise>
        </c:choose>
      </c:forEach>
      <c:if test="${map.page.curBlock < map.page.totBlock}">
        <li><a href="#" onclick="list('${page.nextPage}')">&gt;</a></li>
      </c:if>
      <c:if test="${map.page.curBlock < map.page.totBlock}">
        <li><a href="#" onclick="list('${map.page.totPage}')">&gt;&gt;</a></li>
      </c:if>
  </ul>
</div>

</body>
</html>