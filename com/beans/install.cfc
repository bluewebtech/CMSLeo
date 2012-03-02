<cfcomponent displayname="Installation Bean"
	output="false" 
	hint="Component contains all installation setter and getters">
	
	<cfparam name="form.host"      default="" />
	<cfparam name="form.port"      default="" />
	<cfparam name="form.database"  default="" />
	<cfparam name="form.prefix"    default="" />
	<cfparam name="form.username"  default="" />
	<cfparam name="form.password"  default="" />
	<cfparam name="form.firstname" default="" />
	<cfparam name="form.lastname"  default="" />
	<cfparam name="form.email"     default="" />
	<cfparam name="form.dsname"    default="" />
	<cfparam name="form.dstype"    default="" />
	<cfparam name="form.admintype" default="" />
	
	<cfproperty name="host"      type="string" />
	<cfproperty name="port"      type="string" />
	<cfproperty name="database"  type="string" />
	<cfproperty name="prefix"    type="string" />
	<cfproperty name="username"  type="string" />
	<cfproperty name="password"  type="string" />
	<cfproperty name="firstname" type="string" />
	<cfproperty name="lastname"  type="string" />
	<cfproperty name="email"     type="string" />
	<cfproperty name="dsname"    type="string" />
	<cfproperty name="dstype"    type="string" />
	<cfproperty name="admintype" type="string" />
	
	<cfset variables.instance = {host      = '',
			                     port      = '',
			                     database  = '',
			                     prefix    = '',
			                     username  = '',
			                     password  = '',
			                     firstname = '',
			                     lastname  = '',
			                     email     = '',
			                     dsname    = '',
			                     dstype    = '',
			                     admintype = ''} />
	
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is constructor">
		<cfargument name="host"      type="string" />
		<cfargument name="port"      type="string" />
		<cfargument name="database"  type="string" />
		<cfargument name="prefix"    type="string" />
		<cfargument name="username"  type="string" />
		<cfargument name="password"  type="string" />
		<cfargument name="firstname" type="string" />
		<cfargument name="lastname"  type="string" />
		<cfargument name="email"     type="string" />
		<cfargument name="dsname"    type="string" />
		<cfargument name="dstype"    type="string" />
		<cfargument name="admintype" type="string" />
		<cfreturn variables />
	</cffunction>
	
	<cffunction name="setHost" access="public" returntype="string" output="false" 
		hint="Host setter">
		<cfargument name="host" type="string" />
		<cfset variables.host = arguments.host />
	</cffunction>
	<cffunction name="getHost" access="public" returntype="string" output="false" 
		hint="Host getter">
		<cfreturn variables.host />
	</cffunction>
	
	<cffunction name="setPort" access="public" returntype="string" output="false" 
		hint="Port setter">
		<cfargument name="port" type="string" />
		<cfset variables.port = arguments.port />
	</cffunction>
	<cffunction name="getPort" access="public" returntype="string" output="false" 
		hint="Port getter">
		<cfreturn variables.port />
	</cffunction>
	
	<cffunction name="setDatabase" access="public" returntype="string" output="false" 
		hint="Database setter">
		<cfargument name="database" type="string" />
		<cfset variables.database = arguments.database />
	</cffunction>
	<cffunction name="getDatabase" access="public" returntype="string" output="false" 
		hint="Database getter">
		<cfreturn variables.database />
	</cffunction>
	
	<cffunction name="setPrefix" access="public" returntype="string" output="false" 
		hint="Prefix setter">
		<cfargument name="prefix" type="string" />
		<cfset variables.prefix = arguments.prefix />
	</cffunction>
	<cffunction name="getPrefix" access="public" returntype="string" output="false" 
		hint="Prefix getter">
		<cfreturn variables.prefix />
	</cffunction>
	
	<cffunction name="setUsername" access="public" returntype="string" output="false" 
		hint="Username setter">
		<cfargument name="username" type="string" />
		<cfset variables.username = arguments.username />
	</cffunction>
	<cffunction name="getUsername" access="public" returntype="string" output="false" 
		hint="Username getter">
		<cfreturn variables.username />
	</cffunction>
	
	<cffunction name="setPassword" access="public" returntype="string" output="false" 
		hint="Password setter">
		<cfargument name="password" type="string" />
		<cfset variables.password = arguments.password />
	</cffunction>
	<cffunction name="getPassword" access="public" returntype="string" output="false" 
		hint="Password getter">
		<cfreturn variables.password />
	</cffunction>
	
	<cffunction name="setFirstname" access="public" returntype="string" output="false" 
		hint="Firstname setter">
		<cfargument name="firstname" type="string" />
		<cfset variables.firstname = arguments.firstname />
	</cffunction>
	<cffunction name="getFirstname" access="public" returntype="string" output="false" 
		hint="Firstname getter">
		<cfreturn variables.firstname />
	</cffunction>
	
	<cffunction name="setLastname" access="public" returntype="string" output="false" 
		hint="Lastname setter">
		<cfargument name="lastname" type="string" />
		<cfset variables.lastname = arguments.lastname />
	</cffunction>
	<cffunction name="getLastname" access="public" returntype="string" output="false" 
		hint="Lastname getter">
		<cfreturn variables.lastname />
	</cffunction>
	
	<cffunction name="setEmail" access="public" returntype="string" output="false" 
		hint="Email setter">
		<cfargument name="email" type="string" />
		<cfset variables.email = arguments.email />
	</cffunction>
	<cffunction name="getEmail" access="public" returntype="string" output="false" 
		hint="Email getter">
		<cfreturn variables.email />
	</cffunction>
	
	<cffunction name="setDSName" access="public" returntype="string" output="false" 
		hint="Datasource Name setter">
		<cfargument name="dsname" type="string" />
		<cfset variables.dsname = arguments.dsname />
	</cffunction>
	<cffunction name="getDSName" access="public" returntype="string" output="false" 
		hint="Datasource Name getter">
		<cfreturn variables.dsname />
	</cffunction>
	
	<cffunction name="setDSType" access="public" returntype="string" output="false" 
		hint="Datasource Type setter">
		<cfargument name="dstype" type="string" />
		<cfset variables.dstype = arguments.dstype />
	</cffunction>
	<cffunction name="getDSType" access="public" returntype="string" output="false" 
		hint="Datasource Type getter">
		<cfreturn variables.dstype />
	</cffunction>
	
	<cffunction name="setAdminType" access="public" returntype="string" output="false" 
		hint="Admin Type setter">
		<cfargument name="admintype" type="string" />
		<cfset variables.admintype = arguments.admintype />
	</cffunction>
	<cffunction name="getAdminType" access="public" returntype="string" output="false" 
		hint="Admin Type getter">
		<cfreturn variables.admintype />
	</cffunction>
	
</cfcomponent>
