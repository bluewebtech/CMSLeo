<cfset fire       = application.fire />
<cfset event      = application.event />
<cfset page       = application.page />
<cfset validation = obj.content.processVal() />
<cfset queryPage  = obj.content.daoGetPage(page) />
<cfset queryList  = obj.content.daoList() />
<cfset queryGroup = obj.content.daoGetValue("menu_item",obj.bean.getGroup()) />
<cfset values     = obj.content.contentValues() />

<cfif fire>
	<cfset menu = values.menu />
	<cfset menu_url = values.url />
	<cfset order = values.order />
	<cfset title = values.title />
	<cfset keywords = values.keywords />
	<cfset description = values.description />
	<cfset enable = values.enable />
	<cfset content = values.content />
<cfelse>
	<cfset menu = queryPage.menu />
	<cfset menu_url = queryPage.menu_url />
	<cfset order = queryPage.menu_order />
	<cfset title = queryPage.meta_title />
	<cfset keywords = queryPage.meta_keywords />
	<cfset description = queryPage.meta_description />
	<cfset enable = queryPage.enable />
	<cfset content = queryPage.content />
</cfif>

<cfset imageEnable  = '##00d500' />
<cfset imageDisable = '##e4070d' />
<cfset status       = queryPage.enable />
<cfset statusCheck  = application.framework.style.enableImage(imageEnable,imageDisable,status) />

<cfoutput>
<cfif fire and !validation>
<div class="error_block">
	Oh Poop! Invalid or missing data provided.
</div>
</cfif>	

<cfif !fire or !validation>
<form action="?event=content&action=update&page=#page#" name="contentForm" method="post" class="form">
<h2>Update Page : <span style="color:#statusCheck#">#menu#</span></h2>
<div id="form_submit_holder">
	<input type="submit" name="submit" value="Update" />
	<input type="submit" name="submit" value="Draft" />
	<input type="submit" name="submit" value="Cancel" />
	<input type="hidden" name="fire" value="true" />
</div>

<div class="form_items">
	<div class="form_button">
		<a href="##" class="defaulttab" rel="tabs1">Page Info</a>
	</div>
    <div class="form_button">
		<a href="##" rel="tabs2">Content</a>
	</div>
	<div class="clear"></div>

	<div class="tab_form" id="tabs1">
		<h3>Menu Information</h3>
		<p>
			 Name: <span class="error">*</span><br />
			<input type="text" name="menu" id="menu" size="30" value="#menu#" />
			#application.framework.style.errorImage(obj.content.menuVal())#
		</p>
		<p>
			Group:<br />
			<select name="group" id="group">
				<cfif !fire>
				<option value="#queryPage.id#">#queryPage.menu#</option>
				<cfelse>
				<option value="#obj.bean.getGroup()#">#queryGroup.menu#</option>
				</cfif>
				
				<cfloop query="queryList">
				<option value="#queryList.id#">#queryList.menu#</option>
				</cfloop>
			</select>
		</p>
		<p>
			URL:<br />
			<input type="text" name="url" id="url" size="80" value="#menu_url#" />
		</p>
		<p>
			Order:<br />
			<input type="text" name="order" id="order" size="10" value="#order#" />
		</p>
		<h3>Meta Data</h3>
		<p>
			Page Title:<br />
			<input type="text" name="title" id="title" size="80" value="#title#" />
		</p>
		<p>
			Meta Keywords:<br />
			<input type="text" name="keywords" id="keywords" size="100" value="#keywords#" />
		</p>
		<p>
			Meta Description:<br />
			<input type="text" name="description" id="description" size="100" value="#description#" />
		</p>
		<h3>Page Status</h3>
		<p>
			Enable: 
			<input type="radio" name="enable" id="enable" value="1" <cfif enable eq 1>checked="checked"</cfif>> Yes 
			<input type="radio" name="enable" id="enable" value="0" <cfif enable eq 0>checked="checked"</cfif>> No
		</p>
	</div>
	<div class="tab_form" id="tabs2">
		<h3>Content</h3><br />
		<textarea name="content" id="content" class="content" rows="30" cols="80" style="width:800px;height:500px;">#content#</textarea>
	</div>
</div>
</form>
<cfelse>
	#obj.content.daoUpdate(values,page)#
	<h2>Page Updated!</h2>
</cfif>
</cfoutput>
