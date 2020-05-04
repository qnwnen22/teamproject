<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 강의 목록</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
<link rel="stylesheet" href="${path}/include/css/lecture.css">
</head>
<body>
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 px-0">
	<div class="col-12 mx-auto">
		<ul class="upper_shift">
			<li><a href="${path}">KDEMY</a></li>
			<li>강사 페이지</li>
			<li><a href="#" style="color:blue;">등록한 강의 목록</a></li>
		</ul>
	</div>
	
	<div class="col-12">
		<h3>총 수입 : ${total}</h3>
	</div>
	
	<div class="col-12 d-none d-md-block m-0 p-0 ">	
		<table class="table table-bordered table-hover m-0 p-0" style="width: 100%">
			<thead id="thead" class="thead-dark" style="font-size: 1.2em">
				<tr>
					<th scope="col">영상 번호</th>
					<th scope="col">이미지</th>
					<th scope="col">판매 타입</th>
					<th scope="col"><a style="color: white" href="${path}/lecture/myLecturePage.do?orderType=revenue">판매 수입</a></th>
					<th scope="col">영상 제목</th>
					<th scope="col">등록일</th>
					<th scope="col">관리</th>
				</tr>
			</thead>
			<tbody id="tbody" class="text-justify">
				<c:forEach var="dto" items="${list}">
					<tr>
						<th scope="row">${dto.lecture_idx}</th>
						<td class="text-center">
							<a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
							<img class="img-fluid" style="max-height:170px" src="${path}/lecture/displayFile?fileName=${dto.main_img}"></a>
						</td>
						<td>
							<c:choose>
								<c:when test="${dto.cell_type=='1'}">동영상 강의</c:when>					
								<c:when test="${dto.cell_type=='2'}">실시간 강의</c:when>
								<c:when test="${dto.cell_type=='3'}">현장 강의</c:when>
								<c:otherwise><a style="color: red;">판매타입이 지정되어있지 않습니다.</a></c:otherwise>
							</c:choose>
						</td>
						<td>
							${dto.revenue}
						</td>
						<td>${dto.subject}</td>
						<td><fmt:formatDate value="${dto.upload_date}" pattern="yyyy-MM-dd" /></td>
						<td>
							<button type="button" class="btn btn-warning" onclick="location.href='${path}/lecture/lectureUpdatePage.do?lecture_idx=${dto.lecture_idx}'">수정</button>
							<%-- <button type="button" class="btn btn-danger" onclick="location.href='${path}/lecture/lectureDelete.do?lecture_idx=${dto.lecture_idx}'">삭제</button> --%>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="col-12 d-block d-md-none m-0 p-0">
		<c:forEach var="dto" items="${list}">
		<div class="col-12 d-flex m-0 p-0 border border-dark">
			<div class="col-7 text-center border border-dark p-0 m-0">
				<a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
				<img class="img-fluid" style="max-height:170px" src="../upload/${dto.main_img}"></a>
			</div>
			<div class="col-5 m-0 p-0 card">
				<div class="card-header m-0 p-0">
					<c:choose>
						<c:when test="${dto.cell_type==1}">
							<div class="col-12 mx-0 p-0 text-center" style="background-color: #804000;">
								<b style="color: white;">동영상 강의</b>
							</div>
						</c:when>
						
						<c:when test="${dto.cell_type==2}">
							<div class="col-12 mx-0 p-0 text-center" style="background-color: #339933;">							
								<b style="color: white">실시간 강의</b>
							</div>
						</c:when>	
						
						<c:when test="${dto.cell_type==3}">
							<div class="col-12 mx-0 p-0 text-center" style="background-color: #3366cc;">
								<b style="color: white">현장 강의</b>
							</div>
						</c:when>
					</c:choose>
				</div>
				
				<div class="card-body">
					<h5 class="card-title">${dto.subject}</h5>
					강의 번호 : ${dto.lecture_idx}<br>
					등록일 : <fmt:formatDate value="${dto.upload_date}" pattern="yyyy-MM-dd" />
				</div>
				
				<div class="m-0 p-0 card-footer d-flex">
					<div class="col-12">
						<button type="button" class="w-100 btn btn-warning" onclick="location.href='${path}/lecture/lectureUpdatePage.do?lecture_idx=${dto.lecture_idx}'">수정</button>
					</div>
					<%-- <div class="col-6 m-0 p-0 pl-1">
						<button type="button" class="w-100 btn btn-danger" onclick="location.href='${path}/lecture/lectureDelete.do?lecture_idx=${dto.lecture_idx}'">삭제</button>
					</div> --%>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<%-- <div class="row justify-content-center">
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
	</div> --%>
</div>
<!-- 페이징 처리 -->
		
<%@ include file="../include/footer.jsp"%>
</body>
</html>