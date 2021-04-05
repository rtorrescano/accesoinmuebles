<cfinclude template="VerificaSesion.cfm">
<cfoutput>
	<cfset Hoy = CreateODBCDateTime(Now())>
	<cfset consulta = LSDateFormat(now(), "dd/mm/yyyy")>
	<cfif '#form.id_empleado#' gt 0>
		<cfquery name="consulta_empleado" datasource="fingresos">
			select * from empleados		
			where id_empleado = '#form.id_empleado#'
		</cfquery>
		<cfquery name="consulta_registro" datasource="fingresos">
			select id_registro from registros		
			where id_empleado = #consulta_empleado.id_empleado#
			and fecha = #consulta#
		</cfquery>
		<cfif consulta_registro.recordCount GT 0>
			<cflocation url="principal.cfm?modo=2&id_empleado=#consulta_empleado.id_empleado#">
		<cfelse>
		#form.id_empleado#
			<cfset consulta = CreateODBCDate(Now())>
			<cfquery name="empleados" datasource="fingresos">
				update empleados set 
				num_empleado='#form.num_emp#', 
				rfc='#form.rfc#', 
				curp='#form.curp#', 
				ap_paterno='#form.paterno#', 
				ap_materno='#form.materno#', 
				nombre='#form.nombre#', 
				area_adscripcion='#form.area_emp#', 
				extension='#form.ext#', 
				edad=#form.edad#
				where id_empleado = '#form.id_empleado#'
			</cfquery>
			<cfquery name="sintomas" datasource="fingresos">
				Insert into registros (id_empleado, sintoma1,sintoma2, sintoma3, sintoma4, sintoma5, enfermedad1, enfermedad2, enfermedad3, enfermedad4, enfermedad5, filtro, fecha_registro, fecha, dias)
				Values (#consulta_empleado.id_empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#',#session.id#,#hoy#,#consulta#,1)				
			</cfquery>
			<cflocation url="principal.cfm?modo=4&id_empleado=#consulta_empleado.id_empleado#">		
		</cfif>		
	<cfelse>
		<cfset consulta = CreateODBCDate(Now())>
		<cfquery name="empleados" datasource="fingresos">
			Insert into empleados (num_empleado, rfc, curp, ap_paterno, ap_materno, nombre, mail, mail_user, area_adscripcion, extension, edad, sexo)
			Values ('#form.num_emp#','#form.rfc#','#form.curp#','#form.paterno#','#form.materno#','#form.nombre#','correo','usuario','#form.area_emp#','#form.ext#',#form.edad#,'U')
		</cfquery>
		<cfquery name="consulta_empleado" datasource="fingresos">
			select id_empleado from empleados		
			where rfc = '#form.rfc#'
		</cfquery>
		<cfquery name="sintomas" datasource="fingresos">
			Insert into registros (id_empleado, sintoma1,sintoma2, sintoma3, sintoma4, sintoma5, enfermedad1, enfermedad2, enfermedad3, enfermedad4, enfermedad5, filtro, fecha_registro, fecha, dias)
				Values (#consulta_empleado.id_empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#',#session.id#,#hoy#,#consulta#, 1)
		</cfquery>
		<cflocation url="principal.cfm?modo=4&id_empleado=#consulta_empleado.id_empleado#">
	</cfif>
</cfoutput>