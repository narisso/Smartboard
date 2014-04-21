jQuery(document).ready(function($) {

  PrivatePub.sign({
    channel: s_channel,
    timestamp: s_times,
    signature: s_signature,
    server: s_server
  });

  PrivatePub.subscribe(s_channel, function(data, channel) {
    
    data.move = jQuery.parseJSON(data.move)
    if(data.move.signature != s_signature)
    {
      if(data.move.type == "task")
      {
        from = $("ul[data-id="+data.move.ocol+"]").find("li[data-id="+data.move.id+"]").parent();
        from.attr("href",status_path+"/statuses/"+data.move.col+"/tasks/"+data.move.id)

        var old_i = Math.floor(  $("ul[data-id="+data.move.ocol+"]").children().length*100/totalTasks );
        var new_i = Math.floor(  $("ul[data-id="+data.move.col+"]").children().length*100/totalTasks );

        $("ul[data-id="+data.move.col+"]").insertAt(data.move.index,from);    

        $("ul[data-id="+data.move.ocol+"]").parent().children(".task-percentage").html(old_i + "% of total tasks");
        $("ul[data-id="+data.move.col+"]").parent().children(".task-percentage").html(new_i + "% of total tasks");
      }
    }
  });

  $('#myModal').on('hidden', function () {
    $('#myModal').html('<div id="modal-progress-large hide"><div class="modal-header"><h1>Loading...</h1></div><div class="modal-body"><div class="progress progress-striped active"><div class="bar" style="width: 100%;"></div></div></div></div>')
  })

  $.ajax({
  url: document.URL + "/show_tutorial",
  dataType: 'html',
  success: function (data, textStatus, xhr) {
  			if(xhr.status == 204)
  			{
  				$('#myModal').html(data)
  			}
  			else if(xhr.status == 200)
  			{
            	$('#myModal').html(data)
            	$('#myModal').modal('show')
        	}
        }
	})
});

function filterByAllClick()
{
  var date_string = $( "#tasks-created" )[0].value
  var opt = $( "#filter_own" ).prop('checked')
  var query = $("#filter_search").val()

  if($( "#tasks-created" )[0].value =="Last Week") {
    var date = new Date(Date.now());
    date.setDate(date.getDate()-7);
    date.setHours(0);
    date.setMinutes(0);
    date.setSeconds(0);
    filterByAll(opt,date,query);
  }
  else if($( "#tasks-created" )[0].value =="Today"){
    var date = new Date(Date.now());
    date.setDate(date.getDate()-1);
    date.setHours(0);
    date.setMinutes(0);
    date.setSeconds(0);

    filterByAll(opt,date,query);
  }
  else if($( "#tasks-created" )[0].value =="Last Month"){
    var date = new Date(Date.now());
    date.setMonth(date.getMonth()-2);
    date.setHours(0);
    date.setMinutes(0);
    date.setSeconds(0);

    filterByAll(opt,date,query);
  }
  else {
    var date = new Date("October 16, 1989 00:00:00");
    filterByAll(opt,date,query);

  }

}

function filterByAll(opt,date,query){

  $(".sortable").children().each(
    function(index){
      var stringdate = new String($(this).children("li").data("created")).replace(' UTC', '');
      stringdate = stringdate.split(' ')[0];
      var dateItem = new Date();
      var user = $(this).find("img[alt='"+current_user+"']").size()
      var name = $(this).find("div[class='overflow-wrapper']:contains('"+query+"')").size()

      dateItem.setUTCFullYear( parseInt(stringdate.split('-')[0]) );
      dateItem.setUTCMonth( parseInt(stringdate.split('-')[1])-1 );
      dateItem.setUTCDate( parseInt(stringdate.split('-')[2]) );
      dateItem.setUTCHours(0);
      dateItem.setUTCMinutes(0);
      dateItem.setUTCSeconds(0);

      if( dateItem>=date && ( user>0 || !opt) && name >0){
        $(this).show();
        $(this).removeAttr("vis");
      }
      else{
        $(this).hide();
        $(this).attr("vis","hidden");
      }
    });
    $(".sortable").each(function(index) {
      var i = Math.floor( $(this).children("[vis!='hidden']").length*100/totalTasks );
      $(this).parent().children(".task-percentage").html(i + "% of total tasks");
    });
}


  $(function(){ //DOM Ready
 
  $(function() {
    var select = $( "#tasks-created" );
    select.hide();
    var slider = $( "<div id='slider' style='width:200px; display: inline-block; margin-top:10px; margin-left: 20px; margin-right: 20px;'></div>" ).insertAfter( select ).slider({
      min: 1,
      max: 4,
      range: "min",
      value: select[ 0 ].selectedIndex + 1,
      slide: function( event, ui ) {
          select[ 0 ].selectedIndex = ui.value - 1;
          $(".tasks-created-label").html(select[ 0 ].value)
          filterByAllClick();
        }
    });

    var checkbox = $("#filter_own");
    checkbox.change(function () {
      filterByAllClick();
    });

    var searchbox = $("#filter_search");
    searchbox.keyup(function () {
      filterByAllClick();
    });
    searchbox.keydown(function(event){
      if(event.keyCode == 13) {
        event.preventDefault();
        return false;
      }
    });

  });



    $('ul.board').sortable({
      handle: ".handle",
       stop: function(event, ui){
                var children = $(ui.item).parents(".board").children("li");

                children.each(function() {

                  var id = $(this).data("id");
                  var col = $(this).index();

                  $.post( "statuses/update_order", { status_id: id, num: col } );

                })
          }
    });

  $( "ul.sortable" ).sortable({
      cursor: "move",
      items: "a",
      connectWith: "ul.sortable",
      placeholder: "ui-state-highlight-board",
      forcePlaceholderSize: true,
      helper: "clone",
        appendTo: 'body',
        containment: 'body',        
        scroll: false,   
      start: function (event, ui) {
            var i = Math.floor(  ($(ui.item).parent().children().length-2)*100/totalTasks );
            $(ui.item).parent().parent().children(".task-percentage").html(i + "% of total tasks");
            $(ui.helper).addClass("dragging"); 
            $(ui.helper).appendTo('body');

      },
      stop: function(event, ui){
            var id = $(ui.item).find("li").data("id")
            var col = $(ui.item).parents(".column").data("id")
            var index = $(ui.item).index();
            $(ui.item).attr("href",status_path+"/statuses/"+col+"/tasks/"+id)
            $.post( "tasks/update_status", { task_id: id, col: col, index: index, signature: s_signature } );
            var i = Math.floor(  $(ui.item).parent().children().length*100/totalTasks );
            $(ui.item).parent().parent().children(".task-percentage").html(i + "% of total tasks");
      }
    });
         
  $('.hide').removeClass('hide');
  $('.progress').addClass('hide');


  $('.loading').addClass('hide');
  $('.main-content-small').addClass('main-content-big');
});
