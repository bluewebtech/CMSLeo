<cfoutput>
<cfcomponent displayname="Configuration Component" 
	output="false" 
	hint="Conponent contains all application configuration setting values">

	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is component constructor">
		<cfset variables.config = {domain       = '#cgi.http_host#',
				                   webroot      = '/',
		                           comroot      = 'com.',
		                           fileroot     = '/site/files/',
		                           datasource   = '#session.install.datasource.dsname#',
		                           table_prefix = '#session.install.database.prefix#'} />
		<cfreturn variables />
	</cffunction>

</cfcomponent>
</cfoutput>
