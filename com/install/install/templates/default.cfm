<cfoutput>
<cfif !application.installed>
	<h2>CMS Leo Installer</h2>
	<img src="/leo/files/logo.png" width="150" height="247" border="0" align="right" />
	<p>Follow the instructions on each screen to complete the installation of CMS Leo.</p>
	<p>Version: 1.0 beta</p>
	<form action="/install/?event=database" name="install" method="post">
	<p>
		<input type="submit" name="submit" value="Begin" />
	</p>
	</form>
<cfelse>
	<h2>Whoa Whoa Whoa! Looks like CMS Leo is already installed.</h2>
	<img src="/leo/files/logo.png" width="150" height="247" border="0" align="right" />
	<p>Click <a href="/leo/">here</a> to go to the admin panel</p>
	<p>Click <a href="#application.domain#">here</a> to go to your site.</p>
</cfif>
</cfoutput>