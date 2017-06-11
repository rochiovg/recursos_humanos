<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%


sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargo ""1,2,3"" ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='"&wRsDptoapli(4)&" - Actividad: "&wRsDptoapli(5)&"'   value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub
 
sub generaDpto()
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD_UBI '"&lsUbigeo&"'"
	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option  value=""99"">Seleccione</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


Response.Expires = 0

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoApli = Session("Ubigeoapli") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")


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

	
	url="m62_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov").innerHTML =ajax.responseText;
					
            }
            else if(ajax.status==404){
                     document.getElementById("prov").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}



function mostrar(){

	
var depa =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
var prov =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
var cargo =document.getElementById("cmbCargo").options[document.getElementById("cmbCargo").selectedIndex].value;

if (depa == '99')
{ alert ("Seleccione el departamento");
return false
	}
	
if (prov == '9999TODOS')
{ alert ("Seleccione la Provincia");
return false
	}
	
if (cargo == '0')
{ alert ("Seleccione el Cargo");
return false
	}
	
	
	ajax=http_request();
	var valores;	
	valores= "depa=" + escape(depa)+"&prov="+escape(prov)+"&cargo=" + escape(cargo);  // parametros a enviar al servidor	
	
	url="m_meta.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML =ajax.responseText;
					
            }
            else if(ajax.status==404){
                 alert(url);    document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	


}



function guardar(div,id,valor,tipo){
	
	ajax=http_request();
	var valores;	
	valores= "div=" + escape(div)+"&id=" + escape(id)+"&valor=" + escape(valor)+"&lsTipo=14&stipo="+tipo;  // parametros a enviar al servidor	
		

		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById(div).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById(''+div+'').innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                      document.getElementById(''+div+'').innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById(''+div+'').innerHTML = ajax.responseText;	
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
<div id="divNavegacion" align="center"><span class="subtitulo">Registro: Meta de RRHH a Reclutar</span></div>
        <div id="lateral">
            <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
      <table width='330' border='0' cellpadding="2" cellspacing="2">
      <tr>
        <td colspan="2"  align="left" bgcolor="#F7F8F9"><span class="criterio"> <span class="alerta5">(*)</span></span><span class="proyecto">Campo Obligatorio</span></td>
      </tr>
      <tr>
        <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Departamento:</span></td>
        <td bgcolor="#F7F8F9" class='criterio'><%generaDpto()%>  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>"></td>
      </tr>
      <tr>
        <td bgcolor="#F7F8F9" align="right"><span class="criterio">Provincia:</span></td>
        <td bgcolor="#F7F8F9" class='criterio' id="prov"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
          <option id="txtProv1" value="9999" > Seleccione </option>
        </select>
          <span class="alerta5">(*)</span></td>
      </tr>
      <tr>
        <td  align="right" bgcolor="#F7F8F9" ><span class="criterio">Cargo:</span></td>
        <td bgcolor="#F7F8F9" class='criterio' > <%generaCargo()%>
          <span class="alerta5">(*)</span></td>
      </tr>
      <tr height=22>
        <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                            name='button1'  type='button' class="boton" 				
                            id='button1' 
                            onClick="javascript:mostrar()" 
                            value='Aceptar'></td>
      </tr>
    </table>
    </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="detalle_local" style="height:360px; overflow:auto;"></div>
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
