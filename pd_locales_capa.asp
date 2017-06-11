<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 

sub generaDpto()
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec  dbo.getCCDD_UBI '"&lsUbigeo&"'"
	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:130px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option id=""valor_defecto"" value=""99"">Todos</option>"

	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


Response.Expires = 0




If lsUbigeo <> "" Then



%>

<html>
<head>
   <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
   <link rel="shortcut icon" href="images/favicon.ico" />

<link rel="stylesheet" type="text/css" href="Styles/inei.css">
<link rel="stylesheet" type="text/css" href="Styles/calendar-blue.css">
 <link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
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

function eliminar(id)
{
	
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&lsTipo=17A";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML =ajax.responseText;
		
					mostrar()
            }
            else if(ajax.status==404){
                      document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	

	}
	
	
function mostrar(){
     
depa=document.getElementById("txtDpto1").value;
prov=document.getElementById("txtProv1").value;
dist=document.getElementById("txtDist1").value;


	ajax=http_request();
	var valores;	
	valores= "depa=" + escape(depa)+"&prov=" + escape(prov)+"&dist=" + escape(dist);  // parametros a enviar al servidor	
	
	url="m_locales_capa.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML =ajax.responseText;
					
            }
            else if(ajax.status==404){
                 document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	


}

function ver_LocalesCap(id_lugar){

	ajax=http_request();
	var valores;	
	valores= "id_lugar=" + escape(id_lugar);  // parametros a enviar al servidor	
	
	url="m_Aulas_capa.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML =ajax.responseText;
					
            }
            else if(ajax.status==404){
                 document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	


}


function asignarAula_PEA(id, cant,lugar){

	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&cant=" + escape(cant)+"&lsTipo=11B";
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML =ajax.responseText;
					alert('Se realizo el registro con exito');
					ver_LocalesCap(lugar);
					
            }
            else if(ajax.status==404){
                 document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	


}


function exportarAD(id_aula)
{		
	 			
 pagina = "exportarAD.asp?id_aula=" + id_aula ;
	win = window.open(pagina,'','width=600,height=800,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function exportarAXD(id_aula)
{		
	 			
 pagina = "exportarAXD.asp?id_aula=" + id_aula ;
	win = window.open(pagina,'','width=600,height=800,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function exportarAN(id_aula)
{		
	 			
 pagina = "exportarAN.asp?id_aula=" + id_aula ;
	win = window.open(pagina,'','width=600,height=800,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}


function exportarl1(id_aula)
{		

 pagina = "exportarl1.asp?id_aula=" + id_aula ;
	win = window.open(pagina,'','width=600,height=800,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function exportarl2(id_aula)
{		
	 			
 pagina = "exportarl2.asp?id_aula=" + id_aula ;
	win = window.open(pagina,'','width=600,height=800,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function exportarl3(id_aula)
{		
	 			
 pagina = "exportarl3.asp?id_aula=" + id_aula ;
	win = window.open(pagina,'','width=600,height=800,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function exportarl4(id_aula)
{		
	 			
pagina = "exportarl4.asp?id_aula=" + id_aula ;
	win = window.open(pagina,'','width=600,height=800,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}


function grabar(){
     
var depa=document.getElementById("txtDpto1").value;
var prov=document.getElementById("txtProv1").value;
var dist=document.getElementById("txtDist1").value;
var local=document.getElementById("txtlocal").value;
var dire=document.getElementById("txtdireccion").value;
var ref=document.getElementById("txtref").value;
var aulas=document.getElementById("txtaulas").value;
var hora=document.getElementById("txtHora").value;
var PEA= document.getElementById("txtPEA").value;
var fecha= document.getElementById("txtFecha").value;
var PEA_aula=0;
var ult=0;
if (PEA%aulas!=0){
	PEA_aula=parseInt(PEA/aulas)+1;
	ult=parseInt(PEA-PEA_aula*(aulas-1));
}
else {
	PEA_aula=parseInt(PEA/aulas);
	ult=PEA_aula;
}

if(depa==99)
{
	alert("Seleccione el departamento");
	document.getElementById("txtDpto1").focus();
	return false;
	
	}
	
	
if(prov==9999)
{
	alert("Seleccione la Provincia");
	document.getElementById("txtProv1").focus();
	return false;
	
	}

if( dist==999999 )
{
	alert("Seleccione el distrito");
	document.getElementById("txtDist1").focus();
	return false;
	
	}
if(local=="")
{
	alert("Ingrese el nombre del local");
	return false;
	
	}
if(dire=="")
{
	alert("Ingrese la direccion del Local");
	return false;
	
	}
if(ref=="")
{
	alert("Ingrese una referencia para entrar al local");
	return false;
	
	}
if(aulas=="" || aulas=="0")
{
	alert("Ingrese la cantidad de aulas del local");
	return false;
	
	}
	if(fecha=="" || fecha=="0")
{
	alert("Ingrese la fecha de capacitacion");
	return false;
	
	}
if(hora=="" || hora=="0")
{
	alert("Ingrese la Hora de capacitacion");
	return false;
	
	}
	
if(PEA=="")
{
	alert("Ingrese la cantidad de PEA a capacitar");
	return false;
	
	}
/*if (parseInt(PEA)<=parseInt(aulas)){
	alert("Ingreso Incorrecto, la cantidad de aulas debe ser menor a la cantidad de Personas a Capacitar");
	return false;
	}	*/
	
	ajax=http_request();
	var valores;	
	valores= "depa=" + escape(depa)+"&prov=" + escape(prov)+"&dist=" + escape(dist)+"&local=" + escape(local)+"&refe=" + escape(ref)+"&dire=" + escape(dire)+"&aulas=" + escape(aulas)+"&PEA=" + escape(PEA)+"&PEA_aula=" + escape(PEA_aula)+"&ult=" + escape(ult)+"&hora=" + escape(hora)+"&fecha=" + escape(fecha)+"&lsTipo=11A";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML =ajax.responseText;
					mostrar();
					document.getElementById("txtlocal").value='';
					document.getElementById("txtdireccion").value='';
					document.getElementById("txtref").value='';
					document.getElementById("txtaulas").value='';
					document.getElementById("txtHora").value='';
					document.getElementById("txtPEA").value='';
					
            }
            else if(ajax.status==404){
                      document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function Editar(id){
     
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id);  // parametros a enviar al servidor	
	
	url="m_locales_capaeDITA.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML =ajax.responseText;
					
            }
            else if(ajax.status==404){
                 document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	


}

function asignar(){
     if(confirm("Esta seguro de realizar la asignacion de locales de preseleccion a nivel nacional?"))
			{
	 
	ajax=http_request();
	var valores;	
	valores= "lsTipo=128";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML ="<div align='center'> <span class='subtitulo'>Se realiz&oacute; la asignaci&oacute;n de locales de preselecci&oacute;n a nivel nacional</span></div>";
					
            }
            else if(ajax.status==404){
                 document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
			}
			else 
			{return false;
			}

}

function act_Aulas(){
     if(confirm("Esta seguro de Actualizar auls por local"))
			{
	 
	ajax=http_request();
	var valores;	
	valores= "lsTipo=130";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML ="<div align='center'> <span class='subtitulo'>Se realiz&oacute; la actualizaci&oacute;n con &eacute;xito</span></div>";
					
            }
            else if(ajax.status==404){
                 document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
			}
			else 
			{return false;
			}

}

function borrarAsig(){
	
	 if(confirm("Esta seguro de borrar la asignacion de locales de preseleccion a nivel nacional?"))
			{
     
	ajax=http_request();
	var valores;	
	valores= "lsTipo=129";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("detalle_local").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("detalle_local").innerHTML ="<div align='center'> <span class='subtitulo'> Se elimin&oacute; la asigna&oacute;n de locales a nivel nacional </span></div>"
					
            }
            else if(ajax.status==404){
                 document.getElementById("detalle_local").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("detalle_local").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}
			else 
			{return false;
			}

}



function Actualizar(id){
	

			
	var local=document.getElementById("txtloc"+id).value;
	var direccion=document.getElementById("txtdir"+id).value;
	var referencia=document.getElementById("txtref"+id).value;
	var fecha=document.getElementById("txtfec"+id).value;
	var hora=document.getElementById("txthor"+id).value;
	var aulas=document.getElementById("txtaul"+id).value;
	var cantPEA=document.getElementById("txtcan"+id).value;
	var aulasOrg=document.getElementById("txtaulasOrg").value;
	var cantPEAOrg=document.getElementById("txtPEAorg").value;
	
	/*var PEA_aula=0;
	var ult=0;
	var indic=0;
	
	if (cantPEAOrg!=cantPEA || aulas!=aulasOrg){
		
		indic=1;	

		if (cantPEA%aulas!=0){
			PEA_aula=parseInt(cantPEA/aulas)+1;
			ult=parseInt(cantPEA-PEA_aula*(aulas-1));
		}
		else {
			PEA_aula=parseInt(cantPEA/aulas);
			ult=PEA_aula;
		}

	
	}*/
	PEA_aula=0;
	ult=0;
	indic=1;
				
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&local=" + escape(local)+"&direccion=" + escape(direccion)+"&referencia=" + escape(referencia)+"&hora=" + escape(hora)+"&aulas=" + escape(aulas)+"&cantPEA=" + escape(cantPEA)+"&fecha=" + escape(fecha)+"&PEA_aula=" + escape(PEA_aula)+"&ult=" + escape(ult)+"&indic=" + escape(indic)+"&lsTipo=87";  // parametros a enviar al servidor
	url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){	
			document.getElementById("detalle_local").innerHTML =ajax.responseText;
				alert('Se realizo la actualizacion con exito');			
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


function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
				    var lsUbiProv =document.getElementById("lsubiprov").value;

	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&lsUbiProv="+lsUbiProv;  // parametros a enviar al servidor	
	url="m71_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg2").innerHTML ="Cargando......";
				 document.getElementById("nomreg2").innerHTML ="Provincia:";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("reg2").innerHTML =ajax.responseText;
					document.getElementById("nomreg2").innerHTML ="Provincia:";
					verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("reg2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					 document.getElementById("nomreg2").innerHTML ="Provincia:";
            }
            else{

                     document.getElementById("reg2").innerHTML = ajax.responseText;	
					 document.getElementById("nomreg2").innerHTML ="Provincia:";				 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function verdis(){

    
    var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m6_Distrito.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dis2").innerHTML ="Cargando......";
				 document.getElementById("nomdis2").innerHTML ="Distrito:";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dis2").innerHTML =ajax.responseText;
					document.getElementById("nomdis2").innerHTML ="Distrito:";
            }
            else if(ajax.status==404){
                     document.getElementById("dis2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					 document.getElementById("nomdis2").innerHTML ="Distrito:";
            }
            else{

                     document.getElementById("dis2").innerHTML = ajax.responseText;					 
					 document.getElementById("nomdis2").innerHTML ="Distrito:";
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function exportar(){
	
var depa=document.getElementById("txtDpto1").value.substr(0,2);
var prov=document.getElementById("txtProv1").value.substr(2,2);
var dist=document.getElementById("txtDist1").value.substr(4,2);
	 			
 pagina = "Exp_local_capacita.asp?depa="+depa+"&prov="+prov+"&dist="+dist;
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

</script>
<link rel="stylesheet" type="text/css" href="Styles/calendar-blue.css">
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calendar-setup.js"></script>
	<script type="text/javascript" src="js/calendar-es.js"></script>
	<script type="text/javascript" src="js/sorttable.js"></script>

</head>
<body>
	<!--#include file="cabecera.html"--> 

	  <!--#include file="pd_menu.asp"-->
       <div id="divNavegacion" align="center"><span class="subtitulo">Ingresos de los locales de Capacitacion</span></div>
	  
<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_locales_seleccion.asp">       
                <table width="100%" border="0" cellpadding="3" cellspacing="3">
  <tr>
    <td colspan="6" bgcolor="#F7F8F9" class="criterio"><span class="alerta5">(*)</span> Campo Obligatorio</td>
    </tr>
  <tr>
    <td width="82" bgcolor="#F7F8F9" class="criterio"><span class="e_td_string">
      <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>">
      Departamento</span></td>
    <td width="176" bgcolor="#F7F8F9"><span class="e_td_string">
      <%generaDpto()%>
    </span></td>
    <td width="55" bgcolor="#F7F8F9"  class="criterio" id="nomreg2"><span class="e_td_string">Provincia</span></td>
    <td width="231" align=left bgcolor="#F7F8F9" id="reg2"><span class="e_td_string">
      <select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
        <option id="txtProv1_99" 	title="Todos" value="9999" > Todos </option>
      </select>
      </span></td>
    <td width="51" bgcolor="#F7F8F9"  class="criterio" id="nomdis2" ><span class="e_td_string">Distrito</span></td>
    <td align=left bgcolor="#F7F8F9" id="dis2"><span class="e_td_string">
      <select class='e_combo' name="txtDist1" id="txtDist1"  style="width:270px;" >
        <option id="txtDist1_99" 	title="Todos" value="999999" >Todos </option>
      </select>
    </span></td>
    </tr>
  <tr>
    <td bgcolor="#F7F8F9" class="criterio"><span class="e_td_string">Local</span></td>
    <td colspan="3" bgcolor="#F7F8F9"><span class="e_td_string">
      <input name="txtlocal" type="text"  id="txtlocal" style="font-size:9px;text-transform: uppercase;" onKeyPress="return TextUtil.allowChars(this, event)" size="120" maxlength="120"  validchars="-0123456789abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " >
    </span></td>
    <td bgcolor="#F7F8F9"  class="criterio" id="nomdis" ><span class="e_td_string">Direcci&oacute;n</span></td>
    <td align=left bgcolor="#F7F8F9" id="dis"><span class="e_td_string">
      <input name="txtdireccion" type="text"  id="txtdireccion" style="font-size:9px;text-transform: uppercase;" onKeyPress="return TextUtil.allowChars(this, event)" size="85" maxlength="120"  validchars="-0123456789abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ ">
    </span></td>
    </tr>
  <tr>
    <td bgcolor="#F7F8F9" class="criterio"><span class="e_td_string">Rreferencia</span></td>
    <td colspan="3" bgcolor="#F7F8F9"><span class="e_td_string">
      <input name="txtref" type="text"  id="txtref" style="font-size:9px;text-transform: uppercase;" onKeyPress="return TextUtil.allowChars(this, event)" size="120" maxlength="120"  validchars="-0123456789abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ ">
    </span></td>
    <td align=left bgcolor="#F7F8F9" class="criterio" >Fecha:</td>
    <td align=left bgcolor="#F7F8F9" ><span class="e_td_string">
      <input type='text' class='e_text'  id='txtFecha' name='txtFecha' size="50"  style="font-size:9px;text-transform: uppercase;" value='' maxlength='50'>
    </span></td>
    </tr>
    
    <tr>
    <td bgcolor="#F7F8F9" class="criterio">Hora</td>
    <td bgcolor="#F7F8F9"><span class="e_td_string">
      <input type='text' class='e_text' size="45"  id='txtHora' name='txtHora'  style="font-size:9px;text-transform: uppercase;" value='' maxlength='35'>
    </span></td>
    <td bgcolor="#F7F8F9"><span class="criterio">Aulas</span></td>
    <td bgcolor="#F7F8F9"><span class="e_td_string">
      <input type='text' class='e_text'  id='txtaulas' name='txtaulas'  style="font-size:9px;text-transform: uppercase;" value=''  validchars=" 0123456789" onKeyPress="return TextUtil.allowChars(this, event)" maxlength='20'>
    </span></td>
    <td align=left bgcolor="#F7F8F9" class="criterio" >PEA</td>
    <td align=left bgcolor="#F7F8F9" ><span class="e_td_string">
      <input type='text' class='e_text'  id='txtPEA' name='txtPEA'  style="font-size:9px;text-transform: uppercase;" value=''  validchars=" 0123456789" onKeyPress="return TextUtil.allowChars(this, event)" maxlength='20'>
    </span></td>
    </tr>
  <tr>
    <td align="center" bgcolor="#F7F8F9"><span class="e_td_string">
      <input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onClick="javascript:grabar()" 
                        value='Ingresar'>
    </span></td>
    <td align="center" bgcolor="#F7F8F9"><span class="e_td_string">
      <input 
                        name='button4'  type='button' class="boton" 				
                        id='button4' 
                        onClick="javascript:mostrar()" 
                        value='Mostrar'>
    </span></td>
    <td align="center" bgcolor="#F7F8F9">&nbsp;</td>
    <td align="center" bgcolor="#F7F8F9"><span class="e_td_string">
      <input 
                        name='button2'  type='button' class="boton" 				
                        id='button2' 
                        onClick="javascript:exportar()" 
                        value='Exportar'>
    </span></td>
    <td align="center" bgcolor="#F7F8F9">&nbsp;</td>
    <td align="center" bgcolor="#F7F8F9"><span class="e_td_string">
     <input 
                        name='button5'  type='button' class="boton" 				
                        id='button5' 
                        onClick="javascript:act_Aulas()" 
                        value='Act. Aulas'>&nbsp;&nbsp;
      <input 
                        name='button5'  type='button' class="boton" 				
                        id='button5' 
                        onClick="javascript:asignar()" 
                        value='Asignaci&oacute;n'>&nbsp;&nbsp;
    </span>  <span class="e_td_string">
    <input 
                        name='button6'  type='button' class="boton" 				
                        id='button6' 
                        onClick="javascript:borrarAsig()" 
                        value='Borrar Asig.'>
    </span></td>
    </tr>
                </table>
</form>    
              
		 <div id="detalle_local"></div>
   

</body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
