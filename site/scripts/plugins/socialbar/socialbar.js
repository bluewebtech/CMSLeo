$(document).ready(function(){
	$("#social").hover(function () {
		$("#socialItems").fadeToggle("slow");
	});
});

/* ACCIDENTAL EXPOSE LIKE EFFECT
jQuery(document).ready(function(){
	$('#social').hover(function() {
		$('#socialItems').next().toggle('slow');
		return false;
	}).next().hide();
});
*/