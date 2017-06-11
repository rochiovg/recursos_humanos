<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 <%session.lcid=2057%>
 <%
 
Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario =  Session("txtUsuarioValido")
idProyecto=Session("id_proyecto")

	
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
function abrepopup(){ 
miPopup=window.open("pd_subirArchivoPDF.asp","miwin","width=900,height=600") 
miPopup.focus() 
} 

function verificarArchivo(id){

	pagina="http://economicas.inei.gob.pe/imagenes/CCRRHH/pdf_general/local_op_"+id+".pdf";
	win = window.open(pagina,'','_blank');
		
}

</script>	

</HEAD>
<BODY>
<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
	 <div align="center"> 
     <table width="50%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    <tr>
    	<TD colspan=2 class="aplicacion" bgcolor="#DAE8F3" align="center">Archivo - SEDES OPERATIVAS</TD>
    </tr>
       <tr>
    	<TD colspan="2"  class='etiqueta'><br><iframe width="100%" height="120px" id="archivos" style="border:none;" src="carga_PDF_sEDESoP.asp"></iframe></TD>
       </tr>
       
       <tr>
    	<TD colspan="2"  class='etiqueta' align="center"><input name="button" type="button" class="boton" id="button" value="Verificar" onClick="verificarArchivo(<%=ID_CONVOCATORIACARGO%>)"> </TD>
       </tr>
</table>
    </div>	  
    </form>
</BODY>
</HTML>

