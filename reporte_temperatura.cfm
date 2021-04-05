<cfsetting enablecfoutputonly="yes">
  	<cfquery name="getinactive" datasource="fingresos">
	SELECT rfc, curp, ap_paterno, ap_materno, nombre, edad, num_unidad,unidad, extension, temperatura, torre, fecha, edificio
 	FROM temperatura_registro
 	INNER JOIN empleados ON temperatura_registro.id_empleado = empleados.id_empleado
 	LEFT JOIN cat_unidades ON empleados.area_adscripcion = cat_unidades.num_unidad
 	LEFT JOIN usuarios ON temperatura_registro.torre = usuarios.usuario_id
	</cfquery>

   <cfcontent type="application/vnd.ms-excel">
   <cfheader name="Content-Disposition" value="filename=reporte.xls">
   <cfoutput>
      <table border="1">
         <tr>
            <th>RFC</th>
            <th>CURP</th>
            <th>Apellido paterno</th>
            <th>Apellido materno</th>
            <th>Nombre</th>
            <th>Edad</th>
			<th>UR</th>
            <th>&Aacute;rea de adscripci&oacute;n</th>
            <th>Extensi&oacute;n</th>
            <th>Temperatura</th>
            <th>Edificio</th>
            <th>Fecha registro</th>                       	
         </tr>
         <cfloop query="getinactive">
            <tr>	                  
               <td>#getinactive.rfc#</td>
               <td>#getinactive.curp#</td>
               <td>#getinactive.ap_paterno#</td>
               <td>#getinactive.ap_materno#</td>
               <td>#getinactive.nombre#</td>
               <td>#getinactive.edad#</td>
			   <td>#getinactive.num_unidad#</td>
               <td>#getinactive.unidad#</td>
               <td>#getinactive.extension#</td>			   
			   <td>#getinactive.temperatura#</td>
			   <td>#getinactive.edificio#</td>
			   <cfset formato_fecha=Lsdateformat(#getinactive.fecha#,"dd/mm/yyyy")>
			   <td>#formato_fecha#</td>
            </tr>
         </cfloop>
      </table>
   </cfoutput>