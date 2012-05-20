# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.init = ->
	will_vote = null;
	constituency_id = null;
	party_id = null;

	$(".panel").hide();
	$("#select_constituency").show();


	post_vote = ->
		data = "will_vote=#{will_vote}&constituency_id=#{constituency_id}&party_id=#{party_id}"
		$.ajax
	        type: 'POST'
	        url: "poll/vote"
	        data: data
	        beforeSend: ->
	        	$(".panel").hide();
	        	$("#loading").show();
	        success: (resp) ->
	          if resp.status is "success"
	         	  $("#nationalYes").html(resp.results.national.yes)
	         	  $("#nationalNo").html(resp.results.national.no)
	         	  $("#conYes").html(resp.results.constituency.yes)
	         	  $("#conNo").html(resp.results.constituency.no)
	         	  $("#conName").html(resp.constituency.name)
	         	  $(".panel").hide();
	         	  $("#result").show();
	         error: () ->
	         	alert "sorry some error occurred"
	         	$(".panel").hide();
				$("#select_constituency").show();
		
	
	$("#select_constituency_next").on "click", ->
		constituency_id = $("#constituency_select").val()
		$("#select_constituency").hide();
		$("#do_you_vote").show();

	$("#yes_vote").on "click", ->
		will_vote = true
		$("#do_you_vote").hide();
		$("#select_party").show();
	
	$("#no_vote").on "click", ->
		will_vote = false
		post_vote()

	$("#select_party_submit").on "click", ->
		party_id = $("#party_select").val()
		post_vote()