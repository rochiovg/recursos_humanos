<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
id_proyecto=session("id_proyecto")
lsDNI=request.QueryString("lsdni")

if id_proyecto=1 then

lsSQL = "EXEC dbo.usp_BusquedaDatos '','','','"& lsDNI&"','','','','5', '"&id_proyecto&"' "		
else
lsSQL = "EXEC dbo.usp_BusquedaDatos '','','','"& lsDNI&"','','','','6', '"&id_proyecto&"' "		

end if
	
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

<h2>Datos de Afiliaci&oacute;n<br><span class="settingentryhighlight"><%=Rs.Fields("Nombre") & " " &Rs.Fields("Ape_paterno") & " " & Rs.Fields("Ape_materno")%></span></h2>
<div>
<table border="1" width="100%">

<tr>
    <td colspan="2" width="300px" align="center">Declarado</td>
    <td colspan="2" width="300px"  align="center">Validado</td>
    </tr>
  
  <tr>
    <td width="100px"><span class="subheader">Tipo pension</span></td>
    <td width="200px"><span class="settingentryhighlight"><%=Rs.Fields("tipo_pension")%></span></td>
     <td width="100px"><span class="subheader">Tipo pension</span></td>
    <td width="200px"><span class="settingentryhighlight"><%=Rs.Fields("tipo_pensionVal")%></span></td>
  </tr>
  <tr>
    <td width="100px"><span class="subheader">AFP</span></td>
    <td width="200px"><span class="settingentryhighlight"><%=Rs.Fields("afp")%></span></td>
    <td width="100px"><span class="subheader">AFP</span></td>
    <td width="200px"><span class="settingentryhighlight"><%=Rs.Fields("afpVal")%></span></td>
  </tr>
  <tr>
    <td width="100px"><span class="subheader">Tipo Comisi&oacute;n</span></td>
    <td width="200px"><a href="mailto:<%=Rs.Fields("correo")%>"><span class="settingentryhighlight"><%=Rs.Fields("comision")%></span></a></td>
    <td width="100px"><span class="subheader">Tipo Comisi&oacute;n</span></td>
    <td width="200px"><a href="mailto:<%=Rs.Fields("correo")%>"><span class="settingentryhighlight"><%=Rs.Fields("comisionval")%></span></a></td>
  </tr>
</table>
</div>
<%	else response.Write(" <h2>Datos no encontrados</h2>")	end if%>

</body>
</html>
