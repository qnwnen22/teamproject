<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/fixed-topbar.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
<link rel="stylesheet" href="${path}/include/css/board.css">
</head>
<body>
	<div class="board_table" style="margin-top: 170px;">
	<div>
		<ul class="upper_shift">
			<li><a href="${path}">KDEMY</a></li>
			<li>공지사항</li>
		</ul>
	</div>
		<form action="${path}/board/list.do" name="form1" method="post">
			<select name="search_option" class=" search_option">
				<option value="username"
				<c:if test="${map.search_option=='username' }">selected</c:if>>이름</option>
				<option value="title"
				<c:if test="${map.search_option=='title' }">selected</c:if>>제목</option>
				<option value="content"
				<c:if test="${map.search_option=='content' }">selected</c:if>>내용</option>
				<option value="all"
				<c:if test="${map.search_option=='all' }">selected</c:if>>이름+내용+제목</option>
			</select>
			<div class="input-group mb-3">
  <input type="text" class="form-control" 
  placeholder="검색" aria-label="Recipient's username" aria-describedby="basic-addon2"
  name="keyword" maxlength="20" value="${map.keyword}">
  <div class="input-group-append">
    <span class="input-group-text" id="basic-addon2">
				<a href="#" class="search_btn_hover"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_search.png" width="20px;"></a>
    </span>
  </div>
</div>
									
					<c:choose>
				<c:when test="${sessionScope.userid != null }"> <!-- 관리자로 로그인했을때 아이디 바꾸기-->
							<div class="write_btn_align"><a class="btn btn-sm btn-primary font-color-fff btn-normal-silver"
								href="${path}/board/write.do" data-ga-category="header" >
								글쓰기 </a></div>
				</c:when>
				</c:choose>
				</form>
				
				<table class="table table-hover " >
						<tr class="row" align="center">
							<th class="col-1">번호</th>
							<th class="col-6">제목</th>
							<th class="col-2">이름</th>
							<th class="col-2">날짜</th>
							<th class="col-1">조회수</th>
						</tr>
						<c:forEach var="rows" items="${map.list}">
						<tr class="row" align="center">
							<td class="col-1">${rows.bno}</td>
							<td class="col-6"><a href="${path}/board/view.do?bno=${rows.bno}">${rows.title}</a>
								<c:if test="${rows.cnt>0}">
									<span style="color: blue;" class="badge badge-primary">${rows.cnt}</span>
								</c:if>
							</td>
							<td class="col-2">${rows.writer}</td>
							<td class="col-2"><fmt:formatDate value="${rows.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td class="col-1">${rows.viewcnt}</td>
						</tr>
						</c:forEach>
		</table>

			<nav aria-label="Page navigation example">
				<ul class="pagination">
				<c:if test="${map.pager.curBlock>1}">
				<li class="page-item"><a class="page-link" href="#" onclick="list('1')">처음</a></li>
				</c:if>
				<c:if test="${map.pager.curBlock >1}">
					<li class="page-item"><a class="page-link" href="#" onclick="list('${map.pager.prevPage}')">이전</a></li>
				</c:if>
				<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num==map.pager.curPage}">
						<li class="page-item"><a class="page-link">${num}</a></li>
						</c:when>
						<c:otherwise>
					<li class="page-item"><a class="page-link" href="#" onclick="list('${num}')">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<li class="page-item"><a class="page-link" href="#" onclick="list('${map.pager.nextPage}')">다음</a></li>
				</c:if>
				<c:if test="${map.pager.curPage <map.pager.totPage}">
					<li class="page-item"><a class="page-link" href="#" onclick="list('${map.pager.totPage}')">끝</a></li>
				</c:if>
				</ul>
			</nav>

	</div>
	
	<br>	<br>	<br>	<br>	<br>	<br>	<br><br>	<br>	<br>	<br>	<br>	<br>	<br><br>	<br>	<br>	<br>	<br>	<br>	<br><br>	<br>	<br>	<br>	<br>	<br>	<br>






	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>
</html>
<%@ include file="../include/footer.jsp"%>

