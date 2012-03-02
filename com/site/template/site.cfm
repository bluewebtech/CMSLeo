<cfoutput>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="google-site-verification" content="FxM9ZdZGzSvE3U0sGcL8cF7kYtcxVTIzpiIq7l6oWZg" />
<meta name="robots" content="index, follow">
<meta name="keywords" content="#keywords#" />
<meta name="description" content="#description#" />
<title>#title#</title>
<link rel="icon" type="image/ico" href="/site/files/favicon.ico" />
<link rel="stylesheet" type="text/css" href="/site/styles/default/main.css" />
<script type="text/javascript" src="/site/scripts/jquery/1.6.2/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="/site/scripts/plugins/socialbar/socialbar.js"></script>
</head>

<body>
<div id="gototop"></div>
<div id="container">
	<div class="header">
		<div class="logo">
			<a href="/">
				<img src="/site/files/logo.png" width="290" height="136" border="0" alt="Blue Web Tech" />
			</a>
		</div>
		<div class="caption">
			<img src="/site/files/caption.png" width="437" height="45" border="0" alt="Passion Is Equivalent To Epicness" />
		</div>
		
		<div class="navigation_main">
			<ul class="main_menu">
				#objSite.navigation()#
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	
	<cfif browser>
		<div class="content">
			<h2>Internet Explorer 6 Alert!</h2>
			<p>Looks like you are using Internet Explorer 6 to view my web site which means it will not render the cool things that I have implemented properly. Sorry, but I will not install unnecessary plugins just to have certain things work for one browser especially when there are 3 newer versions available.</p>
		</div>
	</cfif>
	
	<div class="content">
		#content#
	</div>
	
	<div class="blocks">
		<div class="block">
			<h2>Bloggage</h2>
			<p>Yea, I do the blog thing once and a while. Definitely not as much as other developers do. Feel free to check out my blog which normally contains a good chunk of useful how-to's mostly for the beginning developer.</p>
			<p align="right"><a href="">Click it!</a></p>
		</div>
		<div class="block">
			<h2>Here's My Resume</h2>
			<p>So why would you even want to hire some one for a gig when you have no idea what kind of experience they may have? Only makes sense to have a direct link to a resume I'm sure. My resume is available in <a href="">HTML</a> and <a href="">PDF</a> by clicking the orange links up there.</p>
		</div>
		<div class="block" style="margin:0;">
			<h2>Open Projects</h2>
			<p>I am a strong believer of giving back to the developer community when ever I get the chance, mainly because there are many open source projects that have helped me get to where I am in my career today. Click <a href="">this</a> to  check out a few of my own open projects.</p>
		</div>
		<div class="clear"></div>
	</div>
	
	<div class="content">
		<h2>Most Recent Bloggage</h2>
		<p>Short bloggage description goes here...</p>
	</div>
	
	<div class="content">
		<h2>Awesome Sauce</h2>
		<p>
			<a href="http://codebassradio.net/" target="_blank">
				<img src="/site/files/codebass-radio.png" width="120" height="120" border="0" alt="" align="left" />
			</a>
			<a href="http://www.cfhour.com/" target="_blank">
				<img src="/site/files/cfhour.jpg" width="120" height="120" border="0" alt="" align="left" />
			</a>
			<div class="clear"></div>
		</p>
	</div>
	
	<div class="footer">
		<div class="footerLeft">
			<h2>2011 Blue Web Tech</h2>
		</div>
		<div class="footerRight">
			<a href="http://www.getrailo.org/" target="_blank">
				<img src="/site/files/poweredby.png" width="120" height="68" border="0" alt="" align="right" />
			</a>
		</div>
		<div class="clear"></div>
	</div>
</div>

<!---
<cfset objTwitter = CreateObject('component','com.site.twitter.twitter') />
#objTwitter.twitter()#
--->

<div id="panel">
	<div id="social">
		Social
		<div id="socialItems">
			<a href="http://twitter.com/##!/bluewebtech" target="_blank">
				<img src="/site/files/icon_twitter.png" width="30" height="30" border="0" alt="" class="icon" />
			</a>
			<a href="http://www.facebook.com/people/Peter-Rjabanedelia/100000130855238" target="_blank">
				<img src="/site/files/icon_facebook.png" width="30" height="30" border="0" alt="" class="icon" />
			</a>
			<a href="https://plus.google.com/?hl=en&tab=wX##104258708567447292291/posts" target="_blank">
				<img src="/site/files/icon_googleplus.png" width="30" height="30" border="0" alt="" class="icon" />
			</a>
			<a href="http://www.linkedin.com/pub/peter-rjabanedelia/14/834/a30" target="_blank">
				<img src="/site/files/icon_linkedin.png" width="30" height="30" border="0" alt="" class="icon" />
			</a>
			<a href="http://blog.bluewebtechniques.com/" target="_blank">
				<img src="/site/files/icon_rss.png" width="30" height="30" border="0" alt="" class="icon" />
			</a>
		</div>
	</div>

	<div id="top">
		<a href="##gototop">Top</a>
	</div>
	<div class="clear"></div>
</div>
</body>
</html>
</cfoutput>
