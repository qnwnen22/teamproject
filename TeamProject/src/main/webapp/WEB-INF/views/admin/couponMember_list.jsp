<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	function list(page) {
		location.href = "${path}/member/list.do?curPage=" + page+"&keyword=${map.keyword}";
	}
</script>
</head>
<body>
<div class="col-11">
	<form class="input-group" action="${path}/member/list.do">
		<input type="text" class="form-control col-2 ml-5" placeholder="검색어 입력"
			value="${map.keyword}" id="keyword" name="keyword"> <input
			type="hidden" id="location" name="location" value="">
		<div class="input-group-append">
			<button class="btn btn-outline-primary" type="submit">검색</button>
		</div>
	</form>
	</div>
	<div
		class="table-responsive col-11 mx-auto">
		<table class="table table-bordered table-hover" id="userInfo">
			<thead class="thead-dark">
				<tr class="text-center">
					<th><input type="checkbox" id="checkAll" onclick="selectAll()"></th>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>가입일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${map.list}">
					<tr class="text-center" style="cursor:pointer;" id="userEmail">
						<td><input type="checkbox" name="userCheckBox" id=userCheckBox value="${row.useremail}"></td>
						<td>${row.userid}</td>
						<td><a href="#"> ${row.username}</a></td>
						<td>${row.phone}</td>
						<td>${row.birthday}</td>
						<td>${row.useremail}</td>
						<td><fmt:formatDate value="${row.join_date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
			<!-- 페이지 네비게이션 출력 -->
		</table>
		<!-- 페이징 처리 -->
		<div class="row justify-content-center">
			<nav aria-label="Page navigation example center-block">
				<ul class="pagination">
					<c:if test="${map.pager.curBlock>1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('1')">&lt;&lt;</a></li>
					</c:if>
					<c:if test="${map.pager.curBlock >1}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.prevPage}')">&lt;</a></li>
					</c:if>
					<c:forEach var="num" begin="${map.pager.blockBegin}"
						end="${map.pager.blockEnd}">
						<c:choose>
							<c:when test="${num==map.pager.curPage}">
								<li class="page-item"><a class="page-link">${num}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="#"
									onclick="list('${num}')">${num}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.pager.curBlock < map.pager.totBlock}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.nextPage}')">&gt;</a></li>
					</c:if>
					<c:if test="${map.pager.curPage <map.pager.totPage}">
						<li class="page-item"><a class="page-link" href="#"
							onclick="list('${map.pager.totPage}')">&gt;&gt;</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<br>
	<script type="text/javascript">
$(function(){
	$("#userInfo tr").click(function() {
	    //alert("customerlisttablebody tr click");
	     var tr = $(this);
	     var td = tr.children();     
	    var email = td.eq(0).children().val();
	   $("input:checked[name=customerListBox]").each(function() {
	    if (email != $(this).val()) {
	     $(this).attr("checked", false); // uncheck all checkboxes
	     //alert("checked checkbox false");
	    }
	   });
	     td.eq(0).children().attr("checked", "true");
	     var emailAdd = "<div class='userEmail rounded-lg text-center m-1'style='background-color: #c6e8f2; line-height:15px;' id='"+email+"'>"+ email +"&nbsp;<a href='javascript:void(0);'><i class='fas fa-times'></i></a></div>"
	     $("#useremailBox").append(emailAdd);
	    });
});
$(".userEmail").on("click", "a", function(event) {
	var that = $(this);
	that.parent("div").remove();
});	
	</script>
</body>
</html>