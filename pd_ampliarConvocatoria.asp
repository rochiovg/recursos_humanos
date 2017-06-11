<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 <%session.lcid=2057%>
 <%
 
Response.ContentType="text/html; charset=iso-8859-1"

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
idProyecto=Session("id_proyecto")

id_proy=Request.Form("id_proy")
num_convocatria=Request.Form("num_convocatria")
usuario=Request.Form("usuario")

If lsUbigeo <> "" then


consulta1 = "EXEC dbo.pa_convocatoria_datos '" & num_convocatria & "' " 
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta1, MiCone, 3,3
	
	If  Not RsP.BOF And Not RsP.EOF Then	
	num_convocatoria=RsP.Fields("num_convocatoria")	
	Desc_Convocatoria=RsP.Fields("Desc_Convocatoria")
	fechaInicio=RsP.Fields("fechaInicio")
	fechaFin=RsP.Fields("fechaFin")
	hora_fin =RsP.Fields("hora_fin")
	cargo=RsP.Fields("cargo")
	else
	num_convocatoria = ""
	Desc_Convocatoria = ""
	fechaInicio = ""
	fechaFin = ""
	hora_fin = ""
	cargo = ""
	end if	
		
RsP.close
Set RsP = Nothing

%>	
    
<HTML>
<HEAD> 
<title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>
   <link rel="shortcut icon" href="images/favicon.ico" />

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

</HEAD>
<BODY>


    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_ConvocatoriaMant.asp">
	 <table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    <tr>
    	<TD colspan=7 class="aplicacion" bgcolor="#DAE8F3" align="center">
        	<span onClick="MostrarConvocatoria()">Regresar</span> &nbsp;</img></span>  <img src="images/retro.png" alt="Regresar" width="18" height="16" style="CURSOR:HAND" onClick="MostrarConvocatoria()" >        	<input type="hidden" name="hdFechaFin" id="hdFechaFin" value="<%=fechaFin%>">
        	<input type="hidden" name="hdhora_fin" id="hdhora_fin" value="<%=hora_fin%>"></TD>
    </tr>
    <tr>
    	<TD width="20%"  class='etiqueta'>Numero Convocatoria</TD>
        <TD width="32%"  class='etiqueta'><%=num_convocatoria%></TD>
        <TD width="13%"  class='etiqueta'>Cargo:</TD>
        <TD width="35%" colspan="3"  class='etiqueta'><%=cargo%></TD>
       </tr>
    <tr>
    	<TD width="20%"  class='etiqueta'>Descripci&oacute;n:</TD>
        <TD colspan="5"  class='etiqueta'><%=Desc_Convocatoria%></TD>
       </tr>
    <tr>
    	<TD width="20%"  class='etiqueta'>Fecha Inicio de Convocatoria:</TD>
        <TD width="32%"  class='etiqueta'><%=fechaInicio%></TD>
        <TD width="13%"  class='etiqueta'>Fecha y hora Fin</TD>
        <TD colspan="3"  class='etiqueta'><%=fechaFin%> - <%=hora_fin%> Horas</TD>
       </tr>
       <tr>
    	<TD colspan="4" class="aplicacion" bgcolor="#DAE8F3" align="center">Datos a modificar</TD>
       </tr>
    <tr bgcolor="#FFFFEA">
    	<TD class='etiqueta'>Fecha Fin de Convocatoria: </TD>
        <TD class='etiqueta'><input type='text' class='e_input' id='txtfechFinM' onKeyUp="this.value=formateafecha(this.value);" name='txtfechFinM' value='' maxlength='10' >
        <input type='button' id='cbFechFinConvM' value='..'>
        <font class='alerta5'>(*) </font></TD>
        <TD class='etiqueta'>Hora Cierre:</TD>
        <TD colspan="3" class='etiqueta'><span class="e_td_string">
   
          </span><script type="text/javascript"> 
	      Calendar.setup({ 
          inputField : "txtfechFinM",     // id del campo de texto 
          ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
          button     : "cbFechFinConvM"     // el id del botón que lanzará el calendario 
	     });
         </script>
          <select id="txtHoraFinM" name="txtHoraFinM" class="e_combo" style="width:50px" >
            <option value="00">00</option>
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
          </select>
          Horas</TD>
       </tr>
       <tr bgcolor="#FFFFEA">
    	<TD class='etiqueta'>Fecha Fin de Proceso de Selecci&oacute;n: </TD>
        <TD class='etiqueta'><input type='text' class='e_input' id='txtfechFinPS' onKeyUp="this.value=formateafecha(this.value);" name='txtfechFinPS' value='' maxlength='10' >
        <input type='button' id='cbFechFinConvPS' value='..'>
        <font class='alerta5'>(*) </font>
        <span class="e_td_string">
   
          </span><script type="text/javascript"> 
	      Calendar.setup({ 
          inputField : "txtfechFinPS",     // id del campo de texto 
          ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
          button     : "cbFechFinConvPS"     // el id del botón que lanzará el calendario 
	     });
         </script>
        </TD>
        <TD class='etiqueta'>&nbsp;</TD>
        <TD colspan="3" class='etiqueta'>&nbsp;</TD>
       </tr>
    <TR  bgcolor="#FFFFEA">
    	<TD colspan="5" align="center">&nbsp;<input name="button" type="button" class="boton" id="button" value="Grabar" onClick="actualizarConvocatoria('<%=num_convocatoria%>','<%=fechafin%>', '<%=hora_fin%>')"></TD>
    </TR>
    </table>
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
