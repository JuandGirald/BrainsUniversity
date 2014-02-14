$(document).ready ->
	$('.ui-loader-default').hide();
	psw = $(window).width()
	psh = $(window).height()
	$("header").height(psh).width psw
	$(window).bind "orientationchange throttledresize", ->
	  psw = $(window).width()
	  psh = $(window).height()
	  $("header").height(psh).width psw

	cw = $(".container").width()
	bc = $("#nav-boxes div a").length
	bw = 100 / bc
	$("#nav-boxes div a").css "width", bw + "%"

	# nav box hover
	$("#nav-boxes a").hover (->
	  $(this).find("i").addClass "animated flipInY 1s"
	), ->
	  $(this).find("i").removeClass "animated flipInY 1s"

	$("header").scrollspy target: ".navbar"

