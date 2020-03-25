$(function(){
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