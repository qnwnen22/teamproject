<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<style type="text/css">
.menu_add_div .text_cotent {
	padding: 0 !important;
}

.menu_add_div .btn-dark {
	background-color: #333 !important;
	color: white !important;
}

.menu_add_div .btn-primary {
	background-color: #333 !important;
	color: white !important;
	border-color: #333 !important;
}

.menu_add_div .color_form {
	margin-bottom: 0;
}

.menu_add_div .color_input {
	padding-right: 0;
	display: inline-block;
}

.menu_add_div .modelsize_input {
	padding-right: 0;
	display: inline-block;
}

.menu_add_div .color_padding {
	padding-right: 2%;
}

.menu_add_div .modelsize_padding {
	padding-right: 2%;
}

@media ( max-width : 800px) {
}
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
</style>
<!-- 이원혁 추가 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${path}/include/css/kakaoMap.css">
<!-- 강의 등록용 JS -->
<script src="${path}/include/js/lectureInsert.js"></script>
</head>
<body>
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12">
	<div class="col-10 mx-auto">
		<ul class="upper_shift">
			<li><a href="${path}">KDEMY</a></li>
			<li>강사 페이지</li>
			<li><a href="#" style="color:blue;">동영상 강의 등록</a></li>
		</ul>
	</div>

	<div class="row col-10 card mx-auto">
		<div class="col-12">
			<!-- input 코드 -->
			<form method="post"
				name="form1"
				id="form1"
				enctype="multipart/form-data"
				class="form-horizontal"
				action="${path}/lecture/teacher_type1_insert.do">
			<input type="hidden" id="userid" name="userid" value="${sessionScope.userid}">
			
			<div class="col-12 d-flex">
				<div class="col-6 border border-dark text-center px-0">
					<div class="col-12 mx-0 px-0 text-center">
						<h4 class="bg-dark text-white mx-0">메인 이미지를 등록해주세요.</h4>
					</div>
					
					<div class="mx-auto mt-5">
						<div class="col-12">
							<c:choose>
						 		<c:when test="${empty dto.main_img}">
				     	 			<div><img id ="profileImg" src ="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail"></div>
						 		</c:when>
							</c:choose>
						</div>
	        		</div>
	        		
	        		<div class="col-12 mt-5">
						<div class="col-12"><input type="file" name="file1" class="text-center center-block file-upload" id="input_img"></div>
		        		<div class="col-12"><b>썸네일 이미지는 220 * 150 사이즈를 권장합니다.</b></div>
	        		</div>
	        	</div>
	        	
	        	
	        	<div class="col-6" id="video_add">
					<div class="col-12 form-group">
						<label for="subject">강의 제목</label>
						<input class="form-control" id="subject" name="subject" placeholder="강의 제목을 입력해 주세요">
					</div>

					<div class="col-12 form-group">
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
					<div class="col-12 form-group">
						<label for="category">서브 카테고리 선택</label>
						<select name="sub_category" id="sub_category" class="form-control">
							<option style="color: red;" value="">-메인 카테고리를 선택해주세요-</option>
						</select>
					</div>
					
					<div class="col-12 form-group">
						<label for="price">가격(원)</label>
						<input type="number" class="form-control" id="price" name="price" value="" placeholder="가격을 입력해주세요">
					</div>
					
					<!--  -->
					<div class="col-12 form-group">
						<label for="file2"><b>판매하실 강의를 등록해주세요.</b></label><br>
						<input class="file2" type="file" name="file2" id="file2">
						<p style="color: blue; font-size: 12px;">선택한 파일을 초기화방법 = 파일 선택 → 취소</p>
					</div>
	        	</div>
			</div>
					
			<hr>
			
			<div class="form-group">
				<h4><label for="content_label">영상에 대한 설명을 입력해주세요.</label></h4>
				<textarea class="form-control text_cotent" name="content" id="content" rows="10" cols="10"></textarea>
			</div>
						
			<!-- 등록 버튼 -->
			<div class="form-group text-center">
				<input type="button" onclick="insert1()" class="btn btn-primary" value="강의 등록">
				<input type="button" class="btn btn-warning" onclick="history.back()" value="뒤로 가기">
				<a href="${path}/lecture/offline_list.do" class="btn btn-dark pull-left">목록</a>
			</div>
			
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
<!-- 부스 스트랩 4.4.1 -->
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

		$.ajax({
    	url: '${path}/lecture/uploadAjax.do',
		  enctype:'multipart/form-data',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){

		  	alert("썸네일 이미지가 변경 되었습니다.")

		  }
		})

		function checkImageType(fileName){
 			var pattern = /jpg$|gif$|png$|jpeg$/i;
 			return fileName.match(pattern);
 		}


 		function getOriginalName(fileName){
 			if(checkImageType(fileName)){
 				return;
 			}

 			var idx = fileName.indexOf("_") + 1 ;
 			return fileName.substr(idx);

 		}

 		function getImageLink(fileName){

 			if(!checkImageType(fileName)){
 				return;
 			}
 			var front = fileName.substr(0,12);
 			var end = fileName.substr(14);

 			return front + end;
 		}
}
</script>
</body>
</html>