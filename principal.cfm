<cfinclude template="VerificaSesion.cfm">
<!DOCTYPE html>
<html lang="es">
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Secretar&iacute;a de Econom&iacute;a - Etapa preparatoria de actividades esenciales</title>
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
    <cfoutput>
    	<main class="page">
      		<nav class="navbar navbar-inverse sub-navbar navbar-fixed-top">
        		<div class="container">
          			<div class="navbar-header">
            			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="subenlaces">
			              	<span class="sr-only">Interruptor de Navegación</span>
			              	<span class="icon-bar"></span>
			              	<span class="icon-bar"></span>
			              	<span class="icon-bar"></span>
            			</button>
			           <nav class="navbar navbar-inverse sub-navbar navbar-fixed-top">
              				<div class="container">
                				<div class="navbar-header">
                  					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="">
					                    <span class="sr-only">Interruptor de Navegación</span>
					                    <span class="icon-bar"></span>
					                    <span class="icon-bar"></span>
					                    <span class="icon-bar"></span>
                  					</button>
                  					
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
          			</div>          
        		</div>
      		</nav>
      		<div class="bottom-buffer"></div>
      		<div class="container">
        		<section>
        			<cfif #session.id# gt 1>
	               		<cfif Isdefined("URL.modo")>
	                		<cfset modo = URL.modo>
	              		<cfelse>
	                		<cfset modo = 1>
	              		</cfif> 
	              		<cfif modo IS 1>
	                		<cfinclude template="empleados.cfm"> 
	              		<cfelseif modo IS 2>
	              			<cfinclude template="registro_cuestionario.cfm">
	              		<cfelseif modo IS 3>
	                		<cfinclude template="mensaje.cfm">
	                	<cfelseif modo IS 4>
	                		<cfinclude template="registro_temperatura.cfm">              
	              		</cfif>
	              	<cfelse>
	              		<cfif Isdefined("URL.modo")>
	                		<cfset modo = URL.modo>
	              		<cfelse>
	                		<cfset modo = 1>
	              		</cfif> 
	              		<cfif modo IS 1>
	                		<cfinclude template="administrador.cfm"> 
	              		<cfelseif modo IS 2>
	              			<cfinclude template="temperatura_minima.cfm">
	              		<cfelseif modo IS 3>
	                		<cfinclude template="medicos.cfm">   
	              		</cfif>
	              	</cfif>
        		</section>        
      		</div>
      		<!-- JS -->
    		 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	    <script src="https://framework-gb.cdn.gob.mx/gobmx.js"></script>
	    <script src="js/validator.js"></script>
	    <script>
	    	$gmx(document).ready(function() {
				$('form').validator().off('focusout.bs.validator').off('input.bs.validator');
		    });
	    </script>	
    	</main>
    </cfoutput>
  	</body>
</html>