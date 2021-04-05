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
    	<main class="page">
      		<nav class="navbar navbar-inverse sub-navbar navbar-fixed-top">
        		<div class="container">
          			<div class="navbar-header">
			            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#subenlaces">
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
			        		<li><a class="navbar-brand" href="/"><cfoutput>#usuarios.edificio#</cfoutput></a></li>
			           		<li><a href="index.cfm">Salir</a></li>              
			        	</ul>
			        </div>
        		</div>
      		</nav>
      		<div class="bottom-buffer"></div>
      		<div class="container">
        		<div class="row">
          			<div class="col-sm-12">
            		<h2>B&uacute;squeda de empleado</h2>
            		<hr class="red">
              		<div class="bottom-buffer"></div>
          		</div>
        	</div>
        	<section>
          		<div class="row">
            		<div class="col-md-12">
                		<form class="form-horizontal" name="loginform" action="empleados_action.cfm" method="POST">
                			<cfif IsDefined('URL.valida')>
	                      		<cfif URL.valida EQ 0>
                         			<cfset StructClear(Session)>                       
                      			</cfif>
	                      		<cfif URL.valida EQ 1>
	                        		<cfset StructClear(Session)>
				                    <cfset etiqueta="form-text-error">
				                    <cfset control="form-control-error">  
	                      		<cfelseif URL.valida EQ 2>
	                        		<div class="row">
	                            		<div class="col-sm-8">
	                            			<div class="form-group">
	                               				<div class="col-sm-10 alert alert-danger">
	                               					<p>El usuario no se encuentra en la relacion de empleados.</p>                                
	                               				</div>	                               				
	                            			</div>
	                            		</div>
	                            		<div class="col-sm-3">
			                            	<div class="form-group">
			                            		<a href="principal.cfm?modo=2"><button class="btn btn-default btn-lg active" type="button">Registrar a la persona</button></a>
			                            	</div>
			                            </div>
	                          		</div>	                          		
	                          	</cfif>                          
                      		</cfif>
                  			<div class="form-horizontal">                      			                  
                      			<div class="form-group">
                        			<label class="col-sm-4 control-label" for="password">N&uacute;mero de empleado, RFC o correo <span class="form-text">*</span> :</label>
                        			<div class="col-sm-4">
                          				<input type="text" id="num_emp" name="num_emp" class="form-control" required/>
                          			<div class="help-block with-errors"></div>
                        		</div>
                      		 	<div class="col-sm-4">
		                      		<div class="col-sm-12">
		                        		<button class="btn btn-primary pull-right" type="submit">Consultar</button>
		                      		</div>
		                    	</div>
		                  	</div>                  
						</form>
              		</div>
          		</div>
		                 
		    </section>        
      	</main>
	    <!-- JS -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	    <script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	    <script src="https://framework-gb.cdn.gob.mx/assets/scripts/jquery-ui-datepicker.js"></script>
	    <script src="js/validator.js"></script>
	    <script>
	      	$gmx(document).ready(function() {
				$('form').validator().off('focusout.bs.validator').off('input.bs.validator');
            });     	
	    </script>
  	</body>
</html>