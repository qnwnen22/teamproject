<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>

<script src="${path}/include/js/lectureInsert.js"></script>

</script>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
	<div class="page-header col-xl-8 offset-xl-2 text-center">
		<h2>실시간</h2>
		<h4>판매타입 : ${dto.cell_type}</h4>
	</div>

	<form method="post"
				name="form1"
				id="form1"
				enctype="multipart/form-data"
	            class="form-horizontal"
	            action="${path}/lecture/teacher_type2_insert.do">
	    <!-- 메인 카테고리 -->
	    <div class="row">
		<div class="form-group col-6">
			<label for="category">메인 카테고리 선택</label>
			<select name="main_category" id="main_category" class="form-control"
			onChange="category()">
				<option selected value="">-메인메뉴-</option>
				<option value="디자인">디자인</option>
				<option value="IT,프로그래밍">IT,프로그래밍</option>
				<option value="콘텐츠 제작">콘텐츠 제작</option>
				<option value="마케팅">마케팅</option>
				<option value="번역,통역">번역,통역</option>
				<option value="문서,취업">문서,취업</option>
				<option value="비즈니스컨설팅">비즈니스컨설팅</option>
				<option value="운세,상담">운세,상담</option>
				<option value="레슨,실무교육">레슨,실무교육</option>
				<option value="주문제작">주문제작</option>
				<option value="간판,인쇄">간판,인쇄</option>
			</select>
		</div>
		<!-- 서브 카테고리 -->
		<div class="form-group col-6">
			<label for="category">서브 카테고리 선택</label>
			<select name="sub_category" id="sub_category" class="form-control">
				<option style="color: red;" value="">-메인 카테고리를 선택해주세요-</option>
			</select>
		</div>
		</div>
	    <!-- 아이디 -->
	    <div class="form-group">
			<label for="userid">강사아이디</label>
	        <input class="form-control" id="userid" name="userid" value="${sessionScope.userid}" readonly>
		</div>
	    <!-- 강의 제목 -->
	    <div class="form-group">
	    	<label for="subject">강의제목</label>
	    	<input class="form-control"	id="subject" name="subject" value="${dto.subject}">
		</div>
	    <!-- 가격 -->	
		<div class="form-group">
			<label for="price">가격(원)</label>
			<input type="number" class="form-control" id="price" name="price" value="${dto.price}">
		</div>
	    <!-- 썸네일 -->
		<div class="form-group" id="photo_add">
			<label for="file1">메인 이미지 등록(썸네일)</label><br>
			<img id="img" name="img" alt="" src="../upload${dto.main_img}">
			<p style="color: blue; font-size: 12px;">선택한 파일을 초기화방법 = 파일 선택 → 취소</p>
			<input class="file" type="file" onchange="imageURL(this)">
		</div>
		
		
		
		<c:choose>
			<c:when test="${empty dto.main_img}">
			<div>
					<img id ="profileImg" src = "여기!!!" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
				</div>
				</c:when>
				<c:otherwise>
				<div>
					<img id ="profileImg" src = "${path}/member/displayFile?fileName=${dto.main_img}" style = "border-radius:0%; padding-top : 10px; height:100px; width:100px;">
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
	
		
		<!-- 내용 -->
		<div class="form-group">
			<label for="content_label">내용</label><br>
			<textarea class="form-control text_cotent" name="content" id="content" rows="10" cols="10">${dto.content}</textarea>
		</div>
	
		<!-- 강의 시작날짜 -->
		<div class="form-group">
			<label for="lecture_date_label">강의 시작 날짜</label>
			<input class="form-control" type="date" name="lecture_date" id="lecture_date" value="${dto.lecture_date}">
		</div>
		<!-- 강의장 시작 날짜 -->
		<div class="form-group">
			<label for="lecture_start">강의 시작 시간</label>
			<input type="time" class="form-control"	name="lecture_start" id="lecture_start" value="${dto.lecture_start}">
		</div>
		<!-- 강의 시간 -->
		<div class="form-group">
			<label for="lecture_time">강의 시간</label>
			<select class="form-control" name="lecture_time" id="lecture_time">
				<option value="1">1시간</option>
				<option value="2">2시간</option>
				<option value="3">3시간</option>
				<option value="4">4시간</option>
				<option value="5">5시간</option>
				<option value="6">6시간</option>
			</select>
		</div>
	      
		<!-- 등록 버튼 -->
		<div class="form-group text-center">
			<input type="button" onclick="insert2()" class="btn btn-primary" value="강의 등록">
			<input type="button" class="btn btn-warning" onclick="history.back()" value="뒤로 가기">
			<a href="${path}/lecture/offline_list.do" class="btn btn-dark pull-left">목록</a>
		</div>
	</form>
</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>