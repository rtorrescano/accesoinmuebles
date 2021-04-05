<cfinclude template="VerificaSesion.cfm">
<cfset Hoy = CreateODBCDateTime(Now())>
<cfquery name="temp_act" datasource="fingresos">
	update temperatura set 
	estatus=2 	
</cfquery>
<cfquery name="temperatura" datasource="fingresos">
	Insert into temperatura (temperatura, fecha_registro, estatus)
	Values ('#form.temperatura#',#hoy#,1)	
</cfquery>
<cflocation url="principal.cfm?modo=2">