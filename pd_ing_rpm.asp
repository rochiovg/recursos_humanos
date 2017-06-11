<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 

id_Proyecto=Session("id_proyecto")

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargo_RPM '"&id_Proyecto&"' ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub
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
				 document.getElementById("nomreg").innerHTML ="Provincia:";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("reg").innerHTML =ajax.responseText;
					document.getElementById("nomreg").innerHTML ="Provincia:";
            }
            else if(ajax.status==404){
                     document.getElementById("reg").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					 document.getElementById("nomreg").innerHTML ="Provincia:";
            }
            else{

                     document.getElementById("reg").innerHTML = ajax.responseText;	
					 document.getElementById("nomreg").innerHTML ="Provincia:";				 
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
         <div id="top" >    
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

  </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Registro: Registro del RPM de la RTA y RAO</span></div>      
  <div id="lateral">
                 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_consultas.asp">
                   <table width='101%' border='0' cellpadding="2" cellspacing="2">
                     <tr>
                       <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios</td>
                     </tr>
                     <tr>
                       <td width="28%"  align="right" bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
                         <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                         Departamento:&nbsp;</span></td>
                       <td width="72%" align="left" bgcolor="#F7F8F9" id="dpto"><%generaDpto()%></td>
                     </tr>
                     <tr>
                       <td align="right" bgcolor="#F7F8F9"><span class="criterio" id="nomreg">Provincia:</span></td>
                       <td align="left" bgcolor="#F7F8F9" id="reg"><select class='e_combo' name="txtProv1" id="txtProv1"   style="width:200px; "  >
                         <option  title="Todos" value="9999" >Seleccione..</option>
                       </select>
                         <span class="alerta5">(*)</span></td>
                     </tr>
                     <tr>
                       <td align="right" bgcolor="#F7F8F9"><span class="criterio" id="nomdis">Distrito:</span></td>
                       <td align="left" bgcolor="#F7F8F9" id="dis"><select class='e_combo' name="txtDist1" id="txtDist1" style="width:200px;"  >
                         <option  title="Todos" value="999998" >Seleccione..</option>
                       </select>
                         <span class="alerta5">(*)</span></td>
                     </tr>
                     <tr>
                       <td align="right" bgcolor="#F7F8F9"><span class="criterio">Cargo  :</span></td>
                       <td align="left" bgcolor="#F7F8F9" id="dpto4"><%generaCargo()%>
                         <span class="alerta5">(*)</span></td>
                     </tr>
                     <tr>
                       <td height="4" colspan="4" align="center" bgcolor="#F7F8F9"><input name='button1' type='button' class="boton" id='button1' onclick="javascript:enviar_consultaFono()" value='Aceptar' /></td>
                     </tr>
                   </table>
                 </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
            <div id="mostar_detalle2" style="display:none"  >
                <table width="100%" border="0">
				  <tr>
				    <td align="center"><form action="reporte.asp" method="post" target="_blank" id="FormularioExportacion">
                      <div align="center" style="padding:5px,5px,5px,5px;"><img src="images/excell1.gif" alt="" class="botonExcel" title="EXPORTAR A EXCEL" /></div>
                      <input type="hidden" id="datos_a_enviar" name="datos_a_enviar" />
                    </form></td>
			      </tr>
				  <tr>
				    <td align="center"><span class="criterio">(Exportar Excel)</span></td>
			      </tr>
			    </table></div>
          <div id="divDetallem" style="width:100%; height:340px; overflow:auto; float: left ; position: inherit; vertical-align:top;"> </div>
              
               <div id="deta" style="width:100%; float:left; position:inherit;  vertical-align:top;"> </div>
            <div id="mensa" style="width:100%; float:left; position:inherit; vertical-align:top;"> </div>
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
