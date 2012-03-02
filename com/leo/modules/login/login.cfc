<cfcomponent displayname="CMS Leo Login Component" 
	output="false" 
	extends="com.leo.modules.login.dao" 
	hint="Component contains all methods necessary for the admin login">
	
	<cfparam name="session.leo.active" default="" />
	
	<cfset variables.redirect = '?event=' />
	
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<!--- Templates --->

	<cffunction name="formLogin" access="private" returntype="string" output="false" 
		hint="Method contains the login form template">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/formLogin.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<!--- Values --->
	
	<cffunction name="loginValues" access="private" returntype="struct" output="false" 
		hint="Populate a structure full of passed form values">
		<cfset var values      = StructNew() />
		<cfset values.username = obj.bean.getUsername() />
		<cfset values.password = obj.bean.getPassword() />
		
		<cfreturn values />
	</cffunction>
	
	<cffunction name="loginValueGet" access="private" returntype="string" output="false" 
		hint="Method returns a specified value that exists in the passed form value structure">
		<cfargument name="_value" type="any" />
		
		<cfset var value       = ARGUMENTS._value />
		<cfset var valueStruct = obj.login.loginValues() />
		
		<cfreturn valueStruct[value] />
	</cffunction>
	
	<!--- Validation --->
	
	<cffunction name="usernameVal" access="private" returntype="boolean" output="false" 
		hint="">
		<cfset var username    = obj.login.loginValueGet('username') />
		<cfset var usernameLen = len(obj.login.loginValueGet('username')) />
		<cfset var query       = obj.login.daoLogin(username) />
		<cfset var total       = query.recordcount />
		
		<cfif usernameLen gt 0 and total gt 0>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
	
	<cffunction name="passwordVal" access="private" returntype="boolean" output="false" 
		hint="">
		<cfset var password     = obj.login.loginValueGet('password') />
		<cfset var passwordLen  = len(password) />
		<cfset var username     = obj.login.loginValueGet('username') />
		<cfset var query        = obj.login.daoLogin(username) />
		<cfset var passwordDB   = query.password />
		<cfset var passwordHash = hash(password,'MD5') />
		
		<cfif passwordLen gt 0 and passwordHash eq passwordDB>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
	
	<cffunction name="processVal" access="private" returntype="boolean" output="false" 
		hint="">
		<cfset var validation          = ArrayNew() />
		<cfset var validationToList    = '' />
		<cfset var validationListCheck = '' />
		
		<cfset validation[1] = obj.login.usernameVal() />
		<cfset validation[2] = obj.login.passwordVal() />
		
		<cfset validationToList    = ArrayTolist(validation) />
		<cfset validationListCheck = ListContains(validationToList,false) />
		
		<cfif validationListCheck gt 0>
			<cfreturn false />
		<cfelse>
			<cfreturn true />
		</cfif>
	</cffunction>
	
	<!--- Session management --->
	
	<cffunction name="loginSessionStart" access="private" returntype="string" output="false" 
		hint="Method initializes the main application session">
		<cfset var redirect = obj.login.redirect />
		<cfset var username = obj.login.loginValueGet('username') />
		<cfset var query    = obj.login.daoLogin(username) />
		<cfset var loginSession = '' />
		
		<cfsavecontent variable="loginSession">
			<cflock scope="session" timeout="30">
				<cfset session.leo.user        = query.username />
				<cfset session.leo.permissions = query.permissions />
				<cfset session.leo.active      = true />
			</cflock>
			
			<cflocation url="#redirect#" addtoken="false" />
		</cfsavecontent>
		
		<cfreturn loginSession />
	</cffunction>
	
	<cffunction name="loginSessionCheck" access="private" returntype="boolean" output="false" 
		hint="Method checks whether the main application session has been initialized">
		<cfif len(session.leo.active) GT 0>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
	
	<cffunction name="logout" access="public" returntype="string" output="false" 
		hint="Method handles the logging out of the current user by deleting the users session structure">
		<cfset var redirect     = obj.login.redirect />
		<cfset var loginSession = '' />
		
		<cfsavecontent variable="loginSession">
			<cfset StructClear(session.leo) />
			<cflocation url="#redirect#" addtoken="false" />
		</cfsavecontent>
		
		<cfreturn loginSession />
	</cffunction>
	
	<!--- Processing --->
	
	<cffunction name="process" access="public" returntype="string" output="false" 
		hint="">
		<cfset var fire       = application.fire />
		<cfset var validation = obj.login.processVal() />
		
		<cfif fire>
			
			<cfif validation>
				<cfreturn obj.login.loginSessionStart() />
			<cfelse>
				<cfreturn obj.login.formLogin() />
			</cfif>
			
		<cfelse>
			<cfreturn obj.login.formLogin() />
		</cfif>
	</cffunction>
	
	<cffunction name="login" access="public" returntype="string" output="false" 
		hint="">
		<cfreturn obj.login.process() />
	</cffunction>

</cfcomponent>
