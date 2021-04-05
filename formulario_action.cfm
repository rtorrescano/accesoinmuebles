<cfinclude template="VerificaSesion.cfm">
<cfoutput>
	#session.id#
	<cfset Hoy = CreateODBCDateTime(Now())>
	<cfset consulta = LSDateFormat(now(), "dd/mm/yyyy")>
	<cfif #session.id# eq 2>
		<cfset nombre='Ma. Elena Vázquez Pérez Dalia'>
	<cfelseif #session.id# eq 3>
		<cfset nombre='Nataly Regino Vázquez'>
	<cfelseif #session.id# eq 4>
		<cfset nombre='Beatriz García Pelaez'>
	<cfelseif #session.id# eq 5>
		<cfset nombre='Beatriz García Pelaez'>
	<cfelseif #session.id# eq 6>
		<cfset nombre='Nataly Regino Vázquez'>
	</cfif>
	<cfif '#form.id_empleado#' gt 0>
		<cfquery name="consulta_empleado" datasource="fingresos">
			select * from empleados		
			where id_empleado = '#form.id_empleado#'
		</cfquery>
		<cfquery name="consulta_registro" datasource="fingresos">
			select id_registro from sintomas		
			where id_empleado = #consulta_empleado.id_empleado#
			and fecha = #consulta#
		</cfquery>
		<cfif consulta_registro.recordCount GT 0>
			<cflocation url="principal.cfm?modo=2&id_registro=#consulta_registro.id_registro#&id_empleado=#consulta_empleado.id_empleado#">
		<cfelse>
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
				Insert into registros (empleado, sintoma1,sintoma2, sintoma3, sintoma4, sintoma5, temperatura1, enfermedad1, enfermedad2, enfermedad3, enfermedad4, enfermedad5, filtro, torre1, fecha_registro1, fecha, temperatura2, torre2, fecha_registro2, temperatura3, torre3, fecha_registro3, temperatura4, torre4, fecha_registro4, temperatura5, torre5, fecha_registro5)
				<cfif #session.id# eq 2>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','#form.temperatura#','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',#session.id#,#hoy#,#consulta#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00')
				<cfelseif #session.id# eq 3>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','0','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',0,'0000-00-00 00:00:00',#consulta#,'#form.temperatura#',#session.id#,#hoy#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00')					
				<cfelseif #session.id# eq 4>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','0','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',0,'0000-00-00 00:00:00',#consulta#,'0',0,'0000-00-00 00:00:00','#form.temperatura#',#session.id#,#hoy#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00')					
				<cfelseif #session.id# eq 5>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','0','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',0,'0000-00-00 00:00:00',#consulta#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','#form.temperatura#',#session.id#,#hoy#,'0',0,'0000-00-00 00:00:00')					
				<cfelseif #session.id# eq 6>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','0','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',0,'0000-00-00 00:00:00',#consulta#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','#form.temperatura#',#session.id#,#hoy#)		
				</cfif>
			</cfquery>
			<cflocation url="principal.cfm?modo=3">		
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
			Insert into registros (empleado, sintoma1,sintoma2, sintoma3, sintoma4, sintoma5, temperatura1, enfermedad1, enfermedad2, enfermedad3, enfermedad4, enfermedad5, filtro, torre1, fecha_registro1, fecha, temperatura2, torre2, fecha_registro2, temperatura3, torre3, fecha_registro3, temperatura4, torre4, fecha_registro4, temperatura5, torre5, fecha_registro5)
			<cfif #session.id# eq 2>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','#form.temperatura#','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',#session.id#,#hoy#,#consulta#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00')
				<cfelseif #session.id# eq 3>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','0','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',0,'0000-00-00 00:00:00',#consulta#,'#form.temperatura#',#session.id#,#hoy#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00')					
				<cfelseif #session.id# eq 4>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','0','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',0,'0000-00-00 00:00:00',#consulta#,'0',0,'0000-00-00 00:00:00','#form.temperatura#',#session.id#,#hoy#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00')					
				<cfelseif #session.id# eq 5>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','0','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',0,'0000-00-00 00:00:00',#consulta#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','#form.temperatura#',#session.id#,#hoy#,'0',0,'0000-00-00 00:00:00')					
				<cfelseif #session.id# eq 6>
					Values (#consulta_empleado.empleado#,'#form.radior1#','#form.radior2#','#form.radior3#','#form.radior4#','#form.radior5#','0','#form.radior6#','#form.radior7#','#form.radior8#','#form.radior9#','#form.radior10#','#nombre#',0,'0000-00-00 00:00:00',#consulta#,'0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','0',0,'0000-00-00 00:00:00','#form.temperatura#',#session.id#,#hoy#)		
				</cfif>
		</cfquery>
		<cflocation url="principal.cfm?modo=3">
	</cfif>
</cfoutput>