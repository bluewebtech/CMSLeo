<cfcomponent displayname="Application Component" 
	output="false" 
	hint="Component contains all the necessary CFML Applciation.cfc methods">
	
	<cfset this.sessionstorage    = "bluewebtech" />
	<cfset this.sessionmanagement = true />
	<cfset this.sessiontimeout    = createtimespan(0,0,30,0) />
			
	<cffunction name="onRequestStart" returntype="void" output="false" 
		hint="Method contains all application wide objects that can be used easily throughout the site">
		<cfsilent>
			<!--- Configuration --->
			<cfset application.objConfig    = CreateObject('component','com.config.default').init() />
			<cfset application.domain       = application.objConfig.config.domain />
			<cfset application.webroot      = application.objConfig.config.webroot />
			<cfset application.comroot      = application.objConfig.config.comroot />
			<cfset application.fileroot     = application.objConfig.config.fileroot />
			<cfset application.datasource   = application.objConfig.config.datasource />
			<cfset application.table_prefix = application.objConfig.config.table_prefix />
			<cfset application.installed    = application.objConfig.config.installed />
			
			<!--- Extensions --->
			<cfset application.objFramework         = CreateObject('component','com.framework.default').init() />
			<cfset application.framework.browser    = application.objFramework.framework.browser />
			<cfset application.framework.form       = application.objFramework.framework.form />
			<cfset application.framework.style      = application.objFramework.framework.style />
			<cfset application.framework.validation = application.objFramework.framework.validation />
			
			<cfset application.objGlobal = CreateObject('component','com.beans.global').init() />
			<cfset application.objGlobal.setPage(url.page) />
			<cfset application.objGlobal.setEvent(url.event) />
			<cfset application.objGlobal.setAction(url.action) />
			<cfset application.objGlobal.setFire(form.fire) />
			<cfset application.objGlobal.setSubmit(form.submit) />
			<cfset application.page   = application.objGlobal.getPage(url.page) />
			<cfset application.event  = application.objGlobal.getEvent(url.event) />
			<cfset application.action = application.objGlobal.getAction(url.action) />
			<cfset application.fire   = application.objGlobal.getFire(form.fire) />
			<cfset application.submit = application.objGlobal.getSubmit(form.submit) />
		</cfsilent>
	</cffunction>

</cfcomponent>
