<cfcomponent displayname="Form Component" 
	output="false" 
	hint="Component contains many methods to handle form input">
	
	<cffunction name="textFieldValue" access="public" returntype="string" output="false" 
		hint="">
		<cfargument name="_valueOne" type="string" />
		<cfargument name="_valueTwo" type="string" />
		<cfargument name="_fire"     type="boolean" />
		
		<cfset var valueOne = arguments._valueOne />
		<cfset var valueTwo = arguments._valueTwo />
		<cfset var fire     = arguments._fire />
		
		<cfif fire>
			<cfif len(valueOne) gt 0>
				<cfreturn valueOne />
			<cfelse>
				<cfreturn valueTwo />
			</cfif>
		<cfelse>
			<cfreturn valueOne />
		</cfif>
	</cffunction>

</cfcomponent>
