<cfquery name="empleado" datasource="fingresos">
	Select id_empleado, num_empleado, rfc, curp, ap_paterno, ap_materno, nombre from empleados
	where num_empleado = '#form.num_emp#'
	or	rfc = '#form.num_emp#'
	or  mail_user='#form.num_emp#'	
</cfquery>
<cfoutput>
	<cfif empleado.recordCount GT 0>	
		<cfquery name="consulta_registro" datasource="fingresos">
			select id_empleado, fecha  from registros		
			where id_empleado = #empleado.id_empleado# 
			and dias < 15
		</cfquery>
		<cfif #consulta_registro.id_empleado# gt 0>
			<cflocation url="principal.cfm?modo=4&id_empleado=#empleado.id_empleado#">
		<cfelse>
			<cflocation url="principal.cfm?modo=2&id_empleado=#empleado.id_empleado#">
		</cfif>    
	<cfelse>
		<cflocation url="principal.cfm?modo=1&valida=2">
	</cfif>
</cfoutput>