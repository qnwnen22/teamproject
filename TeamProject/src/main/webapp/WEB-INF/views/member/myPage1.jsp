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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>


<hr>
<div class="container bootstrap snippet">
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
        <form name="form1" method="post" enctype="multipart/form-data" >
        <input type="file" class="text-center center-block file-upload" id="input_img">
        </form>
      </div></hr><br>

               
          <div class="panel panel-default">
            <div class="panel-heading">사용가능한 포인트<i class="fa fa-link fa-1x"></i></div>
            <div class="panel-body"><h6>현재 사용가능 포인트는<span style="color:blue;"> ${dto.point} </span>입니다.</h6>
            <hr>
            <h6><strong>아이디</strong> ${dto.userid}</h6>
            <h6><strong>이메일</strong> ${dto.useremail}</h6>

           </div>
          </div>
          
<%--          <ul class="list-group">
            <li class="list-group-item text-muted">나의 정보 <i class="fa fa-dashboard fa-1x"></i></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>아이디</strong></span>${dto.userid}</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>이메일</strong></span>${dto.useremail}</li>
          </ul> 
                --%>
<!--           <div class="panel panel-default">
            <div class="panel-heading">즐겨찾기</div>
            <div class="panel-body">
            	<i class="fa fa-facebook fa-2x"></i> <i class="fa fa-github fa-2x"></i> <i class="fa fa-twitter fa-2x"></i> <i class="fa fa-pinterest fa-2x"></i> <i class="fa fa-google-plus fa-2x"></i>
            </div>
          </div> -->
          
        </div><!--/col-3-->
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">내 정보수정</a></li>
                <li><a id="listButton" data-toggle="tab" href="#settings">강의목록</a></li>

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
                              	<button class="btn btn-lg btn-success pull-right" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                               	</div>
                      </div>
              	</form>
              
             </div><!--/tab-pane-->   
              <hr>
              
              <div class="tab-pane" id="settings">
        <hr>
                  <div id="list2Div"></div>
                  <hr>
                  <div id="listDiv"></div>
                  
                  
                  
             </div>
             
             </div><!--/tab-content-->
        </div><!--/col-9-->
    </div><!--/row-->
    </div>

<br><br><br><br><br><br><br><br>
 <%@ include file="../include/footer.jsp"%>   
 <script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>                               
</body>
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

$(function(){
	$("#listButton").click(function(){
		  $.ajax({
		          type: 'post'
		        , url: 'cartPage.do'
		        , dataType : 'text'
		        , success: function(data) {
		        	$("#list2Div").html(data);
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



$(function(){

         $('#phone').change(function(e){
	 		var phone = document.getElementById("phone");
	 		var exp=/^[0-9]{3,}-[0-9]{3,4}-[0-9]{3,4}$/;
	 		if(!phone.value.match(exp)) {
	 			$("#phone").css("border", "2px solid red");
	 			$("#phoneM").html("<b style='color:red'>핸드폰번호는 ***-****-****형식으로  입력하세요.</b>");
	 			phone.focus();
	 			return false;
	 		}else {
	 			$("#phone").css("border", "2px solid #71c9ce");
	 			$("#phoneM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'>입력되었습니다.</i></b>");
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
	 			$("#birthday").css("border", "2px solid #71c9ce");
	 			$("#birthdayM").html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'>입력되었습니다.</i></b>");
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
$(function() {
	$('#bpasswd').keyup(function() {
		$('#passwdCheckM').text('');
	}); //#user_pass.keyup

	$('#password2').keyup(function() {
		if ($('#bpasswd').val() != $('#password2').val()) {
			$("#password2").css("border", "2px solid red");
			$('#passwdCheckM').html("<b style='color:red'>암호가 일치하지 않습니다.</b>");
		} else {
			$("#password2").css("border", "2px solid #71c9ce");
			$('#passwdCheckM').html("<b style='color:#71c9ce'><i class='fa fa-check spaceLeft'>암호가 일치합니다</i></b>");
		}
	}); 
});

</script>


</html>