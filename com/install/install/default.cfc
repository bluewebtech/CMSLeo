<cfcomponent displayname="Installation Component" 
	hint="Component is the central location where all installation methods are fired off">
	
	<cffunction name="init" access="public" returntype="any" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<cffunction name="defaultTemplate" access="private" returntype="void" 
		hint="Method contains the default installation screen template">
		<cfinclude template="templates/default.cfm" />
	</cffunction>
	
	<cffunction name="openInstallSession" access="private" returntype="void" 
		hint="Method opens up a session specifically for the installation of the application">
		<cfset var session.install = StructNew() />
	</cffunction>
	
	<cffunction name="events" access="public" returntype="void" output="true" 
		hint="Method handles the execution of all installation event methods">
		<cfset var event = application.event />
		
		<cfswitch expression="#event#">
			<cfcase value="database">
				#obj.database.database()#
			</cfcase>
			
			<cfcase value="datasource">
				#obj.datasource.datasource()#
			</cfcase>
			
			<cfcase value="user">
				#obj.user.user()#
			</cfcase>
			
			<cfcase value="building">
				#obj.build.build()#
			</cfcase>
			
			<cfcase value="alldone">
				#obj.alldone.alldone()#
			</cfcase>
			
			<cfdefaultcase>
				#obj.install.openInstallSession()#
				#obj.install.defaultTemplate()#
			</cfdefaultcase>
		</cfswitch>
	</cffunction>
	
	<cffunction name="default" access="public" returntype="void" output="true" 
		hint="Method calls the installation template which contains the main installation event method">
		<cfinclude template="../template/install.cfm" />
	</cffunction>
	
</cfcomponent>
