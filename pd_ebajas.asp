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
	Response.Write " <option  value=""99Todos"">Todos</option>"
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

<script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript"  src="js/envio_ajax.js"></script>
<script type="text/javascript"  src="js/valida.js"></script>


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




function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	    var lsUbiProv =document.getElementById("lsubiprov").value;

	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&lsUbiProv="+lsUbiProv;  // parametros a enviar al servidor	
	url="m7_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg").innerHTML ="Cargando......";
				 document.getElementById("nomreg").innerHTML ="Provincia";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("reg").innerHTML =ajax.responseText;
					document.getElementById("nomreg").innerHTML ="Provincia";
					verdis()
            }
            else if(ajax.status==404){
                     document.getElementById("reg").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					 document.getElementById("nomreg").innerHTML ="Provincia";
            }
            else{

                     document.getElementById("reg").innerHTML = ajax.responseText;	
					 document.getElementById("nomreg").innerHTML ="Provincia";				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function verdis(){

    
    var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m61_Distrito.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dis").innerHTML ="Cargando......";
				 document.getElementById("nomdis").innerHTML ="Distrito:";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dis").innerHTML =ajax.responseText;
					document.getElementById("nomdis").innerHTML ="Distrito:";
            }
            else if(ajax.status==404){
                     document.getElementById("dis").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					 document.getElementById("nomdis").innerHTML ="Distrito:";
            }
            else{

                     document.getElementById("dis").innerHTML = ajax.responseText;					 
					 document.getElementById("nomdis").innerHTML ="Distrito:";
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}








</script>
    </head>
    <body>
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Consultas :Estado de Bajas del RRHH</span></div>
<div id="lateral">
        <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_preseleccion.asp">
            <table width='98%' border='0' cellpadding="2" cellspacing="2">
                   
		  <tr>
		    <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios<span class="criterio">
		      <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
		    </span></td>
		    </tr>
		  <tr>
		    <td  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
		      Departamento:&nbsp;</span></td>
		    <td align=left bgcolor="#F7F8F9" id="dpto"><%generaDpto()%></td>
		    </tr>
		  <tr>
		    <td align=right bgcolor="#F7F8F9"><span class="criterio" id="nomreg">Provincia:</span></td>
		    <td align=left bgcolor="#F7F8F9" id="reg"><select class='e_combo' name="txtProv1" id="txtProv1"   style="width:200px; "  >
		      <option  title="Todos" value="9999" >Todos</option>
		      </select></td>
		    </tr>
		  <tr>
		    <td align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdis">Distrito:</span></td>
		    <td align=left bgcolor="#F7F8F9" id="dis"><select class='e_combo' name="txtDist1" id="txtDist1" style="width:200px;"  >
		      <option  title="Todos" value="999999" >Todos</option>
		      </select></span></td>
		    </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><INPUT name='button1' type='button' class="boton" id='button1' onClick="javascript:mosbaja()" value='Aceptar'></td>
              </tr>
            </table>
</form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" style="margin:0;" align="center"><%'call mosbajas("99","99","99") %></div>
		  <div id="deta"></div>
            
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
