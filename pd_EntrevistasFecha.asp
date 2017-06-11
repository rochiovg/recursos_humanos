<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 


sub generaDpto()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD_UBI '"&lsUbigeo&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option  value=""0"">Seleccione</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub




If lsUbigeo <> "" Then




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
      <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
   <link rel="shortcut icon" href="images/favicon.ico" />

 <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script> 

        <script type="text/javascript" src="js/main.js"></script> 
        <link rel="stylesheet" href="Styles/main.css" type="text/css" />
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="Styles/inei.css">


<script type="text/javascript"  src="js/envio_ajax.js"></script>
<script type="text/javascript"  src="js/valida.js"></script>


		<link type="text/css" href="css/cupertino/jquery-ui-1.8.20.custom.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.20.custom.min.js"></script>

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
    
<script language="javascript">
$(document).ready(function() {
	$(".botonExcel").click(function(event) {
		$("#datos_a_enviar").val( $("<div>").append( $("#Exportar_a_Excel").eq(0).clone()).html());
		$("#FormularioExportacion").submit();
});
});
</script>
<script>


function mostrarEntrevistas(){
		

		 if(document.frmMiForm.txtfecha.value == '' )
		 {
			 alert("Ingresa la Fecha de reporte");
			 document.frmMiForm.txtfecha.focus();
			 return false;
			 
			 }	 
		
		   var lsfecha = document.frmMiForm.txtfecha.value;
		var url;


	ajax=http_request();
	var valores;	
	valores= "lsfecha=" + escape(lsfecha) ;  // parametros a enviar al servidor	
	url="m_entrevistasfecha.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			
					document.getElementById("divResultado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divResultado").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
	
   return;	 

}


function exp_Entrevista(){
		

		 if(document.frmMiForm.txtfecha.value == '' )
		 {
			 alert("Ingresa la Fecha de reporte");
			 document.frmMiForm.txtfecha.focus();
			 return false;
			 
			 }	 
		
		   var lsfecha = document.frmMiForm.txtfecha.value;

 pagina = "exp_Entrevista.asp?lsfecha=" + lsfecha;
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

	
	
}



</script>
    </head>
    <body >
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Consultas :Entrevistas Realizadas</span></div>
        <div id="lateral">
                 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_preseleccion.asp">
            <table width='98%' border='0' cellpadding="2" cellspacing="2">
                   
		  <tr>
		    <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios</td>
		    </tr>
		  <tr>
		    <td width="19%" align=right bgcolor="#F7F8F9"><span class="criterio" id="nomreg">Fecha:</span></td>
		    <td width="81%" align=left bgcolor="#F7F8F9" id="reg"><input name="txtfecha" type="text" class="e_input" id="txtfecha" onkeyup="this.value=formateafecha(this.value);" size="10" maxlength="10" /></td>
		    </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><INPUT name='button1' type='button' class="boton" id='button1' onClick="javascript:mostrarEntrevistas()" value='Aceptar'></td>
              </tr>
            </table>
          </form>
        </div>  
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" style="margin:0;" align="center"></div>
		  <div id="divProceso"></div>
            <iframe id="iframe" width="100%" height="100%" src="" frameborder="0"></iframe>
            </div>
        </div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>

        <!-- scripts -->
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
