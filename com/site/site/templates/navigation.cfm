<cfset queryNavigation = obj.site.queryContent() />

<cfoutput>
<ul class="main_menu">
	<cfloop query="queryNavigation">
	<li>
		<a href="?page=#queryNavigation.menu_url#">#queryNavigation.menu#</a>
	</li>
	</cfloop>
</ul>
</cfoutput>
