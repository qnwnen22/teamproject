/**
 * 썸네일 관련 자바스크립트
 */



$(function(){
$('#key1').change(function(e){
		var key1=document.getElementById("key1");
		var exp1= /^[a-z0-9]{4}$/;
		if(!exp1.test(key1.value)) {
			$("#key1").css("border", "2px solid red");
			$("#keyM").html("<b style='color:red'>쿠폰번호를 입력하세요.</b>");
			key1.val("");
			key1.focus();
			return false;
		}else {
			var input="<input id='key1Confirm' type='hidden' value='y'>";
			$("#key1").css("border", "2px solid #71c9ce");
			$("#keyM").html("<b style='color:#71c9ce'></b>"+input);
		}
});
$('#key2').change(function(e){
			var key2=document.getElementById("key2");
			var exp2= /^[a-z0-9]{4}$/;
			if(!exp2.test(key2.value)) {
				$("#key2").css("border", "2px solid red");
				$("#keyM").html("<b style='color:red'>쿠폰번호를 입력하세요.</b>");
				key2.val("");
				key2.focus();
				return false;
			}else {
				var input="<input id='key2Confirm' type='hidden' value='y'>";
				$("#key2").css("border", "2px solid #71c9ce");
				$("#keyM").html("<b style='color:#71c9ce'></b>"+input);
			}
});
$('#key3').change(function(e){
				var key3=document.getElementById("key3");
				var exp3= /^[a-z0-9]{4}$/;
				if(!exp3.test(key3.value)) {
					$("#key3").css("border", "2px solid red");
					$("#keyM").html("<b style='color:red'>쿠폰번호를 입력하세요.</b>");
					key3.val("");
					key3.focus();
					return false;
				}else {
					var input="<input id='key3Confirm' type='hidden' value='y'>";
					$("#key3").css("border", "2px solid #71c9ce");
					$("#keyM").html("<b style='color:#71c9ce'></b>"+input);
				}	
			 });

$('#coupon').change(function(e){
	var coupon=document.getElementById("coupon");
	var exp4= /^[a-z0-9]{4}$/;
	if(!exp4.test(key3.value)) {
		$("#coupon").css("border", "2px solid red");
		$("#keyM").html("<b style='color:red'>쿠폰번호를 입력하세요.</b>");
		key3.val("");
		key3.focus();
		return false;
	}else {
		var input="<input id='couponConfirm' type='hidden' value='y'>";
		$("#coupon").css("border", "2px solid #71c9ce");
		$("#keyM").html("<b style='color:#71c9ce'></b>"+input);
	}	
 });
$('#submit').click(function(e){
           if($('#key1Confirm').val()!="y") {
				$('#key1').focus();
				alert("빈칸이 있습니다.");
				return false;
			}
			if($('#key2Confirm').val()!="y") {
				$('#key2').focus();
				alert("빈칸이 있습니다.");
				return false;
			}
			if($('#key3Confirm').val()!="y") {
				$('#key3').focus();
				alert("빈칸이 있습니다.");
				return false;
			}
			if($('#couponConfirm').val()!="y") {
				$('#coupon').focus();
				alert("빈칸이 있습니다.");
				return false;
			}
			document.form1.submit();
		});


	});
