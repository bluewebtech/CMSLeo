- CMS Leo
		 - Build Version: 1.0-(First Blood)
		 - Author: Peter Rjabanedelia 3rd
		 - Web Site: http://bluewebtech.com
		 - Contact: <None yet just in case this thing sucks>
		 		
		<cfcomponent displayname="Configuration Component" 
			output="false" 
			hint="Conponent contains all application configuration setting values">
		
			<cffunction name="init" access="public" returntype="any" output="false" 
				hint="Method is component constructor">
				<cfset variables.config = {domain       = "http://bluewebtech.dev.1.1/",
						                   webroot      = "/",
				                           comroot      = "com.",
				                           fileroot     = "/site/files/",
				                           datasource   = "bluewebtech",
				                           table_prefix = "bwt_",
				                           installed    = true,
				                           install_date = "2012-01-27"} />
				<cfreturn variables />
			</cffunction>
		
		</cfcomponent>
