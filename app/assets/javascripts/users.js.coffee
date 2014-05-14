ready = ->	
	#reaload de home page
	$(document).on "click", ".home_link", ->
		window.location.href='/'
		return

$(document).ready(ready)
$(document).on('page:load', ready)