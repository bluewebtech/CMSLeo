<cfset fire     = application.fire />
<cfset event    = application.event />
<cfset host     = obj.database.databaseGetValue('host') />
<cfset port     = obj.database.databaseGetValue('port') />
<cfset database = obj.database.databaseGetValue('database') />
<cfset username = obj.database.databaseGetValue('username') />
<cfset password = obj.database.databaseGetValue('password') />
<cfset validate = obj.database.validation() />

<cfif fire>
	<cfset prefix = obj.database.databaseGetValue('prefix') />
<cfelse>
	<cfset prefix = 'leo_' />
</cfif>

<h2>Database Setup</h2>
<img src="/install/images/im_database.png" width="256" height="256" border="0" align="right" />
<cfoutput>
<form action="/install/?event=database" name="install" method="post">
<cfif fire and !validate>
<p class="error">
	Invalid data provided
</p>
</cfif>
<p>
	Host:<br />
	<input type="text" name="host" size="30" value="#host#" />
</p>
<p>
	Port:<br />
	<input type="text" name="port" size="30" value="#port#" />
</p>
<p>
	Database:<br />
	<input type="text" name="database" size="30" value="#database#" />
</p>
<p>
	Table Prefix:<br />
	<input type="text" name="prefix" size="30" value="#prefix#" />
</p>
<p>
	Username:<br />
	<input type="text" name="username" size="30" value="#username#" />
</p>
<p>
	Password:<br />
	<input type="password" name="password" size="30" value="#password#" />
</p>
<p>
	<input type="submit" name="submit" value="Next" />
	<input type="hidden" name="fire" value="true" />
</p>
</form>
</cfoutput>
