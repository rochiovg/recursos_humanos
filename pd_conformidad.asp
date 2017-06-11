<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%

Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0

id_usuario=  Session("id_usuario")
ipVisitante = Request.ServerVariables("REMOTE_ADDR")
lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
lstipoReport = Request("lstipoReport")

id_proyecto=session("id_proyecto")

If lsUbigeo <> "" Then


%>
<%

fechayhora= Now()

sub generaPerPlanilla() 
			
    
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	
	sql1 = " exec dbo.spu_ListarPerPlanillaTipo '3', '"&id_proyecto&"' "

	
	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
    
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmboPerPlanilla"" name=""cmboPerPlanilla""  >"
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
	sql1 = " exec dbo.spu_ListarPerPlanillaTipo '4', '"&id_proyecto&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmboPerConfPlanilla"" name=""cmboPerConfPlanilla"" OnChange="" MontoTotalPla(this.value);"" >"
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
	Response.Write " <option  value=""99"">Todos</option>"


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
	Response.Write " <option  value=""99"">Todos</option>"


	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub


SQL2 = "exec dbo.getNombreProy '"&id_proyecto&"'  "	
	
		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
		NombreProy=CStr(RSCuad2(0))
		codigoMeta=CStr(RSCuad2(1))
		codigoProy=CStr(RSCuad2(2))
		
		
		RSCuad2.Close
	Set RSCuad2 = Nothing



%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /> 
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

 

function MontoTotalPla(id_pla){
	
	ajax=http_request();
	var valores;	

	valores= "id_pla=" + escape(id_pla)+"&lsTipo=96";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 				 
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){	
				var Datos = new Array();             
				var Dat=ajax.responseText;
				Datos=Dat.split("*");

		$("#total_pla").val(Datos[0]); 
		$("#periodo").val(Datos[1]); 
					
            }
            else if(ajax.status==404){
                     					
            }
            else{
		 
					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
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
		window.open(a, 'expe1','top=20,left=10,scrollbars=yes,width=890,height=485,resizable=1' )	;
  }
}




function SeleccionarPlanillaSIGA(){
 
 	 var lsperiodo2=document.getElementById("cmboPerConfPlanilla").value; 
	 var valores= "lsperiodo2=" + escape(lsperiodo2);
	 	
		ajax=http_request();
        url="pd_planillaSIga.asp"; 
        ajax.open ('POST', url, true);
    	ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
        else if (ajax.readyState==4){
            if(ajax.status==200){
                  document.getElementById("divResultado").innerHTML =ajax.responseText;                                                
            }
            else if(ajax.status==404){
                 document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                document.getElementById("divResultado").innerHTML = ajax.responseText;           
                                                
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
                
                
   return;              

}


</script>
    </head>
    <body onload="mostrarocultardivpreconfor;mostrarocultardivconfor;">
        <div id="top">
          <!--#include file="cabecera.html"-->
		  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Pago: Consulta de Conformidad</span></div>      
  <div id="lateral" >
                <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_conformidad.asp">
          <table width='100%' border='0' cellpadding="6" cellspacing="2">
	         
	       <input type="hidden"  id="txtRol" name="txtRol" value="<%=lsRol%>" />
			
	       <INPUT type="hidden" id=txtipusuario name=txtipusuario value="<%=ipVisitante%>">
           <INPUT type="hidden" id=txtusuario name=txtusuario value="<%=id_usuario%>">
		   <INPUT type="hidden" id="lsubiprov"  name="lsubiprov" value="<%=lsUbigeoapli%>" >
           <INPUT type="hidden" id="lsubiDist" maxlength="900" name="lsubiDist" value="<%=lsUbigeoDist%>">

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
                <td align="left"   bgcolor="#EFF5FA" class="mensaje2">

                  <table>
                    <tr>
                      <td  width="29%"  align=right bgcolor="#F7F8F9"><p><span class="criterio" >
                      Per&iacute;odo:
                       </span></p>
				     </td>
					    <td width="29%" align="left" >					   
                       <%generaPerPlanilla()%>
                       <span class="alerta5">(*)</span>
					   </td>
					   
                    </tr>
                    

                     <tr>
                     <td width="29%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
                     <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                     Departamento:&nbsp;</span></td>
 
				     <td width="71%" align=left bgcolor="#F7F8F9" id="dep"  nowrap="nowrap"><%generaDpto()%>
                     <span class="criterio">
                     <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
                    </span>
				     </td>
				    
				
                   </tr>
                   <tr>
                     <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Provincia:</span></td>
                     <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
					<option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
					
					
                    </select></td>
                   </tr>
                   <tr>
                    <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                    <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
					<option id="txtDist1" 	title="Todos" value="999998" >Todos </option>
					
					
                    </select></td>
                   </tr>
                   <tr><td>&nbsp;</td></tr>
                   

                    <tr  bgcolor="#F7F8F9" style=" font-family:Arial;height:5px;border:1;">
		              <td  colspan="4">
		              <input type="radio" name="nivelRRHH" id="TODOS" value="9" checked="checked"/>
                      <label for="4" class="etiqueta" ><strong>TODOS</strong></label>&nbsp;&nbsp;&nbsp;
		              <input type="radio" name="nivelRRHH" id="AD" value="3"  />
                      <label for="3" class="etiqueta" >RTA</label>&nbsp;&nbsp;&nbsp;
                      <input type="radio" name="nivelRRHH" id="RA" value="1"  />
                      <label for="1" class="etiqueta">RAO</label>&nbsp;&nbsp;&nbsp;
                      <input type="radio" name="nivelRRHH" id="RO" value="2" />
                      <label for="2" class="etiqueta" >RO</label>
			         </td>
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
					  
                   <tr>
                    <td height="4" colspan="4" align=center  bgcolor="#F7F8F9" class="alerta5">Para la consulta siguiente se procesar&aacute; todos los registros para el periodo seleccionado:</td>
                   </tr>
                   <tr>
                    <td height="4" colspan="4" align=center  bgcolor="#F7F8F9" class="alerta5">&nbsp;</td>
                   </tr>				   
					   
					   <tr >
                      <td align="center">
                       <input type="button"  name="button1" id="button1"  class="boton" value="Exportar" onclick="expoconformi()" /><br></br>
                       </td>
					  </tr>
					  <tr>
					   
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
					<option id="txtProv2" 	title="Todos" value="9999" > Todos </option>					
                    </select></td>
                   </tr>
                   <tr>
                    <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                    <td bgcolor="#F7F8F9" class='criterio'id="dis3"><select class='e_combo' name="txtDist2" id="txtDist2"  style="width:200px;" >
					<option id="txtDist2" 	title="Todos" value="999998" >Todos </option>
					
					
                    </select></td>
                   </tr>
                   <tr><td><span class="criterio">
                   <input type="hidden" name="total_pla" id="total_pla" value="" />
                    <input type="hidden" name="periodo" id="periodo" value="" />
                   <input type="hidden" name="fechayhora" id="fechayhora" value=<%=fechayhora%> />
                   <input type="hidden" name="NombreProy" id="NombreProy" value=<%=NombreProy%> />
                   <input type="hidden" name="id_proyecto" id="id_proyecto" value=<%=id_proyecto%> />

                   </span></td></tr>
                   

                    <tr  bgcolor="#F7F8F9" style=" font-family:Arial;height:5px;border:1;">
		              <td  colspan="4">
		              <input type="radio" name="nivelRRHH2" id="TODOS" value="9" checked="checked"/>
                      <label for="4" class="etiqueta" ><strong>TODOS</strong></label>&nbsp;&nbsp;&nbsp;
		              <input type="radio" name="nivelRRHH2" id="AD" value="3"  />
                      <label for="3" class="etiqueta" >RTA</label>&nbsp;&nbsp;&nbsp;
                      <input type="radio" name="nivelRRHH2" id="RA" value="1"  />
                      <label for="1" class="etiqueta">RAO</label>&nbsp;&nbsp;&nbsp;
                      <input type="radio" name="nivelRRHH2" id="RO" value="2" />
                      <label for="2" class="etiqueta" >RO</label>
			         </td>
		           </tr>

                    
                    
                                    
                  </table>

                <br />
                <table align="center" border="0">
                    
					
					<tr align="center" style="border:0;">
                       
                       <td align="center" colspan="2" style="border:0;">
                       <input type="button" name="button1" id="button1" class="botonExp" value="Aceptar"  onClick="SeleccionarAprobarConf(1);" /><br></br>
                       </td>
                       

                    
                       </tr>
					
					
					<tr>
					<td align="center" colspan="2">
                       <input type="button" name="button1" id="button1" class="botonExp" value="Resumen" onClick="javascript:SeleccionarPlanResumenConfAp(1); "  /><br></br>
                       </td>
					</tr>
					<tr>
                    <td height="4" colspan="4"  bgcolor="#F7F8F9" class="alerta5">Para las consultas siguientes se procesar&aacute;n todos los registros para el periodo seleccionado:</td>
                   </tr>
				   
				   <tr>
                    <td height="4" colspan="4" align=center  bgcolor="#F7F8F9" class="alerta5">&nbsp;</td>
                   </tr>
			  
					
					 <tr >
                      <td align="center">

                       <input type="button" name="button1" id="button1" class="botonExp"  value="Exportar" 
                       onclick="expPLa('<%=NombreProy%>','<%=codigoMeta%>','<%=codigoProy%>','<%=fechayhora%>')" /><br></br>
                       </td>

                      <td align="center">
                       <input type="button" name="button1" id="button1" class="botonExp" value="Exportar SIGA" onClick="expSIGA(); " /><br></br>
                       </td>

                    </tr>
                    
                     <tr >
                      <td colspan="2" align="center">

                       <input type="button" name="button1" id="button1" class="botonExp"  value="Ver SIga" 
                       onclick="SeleccionarPlanillaSIGA()" /><br></br>
                       </td>

                    </tr>



					<tr>
                    <td height="4" colspan="4"   bgcolor="#F7F8F9" class="alerta5">
                    --------------------------------------------------------------------------------
                    </td>
                   </tr>

					<tr>
                    <td height="4" colspan="4" bgcolor="#F7F8F9" class="alerta5">&nbsp;CONSULTA de Pagos y Seguimiento de Reemplazos de la PEA, por DNI:</td>
                   </tr>

					 <tr >
						<td colspan=2>&nbsp;&nbsp;DNI:&nbsp;<input type="text" name="txtDNI" id="txtDNI" class="e_texto" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" maxlength="8" />&nbsp;&nbsp;&nbsp;&nbsp;
						<img src="images/PEA1.ico" border="0" width="18" height="18" style="CURSOR: hand" title="Consulta de Pagos y seguimiento de Reemplazos, por DNI" onclick="ValidaExisteDNIFicha()" /></td>

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
			<div id="divResultado" align="center"  style=" font-family:Arial;font-size:10px;height:100%; overflow-y:scroll " ></div>
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
