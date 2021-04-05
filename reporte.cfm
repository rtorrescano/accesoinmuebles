<cfsetting enablecfoutputonly="yes">
  	<cfquery name="getinactive" datasource="fingresos">
	SELECT rfc, curp, ap_paterno, ap_materno, nombre, edad, num_unidad,unidad, extension, sintoma1,sintoma2, sintoma3, sintoma4, sintoma5, 
	enfermedad1, enfermedad2, enfermedad3, enfermedad4, enfermedad5, filtro, fecha_registro, fecha, dias, medicos
 	FROM registros
 	INNER JOIN empleados ON registros.id_empleado = empleados.id_empleado
 	LEFT JOIN cat_unidades ON empleados.area_adscripcion = cat_unidades.num_unidad
 	LEFT JOIN medicos ON registros.filtro = medicos.edificio
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
            <th>Fiebre</th>
            <th>Tos, estornudos</th>
            <th>Malestar general</th>
            <th>Dolor de cabeza</th>
            <th>Dificultad para respirar</th>
            <th>Hipertensi&oacute;n arterial</th>
           	<th>Diabetes mellitus</th>
           	<th>Insuficiencia renal o hep&aacute;tica</th>
           	<th>Inmunosupresi&oacute;n (adquirida o provocada)</th>
           	<th>Enfermedad card&iacute;aca o pulmonar cr&oacute;nicas</th>
            <th>Dr. que registro</th>
            <th>Fecha registro</th>
            <th>D&iacute;as transcurridos de cuestionario</th>           	
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
               <td>#getinactive.sintoma1#</td>
			   <td>#getinactive.sintoma2#</td>
			   <td>#getinactive.sintoma3#</td>			   
			   <td>#getinactive.sintoma4#</td>			   
			   <td>#getinactive.sintoma5#</td>
			   <td>#getinactive.enfermedad1#</td>			   
			   <td>#getinactive.enfermedad2#</td>			  
			   <td>#getinactive.enfermedad3#</td>			   
			   <td>#getinactive.enfermedad4#</td>			   
			   <td>#getinactive.enfermedad5#</td>
			   <td>#getinactive.medicos#</td>
			   <cfset formato_fecha=Lsdateformat(#getinactive.fecha#,"dd/mm/yyyy")>
			   <td>#formato_fecha#</td>
			   <td>#dias#</td>
			   
			   
            </tr>
         </cfloop>
      </table>
   </cfoutput>