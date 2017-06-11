<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 
 <%

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargo ""1,2"" ")
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" onChange=""valida_nivel2(this.value);"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaDpto()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCCDD ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option id=""valor_defecto"" value="&lsDptoIc&">"&lsDptoIc&"&nbsp;"&nomdpto&"</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaDpto2()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCCDD ")
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto2"" name=""txtDpto2"" onChange=""generaprov2();"">"
	Response.Write " <option id=""valor_defecto"" value="&lsDptoRe&">"&lsDptoRe&"&nbsp;"&nomdptoR&"</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub
%>

<%

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
If lsUbigeo <> "" then


If Request.Form <> "" Then
	lsDptoIc = Request.Form("txtDpto1")'15lima
	if len(lsDptoIc)> 2 then 
	lsDptoI = mid(lsDptoIc,1,2)
	CantlsDptoI=len(lsDptoIc)
	lsNomDptoI=mid(lsDptoIc,3,CantlsDptoI-2)
	end if
		
	lsProvIc = Request.Form("txtProv1")'1501lima
		if len(lsProvIc)> 2 then 
	lsProvI = mid(lsProvIc,3,2)
	CantlsProvI=len(lsProvIc)
	lsNomProvI=mid(lsProvIc,5,CantlsProvI-4)
	END IF
		lsDistIc = Request.Form("txtDist1")
		if len(lsDistIc)> 2 then 
		lsDistI = mid(lsDistIc,5,2)
		CantlsDistI=len(lsDistIc)
		lsNomDistI=mid(lsDistIc,7,CantlsDistI-6)
END IF
	lsCargo = Request.Form("cmbcargo")
		

	
	lsApePaterno = trim(UCase(Request.Form("txtApePaterno")))
	lsApeMaterno = TRIM(UCase(Request.Form("txtApeMaterno")))
	lsNombre1 = TRIM(UCase(Request.Form("txtNombre1")))
	lsNombre2 = TRIM(UCase(Request.Form("txtNombre2")))
	lsSexo = Request.Form("cmbSexo")	
	lsAnio = Request.Form("txtAnio")
	lsMes = Request.Form("txtMes")
	lsDia = Request.Form("txtDia")
	lsFecNac = lsAnio & "/" & lsMes & "/" & lsDia
	lsEdad = year(Now())-lsAnio	
	lspais = Request.Form("cmbpais")
	lsDptoNc = Request.Form("txtDpto3")
	if lsDptoNc<>"" then 
	lsDptoN = mid(lsDptoNc,1,2)
	CantlsDptoN=len(lsDptoNc)	
	lsNomDptoN=mid(lsDptoNc,3,CantlsDptoN-2)
	end if
	
	lsProvNc = Request.Form("txtProv3")
	if lsProvNc <> "" then 
	lsProvN = mid(lsProvNc,3,2)
	CantlsProvN=len(lsProvNc)	
	lsNomProvN=mid(lsProvNc,5,CantlsProvN-2)	
	end if
	
	lsDistNc = Request.Form("txtDist4")	
	if lsDistNc <>"" then 
	lsDistN = mid(lsDistNc,5,2)
	CantlsDistN=len(lsDistNc)	
	lsNomDistN=mid(lsDistNc,7,CantlsDistN-2)
	end if 
	lsDNI = Request.Form("txtDNI")
	lsRUC = Request.Form("txtRUC")	
	lsECivil = Request.Form("txtECivil")
	lsCmbLen = 	Request.Form("cmbLeng")
	lsTelefono = Request.Form("txtTelefono")
	lsCelular = Request.Form("txtCelular")
	lsOperCel =	Request.Form("cmbOperTel")
	lsEmail = Request.Form("txtEmail")
	lsTipoVia = Request.Form("cmbTipovia")
	lsNomVia = Request.Form("txtNomVia")
	lsNumPuerta = Request.Form("txtNumPuerta")
	lsNumKilometro = Request.Form("txtNumKilometro")
	lsNumManzana = Request.Form("txtNumManzana")
	
	lsNumInterior = Request.Form("txtNumInterior")
         lsDepa = Request.Form("txtdepa")
	lsNumPiso = Request.Form("txtNumPiso")
	lsNumLote = Request.Form("txtNumLote")

	lsTipoZona = Request.Form("cmbZona")
	lsNomZona = Request.Form("txtNomZona")
 	
	
	lsDptoRc = Request.Form("txtDpto2")
	lsDptoR = mid(lsDptoRc,1,2)
	CantlsDptoR=len(lsDptoRc)	
	lsNomDptoR=mid(lsDptoRc,3,CantlsDptoR-2)
	

	lsProvRc = Request.Form("txtProv2")
	lsProvR = mid(lsProvRc,3,2)
	CantlsProvR=len(lsProvRc)	
	lsNomProvR=mid(lsProvRc,5,CantlsProvR-2)
	
	
	lsDistRc = Request.Form("txtDist2")	
	lsDistR = mid(lsDistRc,5,2)
	CantlsDistR=len(lsDistRc)	
	lsNomDistR=mid(lsDistRc,7,CantlsDistR-2)

	
	lsNivInst = Request.Form("cmbNivelInstr")
	lsTipEst = Request.Form("cmbTipoEstudios")

	lsGrado = Request.Form("cmbGrado")
	
	lsAnio2 = Request.Form("txtAnio2")
	lsMes2 = Request.Form("txtMes2")
	lsDia2 = Request.Form("txtDia2")
if 	lsAnio2="" then
lsfec_exp=""
else 
	lsfec_exp = lsAnio2 & "/" & lsMes2 & "/" & lsDia2
end if 

	lsperioAlc = Request.Form("txtperioalc")
	lsTiPerAlc = Request.Form("cmbPeriodo")
	
	lsprofesion = Request.Form("cmbProfesion")
	lsUniv = Request.Form("cmbUniversidad")
	lsLugEst = Request.Form("txtLugEst")
		


	lsExpGen_anio = Request.Form("txtExpGenAnio")
	lsExpGen_meses = Request.Form("txtExpGenMeses")

	lsExpCampoanio = Request.Form("txtExpCampoAnio")
	lsExpCampomeses = Request.Form("txtExpCampoMeses")

	lsExpGrupoanio = Request.Form("txtExpGrupoAnio")
	lsExpGrupomeses = Request.Form("txtExpGrupoMeses")	


	lsIneiProc = Request.Form("txtIneiProc")
	lsProyecto = UCase(Request.Form("txtProyecto"))
	lsIneiAnio = Request.Form("txtIneiAnio")
	lsCargoInei = Request.Form("txtCargoInei")
	lsDisposicion = Request.Form("cmbdisposicion")
	lsVeracidad = Request.Form("cmbVeracidad")
	ipVisitante = Request.ServerVariables("REMOTE_ADDR")
	lsDocMeses = Request.Form("txtDocAnio")
	lsCapaAnio = UCase(Request.Form("txtCapaAnio"))



lsSQL = " exec uspEce_Actua_Ficha '"&lsDptoI &"','"&lsProvI &"','"&lsDistI &"','"&lsCargo &"','"&lsApePaterno &"','"&lsApeMaterno&"','"&lsNombre1 &"','"&lsNombre2 &"','"&lsSexo &"','"&lsFecNac&"','"&lsEdad &"','"&lspais &"','"&lsDptoN &"','"&lsProvN &"','"&lsDistN &"','"&lsDNI &"','"&lsRUC &"','"&lsECivil &"','"&lsCmbLen &"','"&lsTelefono&"','"&lsCelular &"','"&lsOperCel&"','"&lsEmail &"','"&lsTipoVia &"','"&lsNomVia &"','"&lsNumPuerta &"','"&lsNumKilometro&"','"&lsNumManzana &"','"&lsNumInterior &"','"&lsDepa &"','"&lsNumPiso &"','"&lsNumLote &"','"&lsTipoZona &"','"&lsNomZona &"','"&lsDptoR&"','"&lsProvR &"','"&lsDistR &"','"&lsNivInst &"','"&lsTipEst &"','"&lsGrado &"','"&lsfec_exp &"','"&lsperioAlc&"','"&lsTiPerAlc &"','"&lsprofesion &"','"&lsUniv &"','"&lsLugEst &"','"&lsExpGen_anio&"','"&lsExpGen_meses &"','"&lsExpCampoanio &"','"&lsExpCampomeses&"','"&lsExpGrupoanio &"','"&lsExpGrupomeses&"','"&lsIneiProc &"','"&lsProyecto &"','"&lsIneiAnio &"','"&lsCargoInei &"','"&lsDisposicion &"','"&lsVeracidad &"','"&lsUsuario&"','"& ipVisitante&"','"&lsDocMeses&"','"& lsCapaAnio&"' "
call getRS(RS, lsSQL)
End If

%>	
     
<HTML>
<HEAD> 
   <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
   <link rel="shortcut icon" href="images/favicon.ico" />

	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
 <script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript" src="js/envio_ajax.js"></script>
<script type="text/javascript" src="js/valida.js"></script>

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
	var codig=varDpto.substring(0,2);
	
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m6_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov").innerHTML =ajax.responseText;
					verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("prov").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov").innerHTML = ajax.responseText;	
					 
								 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}

function generaprov3(){
     
    var varDpto =document.getElementById("txtDpto3").options[document.getElementById("txtDpto3").selectedIndex].value;
    
	ajax=http_request();
	var valores;	
	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	

	
	url="m6_Provincia3.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov3").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov3").innerHTML =ajax.responseText;
					verdis4();
            }
            else if(ajax.status==404){
                     document.getElementById("prov3").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov3").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

	
function generaprov2(){
     
    var varDpto =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
    
	ajax=http_request();
	var valores;	
	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	

	
	url="m6_Provincia2.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov2").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov2").innerHTML =ajax.responseText;
					verdis2();
            }
            else if(ajax.status==404){
                     document.getElementById("prov2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}
function verdis3(){

    
    var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m6_Distrito3.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("distcon").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("distcon").innerHTML =ajax.responseText;//}
						
            }
            else if(ajax.status==404){
                     document.getElementById("distcon").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("distcon").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}





function verdis4(){

    
    var varProv =document.getElementById("txtProv3").options[document.getElementById("txtProv3").selectedIndex].value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m6_Distrito4.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("dist4").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("dist4").innerHTML =ajax.responseText;//}
            }
            else if(ajax.status==404){
                     document.getElementById("dist4").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist4").innerHTML = ajax.responseText;					 
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
			 document.getElementById("dist").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("dist").innerHTML =ajax.responseText;//}
						verdis3();
						
						
            }
            else if(ajax.status==404){
                     document.getElementById("dist").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function vercargos(){
    
     var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
    var varDist =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value;

	ajax=http_request();
	var valores;	
	valores= "varDpto=" + escape(varDpto)+"&varProv="+escape(varProv)+"&varDist="+escape(varDist);  // parametros a enviar al servidor	
	url="m61_cargos.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {

                 document.getElementById("carg").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("carg").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("carg").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("carg").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function verdis2(){
    
    var varProv =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m6_Distrito2.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dist2").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dist2").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("dist2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist2").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


</script>
<script>
var enProceso = false; // lo usamos para ver si hay un proceso activo
var http = getHTTPObject(); // Creamos el objeto XMLHttpRequest
function handleHttpResponse() {
    if (http.readyState == 4) {	
       if (http.status == 200) {	   	
          if (http.responseText.indexOf('invalid') == -1) {
             results = http.responseText.split(",");
			  if( results[0] ==  "1" ){
			   document.getElementById('msj').style.display='block';
			   document.getElementById("msj").innerHTML ="Usted esta descalficado para este proceso!!";
			   setTimeout("document.getElementById('txtDNI').focus();",1);
               document.getElementById("button1").disabled=true;
			   enProceso = false;
			  }else if( results[0] ==  "2"){
			  
			document.getElementById('msj').style.display='block';
			   document.getElementById("msj").innerHTML ="El DNI ya fue registrado!!";
			   setTimeout("document.getElementById('txtDNI').focus();",1);
               document.getElementById("button1").disabled=true;
               enProceso = false;
			  }
			  else{
			  document.getElementById('msj').style.display='none';
			   document.getElementById("button1").disabled=false;
			   enProceso = false;
			  }
          }
       }
    }
}

function Validar() {
   var obj = document.getElementById('txtDNI');   
   if(obj.value.length < 8 ){	
	setTimeout("document.getElementById('txtDNI').focus();",1);
	document.getElementById('msj2').style.display='block';
	alert("N\xfamero ingresado incorrecto");
	}
	else{

	document.getElementById('msj2').style.display='none';	
		if (!enProceso && http) {			
		   var valor = escape(document.getElementById("txtDNI").value);		   
		   var url = "verificar.asp?dni="+ valor;	
		   http.open("GET", url, true);
		   http.onreadystatechange = handleHttpResponse;
		   enProceso = true;
		   http.send(null);
		}
	}    
}

function verificadist()
{
	   var dist1 = document.getElementById('txtDist1').value;   
   var dist2 = document.getElementById('txtDist3').value;   

	if(dist1 != '0'){
	if(dist2 != dist1 )
	{
	   alert("Los Distritos no coinciden no coniciden");	
	   	  document.getElementById("button1").disabled=true;
   
    }   
	else
	{ document.getElementById('txtDist1').disabled=false;
		  document.getElementById("button1").disabled=false;
	}
  }

	
	}





function ValidarDNIC() {
   var dni1 = document.getElementById('txtDNI').value;   
   var dni2 = document.getElementById('txtDNI2').value;   

	if(dni2 != ''){
	if(dni1 != dni2 )
	{
	   alert("Los DNIs no coniciden");	  
	   	  document.getElementById("button1").disabled=true;
 
    }   
	else
	{ document.getElementById('txtDNI').disabled=false;
		  document.getElementById("button1").disabled=false;

	}
  }
}


function ValidarRUC() {
   lngruc=document.frmMiForm.txtRUC.value.length;
	if(lngruc <11 && lngruc >0)
	{
	   alert("El n\xfamero de RUC debe de ser de 11 d\xedgitos");	  
	   	  document.getElementById("button1").disabled=true;
 
    }   
	else
	{ document.getElementById('txtDNI').disabled=false;
		  document.getElementById("button1").disabled=false;

	}

}


function getHTTPObject() {
    var xmlhttp;
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
       try {
          xmlhttp = new XMLHttpRequest();
       } catch (e) { xmlhttp = false; }
    }
    return xmlhttp;
}


</script>

</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 

	 <!--#include file="pd_menu.asp"-->
     
	<div id="formulario">
   		<div id="divNavegacion" align="center"><span class="subtitulo">Mantenimiento: Modificación de Datos del Postulante</span></div>

    <form name="form1" id="form1" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
  <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">		<table width="770" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
      <tr height=22>
 				<td colspan=3>
 					<table cellpadding="0" cellspacing="0" border="0"  width="490" align="center">
 					<tr height=22>
 								<td colspan=3 class='etiqueta'><FONT CLASS='alerta5'>(*) Datos Obligatorios</font></td>
					  </tr>
 					<tr>
 						<td>
 							<table width="490" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
 	            <tr>
 								<th colspan=6 class="aplicacion" bgcolor="#DAE8F3">Por Nombre</th>
							<tr>
								<td width=160  class='etiqueta'>Apellido Paterno<font class="alerta5">(*)</font></td>
	             
	              <td width="273">
	              <input type="text" class='e_texto' id="txtApePaterno" name="txtApePaterno" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  <td width="55" rowspan="2" align=right>&nbsp;</td>
							</tr>
								<tr>
								<td width=160  class='etiqueta'>Apellido Materno<font class="alerta5">(*)</font></td>
	             
	                            <td width="273">
	                              <input type="text" class='e_texto' id="txtApeMaterno" name="txtApeMaterno" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  </tr>
							<tr>
								<td width="160" class='etiqueta'>Nombre<font class="alerta5">(*)</font></td>								
	              <td width="273">
							  <input type="text" class='e_texto' id="txtNombre" name="txtNombre" value="" maxlength="40" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  <td width="55" align=right><INPUT name=button1 type="button" class="boton" id=button1 style="font-family:Arial; font-size:8pt;" onClick="javascript:modificar('1','1')"   value="Buscar"></td>
							</tr>
 							</table>
 						</td>
 					</tr>
 					</table>
 				</td>
 			</tr>
 			<tr height=10><td colspan=3 align=center></td></tr> 
 			<tr height=22>
 				<td colspan=3><br>
 					<table width="490" border="1" align="center" cellpadding="2" cellspacing="2"  bordercolor="#DAE8F3">
 	            <tr>
 								<th colspan=4 class="aplicacion" bgcolor="#DAE8F3">Por DNI</th>
					  </tr>
 							<tr>
 								<td width="160" height="25" class='etiqueta'>DNI<font class="alerta5">(*)</font></td>								
	              <td width="273">
							  <input type="text" class='e_texto' id="txtDNIb" name="txtDNIb" value="" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)"></td>
							  <td width="55" align=right><INPUT name=button2 type="button" class="boton" id=button2 style="font-family:Arial; font-size:8pt;" onClick="javascript:modificar('2','1')"   value="Buscar"></td>
							</tr>
				  </table>
 				</td>
 			</tr>      			 
			</table>   </div>	
		</td>
	</tr>	
	</table>              				    	    				    
	</form>
</div>

<div id="ficha" align="center"></div>

</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
