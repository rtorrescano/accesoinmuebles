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
            				<li><a href="temperatura_minima.cfm">Temperatura</a></li>
            				<li><a href="medicos.cfm">M&eacute;dicos</a></li>
            				<li><a href="reporte.cfm" target="_blank">Reporte cuestionario</a></li>
            				<li><a href="reporte_temperatura.cfm" target="_blank">Reporte temperaturas</a></li>              				
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
    				<div class="frorm-group">
			        	<div class="col-sm-12">
							<div class="row">
						       	<div class="col-sm-4">
						        	<label for="secondName"><a href="reporte.cfm" target="_blank">Descargar reporte</a></label>						            
					      		</div>
					       	</div>
					    </div>
					</div>			    			    		
		    	</div>
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