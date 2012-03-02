<cfset objLeoBean = CreateObject('component','com.beans.leo') />
<cfset objLeoBean.setUsername(form.username) />
<cfset objLeoBean.setPassword(form.password) />
<cfset objLeoBean.setMenu(form.menu) />
<cfset objLeoBean.setGroup(form.group) />
<cfset objLeoBean.setUrl(form.url) />
<cfset objLeoBean.setOrder(form.order) />
<cfset objLeoBean.setTitle(form.title) />
<cfset objLeoBean.setKeywords(form.keywords) />
<cfset objLeoBean.setDescription(form.description) />
<cfset objLeoBean.setEnable(form.enable) />
<cfset objLeoBean.setContent(form.content) />

<cfset obj          = StructNew() />
<cfset obj.bean     = objLeoBean />
<cfset obj.login    = CreateObject('component','com.leo.modules.login.login').init() />
<cfset obj.content  = CreateObject('component','com.leo.modules.content.content').init() />
<cfset obj.files    = CreateObject('component','com.leo.modules.files.files').init() />
<cfset obj.settings = CreateObject('component','com.leo.modules.settings.settings').init() />
<cfset obj.help     = CreateObject('component','com.leo.modules.help.help').init() />
<cfset obj.control  = CreateObject('component','com.leo.modules.control_panel.control_panel').init() />
<cfset obj.toolbar  = CreateObject('component','com.leo.modules.toolbar.toolbar').init() />
<cfset obj.leo      = CreateObject('component','com.leo.leo.main').init() />

<cfoutput>#obj.leo.main()#</cfoutput>

<!---
<cfdump var="#session.leo#" />
--->