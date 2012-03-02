<cfcomponent displayname="Content Module Component" 
	output="false" 
	extends="com.leo.modules.content.dao" 
	hint="">
	
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>

	<cffunction name="default" access="private" returntype="string" output="false" 
		hint="">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/default.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="files" access="private" returntype="string" output="false" 
		hint="">
		<cfreturn obj.files.default() />
	</cffunction>

</cfcomponent>