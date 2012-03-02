$(document).ready(function() {
	$('.form .form_items a').click(function(){
		switch_tabs($(this));
	});
	switch_tabs($('.defaulttab'));
});
 
function switch_tabs(obj) {
	$('.tab_form').hide();
	$('.form .form_items a').removeClass("selected");
	var id = obj.attr("rel");
 
	$('##'+id).show();
	obj.addClass("selected");
}