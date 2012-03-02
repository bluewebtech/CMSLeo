<cfcomponent displayname="Build Install Component" 
	hint="Component contains all events that are fired when installing and building the necessary files for the application">

	<cffunction name="init" access="public" returntype="any" 
		hint="Method is component constructor">
		<cfreturn variables />
	</cffunction>
	
	<!--- Templates --->
	
	<cffunction name="loading" access="private" returntype="void" 
		hint="Method displays the loading screen template">
		<cfinclude template="templates/loading.cfm" />
	</cffunction>
	
	<cffunction name="configFileTemplate" access="private" returntype="void" 
		hint="Method contains the application config template">
		<cfinclude template="files/config/leo.config" />
	</cffunction>
	
	<!--- Build Files --->
	
	<cffunction name="configFileCreate" access="private" returntype="void" output="true" 
		hint="Method creates the application config file">
		<cfset var path     = expandpath('../com/config/') />
		<cfset var file     = '' />
		<cfset var filename = 'default.cfc' />
		<cfset var build    = path & filename />
		<cfset var config  = '' />
		
		<!--- Toss the config cfc data into a single variable --->
		<cfset config = 
		'- CMS Leo
		 - Build Version: 1.0-(First Blood)
		 - Author: Peter Rjabanedelia 3rd
		 - Web Site: http://bluewebtech.com
		 - Contact: <None yet just in case this thing sucks>
		 		
		<cfcomponent displayname="Configuration Component" hint="Conponent contains all application configuration setting values">
		
			<cffunction name="init" access="public" returntype="any" 
				hint="Method is component constructor">
				<cfset variables.config = {domain       = "http://#cgi.http_host#/",
						                   webroot      = "/site/",
				                           comroot      = "com.",
				                           fileroot     = "/site/files/",
				                           datasource   = "#session.install.datasource.dsname#",
				                           table_prefix = "#session.install.database.prefix#",
				                           installed    = true,
				                           install_date = "#DateFormat(Now(),'yyyy-mm-dd')#"} />
				<cfreturn variables />
			</cffunction>
		
		</cfcomponent>' />

		<cffile action="write" file="#build#" output="#config#" />
	</cffunction>
	
	<cffunction name="datasourceCreate" access="private" returntype="void" output="true" 
		hint="Method creates the datasource for the application">
		<cfadmin action="updateDatasource"
			     type="#session.install.datasource.admintype#"
				 password="#session.install.datasource.password#"
			     classname="org.gjt.mm.mysql.Driver"
				 dsn="jdbc:mysql://{host}:{port}/{database}"
				 name="#session.install.datasource.dsname#"
				 newName="#session.install.datasource.dsname#"
				 host="#session.install.database.host#"
				 database="#session.install.database.database#"
				 port="#session.install.database.port#"
				 dbusername="#session.install.database.username#"
				 dbpassword="#session.install.database.password#"
				 connectionLimit="300"
				 connectionTimeout="1"
				 blob="false"
				 clob="false"
				 allowed_select="true"
				 allowed_insert="true"
				 allowed_update="true"
				 allowed_delete="true"
				 allowed_alter="true"
				 allowed_drop="true"
				 allowed_revoke="true"
				 allowed_create="true"
				 allowed_grant="true">
	</cffunction>
	
	<cffunction name="databaseCreateSQL" access="private" returntype="void" output="true" 
		hint="Method handles the installation of the application database">
		<cfset var path        = expandpath('../com/install/build/files/sql/') />
		<cfset var file        = '' />
		<cfset var filename    = 'mysql.sql' />
		<cfset var build       = path & filename />
		<cfset var sqlToArray  = '' />
		<cfset var sqlArrayLen = '' />
		<cfset var a           = '' />
		
		<!--- Toss the mysql dump file into a variable containing all personalized database information --->
		<cfsavecontent variable="sql">
			<cfinclude template="files/sql/mysql.sql" />
		</cfsavecontent>
		
		<!--- Convert the mysql dump file from a list to an array --->
		<cfset sqlToArray = ListToArray(sql,';') />
		
		<!--- Get the length of the mysql dump array --->
		<cfset sqlArrayLen = ArrayLen(sqlToArray) - 1 />
		
		<!--- Loop through the mysql dump array --->
		<cfloop from="1" to="#sqlArrayLen#" index="a">
			<!--- Execute all sql commands within the mysql dump array --->
			<cfquery datasource="#session.install.datasource.dsname#">
				<!--- Ignore all empty elements in the mysql dump array --->
				<cfif len(sqlToArray[a]) GT 0>
				<!--- Run the current sql command and be sure to keep all necessary single quotes within tyhe mysql dump array --->
				#preserveSingleQuotes(sqlToArray[a])#
				</cfif>
			</cfquery>
		</cfloop>
		
		<!--- Dump the array to the screen
		<cfdump var="#sqlToArray#" /> --->
	</cffunction>
	
	<!--- Default --->
	
	<cffunction name="process" access="public" returntype="void" output="true" 
		hint="Method handles the execution of all installation objects">
		<cfset var event = application.event />
		
		<cfswitch expression="#event#">
			<cfcase value="building">
				<!--- Display the loading screen --->
				#obj.build.loading()#
				
				<!--- Fire all Railo datasource creation objects --->
				#obj.build.datasourceCreate()#
				
				<!--- Fire the application config file creation object --->
				#obj.build.configFileCreate()#
				
				<!--- Fire all SQL creation objects --->
				#obj.build.databaseCreateSQL()#
			</cfcase>
		</cfswitch>
	</cffunction>
	
	<!--- Default --->
	
	<cffunction name="build" access="public" returntype="void" output="true" 
		hint="Method is component main">
		#obj.build.process()#
	</cffunction>

</cfcomponent>
