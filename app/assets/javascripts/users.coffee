$ ->
	$('#users').imagesLoaded ->
		$('#users').masonry
			itemSelector: ".box"
			isFitWidth: true