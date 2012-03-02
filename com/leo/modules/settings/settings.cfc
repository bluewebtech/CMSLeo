<cfcomponent displayname="Content Module Component" extends="com.leo.modules.content.dao" 
	hint="">
	
	<cffunction name="init" access="public" returntype="any" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>

	<cffunction name="default" access="private" returntype="void" 
		hint="">
		<cfinclude template="templates/default.cfm" />
	</cffunction>
	
	<cffunction name="settings" access="private" returntype="void" output="true" 
		hint="">
		#obj.settings.default()#
	</cffunction>

</cfcomponent>