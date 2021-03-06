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
//= require jquery_ujs
//= require jquery.ui.all
//= require twitter/bootstrap
//= require chosen-jquery
//= require jquery.purr
//= require best_in_place
//= require flash_message
//= require d3
//= require private_pub

jQuery.fn.insertAt = function(index, element) {
  var lastIndex = this.children().size()
  if (index < 0) {
    index = Math.max(0, lastIndex + 1 + index)
  }
  this.append(element)
  if (index < lastIndex) {
    this.children().eq(index).before(this.children().last())
  }
  return this;
}

$(document).bind("page:load", function() {

chosenSelect(200);

$('#side_close_button').click(ltl_bar_change);

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
  })

});


// Script to active chosen select
function chosenSelect(pixels) {
    $('.chosen-select').chosen({ search_contains: true, width: pixels+'px' });
}

function replaceAll( text, busca, reemplaza ){
        while (text.toString().indexOf(busca) != -1)
                text = text.toString().replace(busca,reemplaza);

  return text;
}


$(function(){ //DOM Ready
 
  $('.ltl-nav').removeClass('hide');
  $('.main-content').removeClass('hide');
  $('.progress').addClass('hide');

  $('.main-content').addClass('slide-left');
  $('.ltl-nav').addClass('slide-right');

});

$(document).ready(function() {
  /* Activating Best In Place */
            

  jQuery(".best_in_place").best_in_place();

  $('.smart_tooltip').tooltip({
    placement: 'bottom',
    container: 'body'
    });

  $('#popover_tasks').popover({ trigger: "hover" });
  $('#popover_tests').popover({ trigger: "hover" });
  $('#popover_bugs').popover({ trigger: "hover" });
  $('#popover_docs').popover({ trigger: "hover" });
  $('#popover_cal').popover({ trigger: "hover" });
  $('#popover_cases').popover({ trigger: "hover" });
  $('#popover_config').popover({ trigger: "hover" });

  $(".task").click(function(){

   // $(this).find("a")[0].click()
  });

});

jQuery(document).ready(function($) {
  $('.dropdown-toggle').dropdown();

  $(document).on('click', 'a.accordion-toggle', function(e) {
    $(e.target).parent().siblings('.accordion-body').on('hidden', function(e) {
        e.stopPropagation();
    });
  });

  $('#modal').on('hidden', function () {
    $('#modal').html('<div id="modal-progress hide"><div class="modal-header"><h1>Loading...</h1></div><div class="modal-body"><div class="progress progress-striped active"><div class="bar" style="width: 100%;"></div></div></div></div>')
  })
  $('#modal-large').on('hidden', function () {
    $('#modal-large').html('<div id="modal-progress-large hide"><div class="modal-header"><h1>Loading...</h1></div><div class="modal-body"><div class="progress progress-striped active"><div class="bar" style="width: 100%;"></div></div></div></div>')
  })

});

//Loading for Hooks
$( "#github_dropdown #repo" ).click(function() {
  $( "#loading" ).show();
});
$( document ).ajaxStop(function() {
  $( "#loading" ).hide();
});
