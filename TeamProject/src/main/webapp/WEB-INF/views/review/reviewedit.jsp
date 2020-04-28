<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="../include/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>
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

function GoList(){
	var go_confirm=confirm("입력하신 내용은 저장이 되지 않습니다. 그래도 나가시겠습니까?");
	if(go_confirm==true){
	location.href="${path}/review/view.do?bno=${bno}";
		}
	}

var t0 = new Array("-선택-","");
var t1 = new Array("-선택-","디자인선생1","디자인선생2","디자인선생3","디자인선생4","디자인선생5","디자인선생6");
var t2 = new Array("-선택-","디자인선생1","디자인선생1","디자인선생2","디자인선생3","디자인선생4","디자인선생5","디자인선생6","디자인선생7");
var t3 = new Array("-선택-","문서선생1","문서선생2","문서선생3","문서선생4","문서선생5");
var t4 = new Array("-선택-","아이콘1선생1","아이콘1선생2","아이콘1선생3","아이콘1선생4","아이콘1선생5","아이콘1선생6","아이콘1선생7");
var t5 = new Array("-선택-","아이콘2선생1","아이콘2선생2","아이콘2선생3","아이콘2선생4","아이콘2선생5","아이콘2선생6","아이콘2선생7");
var t6 = new Array("-선택-","안드로이드선생1","안드로이드선생2","안드로이드선생3","안드로이드선생4","안드로이드선생5",);
var t7 = new Array("-선택-","어플선생1","어플선생2","어플선생3","어플선생4","어플선생5","어플선생6","어플선생7");
var t8 = new Array("-선택-","콘텐츠제작1선생1","콘텐츠제작1선생2");
var t9 = new Array("-선택-","콘텐츠제작2선생1","콘텐츠제작2선생2","콘텐츠제작2선생3","콘텐츠제작2선생4");
var t10 = new Array("-선택-","박찬호 강사님","IT프로그래밍선생2","IT프로그래밍선생3");
var t11 = new Array("-선택-","번역,통역선생1","번역,통역선생2","번역,통역선생3","번역,통역선생4","번역,통역선생5","번역,통역선생6","번역,통역선생7");


function subjectchange(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.form1.teacher;

    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('ccount = t' + item + '.length');
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = t' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    temp.options[0].selected=true;
    return true;
}


</script>

</head>
<body>
<%@ include file="../include/fixed-topbar.jsp"%>
<div class="container-xl col-xl-8 offset-xl-2 col-lg-12">
	<div >
		<ul class="upper_shift">
			<li><a href="${path}">KDEMY</a></li>
			<li><b><a href="${path}/review/list.do" style="color: blue;">수강후기</a></b></li>
		</ul>
	</div>


<form id="form1" name="form1" method="post" action="${path}/review/update.do">
	
			
				<div class="form-group mb-4">
					<label for="formGroupExampleInput">과목</label> <select
						class="custom-select" required name="subject" id="subject"
						onchange="javascript:subjectchange(document.form1.subject.options.selectedIndex);">
						<option selected value="${dto.subject}">${dto.subject }</option>
						<option value="디자인">디자인</option>
						<option value="마케팅">마케팅</option>
						<option value="문서, 취업">문서, 취업</option>
						<option value="아이콘">아이콘</option>
						<option value="아이콘2">아이콘2</option>
						<option value="안드로이드">안드로이드</option>
						<option value="어플">어플</option>
						<option value="콘텐츠제작">콘텐츠제작</option>
						<option value="콘텐츠제작2">콘텐츠제작2</option>
						<option value="IT프로그래밍">IT프로그래밍</option>
						<option value="번역,통역">번역,통역</option>
					</select>
				</div>


				<div class="form-group t1 mb-4">
					<label for="formGroupExampleInput">강사</label> <select
						class="custom-select" required name="teacher" id="teacher">
						<option selected value="${dto.teacher}">${dto.teacher}</option>
					</select>
				</div>




	<div class="form-group mb-4">
		<label for="formGroupExampleInput">제목</label> <input type="text"
			class="form-control" id="title" name="title" value="${dto.title}">
	</div><br>
	


		<div class=" was-validated mb-4">
			<label for="validationTextarea">내용</label>
			<textarea class="form-control is-invalid form-control-lg " id="content" name="content"
			 required rows="50">${dto.content}</textarea>
		</div>
	<br>
	
	<!-- 	<div class="form-group mb-4 ">
					<label for="fullName">파일 첨부</label> <input
						type="file" class="form-control-file" id="file1" name="file1">
				</div>
	 -->
	<input type="hidden" name="bno" value="${dto.bno}">
 
 	
  
<div class="btn-group float-right mb-5" role="group" aria-label="Basic example">
							<button type="submit" class="justify-content-end  btn btn-sm btn-primary font-color-fff btn-normal-silver"
								data-toggle="button" aria-pressed="false">
								확인</button>
						<button type="button" class="btn btn-sm btn-primary justify-content-end  font-color-fff btn-normal-silver" data-toggle="button"
							aria-pressed="false" onclick="GoList()">취소</button>
				</div>
  </form>
	
  <br>  <br>

</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>