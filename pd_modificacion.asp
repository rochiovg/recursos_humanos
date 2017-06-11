<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 
<%



If Request.Form <> "" Then
	lsOperacion = Request.Form("txtOper")
	lsOpcion = Request.Form("txtOpcion")
	lsNombre = Request.Form("txtNombre")
	lsApePaterno = Request.Form("txtApePaterno")
	lsApeMaterno = Request.Form("txtApeMaterno")
	lsDNI = Request.Form("txtDNI")
	lsCodigo = Request.Form("txtCODIGO")
	
	
	If lsOperacion = "1" Then
		
		op = "1"
				
		 lsSQL = "EXEC dbo.usp_Consulta  '" & lsNombre & "', '" & lsApePaterno & "', '" & lsApeMaterno & "', '" & lsDni & "', '" & lsOpcion & "'"  
		 
	Call getRS(RS, lsSQL)
				
	End If
End If
%>
<HTML>
<HEAD> 
   <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
  <script type="text/javascript" src="js/cliente.js"></script>
  <script type="text/javascript" src="js/comun.js"></script>

<meta charset="iso-8859-1">  <script>


function getHTTPObject() {
    var xmlhttp;
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
       try {
          xmlhttp = new XMLHttpRequest();
       } catch (e) { xmlhttp = false; }
    }
    return xmlhttp;
}

</script>
<script>
  document.oncontextmenu = function(){return false};
</script>
<script> 
function validar(e) { 
    tecla = (document.all)?e.keyCode:e.which; 
    if(tecla==86 && e.ctrlKey) 
        return false; 
} 
</script> 
<style></style>
</style>
</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 

	<%If lsOperacion <> "1" Then%>
	<form name="form1" id="form1" METHOD="POST" ACTION="pd_modificacion.asp">

	<table width=100% cellpadding=0 cellspacing=0 border=0>
  <tr>
		<td valign=top align=center>
 			<table width="770" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
      <tr height=22>
 				<td colspan=3>
 					<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center"><BR><FONT color=MediumBlue><b><u>MODIFICACION DE DATOS</u></b></FONT><BR><BR> </td>
                      </tr>
                    </table>
 					<table cellpadding="0" cellspacing="1" border="0"  width="490" align="center" class="e_table">
 					<tr height=22>
 								<td colspan=3 class='etiqueta'><FONT  class="alerta5">(*) Datos Obligatorios</font></td>
					  </tr>
 					<tr>
 						<td>
                        
                      <span  class="titulo">Por Dni</span>
                        <table cellpadding="0" cellspacing="0" align="center" width="490" >
 	            <tr>
					  </tr>
 							<tr height="30">
 								<td width="160" align="right"><span class="etiqueta">DNI :</span></td>								
	              <td width="273">
							  <input type="text" class='e_texto' id="txtDNI" name="txtDNI" value="" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onKeyDown="return validar(event)">
                              <span class="alerta5" ><font class='cascade4' >(*)</font></span></td>
							  <td width="55" align=right>
                              <INPUT class="boton" type="button" style="font-family:Arial; font-size:8pt;"   value="Buscar" onClick="javascript:enviarConsulta('2')" id=button2 name=button2></td>
							</tr>
				  </table>
                  	
 							
 						</td>
 					</tr>
 					</table>
			</td>
 			</tr>
 			<tr height=10><td colspan=3 align=center></td></tr> 
 			<tr height=22>
 				<td colspan=3><br><br><table  width="490" border="0" align="center" cellpadding="0" cellspacing="1" class="e_table">
 					
 					<tr>
 						<td>
                        
                      <span  class="titulo">Por Nombre</span>
 					<table cellpadding="0" cellspacing="0" align="center" width="490" class="tablablanco">
 	            <tr>
				  <tr height="30">
                    <td width=160  align="right"><span class="etiqueta">Apellido Paterno :</span></td>
                    <td width="273"><input type="text" class='e_texto' id="txtApePaterno" name="txtApePaterno" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" onKeyDown="return validar(event)"> <span><font class='alerta5' >(*)</font></span></td>
					<td width="55">&nbsp;</td>
				  </tr>
				  <tr height="30">
					<td width=160  align="right"><span class="etiqueta">Apellido Materno :</span></td>
	                <td width="273"><input type="text" class='e_texto' id="txtApeMaterno" name="txtApeMaterno" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" onKeyDown="return validar(event)"> <span ><font class='alerta5' >(*)</font></span></td>
					<td width="55">&nbsp;</td>
				  </tr>
				  <tr height="30">
					<td width=160  align="right"><span class="etiqueta">Nombres :</span></td>							
	                <td width="273"><input type="text" class='e_texto' id="txtNombre" name="txtNombre" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" onKeyDown="return validar(event)"> <span><font class="alerta5">(*)</font></span></td>
				    <td width="55" align=right><INPUT class="boton" type="button" style="font-family:Arial; font-size:8pt;"   value="Buscar" onClick="javascript:enviarConsulta('1')" id=button1 name=button1></td>
				  </tr>
				 </table>
              
 						</td>
 					</tr>
			  </table></td>
 			</tr>      
			<tr height=22>
 				<td colspan=3><br>
 				</td>
 			</tr>      
			</table>   
		</td>
	</tr>
	
	</table>              				    	    				    
	<input type=hidden id="txtOper" name="txtOper" value="">
	<input type=hidden id="txtOpcion" name="txtOpcion" value="">
	</form>
	<%End If%>
	<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_confirmacionmod.asp">
	<%If lsOperacion = "1" Then
			If Not RS.BOF And Not RS.EOF Then
	%>
<br><br>
  <table cellpadding="0" cellspacing="1" border="0"  width="490" align="center">
 					<tr height=22>
 								<td colspan=3 ><FONT CLASS='alerta5'>(*) Datos Obligatorios</font></td>
    </tr>
 					<tr>
 						<td>
 							<table cellpadding="0" cellspacing="0" align="center" width="490" class=" e_table">
 	            <tr>
 								<th colspan=5 bgcolor="#E8F3FF" class="titulo">MODIFICACION DE DATOS
			                  </th></tr>
								<tr>
								<td width="160" class='etiqueta' bgcolor="#F2F2F2">DNI<font class='alerta5' >(*)</font></td>								
	                            <td>
							  <input type="text" class='e_texto' style="width:100" id="txtDNI2" name="txtDNI2" value="<%=Rs.Fields("DNI") %>" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" disabled="disabled">
							   <input type="hidden" id="txtDNIM" name="txtDNIM" value="<%=Rs.Fields("DNI") %>">
							   <br>		
			  <span id="msj" style="display:none;" class="mensaje1" >Este DNI ya se encuentra registrado.</span>
              <span id="msj2" style="display:none;" class="mensaje1">El DNI tiene como mínimo 8 números..</span>							  </td>
						      </tr>
							<tr>
								<td width=160 bgcolor="#F2F2F2"  class='etiqueta'>Apellido Paterno<font class='alerta5' >(*)</font></td>
	             
	              <td>
	              <input type="text" class='e_texto' id="txtApePaternoM" name="txtApePaternoM" value="<%=Rs.Fields("Ape_Paterno") %>" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  </tr>
								<tr>
								<td width=160 bgcolor="#F2F2F2"  class='etiqueta'>Apellido Materno <font class='alerta5' >(*)</font></td>
	             
	                            <td>
	              <input type="text" class='e_texto' id="txtApeMaternoM" name="txtApeMaternoM" value="<%=Rs.Fields("Ape_Materno") %>" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  </tr>
							<tr>
								<td width="160" bgcolor="#F2F2F2" class='etiqueta'>Nombre<font class='alerta5' >(*)</font></td>								
	              <td>
							  <input type="text" class='e_texto' id="txtNombreM" name="txtNombreM" value="<%=Rs.Fields("Nombre") %>" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  </tr>
							<tr>
							  <td bgcolor="#F2F2F2" class='etiqueta'>Segundo Nombre<font class='alerta5' >(*)</font></td>
							  <td><input type="text" class='e_texto' id="txtNombreM2" name="txtNombreM2" value="<%=Rs.Fields("Nombre2") %>" maxlength="40" style="width:220" validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml; " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  </tr>
							
							<tr>
								<td  colspan="2" align="center"  class='etiqueta'><div align="center">
								  <input name=button12 type="button" class="boton" id=button12 style="font-family:Arial; font-size:8pt;" onClick="javascript:enviarDatosMod('1')"   value="Grabar">
							  </div></td>								
                              </tr>
 							</table>
 						</td>
 					</tr>
	  </table><input type=hidden id="txtOper2" name="txtOper2" value="">
	<input type=hidden id="txtOpcion2" name="txtOpcion2" value="">
	</form>
				
	<%Else%>
  <table cellpadding="1" cellspacing="1" border="0" width="99%">
 	<tr>
 		<td colspan=4 align=right></td></tr>
      <tr height=5><td colspan=4 align=right></td></tr>
      <tr height=22><td colspan=4 align=center><FONT CLASS='cascade4' color=MediumBlue><b><u>RESULTADO DE CONSULTA</u></b></FONT></td></tr>
      <tr height=10><td colspan=4 align=right></td></tr>
      <tr height=22><td colspan=4 align=center><FONT CLASS='cascade3' color=MediumBlue>No existe Información con sus criterios.</FONT></td></tr>
      <tr height=1><td colspan=4 align=right></td></tr>
</table>

	<%	End If
		End If
	%>
	<br><br><br>
	<table width="51%" align="center" border="0">
	<tr>
		<td align="center"><font class='cascade10' color=DarkBlue><a href="default.asp" class="boton" target="_self">Inicio</a>&nbsp;&nbsp;&nbsp;<a href="pd_consultaregistro.asp" class="boton" target="_self">Consultar</a>&nbsp;&nbsp;&nbsp;</font></td>
	  </tr>
	<tr>
	  <td align="center" class="etiqueta2"><strong><sup>(*)</sup> Escriba correctamente sus datos, segun aparece en su DNI, cualquier problema posterior, es exclusivamente de su responsabilidad </strong></td>
	  
	  </tr>
	</table>
	
	<%If lsOperacion = "1" Then
		RS.Close
		cnn.Close
		Set RS = Nothing
		Set cnn = Nothing
	End If%>
	
	
</BODY>
</HTML>
