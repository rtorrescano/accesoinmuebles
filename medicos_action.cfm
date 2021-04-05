<cfinclude template="VerificaSesion.cfm">
<cfset Hoy = CreateODBCDateTime(Now())>
<cfquery name="medico" datasource="fingresos">
	Insert into medicos (medicos, edificio, estatus)
	Values ('#form.nombre#',#form.edificio#,1)	
</cfquery>
<cflocation url="principal.cfm?modo=3">