<cfset Hoy = CreateODBCDateTime(Now())>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
</head>
<body>

<h2>How To Create A Loader</h2>

<div class="loader">
	<cfoutput>
	<cfquery name="folio" datasource="escenciales">
		select count(*) as total from registro
	</cfquery>
	<cfset consecutivo=#folio.total#+1>
	<cfif #folio.total# lte 9>
		<cfset ceros=0000>
	<cfelseif #folio.total# gte 10 and #folio.total# lte 99>
		<cfset ceros=000>
	<cfelseif #folio.total# gte 100 and #folio.total# lte 999>
		<cfset ceros=00>
	<cfelseif #folio.total# gte 1000 and #folio.total# lte 9999>
		<cfset ceros=0>
	</cfif>
	<cfset testDirectory = "#expandPath("files/#consecutivo#")#"> 	
	<cfif directoryExists(testDirectory)>
		<cfset testDirectory = "#expandPath("files/#consecutivo#")#"> 	   
	 <cfelse>
		<cfdirectory action="create" directory="#expandPath("files/#consecutivo#")#">
		<cfset testDirectory = "#expandPath("files/#consecutivo#")#">
	 </cfif>
	<cffile action = "upload"
	fileField = "archivo1"
	destination = "#testDirectory#" 
	accept="application/pdf"
	nameConflict = "overwrite"> 
	<cfset proveedor="#cffile.ClientFileName#.#cffile.ClientFileExt#">
	<cffile action = "upload"
	fileField = "archivo2"
	destination = "#testDirectory#" 
	accept="application/pdf"
	nameConflict = "overwrite"> 
	<cfset protocolo="#cffile.ClientFileName#.#cffile.ClientFileExt#">
	
	<cfquery name="nuevo_registro" datasource="escenciales">
		Insert into registro (nombre_empresa, planta, sector, calle, colonia, cp, nombre, correo, telefono, turnos, trabajadores_turno, comentarios_plr, 
		fecha_inicio_ep	, plantilla_laboral_ep,turnos_ep, trabajadores_turno_ep, comentarios_ep, fecha_inicio_er, plantilla_laboral_er, turnos_er, 
		trabajadores_turno_er, comentarios_er, fecha_registro,rfc,folio,proveedores,protocolo)
		Values ('#form.nombre_empresa#', '#form.planta#', '#form.sector#', '#form.calle#','#form.colonia#','#form.cp#','#form.nombre#','#form.correo#',
		'#form.telefono#','#form.turnos#','#form.trabajadores_turno#','#form.comentarios_plr#','#form.fecha_inicio_ep#','#form.plantilla_laboral_ep#',
		'#form.turnos_ep#','#form.trabajadores_turno_ep#','#form.comentarios_ep#','#form.fecha_inicio_er#','#form.plantilla_laboral_er#',
		'#form.turnos_er#','#form.trabajadores_turno_er#','#form.comentarios_er#', #hoy#, '','SE-2020-#form.sector##ceros##consecutivo#','#proveedor#','#protocolo#')
	</cfquery>	
	<cfquery name="" datasource="escenciales">
		insert into avance_registro(usuario_id, folio, avance, fecha_registro,sector)
		values(#consecutivo#, 'SE-2020-#ceros##consecutivo#', 1, #hoy#,'#form.sector#')
	</cfquery>		
</cfoutput>
<cflocation url="mensaje.cfm?folio=SE-2020-#form.sector##ceros##consecutivo#">

	
</div>

</body>
</html>
