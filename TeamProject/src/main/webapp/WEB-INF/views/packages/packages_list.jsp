<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp" %>
<script type="text/javascript">
	function list(page) {
		location.href = "${path}/packages/list.do?curPage="+page;
	}
</script>
</head>
<body>
<%@include file="../include/fixed-topbar.jsp" %>
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3">
<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/admin/managementMenu.do">관리메뉴</a></b></li>
				<li><b><a href="#" style="color:blue;">패키지 구매</a></b></li>
			</ul>
		</div>
		<hr>
<div class="d-flex row col-12">
<c:forEach var="dto" items="${map.list}">
<div class="col-6 col-lg-3 mb-4">
<div class="card mr-.5 rounded-lg shadow p-4 mb-4 bg-white" style="height:380px;">
  <img class="img-responsive card-img-top center-block mb-3" width="420" height="150" src="../include/images/coupon/${dto.packages_image}" alt="Card image">
  <div class="kdemycard-body">
  <div style="height:7rem;">
    <h4 class="card-title h5">${dto.packages_name}</h4>
    <h5 class="text-danger"><fmt:formatNumber value="${dto.packages_price}" pattern="#,###" /></h5>
    <p class="card-text">${dto.packages_text}</p>
    </div>
    <hr class="mb-2">
    <button class="btn btn-outline-primary mx-auto d-block" data-toggle="modal" data-target="#confirm">구매</button>
  </div>
</div>
</div>
<br>
</c:forEach>
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
<br>
<div class="modal" id="confirm">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">구매</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <h6>해당 상품을 구매 하시겠습니까?</h6>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-primary" onclick="">구매</button>
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>

<%@include file="../include/footer.jsp" %>
</body>
</html>