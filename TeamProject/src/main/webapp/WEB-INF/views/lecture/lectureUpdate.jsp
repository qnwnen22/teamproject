<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<!-- 썸머 노트 -->
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>
   
<!-- 이원혁 추가 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${path}/include/css/kakaoMap.css">
<!-- 강의 등록용 JS -->
<script src="${path}/include/js/lectureInsert.js"></script>

<%@ include file="../include/fixed-topbar.jsp" %>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
	<div class="page-header col-xl-8 offset-xl-2 text-center">
		<h2>실시간강의 수정</h2>
		<h4>판매타입 : ${dto.cell_type}</h4>
	</div>

	<form method="post"
		name="form1"
		id="form1"
		enctype="multipart/form-data"
          class="form-horizontal"
          action="${path}/lecture/lectureUpdate.do">
          
		<input type="hidden" id="lecture_idx" name="lecture_idx" value="${dto.lecture_idx}">
	    <!-- 메인 카테고리 -->
	    <div class="row">
		<div class="form-group col-6">
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
		<div class="form-group col-6">
			<label for="category">서브 카테고리 선택</label>
			<select name="sub_category" id="sub_category" class="form-control">
				<option style="color: red;" value="">-메인 카테고리를 선택해주세요-</option>
			</select>
		</div>
		</div>
	    <!-- 아이디 -->
	    <div class="form-group">
			<label for="userid">강사아이디</label>
	        <input class="form-control" id="userid" name="userid" value="${sessionScope.userid}" readonly>
		</div>
	    <!-- 강의 제목 -->
	    <div class="form-group">
	    	<label for="subject">강의제목</label>
	    	<input class="form-control"	id="subject" name="subject" value="${dto.subject}">
		</div>
	    <!-- 가격 -->	
		<div class="form-group">
			<label for="price">가격(원)</label>
			<input type="number" class="form-control" id="price" name="price" value="${dto.price}">
		</div>
	    
	    <!-- 썸네일 -->
	    <div class="">
			<c:choose>
		 		<c:when test="${empty dto.main_img}">
     	 			<div><img id ="profileImg" src ="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail"></div>
		 		</c:when>
				
				<c:otherwise>
	    			<div><img id ="profileImg" src = "../upload${dto.main_img}" class="avatar img-circle"  style = "height:100px;"></div>
				</c:otherwise>
        	</c:choose>
        	
        	<input type="file" name="file1" class="text-center center-block file-upload" id="input_img">
		</div>
	
		
		<!-- 내용 -->
		<div class="form-group">
			<label for="content_label">내용</label><br>
			<textarea class="form-control text_cotent" name="content" id="content" rows="10" cols="10">${dto.content}</textarea>
		</div>
	
		<c:if test="${dto.cell_type>1}">
		<!-- 강의 시작날짜 -->
		<div class="form-group">
			<label for="lecture_date_label">강의 시작 날짜</label>
			<input class="form-control" type="date" name="lecture_date" id="lecture_date" value="${dto.lecture_date}">
		</div>
		<!-- 강의장 시작 날짜 -->
		<div class="form-group">
			<label for="lecture_start">강의 시작 시간</label>
			<input type="time" class="form-control"	name="lecture_start" id="lecture_start" value="${dto.lecture_start}">
		</div>
		<!-- 강의 시간 -->
		<div class="form-group">
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
		</c:if>
		
		<c:if test="${dto.cell_type>2}">
			<hr>
			<h3>강의장 주소</h3>
			<%@ include file="kakaoMap.jsp" %>
			<div class="form-group">
				<label for="lecture_road_address">도로명 주소</label>
				<input type="text" class="form-control" name="lecture_address" id="lecture_address" value="${dto.lecture_address}">
			</div>
			<!-- 강의장 상세 주소 -->
			<div class="form-group">
				<label for="lecture_address2">상세 주소</label>
				<input type="text" class="form-control" name="lecture_address2" id="lecture_address2" value="${dto.lecture_address2}">
			</div>
			
		</c:if>
	      
		<!-- 등록 버튼 -->
		<div class="form-group text-center">
			<input type="button" onclick="update()" class="btn btn-primary" value="강의 등록">
			<input type="button" class="btn btn-warning" onclick="history.back()" value="뒤로 가기">
			<a href="${path}/lecture/offline_list.do" class="btn btn-dark pull-left">목록</a>
		</div>
	</form>
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

		$.ajax({
    	url: '${path}/lecture/uploadAjax.do',
    	  enctype:'multipart/form-data',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){

			alert("프로필 이미지가 변경 되었습니다.")

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