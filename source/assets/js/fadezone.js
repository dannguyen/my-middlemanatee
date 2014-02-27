$(document).ready(function(){


	$(".fade-item").hover(function(){
		$(this).stop(true,true).animate({'backgroundColor': '#fff'}, 300);
//		$(this).siblings().stop(true, true).fadeTo('fast', 0.01);
	}, function(){
		$(this).stop(true,true).animate({'backgroundColor': '#f8f8f8'}, 100);
//		$(this).siblings().stop(true, true).fadeTo('slow', 1.0);
	})

	$(".fade-item").click(function(){
		var href = $(this).attr('data-href');
		window.location = href;
	})

	// $(".isotoper").isotope();

})