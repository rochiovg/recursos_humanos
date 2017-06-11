<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
id_proyecto=session("id_proyecto") 
lsUsuario=Session("id_usuario")
id_rol=Session("txtTipoUsuarioValido")

dni = Request.Form("dni")

' ---- Dejamos el DNI solo con caracteres num?ricos: -----------
d=""
for i=1 to len(dni)
    if mid(dni,i,1)>="0" and mid(dni,i,1)<="9"  then
	   d=d&mid(dni,i,1)
	end if   
next 
dni=d

consulta1 = "EXEC dbo.pa_ficha_datosCV '" & dni & "', '" & id_proyecto & "'" 
Set RsP	= Server.CreateObject("ADODB.Recordset") 
RsP.cursorlocation=3
RsP.Open consulta1, MiCone, 3,3
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
<!--
.Estilo3 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; }
.Estilo4 {font-family: Verdana, Arial, Helvetica, sans-serif}
.Estilo5 {font-size: 12px}
.Estilo7 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
-->
</style>
</head>

<body>
<table width="1500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  	<div class="container"> <!-- para que contenga todos los panels -->
    <td colspan="3" valign="middle">
	  <div class="panel-group">
    	<div class="panel panel-danger">
      		<div class="panel-heading">
      		  	<div align="center">
					<input type="hidden" name="txtDNI" id="txtDNI" value="<%=dni%>"/>
			  		<strong><img src="images/ADVERTENCIA.png" width="30" height="30"> <span class="Estilo3">IMPORTANTE</span>					</strong>				</div>
      		</div>
      		<div class="panel-body">
      		  <div align="center" class="Estilo3">Si no puede visualizar el contenido del archivo PDF, proceda a descargarlo y abrir el archivo</div>
			  <!-- necesario para el iframe-->
			  <input type="hidden" name="num_vista" id="num_vista" value="1" /> 
      		</div>
    	</div>
	</div>
	
<!--	<div class="alert alert-danger"><strong> IMPORTANTE:</strong>Si no puede visualizar el contenido del archivo PDF, proceda a descargarlo y abrir el archivo</div>	</td> -->
    <td width="11">&nbsp;</td>
    <td width="276" valign="middle">
	<div class="panel-group Estilo4 Estilo5">
    	<div class="panel panel-success">
      		<div class="panel-heading">
      		  <div align="center"><img src="images/DNI.png" width="30" height="30" style="CURSOR: hand" onClick="javascript:ver_cv('2')"><strong> DNI</strong></div>
      		</div>
      		<div class="panel-body">
				<div align="center">
					&nbsp;
				  	<%
						consulta4 = "EXEC dbo.pa_archivos_inscripcion_listar_cantidad '" & dni & "', '" & id_proyecto & "', '2' " 
						Set RsP4	= Server.CreateObject("ADODB.Recordset") 
						RsP4.cursorlocation=3
						RsP4.Open consulta4, MiCone, 3,3
						If  Not RsP4.BOF And Not RsP4.EOF Then 
							c4=1
							Do While Not RsP4.EOF
							Response.Write("<a href=""#"" onClick=""ver_cv('"&RsP4.Fields("num")&"');"">"&c4&"</a>&nbsp;&nbsp;")
							c4 = c4 + 1
							RsP4.MoveNext
							Loop	
							set RsP4=nothing
						end if  
					%>
				</div>
      		</div>
    	</div>
	</div>	</td>
    <td width="276" valign="middle">
	<div class="panel-group Estilo4 Estilo5">
    	<div class="panel panel-info">
      		<div class="panel-heading">
      		  <div align="center"><img src="images/CONSTANCIAS.png" width="30" height="30" style="CURSOR: hand" onClick="javascript:ver_cv('1')"><strong> CONSTANCIAS</strong></div>
      		</div>
			<div class="panel-body">
			  	<div align="center">
					&nbsp;				
					<%
						consulta3 = "EXEC dbo.pa_archivos_inscripcion_listar_cantidad '" & dni & "', '" & id_proyecto & "', '1' " 
						Set RsP3	= Server.CreateObject("ADODB.Recordset") 
						RsP3.cursorlocation=3
						RsP3.Open consulta3, MiCone, 3,3
						  If  Not RsP3.BOF And Not RsP3.EOF Then 
							c1=1
							Do While Not RsP3.EOF
							Response.Write("<a href=""#"" onClick=""ver_cv('"&RsP3.Fields("num")&"');"">"&c1&"</a>&nbsp;&nbsp;")
							c1 = c1 + 1
							RsP3.MoveNext
							Loop	
							set RsP3=nothing
						end if
					%>
		        </div>
      		</div>
    	</div>
	</div>	</td>
    <td width="280" valign="middle">
	<div class="panel-group Estilo4 Estilo5">
    	<div class="panel panel-warning">
      		<div class="panel-heading">
      		  <div align="center"><img src="images/GRADOS.png" width="30" height="30" style="CURSOR: hand" onClick="javascript:ver_cv('3')"><strong> GRADOS OBTENIDOS</strong></div>
      		</div>
      		<div class="panel-body">
				<div align="center">
					&nbsp;				
			    	<%
						consulta5 = "EXEC dbo.pa_archivos_inscripcion_listar_cantidad '" & dni & "', '" & id_proyecto & "', '3' " 
						Set RsP5	= Server.CreateObject("ADODB.Recordset") 
						RsP5.cursorlocation=3
						RsP5.Open consulta5, MiCone, 3,3
						If  Not RsP5.BOF And Not RsP5.EOF Then    		
							c5=1
							Do While Not RsP5.EOF
							Response.Write("<a href=""#"" onClick=""ver_cv('"&RsP5.Fields("num")&"');"">"&c5&"</a>&nbsp;&nbsp;")
							c5 = c5 + 1
							RsP5.MoveNext
							Loop	
							set RsP5=nothing
						end if
					%>
		        </div>
      		</div>
    	</div>
	</div>	</td>
	</div> <!--fin del Panels -->
  </tr>
  <!-- Inicia el recorrido del usuario -->
  	<%
		If  Not RsP.BOF And Not RsP.EOF Then 
  	  	registro = 0					
    	Do While Not RsP.EOF
    	response.Flush()
    	If registro Mod 2 = 0 Then
    		clase = "e_tr_even"
    	Else
    		clase = "e_tr_odd"
    	End If	
  		cont = registro+1
  	%>
  <tr>
    <td width="293" valign="top"><span class="Estilo3">DNI</span></td>
    <td width="17">&nbsp;</td>
    <td width="347"><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"   value="<%=RsP.Fields("dni")%>" readonly >
      </span> <span class="Estilo7"><br>
    </span></td>
    <td>&nbsp;</td>
    <td colspan="3" rowspan="22" valign="top">
	<div id="foto" style="width:800; height:120; ">
	<!-- controla la parte extrior del cuadro de archivos -->
	<iframe id="foto1" src="<%=archivo1%>" width="800px" height="500px" style="border:none;"> </iframe>
	<%
				consulta2 = "EXEC dbo.pa_archivos_inscripcion_listar '" & dni & "', '" & id_proyecto & "'" 
            	Set RsP2= Server.CreateObject("ADODB.Recordset") 
            	RsP2.cursorlocation=3
            	RsP2.Open consulta2, MiCone, 3,3
            	If  Not RsP2.BOF And Not RsP2.EOF Then 
					Do While Not RsP2.EOF
            	 		cantidad=1
            %>
			<!-- controla el cuadro interno de la ventana de archivos -->
			<iframe id="foto<%=RsP2.Fields("num")%>" src="<%=RsP2.Fields("ruta")%>" width="800px" height="1000px" style="border:none ; display:none"> </iframe> 
				<% 	cantidad = cantidad + 1
					RsP2.MoveNext
					Loop	
					set RsP2=nothing
				end if
          	 	cantidad=cantidad+3
				%>
    </div>
	<input type="hidden" name="cantidad" id="cantidad" value="<%=cantidad%>" />	</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Nombre</span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess"  style="font-size:12px; font-family:Verdana"  value="<%=RsP.Fields("nombre")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Fecha Nacimiento </span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%=RsP.Fields("FEC_NAC")%>" readonly >
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Nivel Estudios </span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"   value="<%=RsP.Fields("NIVEL")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Grado</span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%=RsP.Fields("GRADO")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Profesion</span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%=RsP.Fields("PROFESION")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">RUC</span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%=RsP.Fields("RUC")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Fecha Inicio RNP </span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%=RsP.Fields("FECHAINIRNP")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Fecha Fin RNP </span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%=RsP.Fields("FECHAFINRNP")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Experiencia General </span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%="A&ntilde;o:"&RsP.Fields("expgen_anio")&" Meses:"&RsP.Fields("expgen_meses")%>" readonly >
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">
	  <div align="justify"><span class="Estilo3">
	    <% if RsP.Fields("experiencia_1")="" or isnull(RsP.Fields("experiencia_1")) then %>
	    A&ntilde;os o Meses de Experiencia en Trabajos de Campo (Censo y/o Encuentas))
	    <%else%>
	    <%=RsP.Fields("experiencia_1")%>
          <%end if%>
      </span> </div></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%="A&ntilde;o:"&RsP.Fields("expCampo_anio")&" Meses:"&RsP.Fields("expCampo_meses")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">
	  <div align="justify"><span class="Estilo3">
	    <% if RsP.Fields("experiencia_2")="" or isnull(RsP.Fields("experiencia_2")) then %>
	    A&ntilde;os o Meses de Experiencia en Manejo de Grupos
	    <%else%>
	    <%=RsP.Fields("experiencia_2")%>
          <%end if%>
      </span> </div></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%="A&ntilde;o:"&RsP.Fields("expGrupo_anio")&" Meses:"&RsP.Fields("expGrupo_meses")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Trabajo en el INEI</span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana"  value="<%=RsP.Fields("inei")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Proyecto</span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana" value="<%=RsP.Fields("Pr")%>" readonly >
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Curso Solicitado</span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana" value="<%=RsP.Fields("cursoCapacitacion")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Fechas Cursos</span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana" value="<%=RsP.Fields("fechas_cap")%>" readonly>
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Horas Lectivas</span></td>
    <td>&nbsp;</td>
    <td><span class="Estilo7">
      <input type="text" class="form-control" id="inputSuccess" style="font-size:12px; font-family:Verdana" value="<%=RsP.Fields("HorasLectivas")%>" readonly >
      <br>    
    </span></td>
    <td>&nbsp;</td>
  </tr>
	<%
		if id_rol <> 35  then
			if id_rol <> 34  then 
	%>
  <tr>
    <td valign="top"><span class="Estilo3">Observacion</span></td>
    <td>&nbsp;</td>
    <td>
		<select  <%=varvisualiza%> style="font-size:12px; font-family:Verdana" name="cmbObservacion" id="cmbObservacion" class="form-control" >
			<option value="" >Seleccione...</option>
			<option value="Formaci&oacute;n academica no requerida.">1 Formaci&oacute;n academica no requerida</option>
			<option value="Falta adjuntar grado obtenido.">2 Falta adjuntar grado obtenido.</option>
			<option value="Falta experiencia laboral general.">3 Falta experiencia laboral general. </option>
			<option value="Falta experiencia laboral especifica.">4 Falta experiencia laboral especifica.</option>
			<option value="No adjunta documentos sustentatorios.">5 No adjunta documentos sustentatorios.</option>
			<option value="Falta curso de capacitaci&oacute;n.">6 Falta curso de capacitaci&oacute;n.</option>
			<option value="Falta actualizar curso de capacitaci&oacute;n.">7 Falta actualizar curso de capacitaci&oacute;n.</option>
			<option value="Falta adjuntar constancia RNP.">9 Falta adjuntar constancia RNP. </option>
			<option value="No coinciden fechas de ficha con RNP.">10 No coinciden fechas de ficha con RNP.</option>
			<option value="RNP no vigente">11 RNP no vigente.</option>
			<option value="Nro DNI incorrecto.">12 Nro DNI incorrecto.</option>
			<option value="Falta post grado o curso de capacitaci&oacute;n.">13 Falta post grado o curso de capacitaci&oacute;n.</option>
			<option value="Otros.">8 Otros.</option>
		</select>
        <span class="glyphicon glyphicon-ok form-control-feedback"></span><br>    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><span class="Estilo3">Otros</span></td>
    <td>&nbsp;</td>
    <td>
		<input <%=varvisualiza%>  name="txtobs<%=RsP.Fields("ID_PER")%>" type="text" id="txtobs<%=RsP.Fields("ID_PER")%>"  style="font-size:12px; font-family:Verdana" maxlength="100"value="<%=RsP.Fields("cv_observacion")%>" class="form-control"/>
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" valign="top"><span class="Estilo3">Resultados</span></td>
    <td>&nbsp;</td>
    <td>
		<select <%=varvisualiza%>  style="font-size:12px; font-family:Verdana"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onChange="f_contador_cv(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')" class="form-control">
			<option value="9" <%if(RsP.Fields("bandAprob")="9") then response.write("selected")end if%>>Seleccione...</option>
			<option value="1" <%if(RsP.Fields("bandAprob")="1") then response.write("selected")end if%> >Aprobado</option>
			<option value="2" <%if(RsP.Fields("bandAprob")="2") then response.write("selected")end if%>>Desaprobado</option>
		</select>	
		<span class="glyphicon glyphicon-ok form-control-feedback"></span>	</td>
    <td>&nbsp;</td>
    <% 
	   			end if 
      		end if 
		%>
  </tr>
  <!--fin del recorrido del usuario -->
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" valign="bottom">
	  <div align="center">
		<button type="button" onClick="window.open('declaracion.asp?id=<%=RsP.Fields("id_cc")%>&p=<%=id_proyecto%>&dni=<%=dni%>')" class="botonR" target="_blank">Ver Ficha</button>
		</div>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<% 
	lsNivel= RsP.Fields("nivel")
    registro = registro + 1
    RsP.MoveNext
    Loop	
    RsP.close 
end If 
%>
</body>
</html>
