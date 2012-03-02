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
<form action="?event=content&action=read&page=#page#" name="contentForm" method="post" class="form">
<h2>Read Page : <span style="color:#statusCheck#">#menu#</span></h2>
<div id="form_submit_holder">
	<input type="submit" name="submit" value="Update" />
	<input type="submit" name="submit" value="Delete" />
	<input type="submit" name="submit" value="Cancel" />
	<input type="hidden" name="fire" value="true" />
</div>

<div class="form_items">
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
</cfoutput>
