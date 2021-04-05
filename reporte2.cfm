  	<cfquery name="getinactive" datasource="fingresos">
	SELECT id_empleado, sintoma1,sintoma2, sintoma3, sintoma4, sintoma5, temperatura1, 
	enfermedad1, enfermedad2, enfermedad3, enfermedad4, enfermedad5, filtro, 
	torre1, fecha_registro1, fecha, temperatura2, torre2, fecha_registro2, temperatura3, torre3, fecha_registro3, 
	temperatura4, torre4, fecha_registro4, temperatura5, torre5, fecha_registro5
	FROM registros
	</cfquery>


<cfspreadsheet 
action="write"
query="getinactive"
filename="reporte.xls"
name="theSheet"
sheetname="courses"
overwrite="true">

