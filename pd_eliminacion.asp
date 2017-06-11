<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 
<%

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
lsPuesto = Session("id_puesto")


If lsUbigeo <> "" then

If Request.Form <> "" Then
	lsOperacion = Request.Form("txtOper")
	lsOpcion = Request.Form("txtOpcion")
	lsNombre = Request.Form("txtNombre")
	lsApePaterno = Request.Form("txtApePaterno")
	lsApeMaterno = Request.Form("txtApeMaterno")
	lsDNI = Request.Form("txtDNI")
	lsCodigo = Request.Form("txtCODIGO")	
	
	If lsOperacion = "1" Then
		
		Set RS = Server.CreateObject("ADODB.Recordset")
		RS.CursorType = adOpenKeyset 
		
		
	End If
End If
 
 
%>
<HTML>
<HEAD> 
   <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>

	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
 <script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript" src="js/envio_ajax.js"></script>
  <script>

function getHTTPObject() {
    var xmlhttp;
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
       try {
          xmlhttp = new XMLHttpRequest();
       } catch (e) { xmlhttp = false; }
    }
    return xmlhttp;
}

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

</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 

	  <!--#include file="pd_menu.asp"--> 
       <div id="divNavegacion" align="center"><span class="subtitulo">Mantenimiento: Liberaci&oacute;n de Personal Contratado</span></div>
<form name="form1" id="form1" METHOD="POST" ACTION="pd_eliminacion.asp">

 			<table  width="95%"   align="center" border="0">
      <tr>
 				<td align="center" valign=top >
 					 
 							<table width="490" border="1" align="center" bordercolor="#DAE8F3"cellpadding="2" cellspacing="2" >
 	            <tr>
 								<th colspan=6 bgcolor="#DAE8F3"><span class="aplicacion">Por Nombre</span></th>
							<tr >
								<td width=160  class='etiqueta'>Apellido Paterno<font class='mensaje1'>(*)</font></td>
	             
	              <td width="273">
	              <input type="text" class='e_texto' id="txtApePaterno" name="txtApePaterno" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  <td width="55" rowspan="2" align=right>&nbsp;</td>
							</tr>
								<tr >
								<td width=160  class='etiqueta'>Apellido Materno <font class='mensaje1'>(*)</font></td>
	             
	                            <td width="273">
	                              <input type="text" class='e_texto' id="txtApeMaterno" name="txtApeMaterno" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  </tr>
							<tr >
								<td width="160" class='etiqueta'>Nombre<font class='mensaje1' >(*)</font></td>								
	              <td width="273">
							  <input type="text" class='e_texto' id="txtNombre" name="txtNombre" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  <td width="55" align=right><INPUT name="button1" type="button" class="boton" id="button1" onClick="javascript:eliminar('1')"   value="Buscar"></td>
							</tr>
 							</table>
 				
			      <table width="490" border="1" align="center" cellpadding="2" cellspacing="2"  bordercolor="#DAE8F3">
				      <tr>
				        <th colspan=4 bgcolor="#DAE8F3" class="aplicacion"><input type="hidden" name="txtUsuario" id="txtUsuario" value="<%=lsUsuario%>">
			            Por DNI</th>
			        </tr>
				      <tr >
				        <td width="160" height="25" class='etiqueta'>DNI<font class='mensaje1' >(*)</font></td>
				        <td width="273"><input type="text" class='e_texto' id="txtDNI" name="txtDNI" value="" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)"></td>
				        <td width="55" align=right><INPUT name=button2 type="button" class="boton" onClick="javascript:eliminar('2')"   value="Buscar"></td>
			        </tr>
			      </table>
		        <p>&nbsp;</p></td>
			  </tr>
 					
 				  			 
			
             				    	    				    
	
</table></form>
<div id="mensaje" class="aplicacion" align="center"> </div>
	<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_confirmacion_elim.asp">
	<%If lsOperacion = "1" Then%>
<%If Not RS.BOF And Not RS.EOF Then		%>
<input type=hidden id="txtOper2" name="txtOper2" value="">
	<input type=hidden id="txtOpcion2" name="txtOpcion2" value="">
	</form>

				
	<%Else%>
	 <table width=95% height=70%  border=1 background="Imagenes/fondo_di.jpg" align="center">  

  <tr>
		<td valign=top align=center>
  <table cellpadding="1" cellspacing="1" border="0" width="99%">
 	<tr>
 		<td colspan=4 align=right></td></tr>
      <tr height=5><td colspan=4 align=right></td></tr>
      <tr height=22><td colspan=4 align=center><FONT CLASS='mensaje5' color=MediumBlue><b><u>Resultado de Consulta</u></b></FONT></td>
      </tr>
      <tr height=10><td colspan=4 align=right></td></tr>
      <tr height=22>
        <td colspan=4 align=center><FONT CLASS='cascade3' color=MediumBlue>La Persona no está registrada en el sistema &oacute; <br>
          no pertenece al personal de la Red Administrativa
          <br><br>
           Por favor verifique...!!!</FONT></td>
		
      </tr>
      <tr height=22>
        <td colspan=4 align=center><br><table border=0 cellpadding="0" cellspacing="0" align="center" width="51%">
					<tr>
							         
					</tr>
					</table></td>
      </tr>
      <tr height=1><td colspan=4 align=right></td></tr>
</table></td></tr></table>
	<%	End If
		End If
	%>	
	<%If lsOperacion = "1" Then
		RS.Close
		cnn.Close
		Set RS = Nothing
		Set cnn = Nothing
	End If%>
	
	
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
