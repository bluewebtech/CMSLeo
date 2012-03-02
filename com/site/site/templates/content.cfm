<cfset queryContent = obj.site.queryContentPage(application.page) />

<cfoutput>
#queryContent.content#
</cfoutput>