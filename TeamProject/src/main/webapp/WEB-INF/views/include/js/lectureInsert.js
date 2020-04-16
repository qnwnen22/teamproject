/**
 * 
 */

$(function(){
	$('#content').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
});

// 영상 강의 등록 
function insert1(){

	var main_category=document.getElementById("main_category");
	var sub_category=document.getElementById("sub_category");
	var userid=document.getElementById("userid");
	var subject=document.getElementById("subject");
	var price=document.getElementById("price");
	var input_img=document.getElementById("input_img");
	var file2=document.getElementById("file2");
	var content=document.getElementById("content");
	
	
	if(main_category.value==""){
		alert("메인 카테고리를 선택해 주세요.");
		main_category.focus();
		return false;
	}
	if(sub_category.value==""){
		alert("서브 카테고리를 선택해 주세요.");
		sub_category.focus();
		return false;
	}
	if(userid.value==""){
		alert("로그인 후 다시 시도해주세요.");
		userid.focus();
		return false;
	}
	if(subject.value==""){
		alert("제목을 입력해주세요.");
		subject.focus();
		return false;
	}
	if(price.value==""){
		alert("가격을 입력해주세요.");
		price.focus();
		return false;
	}
	if(!input_img.value){
		alert("메인 이미지로 사용할 파일을 첨부해주세요.");
		input_img.focus();
		return false;
	}
	if(!file2.value){
		alert("동영상을 등록해주세요.");
		file2.focus();
		return false;
	}
	if(content.value==""){
		if(confirm("강의에 대한 설명이 지정되어있지 않습니다.\n그래도 강의를 등록 하시겠습니까?") == false){
			return false;
		}
	}
	alert("강의가 등록되었습니다.");
	document.form1.submit();
	
}

// 실시간 강의 등록
function insert2(){

	var main_category=document.getElementById("main_category");
	var sub_category=document.getElementById("sub_category");
	var userid=document.getElementById("userid");
	var subject=document.getElementById("subject");
	var price=document.getElementById("price");
	var input_img=document.getElementById("input_img");
	var file2=document.getElementById("file2");
	var lecture_date=document.getElementById("lecture_date");
	var lecture_start=document.getElementById("lecture_start");
	var lecture_time=document.getElementById("lecture_time");
	var content=document.getElementById("content");

	if(main_category.value==""){
		alert("메인 카테고리를 선택해 주세요.");
		main_category.focus();
		return false;
	}
	if(sub_category.value==""){
		alert("서브 카테고리를 선택해 주세요.");
		sub_category.focus();
		return false;
	}
	if(userid.value==""){
		alert("로그인 후 다시 시도해주세요.");
		userid.focus();
		return false;
	}
	if(subject.value==""){
		alert("제목을 입력해주세요.");
		subject.focus();
		return false;
	}
	if(price.value==""){
		alert("가격을 입력해주세요.");
		price.focus();
		return false;
	}
	if(!input_img.value){
		alert("메인 이미지로 사용할 파일을 첨부해주세요.");
		input_img.focus();
		return false;
	}
	if(!file2.value){
		alert("동영상을 등록해주세요.");
		file2.focus();
		return false;
	}
	if(!lecture_date.value){
		alert("강의를 시작할 날짜를 지정해주세요.");
		lecture_date.focus();
		return false;
	}
	if(lecture_start.value==""){
		alert("강의를 진행할 시간을 지정해주세요.");
		lecture_start.focus();
		return false;
	}
	if(lecture_time.value==""){
		alert("강의를 진행하는 총 시간을 지정해주세요.");
		lecture_time.focus();
		return false;
	}
	
	if(content.value==""){
		if(confirm("강의에 대한 설명이 지정되어있지 않습니다.\n그래도 강의를 등록 하시겠습니까?") == false){
			return false;
		}
	}
	alert("강의가 등록되었습니다.");
	document.form1.submit();
	
}

function update(){

	var main_category=document.getElementById("main_category");
	var sub_category=document.getElementById("sub_category");
	var userid=document.getElementById("userid");
	var subject=document.getElementById("subject");
	var price=document.getElementById("price");
	var input_img=document.getElementById("input_img");
	var file2=document.getElementById("file2");
	var lecture_date=document.getElementById("lecture_date");
	var lecture_start=document.getElementById("lecture_start");
	var lecture_time=document.getElementById("lecture_time");
	var content=document.getElementById("content");

	if(main_category.value==""){
		alert("메인 카테고리를 선택해 주세요.");
		main_category.focus();
		return false;
	}
	if(sub_category.value==""){
		alert("서브 카테고리를 선택해 주세요.");
		sub_category.focus();
		return false;
	}
	if(userid.value==""){
		alert("로그인 후 다시 시도해주세요.");
		userid.focus();
		return false;
	}
	if(subject.value==""){
		alert("제목을 입력해주세요.");
		subject.focus();
		return false;
	}
	if(price.value==""){
		alert("가격을 입력해주세요.");
		price.focus();
		return false;
	}
	
	if(content.value==""){
		if(confirm("강의에 대한 설명이 지정되어있지 않습니다.\n그래도 강의를 등록 하시겠습니까?") == false){
			return false;
		}
	}
	alert("강의가 수정되었습니다.");
	document.form1.submit();
	
}

// 현장 강의 등록
function insert3(){

	var main_category=document.getElementById("main_category");
	var sub_category=document.getElementById("sub_category");
	var userid=document.getElementById("userid");
	var subject=document.getElementById("subject");
	var price=document.getElementById("price");
	var input_img=document.getElementById("input_img");
	var lecture_date=document.getElementById("lecture_date");
	var lecture_start=document.getElementById("lecture_start");
	var lecture_time=document.getElementById("lecture_time");
	var content=document.getElementById("content");

	if(main_category.value==""){
		alert("메인 카테고리를 선택해 주세요.");
		main_category.focus();
		return false;
	}
	if(sub_category.value==""){
		alert("서브 카테고리를 선택해 주세요.");
		sub_category.focus();
		return false;
	}
	if(userid.value==""){
		alert("로그인 후 다시 시도해주세요.");
		userid.focus();
		return false;
	}
	if(subject.value==""){
		alert("제목을 입력해주세요.");
		subject.focus();
		return false;
	}
	if(price.value==""){
		alert("가격을 입력해주세요.");
		price.focus();
		return false;
	}
	if(!input_img.value){
		alert("메인 이미지로 사용할 파일을 첨부해주세요.");
		input_img.focus();
		return false;
	}
	if(!lecture_date.value){
		alert("강의를 시작할 날짜를 지정해주세요.");
		lecture_date.focus();
		return false;
	}
	if(lecture_start.value==""){
		alert("강의를 진행할 시간을 지정해주세요.");
		lecture_start.focus();
		return false;
	}
	if(lecture_time.value==""){
		alert("강의를 진행하는 총 시간을 지정해주세요.");
		lecture_time.focus();
		return false;
	}
	
	if(lecture_address.value==""){
		alert("강의를 진행할 강의실의 주소를 입력해주세요.");
		lecture_address.focus();	
		return false;
	}
	if(lecture_address2.value==""){
		alert("상세 주소를 입력해주세요.");
		lecture_address2.focus();
		return false;
	}
	if(content.value==""){
		if(confirm("강의에 대한 설명이 지정되어있지 않습니다.\n그래도 강의를 등록 하시겠습니까?") == false){
			return false;
		}
	}
	alert("강의가 등록되었습니다.");
	document.form1.submit();
}

function category() {
	
	var main1 = ['m1-s1','m1-s2','m1-s3','m1-s4','m1-s5'];
	var main2 = ['m2-s1','m2-s2','m2-s3','m2-s4','m2-s5','m2-s6'];
	var main3 = ['m3-s1','m3-s2','m3-s3','m3-s4','m3-s5','m3-s6','m3-s7'];
	var main4 = ['m4-s1','m4-s2','m4-s3','m4-s4','m4-s5','m4-s6','m4-s7','m4-s8'];
	var main5 = ['m5-s1','m5-s2','m5-s3','m5-s4','m5-s5','m5-s6','m5-s7','m5-s8'];
	var main6 = ['m6-s1','m6-s2'];
	var main7 = ['m7-s1','m7-s2','m7-s3','m7-s4','m7-s5','m7-s6','m7-s7','m7-s8'];
	var main8 = ['m8-s1','m8-s2'];
	var main9 = ['m9-s1','m9-s2','m9-s3','m9-s4','m9-s5','m9-s6','m9-s7','m9-s8'];
	var main10 = ['m10-s1'];
	var main11 = ['m11-s1'];
	
	var sub = new Array();
	
	var main = $("#main_category").val();
	
	switch(main){
	case '디자인' : sub = main1;
	break;
	case 'IT,프로그래밍' : sub = main2;
	break;
	case '콘텐츠 제작' : sub = main3;
	break;
	case '마케팅' : sub = main4;
	break;
	case '번역,통역' : sub = main5;
	break;
	case '문서,취업' : sub = main6;
	break;
	case '비즈니스컨설팅' : sub = main7;
	break;
	case '운세,상담' : sub = main8;
	break;
	case '레슨,실무교육' : sub = main9;
	break;
	case '주문제작' : sub = main10;
	break;
	case '간판,인쇄' : sub = main11;
	break;
	}
	
	$('#sub_category').empty();
		
	for(var i=0; i<sub.length; i++){
		var option = $("<option value='"+sub[i]+"'>"+sub[i]+"</option>;");
		$('#sub_category').append(option);
	}
}