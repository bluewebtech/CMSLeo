<cfcomponent displayname="User Install Component" 
	hint="Component contains all events that are used to set up the admin account">

	<cffunction name="init" access="public" returntype="any" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<!--- Templates --->
	
	<cffunction name="userForm" access="private" returntype="void" 
		hint="">
		<cfinclude template="templates/formUser.cfm" />
	</cffunction>
	
	<!--- Values --->
	
	<cffunction name="userValues" access="private" returntype="struct" 
		hint="">
		<cfset var values       = StructNew() />
		<cfset values.firstname = obj.bean.getFirstname() />
		<cfset values.lastname  = obj.bean.getLastname() />
		<cfset values.email     = obj.bean.getEmail() />
		<cfset values.username  = obj.bean.getUsername() />
		<cfset values.password  = obj.bean.getPassword() />
		
		<cfreturn values />
	</cffunction>
	
	<cffunction name="userGetValue" access="private" returntype="string" 
		hint="">
		<cfargument name="_value" type="string" />
		
		<cfset var value  = arguments._value />
		<cfset var values = obj.user.userValues() />
		
		<cfreturn values[value] />
	</cffunction>
	
	<cffunction name="userSessionValues" access="private" returntype="void" output="true" 
		hint="">
		<cflock name="session.install" timeout="30">
			<cfset session.install.user.firstname = obj.user.userGetValue('firstname') />
			<cfset session.install.user.lastname  = obj.user.userGetValue('lastname') />
			<cfset session.install.user.email     = obj.user.userGetValue('email') />
			<cfset session.install.user.username  = obj.user.userGetValue('username') />
			<cfset session.install.user.password  = hash(obj.user.userGetValue('password'),'MD5') />
		</cflock>
	</cffunction>
	
	<!--- Validation --->
	
	<cffunction name="firstnameVal" access="private" returntype="boolean" 
		hint="">
		<cfset var firstname = obj.user.userGetValue('firstname') />
		<cfreturn application.framework.validation.validate('string',firstname) />
	</cffunction>
	
	<cffunction name="lastnameVal" access="private" returntype="boolean" 
		hint="">
		<cfset var lastname = obj.user.userGetValue('lastname') />
		<cfreturn application.framework.validation.validate('string',lastname) />
	</cffunction>
	
	<cffunction name="emailVal" access="private" returntype="boolean" 
		hint="">
		<cfset var email = obj.user.userGetValue('email') />
		<cfreturn application.framework.validation.validate('email',email) />
	</cffunction>
	
	<cffunction name="usernameVal" access="private" returntype="boolean" 
		hint="">
		<cfset var username = obj.user.userGetValue('username') />
		<cfreturn application.framework.validation.validate('string',username) />
	</cffunction>
	
	<cffunction name="passwordVal" access="private" returntype="boolean" 
		hint="">
		<cfset var password = obj.user.userGetValue('password') />
		<cfreturn application.framework.validation.validate('string',password) />
	</cffunction>
	
	<cffunction name="validation" access="private" returntype="boolean" 
		hint="Method validates all database user input as a whole and returns a boolean">
		<cfset var validate             = ArrayNew(1) />
		<cfset var validateArrayToList  = '' />
		<cfset var validateListContains = '' />
		
		<cfset validate[1]          = obj.user.firstnameVal() />
		<cfset validate[2]          = obj.user.lastnameVal() />
		<cfset validate[3]          = obj.user.emailVal() />
		<cfset validate[4]          = obj.user.usernameVal() />
		<cfset validate[5]          = obj.user.passwordVal() />
		<cfset validateArrayToList  = ArrayToList(validate) />
		<cfset validateListContains = ListContains(validateArrayToList,false) />
		
		<cfif validateListContains eq 0>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
	
	<!--- Default --->
	
	<cffunction name="process" access="public" returntype="void" output="true" 
		hint="">
		<cfset var fire     = application.fire />
		<cfset var validate = obj.user.validation() />
		
		<cfif fire>
			
			<cfif validate>
				#obj.user.userSessionValues()#
				<cflocation url="/install/?event=building" addtoken="false" />
			<cfelse>
				#obj.user.userForm()#
			</cfif>
						
		<cfelse>
			#obj.user.userForm()#
		</cfif>
	</cffunction>
	
	<!--- Default --->
	
	<cffunction name="user" access="public" returntype="void" output="true" 
		hint="Method is component main">
		#obj.user.process()#
	</cffunction>

</cfcomponent>
