// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require chosen-jquery
//= require turbolinks

jQuery(document).ready(function($){

function ltl_bar_change(){
	if($('.ltl-nav-open').length>0){

		$('.ltl-nav-open').addClass('ltl-nav-close');
		$('.ltl-nav-open').removeClass('ltl-nav-open');
		$('.main-content-small').addClass('main-content-big');
		$('.main-content-small').removeClass('main-content-small');
	}
	else{
		
		$('.ltl-nav-close').addClass('ltl-nav-open');
		$('.ltl-nav-close').removeClass('ltl-nav-close');
		$('.main-content-big').addClass('main-content-small');
		$('.main-content-big').removeClass('main-content-big');
	}

}

$('#side_close_button').click(ltl_bar_change);
ltl_bar_change()

// Script to active chosen select
$('.chosen-select').chosen(function(){
	allow_single_deselect: true;
    no_results_text: 'No results matched';
    width: '200px';
});

// Script for tabs on task modal    
$('#task_tab a').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
})

// Script for tabs on task modal 
$(function () {
  $('#task_tab a:last').tab('show');
})

$('#modal').on('hide', function () {
    $("#modal-header").empty();
  });

});
