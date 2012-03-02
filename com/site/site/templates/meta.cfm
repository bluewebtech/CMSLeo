<cfset queryMeta = obj.site.queryContent() />

<cfoutput>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="google-site-verification" content="FxM9ZdZGzSvE3U0sGcL8cF7kYtcxVTIzpiIq7l6oWZg" />
<meta name="robots" content="index, follow">
<meta name="keywords" content="#queryMeta.meta_keywords#" />
<meta name="description" content="#queryMeta.meta_description#" />
<title>#queryMeta.meta_title#</title>
</cfoutput>