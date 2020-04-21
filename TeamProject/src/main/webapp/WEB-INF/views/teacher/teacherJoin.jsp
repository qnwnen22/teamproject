<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
<script src="${path}/include/js/teacherJoin.js"></script>
<script type="text/javascript">
function nicknameC(){
	var nickname = $("#nickname").val();
	
	$.ajax({
		url : "${path}/teacher/nicknameC.do?nickname="+nickname,
		type : "get",
		success : function(data){
			if(data=='1'){
				$("#nicknameC").html("<a style='color: red;'>중복된 아이디 입니다</a>");
				$("#nicknameC_result").val('1');
			}else {
				$("#nicknameC").html("<a style='color: blue;'>사용 가능한 아이디 입니다</a>");
				$("#nicknameC_result").val('0');
			}
		}
	});
}
</script>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
<a href="${path}/chatroom/room">채팅방만들기</a>
<a href="${path}/chatroom/chatRoomList.do">채팅방리스트이동</a>
<a href="${path}/chatroom/chatTest.do">채팅테스트이동</a>
<h2>전문가 등록 페이지</h2>
<c:choose>
	<c:when test="${sessionScope.teacher == 'n'}">
		<form method="post"
			name="form1" id="form1"
			enctype="multipart/form-data"
			action="${path}/teacher/teacherInsert.do">
			<div style="width: 100%; height: auto; border: 1px solid black">
				<!-- 개인정보 -->
				<div style="border: 1px solid; height: 350px;">
					<h3>개인정보</h3>
					<hr>
					<div style="float: left; width: 30%;">
						<c:choose>
					 		<c:when test="${empty dto.main_img}">
			     	 			<div><img id ="profileImg" src ="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail"></div>
					 		</c:when>
			        	</c:choose>
						프로필 사진 등록 : <input class="text-center center-block file-upload" type="file" name="thumbnailFile" id="input_img"><br>
					</div>
					
					<div style="float: right; width: 70%">
						아이디 : <input type="hidden" value="${sessionScope.userid}" readonly name="userid" id="userid">${sessionScope.userid}<br>
						이름 : <input type="hidden" value="${sessionScope.username}" readonly name="username" id="username">${sessionScope.username}<br>
						닉네임 : <input type="text" name="nickname" id="nickname" onchange="nicknameC()">
						<span id="nicknameC" name="nicknameC"></span>
						<input type="hidden" name="nicknameC_result" id="nicknameC_result" value="1">
					</div>
				</div>
				<!-- 학력 -->
				<div style="border: 1px solid; height: 250px;">
					<h3>학력</h3>
					<hr>
					<div>
						<table>
							<tr>						
								<td>
								<label for="finalEducation">최종 학력</label>
									<select id="finalEducation" name="finalEducation">
										<option value=""  selected>-학력 선택-</option>
										<option value="고등학교 졸업">고등학교 졸업</option>
										<option value="대학교(2,3년) 졸업">대학교(2,3년제) 졸업</option>
										<option value="대학교 졸업">대학교(4년제) 졸업</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<label for="schoolName">학교 이름 : </label>
									<input type="text" name="schoolName"><input type="button" value="학교 검색(미구현)"><br>
									<label for="department">전공</label>
									<input type="text" name="department">
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- 자격증 등록 -->
				<div style="border: 1px solid; height: auto;">
					<h3>자격증</h3>
					<hr>
					<table name="specTable" id="specTable">
						<tr>
							<td>
								<div>
								<label for="spec1" class="control-label"> 자격증(1) 이름 : </label>
								<input type="text" class="from-control" name="spec1" id="spec1">
								<input type="button" value="자격증 검색(기능 미구현)"><br>
							 	
							 	<label for="spec1_date" class="control-label"> 취득일자 : </label>
							 	<span id="spec1_date">
							 	<select name="spec1_y" id="spec1_y">
									<option value="">--</option>
									<%for(int i=2020; i>=1900; i--){ %>
										<option value="<%=i%>"><%=i %></option>
									<%} %>
								</select>년
								<select name="spec1_m" id="spec1_m">
									<option value="">--</option>
									<%for(int i=1; i<=12; i++){ %>
										<option value="<%=i%>"><%=i %></option>
									<%} %>
								</select>월
								<select name="spec1_d" id="spec1_d">
									<option value="">--</option>
									<%for(int i=1; i<=30; i++){ %>
										<option value="<%=i%>"><%=i %></option>
									<%} %>
								</select>일
								</span>
																
								</div>
								<label for="spec1File">자격증 이미지 : </label>
								<input type="file" name="spec1File" id="spec1File">
								<!-- 추가할 div영역 -->
								<hr>
								<div id="addSpecDiv" style="height: auto"></div>
							</td>
						</tr>
						
						
						<!-- 추가 버튼 -->
						<tr>
							<td><input type="button" value="추가" onclick="addSpec()"></td>
							<td><input type="button" value="삭제" onclick="deleteSpec()"></td>
						</tr>
						
					</table>
				</div>	
				<!-- 경력사항 -->
				<div style="border: 1px solid; height: 500px;">
					<h3>경력사항</h3>
					<hr>
					<label>기타 경력사항을 적어주세요.</label>
					<textarea name="career" id="career" rows="" cols="" style="width: 100%; height: 200px;"></textarea>
					<a>ex) ##회사 n년근무 등</a>
				
				</div>
			</div>
			<input style="width: 200px; height: 50px;" type="button" onclick="insertTeacher()" value="강사 신청하기">
			<input style="width: 200px; height: 50px;" type="button" value="취소" onclick="history.back()">
		</form>
	</c:when>
	
	<c:when test="${sessionScope.teacher == 'w'}">
		<h1>신청 대기중 입니다...</h1>
		
	</c:when>
	
	<c:when test="${sessionScope.teacher == 'y'}">
		<h1>이미 강사 회원입니다.</h1>
	</c:when>
	<c:otherwise>
		<h2>세션이 없습니다. 다시 로그인 해주세요.</h2>
	</c:otherwise>
</c:choose>
</div>
<%@ include file="../include/footer.jsp"%>
<!-- 부스 스트랩 4.4.1 -->
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
    	url: '${path}/lecture/uploadAjax.do',
    	  enctype:'multipart/form-data',
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
</body>
</html>