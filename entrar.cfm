<cfquery name="usuario" datasource="fingresos">
	Select usuario_id from usuarios
	where usuario_id = #form.usuario#
	and password = '#form.password#'
</cfquery>
<cfoutput>
<cfif usuario.recordCount GT 0>
	<cfset session.id=#usuario.usuario_id#>
	<cfinclude template="dias.cfm">
	<cflocation url="principal.cfm">    
<cfelse>
	<cfset StructClear(Session)>
	<cflocation url="index.cfm?valida=2">
</cfif>
</cfoutput>