<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
<style type="text/css">

</style>
</head>

<body>
<p>
<h2>나의페이지</h2>

<script>
 $(document).ready(function(){
	$("#profileImg").click(function(){
		$("#input_img").click() ;
		})			
	}) 

</script>


<script>
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
        	$("#profileImg").css("height", "100px")
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

<c:choose>
			 	<c:when test="${empty dto.thumbnail}">
				<div>
					<img id ="profileImg" src = "" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
				</div>
				</c:when>
				<c:otherwise>
				<div>
					<img id ="profileImg" src = "${path}/member/displayFile?fileName=${dto.thumbnail}" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
				</div>
				</c:otherwise>
</c:choose>
<form name="form1" method="post" enctype="multipart/form-data" >
		<table>
			<tr>
				<td><input class="file" type="file" name="file" id="input_img"></td>
			</tr>	
		</table>
	</form> 

<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" >
회원정보 수정
</button>

<!-- 비밀번호 확인 모달 -->
<div class="container">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
   style ="margin-left: 500px; height:400px; width:700px;">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title pull-left" id="myModalLabel">비밀번호 확인</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
</div>

<div class="modal-body">
         <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 offset-xl-2 offset-lg-2 joinForm">
			<form method="post" id="passForm" name="passForm" action="${path}/member/check.do" class="form-horizontal">
				<div class="form-group">
					<!-- <label for="userid">아이디</label> -->
					<input type="hidden" class="form-control" id="userid" name="userid" value="${dto.userid}">		
				</div>
				<div class="form-group">
					<label for="passwd">비밀번호를 입력하세요</label>
					<input type="password" class="form-control" id="passwd" name="passwd">
				</div>

         
</div>
<div class="modal-footer">
<div class="form-group">
<button type="submit" id="submit" class="btn btn-danger">확인</button>
<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
</div>
</div>
	</form>
		</div>

</div>
</div>
</div>
</div>
</body>
</html>

