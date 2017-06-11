<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 
<%
lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
lsUsuarioID = Session("id_usuario")
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
sedeReg=session("sedeReg") 
sedeProv=session("sedeProv") 
sedeDist=session("sedeDist") 

id_proyecto=session("id_proyecto") 


sub generaDpto()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD_UBI '"&lsUbigeo&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option  value=""99"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub


sub generaRegion()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.pa_sede_ece '"&sedeReg&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option  value=""99"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub

If lsUbigeo <> "" then
 %>
<HTML>
<HEAD> 
   <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
   <link rel="shortcut icon" href="images/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
 <script type="text/javascript"  src="js/cliente.js"></script> 
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


function validar_dni()
{
	 var obj = document.getElementById('txtDNI');  
	 var proyecto = document.getElementById('id_proyecto').value; 
	 
	  	var lsDPTO = document.frmMiForm.txtDpto1.value;
		var lsPROV = document.frmMiForm.txtProv1.value;
		var lsDIST = document.frmMiForm.txtDist1.value;
		var lsubidist = document.frmMiForm.lsubidist.value; 
		 
		 if (proyecto==103){
			 if (lsDPTO=='99'){
				alert('Seleccione la Sede Regional');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Sede Provincial');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999' && lsubidist!='999999'){
				alert('Seleccione la sede Distrital');
				document.frmMiForm.txtDist1.focus();
				return false
			}	 
		}
		 else {
		 if (lsDPTO=='99'){
				alert('Seleccione el Departamento');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
			if (lsDIST=='999999'){
				alert('Seleccione el Distrito');
				document.frmMiForm.txtDist1.focus();
				return false
			}
		 }
		 
		  
   if(obj.value.length < 8 ){	
	setTimeout("document.getElementById('txtDNI').focus();",1);

			document.getElementById('msj3').innerHTML="El DNI debe de tener 8 digitos";	
			return false


	}
	else{
				
			ajax=http_request();
		   var valor = escape(document.getElementById("txtDNI").value);		   
	valor= "dni="+valor+"&ccdd="+lsDPTO+"&ccpp="+lsPROV+"&ccdi="+lsDIST+"&lsTipo=25";  // parametros a enviar al servidor	
		   var url = "m_ingreso.asp";		  

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("msj3").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("msj3").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("msj3").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("msj3").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valor);
   return;
	}
}



function generaprov(){
     
      var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m_Provincia_ece.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("reg2").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("reg2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("reg2").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function verdis(){

 var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
 var lsUbiDist =document.getElementById("lsubidist").value;
	ajax=http_request();
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&lsUbiDist="+escape(lsUbiDist);  // parametros a enviar al servidor	
	
	url="m_Distrito_ece.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dis2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dis2").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("dis2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dis2").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}



function grabar(valor)
{
	var texto="";
	if (valor==1 ){
		texto="Aprobar"
		}
		else {
			texto="Desaprobar"
			}
	
	
	if(confirm("Esta seguro de "+texto+" al postulante?"))
			{
	
	  var obj = document.getElementById('txtDNI');   
   if(obj.value.length < 8 ){	
	setTimeout("document.getElementById('txtDNI').focus();",1);
			document.getElementById('msj3').innerHTML="El DNI debe de tener 8 digitos";	
			return false
	}
	else{
		   ajax=http_request();
		   var dni = escape(document.getElementById("txtDNI").value);		   

		   var valor;  	
	valor= "dni="+dni+"&valor="+valor+"&lsTipo=26";   // parametros a enviar al servidor	
		   var url = "m_ingreso.asp";		  


	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("msj3").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("msj3").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("msj3").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                    document.getElementById("msj3").innerHTML = ajax.responseText;	
					document.getElementById("txtDNI").value='';
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valor);
			document.getElementById("txtDNI").value='';

   return;
	}
	
	}
	else {
		return false;
		}
			
}



 </script>
</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 


<!--#include file="pd_menu.asp"-->
<%If lsOperacion <> "1" Then%>
<div id="divNavegacion" align="center"><span class="subtitulo">Procesos: Aprobaci&oacute;n de CV por DNI</span></div>
	<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_confirmacion_cv.asp">
 	 <input type=hidden id="txtFrm" name="txtFrm" value="">
	<table  width="95%" height="400px" border="0" align="center">
      <tr>
		<td valign=top align=center>
		
 			<table width="770" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
 			<tr height=10><td align=center></td></tr> 
 			<tr height=22>
			  <td><br>
 					<table width="490" border="1" align="center" cellpadding="2" bordercolor="#DAE8F3" cellspacing="2" >
                    <tr>
 								<th colspan=4 class="aplicacion" bgcolor="#DAE8F3">Seleccione el Ubigeo</th>
					  </tr>
                      
                      
                     <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Regional:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaRegion()%>
                <input name="id_proyecto" type="hidden" id="id_proyecto" value="<%=id_proyecto%>" />
                 <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                </td>
                <td colspàn="2" class='criterio'>&nbsp;</td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Sede Provincial:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                  <option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
                </select></td>
                <td colspàn="2" class='criterio'>&nbsp;</td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Distrittal:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                  <option id="txtDist1" 	title="Todos" value="999999" >Todos </option>
                </select></td>
                <td colspàn="2" class='criterio'>&nbsp;</td>
              </tr>
              
              
              
 	            <tr>
 								<th colspan=4 class="aplicacion" bgcolor="#DAE8F3">Ingresar N&deg; DNI del Postulante</th>
					  </tr>
 							<tr>
 								<td width="111" ><span class='criterio'>DNI</span><font class='alerta5' >(*)</font></td>								
	              <td width="253">
							&nbsp; &nbsp; <input type="text" class='e_texto' id="txtDNI" name="txtDNI" value="" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onBlur=""></td>
							  <td width="98" align=center><img src="images/lupa.jpg" width="42" height="35" onClick="validar_dni()"></td>
							</tr>
 							<tr>
 							  <td colspan="3" class='etiqueta'><br><div align="center" id="msj3"></div>&nbsp;</td>
					  </tr>
			      </table>
			  </td>
 			</tr>    
			<tr height=22>
 				<td></td>
			</tr>      
			</table>   
		</td>
	</tr>	
	</table>              				    	    				    
	<input type=hidden id="txtOper" name="txtOper" value="">
	<input type=hidden id="txtOpcion" name="txtOpcion" value="">
    
	</form>
	<%End If%>
	
	<%	
	%>	
	<%If lsOperacion = "1" Then
		RS.Close
		cnn.Close
		Set RS = Nothing
		Set cnn = Nothing
	End If%>	</td></tr>
</table>
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>