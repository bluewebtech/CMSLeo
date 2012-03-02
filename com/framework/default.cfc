<cfcomponent displayname="Framework Configuration Component" 
	output="false" 
	hint="">
	
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="">
		<cfset variables.framework = {browser    = CreateObject('component','com.framework.browser.default'),
				                      form       = CreateObject('component','com.framework.form.default'),
				                      style      = CreateObject('component','com.framework.style.default'),
				                      validation = CreateObject('component','com.framework.validation.default')
				                     } />	
		<cfreturn variables />
	</cffunction>
	
</cfcomponent>