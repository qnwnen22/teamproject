<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<script type="text/javascript">  
var submenu0 = new Array("-전체-");
var submenu1 = new Array("-전체-");
var submenu2 = new Array("일반고","특성화고","특수목적고","자율고","기타");
var submenu3 = new Array("전문대학","대학(4년제)");

var submenuvalue0 = new Array("");
var submenuvalue1 = new Array("");
var submenuvalue2 = new Array("100362","100363","100364","100365","100366");
var submenuvalue3 = new Array("100322","100323");

/* var highschoolbigo0 = new Array("일반고");
var highschoolbigo1 = new Array("대안교육","직업교육","기타");
var highschoolbigo2 = new Array("과학계열","외국어국제계열","예술체육계열","마이스터고");
var highschoolbigo3 = new Array("자율형사립","자율형공립");
var highschoolbigo4 = new Array("영재학교");

var highschoolbigovalue0 = new Array("104228");
var highschoolbigovalue1 = new Array("100368","100369","100370");
var highschoolbigovalue2 = new Array("100371","100372","100373","100374");
var highschoolbigovalue3 = new Array("100375","100376");
var highschoolbigovalue4 = new Array("100377");


var univschoolbigo0 = new Array("전문대학","기능대학(폴리텍대학)","사이버대학(2년제)","각종대학(전문)");
var univschoolbigo1 = new Array("일반대학","교육대학","산업대학","사이버대학(4년제)","각종대학(대학)");

var univschoolbigovalue0 = new Array("100324","100325","100326","100327");
var univschoolbigovalue1 = new Array("100328","100329","100330","100331","100332"); */


function sch1change(item){
    var temp, i=0, j=0;
    var ccount, cselect, cvalue;

    temp = document.school_search_form.sch1;
    
    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('ccount = submenu' + item + '.length');
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = submenu' + item + '[' + j + '];');
        eval('cvalue = submenuvalue' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cvalue); 
    }
    temp.options[0].selected=true;
    return true;
}


/* function sch2change(item){
    var temp, i=0, j=0;
    var ccount, cucount, cselect, cvalue;

    temp1 = document.school_search_form.sch1;

    temp = document.school_search_form.sch2;
    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('ccount = highschoolbigo' + item + '.length');
    
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = highschoolbigo' + item + '[' + j + '];');
        eval('cvalue = highschoolbigovalue' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cvalue); 
    }
    console.log(ccount);
    temp.options[0].selected=true;
    return true;
}
 */



function drawChart(){
	//차트 그리기에 필요한 json 데이터 로딩
	var jsonData=$.ajax({
		url: "${path}/chart/cart_money_list.do",
		dataType: "json",
		async: false //동기식처리(순차적 처리:데이터를 다부른 후 챠트출력하기 위해)
	}).responseText;
	console.log(jsonData);//콘솔에도 출력해봄
	//json => 데이터테이블
	var data=new google.visualization.DataTable(jsonData);
	console.log("데이터 테이블:"+data);
		var chart=new google.visualization.PieChart(
			document.getElementById("chart_div")); 
/* 	var chart=new google.visualization.LineChart(
			document.getElementById("chart_div")); */
/* 	var chart=new google.visualization.ColumnChart(
			document.getElementById("chart_div")); */	
	chart.draw(data, {
		title: "차트 예제",
		//curveType: "function", //곡선 처리		
		width: 600,
		height: 440
	});
}
 </script>
<body>
	<%@ include file="../include/fixed-topbar.jsp"%>
<a href="${path}/chatroom/room">채팅방만들기</a>
<a href="${path}/chatroom/chatRoomList.do">채팅방리스트이동</a>
	<div class="container-lg joinDiv">
		<div class="page-header col-xl-8 offset-xl-2 text-center">
			<h2>전문가등록</h2>
		</div>
	<form name="school_search_form">	
		<div class="form-horizontal" id="search-block">
	<div class="margin-bottom-5">
		<select class="form-control form-group-margin"
			data-bind="value: region" name="region" placeholder="지역">
			<option value="">전체</option>
			<option value="100260">서울특별시</option>
			<option value="100267">부산광역시</option>
			<option value="100269">인천광역시</option>
			<option value="100271">대전광역시</option>
			<option value="100272">대구광역시</option>
			<option value="100273">울산광역시</option>
			<option value="100275">광주광역시</option>
			<option value="100276">경기도</option>
			<option value="100278">강원도</option>
			<option value="100280">충청북도</option>
			<option value="100281">충청남도</option>
			<option value="100282">전라북도</option>
			<option value="100283">전라남도</option>
			<option value="100285">경상북도</option>
			<option value="100291">경상남도</option>
			<option value="100292">제주도</option>
		</select>
	</div>
	<div class="margin-bottom-5">
		<select class="form-control form-group-margin"
			data-bind="value: gubun" name="gubun" placeholder="구분" onChange="javascript:sch1change(document.school_search_form.gubun.options.selectedIndex)"> 
			<option value="elem_list">초등학교</option>
			<option value="midd_list">중학교</option>
			<option value="high_list">고등학교</option>
			<option value="univ_list">대학교</option>
		</select>
	</div>

	
	<div class="margin-bottom-5">
		<select class="form-control form-group-margin"
			data-bind="value: sch1" name="sch1" placeholder="학교유형1" onChange="javascript:sch2change(document.school_search_form.sch1.options.selectedIndex)">
			<option value="">전체</option>
		</select>
	</div>
	
	<div class="margin-bottom-5">
		<select class="form-control form-group-margin"
			data-bind="value: sch1" name="sch2" placeholder="학교유형2">
			<option value="">전체</option>
		</select>
	</div>
	
	

	<div class="margin-bottom-5">
		<input class="form-control" data-bind="value: name" placeholder="학교이름"
			type="text">
	</div>
	<div class="margin-bottom-5">
		<button class="btn btn-default" data-bind="click:search" type="button">검색</button>
	</div>
</div>
<div id="school-grid">

</div>
	</form>	
		<div
			class="col-sm-12 col-md-12 col-lg-8 col-xl-8 offset-xl-2 offset-lg-2 joinForm"
			style="padding-left: 10px; padding-right: 10px;">
			<form method="post" id="join_form" name="join_form"
				action="${path}/member/insertMember.do" class="form-horizontal">
				<div class="form-group">
					<label for="username">성명</label> &nbsp; <span id="usernameM"></span>
					<input type="text" class="form-control" id="username"
						name="username" placeholder="이름을 입력해 주세요">
				</div>
				<div class="form-group">
					<label for="userid">아이디</label>&nbsp; <span id="CheckM"></span> <span
						id="useridM"></span> <input class="form-control" id="userid"
						name="userid" oninput="checkId()" placeholder="아이디를 입력해주세요">
				</div>
				<div class="form-group">
					<label for="passwd">비밀번호</label>&nbsp; <span id="bpasswdM"></span>
					<input type="password" class="form-control" id="bpasswd"
						name="bpasswd" placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="form-group">
					<label for="passwdCheck">비밀번호 확인</label>&nbsp; <span
						id="passwdCheckM"></span> <input type="password"
						class="form-control" id="passwdCheck" name="passwdCheck"
						placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
				</div>
				<div class="form-group">
					<label for="email">이메일 주소</label> &nbsp; <span id="useremailM"></span>
					<input class="form-control" id="useremail" name="useremail"
						placeholder="이메일 주소를 입력해주세요">
				</div>
				<div class="labelname">
					<label for="phonename">핸드폰</label> &nbsp; <span id="phoneM"></span><br>
					<input type="hidden" class="form-control" name="postname">
				</div>

				<div class="form-group" style="display: flex;">
					<div class="col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0">
						<select class="form-control p-0" id="phone1" name="phone1">
							<option value="02" selected>-선택-</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="019">019</option>
							<option value="017">017</option>
						</select>
					</div>
					<div class="col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0">
						<input type="text" class="form-control p-0" id="phone2"
							name="phone2" placeholder="1234" maxlength="4">
					</div>
					<div class="col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0"
						id="phone_text3">
						<input type="text" class="form-control p-0" id="phone3"
							name="phone3" placeholder="5678" maxlength="4">
					</div>
				</div>
				<div class="labelname">
					<label for="phonename">생년월일</label> &nbsp; <span id="birthdayM"></span>
					<br> <input type="hidden" class="form-control">
				</div>
				<div style="display: flex;">
					<div class="form-group col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0">
						<input type="text" class="form-control" id="birthday1"
							name="birthday1" placeholder="2000" maxlength="4">
					</div>
					<div class="form-group col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0">
						<select class="form-control" id="birthday2" name="birthday2">
							<option value="00" selected>-선택-</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</div>
					<div class="form-group col-sm-4 col-xl-4 col-lg-4 col-md-4 p-0"
						id="birthday_text3">
						<input type="text" class="form-control" id="birthday3"
							name="birthday3" placeholder="20" maxlength="2">
					</div>
				</div>
				<div class="labelname">
					<label for="postname">우편번호</label> &nbsp; <span id="postcodeM"></span>
					<br> <input type="hidden" class="form-control" name="postname">
				</div>
				<div style="display: flex;">
					<div class="form-group col-6 p-0">
						<input type="text" id="postcode" name="postcode"
							placeholder="우편번호" class="form-control">
					</div>
					<div class="form-group d-none d-lg-block d-xl-block  col-6 p-0">
						<input type="button" onclick='execDaumPostcode()' value="우편번호 찾기"
							class="btn btn-primary">
					</div>
					<div class="form-group d-xl-none d-lg-none col-6 p-0">
						<input type="button" onclick="openDaumZipAddress()"
							value="우편번호 찾기" class="btn btn-primary">
					</div>
				</div>
				<div id="wrap" class="form-group col-sm-5 col-md-5"
					style="display: none; width: 100%;"></div>
				<div class="form-group">
					<label for="address">주소</label> &nbsp; <span id="addressM"></span>
					<input type="text" id="address" placeholder="주소" name="address"
						class="form-control">
				</div>
				<div class="form-group">
					<label for="address2">상세주소</label>&nbsp; <span id="address2M"></span>
					<input type="text" id="address2" placeholder="상세주소" name="address2"
						class="form-control">
				</div>
				
				<button type="submit" id="school_search" class="btn btn-primary">
						회원가입
					</button>

			</form>
		</div>
	</div>




</body>
</html>