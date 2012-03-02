<cfset objSiteBean = CreateObject('component','com.beans.site') />
<cfset objSiteBean.setPage(url.page) />

<cfset obj      = StructNew() />
<cfset obj.bean = objSiteBean />
<cfset obj.site = CreateObject('component','com.site.site.main').init(obj.bean) />

<cfoutput>#obj.site.main()#</cfoutput>