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
	location.href="${path}/notice/list.do";
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
		<ul class="upper_shift">
			<li><a href="${path}">KDEMY</a></li>
			<li><a href="${path}/notice/list.do">공지사항</a></li>
		</ul>
	</div>
	<br>
	<br>

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

