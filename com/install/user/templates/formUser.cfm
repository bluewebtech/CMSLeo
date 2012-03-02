<cfset fire      = application.fire />
<cfset event     = application.event />
<cfset firstname = obj.user.userGetValue('firstname') />
<cfset lastname  = obj.user.userGetValue('lastname') />
<cfset email     = obj.user.userGetValue('email') />
<cfset password  = obj.user.userGetValue('password') />
<cfset validate  = obj.user.validation() />

<h2>Admin Setup</h2>
<p>Completing the following form will setup the the default admin account information</p>
<img src="/install/images/im_email.png" width="256" height="256" border="0" align="right" />
<cfoutput>
<form action="/install/?event=user" name="install" method="post">
<cfif fire and !validate>
<p class="error">
	Invalid data provided
</p>
</cfif>
<p>
	First Name:<br />
	<input type="text" name="firstname" size="30" value="#firstname#" />
</p>
<p>
	Last Name:<br />
	<input type="text" name="lastname" size="30" value="#lastname#" />
</p>
<p>
	E-mail Address:<br />
	<input type="text" name="email" size="30" value="#email#" />
</p>
<p>
	Username:<br />
	<input type="text" name="username" size="30" value="Admin" readonly="readonly" />
</p>
<p>
	Password:<br />
	<input type="password" name="password" size="30" value="#password#" />
</p>
<p>
	<input type="submit" name="host" value="Install" />
	<input type="hidden" name="fire" value="true" />
</p>
</form>
</cfoutput>
