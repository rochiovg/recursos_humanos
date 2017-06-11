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
	url="m_segmentacionval_ETMP_UBIGEO.asp";  
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
	url="m_actualizarETMP_UBIGEO.asp";  
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
       <div id="divNavegacion" align="center"><span class="subtitulo">Actualizacion de Estados</span></div>
<form name="form1" id="form1" METHOD="POST" ACTION="pd_eliminacion.asp">

 			<table  width="95%"   align="center" border="0">
      <tr>
 				<td align="center" valign=top >
 					 
 							<table width="85%" border="1" align="center" bordercolor="#DAE8F3"cellpadding="2" cellspacing="2" >
 	            <tr style="width:35%">
 								<th colspan="3" bgcolor="#DAE8F3" style="width:35%"><span class="aplicacion"> Opciones</span></th>
 								<th style="width:50%" bgcolor="#DAE8F3"><span class="aplicacion">Subir archivo</span></th>
 							
							<tr style="width:35%">
 								<th bgcolor="#DAE8F3" >&nbsp;</th>
 								<th bgcolor="#DAE8F3" >&nbsp;</th>
 								<th bgcolor="#DAE8F3" >&nbsp;</th>
 								<th style="width:50%" bgcolor="#DAE8F3">&nbsp;</th>
 							<tr >
								<td width=137  class='etiqueta'>&nbsp;</td>
	             
                              <td colspan="2"></td>
	                            <td width="435" rowspan="4" align=right><div> 
							    <iframe width="100%" height="150px" id="Archivos_Subir" style="border:none;" src="carga_archivosCSV_ETMP_UBIGEO.asp"></iframe> 
						      </div></td>
                              </tr>
							<tr >
                            
								<td width=137  class='etiqueta'>&nbsp;</td>
	             
	              <td  ></td>
	              <td  ></td>
							  </tr>
								 
							<tr >
								<td width="137" class='etiqueta'>VERIFICAR</td>		
                                						
	              <td width="89"><input name="button1" type="button" class="boton" id="button1" onClick="javascript:validar('1')"   value="Ver">&nbsp;&nbsp;</td>
	              <td width="91">&nbsp;</td>
	              </tr>
                              <tr >
								<td width="137" class='etiqueta'>ACTUALIZAR</td>		
                                						
	              <td width="89"><input name="button1" type="button" class="boton" id="button1" onClick="javascript:actualizar('1')"   value="Ver"></td>
	              <td width="91"><!--input name="button2" type="button" class="boton" id="button2" onClick="javascript:actualizar('2')"   value="Ver" -->&nbsp;</td>
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
