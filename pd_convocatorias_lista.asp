<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%

Response.ContentType="text/html; charset=iso-8859-1"


Response.Expires = 0

idProyecto=Session("id_proyecto")

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsIdusuario = Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoApli = Session("Ubigeoapli") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")


If lsUbigeo <> "" Then




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
         <title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>
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

function publicar(valor, usuario, id_cc, id_pres){
	var agree=confirm("Esta seguro de publicar resultados para esta etapa?");
if (agree){

	id_proyecto=document.getElementById("idProyecto").value;
	
	ajax=http_request();
	var valores;	
	valores= "valor=" + escape(valor)+"&usuario="+usuario+"&id_cc="+id_cc+"&id_pres="+id_pres+"&id_proyecto="+id_proyecto+"&lsTipo=78";
	url="m_ingreso.asp";  

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("aa").innerHTML =ajax.responseText;
			 
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				document.getElementById("aa").innerHTML =ajax.responseText;
				alert('Se guardo correctamente');
				location.reload();
            }
            else if(ajax.status==404){
				document.getElementById("aa").innerHTML =ajax.responseText;

            }
            else{			
			document.getElementById("aa").innerHTML =ajax.responseText;
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}
else
	return false ;
	}


function grabar_Observacion(id_cc,valor)
{

	ajax=http_request();
	var valores;	
	valores= "id_cc=" + id_cc+"&valor="+escape(valor)+"&lsTipo=79";  // parametros a enviar al servidor	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
		 
         if (ajax.readyState==1) {
			
                 document.getElementById('t'+id_cc+'').innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					  
					document.getElementById('t'+id_cc+'').innerHTML =ajax.responseText;
				

            }
            else if(ajax.status==404){
                     document.getElementById('t'+id_cc+'').innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                    	document.getElementById('t'+id_cc+'').innerHTML =ajax.responseText;
				
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	
   return;	 
	}


function verPrePublicacion(id_cc, etapa){

 pagina = "m_resultadosPrePub.asp?id=" + id_cc + "&etapa=" + etapa;
    win = window.open(pagina, '', 'width=790,height=350,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
	
}

function verPublicado(id_cc, etapa){

 pagina = "m_resultadosPub.asp?id=" + id_cc + "&etapa=" + etapa;
    win = window.open(pagina, '', 'width=790,height=350,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
	
}

</script>
    </head>
    <body>
        <div id="top"><!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

    </div>
    <div id="formulario" >
	  <div id="divNavegacion" align="center"><span class="subtitulo">Procesos: Publicaci&oacute;n de Resusltados</span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
  <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">
   
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <tr>
 	      <th width="1159" bgcolor="#DAE8F3" class="aplicacion"><span class="dato">
 	        <input type="hidden" name="idProyecto" id="idProyecto" value="<%=idProyecto%>" />
 	        <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%> - <%=Session("actividad")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           </span></th></tr>
 	      
 	    </table>
 	</div>	
		</td>
	</tr>	
    
      <tr>
		<td valign=top align=center>
        <% 		consulta = "EXEC dbo.cargos_publicaresultados '"&idProyecto&"' " 
		
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta, MiCone, 3,3 
		If  Not RsP.BOF And Not RsP.EOF Then 
		%>
        
              				    	    				    
  
	
      <div id="divCriterio" style="vertical-align:top; overflow:auto; height:400px;" >
       <table width='75%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3">
		  <tr bgcolor="#DAE8F3">
		    <td width="14%" height="38">Convocatoria</td>
		    <td width="42%">Cargo</td>
		    <td width="9%" style="display:none">Preselecci&oacute;n</td>
		    <td width="15%" align="center">Aprobaron CV</td>
		    <td width="15%" align="center">Prueba Conocimientos</td>
		    <td width="15%" align="center">Seleccionado</td>
            <td width="9%" id="aa">Observaci&oacute;n</td>
		    </tr>
            
            <%Do While Not RsP.EOF %>
		  <tr  class='clases'>
		    <td class='e_td_string1'><%=RsP.Fields("num_Convocatoria")%></td>
		    <td align="left" class='e_td_string1'><%=RsP.Fields("desc_CargoFuncional")%> (<%=RsP.Fields("Desc_Carg")%>) </td>

            <td align="center" style="display:none">&nbsp;<input type="checkbox" style="display:<%=verp%>"  name="chk_presel" id="chk_presel" value="2" <% if RsP.Fields("totPre") >"0" then response.Write("checked=""checked"" disabled=""disabled""") end if %> onclick="publicar(this.value, <%=lsIdusuario%>, <%=RsP.Fields("id_convocatoriaCargo")%>,<%=RsP.Fields("Id_Presupuesto")%> )"></td>            
            <%
		
			verp="block"	
			verc="block"		

				
			%>
		    <td align="center"  width="15%" >
            <input type="checkbox" name="chk_evalCV" id="chk_evalCV" value="1" <% if RsP.Fields("totEval") >"0" then response.Write("checked=""checked"" disabled=""disabled""") end if %> onclick="publicar(this.value, <%=lsIdusuario%>, <%=RsP.Fields("id_convocatoriaCargo")%>,<%=RsP.Fields("Id_Presupuesto")%> )"><br>
            <a href="#" class="titulo3" title="Consulta de Datos Cargados al SIGA" onClick="javascript:verPrePublicacion('<%=RsP.Fields("id_convocatoriaCargo")%>','1')"><img src='images/puntoR4_.jpg' border=0></a>&nbsp;&nbsp;&nbsp;
             <a href="#" class="titulo3" title="Consulta de Datos Cargados al SIGA" onClick="javascript:verPublicado('<%=RsP.Fields("id_convocatoriaCargo")%>','1')"><img src='images/punto4.jpg' border=0></a>
            </td>
		    <td align="center"  width="15%" >
            <input type="checkbox" name="chk_AsisCap" id="chk_AsisCap" value="3" <% if RsP.Fields("totAsisC") >"0" then response.Write("checked=""checked"" disabled=""disabled""") end if %> onclick="publicar(this.value, <%=lsIdusuario%>, <%=RsP.Fields("id_convocatoriaCargo")%>,<%=RsP.Fields("Id_Presupuesto")%> )"><br>
            <a href="#" class="titulo3" title="Consulta de Datos Cargados al SIGA" onClick="javascript:verPrePublicacion('<%=RsP.Fields("id_convocatoriaCargo")%>','3')"><img src='images/puntoR4_.jpg' border=0></a>&nbsp;&nbsp;&nbsp;
            <a href="#" class="titulo3" title="Consulta de Datos Cargados al SIGA" onClick="javascript:verPublicado('<%=RsP.Fields("id_convocatoriaCargo")%>','3')"><img src='images/punto4.jpg' border=0></a>
            </td>
            <td align="center" >
            <input type="checkbox" name="chk_Selec" id="chk_Selec" value="4" <% if RsP.Fields("totSelec") >"0" then response.Write("checked=""checked"" disabled=""disabled""") end if %> onclick="publicar(this.value, <%=lsIdusuario%>, <%=RsP.Fields("id_convocatoriaCargo")%>,<%=RsP.Fields("Id_Presupuesto")%> )"> <br>
              <a href="#" class="titulo3" title="Consulta de Datos Cargados al SIGA" onClick="javascript:verPrePublicacion('<%=RsP.Fields("id_convocatoriaCargo")%>','4')"><img src='images/puntoR4_.jpg' border=0></a>&nbsp;&nbsp;&nbsp;
                <a href="#" class="titulo3" title="Consulta de Datos Cargados al SIGA" onClick="javascript:verPublicado('<%=RsP.Fields("id_convocatoriaCargo")%>','4')"><img src='images/punto4.jpg' border=0></a>
            </td>
            <td align="center" id="t<%=RsP.Fields("id_convocatoriaCargo")%>"><span class="e_td_string1">
              <input name="txt<%=RsP.Fields("id_convocatoriaCargo")%>" id="txt<%=RsP.Fields("id_convocatoriaCargo")%>" type="text" size="50" value="<%=RsP.Fields("observacion")%>" class="etiqueta"  onblur="javascript:grabar_Observacion('<%=RsP.Fields("id_convocatoriaCargo")%>',this.value)" />
            </span></td>
		    </tr>
            <% 
		RsP.MoveNext
		Loop	
		RsP.close %>
	    </table>
        <%else
		response.Write("No existen datos")
		end if 
		%>
      </div>
        </td>
	</tr>
</table></form>
    <%Else
Response.Redirect("default.asp")
End If%>    

</div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>

        <!-- scripts -->
    </body>
</html>

