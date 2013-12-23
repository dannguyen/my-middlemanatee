$(document).ready(function(){


	$(".fade-item").hover(function(){
		$(this).stop(true,true).addClass('active', 500, 'easeOutQuad');
//		$(this).siblings().stop(true, true).fadeTo('fast', 0.01);
	}, function(){
		$(this).stop(true,true).removeClass('active', 400, 'easeOutQuad');
//		$(this).siblings().stop(true, true).fadeTo('slow', 1.0);
	})

	$(".fade-item").click(function(){
		var href = $(this).attr('data-href');
		window.location = href;
	})

	$(".isotoper").isotope();

})