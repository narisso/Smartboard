$('#modal-large').modal('hide');
$('#modal').html("<%= escape_javascript(render 'form') %>")
$('#modal').modal('show');

$(document).ready(function(){
    chosenSelect(220);
});
