<%@ Language=VBScript %>

<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

%>
<html>
<head>
   <!-- link rel="shortcut icon" href="images/favicon.ico" /  -->

<title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>

<link rel="stylesheet" type="text/css" href="Styles/inei.css">
<LINK type="text/css" rel="stylesheet" href="css/presentacion.css">
<link rel="stylesheet" type="text/css" href="css/estilos.css" />

<script type="text/javascript" src="js/tabpane.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery.qtip.js"></script>
<script type="text/javascript" src="js/admin_core.js"></script>
<script type="text/javascript" src="js/fg.menu.js"></script>
<script type="text/javascript" src="js/modal.js"></script>
<script type="text/javascript" src="js/function_mapa_java.js"></script>
<script type="text/javascript" src="js/tooltip_m.js"></script>
<LINK type="text/css" rel="stylesheet" href="css/monitor.css">
<script language="javascript">
$(document).ready(function() {
	$(".botonExcel").click(function(event) {
		//$("#datos_a_enviar").val( $("<div>").append( $("#Exportar_a_Excel").eq(0).clone()).html());
//	$("#FormularioExportacion").submit();
	dpto="99";
	cargo= document.getElementById("txttipo").value;

	//tipo= document.getElementById("txttipox").value;

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

/*
function mapaDpto(dpto,cargo,tip){ 
		cargo= document.getElementById("txttipo").value;
		//tipo= document.getElementById("txttipox").value;
				
	ajax=http_request();
	var valores;	
	valores= "lsDPTO="+escape(dpto)+"&lsRol="+escape(cargo)+"&tipo="+escape(tipo);  // parametros a enviar al servidor	
	
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
*/


function inicio()
{
	cargar();
}
</script>
</head>
<body onLoad="inicio();" >

	<INPUT type="hidden" id=cmbPeriodo name=cmbPeriodo value="1" >
	<INPUT type="hidden" id=cmbAlcance name=cmbAlcance value="marco" >
	<INPUT type="hidden" id=cmbMapa name=cmbMapa value="" >


<table width="95%" align=center border="0" cellpadding="0" cellspacing="0">

         
  <tr>
    <td>
		<table width="51%"  border="0">		  
		  <tr>
			    <td width="30%" id="tdMapa" valign=top > 

				<div id=imagenmapa>
				<fieldset>
					<legend>Avance a Nivel Nacional</legend>
					<div id="divMapa" style=" height:500px; width:385px; overflow:auto; position:relative">
					</div>
				</fieldset>
				</div>
				</td>		  
		  </tr>
	  
		</table>
	</td>
  </tr>
</table>

</body>
</html>
