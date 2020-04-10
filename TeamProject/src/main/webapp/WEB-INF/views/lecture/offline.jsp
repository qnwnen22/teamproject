<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 제거 -->
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/fixed-topbar.jsp" %>
<!-- 썸머 노트 -->
<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-bs4.min.js"></script>

<!-- 이원혁 추가 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="${path}/include/css/kakaoMap.css">
<!-- 강의 등록용 JS -->
<script src="${path}/include/js/lectureInsert.js"></script>
</head>
<body>
<div class="container-lg joinDiv" style="margin-top: 170px; width: 100%;">
	<div style="width: 20%; height: 500px; float: left; border: 1px solid;">
		<h4>test</h4>
		<a href="${path}/chatroom/room">채팅방만들기</a><br>
		<a href="${path}/chatroom/chatRoomList.do">채팅방리스트이동</a>
		<hr>
		<h4>강의 관리</h4>
		<a href="${path}/lecture/myLecturePage.do?userid=${sessionScope.userid}">내가 올린 강의 관리</a>
		<hr>
		<h4>강의 등록</h4>
		<a href="${path}/lecture/videoPage.do">1. 동영상 강의 등록 페이지</a><br>
		<a href="${path}/lecture/onlinePage.do">2. 실시간 강의 등록 페이지</a><br>
		<a href="${path}/lecture/offlinePage.do">3. 현장 강의 등록 페이지</a><br>
		<hr>
		<h4>강의 리스트</h4>
		<a href="${path}/lecture/video_List.do">1. 동영상 리스트 페이지</a><br>
		<a href="${path}/lecture/online_list.do">2. 실시간 강의 리스트 페이지</a><br>
		<a href="${path}/lecture/offline_list.do">3. 현장 강의 리스트 페이지</a><br>
		<hr>
		<a href="${path}/lecture/all_list.do">모든 강의 리스트</a><br>
	</div>
	
	<div style="width: 78%; float: right; border: 1px solid;">
		<div class="page-header col-xl-8 offset-xl-2 text-center">
			<h2>현장 강의 등록 페이지</h2>
		</div>
		<form method="post"
					name="form1"
					id="form1"
					enctype="multipart/form-data"
					class="form-horizontal"
					action="${path}/lecture/teacher_type3_insert.do">
			<!-- 메인 카테고리 -->
			<div class="form-group">
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
			<div class="form-group">
				<label for="category">서브 카테고리 선택</label>
				<select name="sub_category" id="sub_category" class="form-control">
					<option style="color: red;" value="">-메인 카테고리를 선택해주세요-</option>
				</select>
			</div>
			<!-- 아이디 -->
			<div class="form-group">
				<label for="userid">강사 아이디</label>
				<input class="form-control" id="userid" name="userid" value="${sessionScope.userid}" readonly>
			</div>
			<!-- 강의 제목 -->
			<div class="form-group">
				<label for="subject">강의 제목</label>
				<input class="form-control" id="subject" name="subject" placeholder="강의 제목을 입력해 주세요">
			</div>
			<!-- 가격 -->	
			<div class="form-group">
				<label for="price">가격(원)</label>
				<input type="number" class="form-control" id="price" name="price" value="" placeholder="가격을 입력해주세요">
			</div>
			<!-- 썸네일 -->
			<div class="form-group" id="photo_add">
				<label for="file1">사진파일 (맨위에 파일은 메인사진입니다)</label><br>
				<p style="color: blue; font-size: 12px;">선택한 파일을 초기화방법 = 파일 선택 → 취소</p>
				<input class="file1" type="file" name="file1" id="file1">
			</div>
			<!-- 내용 -->
			<div class="form-group">
				<label for="content_label">내용</label><br>
				<textarea class="form-control text_cotent" name="content" id="content" rows="10" cols="10"></textarea>
			</div>
			
			<!-- 강의 시작날짜 -->
			<div class="form-group">
				<label for="lecture_date_label">강의 시작 날짜</label>
				<input class="form-control" type="date" name="lecture_date" id="lecture_date">
			</div>
			<!-- 강의장 시작 날짜 -->
			<div class="form-group">
				<label for="lecture_start">강의 시작 시간</label><br>
				<input type="time" class="form-control"	name="lecture_start" id="lecture_start">
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
			<hr>
			<h3>강의장 주소</h3>
			<%@ include file="kakaoMap.jsp" %>
			<div class="form-group">
				<label for="lecture_road_address">도로명 주소</label>
				<input type="text" class="form-control" name="lecture_address" id="lecture_address">
			</div>
			<!-- 강의장 상세 주소 -->
			<div class="form-group">
				<label for="lecture_address2">상세 주소</label>
				<input type="text" class="form-control" name="lecture_address2" id="lecture_address2">
			</div>
			
			<!-- 등록 버튼 -->
			<div class="form-group text-center">
				<input type="button" onclick="insert3()" class="btn btn-primary" value="강의 등록">
				<input type="button" class="btn btn-warning" onclick="history.back()" value="뒤로 가기">
				<a href="${path}/lecture/offline_list.do" class="btn btn-dark pull-left">목록</a>
			</div>
		</form>
	</div>
</div>
<%-- <%@ include file="../include/footer.jsp"%> --%>
<!-- 부스 스트랩 4.4.1 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>