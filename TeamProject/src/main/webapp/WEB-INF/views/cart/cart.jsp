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

$(function(){
	$("#btnDeleteAll").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			location.href="${path}/cart/deleteAll.do";
		}
	});

	$("#chkAll").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#chkAll").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
			$("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
			} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
		$("input[type=checkbox]").prop("checked",false);
		} 
	}); 
});
</script>
<style type="text/css">

.upper_shift {
	padding: 10px 16px;
	list-style: none;
}

.upper_shift li {
	display: inline;
	font-size: 1.5em;
}

.upper_shift li+li:before {
	padding: 8px;
	color: black;
	content: ">\00a0";
}

.upper_shift li a {
	color: black;
	text-decoration: none;
}

.upper_shift li a:hover {
	font-size: 1.1em;
	color: #01447e;
}

</style>
</head>
<body>
<%@ include file="../include/fixed-topbar.jsp" %>
<br>
	<br>
	<div class="container">
	<div class="">
		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li>장바구니</li>
			</ul>
		</div>
		<br> <br>

	<h4>보유중인 포인트</h4>
	<input type="text" name="point" id="point" value="${point}" readonly>
		<input type="button" onclick="location.href='${path}/cart/pointCharge.do'" value="10,000포인트 충전 (작업용)"><br>
	<hr><br>
	<div>
		장바구니 갯수 : ${count}<br>
		
	</div>
	<table class="table table-hover">
			<thead>
				<tr class="row" align="center">
				<th class="col-1"><input type="checkbox" name="chkAll" id="chkAll" > </th>
			<th class="col-1">번호</th>
			<th class="col-1">판매타입</th>
			<th class="col-1">아이디</th>
			<th class="col-1">강의 번호</th>
			<th class="col-3">카테고리</th>
			<th class="col-2">강의명</th>
			<th class="col-1">가격</th>
			<td class="col-1"></td>
		</tr>
		</thead>
		<tbody >
		<c:forEach var="dto" items="${list}">
			<tr class="row" align="center">
			<th class="col-1"><input type="checkbox" name="chk" class="chk"> </th>
				<td class="col-1">${dto.cart_idx}</td>
				<td class="col-1">${dto.cell_type}</td>
				<td class="col-1">${dto.userid}</td>
				<td class="col-1">${dto.lecture_idx}</td>
				<td class="col-3">${dto.main_category} &gt; ${dto.sub_category}</td>
				<td class="col-2">${dto.subject}</td>
				<td class="col-1">${dto.price}</td>
				<td class="col-1">
					<a href="${path}/cart/delete.do?cart_idx=${dto.cart_idx}">
						<svg class="bi bi-trash-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M2.5 1a1 1 0 00-1 1v1a1 1 0 001 1H3v9a2 2 0 002 2h6a2 2 0 002-2V4h.5a1 1 0 001-1V2a1 1 0 00-1-1H10a1 1 0 00-1-1H7a1 1 0 00-1 1H2.5zm3 4a.5.5 0 01.5.5v7a.5.5 0 01-1 0v-7a.5.5 0 01.5-.5zM8 5a.5.5 0 01.5.5v7a.5.5 0 01-1 0v-7A.5.5 0 018 5zm3 .5a.5.5 0 00-1 0v7a.5.5 0 001 0v-7z" clip-rule="evenodd"/>
						</svg>
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	
	</table>
	<button class="btn btn-sm btn-primary font-color-fff btn-normal-silver" id="btnDeleteAll">전체삭제</button> 
	<hr>

	<div>
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
			<input type="hidden" name="price" id="price" value="${sum}">
			총가격 : <fmt:formatNumber pattern="###,###,###원" value="${sum}" /> <br>
			<button type="button" class="btn btn-sm btn-primary font-color-fff btn-normal-silver" onclick="buyList()">일괄 구매</button> 
		</form>
		<br><br><br><br>
	</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>