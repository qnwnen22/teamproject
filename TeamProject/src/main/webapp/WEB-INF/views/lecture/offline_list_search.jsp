<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
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
<link rel="stylesheet" href="${path}/include/css/lectureList.css">
</head>
<body>
<%@ include file="../include/fixed-topbar.jsp" %>
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12">
	<div class="row col-12">
		<div class="col-2 d-none d-lg-block">
			<div class="col-12 border border-dark m-0 p-0 asideDiv">
				<div class="col-12"><h5><a href="${path}/lecture/all_list.do">ALL</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/video_list.do">동영상 강의</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/online_list.do">실시간 강의</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list.do">현장 강의</a></h5></div>
				<hr>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=디자인">디자인</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=IT,프로그래밍">IT,프로그래밍</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=콘텐츠 제작">콘텐츠 제작</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=마케팅">마케팅</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=번역,통역">번역,통역</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=문서,통역">문서,통역</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=비즈니스컨설팅">비즈니스컨설팅</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=운세,상담">운세,상담</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=레슨,실무교육">레슨,실무교육</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=주문제작">주문제작</a></h5></div>
				<div class="col-12"><h5><a href="${path}/lecture/offline_list_search.do?keyword=간판,인쇄">간판,인쇄</a></h5></div>
			</div>
		</div>
		<div class="col-10">
		
			<div class="col-12 d-flex p-0">
				<div class="col-8">
					<ul class="upper_shift">
						<li><a href="${path}">KDEMY</a></li>
						<li>강의</li>
						<li><a href="#" style="color:blue;">실시간 강의</a></li>
					</ul>	
				</div>
				
				
			<div class="input-group mb-3 my-auto">
			  <form name="form_search" class="input-group">
				<input type="text" class="form-control" placeholder="Search" name="keyword" id="keyword">
			      <div class="input-group-append">
			        <button class="btn btn-outline-primary" type="button" onclick="search()">조회</button>
			      </div>
			  </form>
			</div>
			</div>
	
			<hr>
			
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
									<img class="img-fluid mx-auto d-block" style="height:150px;"src="../upload/${dto.main_img}">
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
										<fmt:formatNumber value="40000" pattern="#,###" />
									</div>
									
									<div class="col-6">
										<b>추천수</b><br>
										<fmt:formatNumber value="40000" pattern="#,###" />	
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
	location.href = "${path}/lecture/offline_list_search.do?curPage="+page+"&keyword="+keyword;
}
function search(){
	var keyword=document.getElementById("keyword").value;
	location.href = "${path}/lecture/offline_list_search.do?keyword="+keyword;
}
</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>