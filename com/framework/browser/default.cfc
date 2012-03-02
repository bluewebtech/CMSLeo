<cfcomponent displayname="Browser Component" 
	output="false" 
	hint="Component contains many simple browser detection and manipulation methods">
	
	<cffunction name="browserChecker" access="public" returntype="boolean" output="false" 
		hint="Method checks whether the current browser is Internet Explorer">
		<cfargument name="browser" type="string" />
		<cfif arguments.browser contains 'MSIE 6.0'>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

</cfcomponent>