<cfset fire     = application.fire />
<cfset validate = obj.login.processVal() />

<cfif fire and !validate>
<div class="error_block">
	Bad login stuff provided!
</div>
</cfif>

<div style="margin-left:25%">
<img src="/leo/files/logo.png" width="100" height="165" border="0" align="left" />
<h2>CMS Leo Login</h2>
<form action="" name="loginForm" method="post">
<p>
	<input type="text" name="username" id="username" size="30" />
</p>
<p>
	<input type="password" name="password" id="password" size="30" />
</p>
<p>
	<input type="submit" name="login" value="Login" />
	<input type="hidden" name="fire" value="true" />
</p>
</form>
</div>