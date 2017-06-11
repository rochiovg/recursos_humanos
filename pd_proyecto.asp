<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 
 <%
 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
lsUsuario=Session("id_usuario")

 
 sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_PROYECTO_INSERCION ")
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" onChange=""verValores(this.value);""  >"
	
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='"&wRsDptoapli(3)&"' value=""" &wRsDptoapli(0)&"*"&wRsDptoapli(1)&"*"&wRsDptoapli(2)&"*"&wRsDptoapli(4)&"*"&wRsDptoapli(5)&"*"&wRsDptoapli(3)&""">" &wRsDptoapli(1)&" "&wRsDptoapli(3)&"</option>"

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

If lsUbigeo <> "" then


%>	
    
<HTML>
<HEAD> 
      <title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>

	<script type="text/javascript" src="js/jquery.js"></script>
	<link rel="stylesheet" href="css/demos.css">
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




function verValores(valor){
	var aproyecto = valor;
	var lproyecto=aproyecto.split("*");
	var annio_meta=lproyecto[0];
	var codi_meta=lproyecto[1];
	var cod_proyecto=lproyecto[2];
	var codi_depe_tde=lproyecto[3];
	var codi_depe_apro=lproyecto[4];
	var proyecto=lproyecto[5];
		
	document.getElementById("txtannio_meta"). value=annio_meta;
	document.getElementById("txtcodi_meta").value=codi_meta;
	document.getElementById("txtcod_proyecto").value=cod_proyecto;
	document.getElementById("txtcodi_depe_tde").value=codi_depe_tde;
	document.getElementById("txtcodi_depe_apro").value=codi_depe_apro;
	document.getElementById("txtproyecto").value=proyecto;

	
}

function activarProyecto(){
	
		 var annio_meta = document.getElementById("txtannio_meta").value;
		 var codi_meta = document.getElementById("txtcodi_meta").value;
		 var cod_proyecto = document.getElementById("txtcod_proyecto").value;
		 var codi_depe_tde = document.getElementById("txtcodi_depe_tde").value;
		 var codi_depe_apro= document.getElementById("txtcodi_depe_apro").value;
		 var desc_proyecto = document.getElementById("txtproyecto").value;
		 var fase_meta = document.getElementById("txtfaseMeta").value;
		 var usuario = document.getElementById("txtUsuario").value;
		 

		if (fase_meta=='')
		{
			alert("Ingrese la fase de la Meta");
			document.getElementById("txtfaseMeta").focus();
			return false;
		}
		
	
		if(!confirm("Esto seguro de Activar el Proyecto?")) { 
		return false; 
       }
		 var url;

	ajax=http_request();
	var valores;	
	valores= "annio_meta=" + escape(annio_meta)+"&codi_meta="+escape(codi_meta)+"&cod_proyecto="+escape(cod_proyecto)+"&codi_depe_tde="+escape(codi_depe_tde)+"&codi_depe_apro="+escape(codi_depe_apro)+"&desc_proyecto="+escape(desc_proyecto)+"&fase_meta="+escape(fase_meta)+"&usuario="+escape(usuario)+"&lsTipo=99";  // parametros a enviar al servidor	

	url="m_ingreso.asp";
	
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divCriterio").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
									
					document.getElementById("divCriterio").innerHTML =ajax.responseText;
					window.location.reload();
            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divCriterio").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


	  
	</script>
</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 
    <!--#include file="pd_menu.asp"-->

	<div id="formulario">
   		<div id="divNavegacion" align="center"><span class="subtitulo">Registro: Activar Proyecto</span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
      <table  width="100%"  border="0" align="center">
          <tr>
 	      <td class="aplicacion" bgcolor="#DAE8F3"><span class="dato">
 	        <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           </span></td>
 	      <tr>
        <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">
   
<table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <thead><tr>
 	      <th colspan=8 class="aplicacion" bgcolor="#DAE8F3">
</th>
 	    
          <tr>
 	        <td colspan="5"  class='etiqueta'> <span class="alerta5">(*) Datos Obligatorios</span>
 	          <input type="hidden" name="txtannio_meta" id="txtannio_meta" value="">
 	          <input type="hidden" name="txtcodi_meta" id="txtcodi_meta" value="">
 	          <input type="hidden" name="txtcod_proyecto" id="txtcod_proyecto" value="">
 	          <input type="hidden" name="txtcodi_depe_tde" id="txtcodi_depe_tde" value="">
 	          <input type="hidden" name="txtcodi_depe_apro" id="txtcodi_depe_apro" value="">
              <input type="hidden" name="txtproyecto" id="txtproyecto" value="">
              <input type="hidden" name="txtUsuario" id="txtUsuario" value="<%=lsUsuario%>">
</td>
 	        </tr>
 	    <tr>
 	      <td width="33%" class='etiqueta'>Proyecto:<font id="demo3"><font class="alerta5"><font class='alerta5'>
 	        <%generaCargo()%>
 	      </font></font></font></td>
 	      <td width="33%" class='etiqueta'>Fase Meta:<font class="alerta5">
 	        <input name="txtfaseMeta" type="text" class="e_input" id="txtfaseMeta" size="10" maxlength="2" />
 	      </font></td>
 	      <td width="34%" class='etiqueta'>&nbsp;</td>
 	      </tr>
 	        </thead>
         <tbody>
 	            </tbody>    
                <tfoot>  
                <tr>
			 <td colspan="5" align="center" id="prueba" ><span class="etiqueta"><span class="alerta4">
 				<input name="button" type="button" class="boton" id="button" value="Activar" onClick="activarProyecto()" align="center">
			 </span></span></td>
                   
             
 	      </tr></tfoot>
 	    </table>
 	</div>	
		</td>
	</tr>	
	</table></form>
    <div id="divCriterio" align="center" style=""><%modMetas()%>
    </div>

</div>

<div id="ficha" align="center"></div>
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>

