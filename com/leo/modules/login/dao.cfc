<cfcomponent displayname="Leo Login Component" 
	hint="Component contains all data access objects for the login module">

	<cffunction name="daoLogin" access="private" returntype="query" 
		hint="Method takes the argumented username string and returns a query with all available matches">
		<cfargument name="_user" type="string" />
		
		<cfset var user  = arguments._user />
		<cfset var query = '' />
		
		<cfquery name="query" datasource="#application.datasource#">
		SELECT u.username, u.password, u.permissions
		FROM   #application.table_prefix#users u
		WHERE  u.username = <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<cfreturn query />
	</cffunction>

</cfcomponent>