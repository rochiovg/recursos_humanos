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
    
    <link rel="shortcut icon" href="images/favicon.ico"/>
    <link rel="stylesheet" href="Styles/main.css" type="text/css"/>
    <link rel="stylesheet" href="themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="Styles/inei.css" type="text/css" >
    <link rel="stylesheet" href="Styles/pro_drop_1.css" type="text/css"/>
    <script src="js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script> 
    <script type="text/javascript" src="js/main.js"></script> 
    <script type="text/javascript" src="js/cliente.js"></script>
    <script type="text/javascript" src="js/envio_ajax.js"></script>
    <script type="text/javascript" src="js/valida.js"></script>
		<script type="text/javascript" src="js/cliente.js"></script>
    <script type="text/javascript" src="js/envio_ajax.js"></script>
    <script type="text/javascript" src="js/valida.js"></script>
    
    <!--
		<script src="js/jquery-1.7.2.js"></script>
    <script src="ui/jquery.ui.core.js"></script>
    <script src="ui/jquery.ui.widget.js"></script>
    <script src="ui/jquery.ui.mouse.js"></script>
    <script src="ui/jquery.ui.button.js"></script>
    <script src="ui/jquery.ui.draggable.js"></script>
    <script src="ui/jquery.ui.position.js"></script>
    <script src="ui/jquery.ui.resizable.js"></script>
    <script src="ui/jquery.ui.dialog.js"></script>
    <script src="ui/jquery.effects.core.js"></script>
    <link rel="stylesheet" href="css/demos.css">
    
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    -->
    
		
    <script type="text/javascript" src="js/modal.js"></script>
    
    <!-- Global stylesheets -->
    <link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
    <link href="assets/css/minified/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- /global stylesheets -->
    
    <!-- Core JS files -->
    <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
    <script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
    <!-- /core JS files -->
   
    
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
				//document.getElementById("aa").innerHTML =ajax.responseText;
				alert('Se publicó correctamente');
				location.reload(true);
				//location.reload();
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

function mostrarPub(proy,id_cc){

	$('#modal_default').modal('show'); 
	
	valores= "proy="+proy+"&id_cc="+id_cc;
	
	var peticion=$.ajax(
		{
	   url:"m_pubResultadosLista.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#tabla_publicaciones").html("Cargando...");
							  },
		success:function (respuesta) {
	          $('#tabla_publicaciones').html(respuesta);
      } ,
      error:function (){alert('Se a producido un Error...'); 
			 $("#tabla_publicaciones").html("");
			 	}
  	  });
			
}


</script>
    </head>
    <body>
    	<div id="top">
			<!--#include file="cabecera.html"-->
	  	<!--#include file="pd_menu.asp"-->
    	</div>
      <div id="formulario" >
      <div id="divNavegacion" align="center"><span class="subtitulo">Publicaci&oacute;n de Resultados</span></div>
    	<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
			<table  width="100%"  border="0" align="center">
  			<tr>
					<td valign=top align=center>
 						<div id="formulario" style="display:block">
							<table width="100%" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  							<tr>
 	      					<th width="1159" bgcolor="#DAE8F3" class="aplicacion">
                  	<span class="dato">
                    <input type="hidden" name="idProyecto" id="idProyecto" value="<%=idProyecto%>" />
                    <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
           					<%=Session("cmeta")&"-"&Session("nmeta")%> - <%=Session("actividad")%>
            				<input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           					</span>
                  </th>
                </tr>
 	       	    </table>
 						</div>	
					</td>
				</tr>	
        <tr>
					<td valign=top align=center>
        	<%
					consulta = "EXEC dbo.cargos_publicaresultados '"&idProyecto&"' " 
					
					Set RsP = Server.CreateObject("ADODB.Recordset")
					RsP.cursorlocation=3
					RsP.Open consulta, MiCone, 3,3 
					If  Not RsP.BOF And Not RsP.EOF Then 
					%>
      			<div id="divCriterio" style="vertical-align:top"; overflow:auto; height:450px;">
       				<table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3">
                <tr bgcolor="#DAE8F3">
                  <td width="5%" align="center" height="38" bgcolor="#CCF4F9">Convocatoria</td>
                  <td width="15%" align="center" height="38" bgcolor="#CCF4F9">Descripci&oacute;n</td>
                  <td width="15%" align="center">Cargo Funcional</td>
                  <td width="6%" align="center" height="38" bgcolor="#CCF4F9">Fecha Inicio</td>
                  <td width="6%" align="center" height="38" bgcolor="#CCF4F9">Fecha Fin</td>
                  <td width="5%" align="center" height="38" bgcolor="#CCF4F9">Estado</td>
                  <td width="10%" align="center" height="38" bgcolor="#CCF4F9">Proximo a Publicar</td>
                  <td width="10%" align="center" height="38" bgcolor="#CCF4F9">Acci&oacute;n</td>
                  <td width="8%" align="center" height="38" bgcolor="#CCF4F9">Publicaciones</td>
                </tr>
          <%
						Do While Not RsP.EOF 
					%>
		  					<tr class='clases'>
                  <td align="center" class='e_td_string1'><%=RsP.Fields("concar")%></td>
                  <td align="left" class='e_td_string1'><%=RsP.Fields("Desc_Convocatoria")%></td>
                  <td align="left" class='e_td_string1'><%=RsP.Fields("desc_CargoFuncional")%></td>
                  <td align="center" class='e_td_string1'><%=RsP.Fields("fechaInicio")%></td>
                  <td align="center" class='e_td_string1'><%=RsP.Fields("fechaFin")%></td>
                  <td align="left" class='e_td_string1'><%=RsP.Fields("des_estado")%></td>
                  <td align="left" class='e_td_string1' id="<%=RsP.Fields("id_concar")%>"><%=RsP.Fields("pro_desc")%></td>
                  <td align="center" class='e_td_string1' valign="middle">
                  <% If RsP.Fields("ind_publicar") = "S" then%>
                  	<img src="images/bpublicar.jpg" width="100" height="30" style="cursor: pointer" 
                     onclick="javascript:publicar(<%=RsP.Fields("pro_publicar")%>,
                     															<%=lsIdusuario%>,
                    															<%=RsP.Fields("id_concar")%>,
                    															<%=999%>)">
                    </img>
                  <% End If%>
                  </td>
                  <td align="center" class='e_td_string1' valign="middle">
							    	<form action="reporte.asp" method="post" target="_blank" id="FormularioExportacion_">
      							<img src="images/publicar.png" width="35" height="30" style="cursor: pointer" title="Ver Publicaciones" 
                     onclick="javascript:mostrarPub(<%=id_proyecto%>,<%=RsP.Fields("id_concar")%>)"/>
      							<input type="hidden" id="datos_a_enviar" name="datos_a_enviar"/>
    								</form>
    							</td>
		    				</tr>
					<% 
              RsP.MoveNext
            Loop	
            RsP.close 
          %>
              </table>
					<%
					else
            response.Write("No existen datos")
          end if 
          %>
      			</div>
        	</td>
				</tr>
			</table>
      </form>
<%
Else
	Response.Redirect("default.asp")
End If
%>
		</div>
    <div id="footer">
       <span>Usuario: <%=lsUsuario%> </span>
    </div>
    
  </body>
  
   <!-- Basic modal -->
  <div id="modal_default" class="modal fade">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        	<h5 class="modal-title" style="text-align:center">Publicaciones para la Convocatoria</h5>
        </div>
        
        <div class="modal-body" id="tabla_publicaciones"></div>
        <div class="modal-footer">
          <button type="button" class="btn btn-link" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
  <!-- /basic modal -->        

</html>

