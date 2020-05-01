<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kdemy 강의</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/css/lectureList.css">
</head>
<body>
<%@ include file="../include/fixed-topbar.jsp" %>
<div class="container col-xl-8 col-lg-12 col-md-12 col-sm-12 mx-auto">
	<div class="row col-12">
		<div class="col-12">
			<div class="col-12">
				<ul class="upper_shift">
					<li><a href="${path}">KDEMY</a></li>
					<li><a href="#">동영상 강의</a></li>
					<li><a href="#" style="color:blue;">${map.keyword}</a></li>
				</ul>	
			</div>
				
			<div class="col-lg-12 d-lg-flex d-md-block px-0 mb-2">
				<div class="col-lg-8 ml-0 px-0 d-none d-lg-block">
					<ul class="nav nav-tabs ml-0 pl-0">
						<li class="nav-item">
							<a class="nav-link" href="${path}/lecture/all_list.do">전체 강의</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${path}/lecture/online_list.do">실시간 강의</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${path}/lecture/offline_list.do">현장 강의</a>
						</li>
						<li class="nav-item">
							<a class="nav-link active" style="color: blue" href="${path}/lecture/video_list.do">동영상 강의</a>
						</li>
					</ul>	
				</div>	
				
				<div class="col-lg-4 col-md-12 input-group mb-3">
					<form name="form_search" class="input-group">
						<input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword" value="${map.keyword}">
						
						<div class="input-group-append">
							<button class="btn btn-outline-primary" type="button" onclick="search()">조회</button>
						</div>
					</form>
				</div>
			</div>
			
			<div class="row">
				<c:forEach var="dto" items="${map.list}">
					<div class="col-12 col-sm-4 col-lg-3 mb-3">
						<a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
							<div class="card mb-3 mx-.5 shadow bg-white rounded border border-secondary">
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
								
								<div class="card-image mx-0">
									<img class="img-fluid mx-auto d-block" style="height:170px;"src="${path}/lecture/displayFile?fileName=${dto.main_img}">
								</div>
		
								<div class="col-12 mt-3">
									<h5><b>${dto.subject}</b></h5>
								</div>
								
								<div class="col-12 mb-2">
									${dto.userid}
								</div>
								
								<div class="col-12 d-flex flex-row mx-0 px-0">
									<div class="col-6">
										<b>학생수</b><br>
										<fmt:formatNumber value="${dto.cellCount}" pattern="#,###" />
									</div>
									
									<div class="col-6">
										<b>추천수</b><br>
										<fmt:formatNumber value="${dto.upCount}" pattern="#,###" />	
									</div>
								</div>
								
								<hr>
								<div class="col-12 mb-1 text-right">
									<h5><b style="color:blue;">￦<fmt:formatNumber value="${dto.price}" pattern="#,###" /></b></h5>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>		
			</div>
			
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
	</div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
function list(page) {
	var keyword=document.getElementById("keyword").value;
	location.href = "${path}/lecture/video_list_search.do?curPage="+page+"&keyword="+keyword;
}
function search(){
	var keyword=document.getElementById("keyword").value;
	location.href = "${path}/lecture/video_list_search.do?keyword="+keyword;
}
</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>