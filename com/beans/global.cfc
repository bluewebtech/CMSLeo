<cfcomponent displayname="Global Bean" 
	output="false" 
	hint="Component contains all global setter and getters">
	
	<cfparam name="url.page"    default="" />
	<cfparam name="url.event"   default="" />
	<cfparam name="url.action"  default="" />
	<cfparam name="form.fire"   default="" />
	<cfparam name="form.submit" default="" />
	
	<cfproperty name="page"   type="string" />
	<cfproperty name="event"  type="string" />
	<cfproperty name="action" type="string" />
	<cfproperty name="fire"   type="string" />
	<cfproperty name="submit" type="string" />
	
	<cfset variables.instance = {page   = '', 
			                     event  = '', 
			                     action = '', 
			                     fire   = '', 
			                     submit = ''} />
	
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is constructor">
		<cfargument name="page"   type="string" />
		<cfargument name="event"  type="string" />
		<cfargument name="action" type="string" />
		<cfargument name="fire"   type="string" />
		<cfargument name="submit" type="string" />
		<cfreturn variables />
	</cffunction>
	
	<cffunction name="setPage" access="public" returntype="string" output="false" 
		hint="Event setter">
		<cfargument name="page"  type="string" />
		<cfset variables.page = arguments.page />
	</cffunction>
	<cffunction name="getPage" access="public" returntype="string" output="false" 
		hint="Event getter">
		<cfreturn variables.page />
	</cffunction>
	
	<cffunction name="setEvent" access="public" returntype="string" output="false" 
		hint="Event setter">
		<cfargument name="event"  type="string" />
		<cfset variables.event = arguments.event />
	</cffunction>
	<cffunction name="getEvent" access="public" returntype="string" output="false" 
		hint="Event getter">
		<cfreturn variables.event />
	</cffunction>
	
	<cffunction name="setAction" access="public" returntype="string" output="false" 
		hint="Action setter">
		<cfargument name="action"  type="string" />
		<cfset variables.action = arguments.action />
	</cffunction>
	<cffunction name="getAction" access="public" returntype="string" output="false" 
		hint="Action getter">
		<cfreturn variables.action />
	</cffunction>
	
	<cffunction name="setFire" access="public" returntype="string" output="false" 
		hint="Fire setter">
		<cfargument name="fire"  type="string" />
		<cfset variables.fire = arguments.fire />
	</cffunction>
	<cffunction name="getFire" access="public" returntype="boolean" output="false" 
		hint="Fire getter">
		<cfif variables.fire eq true>
		<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
	
	<cffunction name="setSubmit" access="public" returntype="string" output="false" 
		hint="Submit setter">
		<cfargument name="submit"  type="string" />
		<cfset variables.submit = arguments.submit />
	</cffunction>
	<cffunction name="getSubmit" access="public" returntype="string" output="false" 
		hint="Submit getter">
		<cfreturn variables.submit />
	</cffunction>

</cfcomponent>
