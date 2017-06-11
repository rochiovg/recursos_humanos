<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
 <%session.lcid=2057%>
<%
Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 

id_proyecto=session("id_proyecto")

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargo2 ""1,2,3"", '"&id_proyecto&"' ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title=""" &wRsDptoapli(1) & """ value=""" &wRsDptoapli(2)& wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub
sub generaDpto()
		Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD "
	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
		
	Response.ContentType="text/html; charset=iso-8859-1"
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto"" name=""txtDpto"" onChange=""generaprov();"">"
	Response.Write " <option id=""0"" value=""0"">Seleccione...</option>"
	Response.Write " <option id=""0"" value=""99Departamentales"">Departamentales ... </option>"
	Response.Write " <option id=""0"" value=""98Provinciales"">Provinciales ... </option>"
	Response.Write " <option id=""0"" value=""97Distritales"">Distritales ... </option>"

		While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

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
     
    var varDpto =document.getElementById("txtDpto").options[document.getElementById("txtDpto").selectedIndex].value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m62_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("reg").innerHTML =ajax.responseText;
				
            }
            else if(ajax.status==404){
                     document.getElementById("reg").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("reg").innerHTML = ajax.responseText;	
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
<div id="divNavegacion" align="center"><span class="subtitulo"><%=Session("cmeta")&"-"&Session("nmeta")%> -<%=Session("actividad")%></span></div><br>   
<div id="divNavegacion" align="center"><span class="subtitulo">Estad&iacute;sticas: Pol&iacute;tico administrativa</span></div>      
  <div id="lateral">
<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_consultas.asp">  
            <table width='100%' border='0'>
	         
	     


              <tr>
                <td height="4" align="right" bgcolor="#EFF5FA"><span class="criterio">Departamento:</span></td>
                <td height="4" align="left" bgcolor="#EFF5FA"><%generaDpto()%>
                <input name="txtrol" type="hidden" id="txtrol" value="<%=lsRol%>"></td>
              </tr>
              <tr>
                <td height="4" align="right" bgcolor="#EFF5FA"><span class="criterio">Provincia:</span></td>
                <td height="4" align="left" bgcolor="#EFF5FA" id="reg"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px; "  >
                  <option   value="9999TOTAS" >Seleccione...</option>
                </select></td>
              </tr>
              <tr>
                <td height="4" align="right" bgcolor="#EFF5FA"><span class="criterio">Cargo:</span></td>
                <td height="4" align="left" bgcolor="#EFF5FA"><%generaCargo()%></td>
              </tr>
              <tr>
                <td height="4" colspan="2" align="left" bgcolor="#EFF5FA">
                </td>
              </tr>
              <tr>
                <td colspan="2" height="4" align=center bgcolor="#EFF5FA">
						<INPUT 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onClick="javascript:enviarMeta_APLI_esta()" 
                        value='Aceptar'>
				</td>
              </tr>
            </table>
    </form>	
    </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
            	<div id="icono" style="margin:5px 45px; padding-right:250px; display:none" align="right">
<img src="images/excell1.gif" title="EXPORTAR A EXCEL"  onclick="expoEsta()" />
</div> 		
 		 
    <div class="mensaje1" id="mensaje" style="top:0; margin-top:0; height:330px; overflow:auto;" ></div>
	
	<div  id="reporte" ></div>			
 
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
