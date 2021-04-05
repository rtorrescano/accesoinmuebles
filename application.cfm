<cfapplication name="fingresos" 
	applicationtimeout="#CreateTimeSpan("0", "0", "60", "0")#" 
	SESSIONTIMEOUT="#CreateTimeSpan("0", "0", "60", "0")#" 
	SESSIONMANAGEMENT="YES" 
	SETCLIENTCOOKIES="YES">
<cfif isDefined("session.id")>
	<cfset request.fullname=session.id>
	
<cfelse>
	<cfset StructClear(Session)>
</cfif>
	
	