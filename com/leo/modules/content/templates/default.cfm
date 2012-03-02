<cfset queryContent = obj.content.daoList() />

<cfoutput>
<h2>Content</h2><br />

<div id="content_actions_holder">
	<div class="content_action">
		<a href="?event=content&action=create">
			<img src="/leo/images/icon_create.png" width="25" height="25" border="0" />
		</a>
	</div>
</div>

<div id="content_holder">
	<div class="content_headers">
		<div class="content_header_title">
			Pages
		</div>
		<div class="content_header_date">
			Date Created
		</div>
		<div class="content_header_date">
			Date Updated
		</div>
		<div class="content_header_action">
			Read
		</div>
		<div class="content_header_action">
			Update
		</div>
		<div class="content_header_action">
			Delete
		</div>
		<div class="content_header_action">
			Status
		</div>
		<div class="clear"></div>
	</div>
	
	<cfloop query="queryContent">
	<div class="content_items">
		<div class="content_item_title">
			<a href="?event=content&action=update&page=#queryContent.id#">
				#queryContent.menu#
			</a>
		</div>
		<div class="content_item_date">
			#DateFormat(queryContent.date_created,'yyyy-mm-dd')#
		</div>
		<div class="content_item_date">
			<cfif len(queryContent.date_updated) GT 0>
				#DateFormat(queryContent.date_updated,'yyyy-mm-dd')#
			<cfelse>
				Not yet
			</cfif>
		</div>
		<div class="content_item_action">
			<a href="?event=content&action=read&page=#queryContent.id#">
				<img src="/leo/images/icon_read.png" width="25" height="25" border="0" />
			</a>
		</div>
		<div class="content_item_action">
			<a href="?event=content&action=update&page=#queryContent.id#">
				<img src="/leo/images/icon_update.png" width="25" height="25" border="0" />
			</a>
		</div>
		<div class="content_item_action">
			<a href="?event=content&action=delete&page=#queryContent.id#">
				<img src="/leo/images/icon_delete.png" width="25" height="25" border="0" />
			</a>
		</div>
		<div class="content_item_action">
			<cfset imageEnable  = '<img src="/leo/images/icon_active_enable.png" width="25" height="25" border="0" />' />
			<cfset imageDisable = '<img src="/leo/images/icon_active_disabled.png" width="25" height="25" border="0" />' />
			<cfset status       = queryContent.enable />
			<cfset statusCheck  = application.framework.style.enableImage(imageEnable,imageDisable,status) />
			
			<a href="?event=content&action=status&page=#queryContent.id#">
				#statusCheck#
			</a>
		</div>
		<div class="clear"></div>
	</div>
	</cfloop>
</div>
</cfoutput>