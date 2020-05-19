<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp" %>
</head>
<body>
<%@include file="../include/fixed-topbar.jsp" %>
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 pb-3 mb-3">
<div>
			<ul class="upper_shift">
				<li><a href="${path}">KDEMY</a></li>
				<li><b><a href="${path}/chart/statistics.do" style="color:blue;">통계</a></b></li>
			</ul>
		</div>
		<hr>
		<div class="d-flex">
<div class="card col d-flex align-items-center shadow mb-4 bg-white border border-secondary mx-1 pt-3">
    <h4 class="card-title">가입자수</h4>
    <h4 class="card-title" id="counter1"></h4>
<a href="${path}/chart/memberchart.do">
<img class="card-img-top" src="../include/images/chart/회원.jpg" alt="Card image">
  </a>
</div>
<div class="card col d-flex align-items-center shadow mb-4 bg-white border border-secondary mx-1 pt-3">
    <h4 class="card-title">등록된 강의</h4>
     <h4 class="card-title" id="counter2"></h4>
     <a href="${path}/chart/lecturechart.do">
  <img class="card-img-top" src="../include/images/chart/강의.jpg" alt="Card image">
  </a>
</div>
<div class="card col d-flex align-items-center shadow mb-4 bg-white border border-secondary mx-1 pt-3">
    <h4 class="card-title">매출현황</h4>
    <h4 class="card-title" id="counter3"></h4>
    <a href="${path}/chart/saleschart.do">
  <img class="card-img-top" src="../include/images/chart/매출.jpg" alt="Card image">
  </a>
</div>
</div>
</div>
<div id="chart_div"></div>
<%@include file="../include/footer.jsp" %>
<script type="text/javascript">
	function numberCounter(target_frame, target_number) {
	    this.count = 0; this.diff = 0;
	    this.target_count = parseInt(target_number);
	    this.target_frame = document.getElementById(target_frame);
	    this.timer = null;
	    this.counter();
	};
	numberCounter.prototype.counter = function() {
	    var self = this;
	    this.diff = this.target_count - this.count;
	     
	    if(this.diff > 0) {
	        self.count += Math.ceil(this.diff / 15);
	    }
	    this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	    if(this.count < this.target_count) {
	        this.timer = setTimeout(function() { self.counter(); }, 20);
	    } else {
	        clearTimeout(this.timer);
	    }
	
	};
	new numberCounter("counter1", ${map.countMember});
	new numberCounter("counter2", ${map.countLecture});
	new numberCounter("counter3", ${map.totalMoney});
	</script>
</body>
</html>