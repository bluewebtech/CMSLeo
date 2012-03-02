<cfset fire       = application.fire />
<cfset event      = application.event />
<cfset page       = application.page />
<cfset queryPage  = obj.content.daoGetPage(page) />
<cfset queryGroup = obj.content.daoGetValue("menu_item",obj.bean.getGroup()) />

<cfset menu = queryPage.menu />
<cfset menu_url = queryPage.menu_url />
<cfset order = queryPage.menu_order />
<cfset title = queryPage.meta_title />
<cfset keywords = queryPage.meta_keywords />
<cfset description = queryPage.meta_description />
<cfset enable = queryPage.enable />
<cfset content = queryPage.content />

<cfset imageEnable  = '##00d500' />
<cfset imageDisable = '##e4070d' />
<cfset status       = queryPage.enable />
<cfset statusCheck  = application.framework.style.enableImage(imageEnable,imageDisable,status) />

<cfoutput>
<cfif !fire>
<form action="?event=content&action=delete&page=#page#" name="contentForm" method="post" class="form">
<h2>Delete Page : <span style="color:#statusCheck#">#menu#</span></h2>
<div id="form_submit_holder">
	<input type="submit" name="submit" value="Yes" />
	<input type="submit" name="submit" value="No" />
	<input type="hidden" name="fire" value="true" />
</div>

<div class="form_items">
	<h2>Are you sure you would like to delete this page?</h2>
	<h3>Menu Information</h3>
	<p>Name: #menu#</p>
	<p>Group: #queryGroup.menu#</p>
	<p>URL: #menu_url#</p>
	<p>Order: #order#</p>
	<h3>Meta Data</h3>
	<p>Page Title: #title#</p>
	<p>Meta Keywords: #keywords#</p>
	<p>Meta Description: #description#</p>
	<h3>Page Status</h3>
	<p>
		<cfset textEnable  = 'Enabled' />
		<cfset textDisable = 'Disabled' />
		<cfset status       = queryPage.enable />
		#application.framework.style.enableImage(textEnable,textDisable,status)#
	</p>
	<h3>Content</h3>
	<p>#content#</p>
</div>
</form>
<cfelse>
	#obj.content.daoDelete(page)#
	<h2>Page deleted!!</h2>
</cfif>
</cfoutput>
