<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

lsRol 		= CStr(Session("txtTipoUsuarioValido"))
lsUsuario = Session("txtNombreValido")
id_usuario= Session("id_usuario")
lsUbigeo	= Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
lsUbigeoDist = Session("UbigeoDist") 
id_proyecto  = session("id_proyecto")

ipVisitante = Request.ServerVariables("REMOTE_ADDR")

sub generaAlgoritmo()
	
	set wRsDptoapli = Micone.execute(" exec dbo.pa_convocatoriacargo_cargoConv '"&id_proyecto&"' ")
	
	Response.Write "<select class=""e_combo"" style=""width:250px"" id=""cmbCargo"" name=""cmbCargo"" onChange=""verifica_algoritmo_nivel(this.value)"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(4)&""" value=""" &wRsDptoapli(4)&""">"&wRsDptoapli(0)&" - "&wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	
	Response.Write "</select>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

If lsUbigeo <> "" Then

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
   <link rel="shortcut icon" href="images/favicon.ico" />

<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script> 
<script type="text/javascript" src="js/main.js"></script> 
<link rel="stylesheet" href="Styles/main.css" type="text/css" />
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="Styles/inei.css">
<script type="text/javascript"  src="js/funciones_alg.js"></script>

<script>
function http_request() {
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			xmlhttp = false;
		}
	}
	if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}

</script>

</head>
	<body>
    <div id="top">
      <!--#include file="cabecera.html"-->
			<!--#include file="pd_menu.asp"-->
    </div>
    <div id="divNavegacion" align="center"><span class="subtitulo"><%=Session("cmeta")&"-"&Session("nmeta")%> </span></div>
    <table width="50%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  		<thead><tr>
 	      <th colspan=5 bgcolor="#DAE8F3" class="aplicacion"></th>
 	      	<tr>
 	        	<td colspan="2"  class="titulo">ALGORITMOS DE EVALUACI&Oacute;N AUTOM&Aacute;TICAss<BR>Busqueda de Procesos</td>
					</tr>
      </thead>
      <tbody></tbody>    
      <tfoot>  
      	<tr>
					<td width="23%" align="center" id="prueba" >PROCESO : </td>
			 		<td width="77%" align="left" id="prueba" ><font class='alerta5' ><%generaAlgoritmo()%>
			 			</font>&nbsp;</td>
			 	</tr>
      </tfoot>
    </table>
    <br>
    <div id="div_algoritmo"></div>
    <br>    
    <div style="width:100%" align="center" id="div_detalle_algoritmo"></div>
    <div id="d_ayuda"></div>

</body>
</html>
<%Else
	Response.Redirect("default.asp")
End If%>
