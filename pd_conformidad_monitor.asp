<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

id_usuario=  Session("id_usuario")
ipVisitante = Request.ServerVariables("REMOTE_ADDR")
lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
lstipoReport = Request("lstipoReport")
id_Proyecto=Session("id_proyecto")
If lsUbigeo <> "" Then

sub generaPerPlanilla() 
    
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	
	
	sql1 = " exec dbo.spu_ListarPerPlanillaTipo_mon '3', '"&id_proyecto&"' "
	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
    
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmboPerPlanilla"" name=""cmboPerPlanilla"" >"
	Response.Write "<OPTION value=""0"">seleccione....</OPTION>"
	
	While not wRsDptoapli.EOF
	Response.Write "<option title="""&wRsDptoapli(0)&" "&wRsDptoapli(1)&"  Estado:"&wRsDptoapli(4)&"" & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(0)&" "&wRsDptoapli(1)&"  ("&wRsDptoapli(4)&") " & "</option>"			
		
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub



sub generaPerConfPlanilla() 
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.spu_ListarPerPlanillaTipo_mon '4', '"&ID_PROYECTO&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmboPerConfPlanilla"" name=""cmboPerConfPlanilla"" >"
	Response.Write "<OPTION value=""0"">seleccione....</OPTION>"
	
	While not wRsDptoapli.EOF

		Response.Write "<option title="""&wRsDptoapli(0)&" "&wRsDptoapli(1)&"  Estado:"&wRsDptoapli(4)&"" & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(0)&" "&wRsDptoapli(1)&"  ("&wRsDptoapli(4)&") " & "</option>"		
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
	Response.Write " <option  value=""99"">Seleccione</option>"


	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub



sub generaDpto2()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD_UBI '"&lsUbigeo&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto2"" name=""txtDpto2"" onChange=""generaprov2();"">"
	Response.Write " <option  value=""99"">Selecione</option>"


	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
      <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
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
var plan1=0
var plan2=0
var plani=""
function plan(valor)
 {
	 plani=valor
	
	 }

 



function planilla(dni,id_puesto,FINICIO,FFIN,SUELDO,planila,armada,tobs,usuario)
{
	plani=planila;

if (planila!='0')
	if (confirm("Esta Seguro de hacer este cambio?"))
	{
obs=document.getElementById(tobs).value;

valores= "dni=" + dni+"&id_puesto="+escape(id_puesto)+"&FINICIO="+escape(FINICIO)+"&FFIN="+escape(FFIN)+"&SUELDO="+escape(SUELDO)+"&planilla="+escape(plani)+"&armada="+escape(armada)+"&obs="+escape(obs)+"&lsUsuario="+escape(usuario)+"&lsTipo=34";  // parametros a enviar al servidor	

	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("resumen").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("resumen").innerHTML =ajax.responseText;
				
            }
            else if(ajax.status==404){
                     document.getElementById("resumen").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("resumen").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	


	}
else 
{
	alert ("Seleccione una planilla")
	return false
	
	}
}



function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;

	var lsUbiProv =document.getElementById("lsubiprov").value;
	var lsrolusu = document.frmMiForm.txtRol.value;

	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&lsUbiProv="+lsUbiProv+"&lsrolusu="+lsrolusu;  // parametros a enviar al servidor

   		
	url="pd_ProvinciaPlanilla.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg2").innerHTML ="Cargando......";
				
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("reg2").innerHTML =ajax.responseText;
					verdis();
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
	
    var lsUbiDist =document.getElementById("lsubiDist").value;
    var lsrolusu = document.frmMiForm.txtRol.value;
 
	ajax=http_request();
	var valores;	

	valores= "datos=" + escape(varProv)+"&lsUbiDist="+lsUbiDist+"&lsrolusu="+lsrolusu; // parametros a enviar al servidor	
	
	url="pd_DistritoPlanilla.asp";  
	
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
////



function generaprov2(){
     
    var varDpto =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;

	var lsUbiProv =document.getElementById("lsubiprov").value;
	var lsrolusu = document.frmMiForm.txtRol.value;

	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&lsUbiProv="+lsUbiProv+"&lsrolusu="+lsrolusu;  // parametros a enviar al servidor

   		
	url="pd_ProvinciaAprobPlanilla.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg3").innerHTML ="Cargando......";
				
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("reg3").innerHTML =ajax.responseText;
					verdis2();
            }
            else if(ajax.status==404){
                     document.getElementById("reg3").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					
            }
            else{

                     document.getElementById("reg3").innerHTML = ajax.responseText;	
					 			 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function verdis2(){

    
    var varProv =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
	
    var lsUbiDist =document.getElementById("lsubiDist").value;
    var lsrolusu = document.frmMiForm.txtRol.value;
 
	ajax=http_request();
	var valores;	

	valores= "datos=" + escape(varProv)+"&lsUbiDist="+lsUbiDist+"&lsrolusu="+lsrolusu;  // parametros a enviar al servidor	
	
	url="pd_DistritoAprobPlanilla.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dis3").innerHTML ="Cargando......";
				 
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dis3").innerHTML =ajax.responseText;
					
            }
            else if(ajax.status==404){
                     document.getElementById("dis3").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					
            }
            else{

                     document.getElementById("dis3").innerHTML = ajax.responseText;					 
					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function CambioRepPlanilla()
{

	document.frmMiForm.submit();
}


//PRE CONFORMIDAD
function mostrardivpreconfor() {

divprecon = document.getElementById('preconfor');

divprecon.style.display = '';

}

function ocultardivpreconfor() {

divprecon = document.getElementById('preconfor');

divprecon.style.display='none';

}

///CONFORMIDAD

function mostrardivconfor() {

divconf = document.getElementById('confor');

divconf.style.display = '';

}

function ocultardivconfor() {

divconf = document.getElementById('confor');

divconf.style.display='none';

}


//mostrar ocultar div a la vez
function mostrarocultardivpreconfor() {

divprecon = document.getElementById('preconfor');
divconf = document.getElementById('confor');

divprecon.style.display='';
divconf.style.display = 'none';

}
function mostrarocultardivconfor() {

divconf = document.getElementById('confor');
divprecon = document.getElementById('preconfor');

divconf.style.display = '';
divprecon.style.display='none';

}


function ValidaExisteDNIFicha(){
 var txtDNI=$("#txtDNI").val();
 var obj=document.getElementById('txtDNI');
 
  if (document.frmMiForm.txtDNI.value.length <8)
  {
	 alert("El DNI debe de tener 8 digitos")
	 document.getElementById("txtDNI").focus();
	 return false
  }
  else
  {
		a = 'pd_dtConsultaPlanillaPago_PEA.asp?lsDNI='+txtDNI ;
		window.open(a, 'expe1','top=30,left=15,scrollbars=yes,width=850,height=450,resizable=1' )	;
  }
}

</script>
    </head>
    <body onload="mostrarocultardivpreconfor;mostrarocultardivconfor;">
        <div id="top">
          <!--#include file="cabecera.html"-->
		  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Pago: Consulta de Conformidad RAO y RO</span></div>      
  <div id="lateral" >
                <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_conformidad_monitor.asp">
          <table width='100%' border='0' cellpadding="6" cellspacing="2">
	         
	       <input type="hidden"  id="txtRol" name="txtRol" value="<%=lsRol%>" />
			
	       <INPUT type="hidden" id=txtipusuario name=txtipusuario value="<%=ipVisitante%>">
           <INPUT type="hidden" id=txtusuario name=txtusuario value="<%=id_usuario%>">
		   <INPUT type="hidden" id="lsubiprov"  name="lsubiprov" value="<%=lsUbigeoapli%>" >
           <INPUT type="hidden" id="lsubiDist" name="lsubiDist" value="<%=lsUbigeoDist%>">

              <table style="border:0;">
              <tr style="border:0;">
               <td class="etiqueta">
                <%If  lstipoReport="1" then x="checked" else x="" end If%> 
               <input name="lstipoReport" type="radio" <%=x%> value="1" checked="checked" onclick="mostrarocultardivpreconfor();">Pre Conformidad&nbsp;&nbsp;&nbsp; 
			   <%If  lstipoReport="2" then x="checked" else x="" end If%> 
               <input name="lstipoReport" type="radio" <%=x%> value="2" onclick="mostrarocultardivconfor();">Conformidad Aprobada&nbsp;&nbsp;&nbsp; 

               </td>
              </tr>
              </table>
              <div id="preconfor" >
              <tr>
                <td width="100%" align="left"  bgcolor="#CCCCCC" class="mensaje2"><br></td>
              </tr>
              <tr>
                <td align="left"   bgcolor="#EFF5FA" class="mensaje2"><table>
                  <tr  bgcolor="#F7F8F9" style=" font-family:Arial;height:5px;border:1;">
                  <td  colspan="4"><table>
                    <tr>
                      <td  width="29%"  align=right bgcolor="#F7F8F9"><p><span class="criterio" > Per&iacute;odo: </span></p></td>
                      <td width="29%" align="left" ><%generaPerPlanilla()%>
                        <span class="alerta5">(*)</span></td>
                    </tr>
                    <tr>
                      <td width="29%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto2" >
                        <input name="lsubiprov2" type="hidden" id="lsubiprov2" value="<%=lsUbigeoapli%>" />
                        Departamento:&nbsp;</span></td>
                      <td width="71%" align=left bgcolor="#F7F8F9" id="dep2"  nowrap="nowrap"><%generaDpto()%>
                        <span class="criterio">
                          <input name="txtUsuario2" type="hidden" id="txtUsuario2" value="<%=lsUsuario%>" />
                        </span></td>
                    </tr>
                    <tr>
                      <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Provincia:</span></td>
                      <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                        <option id="txtProv1" 	title="Todos" value="9999" > Seleccione </option>
                      </select></td>
                    </tr>
                    <tr>
                      <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                      <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                        <option id="txtDist1" 	title="Todos" value="999998" >Seleccione </option>
                      </select></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr  bgcolor="#F7F8F9" style=" font-family:Arial;height:5px;border:1;">
                      <td  colspan="4">&nbsp;
                         <input type="radio" name="nivelRRHH" id="RA2" value="1" checked="checked"  />
                        <label for="12" class="etiqueta">RAO</label>
                          &nbsp;&nbsp;&nbsp;
                             <input type="radio" name="nivelRRHH" id="RO2" value="2" />
                        <label for="22" class="etiqueta" >RO</label></td>
                    </tr>
                  </table></td>
                  </tr>
                </table>
                  <br />
                
                <table align="center" border="0">

                      <tr align="center">
                      <td height="4"  bgcolor="#F7F8F9"><INPUT name='button1' type='button' class="boton" id='button1' onClick="ConsultarPreConf(1);" value='Aceptar'><br><br></td>

                      </tr>
                      <td align="center">
                       <input type="button" name="button1" id="button1" class="boton" value="Resumen" onClick="javascript:SeleccionarPlanResumen(1); " /><br></br>
                       </td>
                       </tr>
                </table>
                </td>
              </tr>
              
              </div>
              
              <div id="confor" style="display:none;">
                               <tr>
                <td align="left"  bgcolor="#CCCCCC" class="mensaje2"><br></td>
              </tr>
              <tr>
                <td align="left"   bgcolor="#EFF5FA" class="mensaje2">

				 
				 <table>
                    <tr>
                      <td width="29%"  align=right bgcolor="#F7F8F9"><p><span class="criterio">
                       Per&iacute;odo: 
                       </span></p>
				      </td>
					    <td width="29%" align="left">
                       <%generaPerConfPlanilla()%>
                       <span class="alerta5">(*)</span>
					   </td>
					   
                    </tr>
                    
                     <tr>
                     <td width="29%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
                     <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                     Departamento:&nbsp;</span></td>
				     <td width="71%" align=left bgcolor="#F7F8F9" id="dep"  nowrap="nowrap"><%generaDpto2()%>
                     <span class="criterio">
                     <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
                    </span>
				     </td>
				    
				
                   </tr>
                   <tr>
                     <td  align="right" bgcolor="#F7F8F9"id="nomreg3"><span class="criterio">Provincia:</span></td>
                     <td bgcolor="#F7F8F9" class='criterio'id="reg3"><select class='e_combo' name="txtProv2" id="txtProv2"  style="width:200px">
					<option id="txtProv2" 	title="Todos" value="9999" > Seleccione </option>					
                    </select></td>
                   </tr>
                   <tr>
                    <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                    <td bgcolor="#F7F8F9" class='criterio'id="dis3"><select class='e_combo' name="txtDist2" id="txtDist2"  style="width:200px;" >
					<option id="txtDist2" 	title="Todos" value="999998" >Seleccione </option>
					
					
                    </select></td>
                   </tr>
                   <tr><td>&nbsp;</td></tr>
                   

                    <tr  bgcolor="#F7F8F9" style=" font-family:Arial;height:5px;border:1;">
		              <td  colspan="4">&nbsp;
		                <input type="radio" name="nivelRRHH2" id="RA" value="1" checked="checked"  />
                      <label for="1" class="etiqueta">RAO</label>
                      &nbsp;&nbsp;&nbsp;
                                      <input type="radio" name="nivelRRHH2" id="RO" value="2" />
                      <label for="2" class="etiqueta" >RO</label>
			         </td>
		           </tr>

                    
                    
                                    
                  </table>

                <br />
                <table align="center" border="0">
                    
					
					<tr align="center" style="border:0;">
                       
                       <td align="center" style="border:0;">
                       <input type="button" name="button1" id="button1" class="botonExp" value="Aceptar"  onClick="SeleccionarAprobarConf(1);" /><br></br>
                       </td>
                       

                    
                       </tr>
					
					
					<tr>
					<td align="center">
                       <input type="button" name="button1" id="button1" class="botonExp" value="Resumen" onClick="javascript:SeleccionarPlanResumenConfAp(1); "  /><br></br>
                       </td>
					</tr>
					
					
                    
                       
                </table>
				</td>
              </tr>
			  
              </div>
              
            </table>
  </form>
    <DIV ID="resumen">
  <%' gastos() %>
 
  </DIV>
        </div>
        <strong></strong>
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
			<div id="divResultado" align="center"  style=" font-family:Arial;font-size:10px;height:100%;" ></div>
             <div id="mensaje" style="width:100%; height:300px; overflow:auto; float:right"></div>
             <div id="mensaje2" style="width:100%; height:200px; overflow:auto; float:right"> </div>
              <div id="mensaje3" style="width:100%; height:13px; overflow:auto; float:right"> </div>
              <div id="mensaje4" style="width:100%; height:13px; overflow:auto; float:right"> </div>
              
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
