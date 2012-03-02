<cfset fire       = application.fire />
<cfset event      = application.event />
<cfset validation = obj.content.processVal() />
<cfset queryList  = obj.content.daoList() />
<cfset queryGroup = obj.content.daoGetValue("menu_item",obj.bean.getGroup()) />
<cfset values     = obj.content.contentValues() />

<cfoutput>
<cfif fire and !validation>
<div class="error_block">
	Oh Poop! Invalid or missing data provided.
</div>
</cfif>	

<cfif !fire or !validation>
<form action="?event=content&action=create" name="contentForm" method="post" class="form">
<h2>Create Page</h2>
<div id="form_submit_holder">
	<input type="submit" name="submit" value="Create" />
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
			<input type="text" name="menu" id="menu" size="30" value="#obj.bean.getMenu()#" />
			#application.framework.style.errorImage(obj.content.menuVal())#
		</p>
		<p>
			Group:<br />
			<select name="group" id="group">
				<cfif !fire>
				<option value=""> - Select - </option>
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
			<input type="text" name="url" id="url" size="80" value="#obj.bean.getUrl()#" />
		</p>
		<p>
			Order:<br />
			<input type="text" name="order" id="order" size="10" value="" />
		</p>
		<h3>Meta Data</h3>
		<p>
			Page Title:<br />
			<input type="text" name="title" id="title" size="80" value="" />
		</p>
		<p>
			Meta Keywords:<br />
			<input type="text" name="keywords" id="keywords" size="100" value="" />
		</p>
		<p>
			Meta Description:<br />
			<input type="text" name="description" id="description" size="100" value="" />
		</p>
		<h3>Page Status</h3>
		<p>
			Enable: 
			<input type="radio" name="enable" id="enable" value="1" checked="checked"> Yes 
			<input type="radio" name="enable" id="enable" value="0"> No
		</p>
	</div>
	<div class="tab_form" id="tabs2">
		<h3>Content</h3><br />
		<textarea name="content" id="content" class="content" rows="30" cols="80" style="width:800px;height:500px;"></textarea>
	</div>
</div>
</form>
<cfelse>
	#obj.content.daoCreate(values)#
	<h2>New page created!</h2>
</cfif>
</cfoutput>
