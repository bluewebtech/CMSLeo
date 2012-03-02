<cfcomponent displayname="Database Install Component" 
	hint="Component contains all events that are used to install the database">
	
	<cffunction name="init" access="public" returntype="any" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<!--- Templates --->
	
	<cffunction name="databaseForm" access="private" returntype="void" 
		hint="Method contains the database ">
		<cfinclude template="templates/formDatabase.cfm" />
	</cffunction>
	
	<!--- Values --->
	
	<cffunction name="databaseValues" access="private" returntype="struct" 
		hint="">
		<cfset var values      = StructNew() />
		<cfset values.host     = obj.bean.getHost() />
		<cfset values.port     = obj.bean.getPort() />
		<cfset values.database = obj.bean.getDatabase() />
		<cfset values.prefix   = obj.bean.getPrefix() />
		<cfset values.username = obj.bean.getUsername() />
		<cfset values.password = obj.bean.getPassword() />
		
		<cfreturn values />
	</cffunction>
	
	<cffunction name="databaseGetValue" access="private" returntype="string" 
		hint="">
		<cfargument name="_value" type="string" />
		
		<cfset var value  = arguments._value />
		<cfset var values = obj.database.databaseValues() />
		
		<cfreturn values[value] />
	</cffunction>
	
	<cffunction name="databaseSessionValues" access="private" returntype="void" output="true" 
		hint="">
		<cflock name="session.install" timeout="30">
			<cfset session.install.database.host     = obj.database.databaseGetValue('host') />
			<cfset session.install.database.port     = obj.database.databaseGetValue('port') />
			<cfset session.install.database.database = obj.database.databaseGetValue('database') />
			<cfset session.install.database.prefix   = obj.database.databaseGetValue('prefix') />
			<cfset session.install.database.username = obj.database.databaseGetValue('username') />
			<cfset session.install.database.password = obj.database.databaseGetValue('password') />
		</cflock>
	</cffunction>
	
	<!--- Validation --->
	
	<cffunction name="hostVal" access="private" returntype="boolean" 
		hint="">
		<cfset var host = obj.database.databaseGetValue('host') />
		<cfreturn application.framework.validation.ipValidate(host) />
	</cffunction>
	
	<cffunction name="portVal" access="private" returntype="boolean" 
		hint="">
		<cfset var port = obj.database.databaseGetValue('port') />
		<cfreturn application.framework.validation.validate('string',port) />
	</cffunction>
	
	<cffunction name="databaseVal" access="private" returntype="boolean" 
		hint="">
		<cfset var database = obj.database.databaseGetValue('database') />
		<cfreturn application.framework.validation.validate('string',database) />
	</cffunction>
	
	<cffunction name="prefixVal" access="private" returntype="boolean" 
		hint="">
		<cfset var prefix = obj.database.databaseGetValue('prefix') />
		<cfreturn application.framework.validation.validate('string',prefix) />
	</cffunction>
	
	<cffunction name="usernameVal" access="private" returntype="boolean" 
		hint="">
		<cfset var username = obj.database.databaseGetValue('username') />
		<cfreturn application.framework.validation.validate('string',username) />
	</cffunction>
	
	<cffunction name="passwordVal" access="private" returntype="boolean" 
		hint="">
		<cfset var password = obj.database.databaseGetValue('password') />
		<cfreturn application.framework.validation.validate('string',password) />
	</cffunction>
	
	<cffunction name="validation" access="private" returntype="boolean" 
		hint="Method validates all database user input as a whole and returns a boolean">
		<cfset var validate             = ArrayNew(1) />
		<cfset var validateArrayToList  = '' />
		<cfset var validateListContains = '' />
		
		<cfset validate[1]          = obj.database.hostVal() />
		<cfset validate[2]          = obj.database.portVal() />
		<cfset validate[3]          = obj.database.databaseVal() />
		<cfset validate[4]          = obj.database.prefixVal() />
		<cfset validate[5]          = obj.database.usernameVal() />
		<cfset validate[6]          = obj.database.passwordVal() />
		<cfset validateArrayToList  = ArrayToList(validate) />
		<cfset validateListContains = ListContains(validateArrayToList,false) />
		
		<cfif validateListContains eq 0>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
	
	<cffunction name="process" access="private" returntype="void" output="true" 
		hint="">
		<cfset var fire     = application.fire />
		<cfset var validate = obj.database.validation() />
		
		<cfif fire>
			
			<cfif validate>
				#obj.database.databaseSessionValues()#
				<cflocation url="/install/?event=datasource" addtoken="false" />
			<cfelse>
				#obj.database.databaseForm()#
			</cfif>
			
		<cfelse>
			#obj.database.databaseForm()#
		</cfif>
	</cffunction>
	
	<!--- Default --->
	
	<cffunction name="database" access="public" returntype="void" output="true" 
		hint="Method is component main">
		#obj.database.process()#
	</cffunction>

</cfcomponent>
