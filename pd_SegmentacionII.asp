<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 
<%



lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
lsPuesto = Session("id_puesto")


If lsUbigeo <> "" then

If Request.Form <> "" Then
	lsOperacion = Request.Form("txtOper")
	lsOpcion = Request.Form("txtOpcion")
	lsNombre = Request.Form("txtNombre")
	lsApePaterno = Request.Form("txtApePaterno")
	lsApeMaterno = Request.Form("txtApeMaterno")
	lsDNI = Request.Form("txtDNI")
	lsCodigo = Request.Form("txtCODIGO")	
	
	If lsOperacion = "1" Then
		
		Set RS = Server.CreateObject("ADODB.Recordset")
		RS.CursorType = adOpenKeyset 

	End If
End If
 
 
%>
<HTML>
<HEAD> 
   <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>

	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
 <script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript" src="js/envio_ajax.js"></script>
  <script>

function getHTTPObject() {
    var xmlhttp;
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
       try {
          xmlhttp = new XMLHttpRequest();
       } catch (e) { xmlhttp = false; }
    }
    return xmlhttp;
}

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


function VERFORMATO(valor)
{		
	 pagina = "formato_seg.asp";
	 win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}


function verSegmentacion(valor)
{		
	 pagina = "m_segmentacionvalExp.asp";
	 win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}


function verCodigoseXP(valor)
{		
	 pagina = "m_cargosCampoeXP.asp";
	 win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function verCodigos(){

	ajax=http_request();
	var valores;	
	valores= "";  // parametros a enviar al servidor	
	url="m_cargosCampo.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("mensaje").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("mensaje").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("mensaje").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 
}


function validar(){

	ajax=http_request();
	var valores;	
	valores= "";  // parametros a enviar al servidor	
	url="m_segmentacionval.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("mensaje").innerHTML =ajax.responseText;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("mensaje").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("mensaje").innerHTML = ajax.responseText;	
					                      
				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 

}

function actualizar(indicador){

	ajax=http_request();
	var valores;	
	valores= "indicador="+indicador;  // parametros a enviar al servidor	
	url="m_actualizarSeg.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){							
				document.getElementById("mensaje").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("mensaje").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

             document.getElementById("mensaje").innerHTML = ajax.responseText;	 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	 

}

</script>

</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 
	  <!--#include file="pd_menu.asp"--> 
       <div id="divNavegacion" align="center"><span class="subtitulo">Mantenimiento: Gastos Operativos</span></div>
<form name="form1" id="form1" METHOD="POST" ACTION="pd_eliminacion.asp">

 			<table  width="95%"   align="center" border="0">
      <tr>
 				<td align="center" valign=top >
 					 
 							<table width="95%" border="1" align="center" bordercolor="#DAE8F3"cellpadding="2" cellspacing="2" >
 	            <tr style="width:70%">
 								<th colspan="3" bgcolor="#DAE8F3" style="width:35%"><span class="aplicacion"> Opciones</span></th>
 							 							
							<tr style="width:35%">
 								<th bgcolor="#DAE8F3" ><span class="aplicacion">Pasos</span></th>
 								<th bgcolor="#DAE8F3" >&nbsp;</th>
 								<th bgcolor="#DAE8F3" ><span class="aplicacion">Descripci&oacute;n</span></th>
 								
 							<tr >
								<td width=74  class='etiqueta'><STRONG>PASO 1</STRONG><BR>VER C&Oacute;DIGO DE CARGOS</td>
	             
	                            <td>
                                <img src="images/nivel.png" width="20" height="22" alt="" border="0" style="CURSOR: hand" onClick="javascript:verCodigos()" /></td>
	                            <td  class='etiqueta'>Aqui se puede revisar los c&oacute;digos de los cargos que pertenecen a la Actividad de Operaci&oacute;n de Campo. Estos c&oacute;digos los utilizará para registrar las rutas de los cargos que tiene gastos operativos, en el formato que se exporta en el paso 2 indica el campo ID_PRESUPUESTO (Donde se incluye este campo).</td>

                              </tr>
							<tr >
                            
								<td width=74  class='etiqueta'><STRONG>PASO 2</STRONG><BR>EXPORTAR FORMATO</td>
	             
	              <td  ><img src="images/excell1.gif"  width="30" height="30" alt="" border="0" style="CURSOR: hand" onClick="javascript:verCodigos()" />
                  &nbsp;&nbsp;</td>
	              <td  class='etiqueta' >Este formato debe de ser rellenado, teniendo como datos obligatorios los c&oacute;digos de ubigeo, sede, id_presupuesto, el n&uacute;mero de ruta y los c&oacute;digos de los cargos</td>
							  </tr>
                              
                              <tr >
                            
								<td width=74  class='etiqueta'><STRONG>PASO 3</STRONG><BR>Subir Archivo CSV</td>
	             
	              <td  ><div> 
							    <iframe width="100%" height="150px" id="Archivos_Subir" style="border:none;" src="carga_archivosCSV_Seg.asp"></iframe> 
						      </div></td>
	              <td  class='etiqueta' >Este formato debe de ser rellenado, teniendo como datos obligatorios los c&oacute;digos de ubigeo, sede, id_presupuesto, el n&uacute;mero de ruta y los c&oacute;digos de los cargos</td>
							  </tr>
								
							<tr >
								<td width="74" class='etiqueta'><STRONG>PASO 4</STRONG><BR>VERIFICAR</td>		
                                						
	              <td width="34"><img src="images/edita.PNG" width="20" height="20" alt="" border="0" style="CURSOR: hand" onClick="javascript:verCodigos()" />&nbsp;&nbsp;</td>
	              <td width="300"  class='etiqueta'>Antes de actualizar el archivo en el sistema debe de verificar que los datos se encuentren registrados correctamente, el campo observaci&oacute;n indicar&aacute; si existe alg&uacute;n problema. Estos datos se registran en una tabla temporal</td>
	              </tr>
                              <tr >
								<td width="74" class='etiqueta'><STRONG>PASO 5</STRONG><BR>ACTUALIZAR</td>		
                                						
	              <td width="34"><img src="images/ok.gif" width="20" height="20" alt="" border="0" style="CURSOR: hand" onClick="javascript:verCodigos()" /></td>
	              <td width="300"  class='etiqueta'><!--input name="button2" type="button" class="boton" id="button2" onClick="javascript:actualizar('2')"   value="Ver" -->&nbsp;Esta opc&iacute;on pasa los datos de la tabla temporal a la tabla de gastos operativos. Solo pasan los datos que no tienen observaci&oacute;n.</td>
	              </tr>
 							</table>
 				</td>
			  </tr>
	    	    				    
	
</table></form>
<div align="center">
<div id="mensaje" style="width:80%; height:50%; overflow:scroll" class="aplicacion" align="center"> 
</div>
</div>



	
	
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
