<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 구글 차트 호출을 위한 js 파일 -->
<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
	//구글 차트 라이브러리 로딩
	google.load("visualization", "1", {
		"packages" : [ "corechart" ]
	});
	//라이브러리 로딩이 완료되면 drawChart 함수 호출, ()는 안씀
	google.setOnLoadCallback(drawChart3);
	function drawChart3() {
		//차트 그리기에 필요한 json 데이터 로딩
		var jsonData = $.ajax({
			url : "${path}/chart/lecture_list.do",
			dataType : "json",
			async : false
		//동기식처리(순차적 처리:데이터를 다부른 후 챠트출력하기 위해)
		}).responseText;
		//json => 데이터테이블
		var data = new google.visualization.DataTable(jsonData);
		console.log("데이터 테이블:" + data);
		var chart = new google.visualization.PieChart(document
				.getElementById("membercount_div"));
		chart.draw(data, {
			title : "카테고리",
			//curveType: "function", //곡선 처리		
			width : 550,
			height : 440
		});
	}
</script>
</head>
<body>
	<%@include file="../include/fixed-topbar.jsp"%>
	<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3" style="margin-top: 170px;">
		<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><a href="${path}/chart/statistics.do">통계</a></li>
				<li><a href="${path}/chart/lecturechart.do" style="color:blue;">강의통계</a></li>
			</ul>
		</div>
		<div class="d-flex">
			<div class="card col-3 d-flex align-items-center">
				<img class="card-img-top" src="../include/images/chart/회원.jpg"
					alt="Card image" style="opacity: 0.3">
				<div class="card-img-overlay">
					<h4 class="card-title">가입자수</h4>
					<h4 class="card-title">${map.countMember}</h4>
					<a href="${path}/chart/memberchart.do" class="btn btn-primary">차트보기</a>
				</div>
			</div>
			<div class="card col-3 d-flex align-items-center border-danger">
				<img class="card-img-top" src="../include/images/chart/강의.jpg"
					alt="Card image" style="opacity: 0.3">
				<div class="card-img-overlay">
					<h4 class="card-title">등록된 강의</h4>
					<h4 class="card-title">${map.countLecture}</h4>
					<a href="${path}/chart/lecturechart.do" class="btn btn-primary">차트보기</a>
				</div>
			</div>
			<div class="card col-3">
				<img class="card-img-top" src="../include/images/chart/매출.jpg"
					alt="Card image" style="opacity: 0.3">
				<div class="card-img-overlay">
					<h4 class="card-title">매출현황</h4>
					<p class="card-text">Some example text.</p>
					<a href="${path}/chart/saleschart.do" class="btn btn-primary">차트보기</a>
				</div>
			</div>
			<div class="card col-3">
				<img class="card-img-top" src="../include/images/chart/방문자.jpg" style="opacity: 0.3" alt="Card image">
				<div class="card-img-overlay">
					<h4 class="card-title">기타</h4>
					<p class="card-text">Some example text.</p>
					<a href="#" class="btn btn-primary">차트보기</a>
				</div>
			</div>
		</div>
		<div id="chart_div" class="d-flex">
			<div id="membercount_div" class="col-6 border m-0"></div>
			<div id="month_div" class="col-6 border m-0"></div>
		</div>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>