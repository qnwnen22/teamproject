/**
 * 
 */
	
	function wrapWindowByMask() {
		// 화면의 높이와 너비를 변수로 만듭니다.
		var maskHeight = $(document).height();
		var maskWidth = 1200;
		//var maskWidth = $(window).width();

		// 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
		$('.mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		// fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.

		$('.mask').fadeTo("fast", 0.6);
        //($(window).width() - $('.window').width()) / 2
		// 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
		var left = ($(window).scrollLeft() + 340);
		var top = ($(window).scrollTop() + ($(window).height() - $('.window')
				.height()) / 2);

		// css 스타일을 변경합니다.
		$('.window').css({
			'left' : left,
			'top' : top,
			'position' : 'absolute'
		});

		// 레이어 팝업을 띄웁니다.
		$('.window').show();
	}

	$(document).ready(function() {
		// showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
		$('.showMask').click(function(e) {
			// preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
			e.preventDefault();
			wrapWindowByMask();
		});

		// 닫기(close)를 눌렀을 때 작동합니다.
		$('.window .close').click(function(e) {
			e.preventDefault();
			$('.mask').hide();
			$('.window').hide();
		});
		$('.window .xbtn').click(function(e) {
			e.preventDefault();
			$('.mask').hide();
			$('.window').hide();
		});

		// 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
		$('.mask').click(function() {
			$(this).hide();
			$('.window').hide();
		});
		
		
		//sendEmail
		$('.sendEmail').click(function(e) {
			// preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
			e.preventDefault();
			wrapWindowBySendEmail();
		});

		// 닫기(close)를 눌렀을 때 작동합니다.
		$('.window2 .close').click(function(e) {
			e.preventDefault();
			$('.mask2, .window2').hide();
		});
		$('.window2 .xbtn').click(function(e) {
			e.preventDefault();
			$('.mask2, .window2').hide();
		});

		// 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
		$('.mask2').click(function() {
			$(this).hide();
			$('.window2').hide();
		});
		
	});
	
	
	function wrapWindowBySendEmail(){
		// 화면의 높이와 너비를 변수로 만듭니다.
		var maskHeight = $(document).height();
		var maskWidth = 1200;
		//var maskWidth = $(window).width();

		// 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
		$('.mask2').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		// fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.

		$('.mask2').fadeTo("fast", 0.6);
//($(window).width() - $('.window').width()) / 2
		// 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
		var left = ($(window).scrollLeft() + 340);
		var top = ($(window).scrollTop() + ($(window).height() - $('.window2')
				.height()) / 2);

		// css 스타일을 변경합니다.
		$('.window2').css({
			'left' : left,
			'top' : top,
			'position' : 'absolute'
		});

		// 레이어 팝업을 띄웁니다.
		$('.window2').show();
	}
	
	
	