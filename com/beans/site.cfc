<cfcomponent displayname="Leo Login Bean" 
	output="false" 
	hint="">
	
	<cfparam name="url.page" default="" />
	
	<cfproperty name="page" type="string" />
	
	<cfset variables.instance = {page = ''} />
			          
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="">
		<cfargument name="page" type="string" />
	</cffunction>
	
	<cffunction name="setPage" access="public" returntype="string" output="false" 
		hint="">
		<cfargument name="page" type="string" />
		<cfset variables.page = arguments.page />
	</cffunction>
	<cffunction name="getPage" access="public" returntype="string" output="false" 
		hint="">
		<cfreturn variables.page />
	</cffunction>

</cfcomponent>
