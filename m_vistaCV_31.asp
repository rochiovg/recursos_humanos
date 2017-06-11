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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$( function() 
{
	$( "#tabs" ).tabs();
  });
</script>

</head>

<body>
<table width="1500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="4">
		<div class="alert alert-danger"><strong> IMPORTANTE:</strong>Si no puede visualizar el contenido del archivo PDF, proceda a descargarlo y abrir el archivo</div>
	</td>
  </tr>
  <tr>
    <td width="434" valign="top">DNI</td>
    <td width="355">
		<input type="text" class="form-control" id="inputSuccess" >  
	<span class="glyphicon glyphicon-ok form-control-feedback"></span>	<br></td>
    <td width="52">&nbsp;</td>
    <td width="659" rowspan="20" valign="top">
	<!-- Menu Tab -->
	<div id="tabs">
	  <ul>
		<li><a href="#tabs-1">DNI</a></li>
		<li><a href="#tabs-2">CONSTANCIAS</a></li>
		<li><a href="#tabs-3">GRADOS OBTENIDOS</a></li>
	  </ul>
	  <div id="tabs-1">
		<p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. </p>
	  </div>
	  <div id="tabs-2">
		<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc.</p>
	  </div>
	  <div id="tabs-3">
		<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede.</p>
		<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper </p>
	  </div>
	</div>
	
	
	<!--<div class="container">
		<div class="panel-group">
			<div>
				<div class="panel panel-default">
					<div class="panel-heading">DNI</div>
					<div class="panel-body">Panel Content</div>
				</div>
				<div class="panel panel-warning">
				  <div class="panel-heading">CONSTANCIAS</div>
				  <div class="panel-body">Panel Content</div>
				</div>
				<div class="panel panel-danger">
					<div class="panel-heading">GRADOS OBTENIDOS</div>
					<div class="panel-body">Panel Content</div>
				</div>
			</div>
		</div>
	</div> -->
	<!-------------------------------------------->
	</td>
  </tr>
  <tr>
    <td valign="top">Nombre</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Fecha Nacimiento </td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Nivel Estudios </td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Grado</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Profesion</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">RUC</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br> </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Fecha Inicio RNP </td>
    <td><input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Fecha Fin RNP </td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Experiencia General </td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">A&ntilde;os o Meses de Experiencia en Trabajos de Campo (Censo y/o Encuentas)) </td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">A&ntilde;os o Meses de Experiencia en Manejo de Grupos </td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Trabajo en el INEI</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Proyecto</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Curso Solicitado</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Fechas Cursos</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Horas Lectivas</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Observacion</td>
    <td>
		<input type="text" class="form-control" id="inputSuccess" >  
		<span class="glyphicon glyphicon-ok form-control-feedback"></span><br>	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Otros</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">Resultados</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
