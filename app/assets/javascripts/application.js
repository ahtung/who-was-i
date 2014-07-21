// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//=require timelineJS/embed
//= require_tree .

$(function(){
  $(document).foundation();
	
	$("#ancestors" ).on( "click", '.ancestor_link', function(e) {
		
		$("#selfies").append('<li>' + $(this).text() +'</li>');
		
		// var timeline = {'timeline':{
		// 	'headline': $(this).data('name'),
		//   'type':"default",
		// 	'txt': $(this).text(),
		//   'date': $(this).data('born-on')
		// }};
		// createStoryJS({
		//   type: 'timeline',
		//   width: '100%',
		//   height: '500',
		// 	source: timeline,
		//       embed_id: 'time_line'
		//     });
		
		$('#searching').foundation('reveal', 'open');
    $.ajax({
      url: $(this).attr('href')
    }).error(function(json) {
    	// alert(json)
    });
		return false;
	});

  $('form').submit(function() {
		$('#form_row').hide()
		$("#selfies").empty();
		$("#selfies").append('<li>' + $("#ancestor_name").val() +'</li>');
		
    $('#searching').foundation('reveal', 'open');
    $.ajax({
      url: $(this).attr('action'),
      data: $(this).serialize()
    }).error(function(json) {
    	// alert(json)
    });
    return false;
	});
});
