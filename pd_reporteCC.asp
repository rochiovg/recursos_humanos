 <%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%

Response.ContentType="text/html; charset=iso-8859-1"


Response.Expires = 0

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsIdusuario = Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoApli = Session("Ubigeoapli") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")
idProyecto=Session("id_proyecto")

sub generaAnio()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.pa_anio_cc  "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtAnio"" name=""txtAnio"" onChange=""generaMeta(this.value)"" >"
	Response.Write " <option  value=""0"">Todos</option>"
	While not wRsDptoapli.EOF
	if wRsDptoapli(1) ="1"  then
	Response.Write "<option selected value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(0) & "</option>"
	else 
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(0) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
         <title>..::Sistema de Consecuci&oacute;n de RRHH ::..</title>
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


<script>

function generaMeta(valor){
	ajax=http_request();
	var valores;	
	valores= "valor=" + escape(valor);  // parametros a enviar al servidor	
	
	url="m_metaCC.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("td_meta").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("td_meta").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("td_meta").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("td_meta").innerHTML = ajax.responseText;	
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

    <div id="formulario" >
	  <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
 	<div id="formulario" style="display:block">
   
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <tr>
 	      <th width="1159" bgcolor="#DAE8F3" class="aplicacion"><span class="dato">
 	        <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%> - <%=Session("actividad")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           </span></th>
        </tr>
      </table>
      <table style="width:98%">
      	<tr>
        	<td>A&ntilde;o Convocatoria</td>
            <td><% generaAnio() %></td>
            <td>Mes Convocatoria</td> 
            <td> <select class="e_combo" style="width:200px" id="txtAnio" name="txtAnio" >
                    <option  value="0">Todos</option>
                    <option  value="1">Enero</option>
                    <option  value="2">Febrero</option>
                    <option  value="3">Marzo</option>
                    <option  value="4">Abril</option>
                    <option  value="5">Mayo</option>
                    <option  value="6">Junio</option>
                    <option  value="7">Julio</option>
                    <option  value="8">Agosto</option>
                    <option  value="9">Septiembre</option>
                    <option  value="10">Octubre</option>
                    <option  value="11">Noviembre</option>
                    <option  value="12">Diciembre</option>
             	</select>
        	</td>
        </tr>
        
        <tr>
        	<td>Meta</td>
            <td><% generaAnio()%></td>
            <td id="td_meta">Mes Convocatoria</td> 
            <td> <select class="e_combo" style="width:200px" id="txtAnio" name="txtAnio" >
                    <option  value="0">Todos</option>
                    <option  value="1">Enero</option>
                    <option  value="2">Febrero</option>
                    <option  value="3">Marzo</option>
                    <option  value="4">Abril</option>
                    <option  value="5">Mayo</option>
                    <option  value="6">Junio</option>
                    <option  value="7">Julio</option>
                    <option  value="8">Agosto</option>
                    <option  value="9">Septiembre</option>
                    <option  value="10">Octubre</option>
                    <option  value="11">Noviembre</option>
                    <option  value="12">Diciembre</option>
             	</select>
        	</td>
        </tr>
       
      </table>
      
 	</div>	

<% 		'consulta = "EXEC dbo.uspget_OficioAltas '"&idProyecto&"' " 
		
		'Set RsP = Server.CreateObject("ADODB.Recordset")
		'RsP.cursorlocation=3
		'RsP.Open consulta, MiCone, 3,3 

		%>
        
  
	</form>
      <div id="divCriterio">

      
      </div>
</div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>

        <!-- scripts -->
    </body>
</html>

