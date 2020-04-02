<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/fixed-topbar.jsp" %>
<script src="${path}/include/js/common.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>

<script>
$(function(){

	
	$('#content').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
        
	});


	
	$("#btnSave").click(function(){
		document.menu_add_form.action="${path}/lecture/teacher_type1_insert.do";
		document.menu_add_form.submit();
	});
});


var sub_category0 = new Array("-서브메뉴-");
var sub_category1 = new Array("BEST BABY","BEST JUNIOR","BEST ACC");
var sub_category2 = new Array("SPRING","SUMMER","FALL","WINTER");
var sub_category3 = new Array("BABY OUTER","BABY TOP","BABY BOTTOM","BABY SET","BABY DRESS");
var sub_category4 = new Array("JUNIOR OUTER","JUNIOR TOP","JUNIOR BOTTOM","JUNIOR SET","JUNIOR DRESS");
var sub_category5 = new Array("CAP", "BAG", "SOCKS", "MUFFLER");



function submenuchange(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.menu_add_form.sub_category;

    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('ccount = sub_category' + item + '.length');
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = sub_category' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    temp.options[0].selected=true;
    return true;
}


var count = 1;       

function addForm(){
	   if(count<=8) {
          var addedFormDiv = document.getElementById("addedFormDiv");                 
          var str = "";
          str+=" <input type='file' class='form-control' name='filename"+count+"'id='filename"+count+"'>";
          // 추가할 폼(에 들어갈 HTML)             
          var addedDiv = document.createElement("div"); // 폼 생성
          addedDiv.id = "added_"+count; // 폼 Div에 ID 부여 (삭제를 위해)
          addedDiv.innerHTML  = str; // 폼 Div안에 HTML삽입
          addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입         
          count++;
          document.baseForm.count.value=count;
          // 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장
	   }
}
function delForm(){
          var addedFormDiv = document.getElementById("addedFormDiv");    
          if(count >1){ // 현재 폼이 두개 이상이면
                     var addedDiv = document.getElementById("added_"+(--count));
                     // 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
                     addedFormDiv.removeChild(addedDiv); // 폼 삭제 
          }else{ // 마지막 폼만 남아있다면
                     document.baseForm.reset(); // 폼 내용 삭제
          }
}

</script>
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
</style>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">

	<div class="container menu_add_div">
		<div
			class="page-header text-center col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
			<div
				class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
				<h3>상품 업로드</h3>
			</div>
		</div>

		<div
			class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-md-offset-2 col-sm-offset-2">
			<form method="post" name="menu_add_form"
				enctype="multipart/form-data" class="form-horizontal"
				action="${path}/lecture/teacher_type1_insert.do">
				<div class="form-group">
					<label for="cell_type">동영상</label> <select name="cell_type"
						class="form-control">
						<option selected value="1">동영상업로드</option>
					</select>
				</div>
				<div class="form-group">
					<label for="category">카테고리1</label> <select name="main_category" id="main_category"
						class="form-control"
						onChange="javascript:submenuchange(document.menu_add_form.main_category.options.selectedIndex)">
						<option selected value="">-메인메뉴-</option>
						<option value="BEST">BEST</option>
						<option value="SALE">SALE</option>
						<option value="BABY">BABY</option>
						<option value="JUNIOR">JUNIOR</option>
						<option value="ACC">ACC</option>
					</select>
				</div>
				<div class="form-group">
					<label for="category">카테고리2</label> <select name="sub_category" id="sub_category"
						class="form-control">
						<option selected value="">-서브메뉴-</option>
					</select>
				</div>
				<div class="form-group">
					<label for="userid">강사아이디</label> <input class="form-control"
						id="userid" name="userid" placeholder="상품명 입력해 주세요">
				</div>
				<div class="form-group">
					<label for="subject">영상제목</label> <input class="form-control"
						id="subject" name="subject" placeholder="상품명 입력해 주세요">
				</div>
				<div class="form-group">
					<label for="price">가격</label> <input class="form-control"
						id="price" name="price" value="" placeholder="가격을 입력해주세요">
				</div>
				<div class="form-group" id="photo_add">
					<label for="file1">사진파일 (맨위에 파일은 메인사진입니다. 사진추가가 필요시 추가버튼을
						이용해주세요.)</label> <input class="file1" type="file" name="file1"
						id="file1">
				</div>

				<div class="form-group" id="video_add">
					<input type="hidden" name="count" value="0"> <label
						for="file2">동영상파일 (맨위에 파일은 메인사진입니다. 사진추가가 필요시 추가버튼을
						이용해주세요.)</label> <input class="file2" type="file" name="file2"
						id="file2">
					<!--  <p id="addedFormDiv"></p>
                        <a href="javascript:addForm()" class="btn btn-primary">동영상 추가</a> 
                        <a href="javascript:delForm()" class="btn btn-primary">동영상 삭제</a> -->
				</div>
				<div class="form-group">
					<label for="content_label">내용</label><br>
					<textarea class="form-control text_cotent" name="content"
						id="content" rows="10" cols="10"></textarea>
				</div>
				
				<div class="form-group text-center">
					<button type="submit" id="btnSave" class="btn btn-primary">
						등록</button>
					<a type="submit" href="#" class="btn btn-warning"> 취소 </a> <a
						type="submit" id="btnList" href="#" class="btn btn-dark pull-left">
						목록 </a>
				</div>

			</form>
		</div>
	</div>
</div>	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>