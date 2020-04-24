<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Footer -->
<div class="container align-items-end p-1" id="footer-body">
	<div id="footertoggle" class="d-flex py-1">
		<button id="ToggleBottom" class="btn btn-link rounded-circle col-2"
			data-toggle="collapse" data-target="#tail_body">
			<i class="fa fa-bars" style="font-size: 50px;"></i>
		</button>
		<button id="ToggleBottom" class="btn btn-link rounded-circle col-2"
			data-toggle="collapse" data-target="" onclick="location='${path}'">
			<i class="fas fa-home" style="font-size: 50px;"></i>
		</button>
		<button id="ToggleBottom" class="btn btn-link rounded-circle col-2"
			data-toggle="collapse" data-target="">
			<i class="fab fa-buromobelexperte" style="font-size: 50px;"></i>
		</button>
		<button id="ToggleBottom" class="btn btn-link rounded-circle col-2"
			data-toggle="collapse" data-target="">
			<i class="far fa-heart" style="font-size: 50px;"></i>
		</button>
		<button id="ToggleBottom" class="btn btn-link rounded-circle col-2"
			data-toggle="collapse" data-target="">
			<i class="fas fa-angle-left" style="font-size: 50px;"></i>
		</button>
		<button id="ToggleBottom" class="btn btn-link rounded-circle col-2"
			data-toggle="collapse" data-target="">
			<i class="fas fa-angle-right" style="font-size: 50px;"></i>
		</button>
	</div>
	<hr>
	<div class="tail_body collapse show" id="tail_body">
		<div class="tail_item col-sm-2 p-0">
			<div class="title_tail">CS CENTER</div>
			<div class="tel">1688-0000</div>
			<div class="time">
				<span>WEEK</span> 10:00 ~ 17:00<br> <span>LUNCH</span> 12:00 ~
				13:00
			</div>
			<div class="time_info">
				주말,공휴일은 휴무입니다.<br>통화량 폭주로 전화연결이 안 될 경우,<br>게시판에 문의
				남겨주시면 <br> 빠른 처리 해드리겠습니다.<br>
			</div>
		</div>

		<div class="tail_item col-sm-2 p-0">
			<div class="title_tail">ACCOUNT INFO</div>
			<ul class="bank_info">
				<li>농협 010-000-9999-111</li>
				<li>국민 0000-123456-123</li>
				<li>우체국 00123-02-987654</li>
				<li>우리 1000-001-99999</li>
				<li>예금주: KDEMY</li>
			</ul>
			<a href="https://pgweb.uplus.co.kr/" target="_blank"><img
				src="${path}/include/images/footer/lgup.png" alt=""></a>
		</div>

		<div class="tail_item col-sm-2 p-0">
			<div class="title_tail">RETURN</div>
			<div class="return_txt p-1">
				<a href="#">교환/반품 정책 확인</a><br> <br> 서울 강동구 천호동 000<br>
				우체국 물류센터<br> KDEMY<br>
			</div>
		</div>

		<div class="tail_item col-sm-3 p-0">
			<div class="title_tail">WITH US</div>
			<ul class="shop_info">
				<li><a href="${path}/footermenu/withus.do"><span>COMPANY</span><small> 회사소개</small></a></li>
				<li><a href="#"><span>AGREEMENT</span> <small> 이용약관</small></a></li>
				<li><a href="#"><span>PRIVACYPOLICY</span> <small>
							개인정보처리방침</small></a></li>
				<li><a href="${path}/notice/list.do"><span>NOTICE</span> <small> 공지사항</small></a></li>
				<li><a href="#"><span>GUIDE</span> <small> 이용안내</small></a></li>
			</ul>
			<div class="bsns_wrap">
				<ul class="sns ">
					<li><a href="https://www.youtube.com" target="_blank"><img
							src="${path}/include/images/footer/ico_yt.png" alt="youtube"></a></li>
					<li><a href="https://www.facebook.com" target="_blank"><img
							src="${path}/include/images/footer/ico_fb.png" alt="facebook"></a></li>
					<li><a href="https://www.instagram.com" target="_blank"><img
							src="${path}/include/images/footer/ico_ist.png" alt="insta"></a></li>
					<li><a href="https://twitter.com" target="_blank"><img
							src="${path}/include/images/footer/ico_tw.png" alt="twitter"></a></li>
				</ul>
			</div>
		</div>

		<div class="tail_item col-sm-2.8 p-1">
			<div class="title_tail">COMPANY INFO</div>
			<div class="com_info">
				상호명: KDEMY | 대표 : 홍길동<br> 주소 : 서울시 강동구 천호동 어딘가<br>
				개인정보관리책임자 : 홍길동 | <br>이메일: hong@naver.com<br> 사업자등록번호 :
				000-111-22222 <a href="https://www.ftc.go.kr/" target="_blank"><br>[사업자정보확인]</a><br>
				통신판매업신고 : 2020-대한민국-0000 <br> <br> 호스팅 : (주)KDEMY<br>
				Copyright © KDEMY all rights reserved.
			</div>
		</div>
	</div>
	<!-- end tail_body -->
</div>
<div class="modal fade kdemy-login-form" id="kdemyLoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center">KDEMY LOGIN</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form method="post" id="signInForm" name="signInForm" action="${path}/member/login.do" class="form-horizontal">
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요.">
					<div><c:if test="${message!=null}"><b>${message}</b></c:if></div>			
				</div>
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="password" class="form-control" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요.">
				</div>
			<div class="form-check pt-2 pb-1">
				  <input class="form-check-input" type="checkbox" name="loginsave" id="loginsave" value="option1" checked>
				  <label class="form-check-label" for="exampleRadios1">
				   <b>로그인유지</b>
				  </label>
		    </div>
				<div class="input-group input-group-lg text-center pt-2 pb-1">
					<button type="submit" id="join-submit" class="btn btn-outline-dark btn-lg btn-block">
						로그인
					</button>
				</div>

					<div class="float-left pt-2 pb-1">
					  <a href="${path}/member/searchId.do" class="more"><b>아이디 찾기</b></a>
					</div>
					<div class="float-right pt-2 pb-1">
				 	 <a href="${path}/member/searchpass.do" class="more"><b>비밀번호 찾기</b></a>
					</div>
					
				<br><br>
				<div class="text-center pt-2 pb-2">
				   <b>SNS계정으로 편한하게 로그인하세요.</b>
				</div>
				
			   <div class="d-flex row justify-content-md-center pt-2 pb-1">
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_fb.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_ist.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_tw.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="../include/images/footer/ico_yt.png"></a></div>
 			   </div>
         </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-dark btn-lg btn-block">신규 가입하기</button>
      </div>
    </div>
  </div>
</div>



<!-- End of Footer -->
<script>
var socket = null;
$(document).ready( function () {
	conectWS();

});

function conectWS() {
	var ws = new WebSocket("ws://localhost:80/Kdemy/reviewReply");
	socket = ws;
	
    ws.onopen = function () {
        console.log('Info: connection opened.');
    };


    ws.onmessage = function (event) {
        console.log(event.data+'\n');
        let $socketAlert =$('div#socketAlert');
        $socketAlert.html(event.data);
        $socketAlert.css("display",'block');
        setTimeout(function(){
        	  $socketAlert.css("display",'none');
         },5000);
    };
    
    ws.onclose = function (event) {
         console.log('Info: connection closed.');  // retry connection!! 
    };
    ws.onerror = function (err) {
         console.log('Error : ');
     };
}

</script>