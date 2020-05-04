<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kdemy 강의</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="${path}/include/css/lecture.css">
<%@ include file="../include/fixed-topbar.jsp" %>
<script type="text/javascript">
function lectureView_video(){
	document.viewVideoForm.submit();
}
function lectureView_success(){
	document.viewForm.submit();
}
function lectureView_offline(){
	document.viewoffForm.submit();
}
$('#star1 a').click(function(){
	$(this).parent().children("a").removeClass("on"); 
	$(this).addClass("on").prevAll("a").addClass("on"); 
	console.log($(this).attr("value"));
});
</script>
</head>
<body>
<div class="row">
	<div class="col-12 col-xl-8 mx-auto">
		<div class="col-12">
			<div class="col-12">
				<ul class="upper_shift">
					<li><a href="${path}">KDEMY</a></li>
					<li><a href="#">
						<c:choose>
							<c:when test="${dto.cell_type == 1}">동영상 강의</c:when>
							<c:when test="${dto.cell_type == 2}">실시간 강의</c:when>
							<c:when test="${dto.cell_type == 3}">현장 강의</c:when>
						</c:choose>
						</a>
					</li>
					<li><a href="#">${dto.main_category}</a></li>
					<li><a style="color: blue" href="#">${dto.sub_category}</a>
						<c:if test="${sessionScope.admin_id != null}">
							&nbsp;<span class="btn btn-outline-danger" data-toggle="modal" data-target="#lectureDelete">삭제</span>
						</c:if>
					</li>
				</ul>
			</div>
		
			<div class="col-12 d-block d-md-flex">
				<div class="pr-1 col-md-6 col-sm-12 text-center">
					<img class="img-fluid" src="${path}/lecture/displayFile?fileName=${dto.main_img}" style="height: 300px;">
				</div>
				 
				<div class="card col-md-6 col-sm-12 shadow" style="border-radius:5px; border: 1px solid gray;">
					<div class="card-body">
						<c:choose>
							<c:when test="${dto.cell_type==1}">
								<div class="col-12 mx-0 p-0 text-center" style="background-color: #804000; border-radius:5px;">
									<b style="color: white;">동영상 강의</b>
								</div>
							</c:when>
							
							<c:when test="${dto.cell_type==2}">
								<div class="col-12 mx-0 p-0 text-center" style="background-color: #339933; border-radius:5px;">							
									<b style="color: white">실시간 강의</b>
								</div>
							</c:when>	
							
							<c:when test="${dto.cell_type==3}">
								<div class="col-12 mx-0 p-0 text-center" style="background-color: #3366cc; border-radius:5px;">
									<b style="color: white">현장 강의</b>
								</div>
							</c:when>
						</c:choose>
					</div>
					
					<div class="card-body">
						<h2 class="card-title">${dto.subject}</h2>
						
						<p class="card-text">
							<b class='m-auto'><fmt:formatNumber value="${lectureCount}" pattern="#,###" />명의 학생이 수강중</b><br>
							<b class='m-auto'>추천 수 : ${upCount}</b>
						</p>	
					</div>

					<div class="card-body m-0 p-1">
						<div class="col-12" style="background-color: white; text-align:right;">
							<h5 style="color:gray"><span style="color:#d90f74">￦ ${dto.price}</span></h5>
						</div>

						<div class="col-12 d-block d-lg-flex mx-0 px-0 h6">
							<div class="col-12 col-lg-6 px-0 mr-1" > 
								<c:choose>
									<c:when test="${check==1}">
										<c:choose>
											<c:when test="${up == 'up'}">
												<form method="post" id="lectureDownForm" name="lectureDownForm"
												 action="${path}/lecture/lectureDown.do?lecture_idx=${dto.lecture_idx}">
													<button type="button" class="btn btn-outline-primary col-12" onclick="down()" >
														<i class="fas fa-thumbs-up">&nbsp;&nbsp;추천</i>
													</button>
												</form>
											</c:when>
											
											<c:when test="${up == 'down'}">
												<form method="post" id="lectureUpForm" name="lectureUpForm"
												 action="${path}/lecture/lectureUp.do?lecture_idx=${dto.lecture_idx}">
													<button type="button" class="btn btn-outline-primary col-12" onclick="up()">
														<i class="fas fa-thumbs-up">&nbsp;&nbsp;추천</i>
													</button>
												</form>
											</c:when>
										</c:choose>
									</c:when>
					
									<c:when test="${check==0}">
										<c:choose>
											<c:when test="${sessionScope.userid != null}">
												<form method="post" id="cartInsert" name="cartInsert" action="${path}/cart/insertCart2.do">
													<input type="hidden" name="main_img" value="${dto.main_img}">
													<input type="hidden" name="cell_type" value="${dto.cell_type}">
													<input type="hidden" name="price" value="${dto.price}">
													<input type="hidden" name="lecture_idx" value="${dto.lecture_idx}">
													<input type="hidden" name="main_category" value="${dto.main_category}">
													<input type="hidden" name="sub_category" value="${dto.sub_category}">
													<input type="hidden" name="subject" value="${dto.subject}">
													<button type="button" class="btn btn-secondary col-12" onclick="cartAdd()">장바구니 담기</button>
												</form>
											</c:when>
							
											<c:otherwise>
												<button type="button" class="btn btn-secondary col-12" data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal">장바구니 담기</button>
											</c:otherwise>
										</c:choose>		
									</c:when>
									
									<c:when test="${check==2}">
										<input class="btn btn-dark col-12 " type="button" value="본인 강의 입니다." disabled>
									</c:when>
									
									<c:otherwise>
									
									</c:otherwise>
								</c:choose>
							</div>
			
							<div class="col-12 col-lg-6 px-0 mx-0" >
								<c:choose>
									<c:when test="${check==0}">
										<c:choose>	
											<c:when test="${sessionScope.packages_end != null && dto.cell_type=='1' }">
							                     <form method="post" name="viewVideoForm" id="viewVideoForm" action="${path}/lecture/lectureView_video.do">
							                        <input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}">
							                        <input class="btn btn-dark col-12" type="button" value="시청하기" onclick="lectureView_video()">
							                     </form>
											</c:when>
											
											<c:otherwise>
												<form method="post" action="${path}/cart/insertCart.do">
													<input type="hidden" name="main_img" value="${dto.main_img}">
													<input type="hidden" name="cell_type" value="${dto.cell_type}">
													<input type="hidden" name="price" value="${dto.price}">
													<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}">
													<input type="hidden" name="main_category" value="${dto.main_category}">
													<input type="hidden" name="sub_category" value="${dto.sub_category}">
													<input type="hidden" name="subject" value="${dto.subject}">
													<input type="hidden" name="userid" id="userid" value="${dto.userid}">
													<input class="btn btn-danger col-12" type="submit" value="구매하기">
												</form>
											</c:otherwise>
										</c:choose>
									</c:when>
									
									<c:when test="${check==1}">
										<c:choose>
											<c:when test="${dto.cell_type == '3'}">
												<form method="post" name="viewoffForm" id="viewoffForm" action="${path}/lecture/lectureView_offline.do">
													<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}">
													<input class="btn btn-dark col-12" type="submit" value="장소확인" onclick="lectureView_offline()">
												</form>
											</c:when>
											
											<c:when test="${dto.cell_type == '1'}">
												<form method="post" name="viewVideoForm" id="viewVideoForm" action="${path}/lecture/lectureView_video.do">
													<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}">
													<input class="btn btn-dark col-12" type="button" value="시청하기" onclick="lectureView_video()">
												</form>
											</c:when>
											
											<c:otherwise>
												<c:choose>
													<c:when test="${openTime > todayTime || endTime < todayTime}">
														<input class="btn btn-dark col-12 " type="button" value="시청가능한 시간이 아닙니다." disabled>
													</c:when>
													
													<c:otherwise>
														<form method="post" name="viewForm" id="viewForm" action="${path}/lecture/lectureView_success.do">
															<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}">
															<input class="btn btn-dark col-12" type="button" value="시청하기" onclick="lectureView_success()">
														</form>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
						            </c:when>
								            
									<c:when test="${check==2}">
										<c:choose>
											<c:when test="${dto.cell_type == '3'}">
												<form method="post" name="viewoffForm" id="viewoffForm" action="${path}/lecture/lectureView_offline.do">
													<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}">
													<input class="btn btn-dark col-12" type="button" value="장소확인" onclick="lectureView_offline()">
												</form>
											</c:when>
										
											<c:when test="${dto.cell_type == '1'}">
												<form method="post" name="viewVideoForm" id="viewVideoForm" action="${path}/lecture/lectureView_video.do">
													<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}">
													<input class="btn btn-dark col-12" type="button" value="내 영상 시청하기" onclick="lectureView_video()">
												</form>
											</c:when>
										
											<c:otherwise>
												<form method="post" name="viewForm" id="viewForm" action="${path}/lecture/lectureView_success.do">
													<input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}">
													<input class="btn btn-dark col-12" type="button" value="강의하기" onclick="lectureView_success()">
												</form>
											</c:otherwise>
										</c:choose>
									</c:when>
																		
									<c:otherwise>
										<a class="btn btn-danger btn-block" data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal" style="color: white;"><b>구매하기</b></a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	
	<div class="row">
			<div class="col-sm-12 col-xs-12">
				<ul class="nav nav-tabs">
		  			<li class="nav-item">
		    			<a class="nav-link active" onclick="lecturetext()" data-toggle="tab" href="#">강의 소개</a>
		  			</li>
		  			
		  			<li class="nav-item">
		    			<a class="nav-link" onclick="lecturetime()" data-toggle="tab" href="#">강의 시간</a>
		  			</li>
				</ul>
			</div>
				
			<div class="col-12 shadow p-3 mb-5 bg-white rounded" id="lectureText">
				<p class="col-12">
					${dto.content}
				</p>
			</div>
				
			<div class="col-12 shadow p-3 mb-5 bg-white rounded" id="lectureTime" style="display: none;">
				<c:choose>
					<c:when test="${dto.cell_type > 1}">
						<div class="col-12">
							<label class="label" for="lectureDate">강의 날짜 : </label>
							<p name="lectureDate" id="lectureDate">${dto.lecture_date}</p>
							
							<b>강의 시작 시간 : ${dto.lecture_start}</b><br>
							
							<b>총 강의 시간 : ${dto.lecture_time}시간</b>
						</div>
					</c:when>
				
					<c:otherwise>
						<h2>동영상 강의 입니다.</h2>
					</c:otherwise>
				</c:choose>
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
      <input type="hidden" name="lecture_idx" id="lecture_idx" value="${dto.lecture_idx}">
      <input type="hidden" name="userid" id="userid" value="${dto.userid}">
      <a href="#" onclick="lectureDelete()" type="button" class="btn btn-outline-danger">삭제</a>
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<%@ include file="../include/footer.jsp"%>
<script type="text/javascript">

function lectureDelete() {
	if (socket.readyState !== 1)
		return;
	let amdin = 'admin';
	let target = $('input#userid').val();
	let lecture_idx = $('input#lecture_idx').val();
	// websocket에 보내기!! (reply,댓글작성자,게시글작성자,글번호)
	socket.send("lectureDelete," + amdin + "," + target +","+lecture_idx);
	
	location.href="${path}/lecture/lectureDelete.do?lecture_idx=${dto.lecture_idx}";
}


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