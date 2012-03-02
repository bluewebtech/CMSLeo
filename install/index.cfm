<cfset objInstallBean = CreateObject('component','com.beans.install').init() />
<cfset objInstallBean.setHost(form.host) />
<cfset objInstallBean.setPort(form.port) />
<cfset objInstallBean.setDatabase(form.database) />
<cfset objInstallBean.setPrefix(form.prefix) />
<cfset objInstallBean.setUsername(form.username) />
<cfset objInstallBean.setPassword(form.password) />
<cfset objInstallBean.setFirstname(form.firstname) />
<cfset objInstallBean.setLastname(form.lastname) />
<cfset objInstallBean.setEmail(form.email) />
<cfset objInstallBean.setDSName(form.dsname) />
<cfset objInstallBean.setDSType(form.dstype) />
<cfset objInstallBean.setAdminType(form.admintype) />

<cfset obj            = StructNew() />
<cfset obj.bean       = objInstallBean />
<cfset obj.database   = CreateObject('component','com.install.database.default').init(obj.bean) />
<cfset obj.datasource = CreateObject('component','com.install.datasource.default').init(obj.bean) />
<cfset obj.user       = CreateObject('component','com.install.user.default').init(obj.bean) />
<cfset obj.build      = CreateObject('component','com.install.build.default').init(obj.bean) />
<cfset obj.alldone    = CreateObject('component','com.install.alldone.default').init(obj.bean) />
<cfset obj.install    = CreateObject('component','com.install.install.default').init(obj.bean,obj.database,obj.datasource,obj.user,obj.build,obj.alldone) />

<cfoutput>#obj.install.default()#</cfoutput>

<!---
<cfdump var="#session#" />
--->
