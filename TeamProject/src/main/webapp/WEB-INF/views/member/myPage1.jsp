<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
<head>
<title>나의 정보 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
<link rel="stylesheet" href="https://bootswatch.com/4/simplex/bootstrap.min.css"/>
  
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
  <style>
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #6ca0bd;
  cursor: pointer;
  border: 1px solid #b3d5e8;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.filebox label:hover {
  background-color: #b3d5e8;
}

.filebox label:active {
  background-color: #6ca0bd;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}

</style>
</head>
<body>
<hr>
<%-- <div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-3 col-sm-offset-9"><h4>${dto.username} 님 환영합니다. </h4></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
      <div class="text-center">    
       <c:choose>
		<c:when test="${empty dto.thumbnail}">
	   <div>
     	<img id ="profileImg" src = "http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail">
	   </div>
		</c:when>
		<c:otherwise>
	  <div>
	  <img id ="profileImg" src = "${path}/member/displayFile?fileName=${dto.thumbnail}" class="avatar img-circle img-thumbnail"  style = "height:200px;">
	  </div>
		</c:otherwise>
        </c:choose>
        <form name="form1" method="post" enctype="multipart/form-data" class="m-5">
        <div class="filebox">
          <label for="input_img">사진 업로드</label>
          <input type="file" class="text-center center-block file-upload" id="input_img">
          </div>
        </form>
      </div>

               
          <div class="panel panel-default">
            <div class="panel-heading">사용가능한 포인트<i class="fa fa-link fa-1x"></i></div>
            <div class="panel-body"><h6>현재 사용가능 포인트는<span style="color:blue;"> ${dto.point} </span>입니다.</h6>
            <hr>
            <h6><strong>아이디</strong> ${dto.userid}</h6>
            <h6><strong>이메일</strong> ${dto.useremail}</h6>

           </div>
          </div>

        </div><!--/col-3-->
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">내 정보수정</a></li>
                <li><a id="listButton1" data-toggle="tab" href="#order">구매목록</a></li>
                <!-- <li><a id="listButton2" data-toggle="tab" href="#cart">장바구니</a></li> -->
             </ul>

              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                  <form class="form" action="${path}/member/updateMember.do" method="post" onsubmit="return beforeSubmit()">
                      <div class="form-group">

                          <div class="col-xs-6">
                              <label for="name"><h6>이름</h6></label>
                              <input type="text" class="form-control" name="username" id="username" placeholder="name" value="${dto.username}">
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <div class="col-xs-6">
                            <label for="nickname"><h6>닉네임</h6></label>
                              <input type="text" class="form-control" name="nickname" id="nickname" placeholder="nickname">
                          </div>
                      </div>
                      <div class="form-group">
                        <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="password"><h6>비밀번호</h6></label>
                              <input type="password" class="form-control" name="bpasswd" id="bpasswd" placeholder="password" required="true">
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                            <label for="password2"><h6>비밀번호 확인</h6></label>
                              <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" required="true">
                              <span id="passwdCheckM"></span> 
                          </div>
                      </div>
                          
                          <div class="col-xs-12">
                              <label for="phone"><h6>전화번호</h6></label>
                              <input type="text" class="form-control" name="phone" id="phone" placeholder="000-0000-0000" value="${dto.phone}">
                              <span id="phoneM"></span> 
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-12">
                              <label for="birthday"><h6>생년월일</h6></label>
                              <input type="text" class="form-control" id="birthday" name="birthday" placeholder="0000년 00월 00일" value="${dto.birthday}">
                              <span id="birthdayM"></span>
                          </div>
                      </div>
                       <div class="form-group">
                          <div class="col-xs-6">
                              <label for="address"><h6>주소</h6></label>
                               <input type="text" class="form-control" name="address" id="address" value="${dto.address}">
                               </div>
                      </div>
          
                      <div class="form-group">
                          <div class="col-xs-6">
                             <label for="address2"><h6>상세주소</h6></label>
                              <input type="text" class="form-control" name="address2" id="address2" value="${dto.address2}">
                          </div>
                      </div>
                      
                    
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-sm btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i>&nbsp;저장하기</button>
                               	</div>
                      </div>
              	</form>
             </div><!--/tab-pane-->
              <div class="tab-pane" id="order">
   
                  <div id="listDiv"></div>

             </div><!--/tab-content-->
                <!--   <div class="tab-pane" id="cart">
                  <div id="list2Div"></div>
            </div>/tab-content -->

        </div><!--/col-9-->
    </div><!--/row-->
    </div>
    </div> --%>

<div class="container">
        <div class="row">
                <div class="col-md-12 col-xl-6">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title mb-4">
                            <div class="d-flex justify-content-start">
                                <div class="image-container">
                                       <c:choose>
		<c:when test="${empty dto.thumbnail}">
	   <div>
     	<img id ="profileImg" src = "http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar rounded-circle img-thumbnail">
	   </div>
		</c:when>
		<c:otherwise>
	  <div>
	  <img id ="profileImg" src = "${path}/member/displayFile?fileName=${dto.thumbnail}" class="avatar rounded-circle img-thumbnail"  style = "height:200px;">
	  </div>
		</c:otherwise>
        </c:choose>
<!--                                 
      <img src="http://placehold.it/150x150" id="imgProfile" style="width: 50px; height: 50px" class="img-thumbnail" />
                                    <div class="middle">
                                        <input type="button" class="btn btn-secondary" id="btnChangePicture" value="Change" />
                                        <input type="file" style="display: none;" id="profilePicture" name="file" />
                                    </div> -->
                                </div>
                                <div class="userData m-3">
                                    <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold"><a href="javascript:void(0);">${dto.username}</a> 님 환영합니다.</h2>
                                    <h6 class="d-block">회원님의 아이디는 <kbd><span style="color:white;">${dto.userid}</span></kbd>입니다.</h6>
                                    <h6 class="d-block">현재 사용가능 포인트</h6>
                                    <h6 class="d-block"><a href="javascript:void(0);">${dto.point}</a> Points</h6>
                                     <hr>
                                    <h6 class="d-block" style="font-size: 1rem; font-weight: bold">${dto.useremail}</h6>
           
           </div>
                                    
                                    
                                    
                                    
                                </div>
                                <div class="m-auto">
                                    <input type="button" class="btn btn-primary d-none" id="btnDiscard" value="Discard Changes" />
                                </div>
                            </div>
                        
                        </div>
                        </div>
                        </div>

                        <div class="col-md-12 col-xl-6">
                            <div class="card">
                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">내 정보수정</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="listButton" data-toggle="tab" href="#orderDetail" role="tab" aria-controls="orderDetail" aria-selected="false">강의 목록</a>
                                    </li>
                                </ul>
                                
                                
                  <div class="tab-content ml-1" id="myTabContent">
                     <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                    
                          <form class="form" action="${path}/member/updateMember.do" method="post" onsubmit="return beforeSubmit()">
                           <div class="form-group">

                             <div class="col-xs-6">
                              <label for="name"><h6>이름</h6></label>
                              <input type="text" class="form-control" name="username" id="username" placeholder="name" value="${dto.username}" disabled />
                          </div>
                      </div>
                      
                      <div class="form-group">

                             <div class="col-xs-6">
                              <label for="email"><h6>이름</h6></label>
                              <input type="email" class="form-control" name="useremail" id="useremail" placeholder="email" value="${dto.useremail}" disabled />
                          </div>
                      </div>
                      
                      <div class="form-group">
                          <div class="col-xs-6">
                            <label for="nickname"><h6>닉네임</h6></label>
                              <input type="text" class="form-control" name="nickname" id="nickname" placeholder="nickname" value="${dto.nickname}" oninput="checkNick()">
                              <span id="CheckNickM"></span>
                          </div>
                      </div>
                      <div class="form-group">
                        <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="password"><h6>비밀번호</h6></label>
                              <input type="password" class="form-control" name="bpasswd" id="bpasswd" placeholder="password" required="true">
                               <span id="bpasswdM"></span> 
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                            <label for="password2"><h6>비밀번호 확인</h6></label>
                              <input type="password" class="form-control" name="password2" id="password2" placeholder="password2" required="true">
                              <span id="passwdCheckM"></span> 
                          </div>
                      </div>
                          
                          <div class="col-xs-12">
                              <label for="phone"><h6>전화번호</h6></label>
                              <input type="text" class="form-control" name="phone" id="phone" placeholder="000-0000-0000" value="${dto.phone}">
                              <span id="phoneM"></span> 
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-12">
                              <label for="birthday"><h6>생년월일</h6></label>
                              <input type="text" class="form-control" id="birthday" name="birthday" placeholder="0000년 00월 00일" value="${dto.birthday}">
                              <span id="birthdayM"></span>
                          </div>
                      </div>
                       <div class="form-group">
                          <div class="col-xs-6">
                              <label for="address"><h6>주소</h6></label>
                               <input type="text" class="form-control" name="address" id="address" value="${dto.address}">
                               </div>
                      </div>
          
                      <div class="form-group">
                          <div class="col-xs-6">
                             <label for="address2"><h6>상세주소</h6></label>
                              <input type="text" class="form-control" name="address2" id="address2" value="${dto.address2}">
                          </div>
                      </div>
                      
                    
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-outline-dark" type="submit"><i class="glyphicon glyphicon-ok-sign"></i>&nbsp;저장하기</button>
                               	</div>
                      </div>
              	</form>
            
                    </div><!-- 내정보 -->

                   <div class="tab-pane fade" id="orderDetail" role="tabpanel" aria-labelledby="orderDetail-tab">
                                        <div id="listDiv" class="col-12"></div>
                                    </div>
                
                </div>
                
                
                
            </div>
        </div><!--  -->
        </div>
        </div>
   
</body>

  
<%@ include file="../include/footer.jsp"%> 
   
 <script>
 
$(function(){
	$("#listButton").click(function(){
		  $.ajax({
		          type: 'post'
		        , url: 'orderDetail.do'
		        , dataType : 'text'
		        , success: function(data) {
		        	$("#listDiv").html(data);
		          }
		  });	
	})		
}) 



$(document).ready(function(){
	$("#profileImg").click(function(){
		$("#input_img").click() ;
		})			
	}) 

var sel_file;

$(document).ready(function() {
    $("#input_img").on("change", fileChange);
});



function fileChange(e) {
	e.preventDefault();

	var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $(".avatar").attr("src", e.target.result);
        	$(".avatar").css("height", "200px")
        }
        reader.readAsDataURL(f);
    });

    var file = files[0]
    console.log(file)
    var formData = new FormData();

    formData.append("file", file);

		$.ajax({
    	url: '${path}/member/uploadAjax.do',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){

			alert("프로필 이미지가 변경 되었습니다.")

		  }
		})


 		function checkImageType(fileName){
 			var pattern = /jpg$|gif$|png$|jpeg$/i;
 			return fileName.match(pattern);
 		}


 		function getOriginalName(fileName){
 			if(checkImageType(fileName)){
 				return;
 			}

 			var idx = fileName.indexOf("_") + 1 ;
 			return fileName.substr(idx);

 		}


 		function getImageLink(fileName){

 			if(!checkImageType(fileName)){
 				return;
 			}
 			var front = fileName.substr(0,12);
 			var end = fileName.substr(14);

 			return front + end;

 		}

}


//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
var nickCheck = 0;
//아이디 체크하여 가입버튼 비활성화, 중복확인.
function checkNick() {
    var nickname = $('#nickname').val();
    $.ajax({
        data : {
       	 nickname : nickname
        },
        url : "${path}/member/checkNick.do",
        success : function(data) {
            if (data == '0') {
           	 nickCheck = 1;
                if(nickCheck==1) {
                    $(".nickname").css("border", "2px solid #71c9ce");
                    $("#nicknameM").html("<b style='color:#71c9ce'>사용할 수 있는 닉네임 입니다.</b>");
                    return false
                } 
            } else if(data == '1'){
                $(".nickname").css("border", "2px solid red");
                $("#nicknameM").html("<b style='color:red'>중복된 닉네임 입니다.</b>");
                nickCheck = 0;
                return false
            } else if(data == '2') {
    			$("#nicknameM").html("");
   			return false
               }     
        }
    });
}


$(function(){
	 $('#nickname').change(function(e){
			//아이디 체크
			var nickname =document.getElementById("nickname");
			if(nickname.value=="") {
				alert("닉에임은 필수 입력입니다.");
				nickname.focus();
				return false;
			}
			
			var exp2=/^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;//정규표현식
			if(!exp2.test(nickname.value)) {
				$("#nickname").css("border", "2px solid red");
				$("#CheckNickM").html("<b style='color:red'>닉네임은 글자 2~20자리로 입력하세요.</b>");
				nickname.val("");
				nickname.focus();
				return false;
			} else {
				var input="<input id='nicknameConfirm' type='hidden' value='y'>";
				$("#nickname").css("border", "2px solid gray");
				$("#CheckNickM").html("<b style='color:gray'><i class='fa fa-check spaceLeft'></i>사용할 수 있는 닉네임입니다</b>"+input);
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
			$("#bpasswd").css("border", "2px solid gray");
			$("#bpasswdM").html("<b style='color:gray'><i class='fa fa-check spaceLeft'></i>사용할 수 있는 비밀번호입니다</b>"+input);
		}
	 });
	 
	 $(function() {
			$('#bpasswd').keyup(function() {
				$('#passwdCheckM').text('');
			}); //#user_pass.keyup

			$('#password2').keyup(function() {
				if ($('#bpasswd').val() != $('#password2').val()) {
					$("#password2").css("border", "2px solid red");
					$('#passwdCheckM').html("<b style='color:red'>암호가 일치하지 않습니다.</b>");
				} else {
					$("#password2").css("border", "2px solid gray");
					$('#passwdCheckM').html("<b style='color:gray'><i class='fa fa-check spaceLeft'>암호가 일치합니다</i></b>");
				}
			}); 
		});

         $('#phone').change(function(e){
	 		var phone = document.getElementById("phone");
	 		var exp=/^[0-9]{3,}-[0-9]{3,4}-[0-9]{3,4}$/;
	 		if(!phone.value.match(exp)) {
	 			$("#phone").css("border", "2px solid red");
	 			$("#phoneM").html("<b style='color:red'>핸드폰번호는 ***-****-****형식으로  입력하세요.</b>");
	 			phone.focus();
	 			return false;
	 		}else {
	 			$("#phone").css("border", "2px solid gray");
	 			$("#phoneM").html("<b style='color:gray'><i class='fa fa-check spaceLeft'>입력되었습니다.</i></b>");
	 		}	
	 	 });	
	 	 
	 	 $('#birthday').change(function(e){
	 		var birthday = document.getElementById("birthday");
	 		var exp=/^[0-9]{4,}-[0-9]{2,}-[0-9]{2,}$/;
	 		if(!birthday.value.match(exp)) {
	 			$("#birthday").css("border", "2px solid red");
	 			$("#birthdayM").html("<b style='color:red'>생년월일은 ****-**-**형식으로 입력하세요.</b>");
	 			birthday.focus();
	 			return false;
	 		}else {
	 			$("#birthday").css("border", "2px solid gray");
	 			$("#birthdayM").html("<b style='color:gray'><i class='fa fa-check spaceLeft'>입력되었습니다.</i></b>");
	 		}
	 	 });
});


function beforeSubmit() {
	if ($('#passwdCheckM').text() == "암호가 일치합니다") {
		return true;
	} else {
		alert("암호가 일치하지 않습니다! 확인해주세요!")
		return false;
	}


	

}

$(document).ready(function () {
    $imgSrc = $('#imgProfile').attr('src');
    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imgProfile').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    $('#btnChangePicture').on('click', function () {
        // document.getElementById('profilePicture').click();
        if (!$('#btnChangePicture').hasClass('changing')) {
            $('#profilePicture').click();
        }
        else {
            // change
        }
    });
    $('#profilePicture').on('change', function () {
        readURL(this);
        $('#btnChangePicture').addClass('changing');
        $('#btnChangePicture').attr('value', 'Confirm');
        $('#btnDiscard').removeClass('d-none');
        // $('#imgProfile').attr('src', '');
    });
    $('#btnDiscard').on('click', function () {
        // if ($('#btnDiscard').hasClass('d-none')) {
        $('#btnChangePicture').removeClass('changing');
        $('#btnChangePicture').attr('value', 'Change');
        $('#btnDiscard').addClass('d-none');
        $('#imgProfile').attr('src', $imgSrc);
        $('#profilePicture').val('');
        // }
    });
});
</script>
                  
</html>