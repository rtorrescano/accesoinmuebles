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
    						<div class="frorm-group">
			              		<form name="registro" action="registro_cuestionario_action.cfm" method="post" enctype="multipart/form-data">
						    		<div class="col-sm-12">
						    			<cfset consulta = LSDateFormat(now(), "dd/mm/yyyy")>
						    				<cfquery name="consulta_registro" datasource="fingresos">
												select id_empleado, fecha from registros		
												where id_empleado = #url.id_empleado# 
												and fecha = #consulta#
											</cfquery>										
											<div class="row">
										       	<div class="col-sm-4">
										       		<div class="form-group">
											        	<label for="secondName">Fecha de aplicaci&oacute;n:</label>
											            <input type="text" id="fecha" class="form-control"  name="fecha" value="#consulta#" readonly>
											            <div class="help-block with-errors"></div>                      
										       		</div>
										       	</div>
										    </div>
										    <cfquery name="empleado" datasource="fingresos">
												Select id_empleado, num_empleado, rfc, curp, ap_paterno, ap_materno, nombre, edad, sexo,area_adscripcion, extension from empleados
												where id_empleado = #url.id_empleado#	
											</cfquery>
										    <div class="row">
								            	<div class="col-sm-4">
								            		<div class="form-group">
											        	<label for="secondName">Nombre:</label>
											            <input type="text" id="nombre" class="form-control"  name="nombre" <cfif #empleado.nombre# neq 'NULL'>value="#empleado.nombre#" <cfelse></cfif> required>
											            <input type="hidden" id="id_empleado" class="form-control"  name="id_empleado" value="#url.id_empleado#">
											            <div class="help-block with-errors"></div>                      
								            		</div>
								            	</div>
								            	<div class="col-sm-4">
								            		<div class="form-group">
											        	<label for="secondName">Primer apellido:</label>
											            <input type="text" id="paterno" class="form-control"  name="paterno" <cfif #empleado.ap_paterno# neq 'NULL'>value="#empleado.ap_paterno#" </cfif> required>
											            <div class="help-block with-errors"></div>                      
								            		</div>
								            	</div>
								            	<div class="col-sm-4">
								            		<div class="form-group">
											        	<label for="secondName">Segundo apellido:</label>
											            <input type="text" id="materno" class="form-control"  name="materno" <cfif #empleado.ap_materno# neq 'NULL'> value="#empleado.ap_materno#" </cfif> required>
											            <div class="help-block with-errors"></div>                      
								            		</div>
								            	</div>
								            </div>
								            <div class="row">
								            	<div class="col-sm-4">
								            		<div class="form-group">
											            <label for="secondName">N&uacute;mero de empleado:</label>											            
											           	<input type="text" id="num_emp" class="form-control"  name="num_emp" <cfif #empleado.num_empleado# neq 'NULL'>value="#empleado.num_empleado#" </cfif> maxlength="10" required>										           	
											            <div class="help-block with-errors"></div>                      
								            		</div>
								            	</div>
								            	<div class="col-sm-4">
								            		<div class="form-group">
											            <label for="secondName">RFC:</label>
											            <input type="text" id="rfc" class="form-control"  name="rfc" <cfif #empleado.rfc# neq 'NULL'> value="#empleado.rfc#" </cfif> maxlength="13" required>
											            <div class="help-block with-errors"></div>                      
								            		</div>
								            	</div>
								            	<div class="col-sm-4">
								            		<div class="form-group">
											            <label for="secondName">CURP:</label>
											            <input type="text" id="curp" class="form-control"  name="curp" <cfif #empleado.curp# neq 'NULL'>value="#empleado.curp#" </cfif> maxlength="18" required>
											            <div class="help-block with-errors"></div>                      
								            		</div>
								            	</div>
								            </div>
								            <div class="row">
								            	<div class="col-sm-8">
								            		<div class="form-group">
											            <label for="secondName">&Aacute;rea de adscripci&oacute;n:</label>
											            <cfquery name="unidad" datasource="fingresos">
											            	select * from cat_unidades
											            	where num_unidad='#empleado.area_adscripcion#'
											            </cfquery>
											            <cfif #empleado.area_adscripcion# eq 'Null'>
											            	<cfquery name="unidad" datasource="fingresos">
														       	select * from cat_unidades
														    </cfquery>
														    <select name="area_emp" class="form-control">
														    	<cfloop query="unidad">
														    		<option value="num_unidad">#num_unidad# #unidad#</option>
														    	</cfloop>							
														    </select>			           	
												            <div class="help-block with-errors"></div> 
											            <cfelse>
												           	<input type="text" id="area_emp1" class="form-control"  name="area_emp1"  <cfif #empleado.area_adscripcion# neq 'Null'>value="#unidad.num_unidad# #unidad.unidad#" </cfif> required>
												           	<input type="hidden" id="area_emp" class="form-control"  name="area_emp"  <cfif #empleado.area_adscripcion# neq 'Null'>value="#unidad.num_unidad#" </cfif> required>										           	
												            <div class="help-block with-errors"></div>
												        </cfif>                      
								            		</div>
								            	</div>
								            	<div class="col-sm-2">
								            		<div class="form-group">
											            <label for="secondName">Edad:</label>
											            <input type="text" id="edad" class="form-control"  name="edad"  <cfif #empleado.edad# gt '0'> value="#empleado.edad#" </cfif> maxlength="2" required>
											            <div class="help-block with-errors"></div>                      
								            		</div>
								            	</div>
								            	<div class="col-sm-2">
								            		<div class="form-group">
											            <label for="secondName">Ext.:</label>
											            <input type="text" id="ext" class="form-control"  name="ext" <cfif #empleado.extension# gt 0> value="#empleado.extension#" </cfif> maxlength="5" required>
											            <div class="help-block with-errors"></div>                      
								            		</div>
								            	</div>
								            </div>
										    <div class="row">
						        				<div class="col-dm-12">
						          					<h3>S&iacute;ntomas</h3>
						          					<hr class="red">
						            				<div class="bottom-buffer"></div>
						          				</div>
						          			</div>
						          			<div class="row">
						            			<div class="col-sm-12">
						              				<div class="form-group">
											            <label for="secondName11">En los utimos 7 d&iacute;as, ha tenido alguno de los siguientes s&iacute;ntomas <span class="form-text">*</span>:</label>						                 
						              				</div>
						            			</div>
						            			<div class="col-sm-12">
						            				<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Fiebre <span class="form-text">*</span>:</label>
							                				<br>
											                <input type="radio" name="radior1" value="SI" id="radior1" required> Si
											                <input type="radio" name="radior1" value="NO" id="radior1" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>  
							            			<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Tos, estornudos <span class="form-text">*</span>:</label>
							                				<br>
											                <input type="radio" name="radior2" value="SI" id="radior2" required> Si
											                <input type="radio" name="radior2" value="NO" id="radior2" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>      
							            			<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Malestar general <span class="form-text">*</span>:</label>
							                				<br>
											                <input type="radio" name="radior3" value="SI" id="radior3" required> Si
											                <input type="radio" name="radior3" value="NO" id="radior3" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>      
						            			</div>
						            			<div class="col-sm-12">
						            				<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Dolor de cabeza <span class="form-text">*</span>:</label>
							                				<br>
											                <input type="radio" name="radior4" value="SI" id="radior4" required> Si
											                <input type="radio" name="radior4" value="NO" id="radior4" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>      
							            			<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Dificultad para respirar<span class="form-text">*</span>:</label>
							                				<br>
											                <input type="radio" name="radior5" value="SI" id="radior5" required> Si
											                <input type="radio" name="radior5" value="NO" id="radior5" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>      
							            			<!---div class="col-sm-4">
							              				<div class="form-group">
											                <label for="secondName">Temperatura del empleado:</label>
											                <input type="text" id="temperatura" class="form-control"  name="temperatura" required>
											                <div class="help-block with-errors"></div>                      
							              				</div>
							            			</div--->
							            		</div>
							            	</div>
							        		<div class="col-sm-12">
						    				<div class="row">
									           	<div class="col-dm-12">
						          					<h3>Enfermedades</h3>
						          					<hr class="red">
						          				</div>
									        </div>
									        <div class="row">
							            		<div class="col-sm-12">
						              				<div class="form-group">
											            <label for="secondName11">Padece alguna enfermedad:</label>						                 
						              				</div>
						            			</div>
							            		<div class="col-sm-12">	
							            			<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Hipertensi&oacute;n arterial <span class="form-text">*</span> :</label>
							                				<br>
											                <input type="radio" name="radior6" value="SI" id="radior6" required> Si
											                <input type="radio" name="radior6" value="NO" id="radior6" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>  
							            			<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Diabetes mellitus <span class="form-text">*</span> :</label>
							                				<br>
											                <input type="radio" name="radior7" value="SI" id="radior7" required> Si
											                <input type="radio" name="radior7" value="NO" id="radior7" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>  
							            			<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Insuficiencia renal o hep&aacute;tica <span class="form-text">*</span> :</label>
							                				<br>
											                <input type="radio" name="radior8" value="SI" id="radior8" required> Si
											                <input type="radio" name="radior8" value="NO" id="radior8" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>   
							            			
							            		</div>
							              	</div>
							              	<div class="row">
							            		<div class="col-sm-12">	
								            		<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Inmunosupresi&oacute;n (adquirida o provocada) <span class="form-text">*</span> :</label>
							                				<br>
											                <input type="radio" name="radior9" value="SI" id="radior9" required> Si
											                <input type="radio" name="radior9" value="NO" id="radior9" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>      
							            			<div class="col-sm-4">
							              				<div class="form-group">
							                				<label for="secondName5"> Enfermedad card&iacute;aca o pulmonar cr&oacute;nicas <span class="form-text">*</span> :</label>
							                				<br>
											                <input type="radio" name="radior10" value="SI" id="radior10" required> Si
											                <input type="radio" name="radior10" value="NO" id="radior10" required> No
											                <div class="help-block with-errors"></div>
							              				</div>
							            			</div>
							            		</div>
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
					<cfelse>
    					<div class="form-group">
		              		<form name="registro" action="registro_cuestionario_action.cfm" method="post" enctype="multipart/form-data">
					    		<div class="col-sm-12">
					    			<cfset consulta = LSDateFormat(now(), "dd/mm/yyyy")>
					    			<div class="row">
								       	<div class="col-sm-4">
								       		<div class="form-group">
									        	<label for="secondName">Fecha de aplicaci&oacute;n: </label>
									        	<input type="text" id="fecha" class="form-control"  name="fecha" value="#consulta#" readonly>
									            <div class="help-block with-errors"></div>                      
								       		</div>
								       	</div>
								    </div>
								    <div class="row">
						            	<div class="col-sm-4">
						            		<div class="form-group">
									        	<label for="secondName">Nombre <span class="form-text">*</span> :</label>
									            <input type="text" id="nombre" class="form-control" name="nombre" required>
									            <input type="hidden" id="id_empleado" class="form-control"  name="id_empleado" value="0">
									            <div class="help-block with-errors"></div>                      
						            		</div>
						            	</div>
						            	<div class="col-sm-4">
						            		<div class="form-group">
									        	<label for="secondName">Primer apellido <span class="form-text">*</span> :</label>
									            <input type="text" id="paterno" class="form-control" name="paterno" required>
									            <div class="help-block with-errors"></div>                      
						            		</div>
						            	</div>
						            	<div class="col-sm-4">
						            		<div class="form-group">
									        	<label for="secondName">Segundo apellido <span class="form-text">*</span> :</label>
									            <input type="text" id="materno" class="form-control" name="materno" required>
									            <div class="help-block with-errors"></div>                      
						            		</div>
						            	</div>
						            </div>
						            <div class="row">
						            	<div class="col-sm-4">
						            		<div class="form-group">
									            <label for="secondName">N&uacute;mero de empleado <span class="form-text">*</span> :</label>
									           	<input type="text" id="num_emp" class="form-control" name="num_emp" required>										           	
									            <div class="help-block with-errors"></div>                      
						            		</div>
						            	</div>
						            	<div class="col-sm-4">
						            		<div class="form-group">
									            <label for="secondName">RFC <span class="form-text">*</span> :</label>
									            <input type="text" id="rfc" class="form-control" name="rfc" maxlength="13" required>
									            <div class="help-block with-errors"></div>                      
						            		</div>
						            	</div>
						            	<div class="col-sm-4">
						            		<div class="form-group">
									            <label for="secondName">CURP <span class="form-text">*</span> :</label>
									            <input type="text" id="curp" class="form-control" name="curp" maxlength="18" required>
									            <div class="help-block with-errors"></div>                      
						            		</div>
						            	</div>
						            </div>
						            <div class="row">
						            	<div class="col-sm-8">
						            		<div class="form-group">
									            <label for="secondName">&Aacute;rea de adscripci&oacute;n <span class="form-text">*</span> :</label>
									            <cfquery name="unidad" datasource="fingresos">
											       	select * from cat_unidades
											    </cfquery>
											    <select name="area_emp" class="form-control">
											    	<cfloop query="unidad">
											    		<option value="#num_unidad#">#num_unidad# #unidad#</option>
											    	</cfloop>							
											    </select>			           	
									            <div class="help-block with-errors"></div>                      
						            		</div>
						            	</div>
						            	<div class="col-sm-2">
						            		<div class="form-group">
									            <label for="secondName">Edad <span class="form-text">*</span> :</label>
									            <input type="text" id="edad" class="form-control" name="edad" maxlength="2" required>
									            <div class="help-block with-errors"></div>                      
						            		</div>
						            	</div>
						            	<div class="col-sm-2">
						            		<div class="form-group">
									            <label for="secondName">Ext <span class="form-text">*</span> :</label>
									            <input type="text" id="ext" class="form-control" name="ext" maxlength="5" required>
									            <div class="help-block with-errors"></div>                      
						            		</div>
						            	</div>
						            </div>
									<div class="row">
				        				<div class="col-dm-12">
				          					<h3>S&iacute;ntomas</h3>
				          					<hr class="red">
				          				</div>
				          			</div>
				          			<div class="row">
				            			<div class="col-sm-12">
				              				<div class="form-group">
									            <label for="secondName11">En los utimos 7 d&iacute;as, ha tenido alguno de los siguientes s&iacute;ntomas <span class="form-text">*</span>:</label>						                 
				              				</div>
				            			</div>
				            			<div class="col-sm-12">
				            				<div class="col-sm-4">
					              				<div class="form-group">
					                				<label for="secondName5"> Fiebre <span class="form-text">*</span> :</label>
					                				<br>
									                <input type="radio" name="radior1" value="SI" id="radior1" required> Si
									                <input type="radio" name="radior1" value="NO" id="radior1" required> No
									                <div class="help-block with-errors"></div>
					              				</div>
					            			</div>  
					            			<div class="col-sm-4">
					              				<div class="form-group">
					                				<label for="secondName5"> Tos, estornudos <span class="form-text">*</span> :</label>
					                				<br>
									                <input type="radio" name="radior2" value="SI" id="radior2" required> Si
									                <input type="radio" name="radior2" value="NO" id="radior2" required> No
									                <div class="help-block with-errors"></div>
					              				</div>
					            			</div>      
					            			<div class="col-sm-4">
					              				<div class="form-group">
					                				<label for="secondName5"> Malestar general <span class="form-text">*</span> :</label>
					                				<br>
									                <input type="radio" name="radior3" value="SI" id="radior3" required> Si
									                <input type="radio" name="radior3" value="NO" id="radior3" required> No
									                <div class="help-block with-errors"></div>
					              				</div>
					            			</div>      
				            			</div>
				            			<div class="col-sm-12">
				            				<div class="col-sm-4">
					              				<div class="form-group">
					                				<label for="secondName5"> Dolor de cabeza <span class="form-text">*</span> :</label>
					                				<br>
									                <input type="radio" name="radior4" value="SI" id="radior4" required> Si
									                <input type="radio" name="radior4" value="NO" id="radior4" required> No
									                <div class="help-block with-errors"></div>
					              				</div>
					            			</div>      
					            			<div class="col-sm-4">
					              				<div class="form-group">
					                				<label for="secondName5"> Dificultad para respirar <span class="form-text">*</span> :</label>
					                				<br>
									                <input type="radio" name="radior5" value="SI" id="radior5" required> Si
									                <input type="radio" name="radior5" value="NO" id="radior5" required> No
									                <div class="help-block with-errors"></div>
					              				</div>
					            			</div>      
					            			<!---div class="col-sm-4">
					              				<div class="form-group">
									                <label for="secondName">Temperatura del empleado <span class="form-text">*</span> :</label>
									                <input type="text" id="temperatura" class="form-control"  name="temperatura" required maxlength="4">
									                <div class="help-block with-errors"></div>                      
					              				</div>
					            			</div--->
					            		</div>
					            	</div>
					    			<div class="col-sm-12">
					    				<div class="row">
								           	<div class="col-dm-12">
					          					<h3>Enfermedades</h3>
					          					<hr class="red">
					          				</div>
								        </div>
								        <div class="row">
						            		<div class="col-sm-12">
					              				<div class="form-group">
										            <label for="secondName11">Padece alguna enfermedad:</label>						                 
					              				</div>
					            			</div>
						            		<div class="col-sm-12">	
						            			<div class="col-sm-4">
						              				<div class="form-group">
						                				<label for="secondName5"> Hipertensi&oacute;n arterial <span class="form-text">*</span> :</label>
						                				<br>
										                <input type="radio" name="radior6" value="SI" id="radior6" required> Si
										                <input type="radio" name="radior6" value="NO" id="radior6" required> No
										                <div class="help-block with-errors"></div>
						              				</div>
						            			</div>  
						            			<div class="col-sm-4">
						              				<div class="form-group">
						                				<label for="secondName5"> Diabetes mellitus <span class="form-text">*</span> :</label>
						                				<br>
										                <input type="radio" name="radior7" value="SI" id="radior7" required> Si
										                <input type="radio" name="radior7" value="NO" id="radior7" required> No
										                <div class="help-block with-errors"></div>
						              				</div>
						            			</div>  
						            			<div class="col-sm-4">
						              				<div class="form-group">
						                				<label for="secondName5"> Insuficiencia renal o hep&aacute;tica <span class="form-text">*</span> :</label>
						                				<br>
										                <input type="radio" name="radior8" value="SI" id="radior8" required> Si
										                <input type="radio" name="radior8" value="NO" id="radior8" required> No
										                <div class="help-block with-errors"></div>
						              				</div>
						            			</div>   
						            			
						            		</div>
						              	</div>
						              	<div class="row">
						            		<div class="col-sm-12">	
							            		<div class="col-sm-4">
						              				<div class="form-group">
						                				<label for="secondName5"> Inmunosupresi&oacute;n (adquirida o provocada) <span class="form-text">*</span> :</label>
						                				<br>
										                <input type="radio" name="radior9" value="SI" id="radior9" required> Si
										                <input type="radio" name="radior9" value="NO" id="radior9" required> No
										                <div class="help-block with-errors"></div>
						              				</div>
						            			</div>      
						            			<div class="col-sm-4">
						              				<div class="form-group">
						                				<label for="secondName5"> Enfermedad card&iacute;aca o pulmonar cr&oacute;nicas <span class="form-text">*</span> :</label>
						                				<br>
										                <input type="radio" name="radior10" value="SI" id="radior10" required> Si
										                <input type="radio" name="radior10" value="NO" id="radior10" required> No
										                <div class="help-block with-errors"></div>
						              				</div>
						            			</div>
						            		</div>
						              	</div>					              		
						            </div>
						            <div class="clearfix">
							        	<div class="pull-left text-muted text-vertical-align-button">* Campos obligatorios</div>
							        	<div class="pull-right">
							        		<div class="col-sm-2"><a href="principal.cfm?modo=1" class="btn btn-default pull-right">Cancelar</a></div>
							        		<button class="btn btn-primary pull-right" type="submit">Continuar</button>
									   	</div>
							    	</div>
							    	<br>
						       </form>
						    </div>
			    		</div>
			    	</cfif>		    		
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