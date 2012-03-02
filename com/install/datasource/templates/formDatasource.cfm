<cfset fire      = application.fire />
<cfset event     = application.event />
<cfset dsname    = obj.datasource.datasourceGetValue('dsname') />
<cfset dstype    = obj.datasource.datasourceGetValue('dstype') />
<cfset admintype = obj.datasource.datasourceGetValue('admintype') />
<cfset password  = obj.datasource.datasourceGetValue('password') />
<cfset validate  = obj.datasource.validation() />

<h2>Datasource Setup</h2>
<img src="/install/images/im_database.png" width="256" height="256" border="0" align="right" />
<cfoutput>
<form action="/install/?event=datasource" name="install" method="post">
<cfif fire and !validate>
<p class="error">
	Invalid data provided
</p>
</cfif>
<p>
	Datasource Name:<br />
	<input type="text" name="dsname" size="30" value="#dsname#" />
</p>
<p>
	Datasource Type:<br />
	<select name="dstype" length="30">
		<option value="mysql">MySQL</option>
	</select>
</p>
<p>
	Admin Type:<br />
	<select name="admintype" width="30">
		<cfif !fire>
		<option value=""> - Select - </option>
		<cfelse>
			<option value="#admintype#">#admintype#</option>
		</cfif>
		<option value="Server">Server</option>
		<option value="Web">Web</option>
	</select>
</p>
<p>
	Password:<br />
	<input type="password" name="password" size="30" value="#password#" />
</p>
<p>
	Database:<br />
	<input type="text" size="30" readonly="readonly" value="#session.install.database.database#" />
</p>
<p>
	<input type="submit" name="submit" value="Next" />
	<input type="hidden" name="fire" value="true" />
</p>
<p>
	NOTE:<br />
	As of version 1.0, only MySQL databases are supported.
</p>
</form>
</cfoutput>
