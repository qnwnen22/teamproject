<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/css/lecture.css">
<%@ include file="../include/fixed-topbar.jsp" %>
<script type="text/javascript">
function lectureDelete(){
}
function lectureView_success(){
	document.viewForm.submit();
}
$('#star1 a').click(function(){
	$(this).parent().children("a").removeClass("on"); 
	$(this).addClass("on").prevAll("a").addClass("on"); 
	console.log($(this).attr("value"));
});
</script>
</head>
<body>
<div class="row col-xl-8 offset-xl-2 col-lg-12 mb-3">
	<div class="col-8">
		<div class="col-12">
			<div class="col-xl-12">
				<c:choose>
					<c:when test="${dto.cell_type == 1}"><h2>동영상 강의</h2></c:when>
					<c:when test="${dto.cell_type == 2}"><h2>실시간 강의</h2></c:when>
					<c:when test="${dto.cell_type == 3}"><h2>현장 강의</h2></c:when>
				</c:choose>
			</div>
			
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><a href="#">${dto.main_category}</a></li>
				<li><a href="#">${dto.sub_category}</a>
				<c:if test="${sessionScope.admin_id != null}">
				&nbsp;<span class="btn btn-outline-danger" data-toggle="modal" data-target="#lectureDelete">삭제</span>
				</c:if>
				</li>
			</ul>
		</div>
		
		<div class="row col-xl-12" style="background-color: #eeeeee; color: black;">
		<!-- shadow p-3 mb-5 rounded --> 
			<div class="col-xl-12 col-lg-12">
				<div class="col-12 d-flex mb-3">
					<div class="col-xl-5 m-2 h-auto d-inline-block ">
						<img class="img-fluid lectureImg" src="../upload/${dto.main_img}">
					</div>
					
					<div class="col-xl-7 m-2 px-0 h-auto d-inline-block " style="background-color: white;">
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
						<div class="col-12 mt-3 h1">
							<b>${dto.subject}</b>
						</div>
						
						<div class="col-12 d-flex flex-row mx-0 px-0 h6">
							<div class="col-6">
								<b class='m-auto'><fmt:formatNumber value="${lectureCount}" pattern="#,###" />명의 학생이 수강중</b>
							</div>
							
							<div class="col-6">
								<b class='m-auto'>추천 수 : ${upCount}</b>	
							</div>
						</div>
					</div>
				</div>
			</div>
				
			<div class="col-12">
				<ul class="nav nav-tabs">
		  			<li class="nav-item">
		    			<a class="nav-link active" onclick="lecturetext()" data-toggle="tab" href="#">강의 소개</a>
		  			</li>
		  			
		  			<li class="nav-item">
		    			<a class="nav-link" onclick="lecturetime()" data-toggle="tab" href="#">강의 시간</a>
		  			</li>
		  			
		  			<li class="nav-item">
		    			<a class="nav-link" onclick="lectureaddr()" data-toggle="tab" href="#">강의 장소</a>
		  			</li>
				</ul>
			</div>
				
			<div class="col-12 shadow p-3 mb-5 bg-white rounded" id="lectureText">
				<p class="col-12">
					${dto.content}
					<% for( int i=0; i<=100; i++){ %>
						<p>dasd<p>
					<%} %>
				</p>
			</div>
				
			<div class="col-12 shadow p-3 mb-5 bg-white rounded" id="lectureTime" style="display: none;">
				<c:choose>
					<c:when test="${dto.cell_type > 1}">
						<div class="col-12">
							<label class="label" for="lectureDate">강의 날짜 : </label>
							<p name="lectureDate" id="lectureDate">${dto.lecture_date}</p>
							
							강의 시작시간 : ${dto.lecture_start}
							강의 시간 : ${dto.lecture_time}
						</div>
					</c:when>
				
					<c:otherwise>
						<h2>동영상 강의 입니다.</h2>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="col-12 shadow p-3 mb-5 bg-white rounded" id="lectureAddr" style="display: none;">
				<c:choose>
					<c:when test="${dto.cell_type > 2}">
						강의주소 : ${dto.lecture_address}<br>
						강의 상세주소 : ${dto.lecture_address2}<br>
					</c:when>
					<c:otherwise>
						<h2>내용이 없습니다</h2>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	<div class="col-4 my-2" id="asideDiv">
		<div class="col-12 m-2 p-2" style="background-color: #eeeeee">
			<div class="col-12" style="background-color: white;">
				<h3>구매가격 : </h3>
				<h4>${dto.price} 원</h4>
			</div>
	
			<div class="col-12 mb-2 bt-2 px-0">
				<div class="col-xl-12 px-0 mx-0" >
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
						<a class="btn btn-danger btn-block" data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal" style="color: white;"><b>구매하기</b></a>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="input-group col-xl-12">
				<c:choose>
					<c:when test="${check==1}">
						<div class="col-xl-12">
							<c:choose>
								<c:when test="${up == 'up'}">
									<form method="post" id="lectureDownForm" name="lectureDownForm"
									 action="${path}/lecture/lectureDown.do?lecture_idx=${dto.lecture_idx}">
										<button type="button" class="btn btn-primary btn-sm col-12" onclick="down()" >
											<i class="fas fa-check">&nbsp;&nbsp;추천</i>
										</button>
									</form>
								</c:when>
								<c:when test="${up == 'down'}">
									<form method="post" id="lectureUpForm" name="lectureUpForm"
									 action="${path}/lecture/lectureUp.do?lecture_idx=${dto.lecture_idx}">
										<button type="button" class="btn btn-outline-primary btn-sm col-12" onclick="up()">
											<i class="fas fa-thumbs-up">&nbsp;&nbsp;추천</i>
										</button>
									</form>
								</c:when>
							</c:choose>
						</div>
					</c:when>
					
					<c:when test="${check==0}">
						<div class="col-xl-12">
						<c:choose>
							<c:when test="${sessionScope.userid != null}">
								<form method="post" id="cartInsert" name="cartInsert" action="${path}/cart/insertCart2.do">
									<input type="hidden" name="cell_type" value="${dto.cell_type}">
									<input type="hidden" name="price" value="${dto.price}">
									<input type="hidden" name="lecture_idx" value="${dto.lecture_idx}">
									<input type="hidden" name="main_category" value="${dto.main_category}">
									<input type="hidden" name="sub_category" value="${dto.sub_category}">
									<input type="hidden" name="subject" value="${dto.subject}">
									<button type="button" class="btn btn-secondary btn-sm col-12" onclick="cartAdd()">장바구니 담기</button>
								</form>
							</c:when>
			
							<c:otherwise>
								<button type="button" class="btn btn-secondary btn-sm col-12" data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal">장바구니 담기</button>
							</c:otherwise>
						</c:choose>	
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		
		<div class="col-12 m-2 p-2" style="background-color: #eeeeee">
			<div class="col-12" style="background-color: white;">
				<div class="col-12">
					<img class="img-fluid" alt="광고" src="../upload/test/광고.png">
				</div>
			</div>
		</div>
	</div>
	
	
</div>
<!-- logOut Modal -->
<div class="modal" id="lectureDelete">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">강의삭제</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <h6>해당 강의를 정말 삭제하시겠습니까?</h6>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <a href="${path}/lecture/lectureDelete.do?lecture_idx=${dto.lecture_idx}" type="button" class="btn btn-outline-danger">삭제</a>
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp"%>
<script type="text/javascript">
	function lecturetext(){
		var text = document.getElementById("lectureText");
		var time = document.getElementById("lectureTime");
		var addr = document.getElementById("lectureAddr");
		
		text.style.display ='block';
		time.style.display ='none';
		addr.style.display ='none';
	}
	
	function lecturetime(){
		var text = document.getElementById("lectureText");
		var time = document.getElementById("lectureTime");
		var addr = document.getElementById("lectureAddr");
		
		text.style.display ='none';
		time.style.display ='block';
		addr.style.display ='none';
	}
	
	function lectureaddr(){
		var text = document.getElementById("lectureText");
		var time = document.getElementById("lectureTime");
		var addr = document.getElementById("lectureAddr");
		
		text.style.display ='none';
		time.style.display ='none';
		addr.style.display ='block';
	}

	function up(){
		alert("감사합니다 :b");
		document.lectureUpForm.submit();
		/* location.reload(); */
	}

	function down(){
		document.lectureDownForm.submit();
	}
	function cartAdd(){
		alert("장바구니에 등록 되었습니다.");
		document.cartInsert.submit();
	}
</script>
</body>
</html>