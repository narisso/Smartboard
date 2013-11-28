jQuery(document).ready(function($) {

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
