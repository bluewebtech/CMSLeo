<cfcomponent displayname="Content DAO Module Component" 
	output="false"
	hint="Component contains all data access objects for the content module">
	
	<cffunction name="daoList" access="private" returntype="query" output="false" 
		hint="">
		<cfset var query = '' />
		
		<cfquery name="query" datasource="#application.datasource#">
		SELECT   c.id, c.menu, c.menu_type, c.menu_item, c.menu_order, c.menu_url, c.content, 
		         c.meta_title, c.meta_description, c.meta_keywords, c.date_created, 
		         c.date_updated, c.enable
		FROM     #application.table_prefix#content c
		ORDER BY c.menu_order ASC
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="daoGetValue" access="private" returntype="query" output="false" 
		hint="">
		<cfargument name="_column" type="string" />
		<cfargument name="_value"  type="string" />
		
		<cfset var column = arguments._column />
		<cfset var value  = arguments._value />
		<cfset var query  = '' />
		
		<cfquery name="query" datasource="#application.datasource#">
		SELECT c.id, c.menu, c.menu_type, c.menu_item, c.menu_order, c.menu_url, c.content, 
		       c.meta_title, c.meta_description, c.meta_keywords, c.date_created, 
		       c.date_updated, c.enable
		FROM   #application.table_prefix#content c
		WHERE  c.#column# = <cfqueryparam value="#value#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="daoValidation" access="private" returntype="query" output="false" 
		hint="">
		<cfargument name="_column" type="string" />
		<cfargument name="_value"  type="string" />
		
		<cfset var column = arguments._column />
		<cfset var value  = arguments._value />
		<cfset var query  = '' />
		
		<cfquery name="query" datasource="#application.datasource#">
		SELECT c.#column#
		FROM   #application.table_prefix#content c
		WHERE  c.#column# = <cfqueryparam value="#value#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="daoGetPage" access="private" returntype="query" output="false" 
		hint="">
		<cfargument name="_page" type="string" />
		
		<cfset var page  = arguments._page />
		<cfset var query = '' />
		
		<cfquery name="query" datasource="#application.datasource#">
		SELECT c.id, c.menu, c.menu_type, c.menu_item, c.menu_order, c.menu_url, c.content, 
		       c.meta_title, c.meta_description, c.meta_keywords, c.date_created, 
		       c.date_updated, c.enable
		FROM   #application.table_prefix#content c
		WHERE  c.id = <cfqueryparam value="#page#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="daoCreate" access="private" returntype="string" output="false" 
		hint="Method inserts the new page values into the content table">
		<cfargument name="_values" type="struct" />
		
		<cfset var values    = arguments._values />
		<cfset var queryLast = '' />
		<cfset var query     = '' />
		<cfset var menu_type = 1 />
		<cfset var date      = DateFormat(Now(),"yyyy-mm-dd") />
		
		<cfif len(values.group) gt 0>
			<cfset values.group = values.group />
		<cfelse>
			<cfset values.group = 1 />
		</cfif>
		
		<cfsavecontent variable="query">
			<cfquery datasource="#application.datasource#">
			INSERT INTO #application.table_prefix#content
			            (
			            	menu, 
			            	menu_type, 
			            	menu_item, 
			            	menu_order, 
			            	menu_url, 
			            	content, 
		       				meta_title, 
		       				meta_description, 
		       				meta_keywords, 
		       				date_created, 
		       				enable
			            )
			VALUES      (
			            	<cfqueryparam value="#values.menu#"        cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#menu_type#"          cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#values.group#"       cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#values.order#"       cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#values.url#"         cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#values.content#"     cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#values.title#"       cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#values.description#" cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#values.keywords#"    cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#date#"               cfsqltype="cf_sql_date" />, 
			            	<cfqueryparam value="#values.enable#"      cfsqltype="cf_sql_varchar" />
			            )
			</cfquery>
		</cfsavecontent>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="daoUpdate" access="private" returntype="string" output="false" 
		hint="Method updates the selected page values to the content table">
		<cfargument name="_values" type="struct" />
		<cfargument name="_page"   type="string" />
		
		<cfset var values    = arguments._values />
		<cfset var page      = arguments._page />
		<cfset var query     = '' />
		<cfset var menu_type = 1 />
		<cfset var date      = DateFormat(Now(),"yyyy-mm-dd") />
		
		<cfif len(values.group) gt 0>
			<cfset values.group = values.group />
		<cfelse>
			<cfset values.group = 1 />
		</cfif>
		
		<cfsavecontent variable="query">
			<cfquery datasource="#application.datasource#">
			UPDATE #application.table_prefix#content
			SET    menu             = <cfqueryparam value="#values.menu#"        cfsqltype="cf_sql_varchar" />, 
			       menu_type        = <cfqueryparam value="#menu_type#"          cfsqltype="cf_sql_varchar" />, 
			       menu_item        = <cfqueryparam value="#values.group#"       cfsqltype="cf_sql_varchar" />, 
			       menu_order       = <cfqueryparam value="#values.order#"       cfsqltype="cf_sql_varchar" />, 
			       menu_url         = <cfqueryparam value="#values.url#"         cfsqltype="cf_sql_varchar" />, 
			       content          = <cfqueryparam value="#values.content#"     cfsqltype="cf_sql_varchar" />, 
		           meta_title       = <cfqueryparam value="#values.title#"       cfsqltype="cf_sql_varchar" />, 
		       	   meta_description = <cfqueryparam value="#values.description#" cfsqltype="cf_sql_varchar" />, 
		       	   meta_keywords    = <cfqueryparam value="#values.keywords#"    cfsqltype="cf_sql_varchar" />, 
		       	   date_updated     = <cfqueryparam value="#date#"               cfsqltype="cf_sql_varchar" />, 
		       	   enable           = <cfqueryparam value="#values.enable#"      cfsqltype="cf_sql_varchar" />
			WHERE  id               = <cfqueryparam value="#page#"               cfsqltype="cf_sql_varchar" />
			</cfquery>
		</cfsavecontent>
		
		<cfreturn query />
	</cffunction>
	
	<cffunction name="daoDelete" access="private" returntype="string" output="false" 
		hint="Method archives the selected page to the archives_content table and deletes the content from the content table">
		<cfargument name="_page" type="string" />
		
		<cfset var page      = arguments._page />
		<cfset var query     = '' />
		<cfset var queryPage = obj.content.daoGetPage(page) />
		<cfset var date      = DateFormat(Now(),"yyyy-mm-dd") />
		
		<cfsavecontent variable="query">
			<cfquery datasource="#application.datasource#">
			INSERT INTO #application.table_prefix#archives_content
			            (
			            	menu, 
			            	menu_type, 
			            	menu_item, 
			            	menu_order, 
			            	menu_url, 
			            	content, 
		       				meta_title, 
		       				meta_description, 
		       				meta_keywords, 
		       				date_created, 
		       				date_updated, 
		       				date_archived, 
		       				enable
			            )
			VALUES      (
			            	<cfqueryparam value="#queryPage.menu#"             cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#queryPage.menu_type#"        cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#queryPage.menu_item#"        cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#queryPage.menu_order#"       cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#queryPage.menu_url#"         cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#queryPage.content#"          cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#queryPage.meta_title#"       cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#queryPage.meta_description#" cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#queryPage.meta_keywords#"    cfsqltype="cf_sql_varchar" />, 
			            	<cfqueryparam value="#queryPage.date_created#"     cfsqltype="cf_sql_date" />, 
			            	<cfqueryparam value="#queryPage.date_updated#"     cfsqltype="cf_sql_date" />, 
			            	<cfqueryparam value="#date#"                       cfsqltype="cf_sql_date" />, 
			            	<cfqueryparam value="#queryPage.enable#"           cfsqltype="cf_sql_varchar" />
			            )
			</cfquery>
			
			<cfquery datasource="#application.datasource#">
			DELETE FROM #application.table_prefix#content 
			WHERE       id = <cfqueryparam value="#page#" cfsqltype="cf_sql_varchar" />
			</cfquery>
		</cfsavecontent>
		
		<cfreturn query />
	</cffunction>

</cfcomponent>
