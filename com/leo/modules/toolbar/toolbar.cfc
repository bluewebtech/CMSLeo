<cfcomponent displayname="Toolbar Module Component" 
	output="false" 
	hint="Component contains all methods for the toolbar module">
	
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>

	<cffunction name="toolbarTemplate" access="private" returntype="string" output="false" 
		hint="Method returns the control panel template as a string">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/toolbar.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="toolbar" access="private" returntype="string" output="false" 
		hint="Method returns the control module as a string">
		<cfreturn obj.toolbar.toolbarTemplate() />
	</cffunction>

</cfcomponent>
