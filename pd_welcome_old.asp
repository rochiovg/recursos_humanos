<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 

<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
id_proyecto=  Session("id_proyecto")

If lsUbigeo <> "" then
varPerfil  = "01"

%>
<html>
<head>
   <link rel="shortcut icon" href="images/favicon.ico" />

<title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet" type="text/css" href="Styles/inei.css">
<LINK type="text/css" rel="stylesheet" href="css/presentacion.css">
<link rel="stylesheet" type="text/css" href="css/estilos.css" />
<!-- link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" -->
<!-- Latest compiled and minified CSS -->
<!-- link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" -->
<script type="text/javascript" src="js/tabpane.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.qtip.js"></script>
<script type="text/javascript" src="js/admin_core.js"></script>
<script type="text/javascript" src="js/fg.menu.js"></script>
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/function_mapa.js"></script>
<script type="text/javascript" src="js/tooltip_m.js"></script>
<LINK type="text/css" rel="stylesheet" href="css/monitor.css">
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="assets/js/pages/components_modals.js"></script>



<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="assets/css/minified/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/minified/core.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/minified/components.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/minified/colors.min.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
	<script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script type="text/javascript" src="assets/js/plugins/notifications/bootbox.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/notifications/sweet_alert.min.js"></script>
	<script type="text/javascript" src="assets/js/core/app.js"></script>
	<script type="text/javascript" src="assets/js/pages/components_modals.js"></script>
	<!-- /theme JS files -->


	<script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
	<script type="text/javascript" src="assets/js/pages/datatables_basic.js"></script>


<script language="javascript">

$(document).ready(function() {
	$(".botonExcel").click(function(event) {
	dpto="99";
	cargo= document.getElementById("txttipo").value;
	pagina = "m_esta_rep.asp?lsDPTO="+escape(dpto)+"&lsRol="+escape(cargo)+"&tipo="+escape(tipo);
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
	
	


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


function mapaDpto() { 
	
	var cargo= document.getElementById("txttipo").value;
	var ambito= document.getElementById("txtAmbito").value;
	
	var cc = cargo.split("*");
	var tipo = cc[0];
	var id_presupuesto = cc[1];
	var id_cc =  cc[2];
	
				
	ajax=http_request();
	var valores;	
	valores= "id_cc="+escape(id_cc)+'&ambito='+ambito;  // parametros a enviar al servidor	
	
	url="m_esta.asp";  
//	if (tipo==2){url="m_esta_ece_dist.asp";  }
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divSup").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){							
				document.getElementById("divSup").innerHTML =ajax.responseText;
				document.getElementById("excel").style.display="block";
            }
            else if(ajax.status==404){
               document.getElementById("divSup").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
               document.getElementById("divSup").innerHTML = ajax.responseText;	 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	return;			
	
}



function verProvincias (id_cc, ccdd, dpto){
	
	var ambito= document.getElementById("txtAmbito").value;
	
	ajax=http_request();
	var valores;	
	valores= "id_cc="+escape(id_cc)+"&ccdd="+escape(ccdd)+'&dpto='+dpto+'&ambito='+ambito;  // parametros a enviar al servidor	
	
	url="m_esta_prov.asp";  
//	if (tipo==2){url="m_esta_ece_dist.asp";  }
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divSup").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){							
				document.getElementById("divSup").innerHTML =ajax.responseText;
				document.getElementById("excel").style.display="block";
            }
            else if(ajax.status==404){
               document.getElementById("divSup").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
               document.getElementById("divSup").innerHTML = ajax.responseText;	 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	return;	
}




function verDistritos (id_cc, ccdd, ccpp, dpto, prov){
	
	var ambito= document.getElementById("txtAmbito").value;
	
	ajax=http_request();
	var valores;	
	valores= "id_cc="+escape(id_cc)+"&ccdd="+escape(ccdd)+"&ccpp="+escape(ccpp)+'&dpto='+dpto+'&prov='+prov+'&ambito='+ambito;  // parametros a enviar al servidor	
	
	url="m_esta_dist.asp";  
//	if (tipo==2){url="m_esta_ece_dist.asp";  }
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divSup").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){							
				document.getElementById("divSup").innerHTML =ajax.responseText;
				document.getElementById("excel").style.display="block";
            }
            else if(ajax.status==404){
               document.getElementById("divSup").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
               document.getElementById("divSup").innerHTML = ajax.responseText;	 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	return;	
}


function verZonas (id_cc, ccdd, ccpp, ccdi, dpto, prov, dist){
	
	var ambito= document.getElementById("txtAmbito").value;

	if (ambito==1){
		ajax=http_request();
		var valores;	
		valores= "id_cc="+id_cc+"&ccdd="+ccdd+"&ccpp="+ccpp+"&ccdi="+ccdi+'&dpto='+escape(dpto)+'&prov='+escape(prov)+'&dist='+escape(dist);  // parametros a enviar al servidor	
		
		url="m_esta_zona.asp";  
	//	if (tipo==2){url="m_esta_ece_dist.asp";  }
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
					 document.getElementById("divSup").innerHTML ="<span class=etiqueta>Cargando......</span>";
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){							
					document.getElementById("divSup").innerHTML =ajax.responseText;
					document.getElementById("excel").style.display="block";
				}
				else if(ajax.status==404){
				   document.getElementById("divSup").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else{
				   document.getElementById("divSup").innerHTML = ajax.responseText;	 
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		return;	
	}
	else {
		verSeccion (id_cc, ccdd, ccpp, ccdi, '0', dpto, prov, dist)	
	}
	
	
}

function verSeccion (id_cc, ccdd, ccpp, ccdi, zona, dpto, prov, dist){
	
	var ambito= document.getElementById("txtAmbito").value;
	
	ajax=http_request();
	var valores;	
	valores= "id_cc="+id_cc+"&ccdd="+ccdd+"&ccpp="+ccpp+"&ccdi="+ccdi+"&zona="+zona+'&dpto='+escape(dpto)+'&prov='+escape(prov)+'&dist='+escape(dist)+'&ambito='+ambito;  // parametros a enviar al servidor	
	
	url="m_esta_seccion.asp";  
//	if (tipo==2){url="m_esta_ece_dist.asp";  }
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divSup").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){							
				document.getElementById("divSup").innerHTML =ajax.responseText;
				document.getElementById("excel").style.display="block";
            }
            else if(ajax.status==404){
               document.getElementById("divSup").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
               document.getElementById("divSup").innerHTML = ajax.responseText;	 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
	return;	
}


function inicio()
{
valores= "flag=1"
var peticion=$.ajax(
		{
	     url:"Tipo_proceso.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#tipo").html("Cargando...");
							  },
		success:function (respuesta) {
    		  
	          $('#tipo').html(respuesta);
	          cargar();
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#tipo").html("");


      }
      
  }
  );
}

function verInscritos(id_cc,ccdd,ccpp,ccdi,zona,seccion){

	$('#modal_default').modal('show'); 
		
	valores= "id_cc="+id_cc+"&ccdd="+ccdd+"&ccpp="+ccpp+"&ccdi="+ccdi+"&zona="+zona+"&seccion="+seccion;
	var peticion=$.ajax(
		{
	     url:"m_tabla_reporte.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#tabla_personas").html("Cargando...");
							  },
		success:function (respuesta) {
    		  
	          $('#tabla_personas').html(respuesta);
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#tabla_personas").html("");
			 	}
  	  });
}



var tableToExcel= (function() {
	  var uri = 'data:application/vnd.ms-excel;charset=ISO-8859-1;pageEncoding=ISO-8859-1; base64,'
	    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
	    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
	    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
	  return function(table, name) {
	    if (!table.nodeType) table = document.getElementById(table)
	    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
	    window.location.href = uri + base64(format(template, ctx))
	  }
	})()


</script>
</head>
<body onLoad="inicio();" >
	<!--#include file="cabecera.html"--> 

<!--#include file="pd_menu.asp"--> 
	<INPUT type="hidden" id=cmbPeriodo name=cmbPeriodo value="1" >
	<INPUT type="hidden" id=cmbAlcance name=cmbAlcance value="marco" >
	<INPUT type="hidden" id=cmbMapa name=cmbMapa value="" >


<table width="95%" align=center border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td align="center"> <div id="divNavegacion"><span class="subtitulo">Bienvenidos al Sistema de Consecuci&oacute;n de RRHH</span></div></td>
  </tr>
    <tr>
 	      <td class="aplicacion" bgcolor="#DAE8F3"><span class="dato">
 	        <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           </span></td>
 	      <tr>
  <tr>
  <td align=center id=tipo ><b>Cargos de la Operaci&oacute;n de Campo:</b>&nbsp;
	<SELECT id=txttipo class="e_combo3" name=txttipo style="width:300px" onChange="cambiarIU('tabla');" >
	<OPTION value='0'>Seleccione</OPTION>
	</SELECT>
 
  </td>
</tr>
<tr>
  <td align=center id=tipo ><b>Tipo de &Aacute;mbito:</b>&nbsp;
	<SELECT id="txtAmbito" class="e_combo3" name="txtAmbito" style="width:300px" onChange="mapaDpto();" >
	<OPTION value='1' selected >Urbano</OPTION>
    <OPTION value='2'>Rural</OPTION>
	</SELECT>
 
  </td>
</tr>
<tr>
    <td>
		<table width="100%"  border="0">		  
		  <tr>
			    <td width="30%" id="tdMapa" valign=top > 

				<div id=imagenmapa>
				<fieldset>
					<legend><table width="100%"><tr><td class="titTabla">Avance a Nivel Nacional</td>
					<td align="left">&nbsp;</td><td align=left >
					</td></tr></table></legend>
					<div id="divMapa" style=" height:500px; width:385px; overflow:auto; position:relative">
					</div>
				</fieldset>
				</div>
				</td>		  
			    
			    <td width="40%" valign="top">
					<table border="0" width="100%">
						<tr height="100%">
						<td align="center" height="100%" valign="top">
								<div style="height:100%;" ><fieldset>
									<legend>
                                    <table width="100%">
                                    	<tr>
                                        <td width="84%" class="titTabla">
									    <div id="dptoProv">Ubicacion geogr&aacute;fica</div>
									    </td>
                                        <td width="16%" align="right"> <div align="center" id="excel" style=" display:none; " >								     <form action="reporte.asp" method="post" target="_blank" id="FormularioExportacion">
								          <img src="images/page_excel.png" alt="" class="botonExcel" title="EXPORTAR A EXCEL" />
								          <input type="hidden" id="datos_a_enviar" name="datos_a_enviar" />
						          </form></div></td>
                                  </tr></table>
                                  </legend>
									<div id="divSup" style=" vertical-align:top; height:490px;width:950px;overflow:auto; position:static; ">Seleccione un departamento del mapa.</div>
                                         <!-- width:98% -->
								</fieldset></div>
						</td>
						</tr>
					</table>
				</td>
			    <td width="30%" valign="top"></td>
		  </tr>
		  <tr>
		    <td colspan="3" valign=top id="tdMapa2" >&nbsp;</td>
	      </tr>		  
		</table>
	</td>
  </tr>
</table>
<!-- Basic modal -->
					<div id="modal_default" class="modal fade">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h5 class="modal-title">Listado de personal</h5>
								</div>

								<div class="modal-body" id="tabla_personas">

								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-link" data-dismiss="modal" onClick="tableToExcel('tabla_personas','Reporte Cobertura')">Imprimir</button>
                                    <button type="button" class="btn btn-link" data-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>
					<!-- /basic modal -->

</body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>