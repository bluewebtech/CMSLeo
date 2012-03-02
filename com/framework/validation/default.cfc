<cfcomponent displayname="Validation Extension Component" 
	output="false" 
	hint="Component contains many methods to validate user input">

	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false" 
		hint="Method uses the isvalid cfml function to validate the available types and returns a boolean">
		<cfargument name="_type"  type="string" />
		<cfargument name="_value" type="string" />
		
		<cfset var type       = arguments._type />
		<cfset var value      = arguments._value />
		<cfset var validation = '' />
		
		<cfswitch expression="#type#">
			<cfcase value="string">
				<cfif len(value) GT 0>
					<cfset validation = true />
				<cfelse>
					<cfset validation = false />
				</cfif>
			</cfcase>
			
			<cfcase value="email">
				<cfif isvalid(type,value)>
					<cfset validation = true />
				<cfelse>
					<cfset validation = false />
				</cfif>
			</cfcase>
		</cfswitch>
		
		<cfreturn validation />
	</cffunction>
	
	<cffunction name="ipValidate" access="public" returntype="boolean" output="false" 
		hint="Method validates an ip address and returns a boolean">
		<cfargument name="_ip" type="string" />
		
		<cfset var ip                = arguments._ip />
		<cfset var arrayIP           = ArrayNew(1) />
		<cfset var arrayIPLength     = '' />
		<cfset var arrayIPList       = '' />
		<cfset var arrayListContains = '' />
		
		<cfif ip eq 'localhost'>
			<cfreturn true />
		<cfelse>
			
			<cfloop list="#ip#" index="i" delimiters=".">
				<cfif i gte 0 and i lte 255>
					<cfset ArrayAppend(arrayIP,true) />
				<cfelse>
					<cfset ArrayAppend(arrayIP,false) />
				</cfif>
			</cfloop>
			
			<cfset arrayIPLength = ArrayLen(arrayIP) />
			
			<cfif arrayIPLength eq 4>
				<cfset ArrayAppend(arrayIP,true) />
			<cfelse>
				<cfset ArrayAppend(arrayIP,false) />
			</cfif>
			
			<cfset arrayIPList       = ArrayToList(arrayIP) />
			<cfset arrayListContains = ListContains(arrayIPList,false) />
			
			<cfif arrayListContains eq 0>
				<cfreturn true />
			<cfelse>
				<cfreturn false />
			</cfif>
			
		</cfif>
	</cffunction>

</cfcomponent>