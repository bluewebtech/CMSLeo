<cfcomponent displayname="Leo Content Bean" 
	output="false" 
	hint="Component contains all content create, read, update and delete setters and getters">
	
	<cfproperty name="menu"        type="string" />
	<cfproperty name="group"       type="string" />
	<cfproperty name="url"         type="string" />
	<cfproperty name="order"       type="string" />
	<cfproperty name="title"       type="string" />
	<cfproperty name="keywords"    type="string" />
	<cfproperty name="description" type="string" />
	<cfproperty name="enable"      type="string" />
	<cfproperty name="content"     type="string" />
	
	<cfparam name="form.menu"        default="" />
	<cfparam name="form.group"       default="" />
	<cfparam name="form.url"         default="" />
	<cfparam name="form.order"       default="" />
	<cfparam name="form.title"       default="" />
	<cfparam name="form.keywords"    default="" />
	<cfparam name="form.description" default="" />
	<cfparam name="form.enable"      default="" />
	<cfparam name="form.content"     default="" />
	
	<cfset variables.instance = {menu        = '',
			                     group       = '',
			                     url         = '',
			                     order       = '',
			                     title       = '',
			                     keywords    = '',
			                     description = '',
			                     enable      = '',
			                     content     = ''} />
			          
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="">
		<cfargument name="menu"        type="string" />
		<cfargument name="group"       type="string" />
		<cfargument name="url"         type="string" />
		<cfargument name="order"       type="string" />
		<cfargument name="title"       type="string" />
		<cfargument name="keywords"    type="string" />
		<cfargument name="description" type="string" />
		<cfargument name="enable"      type="string" />
		<cfargument name="content"     type="string" />
	</cffunction>
	
	<cffunction name="setMenu" access="public" returntype="string" output="false" 
		hint="Menu setter">
		<cfargument name="menu" type="string" />
		<cfset variables.menu = arguments.menu />
	</cffunction>
	<cffunction name="getMenu" access="public" returntype="string" output="false" 
		hint="Menu getter">
		<cfreturn variables.menu />
	</cffunction>
	
	<cffunction name="setGroup" access="public" returntype="string" output="false" 
		hint="Group setter">
		<cfargument name="group" type="string" />
		<cfset variables.group = arguments.group />
	</cffunction>
	<cffunction name="getGroup" access="public" returntype="string" output="false" 
		hint="Group getter">
		<cfreturn variables.group />
	</cffunction>
	
	<cffunction name="setUrl" access="public" returntype="string" output="false" 
		hint="Url setter">
		<cfargument name="url" type="string" />
		<cfset variables.url = arguments.url />
	</cffunction>
	<cffunction name="getUrl" access="public" returntype="string" output="false" 
		hint="Url getter">
		<cfset var url = '' />
		
		<cfif len(variables.url) gt 0>
			<cfset url = lcase(replace(variables.url," ","-","all")) />
		<cfelse>
			<cfset url = lcase(replace(variables.menu," ","-","all")) />
		</cfif>
		
		<cfreturn variables.url />
	</cffunction>
	
	<cffunction name="setOrder" access="public" returntype="string" output="false" 
		hint="Order setter">
		<cfargument name="order" type="string" />
		<cfset variables.order = arguments.order />
	</cffunction>
	<cffunction name="getOrder" access="public" returntype="string" output="false" 
		hint="Order getter">
		<cfreturn variables.order />
	</cffunction>
	
	<cffunction name="setTitle" access="public" returntype="string" output="false" 
		hint="Title setter">
		<cfargument name="title" type="string" />
		<cfset variables.title = arguments.title />
	</cffunction>
	<cffunction name="getTitle" access="public" returntype="string" output="false" 
		hint="Title getter">
		<cfreturn variables.title />
	</cffunction>
	
	<cffunction name="setKeywords" access="public" returntype="string" output="false" 
		hint="Keywords setter">
		<cfargument name="keywords" type="string" />
		<cfset variables.keywords = arguments.keywords />
	</cffunction>
	<cffunction name="getKeywords" access="public" returntype="string" output="false" 
		hint="Keywords getter">
		<cfreturn variables.keywords />
	</cffunction>
	
	<cffunction name="setDescription" access="public" returntype="string" output="false" 
		hint="Description setter">
		<cfargument name="description" type="string" />
		<cfset variables.description = arguments.description />
	</cffunction>
	<cffunction name="getDescription" access="public" returntype="string" output="false" 
		hint="Description getter">
		<cfreturn variables.description />
	</cffunction>
	
	<cffunction name="setEnable" access="public" returntype="string" output="false" 
		hint="Enable setter">
		<cfargument name="enable" type="string" />
		<cfset variables.enable = arguments.enable />
	</cffunction>
	<cffunction name="getEnable" access="public" returntype="string" output="false" 
		hint="Enable getter">
		<cfreturn variables.enable />
	</cffunction>
	
	<cffunction name="setContent" access="public" returntype="string" output="false" 
		hint="Content setter">
		<cfargument name="content" type="string" />
		<cfset variables.content = arguments.content />
	</cffunction>
	<cffunction name="getContent" access="public" returntype="string" output="false" 
		hint="Content getter">
		<cfreturn variables.content />
	</cffunction>

</cfcomponent>
