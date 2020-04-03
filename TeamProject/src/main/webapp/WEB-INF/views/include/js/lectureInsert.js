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
	if(!file1.value){
		alert("메인 이미지로 사용할 파일을 첨부해주세요.");
		file1.focus();
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
	document.form1.submit();
	alert("강의가 등록되었습니다.");
	
}

// 실시간 강의 등록
function insert2(){

	/*var main_category=document.getElementById("main_category");
	var sub_category=document.getElementById("sub_category");
	var userid=document.getElementById("userid");
	var subject=document.getElementById("subject");
	var price=document.getElementById("price");
	var file1=document.getElementById("file1");
	var file2=document.getElementById("file2");
	var lecture_date=document.getElementById("lecture_date");
	var lecture_start=document.getElementById("lecture_start");
	var lecture_time=document.getElementById("lecture_time");
	var content=document.getElementById("content");*/

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
	if(!file1.value){
		alert("메인 이미지로 사용할 파일을 첨부해주세요.");
		file1.focus();
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
	document.form1.submit();
	alert("강의가 등록되었습니다.");
	
}
// 현장 강의 등록
function insert3(){

	var main_category=document.getElementById("main_category");
	var sub_category=document.getElementById("sub_category");
	var userid=document.getElementById("userid");
	var subject=document.getElementById("subject");
	var price=document.getElementById("price");
	var file1=document.getElementById("file1");
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
	if(!file1.value){
		alert("메인 이미지로 사용할 파일을 첨부해주세요.");
		file1.focus();
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
	document.form1.submit();
	alert("강의가 등록되었습니다.");
}

function category() {
	sub = document.form1.sub_category;
	
	var category=document.getElementById("main_category").value;
	sub.options[0]= new Option("서브 카테고리를 선택해주세요.","");
	
	if(category=='디자인'){
		sub.options[1]= new Option("로고,브랜딩","로고,브랜딩");
		sub.options[2]= new Option("인쇄물","인쇄물");
		sub.options[3]= new Option("제품,패키지","제품,패키지");
		sub.options[4]= new Option("북,앨범디자인","북,앨범디자인");
		sub.options[5]= new Option("공간디자인","공간디자인");		
	} else if(category=='IT,프로그래밍'){
		sub.options[1]= new Option("워드프레스","워드프레스");
		sub.options[2]= new Option("웹사이트 개발","웹사이트 ");
		sub.options[3]= new Option("쇼핑몰,커머스","쇼핑몰,커머스");
		sub.options[4]= new Option("모바일앱,웹","모바일앱,웹");
		sub.options[5]= new Option("게임","게임");
	} else if(category=='콘텐츠 제작'){
		sub.options[1]= new Option("영상촬영,편집","영상촬영,편집");
		sub.options[2]= new Option("유튜브 제작","유튜브 제작");
		sub.options[3]= new Option("애니메이션","애니메이션");
		sub.options[4]= new Option("3D,VR","3D,VR");
		sub.options[5]= new Option("사진촬영","사진촬영");
	} else if(category=='마케팅'){
		sub.options[1]= new Option("종합광고대행","종합광고대행");
		sub.options[2]= new Option("블로그","블로그");
		sub.options[3]= new Option("영상 마케팅","영상 마케팅");
		sub.options[4]= new Option("SNS 마케팅","SNS 마케팅");
		sub.options[5]= new Option("쇼핑몰,스토어","쇼핑몰,스토어");
	} else if(category=='번역,통역'){
		sub.options[1]= new Option("번역","번역");
		sub.options[2]= new Option("통역","통역");
		sub.options[3]= new Option("영상번역","영상번역");
		sub.options[4]= new Option("감수","감수");
		sub.options[5]= new Option("번역공증","번역공증");
	} else if(category=='문서,취업'){
		sub.options[1]= new Option("면접,취업 코칭","면접,취업 코칭");
		sub.options[2]= new Option("자소서","자소서");
		sub.options[3]= new Option("카피라이팅","카피라이팅");
		sub.options[4]= new Option("논문","논문");
		sub.options[5]= new Option("타이핑","타이핑");
	} else if(category=='비즈니스컨설팅'){
		sub.options[0]= new Option("서브 카테고리를 선택해주세요.","");
		sub.options[1]= new Option("투잡,부업","투잡,부업");
		sub.options[2]= new Option("세무회계","세무회계");
		sub.options[3]= new Option("창업,경영컨설팅","창업,경영컨설팅");
		sub.options[4]= new Option("리서치,서베이","리서치,서베이");
		sub.options[5]= new Option("해외사업","해외사업");
	} else if(category=='운세,상담'){
		sub.options[1]= new Option("신점","신점");
		sub.options[2]= new Option("사주,운세","사주,운세");
		sub.options[3]= new Option("타로","타로");
		sub.options[4]= new Option("작명","작명");
		sub.options[5]= new Option("심리상담","심리상담");
	} else if(category=='레슨,실무교육'){
		sub.options[1]= new Option("프로그래밍","프로그래밍");
		sub.options[2]= new Option("그래픽디자인","그래픽디자인");
		sub.options[3]= new Option("데이터분석","데이터분석");
		sub.options[4]= new Option("유튜브,영상&사진","유튜브,영상&사진");
		sub.options[5]= new Option("외국어","외국어");
	} else if(category=='주문제작'){
		sub.options[0]= new Option("서브 카테고리를 선택해주세요.","");
		sub.options[1]= new Option("3D프린팅","3D프린팅");
		sub.options[2]= new Option("패키지제작","패키지제작");
		sub.options[3]= new Option("가게용품제작","가게용품제작");
		sub.options[4]= new Option("굿즈제작","굿즈제작");
		sub.options[5]= new Option("모형제작","모형제작");
	} else if(category=='간판,인쇄'){
		sub.options[1]= new Option("인쇄","인쇄");
		sub.options[2]= new Option("간판","간판");
		sub.options[3]= new Option("test1","test1");
		sub.options[4]= new Option("test2","test2");
		sub.options[5]= new Option("test3","test3");
	}
}