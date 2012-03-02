<cfcomponent displayname="Site DAO Component" output="false" 
	hint="">
	
	<cffunction name="init" access="public" returntype="any" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<cffunction name="queryContent" access="public" returntype="query" 
		hint="">
		<cfset var query = '' />
		
		<cfquery name="query" datasource="bluewebtech">
		SELECT   c.id, c.menu, c.menu_type, c.menu_item, c.menu_order, c.menu_url, 
		         c.content, c.meta_title, c.meta_description, c.meta_keywords, 
		         c.date_created, c.date_updated, c.enable
		FROM     #application.table_prefix#content c
		WHERE    c.enable = <cfqueryparam value="1" cfsqltype="cf_sql_varchar" />
		ORDER BY c.menu_order ASC;
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="queryContentPage" access="public" returntype="query" 
		hint="">
		<cfargument name="_page" type="string" />
		<cfset var page  = arguments._page />
		<cfset var query = '' />
		
		<cfquery name="query" datasource="bluewebtech">
		SELECT c.id, c.menu, c.menu_type, c.menu_item, c.menu_order, c.menu_url, 
		       c.content, c.meta_title, c.meta_description, c.meta_keywords, 
		       c.date_created, c.date_updated, c.enable
		FROM   #application.table_prefix#content c
		WHERE  c.menu_url = <cfqueryparam value="#page#" cfsqltype="cf_sql_varchar" />;
		</cfquery>
		
		<cfreturn query />
	</cffunction>

</cfcomponent>
