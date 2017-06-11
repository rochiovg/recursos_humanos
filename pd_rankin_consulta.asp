<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 
<%
Response.Expires = 0
Server.ScriptTimeout = 30000 

Response.Buffer = true 
Response.Flush 


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
lsUsuarioID = Session("id_usuario")
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 

sub generaSede()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.pa_genera_sede_ranking '2756', '99' "
  
	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" >"
	Response.Write " <option  value=""99"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("cod_sede") & "*" &wRsDptoapli("codigo") & """>"& wRsDptoapli("cod_sede")&" "&wRsDptoapli("nombre") & "</option>"
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
 <script type="text/javascript"  src="js/envio_ajax.js"></script>
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
	 
	 
	  	var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 
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
	
	url="m711_Provincia.asp";  
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
	
	url="m71_Distrito.asp";  
	
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
					<th colspan=4 class="aplicacion" bgcolor="#DAE8F3">RANKING POR SEDES<BR></th>
				  </tr>
                      
                      
                     <tr>
                <td width="125"  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Operativa:</span></td>
                <td width="286" bgcolor="#F7F8F9" class='criterio'>&nbsp;<%generaSede()%></td>
                <td width="1" class='criterio' colspàn="2">&nbsp;</td>
              </tr>
             
               <tr>
                <td colspan="3"  align="center" bgcolor="#F7F8F9"><input 
                        name='button1'  type='button' class="botonR" 				
                        id='button1' 
                        onclick="javascript:calcular_rankinSedes()" 
                        value='RANKING POR SEDES'>&nbsp;&nbsp;</td>
                </tr>
                <tr>
 							  <td colspan="3" class='etiqueta' align="center"><br><div align="center" id="msj2"></div>&nbsp;</td>
				  </tr>
              </table>
              <br><br>
              <table width="490" border="1" align="center" cellpadding="2" bordercolor="#DAE8F3" cellspacing="2" >
              
 	            <tr>
 								<th colspan=2 class="aplicacion" bgcolor="#DAE8F3">RANKING NACIONAL</th>
					  </tr>
 							<tr>
 								<td colspan="2" align="center">
                                <br>
                                <span class="etiqueta">
                                <input 
                        name='button3'  type='button' class="botonR" 				
                        id='button3' 
                        onclick="javascript:calcular_rankinNac()" 
                        value='RANKING NACIONAL'>
                                </span></td>								
	              </tr>
 							<tr>
 							  <td class='etiqueta'><br><div align="center" id="msj3"></div>&nbsp;</td>
					  </tr>
                      <tr>
 							  <td   align="center"><br>&nbsp;&nbsp;<input 
                        name='button2' style="alignment-adjust:center" type='button' class="boton" 				
                        id='button2' 
                        onclick="javascript:exportarRANKING('1')" 
                        value='Reporte' /><br>
 							    <span class="etiqueta">(Si el reporte lo requiere por SEDE, seleccionelo en el combo dela parte superior, sino obtendrá el reporte a nivel nacional)</span></td>
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