
//tasks
var _tasks=[]



//loads the tasks ehwn the document is ready
$(document).ready(function() {

	$.getJSON('/tasks/project_tasks/1.json', function(data) {
		_tasks = data;

  		$.each(data, function(i, item) {


  			users ="<div class='block'>";

  			var length = item.users.length,
    		element = null;
			for (var i = 0; i < length; i++) {
  				element = item.users[i];
  				users = users + "<img src='' data-toggle='tooltip' title="+element.name+"></img>";
			}

			users = users + "</div>";


  			task = "<div class='task block'>"+
  					"<i class='icon-move pull-right'></i>"+
  					"<h5>"+ "<a href='../tasks/" + item.id + "'>"+ item.name +"</a>" +"</h5>"+
  					"<span class='label label-info' style='background-color:"+ item.label.color+";'>"+item.label.name+"</span>"+
  					users +
  					"</div>";

    		$("div[data-id="+item.status_id+"]").append(task);


  		});
 
  		
});



});