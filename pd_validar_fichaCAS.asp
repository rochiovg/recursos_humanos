<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 
<%
id_proceso =Request.Form("id_proceso")

Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec PA_PROCESOCAS_FICHA '"&id_proceso&"'")
	
	PROCESO=wRsDptoapli(0)
	CARGO=wRsDptoapli(1)
	COMPETENCIA=wRsDptoapli(2)
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	

sub generaODEI()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_PROV_LISTAR_ODEI ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtODEI""  name=""txtODEI"">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("COD") & """>"&wRsDptoapli("DETADEPEN")& "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 	

%>	
    
<HTML>
<HEAD> 
    <link rel="shortcut icon" href="images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="Styles/inei.css">

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

function getHTTPObject() {
    var xmlhttp;
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
       try {
          xmlhttp = new XMLHttpRequest();
       } catch (e) { xmlhttp = false; }
    }
    return xmlhttp;
}

function validar(){
	dni=document.getElementById("txtDNIB").value;
	paterno=document.getElementById("txtApePaterno").value;
	materno=document.getElementById("txtApeMaterno").value;
	nombre=document.getElementById("txtNombre").value;
	if (dni==""){
		alert("Registre n\xfamero de DNI");	
		dni.focus();
	}
}

function validarFormatoFecha(fecha) {
      var RegExPattern = /^\d{1,2}\/\d{1,2}\/\d{2,4}$/;
	  
      if ((fecha.match(RegExPattern)) && (fecha!='')) {
            var fechaf = fecha.split("/");
			var day = fechaf[0];
			var month = fechaf[1];
			var year = fechaf[2];
			var date = new Date(year,month,'0');
			if((day-0)>(date.getDate()-0)){
            	alert('Fecha Incorrecta, verificar');
				document.getElementById("txtFecNac").value="";
				return false;
			}   return true;
      } else {
            alert('Formato de fecha Incorrecta');
			document.getElementById("txtFecNac").value="";
			return false;
      }
}
 
</script>

</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>

    <form name="form1" id="form1" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
  <tr>
		<td valign=top align=center>
 	<table width="770" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
     			<tr height=10><td colspan=3 align=center></td></tr> 
 			<tr height=22>
			  <td colspan=3><br>
				  <table width="490" border="1" align="center" cellpadding="2" cellspacing="2"  bordercolor="#DAE8F3">
 	            <tr>
 								<th colspan=4 class="aplicacion" bgcolor="#DAE8F3">PROCESO CAS&nbsp;<%=PROCESO%><br>
 								Registro  de datos del postulante</th>
				    </tr>
                    <tr height=22>
							  <td colspan=4 class='etiqueta'><FONT CLASS='alerta5'>(*) Datos Obligatorios
							    <input type="hidden" name="txtPROCESO" id="txtPROCESO" value="<%=PROCESO%>">
							    <input type="hidden" name="txtCARGO" id="txtCARGO" value="<%=CARGO%>">
							    <input type="hidden" name="txtCOMPETENCIA" id="txtCOMPETENCIA" value="<%=COMPETENCIA%>">
							  </font></td>
				    </tr>
						  <tr>
							  <td width="126" height="25" class='etiqueta'>DNI<font class="alerta5">(*)</font></td>								
	              <td height="25" colspan="3">
						    <input type="text" class='e_texto' id="txtDNIB" name="txtDNIB" value="" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)"></td>
                          </tr>
                          <tr>
							  <td width=126  class='etiqueta'>Apellido Paterno<font class="alerta5">(*)</font></td>
	             
	              <td width="256">
	                <input type="text" class='e_texto' id="txtApePaterno" name="txtApePaterno" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
                    <td width=256  class='etiqueta'>Apellido Materno<font class="alerta5">(*)</font></td>
	             
	                            <td width="256">
                                <input type="text" class='e_texto' id="txtApeMaterno" name="txtApeMaterno" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
					      </tr>
						  <tr>
							  <td width="126" class='etiqueta'>Nombre<font class="alerta5">(*)</font></td>								
	              <td width="256">
						    <input type="text" class='e_texto' id="txtNombre" name="txtNombre" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
                            <td width="256" class='etiqueta'>Fecha nacimiento<font class="alerta5">(*)</font></td>								
	              <td width="256"  class='etiqueta'>
						    <input type="text" class='e_texto' id="txtFecNac" name="txtFecNac" value="" maxlength="10" style="width:100" validchars="1234567890/" onKeyPress="return TextUtil.allowChars(this, event)" onBlur="validarFormatoFecha(this.value)"> 
						    (dd/mm/aaaa)</td>
					      </tr>
                            <tr>
							  <td width="126" height="25" class='etiqueta'>Sexo<font class="alerta5">(*)</font></td>								
	              <td height="25"><font class='cascade4' color=crimson>
	                <select id="cmbSexo" name="cmbSexo" class='e_combo' style="width:110px">
	                  <option selected value="">Seleccione...</option>
	                  <option value="F">FEMENINO</option>
					  <option value="M">MASCULINO</option>
                    </select>
	              </font></td>
	              <td height="25" class='etiqueta'>ODEI</td>
	              <td height="25" class='etiqueta'><%generaODEI()%></td>
                          </tr>
                          <tr>
						     <td colspan="4" class='etiqueta' align="center"><div align="center"><input name=button2 type="button" class="boton" id=button2 style="font-family:Arial; font-size:8pt;" onClick="javascript:guardar_fichaCAS()"   value="Guardar">
						       &nbsp;&nbsp;
					         <input name=button1 type="button" class="boton" id=button1 style="font-family:Arial; font-size:8pt;" onClick="javascript:MostrarProceso()"   value="Regresar"> </div></td>								
	              </tr>
                            
			    </table>
 				</td>
 			</tr> 
      <tr height=22>
 				<td colspan=3>
 					<table cellpadding="0" cellspacing="0" border="0"  width="490" align="center">

 					</table>
 				</td>
 			</tr>

			</table>   
		</td>
	</tr>	
	</table>              				    	    				    
	</form>



</BODY>
</HTML>

