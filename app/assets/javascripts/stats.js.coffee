# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$(".hide-detail").click ->
		$this = $(this)
		if $this.hasClass("clicked")
			$this.next().find("tr.detail").show()
			$this.removeClass("clicked");
			
		else
			$this.next().find("tr.detail").hide() 
			$this.addClass("clicked");
