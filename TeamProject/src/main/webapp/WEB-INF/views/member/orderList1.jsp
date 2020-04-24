<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %> 
  <title>구매목록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
.lecture:hover {
  background-color: #edeff2;
}

.lecture:active {
  background-color: #eeeeee;
  }

</style>
</head>
<body>
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12">
	<div class="col-xl-12 col-lg-12">
		<div class="col-12 d-flex mb-3">
			<div class="col-xl-12 m-2 h-auto d-inline-block">
  				<c:forEach var="dto" items="${list2}">
					<div class="row lecture" style="border-radius:10px;">
						<div class="col-sm-4">
							<a href="${path}/lecture/lecture_list_view.do?lecture_idx=${dto.lecture_idx}">
			    				<img style="max-width: 350px; max-height: 197px;" src="${path}/lecture/displayFile?fileName=${dto.main_img}" class="img-fluid lectureImg">
		    				</a>
		    			</div>

						<div class="col-sm-7">
							<div class="short-div m-3 h2"><strong>${dto.subject}</strong></div>
							<div class="short-div">학생 수 : ${dto.cellCount}</div>
							<div class="short-div">추천 수 : ${dto.upCount}</div>
							<div class="short-div">${dto.userid}</div>
							<div class="short-div">&nbsp;&nbsp;<span>${dto.buy_date}</span></div>
						</div>
						
						<div class="col-sm-1">
							<c:choose>
								<c:when test="${dto.up =='up'}">
								 	<form method="post" id="lectureDownForm${dto.lecture_idx}" name="lectureDownForm${dto.lecture_idx}"
									 action="${path}/lecture/lectureDown2.do?lecture_idx=${dto.lecture_idx}">
										<button type="submit" class="btn btn-primary btn-sm col-12">
											<i class="fas fa-check">&nbsp;&nbsp;추천</i>
										</button>
									</form>
								</c:when>
								
								<c:when test="${dto.up =='down'}">
									<form method="post" id="lectureUpForm${dto.lecture_idx}" name="lectureUpForm${dto.lecture_idx}"
									 action="${path}/lecture/lectureUp2.do?lecture_idx=${dto.lecture_idx}">
										<button type="submit" class="btn btn-outline-primary btn-sm col-12">
											<i class="fas fa-thumbs-up">&nbsp;&nbsp;추천</i>
										</button>
									</form>
								</c:when>
								
								<c:otherwise>
									버그
								</c:otherwise>
							</c:choose>
						</div>
			
					</div>
        			</c:forEach>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function click(page) {location.href = "${path}/lecture/all_list.do?curPage="+page;}
</script>
</body>
	<%@ include file="../member/footer1.jsp"%> 
</html>