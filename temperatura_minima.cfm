<!DOCTYPE html>
<html lang="es">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Secretar&iacute;a de Econom&iacute;a</title>
	    <!-- CSS -->
	    <link href="/favicon.ico" rel="shortcut icon">
	    <link href="https://framework-gb.cdn.gob.mx/assets/styles/main.css" rel="stylesheet">
	
	    <!-- Respond.js soporte de media queries para Internet Explorer 8 -->
	    <!-- ie8.js EventTarget para cada nodo en Internet Explorer 8 -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	      <script src="https://cdnjs.cloudflare.com/ajax/libs/ie8/0.2.2/ie8.js"></script>
	    <![endif]-->
  	</head>
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
            				<li><a href="temperatura_minima.cfm">Temperatura</a></li>
            				<li><a href="medicos.cfm">M&eacute;dicos</a></li>
            				<li><a href="reporte.cfm" target="_blank">Reporte cuestionario</a></li>
            				<li><a href="reporte_temperatura.cfm" target="_blank">Reporte temperaturas</a></li>              				
                    		<li><a href="index.cfm">Salir</a></li>              
            			</ul>
          			</div>
        		</div>
      		</nav>
      		<div class="bottom-buffer"></div>
      		<div class="container">
        		<div class="row">
          			<div class="col-sm-8">
            		<h1>Filtros de ingreso a las instalaciones</h1>
          		</div>          		
        	</div>
        	<section>          		
          		<div class="row">
            		<div class="col-md-12">
                		<form class="form-horizontal" name="loginform" action="temperatura_minima_action.cfm" method="POST">
                  			<div class="col-md-6">
                  				<div class="row">
					            		<div class="col-sm-12">
					              			<h5>Temperatura m&iacute;nima para dar acceso a las instalaciones</h5>
					              			<hr class="red">
					              			<div class="bottom-buffer"></div>
					            		</div>
					          		</div>
                  				<table border="0" cellpadding="0" cellspacing="0" class="table table-bordered">		
                  					<cfquery name="temperatura" datasource="fingresos">
                  						select * from temperatura
                  					</cfquery>							
                  					<cfif temperatura.recordCount gt 0>
										<tr>
											<th>No. registro</th>
											<th>Temperatura</th>
											<th>Estatus</th>			
										</tr>
										<cfloop query="temperatura">		
											<tr>
												<td  align="center" width="20%">#id_temperatura#</td>
												<td  align="center">#temperatura#</td>
												<td  align="center"><cfif #estatus# eq 1>Si<cfelse>No</cfif></td>
											</tr>
										</cfloop>
									<cfelse>
										<label class="col-sm-4 control-label">No se tienen registros.</label>
									</cfif>
								</table>                  			
                  			</div>
                    		<div class="col-md-6">	
	                    		<div class="form-horizontal"> 
	                    			<div class="row">
					            		<div class="col-sm-12">
					              			<h5>Captura de la temperatura m&iacute;nima para dar acceso a las instalaciones</h5>
					              			<hr class="red">
					              			<div class="bottom-buffer"></div>
					            		</div>
					          		</div>                     			     
	                      			<div class="form-group">
	                        			<label class="col-sm-4 control-label" for="password">Temperatura:<span class="form-text">*</span></label>
	                        			<div class="col-sm-8">
	                          				<input type="text" name="temperatura" id="temperatura" class="form-control" maxlength="5" data-error="Debe capturar la temperatura" required/>
	                          				<div class="help-block with-errors"></div>
	                          			</div
	                        			<div class="col-sm-4">
				                      		<div class="col-sm-6">
				                        		<button class="btn btn-primary pull-right" type="submit">Guardar</button>
				                      		</div>
				                      	</div>
			                    	</div>
			                  	</div>
                       		</div>                
						</form>
              		</div>
          		</div>
          		<div class="col-md-12">
	        		<hr />
	        	</div>          
        	</section>        
        </main>
    	</cfoutput>
    	<!-- JS -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	    <script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	    <script src="js/validator.js"></script>
	    <script>
      		$gmx(document).ready(function() {
				$('form').validator().off('focusout.bs.validator').off('input.bs.validator');
		    });
    	</script>
    	<script>
    		function upperCaseF(a){
    			setTimeout(function(){
        			a.value = a.value.toUpperCase();
    			}, 1);
			}
		</script>
	</body>
</html>