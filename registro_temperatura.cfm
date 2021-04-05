<cfinclude template="VerificaSesion.cfm">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Secretar&iacute;a de Econom&iacute;a</title>
    <!-- CSS -->
    <link href="/favicon.ico" rel="shortcut icon">
    <link href="https://framework-gb.cdn.gob.mx/qa/assets/styles/main.css" rel="stylesheet">
    <!-- Respond.js soporte de media queries para Internet Explorer 8 -->
    <!-- ie8.js EventTarget para cada nodo en Internet Explorer 8 -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/ie8/0.2.2/ie8.js"></script>
    <![endif]-->
  </head>
  <body>
  	<body>
  		<cfoutput>
    	<main class="page">
      		<nav class="navbar navbar-inverse sub-navbar navbar-fixed-top">
        		<div class="container">
          			<div class="navbar-header">
            			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##subenlaces">
              				<span class="sr-only">Interruptor de Navegaci&oacute;n</span>
              				<span class="icon-bar"></span>
              				<span class="icon-bar"></span>
              				<span class="icon-bar"></span>
            			</button>
            			<a class="navbar-brand" href="/">Secretar&iacute;a de Econom&iacute;a</a>
          			</div>
          			<cfquery name="usuarios" datasource="fingresos">
						Select usuario_id,edificio from usuarios
						where usuario_id = #session.id#
					</cfquery>
          			<div class="collapse navbar-collapse" id="subenlaces">
            			<ul class="nav navbar-nav navbar-right">
              				<li><a class="navbar-brand" href="/">#usuarios.edificio#</a></li>
                    		<li><a href="index.cfm">Salir</a></li>              
            			</ul>
          			</div>
        		</div>
      		</nav>
      		<div class="container">
				<div class="row">
    				<div class="col-sm-12">
      					<h2>Cuestionario de detecci&oacute;n de signos y s&iacute;ntomas</h2>
    				</div>
    				<cfif IsDefined('URL.id_empleado')>
    					<cfset consulta = CreateODBCDate(Now())>
    					<cfquery name="consulta_registro" datasource="fingresos">
							select id_empleado, fecha  from temperatura_registro		
							where id_empleado = #url.id_empleado# 
							and fecha = #consulta#
						</cfquery>
						<cfif #consulta_registro.id_empleado# gt 0>
							<div class="frorm-group">
			              		<form name="registro" action="registro_temperatura_action.cfm" method="post" enctype="multipart/form-data">    	
							    	<div class="row">
							    		<div class="col-sm-8">
								    		<table border="0" cellpadding="0" cellspacing="0" class="table table-bordered">									
												<tr>
													<th>Inmueble</th>
													<th>Temperatura</th>														
												</tr>		
												<input type="hidden" id="id_empleado" class="form-control"  name="id_empleado" value="#url.id_empleado#">
												<tr>
													<td  align="center" width="80%">Torre ejecutiva</td>
													<cfquery name="temperatura" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=2
													</cfquery>
													<td  align="center"><input type="text" id="temperatura2" class="form-control"  name="temperatura2" <cfif #temperatura.temperatura# gt '0'>value="#temperatura.temperatura#" readonly <cfelse><cfif #session.id# eq 2>required<cfelse>readonly</cfif></cfif> ></td>
												</tr>
												<tr>
													<td  align="center" width="80%">Edificio Insurgentes</td>
													<cfquery name="temperatura2" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=3
													</cfquery>
													<td  align="center"><input type="text" id="temperatura3" class="form-control"  name="temperatura3" <cfif #temperatura2.temperatura# gt '0'>value="#temperatura2.temperatura#" readonly <cfelse><cfif #session.id# eq 3>required<cfelse>readonly</cfif></cfif> ></td>														
												</tr>
												<tr>	
													<td  align="center" width="80%">Edificio Picacho</td>
													<cfquery name="temperatura3" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=4
													</cfquery>
													<td  align="center"><input type="text" id="temperatura4" class="form-control"  name="temperatura4" <cfif #temperatura3.temperatura# gt '0'>value="#temperatura3.temperatura#" readonly <cfelse><cfif #session.id# eq 4>required<cfelse>readonly</cfif></cfif> ></td>													
												</tr>
												<tr>
													<td  align="center" width="80%">Torre Tecamachalco</td>
													<cfquery name="temperatura4" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=5
													</cfquery>
													<td  align="center"><input type="text" id="temperatura5" class="form-control"  name="temperatura5" <cfif #temperatura4.temperatura# gt '0'>value="#temperatura4.temperatura#" readonly <cfelse><cfif #session.id# eq 5>required<cfelse>readonly</cfif></cfif> ></td>													
												</tr>
												<tr>	
													<td  align="center" width="80%">N&uacute;cleo Morelia y Frontera</td>
													<cfquery name="temperatura5" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=6
													</cfquery>													
													<td  align="center"><input type="text" id="temperatura6" class="form-control"  name="temperatura6" <cfif #temperatura5.temperatura# gt '0'>value="#temperatura5.temperatura#" readonly <cfelse><cfif #session.id# eq 6>required<cfelse>readonly</cfif></cfif> ></td>
												</tr>	
											</table>
										</div>
							  		</div>
							  		<div class="clearfix">
							  			
							        	<div class="pull-left text-muted text-vertical-align-button">* Campos obligatorios</div>
							        	<div class="pull-right">
							        		<div class="col-sm-2"><a href="principal.cfm?modo=1" class="btn btn-default pull-right">Cancelar</a></div>
							        			<button class="btn btn-primary pull-right" type="submit">Continuar</button>									   			
									      	</div>
							    		</div>
							    	</div>
					    		</form>
							</div>					    	
					    	<br>
    					<cfelse>
    						<div class="frorm-group">
			              		<form name="registro" action="registro_temperatura_action.cfm" method="post" enctype="multipart/form-data">    	
							    	<div class="row">
							    		<div class="col-sm-8">
								    		<table border="0" cellpadding="0" cellspacing="0" class="table table-bordered">									
												<tr>
													<th>Inmueble</th>
													<th>Temperatura</th>														
												</tr>		
												<input type="hidden" id="id_empleado" class="form-control"  name="id_empleado" value="#url.id_empleado#">
												<tr>
													<td  align="center" width="80%">Torre ejecutiva</td>
													<cfquery name="temperatura2" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=2
													</cfquery>
													<td  align="center"><input type="text" id="temperatura2" class="form-control"  name="temperatura2" <cfif #session.id# eq 2>required<cfelse>readonly</cfif> ></td>
												</tr>
												<tr>
													<td  align="center" width="80%">Edificio Insurgentes</td>
													<cfquery name="temperatura3" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=3
													</cfquery>
													<td  align="center"><input type="text" id="temperatura3" class="form-control"  name="temperatura3" <cfif #session.id# eq 3>required<cfelse>readonly</cfif> ></td>														
												</tr>
												<tr>	
													<td  align="center" width="80%">Edificio Picacho</td>
													<cfquery name="temperatura4" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=4
													</cfquery>
													<td  align="center"><input type="text" id="temperatura4" class="form-control"  name="temperatura4" <cfif #session.id# eq 4>required<cfelse>readonly</cfif> ></td>													
												</tr>
												<tr>
													<td  align="center" width="80%">Torre Tecamachalco</td>
													<cfquery name="temperatura5" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=5
													</cfquery>
													<td  align="center"><input type="text" id="temperatura5" class="form-control"  name="temperatura5" <cfif #session.id# eq 5>required<cfelse>readonly</cfif> ></td>													
												</tr>
												<tr>	
													<td  align="center" width="80%">N&uacute;cleo Morelia y Frontera</td>
													<cfquery name="temperatura6" datasource="fingresos">
														select id_empleado, temperatura, fecha   from temperatura_registro		
														where id_empleado = #url.id_empleado# 
														and fecha = #consulta#
														and torre=6
													</cfquery>													
													<td  align="center"><input type="text" id="temperatura6" class="form-control"  name="temperatura6" <cfif #session.id# eq 6>required<cfelse>readonly</cfif> ></td>
												</tr>	
											</table>
										</div>
							  		</div>
							  		<div class="clearfix">
							  			
							        	<div class="pull-left text-muted text-vertical-align-button">* Campos obligatorios</div>
							        	<div class="pull-right">
							        		<div class="col-sm-2"><a href="principal.cfm?modo=1" class="btn btn-default pull-right">Cancelar</a></div>
							        			<button class="btn btn-primary pull-right" type="submit">Continuar</button>									   			
									      	</div>
							    		</div>
							    	</div>
					    		</form>
							</div>					    	
					    	<br>
    					</cfif>
    				</cfif>
		    </div>
			<div class="col-md-12">
            	<hr />
          	</div>  
          	</cfoutput>       
        </main>
	    <!-- JS -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	    <script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	    <script src="js/validator.js"></script>
	    <script>
	    	$gmx(document).ready(function() {
				$('form').validator().off('focusout.bs.validator').off('input.bs.validator');
		    });
	    </script>	    
   </body>
</html>