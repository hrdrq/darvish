# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
 $('#hideTW').click ->
  $this = $(this)
  if $this.next("#hideJP").hasClass("disabled")
   $(".tw").show 0, ->
     $this.text "隱藏中文"
     $this.next("#hideJP").removeClass("disabled")
  else
   unless $this.hasClass("disabled")
    $(".tw").hide 0, ->
     $this.text "顯示中文"
     $this.next("#hideJP").addClass("disabled")
    
 $('#hideJP').click ->
  $this = $(this)
  if $this.prev("#hideTW").hasClass("disabled")
   $(".jp").show 0, ->
     $this.text "隱藏日文"
     $this.prev("#hideTW").removeClass("disabled")
  else
   unless $this.hasClass("disabled")
    $(".jp").hide 0, ->
     $this.text "顯示日文"
     $this.prev("#hideTW").addClass("disabled")

