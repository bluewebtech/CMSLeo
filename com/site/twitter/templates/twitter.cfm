<cfset twitter = results('bluewebtech',1) />
<cfset count = ArrayLen(twitter) />

<div id="twitter">
<h2>Twitter Feed</h2>
<cfloop from="1" to="#count#" index="i">
<cfoutput>
<p>#twitter[i]['text']#</p>
</cfoutput>
</cfloop>
</div>