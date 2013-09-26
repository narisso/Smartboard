
//tasks
var _tasks=[]



//loads the tasks ehwn the document is ready
jQuery(document).ready(function($){

  var ask = "/tasks/project_tasks/"+p_id+".json"
	$.getJSON(ask, function(data) {
		_tasks = data;

  		$.each(data, function(i, item) {


  			users ="<div class='block'>";

  			var length = item.users.length,
    		element = null;
			for (var i = 0; i < length; i++) {
  				element = item.users[i];

  				users = users + "<img src='/assets/NA.jpg' data-toggle='tooltip' title='"+element.email+"''></img>";
			}

			users = users + "</div>";


  			task = "<div class='task block'>"+
  					"<i class='icon-move pull-right'></i>"+
  					"<h5>"+ "<a href=projects/" + item.project_id + "/statuses/" + item.status_id + "/tasks/new/"'>"+ item.name +"</a>" +"</h5>"+
  					"<span class='label label-info' style='background-color:"+ item.label.color+";'>"+item.label.name+"</span>"+
  					users +
  					"</div>";

    		$("div[data-id="+item.status_id+"]").append(task);


  		});
 
  		
});



});