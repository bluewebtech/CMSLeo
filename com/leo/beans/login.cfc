<cfcomponent displayname="Leo Login Bean" 
	output="false" 
	hint="">
	
	<cfproperty name="username" type="string" />
	<cfproperty name="password" type="string" />
	
	<cfparam name="form.username" default="" />
	<cfparam name="form.password" default="" />
	
	<cfset variables.instance = {username = '',
			                     password = ''} />
			          
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="">
		<cfargument name="username" type="string" />
		<cfargument name="password" type="string" />
	</cffunction>
	
	<cffunction name="setUsername" access="public" returntype="string" output="false" 
		hint="">
		<cfargument name="username" type="string" />
		<cfset variables.username = arguments.username />
	</cffunction>
	<cffunction name="getUsername" access="public" returntype="string" output="false" 
		hint="">
		<cfreturn variables.username />
	</cffunction>
	
	<cffunction name="setPassword" access="public" returntype="string" output="false" 
		hint="">
		<cfargument name="password" type="string" />
		<cfset variables.password = arguments.password />
	</cffunction>
	<cffunction name="getPassword" access="public" returntype="string" output="false" 
		hint="">
		<cfreturn variables.password />
	</cffunction>

</cfcomponent>
