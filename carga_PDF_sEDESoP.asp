<%@ Language=VBScript %>
 <%session.lcid=2057%>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 

 
<%Response.ContentType="text/html; charset=iso-8859-1"

Response.Expires = 0

valor=Request("valor")

id_proyecto=session("id_proyecto") 
id_usuario=session("id_usuario") 

Dim objFSO
Set objFSO = CreateObject("Scripting.FileSystemObject")

if objFSO.FileExists("\\srv-fileserver\imagenes\CCRRHH\pdf_general\local_op_"&id_proyecto&".pdf" ) then 

	aa=1		
else 
	aa=0 
end if    

%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=es-iso-8859-1" />

   <link rel="stylesheet" type="text/css" href="Styles/inei.css">

<script language="JavaScript1.1" src="js/cliente.js"></script>
<script language="JavaScript1.1" src="js/cliente.js"></script>
<script language="JavaScript1.1" src="js/comun.js"></script>	
<script language="JavaScript1.1" src="js/valida.js"></script>	
<script language=JavaScript1.1 src="js/jquery.js"></script>
<script type="text/javascript" src="js/libreriaexp.js"></script>


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


function validaArchivo (){
	
	
	extensiones_permitidas = new Array(".pdf"); 
   	mierror = ""; 

	var archivo1=document.getElementById("file").value;
	
		if (archivo1==""){
			alert("Por favor, adjunte el archivo a actualizar");
			return false;

		} else{
			var a=0;
			var extension1 = (archivo1.substring(archivo1.lastIndexOf("."))).toLowerCase(); 
			for (var i = 0; i < extensiones_permitidas.length; i++) { 
         		if (extensiones_permitidas[i] == extension1) { 
					a=1;
         			//permitida = true; 
         			break; 
         		} 
      		} 
			
			if (a==0){
				mierror = "Comprueba la extensi\xf3n del archivo a subir. \nS\xf3lo se pueden subir archivos con extensi\xf3n: " + extensiones_permitidas.join(); 
				 alert(mierror);
				 return false;
			} else {
				document.getElementById("a11").value="1";
				document.frmMisArchivos.submit();
			}
			
		}
	
}


function verificar() {
	
	var a11=document.getElementById("a11").value;
	var a1=document.getElementById("a1").value;
	alert (a11+ ' - '+a1);
	if (a11==1 && a1==1 ) {
		alert ('El archivo se cargo correctametne')
	}
}

</script>
<style type="text/css">
<!--
.Estilo8 {color: #000099}
-->
</style>
</head>

<body onLoad="verificar()" >
	<form ENCTYPE="multipart/form-data" name="frmMisArchivos" id="frmMisArchivos" METHOD="POST" ACTION="recibir_archivoSedes.asp">
    <input type="hidden" name="a1" id="a1" value="<%=aa%>">
    <input type="hidden" name="a11" id="a11" value="<%=valor%>">
    <input type="hidden" name="NumA" id="NumA" value="0">
    <input type="hidden" name="id_proyecto" id="id_proyecto" value="<%=id_proyecto%>">
    <input type="hidden" name="id_usuario" id="id_usuario" value="<%=id_usuario%>">
    <input type="hidden" name="id" id="id" value="<%=id_cc%>">
    <input type="hidden" name="id_cc" id="id_cc" value="<%=id%>">
    
 <table cellpadding="0" cellspacing="0" border="0"  width="100%" class="tablam" style="BORDER-TOP: #0F83E1 1px solid; BORDER-LEFT: #0F83E1 1px solid;BORDER-RIGHT: #0F83E1 1px solid">
       <tr>
	      <td  height="33"  align="center" class="etiqueta" style="border-bottom:1px solid"><font size="2"> 
          <INPUT NAME="file" ID="file" style="Width:300px" TYPE=file  >&nbsp;<br>
          <INPUT type="button" value="Subir Archivo"  id="buttonUp" name="buttonUp"  onClick="validaArchivo()" ></font>&nbsp;&nbsp;<font class="alerta4" id="a1f"></font><DIV id="reg2"></DIV></td>
      </tr>
</table></form>
</body>
</html>
