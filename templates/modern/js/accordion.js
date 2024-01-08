$(document).ready(function(){

	$(".accordion2 h3").eq(0).addClass("active");
	$(".accordion2 ul").eq(0).show();

	$(".accordion2 h3").click(function(){
		$(this).next("ul").slideToggle(400)   //auch "fast" und "slow" m?ich, oder den Wert in ms
		.siblings("ul:visible").slideUp(400); //auch "fast" und "slow" m?ich, oder den Wert in ms
		$(this).toggleClass("active");
		$(this).siblings("h3").removeClass("active");
	});

});