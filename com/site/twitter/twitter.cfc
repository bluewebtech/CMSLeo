<cfcomponent displayname="Twitter Component Plugin" 
	hint="">

	<cffunction name="init" access="public" returntype="any" 
		hint="">
		<cfreturn variables />
	</cffunction>
	
	<cffunction name="template" access="private" returntype="void" 
		hint="">
		<cfinclude template="templates/twitter.cfm" />
	</cffunction>
	
	<cffunction name="results" access="private" returntype="array" 
		hint="">
		<cfargument name="_screenname" type="string" />
		<cfargument name="_count"      type="numeric" />
		<cfset var array = '' />
		
		<cfhttp url="https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=#arguments._screenname#&count=#arguments._count#" 
		        method="get" 
		        result="result" 
		        charset="utf-8">
		
		<cfset array = deserializeJSON(result.filecontent)>
		
		<cfreturn array />
	</cffunction>
	
	<cffunction name="twitter" access="public" returntype="void" output="true" 
		hint="">
		#template()#
	</cffunction>

</cfcomponent>
