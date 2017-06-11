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
		estado=RsP.Fields("estado")
		id_ConvocatoriaCargo=RsP.Fields("id_ConvocatoriaCargo")
		id_proyecto=RsP.Fields("id_proyecto")
	else
		num_convocatoria = ""
		Desc_Convocatoria = ""
		fechaInicio = ""
		fechaFin = ""
		hora_fin = ""
		cargo = ""
		estado=""
		id_ConvocatoriaCargo=""
		id_proyecto=""
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


var miPopup 

function abrepopup(id, ID_CC){ 

	var num_c= document.getElementById("num_convocatria").value;
	var pagina="pd_subirArchivoPDF.asp?num_c="+num_c+"&id="+id+"&ID_CC="+ID_CC;
	miPopup=window.open(pagina,"miwin","width=900,height=600") 
	miPopup.focus() 
} 



</script>	

</HEAD>
<BODY>
<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">

<table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    <tr>
    	<TD colspan=8 class="aplicacion" bgcolor="#DAE8F3" align="center">
        	<span onClick="MostrarConvocatoria()">Regresar</span> &nbsp;</img></span>  <img src="images/retro.png" alt="Regresar" width="18" height="16" style="CURSOR:HAND" onClick="MostrarConvocatoria()" >        	<input type="hidden" name="hdFechaFin" id="hdFechaFin" value="<%=fechaFin%>">
        	<input type="hidden" name="hdhora_fin" id="hdhora_fin" value="<%=hora_fin%>">
            <input type="hidden" name="num_convocatria" id="num_convocatria" value="<%=num_convocatria%>">
            </TD>
    </tr>
    <tr>
    	<TD width="20%"  class='etiqueta'>Numero Convocatoria</TD>
        <TD width="32%"  class='etiqueta'><%=num_convocatoria%></TD>
        <TD width="13%"  class='etiqueta'>Cargo:</TD>
        <TD width="35%" colspan="4"  class='etiqueta'><%=cargo%></TD>
       </tr>
    <tr>
    	<TD width="20%"  class='etiqueta'>Descripci&oacute;n:</TD>
        <TD colspan="6"  class='etiqueta'><%=Desc_Convocatoria%></TD>
       </tr>
    <tr>
    	<TD width="20%"  class='etiqueta'>Fecha Inicio de Convocatoria:</TD>
        <TD width="32%"  class='etiqueta'><%=fechaInicio%></TD>
        <TD width="13%"  class='etiqueta'>Fecha y hora Fin</TD>
        <TD colspan="4"  class='etiqueta'><%=fechaFin%> - <%=hora_fin%> Horas</TD>
       </tr>
</table>
       <br>
       <table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
       <tr>
    	<TD class="aplicacion" bgcolor="#DAE8F3" align="center">Nro<br>Comunicado</TD>
    	<TD class="aplicacion" bgcolor="#DAE8F3" align="center">Comunicado</TD>
    	<TD class="aplicacion" bgcolor="#DAE8F3" align="center">Insertar</TD>
    	</tr>
    
    <tr bgcolor="#E8F3FF">
    	<TD class='etiqueta' align="center"><input type='text' id='txtNumComunicado' name='txtNumComunicado' value='' maxlength='3' width= '30 px'></TD>
        <TD class='etiqueta'><textarea name="txtComunicado" style="width:550; height:50" class="e_input" id="txtComunicado"></textarea></TD>
        <TD class='etiqueta' align="center"><img src="images/ok.gif" width="8" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:insertarComunicado('<%=num_convocatoria%>', '<%=id_ConvocatoriaCargo%>','<%=estado%>', '<%=id_proyecto%>')" /></TD>
      </tr>
    </table>
    <br>
         <table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
       <tr>
    	<TD class="aplicacion" bgcolor="#DAE8F3" align="center">Nro<br>Comunicado</TD>
    	<TD class="aplicacion" bgcolor="#DAE8F3" align="center">Comunicado</TD>
    	<TD class="aplicacion" bgcolor="#DAE8F3" align="center">Guardar<br>Cambios</TD>
        <TD class="aplicacion" bgcolor="#DAE8F3" align="center">Agregar<br>Archivo</TD>
        <TD class="aplicacion" bgcolor="#DAE8F3" align="center">Estado</TD>
       </tr>
     <%cons = "EXEC dbo.pa_comunicadoConvocatria_listar '" & 	num_convocatria & "' " 
	Set RsP1 = Server.CreateObject("ADODB.Recordset")
	RsP1.cursorlocation=3
	RsP1.Open cons, MiCone, 3,3
	
	If Not RsP1.BOF And Not RsP1.EOF Then	
		
		Do While not RsP1.EOF
	
		texto=Replace(RsP1.Fields("comunicado"), "<br>",CHR(13))
	%> 
    
     <tr bgcolor="#FFFFEA">
    	<TD align="center"><input type='text' id='txtNumComunicado<%=RsP1.Fields("id_comunicadoConvocatoria")%>' name='txtNumComunicado<%=RsP1.Fields("id_comunicadoConvocatoria")%>' maxlength='3' width='30 px' value="<%=RsP1.Fields("nro_comunicado")%>"></TD>
        <TD ><textarea name="txtComunicado<%=RsP1.Fields("id_comunicadoConvocatoria")%>" style="width:550; height:50" class="e_input" id="txtComunicado<%=RsP1.Fields("id_comunicadoConvocatoria")%>" ><%=texto%></textarea></TD>
      <TD class='etiqueta' align="center"><img src="images/guardar.jpg" width="25" height="25" alt="" border="0" style="CURSOR: hand" onClick="javascript:modificarComunicado('<%=usuario%>','<%=RsP1.Fields("id_comunicadoConvocatoria")%>')" /></TD>
      <TD class='etiqueta' align="center">
      <img src="images/PDF.jpg" width="21" height="21" alt="" border="0" style="CURSOR: hand" onClick="javascript:abrepopup(<%=RsP1.Fields("id_comunicadoConvocatoria")%>, <%=RsP1.Fields("id_convocatoriacargo")%>)" />
      <!--<iframe width="100%" height="120px" id="archivos" style="border:none;" src="carga_PDF_Locales.asp"></iframe>--></TD>
      
      <TD class='etiqueta' align="center"><select id="cmbEstado" name="cmbEstado" class='e_combo' style="width:100px" onChange="modificarEstadoComunicado(this.value, '<%=RsP1.Fields("id_comunicadoConvocatoria")%>', '<%=num_convocatoria%>')">
        <option <% if RsP1.Fields("estado")=0 then%> selected <% end if %> value="0" >Inactivo</option>
        <option <% if RsP1.Fields("estado")=1 then%> selected <% end if %>value="1">Activo</option>
        <option <% if RsP1.Fields("estado")=2 then%> selected <% end if %>value="2">Cerrado</option>
      </select></TD>
       </tr>
       
     <% RsP1.MoveNext
	    Loop
	    end if%>
    </table>   
<% RsP1.close
  Set RsP1 = Nothing
%>	  
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
