<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUsuarioID = Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
id_proyecto=session("id_proyecto") 

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '2' ,'"&id_proyecto&"'  ")
	

	Response.Write "<select class=""e_combo"" style=""width:210px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option value=""999"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(4)&""" value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(3) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaDpto()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD_UBI '"&lsUbigeo&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option  value=""999"">Seleccione</option>"
	While not wRsDptoapli.EOF
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
			wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub




If lsUbigeo <> "" Then




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
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



function enviarcardDatos(dni)
{		
	 			
 pagina = "datosObs.asp?lsdni=" + dni ;
	win = window.open(pagina,'','width=600,height=250,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function envioReporte(){
	
		  for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 valor=document.frmMiForm.nivelRRHH[i].value;
		}
	
	if(document.frmMiForm.cmbCargo.value == '999' )
	{
		 alert("Selecciona el combo del Cargo");
		 document.frmMiForm.cmbCargo.focus();
		 return false; 
	}

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;


		var url;
		

pagina = "m_RESULTADO_FINAL_Exp.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&valor="+escape(valor);
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

</script>
    </head>
    <body>
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
       <div align="center" class="subtitulo">
 	        <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           </div>
<div id="divNavegacion" align="center"><span class="subtitulo">ProcesoSelecci&oacute;n de Ganadores</span></div>
<div id="lateral">
        <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_preseleccion.asp">
            <table width='99%' border='0' cellpadding="2" cellspacing="2">
                   
		  <tr>
		    <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios
	        <span class="criterio">
	        <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
            <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
            <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuarioID%>" />
            <input name="id_proyecto" type="hidden" id="id_proyecto" value="<%=id_proyecto%>" />
	        </span></td>
		    </tr>
		  <tr>
		    <td width="31%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
	        Departamento:&nbsp;</span></td>
		    <td width="69%" align=left bgcolor="#F7F8F9" id="dpto"  nowrap="nowrap"><%generaDpto()%></td>
		    </tr>
		  <tr>
		    <td align=right bgcolor="#F7F8F9"><span class="criterio" id="nomreg">Provincia:</span></td>
		    <td align=left bgcolor="#F7F8F9" id="reg2"  nowrap="nowrap"><select class='e_combo' name="txtProv1" id="txtProv1"   style="width:200px; "  >
		      <option  title="Todos" value="9999" >Seleccione...</option>
		      </select>
		      <span class="alerta5">(*)</span></td>
		    </tr>
		  <tr>
		    <td align=right bgcolor="#F7F8F9"  nowrap="nowrap"><span class="criterio" id="nomdis">Distrito:</span></td>
		    <td align=left bgcolor="#F7F8F9" id="dis2" nowrap="nowrap"><select class='e_combo' name="txtDist1" id="txtDist1" style="width:200px;"  >
		      <option  title="Todos" value="999999" >Seleccione...</option>
		      </select>
		      <span class="alerta5">(*)</span></td>
		    </tr>
		  <tr>
		    <td align=right bgcolor="#F7F8F9"><span class="criterio">Cargo  :</span></td>
		    <td align=left bgcolor="#F7F8F9" id="dpto4"  nowrap="nowrap"><%generaCargo()%>
	        <span class="alerta5">(*)</span></td>
		    </tr>
              <tr>
                <td height="4" colspan="4" align="center" bgcolor="#F7F8F9"><input name='button1' type='button' class="boton" id='button1' onclick="javascript:ResultadoFinal()" value='Aceptar' /></td>
                
              </tr>
              
               <tr>
                <td height="13" colspan="4" align="center" bgcolor="#F7F8F9"><fieldset style=" font-family:Arial;height:45px;border:1;width:100;">
                           <legend class="criterio" style=" font-family:Arial;height:20px;">Filtros de visualizaci&oacute;n:</legend>
                           <table>
                             <tr  bgcolor="#F7F8F9" style=" font-family:Arial;height:5px;border:1;">
                               <td  colspan="4"><input type="radio" name="nivelRRHH" id="TODOS" value="9" checked="checked" onclick="javascript:ResultadoFinal()"  />TODOS
                                 &nbsp;
                                 <input type="radio" name="nivelRRHH" id="AD" value="1" onclick="javascript:ResultadoFinal()" />APROBADOS
                                                                  &nbsp;
                                 <input type="radio" name="nivelRRHH" id="RA" value="2" onclick="javascript:ResultadoFinal()" />DESAPROBADOS
                               </td>
                             </tr>
                           </table>
                         </fieldset>
                </td>
                
              </tr>
              
               <tr>
                <td height="4" colspan="4" align="center" bgcolor="#F7F8F9"><div id="nota" style="display:none" >
                
                <table><tr><td>Valor Minimo: </td><td><input type="text" name="txtmin" id="txtmin" class="e_texto" validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" maxlength="2" /></td></tr>
                <tr><td>Valor Maximo:</td><td><input type="text" name="txtmax" id="txtmax" class="e_texto" validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" maxlength="2" /></td></tr>
                <tr>
                  <td colspan="2" align="center"><input name='button2' type='button' class="boton" id='button2' onclick="javascript:Calificacion_automatica(2)" value='Aceptar' /></td></tr></table>
                </div>
          <div id="posicion"  style="display:none">
          <table><tr>
              <td>Seleccionar los: </td><td><input type="text" name="txtcantidad" id="txtcantidad" class="e_texto" validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" maxlength="2" /> primeros</td></tr>
                <tr>
            <td colspan="2" align="center"><input name='button2' type='button' class="boton" id='button2' onclick="javascript:Calificacion_automatica(3)" value='Aceptar' /></td></tr></table>
                </div>
                </td>
                
              </tr>
            </table>
</form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" style="margin:0;" align="center"></div>
		  <div id="divProceso"></div>
            <iframe id="iframe" width="100%" height="100%" src="" frameborder="0"></iframe>
            </div>
        </div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>

        <!-- scripts -->
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
