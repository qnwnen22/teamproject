<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 강의 등록</title>
<!-- 헤더 제거 -->
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
<!-- 썸머 노트 -->
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>

<!-- 강의 등록용 JS -->
<script src="${path}/include/js/lectureInsert.js"></script>
</head>
<body>
<div class="container col-12 col-xl-8 mx-auto">
   	<div class="col-12 mx-auto">
		<ul class="upper_shift">
			<li><a href="${path}">KDEMY</a></li>
			<li>강사 페이지</li>
			<li><a href="#" style="color:blue;">실시간 강의 등록</a></li>
		</ul>
	</div>
   	
	<div class="col-12">
		<form method="post"
			name="form1"
			id="form1"
			enctype="multipart/form-data"
            class="form-horizontal"
            action="${path}/lecture/teacher_type2_insert.do">
          	<input type="hidden" id="userid" name="userid" value="${sessionScope.userid}">
    <!-- 메인 카테고리 -->
	
		<div class="col-12 d-block d-lg-flex">
			<div class="col-12 col-lg-5 card p-0 m-0 mb-2 text-center">
				<div class="card-header">
					<h5 class="card-title">메인 이미지를 등록해주세요.</h5>
				</div>
				
				<div class="card-body">
					<c:choose>
				 		<c:when test="${empty dto.main_img}">
		     	 			<img id ="profileImg" src ="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="img-flid avatar img-circle img-thumbnail" style="max-height: 250px">
				 		</c:when>
					</c:choose>
        		</div>
	       		
	       		<div class="card-footer">
					<div class="col-12"><input type="file" name="file1" class="text-center center-block file-upload" id="input_img"></div>
        		</div>
	       	</div>
       	
	       	<div class="col-12 col-lg-7 p-0 m-0" id="video_add">
				<div class="col-12 form-group mx-0 px-0 px-lg-3">
					<label for="subject">강의 제목</label>
					<input class="form-control" id="subject" name="subject" placeholder="강의 제목을 입력해 주세요">
				</div>
	
				<div class="col-12 form-group mx-0 px-0 px-lg-3">
					<label for="category">메인 카테고리 선택</label>
					<select name="main_category" id="main_category" class="form-control"
					onChange="category()">
						<option selected value="">-메인메뉴-</option>
						<option value="디자인">디자인</option>
						<option value="IT,프로그래밍">IT,프로그래밍</option>
						<option value="콘텐츠 제작">콘텐츠 제작</option>
						<option value="마케팅">마케팅</option>
						<option value="번역,통역">번역,통역</option>
						<option value="문서,취업">문서,취업</option>
						<option value="비즈니스컨설팅">비즈니스컨설팅</option>
						<option value="운세,상담">운세,상담</option>
						<option value="레슨,실무교육">레슨,실무교육</option>
						<option value="주문제작">주문제작</option>
						<option value="간판,인쇄">간판,인쇄</option>
					</select>
				</div>
					
				<!-- 서브 카테고리 -->
				<div class="col-12 form-group mx-0 px-0 px-lg-3">
					<label for="category">서브 카테고리 선택</label>
					<select name="sub_category" id="sub_category" class="form-control">
						<option style="color: red;" value="">-메인 카테고리를 선택해주세요-</option>
					</select>
				</div>
				
				<div class="col-12 form-group mx-0 px-0 px-lg-3">
					<label for="price">가격(원)</label>
					<input type="number" class="form-control" id="price" name="price" value="" placeholder="가격을 입력해주세요">
				</div>
				
				<!--  -->
				<div class="col-12 form-group mx-0 px-0 px-lg-3">
					<label for="file2"><b>판매하실 강의를 등록해주세요.</b></label><br>
					<input class="file2" type="file" name="file2" id="file2">
					<p style="color: blue; font-size: 12px;">선택한 파일을 초기화방법 = 파일 선택 → 취소</p>
				</div>
	       	</div>
       	
		</div>
		<hr>
		
		<div class="col-12">
			<div class="form-group">
				<h4><label for="content_label">영상에 대한 설명을 입력해주세요.</label></h4>
				<textarea class="form-control text_cotent" name="content" id="content" rows="10" cols="10"></textarea>
			</div>
		
			<!-- 강의 시작날짜 -->
			<div class="d-block d-md-flex mx-0 px-0">
				<div class="col-12 col-md-4 form-group mx-0 px-0">
					<label for="lecture_date_label">강의 시작 날짜</label>
					<input class="form-control" type="date" name="lecture_date" id="lecture_date">	
				</div>
				
				<div class="col-12 col-md-4 form-group mx-0 px-0 px-md-3">
					<label for="lecture_start">강의 시작 시간</label>
					<input type="time" class="form-control"	name="lecture_start" id="lecture_start">
				</div>
				
				<div class="col-12 col-md-4 form-group mx-0 px-0 ">
					<label for="lecture_time">강의 시간</label>
					<select class="form-control" name="lecture_time" id="lecture_time">
						<option value="1">1시간</option>
						<option value="2">2시간</option>
						<option value="3">3시간</option>
						<option value="4">4시간</option>
						<option value="5">5시간</option>
						<option value="6">6시간</option>
					</select>
				</div>
			</div>
						      
			<!-- 등록 버튼 -->
			<div class="form-group text-center">
				<input type="button" onclick="insert2()" class="btn btn-primary" value="강의 등록">
				<input type="button" class="btn btn-warning" onclick="history.back()" value="뒤로 가기">
				<a href="${path}/lecture/offline_list.do" class="btn btn-dark pull-left">목록</a>
			</div>
		</div>
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>

$(document).ready(function(){
	$("#profileImg").click(function(){
		$("#input_img").click() ;
		})			
	}) 

var sel_file;

$(document).ready(function() {
    $("#input_img").on("change", fileChange);
});


function fileChange(e) {
	e.preventDefault();

	var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $(".avatar").attr("src", e.target.result);
        	$(".avatar").css("height", "200px")
        }
        reader.readAsDataURL(f);
    });

    var file = files[0]
    console.log(file)
    var formData = new FormData();

    formData.append("file", file);

}

</script>
</body>
</html>