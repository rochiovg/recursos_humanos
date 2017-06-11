<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 <%session.lcid=2057%>
 <%
 
Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario =  Session("txtUsuarioValido")
idProyecto=Session("id_proyecto")


num_c=Request("num_c")
id=Request("id")
id_CC=Request("id_CC")


consulta1 = "EXEC dbo.pa_listar_idConvocatoriacargo '" & num_c & "' " 

	Set RsP = Server.CreateObject("ADODB.Recordset")
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3
	
	If  Not RsP.BOF And Not RsP.EOF Then	
		ID_CONVOCATORIACARGO=RsP.Fields("ID_CONVOCATORIACARGO")	
	
	else
		ID_CONVOCATORIACARGO = ""	
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
function abrepopup(){ 
miPopup=window.open("pd_subirArchivoPDF.asp","miwin","width=900,height=600") 
miPopup.focus() 
} 

function verificarArchivo(id){

	pagina="http://economicas.inei.gob.pe/imagenes/CCRRHH/pdf_general/local_"+id+".pdf";
	win = window.open(pagina,'','_blank');
		
}

</script>	

</HEAD>
<BODY>
<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
	 <div align="center"> 
     <table width="50%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    <tr>
    	<TD colspan=2 class="aplicacion" bgcolor="#DAE8F3" align="center">Seleccione tipo de Archivo de acuerdo al proceso</TD>
    </tr>

 <tr>
    	<TD   class='etiqueta'> Seleccione Texto:</TD>
        <TD   class='etiqueta'> <input name="txt_textM" id="txt_textM" type="text"><input name="id" id="id" type="hidden" value="<%=id%>">
        <input name="num_c" id="num_c" type="hidden" value="<%=num_c%>">
        <input name="id_CC" id="id_CC" type="hidden" value="<%=id_CC%>">
        </TD>
        
       </tr>
       
       
       <tr>
    	<TD colspan="2"  class='etiqueta'><br><iframe width="100%" height="120px" id="archivos" style="border:none;" src="carga_PDF_Locales.asp?id_cc=<%=ID_CONVOCATORIACARGO%>&valor=0&id=<%=id%>"></iframe></TD>
       </tr>
       
       <tr>
    	<TD colspan="2"  class='etiqueta' align="center"><input name="button" type="button" class="boton" id="button" value="Verificar" onClick="verificarArchivo(<%=ID_CONVOCATORIACARGO%>)"> </TD>
       </tr>
</table>
    </div>	  
    </form>
</BODY>
</HTML>

