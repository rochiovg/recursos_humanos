<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec getCargoSiga")
	Response.Write "<select class=""e_combo"" style=""width:260px"" id=""cmbCargo"" name=""cmbCargo""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" &""" value=""" & wRsDptoapli(0) &"*"& wRsDptoapli(1) & """>"&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaMeta()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_PROYECTO_LISTARCAS ")
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbMeta"" name=""cmbMeta"" >"
	
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='"&wRsDptoapli(3)&"' value=""" &wRsDptoapli(1)&"*"&wRsDptoapli(2)&"*"&wRsDptoapli(3)&""">" &wRsDptoapli(1)&" "&wRsDptoapli(2)&"</option>"

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


Response.Expires = 0

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoApli = Session("Ubigeoapli") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")
idProyecto=Session("id_proyecto")



If lsUbigeo <> "" Then




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
         <title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>
   
		<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/main.js"></script> 
        <script type="text/javascript"  src="js/cliente.js"></script>
		<script type="text/javascript"  src="js/envio_ajax.js"></script>
		<script type="text/javascript"  src="js/valida.js"></script>
        
        <link rel="stylesheet" href="css/demos.css">
    	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
        <link rel="shortcut icon" href="images/favicon.ico" />
		
        <style>
		input.text { margin-bottom:12px; width:95%; padding: .4em; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
		</style>
    
<script language="javascript">
$(document).ready(function() {
	$(".botonExcel").click(function(event) {
		$("#datos_a_enviar").val( $("<div>").append( $("#Exportar_a_Excel").eq(0).clone()).html());
		$("#FormularioExportacion").submit();
});
});
</script>
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

function MostrarProceso()
{	
document.getElementById("divC").style.display="";
	var valores="";
	var peticion=$.ajax(
		{
	     url:'pd_ListarProceso.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			  $("#divCriterio").html("Cargando...");
							  },
		success:function (respuesta) {
	          $('#divCriterio').html(respuesta);
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#divCriterio").html(""); 
      }
  }
  );
}	

function agregar_PEACAS(id_proceso)
{	
document.getElementById("divC").style.display="none";
	var valores="id_proceso="+id_proceso;
	var peticion=$.ajax(
		{
	     url:'pd_validar_fichaCAS.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			  $("#divCriterio").html("Cargando...");
							  },
		success:function (respuesta) {
	          $('#divCriterio').html(respuesta);
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#divCriterio").html(""); 
      }
  }
  );
}	

function guardar_fichaCAS()
{	
	dni=document.getElementById("txtDNIB").value;
	ape_pat=document.getElementById("txtApePaterno").value;
	ape_mat=document.getElementById("txtApeMaterno").value;
	nombres=document.getElementById("txtNombre").value;
	fec_nac=document.getElementById("txtFecNac").value;
	sexo=document.getElementById("cmbSexo").value;
	num_proc=document.getElementById("txtPROCESO").value;
	cargo=document.getElementById("txtCARGO").value;
	test=document.getElementById("txtCOMPETENCIA").value;
	ODEI=document.getElementById("txtODEI").value;
	
	if (dni==""){
		alert('Registre el n\xfamero de DNI');
		return false;
	}
	
	if (ape_pat==""){
		alert('Registre apellido paterno');
		return false;
	}
	
	if (ape_mat==""){
		alert('Registre apellido materno');
		return false;
	}
	
	if (nombres==""){
		alert('Registre nombres del postulante');
		return false;
	}
	
	if (fec_nac==""){
		alert('Registre fecha de nacimiento');
		return false;
	}
	
	if (sexo==""){
		alert('Registre el sexo del postulante');
		return false;
	}
	
	if (ODEI==""){
		alert('Registre la ODEI de postulaci\xf3n de la persona');
		return false;
	}

	var valores="dni="+escape(dni)+"&ape_pat=" + escape(ape_pat)+"&ape_mat=" + escape(ape_mat)+"&nombres=" + escape(nombres)+"&fec_nac=" + escape(fec_nac)+"&sexo=" + escape(sexo)+"&num_proc=" + escape(num_proc)+"&cargo=" + escape(cargo)+"&test=" + escape(test)+"&ODEI=" + escape(ODEI)+"&lsTipo=112";
	var peticion=$.ajax(
		{
	     url:'m_ingreso.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
							  },
		success:function (respuesta) {
			alert('El registro se guard\xf3 correctamente');
			document.getElementById("txtDNIB").value="";
			document.getElementById("txtApePaterno").value="";
			document.getElementById("txtApeMaterno").value="";
			document.getElementById("txtNombre").value="";
			document.getElementById("txtFecNac").value="";
			document.getElementById("cmbSexo").value="";
			document.getElementById("txtODEI").value="";
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#divCriterio").html(""); 
      }
  }
  );
}

function ver_PEAInscrita(ID_PROCESO){
	
	 pagina = "pd_PEA_CAS.asp?ID_PROCESO="+ID_PROCESO;
	win = window.open(pagina,'','scrollbars=yes,resizable=yes');	
	}

</script>
    </head>
    <body  onLoad="MostrarProceso()">
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
    <div id="formulario" >
	  <div id="divNavegacion" align="center"><span class="subtitulo">REGISTRO PROCESO CAS</span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
  <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">
   
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <tr>
 	      <th colspan="6" class="aplicacion" bgcolor="#DAE8F3"><span class="dato">
 	        <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           </span></th>
 	      <tr>
 	        <td colspan="6"   class='etiqueta'> <span class="alerta5">(*) Datos Obligatorios</span></td>
 	        </tr>
 	         <tr>
 	           <td width="148" class='etiqueta'>N&uacute;mero Proceso</td>
 	           <td width="280" class='etiqueta'><input name="txtcant" type="text" class="e_td_number" id="txtcant" onkeypress="return TextUtil.allowChars(this, event)" size="5" maxlength="5" validchars="1234567890"/>
                <font class='alerta5'>(*)</font></td>
 	           <td width="152" class='etiqueta'>Cargo Contrataci&oacute;n</td>
 	           <td width="579" colspan="3" class='etiqueta'><%generaCargo()%>
                <font class='alerta5'>(*) 	        </font></td>
              </tr>
         
 	    <tr>
 	      <td class='etiqueta'>Seleccionar Test Competencias:</td>
 	      <td class='etiqueta'><font class='cascade4' color="crimson">
 	        <select id="cmbComptencias" name="cmbComptencias" class='e_combo' style="width:100px">
 	          <option selected="selected" value="">Seleccione...</option>
 	          <option value="0">Sin test</option>
 	          <option value="1">De 185 preguntas</option>
 	          <option value="2">De 24 preguntas</option>
 	          </select>
 	      </font><font class='alerta5'>(*)</font></td>
 	      <td class='etiqueta'>Meta</td>
 	      <td colspan="3" class='etiqueta'><%generaMeta()%><font class='alerta5'>(*)</font></td>
 	      </tr> 
 	    <tr>
 	      <td colspan="6" align="center"><input name="button"  type="button" class="boton" id="button" value="Grabar" onclick="enviar_Proceso()" />
		</td>
 	      </tr>

 	    </table>
 	</div>	
		</td>
	</tr>	
	</table>              				    	    				    
  
	</form>
     <div id="divC" style="vertical-align:top; overflow:auto; height:100%; width:100%; display:""; " >
     <% 	  
	   response.Write " <table align=""center"" width=""90%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write "<tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
    response.Write "<td width=""5%"">N&deg;. Proceso</td>"
    response.Write "<td width=""20%"">Meta </td>"
    response.Write "<td width=""20%"">Cargo de Contrataci&oacute;n</td>"
	response.Write "<td width=""20%"">Test</td>"
	response.Write " <td width=""10%"">Agregar PEA</td>"
	response.Write "<td width=""5%"" align=""center"" >Ver PEA</td>"
    response.Write " <td width=""7%"">PEA no<br>Evaluada</td>"
    response.Write "  </tr>"
	response.Write "  </table>" %>
     </div>
      <div id="divCriterio" style="vertical-align:top; overflow:auto; height:250px;" >
	 </div>
</div><BR>
        <div id="footer" align="right">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
