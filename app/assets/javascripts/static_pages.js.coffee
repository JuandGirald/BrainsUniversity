$(document).ready ->
	
	$('.ui-loader-default').hide();
	psw = $(window).width()
	psh = $(window).height()
	
	cw = $(".container").width()
	bc = $("#nav-boxes div a").length
	bw = 100 / bc
	$("#nav-boxes div a").css "width", bw + "%"

	#fancy box

	$(".fancybox-media").fancybox
		openEffect: "none"
		closeEffect: "none"
		helpers:
			media: {}

	return


	
	#pop-up videos
	# nav box hover
	# $("#nav-boxes a").hover (->
	#   $(this).find("i").addClass "animated flipInY 1s"
	# ), ->
	#   $(this).find("i").removeClass "animated flipInY 1s"

	# $("header").scrollspy target: ".navbar"

