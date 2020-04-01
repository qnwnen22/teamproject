<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 제거 -->
<%@ include file="../include/header.jsp" %>
<!-- 추가 -->
<%-- <script src="${path}/include/jquery-3.4.1.min.js"></script> --%>

<!--  -->
<%@ include file="../include/fixed-topbar.jsp" %>
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
   rel="stylesheet">
<script src="${path}/include/js/common.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>

<script>
$(function(){
	$('#content').summernote({
	     height: 300,                 // 에디터 높이
	     minHeight: null,             // 최소 높이
	     maxHeight: null,             // 최대 높이
	     focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	     lang: "ko-KR",               // 한글 설정
	     placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
	});

	function select_main(){
		var main_category=document.getElementById("main_category");
		var sub1=document.getElementById("sub1");
		switch(main_category.value){
		case 'main1':
			

		}
		

	}
	
});
</script>
<script type="text/javascript">
function insert2(){

	var main_category=document.getElementById("main_category");
	var sub_category=document.getElementById("sub_category");
	var userid=document.getElementById("userid");
	var subject=document.getElementById("subject");
	var price=document.getElementById("price");
	var file1=document.getElementById("file1");
	var file2=document.getElementById("file2");
	var content=document.getElementById("content");
	var lecture_date=document.getElementById("lecture_date");
	var lecture_start=document.getElementById("lecture_start");
	var lecture_time=document.getElementById("lecture_time");

	if(main_category.value==""){
		alert("메인 카테고리를 선택해 주세요.");
		main_category.focus();
		return false;
	}
	alert("test중");
}


</script>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
   <div class="page-header col-xl-8 offset-xl-2 text-center">
      <h2>실시간 강의 등록 페이지</h2>
   </div>
   
   <!-- input 코드 -->
   <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 offset-xl-2 offset-lg-2 joinForm" style="padding-left: 10px; padding-right: 10px;">
      <form method="post"
            enctype="multipart/form-data"
            class="form-horizontal"
            action="${path}/lecture/teacher_type2_insert.do">
      <!-- 메인 카테고리 -->
      <div class="form-group">
         <label for="category">카테고리1</label>
          <select name="main_category" id="main_category" class="form-control" onchange="select_main()">
            <option selected value="">-메인메뉴-</option>
            <option value="main1">main1</option>
            <option value="main2">main2</option>
            <option value="main3">main3</option>
            <option value="main4">main4</option>
            <option value="main5">main5</option>
         </select>
      </div>
      <!-- 서브 카테고리 -->
      <div class="form-group">
         <label for="category">카테고리2</label>
            <select name="sub_category" id="sub_category" class="form-control">
            	<option selected value="test">-서브메뉴-</option>
            	<option value="" id="sub1"></option>
            	<option value="" id="sub2"></option>
            	
         </select>
      </div>
      <!-- 아이디 -->
      <div class="form-group">
         <label for="userid">강사아이디</label>
         <input class="form-control" id="userid" name="userid" placeholder="상품명 입력해 주세요">
      </div>
      <!-- 강의 제목 -->
      <div class="form-group">
         <label for="subject">강의제목</label> <input class="form-control"
            id="subject" name="subject" placeholder="상품명 입력해 주세요">
            </div>
      <!-- 가격 -->   
      <div class="form-group">
         <label for="price">가격</label>
         <input class="form-control" id="price" name="price" value="" placeholder="가격을 입력해주세요">
      </div>
      <!-- 썸네일 -->
      <div class="form-group" id="photo_add">
         <label for="file1">사진파일 (맨위에 파일은 메인사진입니다. 사진추가가 필요시 추가버튼을 이용해주세요.)</label>
         <input class="file1" type="file" name="file1" id="file1">
      </div>
      <!-- 동영상 업로드 -->
      <div class="form-group" id="video_add">
         <input type="hidden" name="count" value="0">
         <label for="file2">동영상파일 (맨위에 파일은 메인사진입니다. 사진추가가 필요시 추가버튼을 이용해주세요.)</label>
         <input class="file2" type="file" name="file2" id="file2">
      </div>
      
      <!-- 내용 -->
      <div class="form-group">
         <label for="content_label">내용</label><br>
         <textarea class="form-control text_cotent" name="content"
         id="content" rows="10" cols="10"></textarea>
         </div>
      
      
      <!-- 강의 시작날짜 -->
      <div class="form-group">
         <label for="lecture_date_label">강의 시작 날짜</label>
         <input type="date" name="lecture_date">
      </div>
      <!-- 강의장 시작 날짜 -->
      <div class="form-group">
         <label for="lecture_start">강의 시작 시간</label>
         <input type="text" class="form-control"   name="lecture_start" id="lecture_start">
      </div>
      <!-- 강의 시간 -->
      <div class="form-group">
         <label for="lecture_time">강의 시간</label>
         <input type="text" class="form-control" name="lecture_time" id="lecture_time">
      </div>
      
      <!-- 등록 버튼 -->
      <div class="form-group text-center">
         <input type="button" onclick="insert2()" class="btn btn-primary" value="강의 등록">
         
         <button type="submit" id="btnSave" class="btn btn-primary">등록</button>
         
         <a type="submit" href="#" class="btn btn-warning"> 취소 </a>
         <a type="submit" id="btnList" href="#" class="btn btn-dark pull-left">목록</a>
      </div>
      </form>
      
   </div>
</div>
<%@ include file="../include/footer.jsp"%>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>