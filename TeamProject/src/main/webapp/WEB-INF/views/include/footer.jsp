<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Footer -->
	<div id="footertoggle" class="d-flex py-1 d-none d-md-block d-sm-block">
	<div id="footertoggle" class="d-flex py-1 ">
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
<div class="col-xl-8 offset-xl-2 col-lg-12 col-md-12 col-sm-12 d-none d-xl-block d-lg-block" id="footer-body">
	<hr>
	<div class="tail_body collapse show" id="tail_body">
		<div class="tail_item flex-shrink-2">
			<div class="title_tail">CS CENTER</div>
			<div class="tel">1688-0000</div>
			<div class="time">
				<span>WEEK</span> 10:00 ~ 17:00<br> <span>LUNCH</span> 12:00 ~
				13:00
			</div>
			<div class="time_info">
				주말, 공휴일은 휴무입니다.<br> 통화량 폭주로 전화연결이 안 될 경우,<br> 게시판에 문의
				남겨주시면 <br> 빠른 처리 해드리겠습니다.<br>
			</div>
		</div>

		<div class="tail_item flex-shrink-2">
			<div class="title_tail">ACCOUNT INFO</div>
			<ul class="bank_info">
				<li><span>농협</span>010-0000-9999-111</li>
				<li><span>국민</span>00000-123456-123</li>
				<li><span>우체국</span>000123-02-987654</li>
				<li><span>우리</span>1000-001-999999</li>
				<li>예금주: KDEMY</li>
			</ul>
			<a href="https://pgweb.uplus.co.kr/" target="_blank"><img
				src="${path}/include/images/footer/lgup.png" alt=""></a>
		</div>

		<div class="tail_item flex-shrink-3">
			<div class="title_tail">RETURN</div>
			<div class="return_txt">
				<a href="#">교환/반품 정책 확인</a><br> <br> 서울 강동구 천호동 000<br>
				우체국 물류센터<br> KDEMY<br>
			</div>
		</div>

		<div class="tail_item flex-shrink-1">
			<div class="title_tail">WITH US</div>
			<ul class="shop_info">
				<li><a href="${path}/footermenu/withus.do"><span>COMPANY</span> <small> 회사소개</small></a></li>
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

		<div class="tail_item flex-shrink-0">
			<div class="title_tail">COMPANY INFO</div>
			<div class="com_info">
				상호명: KDEMY | 대표 : 홍길동<br> 주소 : 서울시 강동구 천호동 어딘가<br>
				개인정보관리책임자 : 홍길동 | 이메일: hong@naver.com<br> 사업자등록번호 :
				000-111-22222 <a href="https://www.ftc.go.kr/" target="_blank">[사업자정보확인]</a><br>
				통신판매업신고 : 2020-대한민국-0000 <br> <br> 호스팅 : (주)KDEMY<br>
				Copyright © KDEMY all rights reserved.
			</div>
		</div>
	</div>
</div>

	<!-- end tail_body -->
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
				  <input class="form-check-input" type="checkbox" name="savelogin" id="savelogin" value="true" checked>
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
					  <a class="plain cursor" data-dismiss="modal"  data-ga-category="header" data-toggle="modal" data-target="#kdemySearchIDModal"><b>아이디 찾기</b></a>																	
					</div>
					<div class="float-right pt-2 pb-1">
					  <a class="plain cursor" data-dismiss="modal"  data-ga-category="header" data-toggle="modal" data-target="#kdemySearchPWModal"><b>비밀번호 찾기</b></a>	
					</div>
					
				<br><br>
				<div class="text-center pt-2 pb-2">
				   <b>SNS계정으로 편안하게 로그인하세요.</b>
				</div>
				
			   <div class="d-flex row justify-content-md-center pt-2 pb-1">
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="${path}/include/images/footer/ico_yt.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="${path}/include/images/footer/ico_fb.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="${path}/include/images/footer/ico_ist.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="${path}/include/images/footer/ico_tw.png"></a></div>
 			   </div>
         </form>
      </div>
      <div class="modal-footer">
        <a type="button" class="btn btn-outline-dark btn-lg btn-block" href="${path}/member/join.do"">신규 가입하기</a>
      </div>
    </div>
  </div>
</div>



<!-- 아이디찾기 -->
<div class="modal fade kdemy-login-form" id="kdemySearchIDModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center">KDEMY SEARCH ID</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="text" class="form-control" id="username" name="username" placeholder="이름을 입력해주세요." required autofocus="">	
				</div>
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="email" class="form-control" id="useremail" name="useremail" placeholder="이메일을 입력해주세요." required autofocus="">
				</div>
				<div class="input-group input-group-lg text-center pt-2 pb-1">			
					<button type="button" id="searchIdbtn" class="btn btn-outline-dark btn-lg btn-block" >아이디 찾기</button>
				</div>
				<div class="textBox"><p id="text" style="color:red;"></p></div>

				
					<div class="float-left pt-2 pb-1">
					  <a class="plain cursor" data-dismiss="modal"  data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal"><b>로그인</b></a>																	
					</div>
					<div class="float-right pt-2 pb-1">
					  <a class="plain cursor" data-dismiss="modal"  data-ga-category="header" data-toggle="modal" data-target="#kdemySearchPWModal"><b>비밀번호 찾기</b></a>	
					</div>
					
				<br><br>
				<div class="text-center pt-2 pb-2">
				   <b>SNS계정으로 편안하게 로그인하세요.</b>
				</div>
				
			   <div class="d-flex row justify-content-md-center pt-2 pb-1">
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="include/images/footer/ico_fb.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="include/images/footer/ico_ist.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="include/images/footer/ico_tw.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="include/images/footer/ico_yt.png"></a></div>
 			   </div>

      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
</div>



<!-- 비밀번호 찾기 -->
<div class="modal fade kdemy-login-form" id="kdemySearchPWModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center">KDEMY SEARCH PASSWORD</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" id="searchPWForm" name="searchPWForm" action="${path}/member/searchPW.do" class="form-horizontal">
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요." required>	
				</div>
				<div class="input-group input-group-lg pt-2 pb-1">
					<input type="email" class="form-control" id="useremail" name="useremail" placeholder="이메일을 입력해주세요." required>
				</div>
				
				<div class="input-group input-group-lg text-center pt-2 pb-1">			
					<button type="submit" class="btn btn-outline-dark btn-lg btn-block" >비밀번호 찾기</button>
				</div>
				<div class="textBox"><p id="text" style="color:red;"></p></div>

				
					<div class="float-left pt-2 pb-1">
					  <a class="plain cursor" data-dismiss="modal"  data-ga-category="header" data-toggle="modal" data-target="#kdemyLoginModal"><b>로그인</b></a>																	
					</div>
		
					
				<br><br>
				<div class="text-center pt-2 pb-2">
				   <b>SNS계정으로 편안하게 로그인하세요.</b>
				</div>
				
			   <div class="d-flex row justify-content-md-center pt-2 pb-1">
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="include/images/footer/ico_fb.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="include/images/footer/ico_ist.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="include/images/footer/ico_tw.png"></a></div>
			     <div class="col-2 text-center"><a href="#"><img style="width: 50px; height: 50px;"src="include/images/footer/ico_yt.png"></a></div>
 			   </div>
       </form>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>

	<!-- logOut Modal -->
<div class="modal" id="logOutModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">로그아웃</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <h6>로그아웃 하시겠습니까?</h6>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <a href="${path}/member/logOut.do" type="button" class="btn btn-outline-danger">로그아웃</a>
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
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



$(document).ready(function(){
    $('#searchIdbtn').on('click', function(){
      
        $.ajax({
            type: 'POST',
            url: "${path}/member/searchID.do",
            data: {
                "username" : $('#username').val(),
                "useremail" : $('#useremail').val()
            },
            success: function(result){
                if($.trim(result) =="x"){
					$('#text').html('가입기록이 없습니다.<br>이름 또는 이메일을 다시 한 번 확인해주세요!');
                }
                else{
                	$('#text').html('<br>회원님의 아이디는 <b>'+$.trim(result)+'</b>입니다.');
                }
            }
        });       
    });   
});


</script>