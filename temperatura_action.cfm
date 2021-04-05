<cfinclude template="VerificaSesion.cfm">
<cfset Hoy = CreateODBCDateTime(Now())>
<cfset consulta = CreateODBCDate(Now())>
<cfquery name="empleados" datasource="fingresos">
	<cfif #session.id# eq 2>
		update registros set 
		temperatura1='#form.temperatura2#', 
		torre1=#session.id#, 
		fecha_registro1=#hoy#
		where empleado = '#form.id_empleado#'
		and fecha = #consulta#
	<cfelseif #session.id# eq 3>
		update registros set 
		temperatura2='#form.temperatura3#', 
		torre2=#session.id#, 
		fecha_registro2=#hoy#
		where empleado = '#form.id_empleado#'
		and fecha = #consulta#
	<cfelseif #session.id# eq 4>
		update registros set 
		temperatura3='#form.temperatura4#', 
		torre3=#session.id#, 
		fecha_registro3=#hoy#
		where empleado = '#form.id_empleado#'
		and fecha = #consulta#
	<cfelseif #session.id# eq 5>
		update registros set 
		temperatura4='#form.temperatura5#', 
		torre4=#session.id#, 
		fecha_registro4=#hoy#
		where empleado = '#form.id_empleado#'
		and fecha = #consulta#
	<cfelseif #session.id# eq 6>
		update registros set 
		temperatura5='#form.temperatura6#', 
		torre5=#session.id#, 
		fecha_registro5=#hoy#
		where empleado = '#form.id_empleado#'
		and fecha = #consulta#
	</cfif>
</cfquery>
<cflocation url="principal.cfm?modo=3">