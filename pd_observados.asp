<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 
 <%
 
lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
idProyecto=Session("id_proyecto")
 
 sub generaSede()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec uspGet_Sede")
	Response.Write "<select class=""e_combo"" style=""width:300px"" id=""cmbSede"" name=""cmbSede""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title=""" & wRsDptoapli("desc_sede_sed") & """ value=""" & wRsDptoapli("codi_sede_sed") & """>"&wRsDptoapli("desc_sede_sed")&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing  
	
	
End sub

 sub generaTipoOfc()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec PA_abreviatura_oficios_LISTAR")
	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""cmbTipoOfc1"" name=""cmbTipoOfc1""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title=""" & wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

 sub generaTipoOfc2()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec PA_abreviatura_oficios_LISTAR_2")
	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""cmbTipoOfc2"" name=""cmbTipoOfc2""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title=""" & wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaDependencia()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec uspGet_dependencias")
	Response.Write "<select class=""e_combo"" style=""width:300px"" id=""cmbDependencia"" name=""cmbDependencia""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli("DESC_DEPE_TDE")&""" value=""" & wRsDptoapli("CODI_DEPE_TDE") & """>"&wRsDptoapli("DESC_DEPE_TDE")&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub




sub generaCargoPresupuesto()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec getcargoPresupuesto '"&idProyecto&"' ")
	
	Response.Write "<select class=""e_combo"" style=""width:340px"" id=""cmbCargo"" name=""cmbCargo""  onchange=""javascrip:topes(this.value)""  >"
	Response.Write " <option value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(5)&" ("&wRsDptoapli(2)&")" &" - Actividad: "&wRsDptoapli(4)& " - PEA LIBRE A CERTIFICAR: "&wRsDptoapli(6)&""& " F.Fto:"&wRsDptoapli(7)&""" value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
	
	
End sub

ANIO_A=Year(Date)
ANIO_AN=Year(Date)-1

If lsUbigeo <> "" then


	

%>	
    
<HTML>
<HEAD> 
      <title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>
    
    
	<script type="text/javascript" src="js/envio_ajax.js"></script>
	<script src="js/jquery-1.7.2.js"></script>
	<script src="external/jquery.bgiframe-2.1.2.js"></script>
	<script src="ui/jquery.ui.core.js"></script>
	<script src="ui/jquery.ui.widget.js"></script>
	<script src="ui/jquery.ui.mouse.js"></script>
	<script src="ui/jquery.ui.button.js"></script>
	<script src="ui/jquery.ui.draggable.js"></script>
	<script src="ui/jquery.ui.position.js"></script>
	<script src="ui/jquery.ui.resizable.js"></script>
	<script src="ui/jquery.ui.dialog.js"></script>
	<script src="ui/jquery.effects.core.js"></script>
	<script src="js/valida_fecha.js"></script>

	<link rel="stylesheet" href="css/demos.css">
    <link rel="stylesheet" type="text/css" href="Styles/inei.css">
	<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
    <link rel="shortcut icon" href="images/favicon.ico" />
     
	<style>
		input.text { margin-bottom:12px; width:95%; padding: .4em; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
	</style>


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


function mostrarObservados()
{	
	var valores="";
	var peticion=$.ajax(
		{
	     url:'m_observados_ece.asp?',
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



function guardarObservados () {
	if(confirm("Est\xe1 seguro de guardar los datos Registrados?"))
		{
		var ape_nom=document.getElementById("txt_ape_nom").value;
		var dni=document.getElementById("txt_dni").value;
		var proy=document.getElementById("txt_proyecto").value;
		var annio=document.getElementById("txt_annio").value;
		var obs=document.getElementById("txtObservaciones").value;
		var responsable=document.getElementById("txt_responsable").value;
		
		if (ape_nom==""){
			alert('Registre los apellidos y nombres de la persona');
			return false;
		}
		
		
		if (dni.lenght<8 || dni==""){
			alert('Registre el numero de DNI correctamente');
			return false;
		}
		
		if (proy==""){
			alert('Registre el proyecto donde se observo a la persona');
			return false;
		}
		
		if (annio==""){
			alert('Registre el año donde se observo a la persona');
			return false;
		}
		
		if (obs==""){
			alert('Registre la observacion de la persona');
			return false;
		}
		if (responsable==""){
			alert('Registre el nombre del responsable de la observacion de la persona');
			return false;
		}
		
		ajax=http_request();
		var valores;	
		valores= "ape_nom=" + escape(ape_nom)+"&dni="+escape(dni)+"&proy="+escape(proy)+"&annio="+escape(annio)+"&obs="+escape(obs)+"&responsable="+escape(responsable)+"&lsTipo=135";  // parametros a enviar al servidor
			
		url="m_ingreso.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
	
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){
					
					alert ('Se realizo el regitro correctamente');
					ape_nom=document.getElementById("txt_ape_nom").value="";
		dni=document.getElementById("txt_dni").value="";
		proy=document.getElementById("txt_proyecto").value="";
		annio=document.getElementById("txt_annio").value="";
		obs=document.getElementById("txtObservaciones").value="";
		responsable=document.getElementById("txt_responsable").value="";
					
				}
				else if(ajax.status==404){
				}
				else{
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		
	   return;	 
	}
}

function verificaDNI(dni){
	if (dni.length<8){
		alert ('Error en el registor del DNI, verificar');
		document.getElementById("txt_dni").value=""
		return false;
		}
		
		ajax=http_request();
		var valores;	
		valores= "dni=" + escape(dni)+"&flag=2&lsTipo=136";  // parametros a enviar al servidor
			
		url="m_ingreso.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
	
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){
					resp=ajax.ajax.responseText;
					
					if (resp==1){
						alert('EL DNI ya existe, verificar');
						document.getElementById("txt_dni").value="";
						return false;	
					}
				}
				else if(ajax.status==404){
				}
				else{
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		
	   return;	 
}



/*function CambioPag()
{		
	document.frmMANTE_Proc.submit(); 
} 
*/

function VERFORMATO(valor)
{		
	 pagina = "formato_observados.asp";
	 win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}


<!--  onLoad="mostrarObservados()"   -->
</script> 
</HEAD>
<BODY  topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue >
	<!--#include file="cabecera.html"-->

<!--#include file="pd_menu.asp"-->
<div id="formulario">
  <div id="divNavegacion" align="center"><span class="subtitulo">Registro Observados</span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
  <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">
    
    
    
    <table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <tr>
    <td colspan="4"  class="aplicacion" bgcolor="#DAE8F3"><%=Session("cmeta")&"-"&Session("nmeta")%> -<%=Session("actividad")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>"></td>
    </tr>
    <tr>
    <td colspan="4"  class="aplicacion" bgcolor="#DAE8F3">REGISTRO UNO A UNO</td>
    </tr>
    
    <tr>
    <td colspan="4"  class="aplicacion"  >  Detalle</span> <font class='alerta5'><img src="images/ventana.png" alt="" border="0" style="CURSOR: hand" onClick="window.open('pd_conAdministrativaDetalle.asp,'','top=10,left=25,scrollbars=yes,width=880,height=700,resizable=1')" /></font></td>
    </tr>
    
    
  <tr>
    <td colspan="4"><span class="aplicacion"><br></span><span class="alerta5">(*) Datos Obligatorios<span class="aplicacion"></span></span></td>
    </tr>
  <tr>
    <td width="90" class='etiqueta'>Apellidos y Nombres</td>
    <td width="280"><input type="text" name="txt_ape_nom"   
    onKeyPress="return fs_SoloLetras(event)" id="txt_ape_nom" value=""  maxlength="200" style="width:280px"  />
      <span class="alerta5">(*)</span></td>
    <td width="29"  class='etiqueta'>DNI: </td>
    <td width="375"><input type="text" name="txt_dni" onKeyPress="return fs_numeros(event)" onBlur="verificaDNI(this.value)" id="txt_dni" value=""  maxlength="8" style="width:150px" />
      <span class="alerta5">(*)</span></td>
  </tr>
  <tr>
    <td  class='etiqueta'>Proyecto</td>
    <td ><input type="text" name="txt_proyecto" onKeyPress="return fs_alfanumerico(event)"  maxlength="100" id="txt_proyecto" value="" style="width:150px" />
      <span class="alerta5">(*)</span></td>
    <td  class='etiqueta'>A&ntilde;o</td>
    <td><input type="text" name="txt_annio"  maxlength="4"  onKeyPress="return fs_numeros(event)" id="txt_annio" value="" style="width:60px" />
      <span class="alerta5">(*)</span></td>
  </tr>
  <tr>
    <td  class='etiqueta'>Observaci&oacute;n: </td>
    <td style="alignment-adjust:LEFT"><span class="aplicacion">
      <textarea name="txtObservaciones" style="width:350; height:50"  id="txtObservaciones"></textarea>
      <span class="alerta5">(*)</span></span></td>
    <td  class='etiqueta' style="alignment-adjust:LEFT">Responsable </td>
    <td style="alignment-adjust:LEFT"><input type="text" name="txt_responsable"   
    onKeyPress="return fs_SoloLetras(event)" id="txt_responsable" value=""   style="width:280px" maxlength="100"  /></td>
    </tr>
    
    <tr>
    <td colspan="4" align="center"><input name="button2" type="button" class="boton" id="button2" value="Grabar" onClick="guardarObservados()"></td>
    </tr>
    
    
  <tr>
    <td colspan="4"  class="aplicacion" bgcolor="#DAE8F3">REGISTRO MASIVO</td>
    </tr>
    
      <tr>
    <td width="90" class='etiqueta'>1ro Exportar Fomato&nbsp;<img src="images/resultados1.png" onClick="VERFORMATO()" width="20" height="20"></td>
    <td colspan="3" rowspan="3"><iframe width="100%" height="150px" id="Archivos_SubirO" style="border:none;" src="carga_observadosCSV.asp"></iframe></td>
    </tr>
  
  <tr>
    <td width="90" class='etiqueta'>3ro Verificar&nbsp;<img src="images/edita.PNG" width="15" height="14"></td>
    </tr>
  
  <tr>
    <td width="90" class='etiqueta'>4to Actualizar&nbsp;<img src="images/ok.gif" width="16" height="16"></td>
    </tr>
  

</table>
 	</div>	
		</td>
	</tr>	
	</table></form>

  <div id="divCriterio" style="vertical-align:top; overflow:auto; height:100%;"></div>
	
</div>
<BR>
 <div id="footer" align="right">
            <span>Usuario: <%=lsUsuario%> </span>
</div>

<div id="ficha" align="center"></div>
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
