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
		$.ajax({
	        type: 'post'
	      , url: "${path}/member/couponMemberlist.do?curPage="+ page+"&keyword=${map.keyword}"
	      , dataType : 'text'
	      , success: function(data) {
	      	$("#memberlistDiv").html(data);
	        }
		});
	}
	function serarchMember() {
		$.ajax({
	        type: 'post'
		  , data: $('#keyword').val()
	      , url: "${path}/member/couponMemberlist.do"
	      , dataType : 'text'
	      , success: function(data) {
	      	$("#memberlistDiv").html(data);
	        }
		});
	}
</script>
</head>
<body>
<div class="col-11">
	<form class="input-group">
		<input type="text" class="form-control col-2 ml-5" placeholder="검색어 입력"
			value="${map.keyword}" id="keyword" name="keyword"> <input
			type="hidden" id="location" name="location" value="">
		<div class="input-group-append">
			<button class="btn btn-outline-primary" type="button">검색</button>
		</div>
	</form>
	</div>
	<div
		class="table-responsive col-11 mx-auto">
		<table class="table table-bordered table-hover" id="userInfo">
			<thead class="thead-dark">
				<tr class="text-center">
					<th><input type="checkbox"></th>
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
						<td><input type="checkbox" name="userCheckBox" id="userCheckBox" value="${row.useremail}"></td>
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
	<script>
	$(document).ready(function(){
        var tbl = $("#userInfo");
         
        // 테이블 헤더에 있는 checkbox 클릭시
        $(":checkbox:first", tbl).click(function(){
            // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
            if( $(this).is(":checked") ){
                $(":checkbox", tbl).attr("checked", "checked");
            }
            else{
                $(":checkbox", tbl).removeAttr("checked");
            }

            // 모든 체크박스에 change 이벤트 발생시키기               
            $(":checkbox", tbl).trigger("change");
        });
         
        // 헤더에 있는 체크박스외 다른 체크박스 클릭시
        $(":checkbox:not(:first)", tbl).click(function(){
            var allCnt = $(":checkbox:not(:first)", tbl).length;
            var checkedCnt = $(":checkbox:not(:first)", tbl).filter(":checked").length;
            // 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단
            if( allCnt==checkedCnt ){
                $(":checkbox:first", tbl).attr("checked", "checked");
            }
            else{
                $(":checkbox:first", tbl).removeAttr("checked");
            }
        }).change(function(){
            if( $(this).is(":checked") ){
                $(this).parent().parent().addClass("selected");
                var email = $(this).val();
                var emailAdd = "<div class='userEmail rounded-lg text-center m-1'style='background-color: #c6e8f2; line-height:15px;' id='"+email+"'>"+ email +"&nbsp;<a href='javascript:;' onclick='deleteEmail(this);'><i class='fas fa-times'></i></a></div><input type='hidden' name='useremail' value='"+email+"'>"
			    $("#useremailBox").append(emailAdd);
            }
            else{
                $(this).parent().parent().removeClass("selected");
                var email = $(this).val();
                $('#'+$.escapeSelector(email)).remove();
            }
        });
    });
	function deleteEmail(obj) {
		var that = $(obj);
		var email = that.parent().val();
		console.log(email);
		$("userEmail").find(email).removeClass("selected");
		that.parent("div").remove();
	}
	</script>
</body>
</html>