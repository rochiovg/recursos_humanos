<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
<%

abb=request("abb")

Response.ContentType="text/html; charset=iso-8859-1"
lsRol = CStr(Session("txtTipoUsuarioValido"))

id_proyecto = CStr(Session("id_proyecto"))
id_usuario = CStr(Session("id_usuario"))

If Request.Form <> "" Then
	lsOperacion = Request.Form("txtOper")
	lsOpcion = Request.Form("txtOpcion")
	lsNombre = Request.Form("txtNombre")
	
	lsApePaterno = Request.Form("txtApePaterno")
	lsApeMaterno = Request.Form("txtApeMaterno")
	lsDNI = Request.Form("txtDNI")
	
	If lsOperacion = "1" Then

		lsSQL = "EXEC dbo.pa_ficha_id_convocatoriacargo '"& lsApePaterno&"','"& lsApeMaterno&"','"& lsNombre&"','"& lsOpcion&"' ,'"& lsDNI&"' , '"& id_proyecto &"'"
		
		Set RS	= Server.CreateObject("ADODB.Recordset") 
		RS.cursorlocation=3
		RS.Open lsSQL, MiCone, 3,3

	End If
End If


%>
 
<HTML>
<HEAD> 
	<title>..::Sistema de Consecuci&oacute;n de recursos Humanos ::..</title>

	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
  <script type="text/javascript" src="js/cliente.js"></script>
<script>
function abrir()
{
	window.open("pd_modificacion.asp","_self","mywindow");
}
	
function abrir2()
{
	id_cc=document.getElementById("id_cc").value;
	window.open("default.asp?id="+id_cc+"","_self","mywindow");
}
	
function abrir3()
{
	window.open("pd_consulta.asp","_self","mywindow");
}


</script></HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
<!--#include file="cabecera.html"--> 
<!--#include file="pd_menu.asp"-->

<div id="formulario">
   		<div id="divNavegacion" align="center"><span class="subtitulo">Mantenimiento: Modificaci&oacute;n de Datos del Postulante</span></div>
    
	<table width="95%" height="80%" align="center" border="0">
  <tr>
    <td align="center" valign=top><input name="id_proyecto" type="hidden" id="id_proyecto" value="<%=id_proyecto%>">
	<%If lsOperacion <> "1" Then%>
	<form name="form1" id="form1" METHOD="POST" ACTION="pd_actualizarDatos.asp">

	<table width=100% cellpadding=0 cellspacing=0 border=0>
  <tr>
		<td valign=top align=center>
 			<table width="770" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
      <tr height=22>
 				<td colspan=3>
 					<table cellpadding="0" cellspacing="1" border="0"  width="490" align="center">
 					<tr height=22>
 								<td colspan=3 class='etiqueta'><FONT CLASS='cascade4' color="#0000ee">(*) Datos Obligatorios</font></td>
					  </tr>
 					<tr>
 						<td>
 							<table cellpadding="0" cellspacing="0" align="center" width="490" class="tabla2">
 	            <tr>
 								<th colspan=6 class="titulo">Por Nombre</th>
							<tr>
								<td width=160  class='etiqueta'>Apellido Paterno<font class='cascade4'color="#0000ee">(*)</font></td>
	             
	              <td width="273">
	              <input type="text" class='e_texto' id="txtApePaterno" name="txtApePaterno" value="" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ "  maxlength="40" style="width:220" ></td>
							  <td width="55" align=right></td>
							</tr>
								<tr>
								<td width=160  class='etiqueta'>Apellido Materno <font class='cascade4' color="#0000ee">(*)</font></td>
	             
	                            <td width="273">
	              <input type="text" class='e_texto' id="txtApeMaterno" name="txtApeMaterno" value="" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " maxlength="40" style="width:220"></td>
							  <td width="55" align=right></td>
							</tr>
							<tr>
								<td width="160" class='etiqueta'> Nombres<font class='cascade4' color="#0000ee">(*)</font></td>								
	              <td width="273">
							  <input type="text" class='e_texto' id="txtNombre" name="txtNombre" value="" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " maxlength="40" style="width:220"></td>
							  <td width="55" align=right><INPUT name=button1 type="button" class="boton" id=button1 style="font-family:Arial; font-size:8pt;" onClick="javascript:enviarConsultaAct('1')"   value="Buscar"></td>
							</tr>
 							</table>
 						</td>
 					</tr>
 					</table>
 				</td>
 			</tr>
 			<tr height=10><td colspan=3 align=center></td></tr> 
 			<tr height=22>
 				<td colspan=3><br>
 					<table cellpadding="0" cellspacing="0" align="center" width="490" class="tabla2">
 	            <tr>
 								<th colspan=4 class="titulo">Por DNI</th>
					  </tr>
 							<tr>
 								<td width="160" class='etiqueta'>DNI<font class='cascade4' color="#0000ee">(*)</font></td>								
	              <td width="273">
							  <input type="text" class='e_texto' id="txtDNI" name="txtDNI" value="" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)">
							</td>
							  <td width="55" align=right><INPUT name=button2 type="button" class="boton" id=button2 style="font-family:Arial; font-size:8pt;" onClick="javascript:enviarConsultaAct('2')"   value="Buscar"></td>
							</tr>
				  </table>
 				</td>
 			</tr>      
			</table>   
		</td>
	</tr>
	
	</table>  
    
    <%if abb=1 then 
	
	Response.Write("<br><br><FONT CLASS=""mensaje5"" color=MediumBlue>No existen datos para este DNI</font>")
	
	end if
	%>
                				    	    				    
	<input type=hidden id="txtOper" name="txtOper" value="">
	<input type=hidden id="txtOpcion" name="txtOpcion" value="">
	</form>
	<%End If%>
	
	<%If lsOperacion = "1" Then
			If Not RS.BOF And Not RS.EOF Then
			id_cc=Rs.Fields("id_convocatoriacargo")
			
			
			
	%>
<br><br><form action="" method="post" name="form_visita" id="form_visita">

<%   
response.Redirect("ficha_actualizar.asp?id="&id_cc&"&p="&id_proyecto&"&dni="&lsDNI&"&id_usuario="&id_usuario&"")
else 
response.Redirect("pd_actualizardatos.asp?abb=1")
  end if
  
  Rs.close
  set Rs=nothing 
   %>
</form>

<% end if%>

</BODY>
</HTML>
