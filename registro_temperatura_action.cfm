<cfoutput>
	<cfset Hoy = CreateODBCDateTime(Now())>
	<cfset consulta = CreateODBCDate(Now())>
	<cfif #session.id# eq 2>
		<cfset temperatura=#form.temperatura2#>
	<cfelseif #session.id# eq 3>
		<cfset temperatura=#form.temperatura3#>
	<cfelseif #session.id# eq 4>
		<cfset temperatura=#form.temperatura4#>
	<cfelseif #session.id# eq 5>
		<cfset temperatura=#form.temperatura5#>
	<cfelseif #session.id# eq 6>
		<cfset temperatura=#form.temperatura6#>
	</cfif>
	<cfquery name="sintomas" datasource="fingresos">
		Insert into temperatura_registro (id_empleado, temperatura, torre, fecha_registro, fecha)
		Values (#form.id_empleado#,'#temperatura#',#session.id#,#hoy#,#consulta#)					
	</cfquery>
	<cflocation url="principal.cfm?modo=1">
</cfoutput>