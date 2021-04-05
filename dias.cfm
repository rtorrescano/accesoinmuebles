<cfoutput>
<cfquery datasource="fingresos" name="Control">
	select Fecha
	from dias
	Where Fecha = #CreateODBCDate(Now())#
</cfquery>
<cfif Control.Recordcount IS 0>
	<cfquery datasource="fingresos" name="Inserta">
		Insert Into dias (fecha, realizado)
		  values ( #CreateODBCDate(Now())#, 1)
	</cfquery>
	<cfquery name="conteo_dias" datasource="fingresos">
		select dias from registros
	</cfquery>
	<cfloop query="conteo_dias">
		<cfset ndias=#conteo_dias.dias# + 1>
		<cfquery name="actualiza_dias" datasource="fingresos">
			update registros set 
			dias = #ndias#
		</cfquery>
	</cfloop>
<cfelse>
	<cfquery datasource="fingresos" name="Inserta">
		Update dias
		  set realizado = 1
		where Fecha = #CreateODBCDate(Now())#
	</cfquery>	
</cfif>
</cfoutput>