
//tasks
var _tasks=[]



//loads the tasks ehwn the document is ready
$(document).ready(function() {

	$.getJSON('/tasks/project_tasks/1.json', function(data) {
		_tasks = data;

  		$.each(data, function(i, item) {

  			task = "<div class='task block'>"+
  					"<h5>"+ "<a href='tasks/" + item.id + "'>"+ item.name +"</a>" +"</h5>"+
  					"</div>";

    		$("div[data-id="+item.status_id+"]").append(task);


  		});
 
  		
});



});