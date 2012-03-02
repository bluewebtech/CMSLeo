<cfset active = obj.login.loginSessionCheck() />
<cfset action = application.action />

<cfoutput>
<!DOCTYPE html>
<html>
<head>
<title>CMS Leo</title>
<link rel="icon" type="image/ico" href="/leo/files/favicon.ico" />
<link rel="stylesheet" type="text/css" href="/leo/styles/default/main.css" />
<script language="javascript" src="/leo/scripts/jquery/1.6.2/jquery-1.6.2.js"></script>
<cfif action eq "create" or action eq "update">
<script language="javascript" src="/leo/scripts/plugins/tinymce_3.4.8/jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" src="/leo/scripts/plugins/tinymce_3.4.8/content.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	$('.form .form_items a').click(function(){
		switch_tabs($(this));
	});
	switch_tabs($('.defaulttab'));
	
	function switch_tabs(obj) {
		$('.tab_form').hide();
		$('.form .form_items a').removeClass("selected");
		var id = obj.attr("rel");
	 
		$('##'+id).show();
		obj.addClass("selected");
	}
	
	$("div.error_block").delay(3000).fadeOut("slow");
});
</script>
<cfelse>
<script type="text/javascript">
$(document).ready(function() {
	$('##username').focus();
	$("div.error_block").delay(3000).fadeOut("slow");
});
</script>
</cfif>
</head>

<body>
<div id="container">
	
	<cfif active>
	<div class="navigation_main">
		<ul class="main_menu">
			<li>
				<a href="?event=">MAIN</a>
			</li>
			<li>
				<a href="?event=content">CONTENT</a>
			</li>
			<li>
				<a href="?event=files">FILES</a>
			</li>
			<li>
				<a href="?event=settings">MODULES</a>
			</li>
			<li>
				<a href="?event=settings">SETTINGS</a>
			</li>
			<li>
				<a href="?event=help">HELP</a>
			</li>
			<li> 
				<a href="?event=logout">LOGOUT</a>
			</li>
		</ul>
	</div>
	<div class="clear"></div>
	</cfif>
	
	<div class="content">
		#obj.leo.events()#
		<div class="clear"></div>
	</div>
	
	<cfif active>
	<div class="footer">
		<div class="footerLeft">
			<h2>2012 Blue Web Tech</h2>
		</div>
		<div class="footerRight">
			<a href="http://www.getrailo.org/" target="_blank">
				<img src="/site/files/poweredby.png" width="120" height="68" border="0" alt="" align="right" />
			</a>
		</div>
		<div class="clear"></div>
	</div>
	</cfif>
	
</div>

#obj.toolbar.toolbar()#
</body>
</html>
</cfoutput>
