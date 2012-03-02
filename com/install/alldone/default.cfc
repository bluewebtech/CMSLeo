<cfcomponent displayname="All Done Install Component" 
	hint="Component contains all events that are used complete the installation of the application database">

	<cffunction name="init" access="public" returntype="any" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<!--- Templates --->
	
	<cffunction name="loading" access="private" returntype="void" 
		hint="">
		<cfinclude template="templates/loading.cfm" />
	</cffunction>
	
	<cffunction name="complete" access="private" returntype="void" 
		hint="">
		<cfinclude template="templates/complete.cfm" />
	</cffunction>
	
	<!--- Default --->
	
	<cffunction name="process" access="public" returntype="void" output="true" 
		hint="">
		<cfset var event = application.event />
		
		<cfswitch expression="#event#">
			<cfcase value="alldone">
				#obj.alldone.complete()#
			</cfcase>
		</cfswitch>
	</cffunction>
	
	<!--- Default --->
	
	<cffunction name="alldone" access="public" returntype="void" output="true" 
		hint="Method is component main">
		#obj.alldone.process()#
	</cffunction>

</cfcomponent>
