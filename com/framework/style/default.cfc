<cfcomponent displayname="Style Component" 
	output="false" 
	hint="Component contains many styling methods to make you happy, shiny, people">
	
	<cffunction name="errorImage" access="public" returntype="string" output="false" 
		hint="Method ">
		<cfargument name="_value" type="boolean" />
		
		<cfset var value = arguments._value />
		<cfset var fire  = application.fire />
		
		<cfif fire and !value>
			<cfreturn '<img src="/leo/images/icon_active_disabled.png" width="20" height="20" />' />
		</cfif>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="enableImage" access="public" returntype="string" output="false" 
		hint="">
		<cfargument name="_imageOne" type="string" />
		<cfargument name="_imageTwo" type="string" />
		<cfargument name="_value"    type="string" />
		
		<cfset var imageOne = arguments._imageOne />
		<cfset var imageTwo = arguments._imageTwo />
		<cfset var value    = arguments._value />
		
		<cfif value GT 0>
			<cfreturn imageOne />
		<cfelse>
			<cfreturn imageTwo />
		</cfif>
	</cffunction>

</cfcomponent>