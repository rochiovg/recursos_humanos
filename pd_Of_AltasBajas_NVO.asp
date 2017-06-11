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

function ingresar_Oficio (valor, Freg, Fexec, cenvdatos ){
	var agree=confirm("Esta seguro de Actualizar los datos del Oficio de Altas y bajas?");
	if (agree){
	
	var oficio=document.getElementById("txt"+valor).value;
	var fecha=document.getElementById("txt"+valor+"A").value;
	
	if (oficio=='A/B' || oficio=='' || oficio.length<10){
		alert('Ingreso Incorrecto, registre segun formato');
		document.getElementById("txt"+valor).focus();
		return false;
	}
	if (fecha='' || fecha.length<10){
		alert('Ingreso Incorrecto, registre segun formato');
		document.getElementById("txt"+valor+'A').focus();
		return false;
	}

   fecha=document.getElementById("txt"+valor+"A").value;
   
	ajax=http_request();
	var valores;
	valores="oficio="+escape(oficio)+"&fecha="+fecha+"&Freg="+escape(Freg)+"&Fexec="+escape(Fexec)+"&cenvdatos="+escape(cenvdatos)+"&lsTipo=176"
	
	url="m_ingreso.asp";
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				alert('Se guardo correctamente');
				document.getElementById("prueba"+valor).innerHTML =ajax.responseText;
				//location.reload();
            }
            else if(ajax.status==404){

            }
            else{			
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	}
	else
	return false;
}


function verPEA_AB(fec_reg, fec_exec)
{		
	 			
 pagina = "pd_peaAB_nvo.asp?fec_reg=" + fec_reg+"&fec_exec="+ fec_exec;
	win = window.open(pagina,'','width=600,height=800,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function verContadorCarga_SIGA_AB(cenvdatos, tipoProceso) {

    pagina = "pd_ContadorCargaAB.asp?cenvdatos=" + cenvdatos + "&tipoProceso=" + tipoProceso;
    win = window.open(pagina, '', 'width=790,height=350,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}


</script>
    </head>
    <body>
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
    <div id="formulario" >
	  <div id="divNavegacion" align="center"><span class="subtitulo">Procesos: Registro de Of.  Altas y Bajas</span></div><form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
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
 	</div>	

        <% 		consulta = "EXEC dbo.uspget_OficioAltas_nvo '"&idProyecto&"' " 
		
				'response.Write("consulta="&consulta)
		
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta, MiCone, 3,3 
		If  Not RsP.BOF And Not RsP.EOF Then 
		%>
        
  
	</form>
      <div id="divCriterio" style="vertical-align:top; overflow:auto; height:400px;" >
      <br>
       <table width='75%' border="1" cellpadding="2" align="center" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3">
       
       <tr bgcolor="#DAE8F3">
		    <td colspan="8" id="prueba" align="center" class="aplicacion">Altas por fecha de Registro y Ejecuci&oacute;n</td>
		    </tr>

		  <tr bgcolor="#DAE8F3">
		    <td width="05%">Nro.</td>
		    <td width="15%">Fecha Registro</td>
		    <td width="15%">Fecha Ejecuci&oacute;n</td>
            <td width="15%">CENVDATOS</td>            
		    <td width="10%">PEA<br>Asociada</td>
		    <td width="14%">Resoluci&oacute;n</td>
		    <td width="9%">Fecha de Resoluci&oacute;n</td>
            <td width="9%">Actualizar</td>
		    </tr>
            
            <% registro=0
            Wcenvdatos = RsP.Fields("cenvdatos")
            Sw = 0
            wTotalPEA = 0
            
			Do While Not RsP.EOF 
			cont=registro+1

            If Wcenvdatos <> RsP.Fields("cenvdatos") Then 
                Wcenvdatos = RsP.Fields("cenvdatos")
                Sw = 0
                wTotalPEA = 0
            End If

            'wTotalPEA = wTotalPEA  + RsP.Fields("total") 
			
			%>
		  <tr  class='clases'>
		    <td class='e_td_string1'><%=cont%></td>
		    <td align="left" >&nbsp;<%=RsP.Fields("fec_reg1")%></td>
            <td align="center">&nbsp;<%=RsP.Fields("fec_exec1")%></td>

            <td >&nbsp;<%=RsP.Fields("cenvdatos")%>&nbsp;&nbsp;
            <%If Sw = 0 and not(isnull(RsP.Fields("cenvdatos")))  Then %> 
                <a href="#" class="titulo3" title="Consulta de Datos Cargados al SIGA" onClick="javascript:verContadorCarga_SIGA_AB('<%=RsP.Fields("cenvdatos")%>','2')"><img src='images/punto4.jpg' border=0></a>
                <%Sw = 1
            End If%>
            </td> 

            <%if isnull(RsP.Fields("fec_exec1")) then %>
            <td align="center">&nbsp;<%=RsP.Fields("total")%></td>
            <%else%>          
		    <td align="center">&nbsp;<a href="#" class="titulo3" onClick="javascript:verPEA_AB('<%=RsP.Fields("fec_reg1")%>','<%=RsP.Fields("fec_exec1")%>')"><%=RsP.Fields("total")%></a></td>
            <%end if%>
		    <td align="center"><span class="e_td_string1">
		      <input name="txt<%=cont%>" id="txt<%=cont%>" maxlength="23" type="text" size="50" value="<%=RsP.Fields("oficio")%>" class="etiqueta"  />
		    </span></td>
            <td align="center"><span class="e_td_string1">
              <input name="txt<%=cont%>A" id="txt<%=cont%>A" maxlength="10" type="text" size="15" value="<%=RsP.Fields("fecha_oficio")%>" onKeyUp="this.value=formateafecha(this.value);" class="etiqueta"  />
            </span></td>
            <%if RsP.Fields("oficio")="A/B" then%>
            
            
		 <td  align="center" id="prueba<%=cont%>" ><img src="images/ok.gif" width="15" height="14" onclick="ingresar_Oficio('<%=cont%>','<%=RsP.Fields("fec_reg1")%>', '<%=RsP.Fields("fec_exec1")%>', '<%=RsP.Fields("cenvdatos")%>')"/></td>
			<%else%>
		<td  align="center" ><img src="images/ok2.gif" width="15" height="14" /></td>
			<%end if %>
          
	     </tr>
            <% 
		RsP.MoveNext
		registro = registro + 1
		Loop	
		RsP.close %>
	    </table>
        <%else
		response.Write("No existen datos")
		end if 
		%>

        </td>
	</tr>

	</table>   
    <%Else
Response.Redirect("default.asp")
End If%>    
      </div>
</div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>

        <!-- scripts -->
    </body>
</html>

