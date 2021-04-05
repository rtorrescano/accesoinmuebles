<cfinclude template="VerificaSesion.cfm">
<cfoutput>
<cfquery name="usuario"  datasource="escenciales" >
	select usuario_id, area from usuario 
	where usuario_id=#session.id#
</cfquery>
<h1>Listado de registros</h1>
	<cfquery name="estatus1" datasource="escenciales">
		select count(*) as revisar from avance_registro
		where avance=1
		<cfif #usuario.area# eq 1>
			and sector=1
		<cfelseif #usuario.area# eq 2>
			and sector=2
		<cfelseif #usuario.area# eq 3>
			and sector=3			
		</cfif>
	</cfquery>
	<cfquery name="estatus2" datasource="escenciales">
		select count(*) as aceptado from avance_registro
		where avance=2
		<cfif #usuario.area# eq 1>
			and sector=1
		<cfelseif #usuario.area# eq 2>
			and sector=2
		<cfelseif #usuario.area# eq 3>
			and sector=3			
		</cfif>
	</cfquery>
	<cfquery name="estatus3" datasource="escenciales">
		select count(*) as noaceptado from avance_registro
		where avance=3
		<cfif #usuario.area# eq 1>
			and sector=1
		<cfelseif #usuario.area# eq 2>
			and sector=2
		<cfelseif #usuario.area# eq 3>
			and sector=3			
		</cfif>
	</cfquery>
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="##tab-01">Por revisar (#estatus1.revisar#)</a></li>
  <li><a data-toggle="tab" href="##tab-02">Aceptado (#estatus2.aceptado#)</a></li>
  <li><a data-toggle="tab" href="##tab-03">No aceptado (#estatus3.noaceptado#)</a></li>
</ul>
</cfoutput>
<div class="tab-content">	
	<div class="tab-pane active" id="tab-01">
		<cfquery name="avance1" datasource="escenciales" >
			select usuario_id from avance_registro
			where avance=1
			<cfif #usuario.area# eq 1>
				and sector=1
			<cfelseif #usuario.area# eq 2>
				and sector=2
			<cfelseif #usuario.area# eq 3>
				and sector=3			
			</cfif>
		</cfquery>
		<cfoutput>
		<cfif avance1.recordcount gt 0>			
			<table border="0" cellpadding="0" cellspacing="0" class="table table-bordered">									
				<tr>
					<th>No. folio</th>
					<th>Nombre Empresa</th>
					<th>Sector</th>
					<th>Acci&oacute;n</th>		
				</tr>		
				<cfloop query="avance1">	
					<cfquery name="registros"  datasource="escenciales" >
						select * from registro
						where registro_id = #usuario_id#				
					</cfquery>
										
						<cfloop query="registros">			
							<tr>
								<td  align="center">#folio#</td>
								<td  align="center">#nombre_empresa#</td>				
								<td  align="center"><cfif #sector# eq 1>Mineria<cfelseif #sector# eq 2>Construcci&oacute;n<cfelse>Fabricaci&oacute;n de equipo de transporte</cfif></td>
								<td  align="center"><a href="principal.cfm?modo=2&id=#registro_id#" class="btn btn-default">Revisar</a></td>
							</tr>
						</cfloop>					
				</cfloop>					
				<tr><td height="10"></td></tr>
			</table>
		<cfelse>
			No existen registros
		</cfif>		
		</cfoutput>		
	</div>	
  	<div class="tab-pane" id="tab-02">
  		<cfquery name="avance2" datasource="escenciales" >
			select usuario_id from avance_registro
			where avance=2
			<cfif #usuario.area# eq 1>
				and sector=1
			<cfelseif #usuario.area# eq 2>
				and sector=2
			<cfelseif #usuario.area# eq 3>
				and sector=3			
			</cfif>
		</cfquery>
		<cfoutput>
		<cfif avance2.recordcount gt 0>			
			<table border="0" cellpadding="0" cellspacing="0" class="table table-bordered">									
				<tr>
					<th>No. folio</th>
					<th>Nombre Empresa</th>
					<th>Sector</th>
					<th>Acci&oacute;n</th>		
				</tr>		
				<cfloop query="avance2">	
					<cfquery name="registros2"  datasource="escenciales" >
						select * from registro
						where registro_id = #usuario_id#				
					</cfquery>
										
						<cfloop query="registros2">			
							<tr>
								<td  align="center">#folio#</td>
								<td  align="center">#nombre_empresa#</td>		
								<td  align="center"><cfif #sector# eq 1>Mineria<cfelseif #sector# eq 2>Construcci&oacute;n<cfelse>Fabricaci&oacute;n de equipo de transporte</cfif></td>
								<td align="center"> <a href="principal.cfm?modo=2&id=#registro_id#" class="btn btn-default active">Aceptado</a></td>
							</tr>
						</cfloop>					
				</cfloop>					
				<tr><td height="10"></td></tr>
			</table>
		<cfelse>
			No existen registros
		</cfif>		
		</cfoutput>		
	</div>	
  	<div class="tab-pane" id="tab-03">
  		<cfquery name="avance3" datasource="escenciales" >
			select usuario_id from avance_registro
			where avance=3
			<cfif #usuario.area# eq 1>
				and sector=1
			<cfelseif #usuario.area# eq 2>
				and sector=2
			<cfelseif #usuario.area# eq 3>
				and sector=3			
			</cfif>
		</cfquery>
		<cfoutput>
		<cfif avance3.recordcount gt 0>			
			<table border="0" cellpadding="0" cellspacing="0" class="table table-bordered">									
				<tr>
					<th>No. folio</th>
					<th>Nombre Empresa</th>
					<th>Sector</th>
					<th>Acci&oacute;n</th>		
				</tr>		
				<cfloop query="avance3">	
					<cfquery name="registros3"  datasource="escenciales" >
						select * from registro
						where registro_id = #usuario_id#				
					</cfquery>
										
						<cfloop query="registros3">			
							<tr>
								<td  align="center">#folio#</td>
								<td  align="center">#nombre_empresa#</td>					
								<td  align="center"><cfif #sector# eq 1>Mineria<cfelseif #sector# eq 2>Construcci&oacute;n<cfelse>Fabricaci&oacute;n de equipo de transporte</cfif></td>
								<td align="center"> <a href="principal.cfm?modo=2&id=#registro_id#" class="btn btn-primary active">No aceptado</a> </td>
							</tr>
						</cfloop>					
				</cfloop>					
				<tr><td height="10"></td></tr>
			</table>
		<cfelse>
			No existen registros
		</cfif>		
		</cfoutput>		
	</div>	  	
</div>