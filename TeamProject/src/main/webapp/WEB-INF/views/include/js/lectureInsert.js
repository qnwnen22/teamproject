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
	
	
	if(userid.value==""){
		alert("로그인 후 다시 시도해주세요.");
		document.location.href='/Kdemy/';
		return false;
	}
	if(subject.value==""){
		alert("제목을 입력해주세요.");
		subject.focus();
		return false;
	}
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
	
	var main1 = ['로고,브랜딩','인쇄물','제품,패키지','북,앨범 디자인','공간디자인','웹,모바일 디자인','상세,랜딩 페이지','블로그,SNS 디자인','게임,VR','PPT,인포그래픽','일러스트,캐리커쳐',
		'웹툰,캐릭터,이모티콘','포토샵편집','간판디자인','현수막,X배너','의류디자인','캘리그라피','디자이너','기타'];
	var main2 = ['워드프레스','웹사이트 개발','쇼핑몰,커머스','모바일웹,웹','프로그램 개발','게임','임베디드 HW,SW','데이터베이스','데이터분석,리포트','블록체인','보안','서버 및 기술지원',
		'QA,테스트','파일변환','챗봇','기타'];
	var main3 = ['영상촬영,편집','유튜브 제작','애니메이션','3D,VR','인트로,로고','사진촬영','더빙,녹음','음악,사운드','모델,MC','기타'];
	var main4 = ['종합광고대행','블로그,카페','영상 마케팅','SNS 마케팅','쇼핑몰,스토어','유튜브 크리에이터','블로그 체험단','인스타 인플루언서','퍼포먼스 마케팅','언론홍보','앱마케팅','검색최적화,SEO',
		'지도등록,리뷰','포털질문,답변','오프라인광고','해외마케팅','마케팅 노하우','기타'];
	var main5 = ['번역','통역','영상번역','감수','번역공증'];
	var main6 = ['면접,취업 코칭','자소서,이력서','노하우,전자책','글작성,대본','카피라이팅','타이핑','논문','맞춤양식','기타'];
	var main7 = ['투잡,부업','세무회계','창업,경영컨설팅','사업계획서,투자제안서','리서치,서베이','해외사업','HR,인사','보고서작성,업무지원','자산관리,재테크','법률,법무','기타'];
	var main8 = ['신점','사주,운세','타로','작명','심리상담','연애상담','여행,생활','기타'];
	var main9 = ['마케팅','프로그래밍','그래픽디자인','데이터분석','유튜브,영상&사진','외국어','프레젠테이션','취미,라이프','기타'];
	var main10 = ['3D프린팅','패키지제작','가게용품제작','굿즈제작','모형제작','시스템제작','인테리어시공','기타'];
	var main11 = ['인쇄','간판'];
	
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
	for(var i=1; i<sub.length; i++){
		var option = $("<option value='"+sub[i]+"'>"+sub[i]+"</option>;");
		$('#sub_category').append(option);
	}
}