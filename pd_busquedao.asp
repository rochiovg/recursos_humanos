<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0
lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 

id_proyecto=session("id_proyecto")

If lsUbigeo <> "" then


sub generaDpto()
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD "
	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option id=""valor_defecto"" value=""99"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

If Request.Form <> "" Then
	lsOperacion = Request.Form("txtOper")
	lsDptoI = Request.Form("txtDpto1")
	lsProvI = Request.Form("txtProv1")
	lsDistI = Request.Form("txtDist1")
	lsOpcion = Request.Form("txtOpcion")
	lsNombre = Request.Form("txtNombre")
	lsApePaterno = Request.Form("txtApePaterno")
	lsApeMaterno = Request.Form("txtApeMaterno")
	lsDNI = Request.Form("txtDNI")
	lsCodigo = Request.Form("txtCODIGO")
	lsDptoI = mid(lsDptoI,1,2)
	lsProvI = mid(lsProvI,3,2)
	lsDistI = mid(lsDistI,5,2)
		
	If lsOperacion = "1" Then
		
		lsSQL = "EXEC dbo.usp_BusquedaDatosO '"& lsDptoI&"','"& lsProvI&"','"& lsDistI&"','"& lsDNI&"','"& lsNombre&"','"& lsApePaterno&"','"& lsApeMaterno&"','"& lsOpcion&"' ,'"& id_proyecto&"'"	

'response.write(lsSQL)
'response.end()
		

		Call getRS(RS, lsSQL)

	End If
End If%>
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






function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m6_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("reg").innerHTML =ajax.responseText;
				verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("reg").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("reg").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function abrir(lsDptoI,lsProvI,lsDistI,lsDNI,lsNombre,lsApePaterno,lsApeMaterno,lsOpcion)
{
	window.open("reporte_busquedaXLS.asp?lsDptoI="+lsDptoI+"&lsProvI="+lsProvI+"&lsDistI="+lsDistI+"&lsDNI="+lsDNI+"&lsNombre="+lsNombre+"&lsApePaterno="+lsApePaterno+"&lsApeMaterno="+lsApeMaterno+"&lsOpcion="+lsOpcion+"","_blank","mywindow");
	
	
	}
	

function verdis(){

    
    var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m61_Distrito.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dis").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dis").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("dis").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dis").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function enviarcard(dni)
{		
	 			
 pagina = "contacto.asp?lsdni=" + dni ;
	win = window.open(pagina,'','width=600,height=250,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}
	
	
	function ValidaExisteDNIFicha(){
 var txtDNI=document.getElementById("txtDNI").value;
 //var obj=document.getElementById('txtDNI');
 
  if (document.frmMiForm.txtDNI.value.length <8)
  {
       alert("El DNI debe de tener 8 digitos")
       document.getElementById("txtDNI").focus();
       return false
  }
  else
  {
            a = 'pd_dtConsultaPlanillaPago_PEA.asp?lsDNI='+txtDNI ;
            window.open(a, 'expe1','top=20,left=10,scrollbars=yes,width=890,height=485,resizable=1' )  ;
  }
}


 </script>
</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 

<!--#include file="pd_menu.asp"-->
<div id="divNavegacion" align="center"><span class="subtitulo">Consultas: B&uacute;squeda Personal RRHH</span></div>
<%If lsOperacion <> "1" Then%>
		

<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_busquedao.asp">
 	 <input type=hidden id="txtFrm" name="txtFrm" value="">
	
 			<table width="100%" cellpadding="0" style="padding:0; margin:0; vertical-align:top;" cellspacing="0" border="0" bgcolor=White>
              <tr height=22>
 				<td colspan=3><br>
 					
 				</td>
 			</tr>
 			<tr height=10><td colspan=3 align=center></td></tr> 
 			<tr height=22>
			  <td colspan=3><br><br>
 					<table cellpadding="2" cellspacing="2" align="center" width="490" >
 	            <tr>
 								<th colspan=4 bgcolor="#DAE8F3" class=" aplicacion">Por DNI</th>
					  </tr>
 							<tr>
 								<td width="160" class='etiqueta'>DNI<font class='alerta5'>(*)</font></td>								
	              <td width="273">
							  <input type="text" class='e_texto' id="txtDNI" name="txtDNI" value="" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)"> &nbsp;&nbsp;&nbsp;&nbsp;
            
</td>
							  <td width="55" align=right><INPUT name=button2 type="button" class="boton" id=button2 style="font-family:Arial; font-size:8pt;" onClick="javascript:enviarBusqueda('2')"   value="Buscar"></td>
							</tr>
				  </table>
			  </td>
 			</tr>  
			<tr height=22>
			  <td colspan=3><br><br>
 					
			  </td>
 			</tr>    
			<tr height=22>
 				<td colspan=3><br></td>
			</tr>      
			</table>   
		            				    	    				    
	<input type=hidden id="txtOper" name="txtOper" value="">
	<input type=hidden id="txtOpcion" name="txtOpcion" value="">
	</form>
	<%End If%>
    
    
	<%If lsOperacion = "1" Then	 %>
    
    
    
    <table width="103%" align="center" border="0">
  </table>
    
	<table width="100%" align="center" border="0">
  <tr>
    <td align="center" valign="top"><br>
      
      	
	  <%	If Not RS.BOF And Not RS.EOF Then	
	  
	  		if lsOpcion=1 or lsOpcion=2 then
		id_per = RS("ID_PER")
		end if
	  	%>
      
                  <%	var="block"
			if lsOpcion="3" or lsOpcion ="4" or lsOpcion ="1" TheN
	     		var="none"
       		end if %>
      
      <table style="display:<%=var%>" cellpadding="2" cellspacing="2" align="center" width="490" >
 	            <tr>
 							<!--	<th colspan=3 bgcolor="#DAE8F3" class=" aplicacion">DATOS PESONALES</th>-->
					  </tr>
 							<tr>
 								<td width="103" class='etiqueta'>DNI</td>								
	              <td width="371"><a href="#" class="titulo3" onClick="javascript:enviarcard('<%=Rs.Fields("Dni")%>')"><%=Rs.Fields("Dni")%></a></td>
						    </tr>
                            <tr>
 								<!--<td width="103" class='etiqueta'>APELLIDOS</td>								
	              <td><span class="etiqueta"><%=Rs.Fields("Ape_paterno") & " " & Rs.Fields("Ape_materno")%></span></td>
						    </tr>
                            <tr>
 								<td width="103" class='etiqueta'>NOMBRES</td>								
	              <td><span class="etiqueta"><%=Rs.Fields("Nombre")%></span></td>
						    </tr>--->
                            
				  </table>
    <%	var="block"
		num=11
			if lsOpcion ="2" TheN
	     		var="none"
				num=9
       		end if %>
		<table cellpadding="2" cellspacing="3" border="1"  bordercolor="#DAE8F3" width="100%" align="center" >
          <tr height=35>
            <td colspan=<%=num%> align=center valign=top class="aplicacion"><span class="titulo"><p align="center">CONSULTE MAS DATOS CON EL PERSONAL  DE OTA </p>
            </span></td>
            
        
          </tr>     
          <tr>
         <td  colspan=<%=num%> align=center>  <a href="pd_busquedao.asp"><span class="boton" style="cursor:pointer; display:<%=varv%>">Nueva B&uacute;squeda</span></a>    </td>
        </tr>
          <% registro = 0
	  Do While Not RS.EOF
	  	registro = registro+1%>
          
          <%	Rs.MoveNext
		Loop%>
      </table>
		<br>
        
      <%	varv="block"
			if lsOpcion ="2" TheN
	     		varv="none"
       		end if %>
        
	<a href="pd_busquedao.asp"><span class="boton" style="cursor:pointer; display:<%=varv%>">Nueva B&uacute;squeda</span></a>
	<%Else%>
  <table cellpadding="1" cellspacing="1" border="0" width="99%">
 	<tr>
 	  <td colspan=4 align=right></td></tr>
      <tr height=5><td colspan=4 align=right></td></tr>
      <tr height=22><td colspan=4 align=center>&nbsp;</td>
      </tr>
      <tr height=10><td colspan=4 align=right></td></tr>
      <tr height=22>
        <td colspan=4 align=center><font class='cascade10' color=DarkBlue>REALICE LA BUSQUEDA NUEVAMENTE. </FONT></td>
      </tr>
      <tr height=1><td colspan=4 align=center><br>
	<a style="display:<%=varv%>"  href="pd_busquedao.asp"><span class="boton">Nueva B&uacute;squeda</span></a></td>
      </tr></table>
	<%	
		response.write(contador)
		response.End()
	RS.Close
	Set RS = Nothing
	End If 
	%>
	</td></tr></table>

<% if lsOpcion=2 then
  lsSQL2 = "EXEC dbo.usp_BusquedaDatos11 '"& lsDptoI&"','"& lsProvI&"','"& lsDistI&"','"& lsDNI&"','"& lsNombre&"','"& lsApePaterno&"','"& lsApeMaterno&"','"& lsOpcion&"','"& id_per&"', '"&id_proyecto&"'  "	
		
		Call getRS(RS1, lsSQL2)

 	varvi="block"
   if lsOpcion ="4" or lsOpcion ="1" TheN
	     		varvi="none"
       end if%>
	<table style="display:<%=varvi%>" width="100%" align="center" border="0">
  <tr>
    <td align="center" valign="top"><br>
      
      	
	  <%	If Not RS1.BOF And Not RS1.EOF Then %>
      
	

      </table>
	  <a href="pd_busqueda.asp"><span class="boton" style="cursor:pointer">Nueva B&uacute;squeda</span></a>
	<%Else%>
  
	<%	End If
	RS1.Close
	Set RS1 = Nothing
	
	end if
	%>	
	</td></tr></table>
	<%
		cnn.Close
		Set cnn = Nothing
	End If%>	
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>