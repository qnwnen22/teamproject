<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
<script type="text/javascript">
function buyList(){

	var point=Number(document.getElementById("point").value);
	var price=Number(document.getElementById("price").value);

	if(point < price){
		alert("포인트가 모자랍니다.");
		return false;
	}else {
		if(confirm("구매하시겠습니까?")==true){
			alert("구매가 완료되었습니다.");
			document.form1.submit();
		}else{
			alert("구매를 취소하셨습니다.");
		}
	}
}
</script>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
	<h2>장바구니 페이지</h2>
	<h4>보유중인 포인트</h4>
	<input type="text" name="point" id="point" value="${point}" readonly>
	<input type="button" value="포인트 충전 (아직 미구현)"><br>
	<hr>
	<div>
		장바구니 갯수 : ${count}<br>
		
	</div>
	<table style="border: 1px solid; width: 100%;">
		<tr>
			<th>번호(cart_idx)</th>
			<th>판매타입(cell_type)</th>
			<th>아이디(userid)</th>
			<th>강의 번호(lecture_idx)</th>
			<th>가격(price)</th>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.cart_idx}</td>
				<td>${dto.cell_type}</td>
				<td>${dto.userid}</td>
				<td>${dto.lecture_idx}</td>
				<td>${dto.price}</td>
			</tr>
		</c:forEach>
	</table>
	<hr>

	<div style="width: 100%;">
		<c:set var="sum" value="0"/>
		<c:forEach var="dto" items="${list}" begin="0" end="${list.size()}">
			<c:set var="sum" value="${sum + dto.price}"/>
		</c:forEach>
	
		<form method="post" name="form1" id="form1" action="${path}/cart/buyList.do">
			레코드 갯수 : <input type="text" name="count" value="${count}" readonly><br>
			
			<c:forEach var="dto" items="${list}" begin="0" end="${count}">
				판매 타입 : ${dto.cell_type} |
				<input type="hidden" name="cell_type" value="${dto.cell_type}">
				렉쳐 인덱스 : 
				<input type="text" name="lecture_idx" value="${dto.lecture_idx}"><br>
			
			</c:forEach>
			총가격 : <input type="text" name="price" id="price" value="${sum}"><br>
			<input type="button" value="일괄 구매" onclick="buyList()">
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>