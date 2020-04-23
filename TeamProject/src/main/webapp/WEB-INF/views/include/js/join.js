$(function(){
	// 회원 가입 처리	 


	 $('#username').change(function(e){
		//이름 체크
		 var name = document.getElementById("username");

		//\x20: 16진수 20=> 10진수 32, (스페이스 1개인 공객문자를 의미) 
		var exp2= /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2,10}$/;
		if(!exp2.test(name.value)){
			$("#username").css("border", "2px solid red");
			$("#usernameM").html("<b style='color:red'>이름은 한글 2~10자 이내로 입력하세요.</b>");
			name.value="";
			name.focus();
			return false;
		}else {
			var input="<input id='usernameConfirm' type='hidden' value='y'>";
			$("#username").css("border", "2px solid #71c9ce");
			$("#usernameM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
		}	
	 });
	 $('#userid').change(function(e){
		//아이디 체크
		var userid =document.getElementById("userid");
		if(userid.value=="") {
			alert("아이디는 필수 입력입니다.");
			userid.focus();
			return false;
		}
		
		//^시작, $끝, {4,10}글자수 지정
		var exp1=/^[A-Za-z0-9]{4,10}$/;//정규표현식
		//정규표현식.test(검사할 문자열) - 규칙에 맞으면 true, 틀리면 false
		if(!exp1.test(userid.value)) {
			$("#userid").css("border", "2px solid red");
			$("#CheckM").html("<b style='color:red'>아이디는 영문자,숫자 4~10자리로 입력하세요.</b>");
			userid.val("");
			userid.focus();
			return false;
		} else {
			var input="<input id='useridConfirm' type='hidden' value='y'>";
			$("#CheckM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
			//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
			//아이디 체크하여 가입버튼 비활성화, 중복확인.
		}			
	 });
	 $('#bpasswd').change(function(e){
		//비밀번호 체크
		var bpasswd =document.getElementById("bpasswd");
		var exppwd=/^(?=.*[a-zA-Z]{1,16})(?=.*[!@#$%^*+=-]{1,16})(?=.*[0-9]{1,16}).{8,16}$/;
		if(!exppwd.test(bpasswd.value)){
			$("#bpasswd").css("border", "2px solid red");
			$("#bpasswdM").html("<b style='color:red'>숫자, 영문자, 특수문자 조합으로 8~16자리를 사용해야 합니다.</b>");
			password.value="";
			password.focus();
			return false;
		}else {
			var input="<input id='bpasswdConfirm' type='hidden' value='y'>";
			$("#bpasswd").css("border", "2px solid #71c9ce");
			$("#bpasswdM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
		}
	 });
	 
	 $('#passwdCheck').change(function(e){
		 var passwordcheck=document.getElementById("passwdCheck");
		if(bpasswd.value != userid)
			if(bpasswd.value != passwordcheck.value) {
				$("#passwdCheck").css("border", "2px solid red");
				$("#passwdCheckM").html("<b style='color:red'>비밀번호가 일치하지 않습니다.</b>");
				passwordcheck.value="";
				passwordcheck.focus();
				return false;
			}else {
				var input="<input id='passwdCheckConfirm' type='hidden' value='y'>";
				$("#passwdCheck").css("border", "2px solid #71c9ce");
				$("#passwdCheckM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
			}
	 });
	 
	 $('#useremail').change(function(e){
		//이메일 체크
		var email=document.getElementById("useremail");
		var exp3= /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
		if(!exp3.test(email.value)) {
			$("#useremail").css("border", "2px solid red");
			$("#useremailM").html("<b style='color:red'>이메일 형식이 잘못 되었습니다. ex) abc@abc.com</b>");
			email.val("");
			email.focus();
			return false;
		}else {
			var input="<input id='useremailConfirm' type='hidden' value='y'>";
			$("#useremail").css("border", "2px solid #71c9ce");
			$("#useremailM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
		}
		
	 });
	 $('#phone1').change(function(e){
		 $("#phone1").css("border", "2px solid #71c9ce");
	 });
	
	 $('#phone2').change(function(e){
	     //전화번호 체크
		var phone2 = document.getElementById("phone2");
		var exp=/^[0-9]{4,}$/;
		if(!phone2.value.match(exp)) {
			$("#phone2").css("border", "2px solid red");
			$("#phoneM").html("<b style='color:red'>핸드폰번호는 숫자 4자리 입력하세요.</b>");
			phone2.focus();
			return false;
		}else {
			$("#phone2").css("border", "2px solid #71c9ce");
		}
	 });
	 
	 $('#phone3').change(function(e){
		var phone3 = document.getElementById("phone3");
		var exp=/^[0-9]{4,}$/;
		if(!phone3.value.match(exp)) {
			$("#phone3").css("border", "2px solid red");
			$("#phoneM").html("<b style='color:red'>핸드폰번호는 숫자 4자리 입력하세요.</b>");
			phone3.focus();
			return false;
		}else {
			var input="<input id='phone3Confirm' type='hidden' value='y'>";
			$("#phone3").css("border", "2px solid #71c9ce");
			$("#phoneM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
		}	
	 });	
	 
	 $('#birthday1').change(function(e){
		var birthday1 = document.getElementById("birthday1");
		var exp=/^[0-9]{4,}$/;
		if(!birthday1.value.match(exp)) {
			$("#birthday1").css("border", "2px solid red");
			$("#birthdayM").html("<b style='color:red'>년도는 숫자 4자리 입력하세요.</b>");
			birthday1.focus();
			return false;
		}else {
			$("#birthday1").css("border", "2px solid #71c9ce");
		}
	 });
	 
	 $('#birthday2').change(function(e){
		 $("#birthday2").css("border", "2px solid #71c9ce");
	 });
	 
	 $('#birthday3').change(function(e){
		var birthday3 = document.getElementById("birthday3");
		var exp=/^[0-9]{2,}$/;
		if(!birthday3.value.match(exp)) {
			$("#birthday3").css("border", "2px solid red");
			$("#birthdayM").html("<b style='color:red'>일은 숫자 2자리 입력하세요.</b>");
			birthday3.focus();
			return false;
		}else {
			var input="<input id='birthday3Confirm' type='hidden' value='y'>";
			$("#birthday3").css("border", "2px solid #71c9ce");
			$("#birthdayM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
		}
	 });
	 $('#postcode').change(function(e){
		var postcode =document.getElementById("postcode");
		if(postcode.value=="") {
			$("#postcode").css("border", "2px solid red");
			$("#postcodeM").html("<b style='color:red'>우편번호는 필수 입력입니다.</b>");
			postcode.focus();
			return false;
		}
	 });
	 
	 $('#address').change(function(e){
		var address =document.getElementById("address");
		if(address.value=="") {
			$("#address").css("border", "2px solid red");
			$("#addressM").html("<b style='color:red'>주소는 필수 입력입니다.</b>");
			address.focus();
			return false;
		}	
	 });
	 
	 $('#address2').change(function(e){
		var address2 =document.getElementById("address2");
		if(address2.value=="") {
			$("#address2").css("border", "2px solid red");
			$("#address2M").html("<b style='color:red'>상세주소는 필수 입력입니다.</b>");
			address2.focus();
			return false;
		}else {
			var input="<input id='address2Confirm' type='hidden' value='y'>";
			$("#address2").css("border", "2px solid #71c9ce");
			$("#address2M").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
		}
	 });
	 
	$('#join-submit').click(function(e){
		if($('#usernameConfirm').val()!="y") {
			$('#username').focus();
			alert("이름을 입력하세요");
			return false;
		}
		if($('#useridConfirm').val()!="y") {
			$('#userid').focus();
			alert("아이디를 입력하세요");
			return false;
		}
		if($('#bpasswdConfirm').val()!="y") {
			$('#bpasswd').focus();
			alert("3");
			return false;
		}
		if($('#passwdCheckConfirm').val()!="y") {
			$('#passwdCheck').focus();
			alert("4");
			return false;
		}
		if($('#useremailConfirm').val()!="y") {
			$('#useremail').focus();
			alert("5");
			return false;
		}
		if($('#phone3Confirm').val()!="y") {
			$('#phone3').focus();
			alert("6");
			return false;
		}
		if($('#birthday3Confirm').val()!="y") {
			$('birthday3').focus();
			alert("7");
			return false;
		}
		if($('#postcodeConfirm').val()!="y") {
			$('postcode').focus();
			alert("8");
			return false;
		}
		if($('#addressConfirm').val()!="y") {
			$('address').focus();
			alert("9");
			return false;
		}
		if($('#address2Confirm').val()!="y") {
			$('address2').focus();
			return false;
		}
		
		if($('#provisionYn:checked').val()=="N"){
			alert("회원가입약관에 동의하여 주시기 바랍니다."); 
			return false;
		}

		//개인정보취급방침
		if($('#memberInfoYn:checked').val()=="N"){
			alert("개인정보취급방침에 동의하여 주시기 바랍니다.");
			return false;
		}
		document.join_form.submit();
	});


});
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType === 'R'){
				//법정동명이 있을 경우 추가한다.
				if(data.bname !== ''){
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName !== ''){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('address').value = fullAddr;
			var input="<input id='postcodeConfirm' type='hidden' value='y'>";
			var input2="<input id='addressConfirm' type='hidden' value='y'>";
			$("#postcode").css("border", "2px solid #71c9ce");
			$("#postcodeM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
			$("#address").css("border", "2px solid #71c9ce");
			$("#addressM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input2);

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('address2').focus();
		}
	}).open();
}


function openDaumZipAddress() {

	// 우편번호 찾기 화면을 넣을 element를 지정
	var element_wrap = document.getElementById("wrap");

	// wrap 레이어가 off된 상태라면 다음 우편번호 레이어를 open 한다.
	if(jQuery("#wrap").css("display") == "none") {
		new daum.Postcode({
			oncomplete:function(data) {
				jQuery("#postcode").val(data.zonecode);
				jQuery("#address").val(data.address);
				jQuery("#address2").focus();
				console.log(data);
			},
			onresize : function(size) {
				element_wrap.style.height = size.height+'px';
			},
			width : '100%',
			height : '470px',

			// 사용자가 값을 주소를 선택해서 레이어를 닫을 경우
			// 다음 주소록 레이어를 완전히 종료 시킨다.
			onclose:function(state) {
				if(state === "COMPLETE_CLOSE") {

					// 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
					offDaumZipAddress(function() {
						element_wrap.style.display = "none";
					});
				}
			}
		}).embed(element_wrap);

		// 슬라이드 다운 기능을 이용해 레이어 창을 오픈한다.
		jQuery("#wrap").slideDown();
	}

	// warp 레이어가 open된 상태라면 다음 우편번호 레이어를 off 상태로 변경한다.
	else {

		// 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
		offDaumZipAddress(function() {
			element_wrap.style.display = "none";
			return false;
		});
	}
}

function offDaumZipAddress() {
	// 슬라이드 업 기능을 이용해 레이어 창을 닫는다.
	jQuery("#wrap").slideUp();

}