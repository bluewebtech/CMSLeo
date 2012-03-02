<cfcomponent displayname="Control Panel Module Component" 
	output="false" 
	hint="Component contains all methods for the control panel module">
	
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>

	<cffunction name="controlPanelTemplate" access="private" returntype="string" output="false" 
		hint="Method returns the control panel template as a string">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/control_panel.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="controlPanel" access="private" returntype="string" output="false" 
		hint="Method returns the control module as a string">
		<cfreturn obj.control.controlPanelTemplate() />
	</cffunction>

</cfcomponent>
