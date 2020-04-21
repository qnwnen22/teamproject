<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>


<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-11 offset-sm-1 text-left"><h4>${dto.username} 님 환영합니다. </h4></div>
      <div class="text-center col-sm-6"><br><br>    
 <c:choose>
		<c:when test="${empty dto.thumbnail}">
	<div>
	<img id ="profileImg" src = "http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" style = "height:200px;">
	</div>
		</c:when>
		<c:otherwise>
	<div>
	<img id ="profileImg" src = "${path}/member/displayFile?fileName=${dto.thumbnail}" class="avatar img-circle img-thumbnail" style = "height:200px;">
	</div>
		</c:otherwise>
</c:choose>
        <form name="form1" method="post" enctype="multipart/form-data" class="text-center m-2">
        <input type="file" class="text-center center-block file-upload" id="input_img">
        </form>
         <div class="panel panel-default text-center">
          <div class="panel-heading m-2"></div>
          <div class="panel-body"><h6>현재 사용가능 포인트는<span style="color:blue;"> ${dto.point} </span>입니다.</h6>
           </div>
        </div>
      </div>
  		<div class="col-sm-6 text-right"><!--left col-->         
          <table class="table text-right" >
			<tr class="row" align="center">
			<th class="col-4">아이디</th><td class="col-8">${dto.userid}</td>
			<tr class="row" align="center">
			<th class="col-4">이메일</th><td class="col-8">${dto.useremail}</td>
			<tr class="row" align="center">
			<th class="col-4">이   름</th><td class="col-8">${dto.username}</td>
			<tr class="row" align="center">
			<th class="col-4">닉네임</th><td class="col-8">${dto.userid}</td>
			<tr class="row" align="center">
			<th class="col-4">전화번호</th><td class="col-8">${dto.phone}</td>
			<tr class="row" align="center">
			<th class="col-4">생년생일</th><td class="col-8">${dto.birthday}</td>
			<tr class="row" align="center">
			<th class="col-4">상세주소</th><td class="col-8">${dto.address} ${dto.address2} </td>
		  </tr>
	      </table>             
    </div>
    <div class="col-sm-6"><!--right col-->   
        </div><!--/col-9-->
    </div><!--/row-->  
    <div class="row">
    <div class="col-sm-12 m-3 text-center">
  		<button class="btn btn-outline-danger" data-gacategory="header" data-toggle="modal" data-target="#myModal"><b>회원정보수정</b></button>
    </div>
</div>
</div>


<script> 

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
            $("#profileImg").attr("src", e.target.result);
        	$("#profileImg").css("height", "200px")
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

</script>  
  
<%@ include file="../include/footer.jsp"%> 

<!-- 비밀번호 확인 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center">KDEMY PASSWORD</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" id="passForm" name="passForm" action="${path}/member/check.do" class="form-horizontal">
				
				<div class="form-group form-group-lg pt-2 pb-1">
				<!-- <label for="userid">아이디</label> -->
				<input type="hidden" class="form-control" id="userid" name="userid" value="${dto.userid}">		
				    </div>
				<div class="form-group form-group-lg pt-2 pb-1">
				    <label for="passwd">비밀번호를 입력하세요</label>
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요." required>
					</div>
				<div class="form-group form-group-lg pt-2 pb-1" style="text-align:center;">
					<button type="submit" id="submit" class="btn btn-outline-danger">확인</button>
                    <button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button>
				</div>
				<div class="textBox"><p id="text" style="color:red;"></p></div>

       </form>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>

 

 </body>
 

</html>

