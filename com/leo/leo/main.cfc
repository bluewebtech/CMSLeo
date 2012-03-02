<cfcomponent displayname="Leo Main Component" 
	output="false" 
	hint="Tons and tons and tons of includes">
		
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<cffunction name="leo" access="public" returntype="string" output="false" 
		hint="Method displays the leo template to the screen">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/leo.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="navigation" access="public" returntype="string" output="false" 
		hint="Method displays the navigation to the screen">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/navigation.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="default" access="public" returntype="string" output="false" 
		hint="Method displays the leo template to the screen">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/default.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="redirect" access="private" returntype="string" output="false" 
		hint="">
		<cfset var redirect = '' />
		
		<cfsavecontent variable="redirect">
			<cflocation url="/install/" addtoken="false" />
		</cfsavecontent>
		
		<cfreturn redirect />
	</cffunction>
	
	<cffunction name="events" access="public" returntype="string" output="false" 
		hint="">
		<cfset var event  = application.event />
		<cfset var active = obj.login.loginSessionCheck() />
		
		<cfif active>
			<cfswitch expression="#event#">
				<cfcase value="content">
					<cfreturn obj.content.content() />
				</cfcase>
				
				<cfcase value="files">
					<cfreturn obj.files.files() />
				</cfcase>
				
				<cfcase value="settings">
					<cfreturn obj.settings.settings() />
				</cfcase>
				
				<cfcase value="help">
					<cfreturn obj.help.help() />
				</cfcase>
				
				<cfcase value="logout">
					<cfreturn obj.login.logout() />
				</cfcase>
				
				<cfdefaultcase>
					<cfreturn obj.leo.default() />
				</cfdefaultcase>
			</cfswitch>
		<cfelse>
			<cfreturn obj.login.login() />
		</cfif>
	</cffunction>
	
	<cffunction name="main" access="public" returntype="string" output="false" 
		hint="Method builds the site template and displays it to the screen">
		<!--- Check if application was installed already. If not send user to install screen --->
		<cfif application.installed>
			<cfreturn obj.leo.leo() />
		<cfelse>
			<cfreturn obj.leo.redirect() />
		</cfif>
	</cffunction>

</cfcomponent>
