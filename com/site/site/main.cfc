<cfcomponent displayname="Site Component" extends="com.site.dao.site" output="false" 
	hint="Tons and tons and tons of includes">
		
	<cffunction name="init" access="public" returntype="any" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<cffunction name="meta" access="public" returntype="void" output="true" 
		hint="Method displays the meta data to the screen">
		<cfinclude template="templates/meta.cfm" />
	</cffunction>
	
	<cffunction name="navigation" access="public" returntype="void" output="true" 
		hint="Method displays the navigation to the screen">
		<cfinclude template="templates/navigation.cfm" />
	</cffunction>
	
	<cffunction name="content" access="public" returntype="void" output="true" 
		hint="Method displays the content data to the screen">
		<cfinclude template="templates/content.cfm" />
	</cffunction>
	
	<cffunction name="main" access="public" returntype="void" output="true" 
		hint="Method builds the site template and displays it to the screen">
		<!--- Check if application was installed already. If not send user to install screen --->
		<cfif application.installed>
			<cfinclude template="templates/template.cfm" />
		<cfelse>
			<cflocation url="/install/" addtoken="false" />
		</cfif>
	</cffunction>

</cfcomponent>