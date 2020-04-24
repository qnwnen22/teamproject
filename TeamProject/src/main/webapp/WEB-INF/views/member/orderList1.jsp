<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <%@ include file="../include/header.jsp" %>
  <%@ include file="../include/fixed-topbar.jsp" %> 
<head>
  <title>구매목록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
.lecture:hover {
  background-color: #edeff2;
}

.lecture:active {
  background-color: #eeeeee;
  }

</style>
</head>
<body>
	<div class="container" style="width:60%; float:none; margin:0 auto">
			<div class="col-xl-12 m-2 h-auto d-inline-block">
	<br>
	  <c:forEach var="dto" items="${list2}">
			<div class="row lecture" style="border-radius:10px;">
			<div class="col-sm-5"><a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
			    <img src="${path}/lecture/displayFile?fileName=${dto.main_img}" class="img-fluid lectureImg" style="height:180px; width:100%"></a></div>
				<div class="col-sm-7">
				<div class="short-div m-5"><strong>${dto.subject}</strong></div>
				<div class="short-div">${dto.userid}</div>
				<div class="short-div">&nbsp;&nbsp;<span>${dto.buy_date}</span></div>
				</div>
				
				</div>
				
				<%-- ${dto.box_idx}</td> align="center" --%>
				<%-- <td class="col-2">${dto.buy_date}</td> --%>
         	<br><br>
         </c:forEach>
		</div>
	</div>
	
	
				
	<script>
	function click(page) {location.href = "${path}/lecture/all_list.do?curPage="+page;}
	</script>
	
	</body>
	<%@ include file="../member/footer1.jsp"%> 
</html>