/**
 * 
 */
$(function(){
    //마지막 스크롤 값을 저장할 lastScroll 변수
    var lastScroll = 0;
    $(window).scroll(function(event){ //스크롤이 움직일때 마다 이벤트 실행
        //현재 스크롤의 위치를 저장할 st 변수
        var st = $(this).scrollTop();
        //스크롤 상하에 따른 반응 정의
        if (st > lastScroll){
            if ($(window).scrollTop() >= 538) { //스크롤이 아래로 538px 이상 내려갔을때 실행되는 이벤트 정의
                $('header').attr('class','nav d-xl-block d-lg-block d-md-none d-sm-none');
            }
        }else {
        	if ($(window).scrollTop() < 538) { //스크롤이 아래로 538px 이상 올라갔을때 실행되는 이벤트 정의
        		$('header').attr('class','nav d-md-none d-sm-none');
            }
        }
        //현재 스크롤 위치(st)를 마지막 위치로 업데이트
        lastScroll = st;
    });
    $(window).resize(function() {
    	if ($(window).width() < 1111) {
    		$('.container-fluid .tail_body').collapse('hide');
    	};
    });
    $(window).resize(function() {
    	if ($(window).width() > 1111) {
    		$('.container-fluid .tail_body').collapse('show');
    	};
    });
    
    $('.carousel').carousel({
  	  interval: 3000
  	});
});