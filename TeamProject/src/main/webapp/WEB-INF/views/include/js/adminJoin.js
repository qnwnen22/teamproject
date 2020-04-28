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
	
	 $('#phone').change(function(e){
		var phone = document.getElementById("phone");
		var exp=/^[0-9]{10,11}$/;
		if(!phone.value.match(exp)) {
			$("#phone").css("border", "2px solid red");
			$("#phoneM").html("<b style='color:red'>핸드폰번호는 숫자 10~11자리 입력하세요.</b>");
			phone3.focus();
			return false;
		}else {
			var input="<input id='phoneConfirm' type='hidden' value='y'>";
			$("#phone").css("border", "2px solid #71c9ce");
			$("#phoneM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'></i></b>"+input);
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
			alert("비밀번호를 확인해주세요");
			return false;
		}
		if($('#passwdCheckConfirm').val()!="y") {
			$('#passwdCheck').focus();
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if($('#useremailConfirm').val()!="y") {
			$('#useremail').focus();
			alert("이메일 형식이 일치하지 않습니다.");
			return false;
		}
		if($('#phoneConfirm').val()!="y") {
			$('#phone').focus();
			alert("연락처 형식이 일치하지 않습니다.");
			return false;
		}
		document.join_form.submit();
	});
});