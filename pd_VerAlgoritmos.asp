<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
id_usuario=Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
lsUbigeoDist = Session("UbigeoDist") 
id_proyecto=session("id_proyecto")

ipVisitante = Request.ServerVariables("REMOTE_ADDR")


sub generaAlgoritmo()
			

	set wRsDptoapli = Micone.execute(" exec dbo.PA_ALGORITMO_LISTAR '"&id_proyecto&"'  ")

	Response.Write "<select class=""e_combo"" style=""width:250px"" id=""cmbCargo"" name=""cmbCargo"" onchange=""Guardarvalor(this.value);"">"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
Response.Write "<option title="""&wRsDptoapli(1)&""" value=""" &wRsDptoapli(2)&"*"&wRsDptoapli(3)&"*"&wRsDptoapli(4)&"*"&wRsDptoapli(5)&"*"&wRsDptoapli(6)& """>Convocatoria: "&wRsDptoapli(0)&" - "&wRsDptoapli(1) & "</option>"
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

function Guardarvalor(valor){
	var acargo = valor;
	var lcargo=acargo.split("*");
	var id_Conv=lcargo[2];
	
	ajax=http_request();
	var valores;	
	valores= "id_Conv=" + escape(id_Conv);  // parametros a enviar al servidor	
	
	url="m_verAlgoritmo.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("Contenido").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("Contenido").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("Contenido").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("Contenido").innerHTML = ajax.responseText;	
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
       <div id="divNavegacion" align="center"><span class="subtitulo"><%=Session("cmeta")&"-"&Session("nmeta")%> </span></div>
       <table width="50%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <thead><tr>
 	      <th colspan=5 bgcolor="#DAE8F3" class="aplicacion">
</th>
 	    
          <tr>
 	        <td colspan="2"  class="titulo">ALGORITMOS DE EVALUACI&Oacute;N DE CVs<BR>
 	          Busqueda de cargos convocados
 	            <input type="hidden" name="id_proyecto" id="id_proyecto" value="<%=id_proyecto%>" />
            <input type="hidden" name="id_usuario" id="id_usuario" value="<%=id_usuario%>" />
            <input type="hidden" name="ipVisitante" id="ipVisitante" value="<%=ipVisitante%>" />
            
            <input type="hidden" name="id_proy" id="id_proy" value="" />
            <input type="hidden" name="id_Pre" id="id_Presupuesto" value="" />
            <input type="hidden" name="id_cc" id="id_cc" value="" />
            
            <input type="hidden" name="txtprofesionesTot" id="txtprofesionesTot" value="" />
            <input type="hidden" name="txtExp1" id="txtExp1" value="" />
            <input type="hidden" name="txtExp2" id="txtExp2" value="" /></td>
    </tr>

           

         </thead>
         <tbody>
         </tbody>    
                <tfoot>  
                <tr>
			 <td width="23%" align="center" id="prueba" >Cargo: </td>
			 <td width="77%" align="left" id="prueba" ><font class='alerta5' ><%generaAlgoritmo()%>
			 </font>&nbsp;</td>
			 </tr>
          </tfoot>
    </table>
    <div  id="Contenido">    
   </div>
    <br>
    <br>
      

</body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
