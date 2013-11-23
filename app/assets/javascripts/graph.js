function loadGraph(){
  var initial_date = $('#initial_date');
  var final_date = $('#final_date');

  if(initial_date.val() != "" && final_date.val() != "")
  {
    $('#charts_tabs').css("display", "");
    var initial_date = initial_date.val();
    var final_date = final_date.val();

    $("#graph1").html("");
    var data_path = "reports_hours_users";
    var dom_id = "#graph1";
    hierarchicalGraphInit(dom_id, data_path, initial_date, final_date);

    $("#graph2").html("");
    var data_path = "reports_tasks_user";
    var dom_id = "#graph2";
    hierarchicalGraphInit(dom_id, data_path, initial_date, final_date);


    $("#graph3").html("");
    var data_path = "reports_tasks_project";
    var dom_id = "#graph3";
    hierarchicalGraphInit(dom_id, data_path, initial_date, final_date);

    $("#graph4").html("");
    var data_path = "reports_use_case";
    var dom_id = "#graph4";
    collapseTreeInit(dom_id, data_path);

  }

}

chosenSelect(200);
$('#initial_date').datepicker();
$('#final_date').datepicker();

loadGraph();

$('#final_date').change(function(){
  loadGraph();
});

$('#initial_date').change(function(){
  loadGraph();
});