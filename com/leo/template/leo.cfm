<cfset obj       = StructNew() />
<cfset obj.login = CreateObject('component','com.leo.login.login').init() />
<cfset obj.leo   = CreateObject('component','com.leo.leo.main').init() />

<cfoutput>#obj.leo.main()#</cfoutput>

<cfoutput>
<!DOCTYPE html>
<html>
<head>
<title>CMS Leo</title>
<link rel="icon" type="image/ico" href="/leo/files/favicon.ico" />
<link rel="stylesheet" type="text/css" href="/leo/styles/default/main.css" />
</head>

<body>
<div id="container">
	<div class="navigation_main">
		<ul class="main_menu">
			<li>
				<a href="">MAIN</a>
			</li>
			<li>
				<a href="">CONTENT</a>
			</li>
			<li>
				<a href="">FILES</a>
			</li>
			<li>
				<a href="">STYLES</a>
			</li>
			<li>
				<a href="">HELP</a>
			</li>
			<li> 
				<a href="">LOGOUT</a>
			</li>
		</ul>
	</div>
	<div class="clear"></div>
	
	<div class="content">
		
	</div>
	
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
</div>
</body>
</html>
</cfoutput>
