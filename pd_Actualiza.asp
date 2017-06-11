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

function validarPension(valor){
	var valor=valor; 
	
	if (valor=="19990" || valor==""){
		document.getElementById("txtAFP").value="";
		document.getElementById("txtAFP").disabled=true;
		
	 	document.getElementById("txtFecAfiliacion").value="";
		document.getElementById("txtFecAfiliacion").disabled=true;
		
		document.getElementById("txtFCUSSP").value="";
		document.getElementById("txtFCUSSP").disabled=true;
		
		document.getElementById("txtComision").value="";
		document.getElementById("txtComision").disabled=true;
	} else {
		document.getElementById("txtAFP").disabled=false;
		document.getElementById("txtFecAfiliacion").disabled=false;
		document.getElementById("txtFCUSSP").disabled=false;
		document.getElementById("txtComision").disabled=false;
		}
}

function Actualizar(){
	
	lstipo_pension=document.getElementById("txtTipoPension").value;
	lsAFP=document.getElementById("txtAFP").value;
	lsFecAfiliacion=document.getElementById("txtFecAfiliacion").value;
	lsCUSSP=document.getElementById("txtFCUSSP").value;
	lsComision=document.getElementById("txtComision").value;
	//lsBanco=document.getElementById("txtBanco").value;
	//lsTipoCuenta=document.getElementById("txtTipoCuenta").value;
	//lsCuenta=document.getElementById("txtCuenta").value;
	lsBanco="";
	lsTipoCuenta="";
	lsCuenta="";
	
	lsIDPER=document.getElementById("txtIDPER").value;
	lsTipoPension_nu=document.getElementById("txtTipoPension_nu").value;
	
	
	if (lstipo_pension==''){
		alert('Seleccione tipo de Pensi\xf3n')	;
		return false;
	} else if (lstipo_pension=='AFP'){
		if (lsAFP==""){
			alert('Seleccione AFP')	;
		return false;
			}			
		if (lsFecAfiliacion==""){
			alert('Registre fecha de afiliaci\xf3n a la AFP')	;
		return false;
			}	
			
		if (lsCUSSP==""){
			alert('Registre C\xf3digo de Afiliado - CUSSP')	;
		return false;
			}		
	}

	ajax=http_request();
	var valores;	
	valores= "lstipo_pension=" + escape(lstipo_pension)+"&lsAFP="+escape(lsAFP)+"&lsFecAfiliacion="+escape(lsFecAfiliacion)+"&lsCUSSP="+escape(lsCUSSP)+"&lsComision="+escape(lsComision)+"&lsBanco="+escape(lsBanco)+"&lsTipoCuenta="+escape(lsTipoCuenta)+"&lsCuenta="+escape(lsCuenta)+"&lsIDPER="+escape(lsIDPER);  // parametros a enviar al servido

	url="m_guardarActualizacion.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				document.getElementById("txtDNI").value='';
				document.getElementById("txtFecNac").value='';
				document.getElementById("txtFec").value='';
				document.getElementById("mensaje").innerHTML ="Sus datos se actualizaron correctamente, Gracias."
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

function buscarPersona(){
			
			 if (document.getElementById("txtDNI").value.length<8)
			 {
			 alert("El n\xfamero de DNI debe tener 8 d\xedgitos");
			 document.getElementById("txtDNI").focus();
			 return false;
				 }
			 
			 if (document.getElementById("txtDNI").value=="")
			 {
			 alert("Ingrese en n\xfamero de DNI");
			 document.getElementById("txtDNI").focus();
			 return false;
				 }
				 
			 if (document.getElementById("txtFecNac").value=="")
			 {
			 alert("Ingrese la fecha de su nacimiento");
			 document.getElementById("txtFecNac").focus();
			 return false;
				 }
				 
			if (document.getElementById("txtFec").value=="")
			 {
			 alert("Ingrese fecha de nacimiento de su padre o madre");
			 document.getElementById("txtFec").focus();
			 return false;
				 }

		 var lsDNI= document.form1.txtDNI.value;
		 var lsFecNac=document.form1.txtFecNac.value;
		 var lsFec=document.form1.txtFec.value;
		 
	ajax=http_request();
	var valores;	
	valores= "lsDNI=" + escape(lsDNI)+"&lsFecNac="+escape(lsFecNac)+"&lsFec="+escape(lsFec);  // parametros a enviar al servido
	
		
	url="m_Actualizar.asp";  
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

	function mayuscula(objeto){ 
		objeto.value = objeto.value.toUpperCase();
	}
	
function validaTP(valor){
	
	if (valor==0){
		document.getElementById("t_Afiliado").style.display="none";
		document.getElementById("t_NoAfiliado").style.display="none";
	}
	
	if (valor==1){
		document.getElementById("t_Afiliado").style.display="";
		document.getElementById("t_NoAfiliado").style.display="none";
	}
	
	if (valor==2){
		document.getElementById("t_Afiliado").style.display="none";
		document.getElementById("t_NoAfiliado").style.display="";
	}
}

</script>

</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 

	  <!--#include file="pd_menu.asp"--> 
       <div id="divNavegacion" align="center"><span class="subtitulo">Registro: Actualizar datos de Afiliaci&oacute;n a Sistema de Pensi&oacute;n</span></div>
<form name="form1" id="form1" METHOD="POST" ACTION="pd_eliminacion.asp">

 			<table  width="95%"   align="center" border="0">
      <tr>
 				<td align="center" valign=top >
 				
			      <table width="490" border="1" align="center" cellpadding="2" cellspacing="2"  bordercolor="#DAE8F3">
				      <tr>
				        <th colspan=4 bgcolor="#DAE8F3" class="aplicacion"><input type="hidden" name="txtUsuario" id="txtUsuario" value="<%=lsUsuario%>">
			            Por DNI</th>
			        </tr>
				      <tr >
				        <td width="195" height="25" class='etiqueta'>DNI<font class='mensaje1' >(*)</font></td>
				        <td width="186"><input type="text" class='e_texto' id="txtDNI" name="txtDNI" value="" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)"></td>
				        <td width="81" align=right>&nbsp;</td>
			        </tr>
                     <tr >
				        <td width="195" height="25" class='etiqueta'><p>Fecha nacimiento<font class='mensaje1' >(*)</font></p></td>
				        <td width="186" class='etiqueta'><input type="text" class='e_texto' id="txtFecNac" name="txtFecNac" value="" maxlength="10" validchars="0123456789/" onKeyPress="return TextUtil.allowChars(this, event)" onKeyUp="this.value=formateafecha(this.value);"> dd/mm/aaaa </td>
				        <td width="81" align=right class='etiqueta'>&nbsp;</td>
			        </tr>
                     <tr >
				        <td width="195" height="25" class='etiqueta'>Fecha nacimiento de padre o madre<font class='mensaje1' >(*)<br>
				        </font></td>
				        <td width="186" class='etiqueta'><input type="text" class='e_texto' id="txtFec" name="txtFec" value="" maxlength="10" validchars="0123456789/" onKeyPress="return TextUtil.allowChars(this, event)" onKeyUp="this.value=formateafecha(this.value);"> dd/mm/aaaa</td>
				        <td width="81" align=right><input name=button2 type="button" class="boton" onClick="javascript:buscarPersona()"   value="Buscar"></td>
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
	
	
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
