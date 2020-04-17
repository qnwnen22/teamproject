<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp"%>
</head>
<body>
	<%@include file="../include/fixed-topbar.jsp"%>
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3" style="margin-top: 170px;">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link" href="${path}/lecture/online_list.do?admin=admin">실시간
					강의</a></li>
			<li class="nav-item"><a class="nav-link active" href="${path}/lecture/video_List.do?admin=admin">동영상 강의</a></li>
			<li class="nav-item"><a class="nav-link" href="${path}/lecture/offline_list.do?admin=admin">오프라인 강의</a></li>
			<li class="input-group col-3 ml-auto mr-0">
				<form class="input-group" action="#">
					<input type="text" class="form-control" placeholder="검색어 입력"
						value="" id="keyword" name="keyword"> <input type="hidden"
						id="location" name="location" value="">
					<div class="input-group-append">
						<button class="btn btn-outline-primary" type="submit">검색</button>
					</div>
				</form>
			</li>
		</ul>
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th></th>
						<th>작성자</th>
						<th>제목</th>
						<th>가격</th>
						<th>등록일</th>
						<th>강의일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${map.list}">
						<tr>
							<td><a
								href="${path}/teacher/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
									<img src="../upload/${dto.main_img}"
									class="align-self-center mr-3" style="width: 60px">
							</a></td>
							<td>${dto.subject}</td>
							<td>${dto.userid}</td>
							<td>${dto.price}</td>
							<td>${dto.upload_date}</td>
							<td>${dto.lecture_start}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
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
		<%@include file="../include/footer.jsp"%>
</body>
</html>