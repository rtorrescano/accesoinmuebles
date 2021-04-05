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
            		<div class="col-sm-8">
              			<h4>Iniciar Sesi&oacute;n</h4>
              			<hr class="red">
              			<div class="bottom-buffer"></div>
            		</div>
          		</div>
          		<div class="row">
            		<div class="col-md-12">
                		<form class="form-horizontal" name="loginform" action="entrar.cfm" method="POST">
                  			<div class="col-md-8">
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
                            			<div class="col-sm-12">
                              				<div class="form-group">
                                				<div class="col-sm-12 alert alert-danger">
                                  					<p><b>&##33;Error de acceso&##161;</b> El usuario no se encuentra registrado.</p>                                
                                				</div>
                              				</div>
                            			</div>
                          			</div>                                        
                      			<cfelseif URL.valida EQ -1>
                          			<div class="row">
                            			<div class="col-sm-12">
                              				<div class="form-group">
	                                			<div class="col-sm-12 alert alert-danger">
	                                  				<p><b>&##33;Error de acceso&##161;</b> Por favor verifique la contrase&ntilde;a</p>                                
	                                			</div>
	                              			</div>
	                            		</div>
                          			</div>                                       
                      			</cfif>
                    		</cfif>       
                    		<div class="form-horizontal">
                      			<div class="form-group">
                        			<label class="col-sm-4 control-label" for="email">Seleccione una opci&oacute;n:<span class="form-text">*</span></label>
                        			<div class="col-sm-8">
                        				<cfquery name="edificio" datasource="fingresos">
                        					select * from usuarios
                        				</cfquery>
                        				<cfoutput>
                        				<cfloop query="edificio">
                        					<input type="radio" name="usuario" value="#usuario_id#" id="usuario" required> #edificio#<br>
                        				</cfloop>
                        					                      				
							            <div class="help-block with-errors"></div>
							            </cfoutput>						            
		              				</div>
                      			</div>                       
                      			<div class="form-group">
                        			<label class="col-sm-4 control-label" for="password">Contrase&ntilde;a:<span class="form-text">*</span></label>
                        			<div class="col-sm-8">
                          				<input type="password" id="password" name="password" id="password" class="form-control" autocomplete="off" data-minlength="8" data-error="Debe capturar m&iacute;nimo 8 posiciones" required/>
                          				<div class="help-block with-errors"></div>
                          			</div
                        		</div>
                      		</div>
                       	</div>                
                  	</div>
                  	<div class="row">
                    	<div class="col-sm-8">
                      		<div class="col-sm-12">
                        		<button class="btn btn-primary pull-right" type="submit">Ingresar</button>
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
      </div>
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
    <script>
    function upperCaseF(a){
    setTimeout(function(){
        a.value = a.value.toUpperCase();
    }, 1);
}
</script>
  </body>
</html>