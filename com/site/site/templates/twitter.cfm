<cfset objTwitter = CreateObject('component','com.site.twitter.twitter') />
<cfset twitter = objTwitter.twitter('bluewebtech',4) />
<cfset count = ArrayLen(twitter) />

<div id="twitter">
Twitter Feed
<cfloop from="1" to="#count#" index="i">
<cfoutput>
<p>#resultArray[i]['text']#</p><br />
</cfoutput>
</cfloop>
</div>