<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
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
#reviewStar a{ 
	text-decoration: none;
	color: gray; 
} 
#reviewStar a.on{
	color: yellow; 
}

</style>
<script type="text/javascript">
function lectureView_success(){
	document.viewForm.submit();
}
$('#star1 a').click(function(){
	$(this).parent().children("a").removeClass("on"); 
	$(this).addClass("on").prevAll("a").addClass("on"); 
	console.log($(this).attr("value"));
});

function reviewStar(num){
	switch(num){
	case 1 : 
		document.getElementById("star1").style="color: #ffa500;"
		document.getElementById("star2").style.color="gray";
		document.getElementById("star3").style.color="gray";
		document.getElementById("star4").style.color="gray";
		document.getElementById("star5").style.color="gray";
	break;
	case 2 : 
		document.getElementById("star1").style.color="#ffa500";
		document.getElementById("star2").style.color="#ffa500";
		document.getElementById("star3").style.color="gray";
		document.getElementById("star4").style.color="gray";
		document.getElementById("star5").style.color="gray";
	break; 
	case 3 : 
		document.getElementById("star1").style.color="#ffa500";
		document.getElementById("star2").style.color="#ffa500";
		document.getElementById("star3").style.color="#ffa500";
		document.getElementById("star4").style.color="gray";
		document.getElementById("star5").style.color="gray";
	break;
	case 4 : 
		document.getElementById("star1").style.color="#ffa500";
		document.getElementById("star2").style.color="#ffa500";
		document.getElementById("star3").style.color="#ffa500";
		document.getElementById("star4").style.color="#ffa500";
		document.getElementById("star5").style.color="gray";
	break;
	case 5 : 
		document.getElementById("star1").style.color="#ffa500";
		document.getElementById("star2").style.color="#ffa500";
		document.getElementById("star3").style.color="#ffa500";
		document.getElementById("star4").style.color="#ffa500";
		document.getElementById("star5").style.color="#ffa500";
	break;
	}
	
	var reviewStar_idx=document.getElementById("reviewStar_idx").value;
	$.ajax({
		url : "${path}/lecture/reviewStar.do",
		type : "get",
		data : {'reviewStar_idx' : reviewStar_idx, 'num' : num},
		success : function(data){
			alert(data);
			}
		});
	//document.reviewStar.submit();
}
</script>
</head>
<body>
<div class="col-xl-8 offset-xl-2 col-lg-12 lectureListDiv">
	<ul class="upper_shift">
		<li><a href="${path}">KDEMY</a></li>
		<li><a href="#">${dto.main_category}</a></li>
		<li><a href="#">${dto.sub_category}</a></li>
	</ul>
	<div class="row">
		<div class="col-xl-8 col-lg-12 border-right border-primary">
			<div class="col-xl-12">
				<c:choose>
					<c:when test="${dto.cell_type == 1}"><h2>동영상 강의</h2></c:when>
					<c:when test="${dto.cell_type == 2}"><h2>실시간 강의</h2></c:when>
					<c:when test="${dto.cell_type == 3}"><h2>현장 강의</h2></c:when>
				</c:choose>
			</div>
			<div class="row">
			<div class="col-xl-6">
				<img src="../upload/${dto.main_img}" class="img-thumbnail col-xl-7">
			</div>
			<div class="col-xl-6">
				<h2>${dto.subject}</h2>
				<p>${dto.userid}</p>
				<p>등록일 : <fmt:formatDate value="${dto.upload_date}" pattern="yyyy-MM-dd" /></p>
				<p>☆☆☆☆☆ (0개의 수강평)</p>
			</div>
		</div>
		</div>
		<div class="col-4 mb-2 bt-2">
			<div class="col-12 mb-2 bt-2">
				<h3>${dto.price}원</h3>
			</div>

			<div class="col-12 mb-2 bt-2">
				<c:choose>
					<c:when test="${check==0}">
						<form method="post" action="${path}/cart/insertCart.do">
						<input type="hidden" name="cell_type" value="${dto.cell_type}">
						<input type="hidden" name="price" value="${dto.price}">
						<input type="hidden" name="lecture_idx" value="${dto.lecture_idx}">
						<input type="hidden" name="main_category" value="${dto.main_category}">
						<input type="hidden" name="sub_category" value="${dto.sub_category}">
						<input type="hidden" name="subject" value="${dto.subject}">
						<input class="btn btn-danger col-12" type="submit" value="구매하기">
						</form>
					</c:when>
					
					<c:when test="${check==1}">
						<form method="post" name="viewForm" id="viewForm" action="${path}/lecture/lectureView_success.do?">
							<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}"><br>
							<input class="btn btn-success col-12" type="button" value="시청하기" onclick="lectureView_success()">
						</form>
					</c:when>
					
					<c:otherwise>
						<a class="btn btn-danger btn-block" data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal"><b>구매하기</b></a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="input-group col-xl-12">
				<div class="col-xl-6"><button type="button" class="btn btn-primary btn-sm col-12">장바구니 등록</button></div>
				<div class="col-xl-6"><button type="button" class="btn btn-secondary btn-sm col-12" onclick="history.back()">뒤로</button></div>	
			</div>	
		</div>
	</div>
	<hr>
	<div class="col-12 m">
		<nav class="nav nav-pills nav-fill">
			<a class="nav-item nav-link active" href="#">Active</a>
			<a class="nav-item nav-link" href="#">Much longer nav link</a>
			<a class="nav-item nav-link" href="#">Link</a>
			<a class="nav-item nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
		</nav>
	</div>
	
	<br>
	
	<hr>
	<div class="col-12">
		<div class="col-12">
			<c:if test="${dto.cell_type > 1}">
				강의 날짜 : ${dto.lecture_date}<br>
				강의 시작시간 : ${dto.lecture_start}<br>
				강의 시간 : ${dto.lecture_time}<br>
			</c:if>
			<c:if test="${dto.cell_type > 2}">
				강의주소 : ${dto.lecture_address}<br>
				강의 상세주소 : ${dto.lecture_address2}<br>
			</c:if>
	
			내용 : ${dto.content}<br>
		</div>
		<hr>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>