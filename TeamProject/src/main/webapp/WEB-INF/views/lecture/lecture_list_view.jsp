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
<div class="container-xl lectureListDiv">
	<ul class="upper_shift">
		<li><a href="${path}">KDEMY</a></li>
		<li><a href="#">${dto.main_category}</a></li>
		<li><a href="#">${dto.sub_category}</a></li>
	</ul>
	<div class="row row-cols-2 border border-primary">
		<div class="col-8 row  border-right border-primary">
			<div class="col-12">
				<c:choose>
					<c:when test="${dto.cell_type == 1}"><h2>동영상 강의</h2></c:when>
					<c:when test="${dto.cell_type == 2}"><h2>실시간 강의</h2></c:when>
					<c:when test="${dto.cell_type == 3}"><h2>현장 강의</h2></c:when>
				</c:choose>
			</div>
			<div class="col-6 border border-primary">
				<img style="width: 200px; height: 200px;" src="../upload/${dto.main_img}">
			</div>
			<div class="col-6">
				<h2>${dto.subject}</h2>
				<p>${dto.userid}</p>
				<p>☆☆☆☆☆ (0개의 수강평)</p>
			</div>
		</div>
		<div class="col-4">
			<div class="col-12">
				<h3>${dto.price}원</h3>
			</div>
			
			<div class="col-12">
			<c:choose>
				<c:when test="${check==0}">
					<form method="post" action="${path}/cart/insertCart.do">
					<input type="hidden" name="cell_type" value="${dto.cell_type}">
					<input type="hidden" name="price" value="${dto.price}">
					<input type="hidden" name="lecture_idx" value="${dto.lecture_idx}">
					<input type="hidden" name="main_category" value="${dto.main_category}">
					<input type="hidden" name="sub_category" value="${dto.sub_category}">
					<input type="hidden" name="subject" value="${dto.subject}">
					
					<input class="btn btn-dark" type="submit" value="구매하기">
					<%-- <a href="${path}/cart/cartPage.do">구입하기</a><br> --%>
					</form>
				</c:when>
				
				<c:when test="${check==1}">
					<form method="post" name="viewForm" id="viewForm" action="${path}/lecture/lectureView_success.do?">
						<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}"><br>
						<input class="btn btn-primary" type="button" value="시청하기" onclick="lectureView_success()">
					</form>
				</c:when>
				
				<c:otherwise>
					<a class="plain cursor btn btn-dark" data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal"><b>구매하기</b></a>
				</c:otherwise>
			</c:choose>
			<a href="#" class="btn btn-primary">장바구니 등록</a>
			</div>
		</div>

		<div class="col-6">
			
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
	<h2>강의 설명</h2>
	<div>
		인덱스 번호 : ${dto.lecture_idx}<br>
		판매타입 : ${dto.cell_type}<br>
		메인 카테고리 : ${dto.main_category}<br>
		서브 카테고리 : ${dto.sub_category}<br>
		유저아이디 : ${dto.userid}<br>
		제목 : ${dto.subject}<br>
		썸네일 : <img width="300px" height="100px" src="../upload/${dto.main_img}"><br>
		
		<c:if test="${dto.cell_type != 3}">
		비디오 파일 : ${dto.videofile}<br> 
		<video controls="controls" width="100%" preload="metadata">
			<source src="../upload${dto.videofile}" type="video/mp4">
		</video><br>
		</c:if> 
		내용 : ${dto.content}<br>
		업로드 날짜 : ${dto.upload_date}<br>
		가격 : ${dto.price}<br>
		강의 날짜 : ${dto.lecture_date}<br>
		강의 시작시간 : ${dto.lecture_start}<br>
		강의 시간 : ${dto.lecture_time}<br>
		강의주소 : ${dto.lecture_address}<br>
		강의 상세주소 : ${dto.lecture_address2}<br>
		<hr>
		<input type="button" value="뒤로" onclick="history.back()">
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>