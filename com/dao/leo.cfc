<cfcomponent displayname="Leo Data Access Object Component" 
	hint="Component contains all data access objects for CMS Leo">
	
	<cffunction name="queryLogin" access="private" returntype="query" 
		hint="">
		<cfargument name="_username" type="string" />
		
		<cfset var username = arguments._username />
		<cfset var query    = '' />
		
		<cfquery name="query" datasource="lllickerclicker">
		SELECT username, password, email
		FROM   lllc_users
		WHERE  username = <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<cfreturn query />
	</cffunction>

</cfcomponent>