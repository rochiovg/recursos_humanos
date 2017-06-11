<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 
<%

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
lsPuesto = Session("id_puesto")
lsUbigeoDist= Session("UbigeoDist")


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



function verdis(){

 var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
 var lsUbiDist =document.getElementById("lsubidist").value;
	ajax=http_request();
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&lsUbiDist="+escape(lsUbiDist);  // parametros a enviar al servidor	
	
	url="m_DistritoCambio.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("tr_dist").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("tr_dist").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("tr_dist").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("tr_dist").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function cargarZonas(){
	// m71_Distrito_zona.asp


	var dist=document.getElementById("txtDist1").value;
 	//dist=dist.substring(0, 6);
 	
	ajax=http_request();
	var valores;	
	valores= "dist=" + escape(dist);  // parametros a enviar al servidor	
	
	url="m_zona.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
        if (ajax.readyState==1) {
            document.getElementById("tr_zona").innerHTML ="Cargando......";
        }
        else if (ajax.readyState==4){
            if(ajax.status==200){								
				document.getElementById("tr_zona").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                document.getElementById("tr_zona").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                document.getElementById("tr_zona").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;
}


function ver_seccion_CPV(){
	var valor=document.getElementById("txtDist1").value;
	var zona=document.getElementById("txtZona").value;
	var	dist=valor.substring(0,6)

	ajax=http_request();
	var valores;	
	valores= "dist=" + escape(dist)+ "&zona=" + zona;  // parametros a enviar al servidor	
	
	url="m_seccion.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("tr_seccion").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("tr_seccion").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("tr_seccion").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("tr_seccion").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function cambiozona(){
	var lsDPTO=document.getElementById("txtDpto").value;
	var lsPROV=document.getElementById("txtProv1").value;
	var	lsDIST=document.getElementById("txtDist1").value;
	var	txtzona=document.getElementById("txtZona").value;
	var	txtseccion=document.getElementById("txtSeccion").value;
	var	txtDNI=document.getElementById("txtDNI22").value;


	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+ "&lsPROV=" + escape(lsPROV)+ "&lsDIST=" + escape(lsDIST)+"&txtDNI="+txtDNI+ "&txtzona=" + escape(txtzona)+ "&txtseccion=" + escape(txtseccion);  // parametros a enviar al servidor	
	
	url="m_grabacambiozona.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            							
            		alert('El cambio se realizó satisfactoriamente')			
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
       <div id="divNavegacion" align="center"><span class="subtitulo">Mantenimiento: Cambio deLugar de Postulaci&oacute;n</span></div>
<form name="form1" id="form1" METHOD="POST" ACTION="pd_CambioZona.asp">

 			<table  width="95%"   align="center" border="0">
      <tr>
 				<td align="center" valign=top >
 					 
 							<table width="490" border="1" align="center" bordercolor="#DAE8F3"cellpadding="2" cellspacing="2" >
 	            <tr>
 								<th colspan=6 bgcolor="#DAE8F3"><span class="aplicacion">Por Nombre</span></th>
							<tr >
								<td width=160  class='etiqueta'>Apellido Paterno<font class='mensaje1'>(*)</font>
									<input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
								</td>
	             
	              <td width="273">
	              <input type="text" class='e_texto' id="txtApePaterno" name="txtApePaterno" value="" maxlength="40" style="width:220" ></td>
							  <td width="55" rowspan="2" align=right>&nbsp;</td>
							</tr>
								<tr >
								<td width=160  class='etiqueta'>Apellido Materno <font class='mensaje1'>(*)</font></td>
	             
	                            <td width="273">
	                              <input type="text" class='e_texto' id="txtApeMaterno" name="txtApeMaterno" value="" maxlength="40" style="width:220"></td>
							  </tr>
							<tr >
								<td width="160" class='etiqueta'>Nombre<font class='mensaje1' >(*)</font></td>								
	              <td width="273">
							  <input type="text" class='e_texto' id="txtNombre" name="txtNombre" value="" maxlength="40" style="width:220" ></td>
							  <td width="55" align=right><INPUT name="button1" type="button" class="boton" id="button1" onClick="javascript:cambiarUbigeo('1')"   value="Buscar"></td>
							</tr>
 							</table>
 				
			      <table width="490" border="1" align="center" cellpadding="2" cellspacing="2"  bordercolor="#DAE8F3">
				      <tr>
				        <th colspan=4 bgcolor="#DAE8F3" class="aplicacion"><input type="hidden" name="txtUsuario" id="txtUsuario" value="<%=lsUsuario%>">
			            Por DNI</th>
			        </tr>
				      <tr >
				        <td width="160" height="25" class='etiqueta'>DNI<font class='mensaje1' >(*)</font></td>
				        <td width="273"><input type="text" class='e_texto' id="txtDNI" name="txtDNI" value="" maxlength="8" ></td>
				        <td width="55" align=right><INPUT name=button2 type="button" class="boton" onClick="javascript:cambiarUbigeo('2')"   value="Buscar"></td>
			        </tr>
			      </table>
		        <p>&nbsp;</p></td>
			  </tr>
 					
 				  			 
			
             				    	    				    
	
</table></form>
<div id="mensaje" class="aplicacion" align="center"> </div>
	<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_confirmacion_elim.asp">
	<%If lsOperacion = "1" Then%>
<%If Not RS.BOF And Not RS.EOF Then		%>
<input type=hidden id="txtOper2" name="txtOper2" value="">
	<input type=hidden id="txtOpcion2" name="txtOpcion2" value="">
	</form>

				
	<%Else%>
	 <table width=95% height=70%  border=1 background="Imagenes/fondo_di.jpg" align="center">  

  <tr>
		<td valign=top align=center>
  <table cellpadding="1" cellspacing="1" border="0" width="99%">
 	<tr>
 		<td colspan=4 align=right></td></tr>
      <tr height=5><td colspan=4 align=right></td></tr>
      <tr height=22><td colspan=4 align=center><FONT CLASS='mensaje5' color=MediumBlue><b><u>Resultado de Consulta</u></b></FONT></td>
      </tr>
      <tr height=10><td colspan=4 align=right></td></tr>
      <tr height=22>
        <td colspan=4 align=center><FONT CLASS='cascade3' color=MediumBlue>La Persona no está registrada en el sistema &oacute; <br>
          no pertenece al personal de la Red Administrativa
          <br><br>
           Por favor verifique...!!!</FONT></td>
		
      </tr>
      <tr height=22>
        <td colspan=4 align=center><br><table border=0 cellpadding="0" cellspacing="0" align="center" width="51%">
					<tr>
							         
					</tr>
					</table></td>
      </tr>
      <tr height=1><td colspan=4 align=right></td></tr>
</table></td></tr></table>
	<%	End If
		End If
	%>	
	<%If lsOperacion = "1" Then
		RS.Close
		cnn.Close
		Set RS = Nothing
		Set cnn = Nothing
	End If%>
    
    
	 <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" align="center"></div>
		  <div id="mensaje"></div>
            <iframe id="iframe" width="100%" height="100%" src="" frameborder="0"></iframe>
            </div>
        </div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>
        
	
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
