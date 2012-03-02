<cfcomponent displayname="Datasource Install Component" 
	hint="Component contains all events that are used to install the datasource">
	
	<cffunction name="init" access="public" returntype="any" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<!--- Templates --->
	
	<cffunction name="datasourceForm" access="private" returntype="void" 
		hint="Method contains the datasource form template">
		<cfinclude template="templates/formDatasource.cfm" />
	</cffunction>
	
	<!--- Values --->
	
	<cffunction name="datasourceValues" access="private" returntype="struct" 
		hint="">
		<cfset var values       = StructNew() />
		<cfset values.dsname    = obj.bean.getDSName() />
		<cfset values.dstype    = obj.bean.getDSType() />
		<cfset values.admintype = obj.bean.getAdminType() />
		<cfset values.password  = obj.bean.getPassword() />
		
		<cfreturn values />
	</cffunction>
	
	<cffunction name="datasourceGetValue" access="private" returntype="string" 
		hint="">
		<cfargument name="_value" type="string" />
		
		<cfset var value  = arguments._value />
		<cfset var values = obj.datasource.datasourceValues() />
		
		<cfreturn values[value] />
	</cffunction>
	
	<cffunction name="datasourceSessionValues" access="private" returntype="void" output="true" 
		hint="">
		<cflock name="session.install" timeout="30">
			<cfset session.install.datasource.dsname    = obj.datasource.datasourceGetValue('dsname') />
			<cfset session.install.datasource.dstype    = obj.datasource.datasourceGetValue('dstype') />
			<cfset session.install.datasource.admintype = obj.datasource.datasourceGetValue('admintype') />
			<cfset session.install.datasource.password  = obj.datasource.datasourceGetValue('password') />
		</cflock>
	</cffunction>
	
	<!--- Validation --->
	
	<cffunction name="dsnameVal" access="private" returntype="boolean" 
		hint="">
		<cfset var dsname = obj.datasource.datasourceGetValue('dsname') />
		<cfreturn application.framework.validation.validate('string',dsname) />
	</cffunction>
	
	<cffunction name="dstypeVal" access="private" returntype="boolean" 
		hint="">
		<cfset var dstype = obj.datasource.datasourceGetValue('dstype') />
		<cfreturn application.framework.validation.validate('string',dstype) />
	</cffunction>
	
	<cffunction name="admintypeVal" access="private" returntype="boolean" 
		hint="">
		<cfset var admintype = obj.datasource.datasourceGetValue('admintype') />
		<cfreturn application.framework.validation.validate('string',admintype) />
	</cffunction>
	
	<cffunction name="passwordVal" access="private" returntype="boolean" 
		hint="">
		<cfset var password = obj.datasource.datasourceGetValue('password') />
		<cfreturn application.framework.validation.validate('string',password) />
	</cffunction>
	
	<cffunction name="validation" access="private" returntype="boolean" 
		hint="Method validates all database user input as a whole and returns a boolean">
		<cfset var validate             = ArrayNew(1) />
		<cfset var validateArrayToList  = '' />
		<cfset var validateListContains = '' />
		
		<cfset validate[1]          = obj.datasource.dsnameVal() />
		<cfset validate[2]          = obj.datasource.dstypeVal() />
		<cfset validate[3]          = obj.datasource.admintypeVal() />
		<cfset validate[4]          = obj.datasource.passwordVal() />
		<cfset validateArrayToList  = ArrayToList(validate) />
		<cfset validateListContains = ListContains(validateArrayToList,false) />
		
		<cfif validateListContains eq 0>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="process" access="private" returntype="void" output="true" 
		hint="">
		<cfset var fire     = application.fire />
		<cfset var validate = obj.datasource.validation() />
		
		<cfif fire>
			
			<cfif validate>
				#obj.datasource.datasourceSessionValues()#
				<cflocation url="/install/?event=user" addtoken="false" />
			<cfelse>
				#obj.datasource.datasourceForm()#
			</cfif>
			
		<cfelse>
			#obj.datasource.datasourceForm()#
		</cfif>
	</cffunction>
	
	<!--- Default --->
	
	<cffunction name="datasource" access="public" returntype="void" output="true" 
		hint="Method is component main">
		#obj.datasource.process()#
	</cffunction>

</cfcomponent>
