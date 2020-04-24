<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
<link rel="stylesheet" href="${path}/include/css/lecture.css">
<script type="text/javascript">
/* function list(page) {
	location.href = "${path}/lecture/all_list.do?curPage="+page;
}
function search(){
	var keyword=document.getElementById("keyword").value;
	location.href = "${path}/lecture/all_list_search.do?keyword="+keyword;
} */
</script>
</head>
<body>
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12">
	<div class="col-12 mx-auto">
		<ul class="upper_shift">
			<li><a href="${path}">KDEMY</a></li>
			<li>강사 페이지</li>
			<li><a href="#" style="color:blue;">등록한 강의 목록</a></li>
		</ul>
	</div>
	
	<div class="col-12 d-flex p-0">
		<div class="col-8 ml-0 px-0">
			<ul class="nav nav-tabs">
	 			<li class="nav-item">
	   				<a class="nav-link active" onclick="#" data-toggle="tab" href="#">모든 강의</a>
	 			</li>
	 			
	 			<li class="nav-item">
	   				<a class="nav-link" onclick="#" data-toggle="tab" href="#">동영상 강의</a>
	 			</li>
	 			
	 			<li class="nav-item">
	   				<a class="nav-link" onclick="#" data-toggle="tab" href="#">실시간 시간</a>
	 			</li>
	 			
	 			<li class="nav-item">
	   				<a class="nav-link" onclick="#" data-toggle="tab" href="#">현장 강의</a>
	 			</li>
			</ul>
		</div>
		
		<div class="col-4 ml-auto p-0">
			<form name="form_search" class="input-group">
				<input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword">
				
				<div class="input-group-append">
					<button class="btn btn-outline-primary" type="button" onclick="">조회</button>
				</div>
			</form>
		</div>
	</div>
	<table class="table table-bordered table-hover">
		<thead class="thead-dark">
			<tr>
				<th>영상 번호</th>
				<th>이미지</th>
				<th>판매타입</th>
				<th>영상 제목</th>
				<th>등록일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.lecture_idx}</td>
					<td>
						<a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
						<img class="myLectureImg" src="../upload/${dto.main_img}"></a>
					</td>
					<td>
						<c:choose>
							<c:when test="${dto.cell_type=='1'}">동영상 강의</c:when>					
							<c:when test="${dto.cell_type=='2'}">실시간 강의</c:when>
							<c:when test="${dto.cell_type=='3'}">현장 강의</c:when>
							<c:otherwise><a style="color: red;">판매타입이 지정되어있지 않습니다.</a></c:otherwise>
						</c:choose>
					</td>
					<td>${dto.subject}</td>
					<td><fmt:formatDate value="${dto.upload_date}" pattern="yyyy-MM-dd" /></td>
					<td><a href="${path}/lecture/lectureUpdatePage.do?lecture_idx=${dto.lecture_idx}">수정</a> | <a href="${path}/lecture/lectureDelete.do?lecture_idx=${dto.lecture_idx}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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
<!-- 페이징 처리 -->
		
<%@ include file="../include/footer.jsp"%>
</body>
</html>