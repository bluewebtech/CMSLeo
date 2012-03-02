<cfcomponent displayname="Content Module Component" 
	extends="com.leo.modules.content.dao" 
	output="false" 
	hint="Component contains all action methods for the content module">
	
	<cfset variables.redirect = '?event=content' />
	
	<cffunction name="init" access="public" returntype="any" output="false" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<!--- Templates --->

	<cffunction name="default" access="private" returntype="string" output="false" 
		hint="Method returns the default template for the content module">		
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/default.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<!--- Value Struct --->
	
	<cffunction name="contentValues" access="private" returntype="struct" output="false" 
		hint="Populate a structure full of passed form values">
		<cfset var values         = StructNew() />
		<cfset values.menu        = obj.bean.getMenu() />
		<cfset values.group       = obj.bean.getGroup() />
		<cfset values.url         = obj.bean.getUrl() />
		<cfset values.order       = obj.bean.getOrder() />
		<cfset values.title       = obj.bean.getTitle() />
		<cfset values.keywords    = obj.bean.getKeywords() />
		<cfset values.description = obj.bean.getDescription() />
		<cfset values.enable      = obj.bean.getEnable() />
		<cfset values.content     = obj.bean.getContent() />
		
		<cfreturn values />
	</cffunction>
	
	<!--- Redirection --->
	
	<cffunction name="redirect" access="private" returntype="string" output="false" 
		hint="Method redirects the user back to the default page if a cancel button is clicked">		
		<cfset var redirect = '' />
		
		<cfsavecontent variable="redirect">
			<cflocation url="#obj.content.redirect#" addtoken="false" />
		</cfsavecontent>
		
		<cfreturn redirect />
	</cffunction>
	
	<!--- Validation --->
	
	<cffunction name="menuVal" access="private" returntype="boolean" output="false" 
		hint="Method validates the page name and returns a boolean">
		<cfset var menu    = obj.bean.getMenu() />
		<cfset var menuLen = len(menu) />
		<cfset var query   = obj.content.daoValidation('menu',menu) />
		
		<cfif menuLen gt 0>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
	
	<cffunction name="processVal" access="private" returntype="boolean" output="false" 
		hint="Method validates all required fields and returns a boolean">
		<cfset var validation          = ArrayNew() />
		<cfset var validationToList    = '' />
		<cfset var validationListCheck = '' />
		
		<cfset validation[1] = obj.content.menuVal() />
				
		<cfset validationToList    = ArrayTolist(validation) />
		<cfset validationListCheck = ListContains(validationToList,false) />
		
		<cfif validationListCheck gt 0>
			<cfreturn false />
		<cfelse>
			<cfreturn true />
		</cfif>
	</cffunction>
	
	<!--- Create --->
	
	<cffunction name="createForm" access="private" returntype="string" output="false" 
		hint="Method returns the create form template">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/formCreate.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="create" access="private" returntype="string" output="false" 
		hint="Method handles all create action logic">
		<cfset var fire       = application.fire />
		<cfset var submit     = application.submit />
		<cfset var validation = obj.content.processVal() />
		
		<cfif fire>
			
			<cfif validation>
				<cfswitch expression="#submit#">
					<cfcase value="Create">
						<cfreturn obj.content.createForm() />
					</cfcase>
					
					<cfcase value="Draft">
						<cfreturn obj.content.createForm() />
					</cfcase>
					
					<cfcase value="Cancel">
						<cfreturn obj.content.redirect() />
					</cfcase>
				</cfswitch>
			<cfelse>
				<cfreturn obj.content.createForm() />
			</cfif>
			
		<cfelse>
			<cfreturn obj.content.createForm() />
		</cfif>
	</cffunction>
	
	<!--- Read --->
	
	<cffunction name="readForm" access="private" returntype="string" output="false" 
		hint="Method returns the read form template">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/formRead.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="read" access="private" returntype="string" output="false" 
		hint="Method handles all read action logic">
		<cfset var fire     = application.fire />
		<cfset var submit   = application.submit />
		<cfset var page     = application.page />
		<cfset var redirect = '' />
				
		<cfif fire>
			
			<cfswitch expression="#submit#">
				<cfcase value="Update">
					<cfsavecontent variable="redirect">
						<cflocation url="?event=content&action=update&page=#page#" addtoken="false" />
					</cfsavecontent>
					
					<cfreturn redirect />
				</cfcase>
				
				<cfcase value="Delete">
					<cfsavecontent variable="redirect">
						<cflocation url="?event=content&action=delete&page=#page#" addtoken="false" />
					</cfsavecontent>
					
					<cfreturn redirect />
				</cfcase>
				
				<cfcase value="Cancel">
					<cfreturn obj.content.redirect() />
				</cfcase>
			</cfswitch>
			
		<cfelse>
			<cfreturn obj.content.readForm() />
		</cfif>
	</cffunction>
	
	<!--- Update --->
	
	<cffunction name="updateForm" access="private" returntype="string" output="false" 
		hint="Method returns the update form template">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/formUpdate.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="update" access="private" returntype="string" output="false" 
		hint="Method handles all update action logic">
		<cfset var fire       = application.fire />
		<cfset var submit     = application.submit />
		<cfset var validation = obj.content.processVal() />
		
		<cfif fire>
			
			<cfif validation>
				<cfswitch expression="#submit#">
					<cfcase value="Update">
						<cfreturn obj.content.updateForm() />
					</cfcase>
					
					<cfcase value="Draft">
						<cfreturn obj.content.updateForm() />
					</cfcase>
					
					<cfcase value="Cancel">
						<cfreturn obj.content.redirect() />
					</cfcase>
				</cfswitch>
			<cfelse>
				<cfreturn obj.content.updateForm() />
			</cfif>
			
		<cfelse>
			<cfreturn obj.content.updateForm() />
		</cfif>
	</cffunction>
	
	<!--- Delete --->
	
	<cffunction name="deleteForm" access="private" returntype="string" output="false" 
		hint="Method returns the delete form template">
		<cfset var template = '' />
		
		<cfsavecontent variable="template">
			<cfinclude template="templates/formDelete.cfm" />
		</cfsavecontent>
		
		<cfreturn template />
	</cffunction>
	
	<cffunction name="delete" access="private" returntype="string" output="false" 
		hint="Method handles all update action logic">
		<cfset var fire   = application.fire />
		<cfset var submit = application.submit />
		
		<cfif fire>

			<cfswitch expression="#submit#">
				<cfcase value="Yes">
					<cfreturn obj.content.deleteForm() />
				</cfcase>
				
				<cfcase value="No">
					<cfreturn obj.content.redirect() />
				</cfcase>
			</cfswitch>
			
		<cfelse>
			<cfreturn obj.content.deleteForm() />
		</cfif>
	</cffunction>
	
	<!--- Actions --->
	
	<cffunction name="actions" access="private" returntype="string" output="false" 
		hint="Method returns the action expression structure">
		<cfset var action = application.action />
		
		<cfswitch expression="#action#">
			<cfcase value="create">
				<cfreturn obj.content.create() />
			</cfcase>
			
			<cfcase value="read">
				<cfreturn obj.content.read() />
			</cfcase>
			
			<cfcase value="update">
				<cfreturn obj.content.update() />
			</cfcase>
			
			<cfcase value="delete">
				<cfreturn obj.content.delete() />
			</cfcase>
			
			<cfdefaultcase>
				<cfreturn obj.content.default() />
			</cfdefaultcase>
		</cfswitch>
	</cffunction>
	
	<!--- Main --->
	
	<cffunction name="content" access="private" returntype="string" output="false" 
		hint="Method is module main">
		<cfreturn obj.content.actions() />
	</cffunction>

</cfcomponent>
