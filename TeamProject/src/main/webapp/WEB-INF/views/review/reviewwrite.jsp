<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
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

textarea.form-control{
	height: 15em !important;
}


</style>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/fixed-topbar.jsp"%>
<link rel="stylesheet" href="${path}/include/css/home.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"	 rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>
<script src="${path}/include/js/common.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$('#content').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});

function attachAddr(){
	  const str = `<input type="file" class="form-control-file" id="exampleFormControlFile1">`;
	  $(".Plus_one").append(str); 
	}


function alertClick() {
	var title = $("#title").val();
	var content = $("#content").val();
	if (title == "") { //빈값이면
		alert("제목을 입력하세요");
		$("#title").focus(); //입력포커스 이동
		return; //함수 종료, 폼 데이터를 제출하지 않음
	}
	if (content == "") {
		alert("내용을 입력하세요");
		$("#content").focus();
		return;
	}
}

function GoList(){
	var go_confirm=confirm("입력하신 내용은 저장이 되지 않습니다. 그래도 나가시겠습니까?");
	if(go_confirm==true){
	location.href="${path}/review/list.do";
		}
	}

function Change(){
	  var key = subject.value;
	  if(key==1){
	  document.getElementsByClassName('t1').style.visibility="hidden";
	  document.getElementsByClassName('t2').style.visibility="visible";
	  }
	  if(key==2){
		  document.getElementsByClassName('t1').style.visibility="visible";
		  document.getElementsByClassName('t2').style.visibility="hidden";
	  }
	 }


</script>

</head>
<body>
	<br>
	<br>
	<br>
<div class="container">
<div class="justify-content-md-center">
<form id="form1" name="form1" method="post" action="${path}/notice/insert.do">
	<div >
		<ul class="upper_shift" >
			<li><a href="${path}">KDEMY</a></li>
			<li><a href="${path}/review/list.do">수강후기</a></li>
		</ul>
	</div>
	<br>
	<br>
	
	<select name="search_option" class=" search_option"
				style="visibility: hidden;">
				<%--	<option value="username"
					<c:if test="${map.search_option=='username' }">selected</c:if>>이름</option>
				<option value="title"
					<c:if test="${map.search_option=='title' }">selected</c:if>>제목</option>
				<option value="content"
					<c:if test="${map.search_option=='content' }">selected</c:if>>내용</option> --%>
				<option value="all"
					<c:if test="${map.search_option=='all' }">selected</c:if>>이름+내용+제목</option>
			</select>
	
	  <div class="form-group">
	  <label for="formGroupExampleInput">과목</label> 
    <select class="custom-select" required name="subject" id="subject" onchange="Change()">
      <option value="1" >디자인</option>
      <option value="2">마케팅</option>
      <option value="3">문서, 취업</option>
      <option value="4">아이콘</option>
      <option value="5">아이콘2</option>
      <option value="6">안드로이드</option>
      <option value="7">어플</option>
      <option value="8">콘텐츠제작</option>
      <option value="9">콘텐츠제작2</option>
      <option value="10">IT프로그래밍</option>
      <option value="11">번역,통역</option>
    </select>
  </div>
  
  
    <div class="form-group t1">
	  <label for="formGroupExampleInput">디자인 강사</label> 
    <select class="custom-select" required name="teacher" id="teacher">
      <option value="t1">선생1</option>
      <option value="t2">선생2</option>
      <option value="t3">선생3</option>
    </select>
  </div>
  
   <div class="form-group t2">
	  <label for="formGroupExampleInput">마케팅 강사</label> 
    <select class="custom-select" required name="teacher" id="teacher">
      <option value="t4">선생3</option>
      <option value="t5">선생4</option>
      <option value="t6">선생5</option>
    </select>
  </div>

	<div class="form-group">
		<label for="formGroupExampleInput">제목</label> <input type="text"
			class="form-control" id="title" name="title"
			placeholder="제목을 입력하세요">
	</div><br>
	

	

		<div class="mb-3 was-validated">
			<label for="validationTextarea">내용</label>
			<textarea class="form-control is-invalid form-control-lg " id="content" name="content"
				placeholder="내용을 입력하세요" required></textarea>
		</div>
	<br>
 
 	
  <div class="form-group">
    <label for="exampleFormControlFile1">파일 첨부</label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" >
<div class="Plus_one"></div>
<div> <input type="button" class="form-control-file" id="exampleFormControlFile1" onclick="attachAddr(); return false;" value="파일 추가"  style="width: 5.5em;">
			</div>
  </div>
  

<div class="btn-group float-right" role="group" aria-label="Basic example">
							<button type="submit" class="justify-content-end  btn btn-sm btn-primary font-color-fff btn-normal-silver"
								data-toggle="button" aria-pressed="false" onclick="alertClick()">
								확인</button>
						<button type="button" class="btn btn-sm btn-primary justify-content-end  font-color-fff btn-normal-silver" data-toggle="button"
							aria-pressed="false" onclick="GoList()">취소</button>
				</div>
  </form>
	
  
  <br><br><br>







	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</div>
</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>

