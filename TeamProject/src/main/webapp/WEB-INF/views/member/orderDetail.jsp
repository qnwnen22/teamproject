<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function lectureView_success(){
	document.viewForm.submit();
}
function test(){
	alert("test");
}
</script>
</head>
<body>
	<div class="container">
	<div class="">
		<div>
		</div>
		<br> <br>
	<p>구매목록</p>
	<table class="table table-hover">
			<thead>
				<tr class="row" align="center">
				<th class="col-1"><input type="checkbox" name="chkAll" id="chkAll" > </th>
			<th class="col-1">이미지</th>
			<th class="col-1">번호</th>
			<th class="col-1">판매타입</th>
			<th class="col-1">강의 번호</th>
			<th class="col-3">구입일자</th>
			<td class="col-1">별점</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="dto" items="${list2}">
			<tr class="row" align="center">
			<th class="col-1"><input type="checkbox" name="chk" class="chk"> </th>
				<td class="col-1">
					<form method="post" name="viewForm" id="viewForm" action="${path}/lecture/lectureView_success.do?">
						<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}"><br>
						<a href="${path}/lecture/lectureView_success.do?lecture_idx=${dto.lecture_idx}"><img src="../upload/${dto.main_img}"></a>
					</form>
				</td>
				<td class="col-1">${dto.box_idx}</td>
			<c:choose>
				<c:when test="${dto.cell_type == 1}">
					<td class="col-1">동영상 강의</td>
				</c:when>
				<c:when test="${dto.cell_type == 2}">
					<td class="col-1">실시간 강의</td>
				</c:when>
				<c:when test="${dto.cell_type == 3}">
					<td class="col-1">현장 강의</td>
				</c:when>
				<c:otherwise>
					<td class="col-1">버그 (error)</td>
				</c:otherwise>
			</c:choose>
				<td class="col-1">${dto.lecture_idx}</td>
				<td class="col-1">${dto.buy_date}</td>
				<td class="col-1">
				</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
	</div>
	</div>
	</body>
</html>