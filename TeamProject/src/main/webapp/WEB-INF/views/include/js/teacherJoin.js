function insertTeacher() {
	/*alert("insertTeacher() 실행");*/
	//개인정보
	var thumbnailFile=document.getElementById("input_img");
	var userid=document.getElementById("userid");
	var username=document.getElementById("username");
	//학력
	var finalEducation=document.getElementById("finalEducation");
	//고등학교
//	var highStart=document.getElementById("highStart");
//	var hignEnd=document.getElementById("hignEnd");
//	var highSchool=document.getElementById("highSchool");
//	//대학교
//	var uniStart=document.getElementById("uniStart");
//	var uniEnd=document.getElementById("uniEnd");
//	var university=document.getElementById("university");
//	var department=document.getElementById("department");
	//자격증
	var spec1=document.getElementById("spec1");
	var spec1_y=document.getElementById("spec1_y");
	var spec1_m=document.getElementById("spec1_m");
	var spec1_d=document.getElementById("spec1_d");
	var spec1File=document.getElementById("spec1File");
	//자격증 2~5까지는 보류
	var spec2=document.getElementById("spec2");
	var spec2_y=document.getElementById("spec2_y");
	var spec2_m=document.getElementById("spec2_m");
	var spec2_d=document.getElementById("spec2_d");
	var spec2File=document.getElementById("spec2File");

	var spec3=document.getElementById("spec3");
	var spec3_y=document.getElementById("spec3_y");
	var spec3_m=document.getElementById("spec3_m");
	var spec3_d=document.getElementById("spec3_d");
	var spec3File=document.getElementById("spec3File");

	var spec4=document.getElementById("spec4");
	var spec4_y=document.getElementById("spec4_y");
	var spec4_m=document.getElementById("spec4_m");
	var spec4_d=document.getElementById("spec4_d");
	var spec4File=document.getElementById("spec4File");

	var spec5=document.getElementById("spec5");
	var spec5_y=document.getElementById("spec5_y");
	var spec5_m=document.getElementById("spec5_m");
	var spec5_d=document.getElementById("spec5_d");
	var spec5File=document.getElementById("spec5File");

	var career=document.getElementById("career");
	
	
	if(thumbnailFile.value==''){
		alert("프로필 사진을 등록해주세요.");
		thumbnailFile.focus();
		return false;
	}
	if(userid.value==''){
		alert("로그인이 되어있지 않습니다\n로그인 후 다시 시도해 주세요.");
		return false;
	}if(username.value==''){
		alert("로그인이 되어있지 않습니다\n로그인 후 다시 시도해 주세요.");
		return false;
	}	
	if(finalEducation.value==''){
		var check=confirm('최종학력을 등록하지 않았습니다.\n이대로 진행하시겠습니까?');
		if(!check){
			finalEducation.focus();
			return false;
		}
		finalEducation.focus();
		alert("최종학력을 입력하세요.");
		return false;
	}
	if(spec1.value==''){
		var check=confirm('자격증을 등록하지 않았습니다.\n이대로 진행하시겠습니까?');
		if(!check){
			spec1.focus();
			return false;
		}
	}else if(!spec1.value==''){
		if(spec1_y.value==''){
			spec1_y.focus();
			alert("취득날짜를 입력해주세요");
			return false;
		}if(spec1_m.value==''){
			spec1_m.focus();
			alert("취득날짜를 입력해주세요");
			return false;
		}if(spec1_d.value==''){
			spec1_d.focus();
			alert("취득날짜를 입력해주세요");
			return false;
		}if(spec1File.value==''){
			spec1File.focus();
			alert("자격증 이미지를 등록해주세요.");
			return false;
		}
	}
	
		
	if(career.value==''){
		var check=confirm("경력사항을 입력하지 않았습니다.\n이대로 진행하시겠습니까?");
		if(!check){
			career.focus();
			return false;
		}
	}
	alert("강사 등록");
	if (socket.readyState !== 1)return;
	console.log(socket);
	let sender= $('input#userid').val();
	let admin = 'admin';
	// websocket에 보내기!! (reply,신청자,관리자)
	socket.send("teaching," + sender + "," + admin);
	document.form1.submit();
}

var count=1;

function addSpec(){
	var addSpecDiv = document.getElementById("addSpecDiv");
	var str = "";
	
	if(count<5){
		
		str += "<div class='row mt-4'><label for=spec"+(count+1)+" class='control-label col-4 text-left'><h6>자&nbsp;격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;증&nbsp;명"+(count+1)+"</h6> </label>";//&nbsp;&nbsp;&nbsp; 
		str += "<span class='col-8 '><div class=' input-group'><input class='  form-control '  placeholder='(기능 미구현)' type='text' name='spec"+(count+1)+"' id='spec"+(count+1)+"'>"
		str += "<span class='input-group-addon' id='basic-addon3'><input type='button' value='검색' class='btn btn-outline-dark ml-1'><span></span></div></div>";
		
		str += "<div class='row mt-3'><label for='spec"+(count+1)+"_date' class='control-label col-4 text-left'><h6>취&nbsp;득&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일&nbsp;자</h6> </label>";
		str += "<span class='col-8 '><div class='row'><select class='col-3 form-control ml-3 input-sm' name='spec"+(count+1)+"_y' id='spec"+(count+1)+"_y'></span>";
		str += "<option  value='-'>--</option>";
		for(var i=2020; i>=1900; i--){
			str += "<option value='"+i+"'>"+i+"</option>";
		}
		str += "</select><h6 class='mt-3 '>년</h6>";
		
		str += "<select class='col-3 form-control ml-3 input-sm' name='spec"+(count+1)+"_m' id='spec"+(count+1)+"_m'>";
		str += "<option value='-'>--</option>";
		for(var i=1; i<=12; i++){
			str += "<option value='"+i+"'>"+i+"</option>";
		}
		str += "</select><h6 class='mt-3 '>월</h6>";
		
		str += "<select class='col-3 form-control ml-3 input-sm' name='spec"+(count+1)+"_d' id='spec"+(count+1)+"_d'>";
		str += "<option value='-'>--</option>";
		for(var i=1; i<=30; i++){
			str += "<option value='"+i+"'>"+i+"</option>";
		}
		str += "</select><h6 class='mt-3 '>일</h6></div></div>";
		
		str += "<div class='row mt-3'><label class='col-4 text-left' for='spec"+(count+1)+"File'><h6>자&nbsp;격&nbsp;&nbsp;증&nbsp;&nbsp;사&nbsp;진</h6></label>";		
		str += "<div class='col-8 '><input class='text-secondary' type='file' name='spec"+(count+1)+"File' id='spec"+(count+1)+"File'></div></div>";
		str += "<hr>";
		
		var addedDiv = document.createElement("div");
		addedDiv.id = "added"+(count+1);
		addedDiv.style.border = "1px soild black";
		addedDiv.innerHTML = str;
		addSpecDiv.appendChild(addedDiv);
		count++;
	}else {
		alert("자격증은 최대 5개까지 등록이 가능합니다.");
	}
}

function deleteSpec() {
	var addSpecDiv = document.getElementById("addSpecDiv");
	var addedDiv = document.getElementById("added"+count);
	if(count > 1){
		addSpecDiv.removeChild(addedDiv);
		count--;
	}else {
		alert("더 이상 지울수 없습니다.");
	}
}



