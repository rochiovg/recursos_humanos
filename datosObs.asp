<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
lsDNI=request.QueryString("lsdni")
		lsSQL = "EXEC dbo.pa_malostrabajadores_listar '"& lsDNI&"' "		
		Call getRS(RS, lsSQL)
		
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
<link href="css/adminstyle.css" rel="stylesheet" type="text/css" />
</head>

<body class="background" >
	  <%	If Not RS.BOF And Not RS.EOF Then		%>

<h2>Datos de Contacto</h2>
<div><span class="settingentryhighlight">Nombres y Apellidos:</span><span class="subheader"><%=Rs.Fields("Nombre") & " " &Rs.Fields("Ape_paterno") & " " & Rs.Fields("Ape_materno")%></span></div>
<div><span class="settingentryhighlight">Observación:</span><span class="subheader"><%=Rs.Fields("obs")%></span></div>
<div><span class="settingentryhighlight">Fecha Registro Obs:</span><span class="subheader"><%=Rs.Fields("fecha_reg_obs")%></span></div>
<%	else response.Write(" <h2>Datos no encontrados</h2>")	end if%>

</body>
</html>
