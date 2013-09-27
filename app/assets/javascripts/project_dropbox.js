$(document).ready(
function(){

$("#integration_frame").hide();



}

	);


function dropboxIntegration(){
	$("#integration_frame").show();
	var ifr = document.getElementById('integration_frame');
	ifr.src = '/dropbox/authorize'

}