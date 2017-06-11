<%@ Language=VBScript %>
 <%session.lcid=2057%>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 

 
<%Response.ContentType="text/html; charset=iso-8859-1"

id=request("id")
ape_pat=request("ape_pat")
ape_mat=request("ape_mat")
nombres=request("nombres")
dni=request("dni")

	Response.ContentType="text/html; charset=iso-8859-1"			
	SQLContCapac = "EXEC dbo.pa_CargoConvocatoria_ficha '"&id&"' ,'1' " 

	set wRsDptoapli = Micone.execute(SQLContCapac)
	
	

id_cargo=wRsDptoapli.fields("tipo")&"*"&wRsDptoapli.fields("id_Presupuesto")&"*"&wRsDptoapli.fields("id_ConvocatoriaCargo")
id_tipo=wRsDptoapli.fields("tipo")
id_caroQ=wRsDptoapli.fields("id_Presupuesto")
meta=wRsDptoapli.fields("meta")
id_proyecto=wRsDptoapli.fields("id_proyecto")
experiencia_1=wRsDptoapli.fields("experiencia_1")
experiencia_2=wRsDptoapli.fields("experiencia_2")
testP=wRsDptoapli.fields("Test_psicologico")
testC=wRsDptoapli.fields("Test_conocimientos")
MomentoC=wRsDptoapli.fields("Momento_Test")
MomentoP=wRsDptoapli.fields("Momento_psico")

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing


sub generaCargo()
			
	SQLContCapac = "EXEC dbo.uspget_CargoConvocatoria_uno '"&id&"' ,'1' " 
		set wRsDptoapli = Micone.execute(SQLContCapac)

		Response.ContentType="text/html; charset=iso-8859-1"
		response.write wRsDptoapli("desc_cargoFuncional")

		wRsDptoapli.Close
		Set wRsDptoapli = Nothing
	
End sub



sub generaNivel ()

	set Rs = Micone.execute(" exec dbo.getNivelFicha '"&id&"' ")
	
	response.Write "<select class=""e_combo"" style=""width:170px"" id=""cmbNivelInstr"" name=""cmbNivelInstr"" onChange=""valida_nivel3(this.value); genera_grado(this.value);""  >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" &Rs(1)& "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing

end sub


sub generaGrado ()

	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getGradoFicha '"&id&"' ")

	
	response.Write "<select class=""e_combo"" style=""width:170px"" id=""cmbGrado"" name=""cmbGrado""  >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" &Rs(1)& "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing

end sub


sub generaDpto()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_dpto_cerresidencia ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1""  name=""txtDpto1"" onChange=""generaprov();valida_quechua() "">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 



sub generaProyectos()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_ProyectosExp ")

	Response.Write "<select disabled class=""e_combo"" style=""width:250px"" id=""txtProyecto""  name=""txtProyecto"" >"
	Response.Write " <option  id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='"&wRsDptoapli(1) &"' value=""" & wRsDptoapli(0) & """>"& wRsDptoapli(1)& "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write " <option id=""valor_defecto"" value=""Otros"">Otros</option>"
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 




sub generaPAIS()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getpais ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbpais"" name=""cmbpais"" onChange=""validanac(this.value);"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaZona()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getZONA ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbZona"" name=""cmbZona"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 
sub generaFuncional()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getcargo1 ")

	
	Response.Write "<select class=""e_combo"" disabled style=""width:200px"" id=""txtCargoInei"" name=""txtCargoInei"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 
sub generaVIA()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getvia ")

	
	Response.Write "<select class=""e_combo"" style=""width:150px"" id=""cmbTipovia"" name=""cmbTipovia""  >"
	Response.Write " <option id=""0"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaDpto3()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCCDD2 ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto3"" name=""txtDpto3"" disabled onChange=""generaprov3();"" > <span class=""alerta5""><font class='cascade4'>(*)</font></span>"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub



sub generaprofesion()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getProfesion ")

	
	Response.Write "<select class=""e_combo"" style=""width:300px"" id=""cmbProfesion"" name=""cmbProfesion""  >"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub




sub generaUniversidad()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getUniversidad ")

	
	Response.Write "<select class=""e_combo"" style=""width:300px"" id=""cmbUniversidad"" name=""cmbUniversidad""  >"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"


	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaDpto2()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_dpto_cerresidencia   ")



	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto2"" name=""txtDpto2""   onChange=""generaprov2(), validadepa(); "" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

	
End sub


Response.Expires = 0

%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=es-iso-8859-1" />

   <title>..:: SISTEMA DE CONSECUCI&Oacute;N DE RECURSOS HUMANOS ::..</title>

   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
   <link rel="stylesheet" href="Styles/reveal.css">	

<script language="JavaScript1.1" src="js/cliente.js"></script>
<script language="JavaScript1.1" src="js/comun.js"></script>	
<script language="JavaScript1.1" src="js/valida.js"></script>	
<script language=JavaScript1.1 src="js/jquery.js"></script>
<script type="text/javascript" src="js/libreriaexp.js"></script>
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


$('a[data-reveal-id]').live('click', function(e) {
		e.preventDefault();
		var modalLocation = $(this).attr('data-reveal-id');
		$('#'+modalLocation).reveal($(this).data());
	});

function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	var codig=varDpto.substring(0,2);
	var id_cc=document.getElementById("id_cc").value;
	
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&id_cc="+escape(id_cc);  // parametros a enviar al servidor	
	
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

                     document.getElementById("prov2").innerHTML = ajax.responseText;					 
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
	
	url="m16_Distrito.asp";  
	
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
	return false;
    
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
	
	url="m6_Distrito_reg.asp";  
	
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


function verNivel(){

	nivel=escape(document.getElementById("id_cc").value);
	ajax=http_request();
	var valores;	
	valores= "nivel=" + escape(nivel);  // parametros a enviar al servidor	
	
	url="m_Nivel.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("idNivel").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("idNivel").innerHTML =ajax.responseText;
					verGrado(anivel);
            }
            else if(ajax.status==404){
                     document.getElementById("idNivel").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("idNivel").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function verGrado() {
	
	nivel=escape(document.getElementById("id_cc").value);
	
	ajax=http_request();
	var valores;	
	valores= "nivel=" + escape(nivel);  // parametros a enviar al servidor	
	
	url="m_Grado.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("idGrado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("idGrado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("idGrado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("idGrado").innerHTML = ajax.responseText;					 
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
	if(lngruc <11 && lngruc>0)
	{
	   alert("El n\xfamero de RUC debe de ser de 11 d\xedgitos");	
	   	  document.getElementById("button1").disabled=true;
 
    }   
	else
	{ document.getElementById('txtRUC').disabled=false;
		  document.getElementById("button1").disabled=false;

	}

}


function ValidarRUC2() {
   var dni1 = document.getElementById('txtRUC').value;   
   var dni2 = document.getElementById('txtRUC2').value;   

	if(dni2 != ''){
	if(dni1 != dni2 )
	{
	   alert("Los RUCs no coniciden");	  
	   	  document.getElementById("button1").disabled=true;
 
    }   
	else
	{ document.getElementById('txtRUC2').disabled=false;
		  document.getElementById("button1").disabled=false;

	}
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


function fs_numeros(e) {
	
        tecla = (document.all) ? e.keyCode : e.which; 

		if (tecla < 48 || tecla > 57) {
			return false;
			
		}
        if (tecla==8 || tecla!=13) return true;
}

function fs_SoloLetras(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 
			
			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209  && tecla != 45)
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}

function fs_alfanumerico(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 
			
			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209 && tecla != 49 && tecla != 50 && tecla != 51 && tecla != 52 && tecla != 53 && tecla != 54 && tecla != 55 && tecla != 56 && tecla != 57 && tecla != 48 && tecla != 95 && tecla != 45)
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}


function fs_alfanumericoE(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 
			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209 && tecla != 49 && tecla != 50 && tecla != 51 && tecla != 52 && tecla != 53 && tecla != 54 && tecla != 55 && tecla != 56 && tecla != 57 && tecla != 48 && tecla != 64  && tecla != 95 && tecla != 45 && tecla != 46)
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}

function  valida_quechua (){
	
	
	var varDpto =document.getElementById("txtDpto1").value;
	var id_proyecto =document.getElementById("id_proyecto").value;
	var id_caroQ =document.getElementById("id_caroQ").value;
	
	if (id_caroQ==2){
	if (id_proyecto==2 && (varDpto=='02' || varDpto=='03' ||varDpto=='08' || varDpto=='09' || varDpto=='05')){
		
		document.getElementById("cmbIdiomaQ").style.display="";
		document.getElementById("idiomaQ").style.display="";
		document.getElementById("idiomaQ1").style.display="none";
	
	} else if (id_proyecto==2 &&  varDpto=='21'){
		document.getElementById("cmbIdiomaQ").style.display="";
		document.getElementById("idiomaQ1").style.display="";
		document.getElementById("idiomaQ").style.display="none";
	} else {
		document.getElementById("cmbIdiomaQ").style.display="none";
		document.getElementById("idiomaQ1").style.display="none";
		document.getElementById("idiomaQ").style.display="none";
	}
	
	}
	
		if (id_caroQ==3){
	if (id_proyecto==2 && (varDpto=='02' || varDpto=='09' )){
		
		document.getElementById("cmbIdiomaQ").style.display="";
		document.getElementById("idiomaQ").style.display="";
		document.getElementById("idiomaQ1").style.display="none";
	}  else if (id_proyecto==2 &&  varDpto=='21'){
		document.getElementById("cmbIdiomaQ").style.display="";
		document.getElementById("idiomaQ1").style.display="";
		document.getElementById("idiomaQ").style.display="none";
	}  else {
		document.getElementById("cmbIdiomaQ").style.display="none";
		document.getElementById("idiomaQ1").style.display="none";
		document.getElementById("idiomaQ").style.display="none";
	}
	
	}
}


function  validaQ (valor){
	
	var id_caroQ =document.getElementById("id_caroQ").value;
	
	if (id_caroQ==2){
		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito el dominio fluido del idioma quechua');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	
	}
}

function  validaDJ(valor){
	

		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito que los datos consigandos correspondan a la verdad');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	

}

function  validaHorario(valor){

		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito tener compromiso de trabajo en horarios de los informantes');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	

}

function  validadom(valor){
	
		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito tener disponibilidad de trabajo los s\xe1bados, domingos y feriados');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	
}

function  validaDis(valor){
	
		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito contar con disponibilidad a tiempo completo');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	

}


function validarEmail( email ) {
	
	if (email!=""){
	
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ( !expr.test(email) ){
        alert(" La direcci\xf3n de correo '" + email + "' es incorrecta.");
		document.getElementById("txtEmail").focus();
		return false;
	}
	}
}


function genera_grado(valor){
	id_cc=escape(document.getElementById("id_cc").value);
	
	ajax=http_request();
	var valores;	
	valores= "nivel=" + escape(valor)+"&id_cc="+escape(id_cc);  // parametros a enviar al servidor	
	
	url="m_Grado.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("idGrado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("idGrado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("idGrado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("idGrado").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}



</script>
<style type="text/css">
<!--
.Estilo8 {color: #000099}
-->
</style>
</head>
<body >
	<div id="divContenido">
	<!--#include file="cabecera.html"-->
    <div style="width:95%;" align="center"  >
    <div style="width:95%; background-color:#036; text-align:center; color:#FFF" class="tituloPrin">FICHA DE POSTULANTE</div>
    <div  style=" background-color:#D0ECFD; width:95%; text-align:justify;" class="titulo"><span></span>La informaci&oacute;n consignada en la presenete ficha tiene caracter de Declaraci&oacute;n Jurada por lo que el postulante ser&aacute; responsable de la Informaci&oacute;n consignada y se somete al proceso de fiscalizaci&oacute;n que lleva el INEI. En caso de ocultar informaci&oacute;n y/o haber consignado informaci&oacute;n falsa ser&aacute; excluido del proceso de selecci&oacute;n.<br><br>
    En caso de haberse producido la contrataci&oacute;n deber&aacute; interrumpirse por comisi&oacute;n de falta grave.</div></div>
	<form ENCTYPE="multipart/form-data" name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="recibir_archivo.asp">
	  <table width=100%  cellpadding=0 cellspacing=0 border=0 >
<tr height=2>
		<td></td>
	</tr>
  <tr>
		<td valign=top align=center>
 			<table width="98%" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
    
 			<tr height=22>
 				<td colspan=3>
     
 					<table cellpadding="0" cellspacing="0" align="center" width="100%">
					<tr height=3>
						<td colspan=6 align=center></td>
					</tr>
          <tr height=3>
					<td colspan=6 align=left>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" >
                      <tr>
                        <td><span  ><FONT style="color:#036; font:arial; font-size:10px;"  >(*) Datos Obligatorios. &nbsp;Escriba correctamente sus datos, seg&uacute;n aparecen en su DNI, cualquier problema posterior, es exclusivamente de su responsabilidad.</font></span></td>
                      </tr>
                      <tr>
                        <td><span ><FONT  style="color:#036; font:arial; font-size:10px;" >(**) Llenar obligatoriamente uno de ellos.</font></span></td>
                      </tr>
                      <tr>
                        <td><span ><FONT  style="color:#036; font:arial; font-size:10px;" >(***) El N&uacute;mero de RUC es obligatorio presentar en el momento de la contrataci&oacute;n.</font></span></td>
                      </tr>
                    </table>
									
					<table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">							
							<tr>
							  <td height="62" colspan=5  background="images/1.jpg"  ><p><span class="mensaje2">1. Cargo y Distrito al que postula</span>  
							    <input type="hidden" id="txtFrm" name="txtFrm" value="">                                
                                <input type="hidden" id="cmbCargo" name="cmbCargo" value="<%=id_cargo%>">
                                <input type="hidden" id="meta" name="meta" value="<%=meta%>">
                                <input type="hidden" id="id_proyecto" name="id_proyecto" value="<%=id_proyecto%>">
                                <input type="hidden" id="id_caroQ" name="id_caroQ" value="<%=id_caroQ%>">
                                <input type="hidden" id="id_tipo" name="id_tipo" value="<%=id_tipo%>">
                                <input type="hidden" id="a1" name="a1" value="0">
                                <input type="hidden" id="a2" name="a2" value="0">
                                <input type="hidden" id="a3" name="a3" value="0">
                                <input type="hidden" name="finalizado" id="finalizado" value="0">
                                <input type="hidden" name="id_cc" id="id_cc" value="<%=id%>">
                                <input type="hidden" name="testP" id="testP" value="<%=testP%>">
                                <input type="hidden" name="testC" id="testC" value="<%=testC%>">
                                <input type="hidden" name="MomentoP" id="MomentoP" value="<%=MomentoP%>">
                                <input type="hidden" name="MomentoC" id="MomentoC" value="<%=MomentoC%>">
						      <span class="mensajer" ></span> </p></td>
					  </tr>
                              <tr style="display:none">
					            <td  height="33" colspan="5"  align="center"    class="mensaje6" style="border-bottom:1px solid; "><STRONG>Primero Registre los datos solicitados en la ficha, despu&eacute;s adjunte los archivos solicitados en la parte inferior del cuestionario para que su inscripci&oacute;n sea exitosa.</STRONG></td>
      </tr>
							<tr height=18>
                             <td colspan="4"  class="cabecera2"><font class="etiqueta"><strong>Cargo al que postula</strong></font></td>
						    </tr>
							<tr height=22 >
                             <td height="28" colspan="4" align="left" nowrap id="carg" ><span class="etiqueta"><font class='titulo' >USTED EST&Aacute; POSTULANDO AL CARGO DE <%generaCargo()%>
                             </font></span></td>
						    </tr>	
                            <tr height=18>
                             <td width="24%"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Departamento</strong></font></td>
							  <td width="20%"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Provincia</strong></font></td>
							  <td width="19%"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Distrito</strong></font></td>
							  <td width="20%"  class="cabecera2"><font class="etiqueta"><strong>Confirme Distrito</strong></font></td>
							 
							</tr>
                            <tr height=22 >
                             <td height="28" align="left" nowrap id="carg" ><span class="etiqueta"><font class='alerta5'>
                               <%generaDpto()%>
                             (*)</font></span></td>
							  <td align="left"  nowrap id="prov"><select name="txtProv1" id="txtProv1"  class='e_combo' style="width:200px;" >
							    <option  value="0" selected>Seleccione...</option>
							    </select>
							    <span class="etiqueta"><font class='alerta5' >(*)</font></span></td>
							  <td align="left"  nowrap id="dist"><select name="txtDist1" id="txtDist1"  class='e_combo' style="width:150px;" disabled>
							    <option   value="0" selected >Seleccione...</option>
							    </select>
							    <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							  <td align="left"  nowrap id="distcon"><select name="txtDist3" id="txtDist3"  class='e_combo' style="width:200px;" disabled>
							    <option value="0" selected >Seleccione...</option>
							    </select>
							    <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							 
							</tr>	
                    </table>
			  <br>
			  <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">							
							<tr>
							  <td colspan=7 background="images/1.jpg" ><span class="mensaje2">2. Datos del Postulante</span> <span ><FONT style="color:#036; font:arial; font-size:10px;">(Escriba sus datos  tal como figuran en su DNI)	</font></span></span></td>
							</tr>
							
							<tr>
							  <td  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Apellido Paterno (DNI)</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Apellido Materno(DNI)</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>Nombres (DNI)</strong></font><font class="etiqueta"><strong></strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong></strong></font><font class="etiqueta"><strong></strong></font></td>
							  <td width="19%" colspan="2"  class="cabecera2"><font class="etiqueta"><strong><font class="etiqueta"><strong><font class="etiqueta"><strong><font class="etiqueta"><strong><font class="etiqueta"><strong><font class="etiqueta"><strong>Sexo</strong></font></strong></font></strong></font></strong></font></strong></font></strong></font></td>
					  </tr>
							<tr >
							  <td nowrap  ><span class="etiqueta"><font class='alerta5' >
							    <input disabled
								  		type="text" 
								  		class='e_texto' 
										id="txtApePaterno" 
										name="txtApePaterno" 
										value="<%=ape_pat%>" maxlength="50" 
										style="width:220" 
                                        onKeyPress="return fs_SoloLetras(event)"
										onKeyUp="validarLetras(this.value)" 
										onBlur='fu_ValidarApePat(this)';>
(*)</font></span></td>
							  <td nowrap ><span class="etiqueta"><font class='alerta5' >
							    <input  disabled
								  		type="text" 
										class='e_texto' 
										id="txtApeMaterno" 
										name="txtApeMaterno" 
										value="<%=ape_mat%>" 
										maxlength="50" 
										style="width:220" 
										 onKeyPress="return fs_SoloLetras(event)"
										onBlur='fu_ValidarApeMat(this);'>
(*)</font></span></td>
							  <td nowrap  ><span class="etiqueta"><font class='alerta5' ><font class='cascade4' color=crimson>
							    <input disabled
										type="text" 
										class='e_texto' 
										id="txtNombre1" 
										name="txtNombre1" 
										value="<%=nombres%>" 
										maxlength="50" 
										style="width:220" 
										 onKeyPress="return fs_SoloLetras(event)"
										>
                              </font>(*)</font></span></td>
							  <td nowrap  ><font class='alerta5' ><font class='cascade4' color=crimson><input name="txtNombre2" id="txtNombre2" type="hidden" value="">
							  
							  </font></font></td>
							  <td colspan="2" nowrap  ><span class="etiqueta"><font class='cascade4' color=crimson>
							    <select id="cmbSexo" name="cmbSexo" class='e_combo' style="width:110px">
							      <option selected value="">Seleccione...</option>
							      <option value="F">FEMENINO</option>
                                  <%IF id="2" OR id="3" THEN
								  else
								  %>
							      <option value="M">MASCULINO</option>
                                  <%end if %>
						      </select>
                              <font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='alerta5' >(*)</font></font></font></font></font></span></td>
					  </tr>
							<tr>
							  <td  class="cabecera2"><font class="etiqueta"><strong>Fecha Nacimiento </strong>(dd/mm/aaaa)-(DNI) </font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>Pais de Nacimiento</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>Departamento nacimiento</strong></font></td>
							  <td width="20%"  class="cabecera2"><font class="etiqueta"><strong>Provincia de Nacimiento</strong></font></td>
							  <td colspan="2"  class="cabecera2"><font class="etiqueta"><strong>Distrito de Nacimiento</strong> </font></td>
					  </tr>
							<tr nowrap>
							  <td><span class="cascade5"><font color=crimson>&nbsp;</font></span> <font class='cascade4' color=crimson>
                              <input type="text" class='e_texto' id="txtDia"   name="txtDia" value="" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)" onBlur="ValidaDia()">
                              </font><span class="cascade5"><font class="alerta5">&nbsp;/&nbsp;</font></span><font class='cascade4' color=crimson>
                              <input type="text" class='e_texto' id="txtMes"   name="txtMes" value="" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)" onBlur="ValidaMes()">
&nbsp;</font><span class="cascade5"><font class="alerta5">/</font></span><font class='cascade4' color=crimson>&nbsp;
<input type="text" class='e_texto' id="txtAnio" name="txtAnio" value="" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio();">
</font><span class="cascade5"><font class="alerta5">(*) </font></span><font class='cascade4' color=crimson></td>
							  <td nowrap ><%generaPAIS()%>
						      <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							  <td nowrap ><%generaDpto3()%></td>
							  <td nowrap id="prov3"><select name="txtProv3" id="txtProv3" disabled  class='e_combo' style="width:200px;" >
							    <option  value="9999" selected>Seleccione...</option>
						      </select></td>
							  <td nowrap colspan="2" id="dist4"><select name="txtDist4" id="txtDist4"  class='e_combo' style="width:150px;" disabled>
							    <option   value="999999" selected >Seleccione...</option>
						      </select></td>
					  </tr>
							<tr> 
							<td width="22%"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;DNI</strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></td>
							<td width="22%"  class="cabecera2"><font class="etiqueta"><strong>Confirme DNI </strong></font></td>												
							 <td width="17%"  class="cabecera2"><font class="etiqueta"><strong>RUC </strong></font></td>
							 <td colspan="3"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>Confirme Ruc </strong></font></strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></td>
						    </tr>
							
							<tr>
							 <td height="32" align="left">
						     <input readonly
									type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtDNI" 
									name="txtDNI" 
									value="<%=dni%>" 
									maxlength="8" 
									onKeyPress="return fs_numeros(event)" >
							  <font class='alerta5' >(*) </font></td>
							 <td align="left"><input  readonly="true"
							  		type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtDNI2" 
									name="txtDNI2" 
									value="<%=dni%>" 
									maxlength="8" 
									onKeyPress="return fs_numeros(event)"
									onBlur="ValidarDNIC()">
                              <font class='alerta5' >(*)</font></td>		
							  <td align="left">
							  	<input 
							  		type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtRUC" 
									name="txtRUC" 
									value="" 
									maxlength="11" 
									onKeyPress="return fs_numeros(event)"
									onBlur="ValidarRUC()">
							  	<span class="alerta5">(***)</span></td>
							  <td colspan="3" align="left"><input 
							  		type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtRUC2" 
									name="txtRUC2" 
									value="" 
									maxlength="11" 
									onKeyPress="return fs_numeros(event)"
									onBlur="ValidarRUC2()">
                              <span class="alerta5">(***)</span></td>
					    </tr>
                        <tr>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>Estado Civil (DNI) </strong></font></strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong>Es Usted hijo &uacute;nico</strong></font></td>
							 <td align="left" class="cabecera2"><font class="etiqueta"><strong>Es jefe y/o responsable de su hogar</strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong><font class="etiqueta"><strong>Lengua materna que aprendi&oacute; en su ni&ntilde;ez</strong></font>&nbsp;</strong></font></td>
							  <td align="left" class="cabecera2"><%if id_proyecto=2 and id=2  then%>
                          <font class="etiqueta" id="idiomaQ" style="display:none"><strong>Dominio fluido del idioma quechua</strong></font><font class="etiqueta" id="idiomaQ1" style="display:none"><strong>Dominio fluido del idioma quechua y/o aymara</strong></font> <%end if%></td>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>Lengua originaria que actualmente domina</strong></font></td>
							  
							  
				      </tr>
							<tr>
							  <td height="32" align="left"><select id="txtECivil" name="txtECivil" style="width:110px" class='e_combo'>
							    <option value='0' selected>Seleccione...</option>
							    <option value='1'>SOLTERO(A)</option>
							    <option value='2'>CASADO(A)</option>
							    <option value='3'>VIUDO(A)</option>
							    <option value='4'>DIVORCIADO(A)</option>
							    <option value='5'>CONVIVIENTE</option>
                                <option value='6'>SEPARADO(A)</option>
							    </select>
                              <span class="etiqueta"><span class="cascade5"><font class="alerta5">(*)</font></span></span></td>
                              <td align="left"><font class='cascade4' color=crimson>
							    <select id="cmbHijoUnico" name="cmbHijoUnico" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option value="1">Si</option>
							      <option value="2">No</option>
						      </select>
						      <font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='alerta5'>(*)</font></font></font></font></font></td>
                              <td align="left"><font class='cascade4' color=crimson>
							    <select id="cmbJefeHogar" name="cmbJefeHogar" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option value="1">Si</option>
							      <option value="2">No</option>
						      </select>
						      <font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='alerta5'>(*)</font></font></font></font></font></td>
							  <td align="left"><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							    <select id="cmbLengMat" name="cmbLengMat" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
                                  <option value="9">CASTELLANO</option>
							      <option value="1">AWAJUN</option>
							      <option value="2">QUECHUA</option>
							      <option value="3">AYMARA</option>
							      <option value="4">SHIPIBO</option>
                                  <option value="5">OTRA LENGUA NATIVA</option>
                                  <option value="6">LENGUA EXTRANJERA</option>
						      </select>
							  </font><font class='alerta5'>(*)</font></font></font></font></font></td>
							  <td align="left">
                               <%if id_proyecto=2 and id=2 then%>                       
							    <select   id="cmbIdiomaQ" name="cmbIdiomaQ" style="width:110px; display:none" class='e_combo' onChange="validaQ(this.value)">
							      <option selected value="0">Seleccione...</option>
							      <option value="1">Si</option>
							      <option value="2">No</option>
						      </select>
                              <%else%>
                              <input type=hidden id="cmbIdiomaQ" name="cmbIdiomaQ" value="0">
                              <%end if%>
							  </td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <select id="cmbLeng" name="cmbLeng" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
                                  <option value="9">CASTELLANO</option>
							      <option value="1">AWAJUN</option>
							      <option value="2">QUECHUA</option>
							      <option value="3">AYMARA</option>
							      <option value="4">SHIPIBO</option>
                                   <option value="5">OTRA LENGUA NATIVA</option>
                                  <option value="6">LENGUA EXTRANJERA</option>
						      </select>
						      <font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='alerta5'>(*)</font></font></font></font>							  </font></td>
							  
							  
			          </tr>
							
							<tr>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Tel&eacute;fono </strong>(Use gui&oacute;n para los anexos Ej.5555555-5555)</font></td>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Celular Personal</strong></font></td>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>Oper. Celular</strong></font></td>
							  <td colspan="3" align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Correo Electr&oacute;nico</strong></font></td>
					  </tr>
							<tr>
							  <td align="left" nowrap><span class="etiqueta"><font class='cascade4' color=crimson>
							    <input 
									type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtTelefono" 
									name="txtTelefono" 
									value="" 
									maxlength="12" 
									onKeyPress="return fs_numeros(event)"
									onBlur='validarNumeroTel(this);'>
							  </font><font class="alerta5">(**)</font></span></td>
							  <td align="left" nowrap><font class='cascade4' color=crimson>
							    <input 
									type="text" 
									class='e_texto' 
									id="txtCelular" 
									name="txtCelular" 
									value="" 
									maxlength="12" 
									 onKeyPress="return fs_numeros(event)">
						      <span class="etiqueta"><font class='cascade4' color=crimson> </font><font class="alerta5">(**)</font></span></font></td>
							  <td align="left" nowrap><font class='cascade4' color=crimson>
							    <select id="cmbOperTel" name="cmbOperTel" style="width:110px" class='e_combo'>
							      <option selected value="">Seleccione...</option>
							      <option value="MOVISTAR">MOVISTAR</option>
							      <option value="CLARO">CLARO</option>
							      <option value="RPM MOVISTAR">RPM MOVISTAR</option>
							      <option value="RPC CLARO">RPM CLARO</option>
							      <option value="NEXTEL">NEXTEL</option>
						      </select>
						      <span class="alerta5">(*)</span></font></td>
							  <td colspan="3" align="left" nowrap><font class='cascade4' color=crimson>
							    <input 
										type="text" 
										class='e_texto'
                                        value="" 
										id="txtEmail"  
										style="width:220" 
										name="txtEmail"  
										maxlength="80"  onKeyPress="return fs_alfanumericoE(event)" onBlur="validarEmail(this.value)">
</font></td>
					  </tr>		
																			
              </table>
			  <br>		
			  <span id="msj" style="display:none;" class="mensaje1" >Este DNI ya se encuentra registrado.</span>
              <span id="msj2" style="display:none;" class="mensaje1">El DNI tiene como m&iacute;nimo 8 n&uacute;meros..</span>	  
			  <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">							
							<tr>
							  <td colspan=8  background="images/1.jpg"><span class="mensaje2">3. Domicilio del Postulante</span></td>
							</tr>
							<tr height=22 >
							  <td height="29" class="cabecera2"><span ><font class="etiqueta"><strong>Tipo de V&iacute;a </strong></font></span></td>
							  <td height="29" class="cabecera2"><font class="etiqueta"><strong>Nombre de V&iacute;a (Direcci&oacute;n) </strong></font></td>
							  <td width="10%" height="29" class="cabecera2"><font class="etiqueta"><strong>&nbsp;N&ordm;</strong></font></td>
							  <td width="11%" class="cabecera2"><font class="etiqueta"><strong>&nbsp;KM</strong></font></td>
							  <td width="14%" class="cabecera2"><font class="etiqueta"><strong>&nbsp;MZ</strong></font></td>
							  <td width="13%" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Interior</strong></font></td>
							  <td width="15%" class="cabecera2"><font class="etiqueta"><strong>&nbsp;DPTO</strong></font></td>
			          </tr>
							<tr height=22 >
							  <td height="29" nowrap align="left"><%generaVIA()%>
                              <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							  <td height="29" nowrap align="left"><span class="etiqueta"><font class='cascade4' color=crimson>
							    <input 
								  		type="text" 
										class='e_texto' 
										id="txtNomVia" 
										name="txtNomVia" 
										value="" 
										maxlength="80" 
										style="width:220" 
										onKeyPress="return fs_alfanumerico(event)"
										>
                              </font></span><span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							  <td height="29" align="left"><font class='cascade4' color=crimson>
							    <input type="text" class='e_texto' style="width:100" id="txtNumPuerta" name="txtNumPuerta" value="" maxlength="8" onKeyPress="return fs_numeros(event)">
							  </font></td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input type="text" class='e_texto' style="width:100" id="txtNumKilometro" name="txtNumKilometro" value="" maxlength="8" onKeyPress="return fs_numeros(event)" >
							  </font></td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input type="text" class='e_texto' id="txtNumManzana" name="txtNumManzana" value="" maxlength="8" onKeyPress="return fs_alfanumerico(event)" >
							  </font></td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input type="text" class='e_texto' style="width:100" id="txtNumInterior" name="txtNumInterior" value="" maxlength="8" onKeyPress="return fs_alfanumerico(event)">
							  </font></td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input type="text" class='e_texto' style="width:100" id="txtdepa" name="txtdepa" value="" maxlength="8" onKeyPress="return fs_numeros(event)">
							  </font></td>
			          </tr>	
							<tr >						
							 <td width="17%"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Lote</strong></font></td>
							 <td width="20%"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Piso</strong></font></td>
							 <td colspan="3"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Tipo de Zona</strong></font><font class="etiqueta"><strong></strong></font></td>
							 <td colspan="2"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Nombre Zona</strong></font><font class="etiqueta"><strong></strong></font></td>
						    </tr>
							<tr>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input type="text" class='e_texto' id="txtNumLote" name="txtNumLote" value="" maxlength="8" onKeyPress="return fs_alfanumerico(event)">
							  </font></td>
					          <td align="left"><font class='cascade4' color=crimson>
					            <input type="text" class='e_texto' style="width:100" id="txtNumPiso" name="txtNumPiso" value="" maxlength="8" onKeyPress="return fs_numeros(event)" >
					          </font></td>
					          <td colspan="3" align="left"  nowrap><%generaZONA()%>
				              <font class='alerta5' >(*)</font></td>
					          <td colspan="2" align="left"><font class='cascade4' color=crimson>
					            <input 
										type="text" 
										class='e_texto' 
										id="txtNomZona"  
										style="width:220" 
										name="txtNomZona" 
										maxlength="80" onKeyPress="return fs_alfanumerico(event)" 
										>
					          </font><font class='alerta5' >(*)</font></td>
				        </tr>		
						<tr height=22 bgcolor=#C7EAFB>
							   <td colspan="2" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Departamento Residencia</strong></font></td>
							   <td colspan="3" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Provincia Residencia</strong></font></td>
							   <td  colspan="2" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Distrito Residencia</strong></font></td>
						</tr>
							<tr height=22 >
								<td height="28" colspan="2" align="left"><font class='alerta5'><%generaDpto2()%>
								</font><span class="etiqueta" nowrap><font class='alerta5'>(*)</font></span></td>
                              <td height="28" colspan="3" align="left" id="prov2"><select name="txtProv2" id="txtProv2"   class='e_combo' style="width:200px;" >
								  <option id="txtProv2_99" title="Todos" value=""  selected>Seleccione... </option>
								  </select>
							    <span class="etiqueta"><font class='alerta5' >(*)</font></span></td>
							  <td align="left" colspan="2" id="dist2" nowrap>
                              <select name="txtDistt2" id="txtDistt2"  class='e_combo' style="width:200px;">
                                  <option  title="Todos" value="" selected>Seleccione...</option>
                                </select>
					          <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							</tr>											
              </table>
			  <br>
			  <table cellpadding="0" cellspacing="0" border="0"  width="100%" class="tablam" style="BORDER-TOP: #0F83E1 1px solid; BORDER-LEFT: #0F83E1 1px solid;BORDER-RIGHT: #0F83E1 1px solid" >							
							<tr>
							  <td colspan=10 background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><span class="mensaje2">4. Perfil del Postulante</span> <span ><FONT style="color:#036; font:arial; font-size:10px;"><strong>(Si Ud. es seleccionado, se le solicitar&aacute; que los datos que consigne a continuaci&oacute;n sean respaldados con alg&uacute;n documento. Si no presenta los documentos ser&aacute; descalificado autom&aacute;ticamente.) </strong></font> </span><strong></span></strong></td>
							</tr>
					  <tr bgcolor=#C7EAFB>
						  <td height="20" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><font class="etiqueta"><strong>Nivel de Instrucci&oacute;n</strong></font></td>
							  <td width="16%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="cabecera2" ><font class="etiqueta"><strong>Grado Alcanzado</strong></font></span></td>
							  <td width="18%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Fecha de Expedici&oacute;n Grado </strong>(dd/mm/aaaa) </font></td>
							  <td width="15%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Per&iacute;odo Alcanzado (en n&uacute;meros)</strong></font></td>
							  <td width="17%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Tipo de Per&iacute;odo</strong></font></td>
				      </tr>
							<tr height=22 >
							  <td id="idNivel" height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><select id="cmbNivelInstr" name="cmbNivelInstr" class='e_combo2' style="width:150px" onChange="valida_nivel3(this.value)" >
 				              <option  value="0" selected>Seleccione...</option>
 				              <option value="03">SECUNDARIA</option>
 				              <option value="04">SUPERIOR</option>
 				              <option value="05">SUPERIOR NO UNIVERSITARIA</option>
			              </select><span style="border-bottom:1px solid; border-bottom-color:#0F83E1">
						    <input type="hidden" name="cmbTipoEstudios" id="cmbTipoEstudios" value="0"></span></td>
							  <td id="idGrado" align="left" style=" border-left:1px solid; border-left-color:#0F83E1; ">&nbsp;<font class='cascade4' color=crimson>
							    <select id="cmbGrado" name="cmbGrado" class="e_combo2" style="width:180px" <% if lsNivInst = "3" then response.Write("disabled") end if%>  >
 				              <option value="0" selected>Seleccione...</option>
 				              <option value="01">PREGRADO</option>
 				              <option value="02">EGRESADO</option>
 				              <option value="03">BACHILLER</option>
 				              <option value="04">TITULADO</option>
 				              <option value="05">MAGISTER</option>
 				              <option value="06">DOCTORADO</option>
 				              <option value="07">ESTUDIOS DE MAESTRIA</option>
 				              <option value="08">ESTUDIOS DE DOCTORADO</option>
			              </select>
							  </font></td>
							  <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="cascade5"><font color=crimson>&nbsp;</font></span> <font class='cascade4' color=crimson>
                              <input type="text" class='e_texto' id="txtDia2" disabled   name="txtDia2" value="" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)">
                              </font><span class="cascade5"><font class="alerta5">&nbsp;/&nbsp;</font></span><font class='cascade4' color=crimson>
                              <input type="text" class='e_texto' id="txtMes2" disabled   name="txtMes2" value="" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">
&nbsp;</font><span class="cascade5"><font class="alerta5">/</font></span><font class='cascade4' color=crimson>&nbsp;
<input type="text" class='e_texto' id="txtAnio2" name="txtAnio2" value="" maxlength="4" disabled style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2();">
</font></td>
							  <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='cascade4' color=crimson>
							    <input name="txtperioalc" type="text" class='e_texto' id="txtperioalc" style="width:20" onKeyPress="return fs_numeros(event)" value="" size="2" maxlength="2" >
							  </font></td>
							  <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='cascade4' color=crimson>
							    <select id="cmbPeriodo" name="cmbPeriodo" class='e_combo' style="width:150">
							      <option value="0" selected>Seleccione...</option>
							      <option value="01">CICLO</option>
							      <option value="02">MES</option>
							      <option value="03">A&Ntilde;O</option>
							      <option value="04">TRIMESTRE</option>
							      <option value="05">SEMESTRE</option>
							      <option value="06">CUATRIMESTRE</option>
							      <option value="07">MODULO</option>
							      <option value="08">NIVEL</option>
                              </select>
							  </font></td>
	                  </tr>
							<tr height=22 >
							  <td height="28" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Ocupaci&oacute;n y/o Profesi&oacute;n</strong></font></td>
							  <td  height="28" colspan="2" align="left"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="cabecera2" ><font class="etiqueta"><strong>Universidad</strong></font></span></td>
							  <td colspan="2" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class="etiqueta"><strong>Centro de estudios</strong></font></td>
					  </tr>
							<tr height=22 >
							  <td height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="etiqueta" style="display:block">
							    <%generaprofesion()%>
						      <font class='alerta5' > (*)</font></span></td>
							  <td  height="28" colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta">
							    <%generaUniversidad()%>
						      <span class="etiqueta" nowrap><font class='alerta5'>(**)</font></span></span></td>
							  <td colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='alerta5' ><font class='cascade4' color=crimson>
							    <input 
										type="text" 
										class='e_texto' 
										id="txtLugEst" 
										name="txtLugEst" 
										value="" 
										maxlength="50" 
										style="width:220" 
										onKeyPress="return fs_alfanumerico(event)" 
										>
							  </font></font> <span class="etiqueta" nowrap><font class='alerta5'>(**)</font></span></td>
						    </tr>
					  </table>
						<table width="100%" class="tabla4">
							<tr>
							  <td><table width="100%" border="0" cellspacing="0" cellpadding="0" >
							    <tr>
							      <td width="506"   class="cabecera2"><font class="etiqueta"><strong>Experiencia </strong></font></td>
							      <td width="142" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>A&ntilde;os</strong><br>Ejm. 3 a&ntilde;o(s)</font></td>
							      <td width="151" colspan="2" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>&nbsp;Meses</strong><br>6 mes(es)</font></td>
							      <td  colspan="2"  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>&nbsp;Proyectos en el INEI</strong></font></td>
						        </tr>
							    <tr >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid">A&ntilde;os o meses de experiencia en actividades en general: </td>
							      <td  align="center" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGenAnio" name="txtExpGenAnio" value="" onBlur="valor_ano(this.value,this.id)" maxlength="2" onKeyPress="return fs_numeros(event)" >
							        <font class="etiqueta">a&ntilde;o(s)</font></font></span></td>
							      <td colspan="2"  align="center" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGenMeses" name="txtExpGenMeses" value="" onBlur="valor_mes(this.value,this.id)" maxlength="2" onKeyPress="return fs_numeros(event)" >
							        <font class="etiqueta">mes(es)</font></font></span></td>
							      <td width="175"  height="30"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;">&iquest;Ha participado en el INEI?</td>
							      <td width="140"   align="left" style="border-bottom:1px solid"><span class="etiqueta" ><font class='cascade4' color=crimson>
							        <select id="txtIneiProc" name="txtIneiProc" class="e_combo" style="width:60"  onChange="javascript:cambiarText('2',this.value,'txtProyecto');">
							          <option value="" selected="true">...</option>
							          <option value="1">Si</option>
							          <option value="2">No</option>
						          </select>
							        </font></span></td>
						        </tr>
							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"> <% if experiencia_1="" or isnull(experiencia_1) then %>
                                  A&ntilde;os o meses  de experiencia en trabajos de Campo (Censo y/o Encuestas)<%else%><%=experiencia_1%><%end if%></td>
							      <td  align="center" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpCampoAnio" name="txtExpCampoAnio" value="" maxlength="2" onKeyPress="return fs_numeros(event)" >
							        <font class="etiqueta">a&ntilde;o(s)</font></font></span></td>
							      <td colspan="2"  align="center" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpCampoMeses" name="txtExpCampoMeses" value="" maxlength="2" onBlur="valor_mes(this.value,this.id)" onKeyPress="return fs_numeros(event)" >
							        <font class="etiqueta">mes(es)</font>
							        <input name="txtCapaAnio" type="hidden" id="txtCapaAnio" value="0">
                                    <input type="hidden" name="txtCapaMeses" id="txtCapaMeses" value="0">
							      </font></span></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;">&iquest;&Uacute;ltimo proyecto que particip&oacute; en INEI?</td>
							      <td height="29"  align="center" id="proy" class="etiqueta" style="border-bottom:1px solid">&nbsp;
						          <%generaProyectos()%></td>
						        </tr>
							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><% if experiencia_2="" or isnull(experiencia_2) then %>A&ntilde;os o meses  de experiencia en manejo de grupos:<%else%><%=experiencia_2%><%end if%></td>
							      <td  align="center" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGrupoAnio" name="txtExpGrupoAnio" value="" maxlength="2" onKeyPress="return fs_numeros(event)" >
							        <font class="etiqueta">a&ntilde;o(s)</font></font></span></td>
							      <td colspan="2"  align="center" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGrupoMeses" name="txtExpGrupoMeses" value="" maxlength="2" onBlur="valor_mes(this.value,this.id)" onKeyPress="return fs_numeros(event)" >
							       <font class="etiqueta">mes(es)</font>
							        <input name="txtDocAnio2" type="hidden" id="txtDocAnio" value="0">
                                    <input type="hidden" name="txtCapaAnio2" id="txtCapaAnio2 " value="0">
							      </font></span></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;">&iquest;&Uacute;ltimo a&ntilde;o que particip&oacute; en INEI?</td>
							      <td align="left" style="border-bottom:1px solid"><span class="etiqueta" >
							        <input type="text" class='e_texto' id="txtIneiAnio" name="txtIneiAnio" maxlength=4 value="" onBlur="validar_ano(this.value)" style="width:40" onKeyPress="return fs_numeros(event)" disabled="true">
							        </span></td>
						        </tr>
							    <tr  >
							      <td  height="29" colspan="4"  align="center" class="etiqueta" style="border-bottom:1px solid">&nbsp;</td>
							      <td height="33"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;">&iquest;&Uacute;ltimo cargo que particip&oacute; en INEI?</td>
							      <td align="left" style="border-bottom:1px solid"><span class="etiqueta">
							        <%generaFuncional()%>
							      </span></td>
						        <tr>
							        <td  height="33" colspan="6" background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><font class="etiqueta"><strong>5. Capacitaci&oacute;n</strong></font></td></tr>
                                     <tr>
							      <td width="506"   class="cabecera2"><font class="etiqueta"><strong>Descripci&oacute;n de Curso (Resgistre que curso ha llevado de acu<font class="etiqueta"><strong>e</strong></font>rdo a lo solicitado en la convocatoria)</strong></font></td>
							      <td colspan="2" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Inicio</strong><br>(dd/mm/aaaa)</font></td>
							      <td colspan="2" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Fin</strong><br>(dd/mm/aaaa)</font></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>&nbsp;Horas Lectivas</strong></font></td>
				                </tr>
                                
                                <tr >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><span class="etiqueta" style="border-bottom:1px solid"><font class='cascade4' color=crimson><span class="etiqueta" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:500" id="txtCurso" name="txtCurso" value="" onBlur="valor_ano(this.value,this.id)" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></span></font></span></td>
							      <td colspan="2"  align="center" style="border-bottom:1px solid"> <font class='cascade4' color=crimson>
                                  <input type="text" class='e_texto' id="DIcurso"  name="DIcurso" value="" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)"><font class="alerta5">&nbsp;/&nbsp;</font>
                                  </font><font class='cascade4' color=crimson><input type="text" class='e_texto' id="MIcurso"   name="MIcurso" value="" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">&nbsp;</font><font class="alerta5">/</font>&nbsp;<font class='cascade4' color=crimson><input type="text" class='e_texto' id="AIcurso" name="AIcurso" value="" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio3();">
</font></span></td>
							      <td height="30" colspan="2"  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson><input type="text" class='e_texto' id="DFcurso"   name="DFcurso" value="" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)"> </font><font class="alerta5">&nbsp;/&nbsp;</font><font class='cascade4' color=crimson><input type="text" class='e_texto' id="MFcurso" name="MFcurso" value="" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">
						          </font><font class="alerta5">&nbsp;/&nbsp;</font><font class='cascade4' color=crimson>
						          <input type="text" class='e_texto' id="AFcurso" name="AFcurso" value="" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio4();">
</font></span></td>
							      <td width="140"   align="left" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtHorasLectivas" name="txtHorasLectivas" value="" maxlength="4" onKeyPress="return fs_numeros(event)" >
							      <span class="etiqueta">Horas</span></font></td>
						        </tr>
                                
                                <tr>
                                <td colspan="6"   class="cabecera2"><font class="etiqueta"><strong>Dato Complementario: Este dato ser&aacute; usado por Usted en los siguientes procesos de selecci&oacute;n. Es de uso exclusivo y debe mantenerlo en reserva.</strong></font></td>
						        </tr>
                                
                                <tr >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid">Fecha de nacimiento de su Padre o madre:<font class='cascade4' >
							        <input type="text" class='e_texto' id="DiaComp"  name="DiaComp" value="" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)">
							    /							      <input type="text" class='e_texto' id="MesComp"   name="MesComp" value="" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">
							      /
							      <input type="text" class='e_texto' id="AnioComp" name="AnioComp" value="" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio5();">						      </font></td>
							      <td height="30" colspan="5"  align="center" style="border-bottom:1px solid">&nbsp;</td>
						        </tr>
                                
                                
                                    
                                     <tr>
							        <td  height="33" colspan="6"  class="cabecera2"><font class="etiqueta"><strong>Otros Aspectos</strong></font></td></tr>
						        <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Disposici&oacute;n para trabajar a tiempo completo 
							            <select name="cmbdisposicion" id="cmbdisposicion" class="e_combo" style="width:120" onChange="validaDis(this.value)" >
							              <option value="0">Seleccione....</option>
							              <option value="1">S&Iacute;</option>
							              <option value="2">NO</option>
						              </select>
						           <font class='alerta5'>(*)</font></td>
					            </tr>
                                <%IF id_proyecto=2 and id=2 THEN%>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Esta dispuesta a trabajar en horarios de trabajo que incluya s&aacute;bados, domingos y feriados
							            <select name="cmbdispoSabDom" id="cmbdispoSabDom" class="e_combo" style="width:120" onChange="validadom(this.value)" >
							              <option value="0">Seleccione....</option>
							              <option value="1">S&Iacute;</option>
							              <option value="2">NO</option>
						              </select>
						           <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Se compromete usted adecuarse al horario de los informantes (lo que implica visitas en las noches o muy temprano) 
							            <select name="cmbdCompromiso" id="cmbdCompromiso" class="e_combo" style="width:120" onChange="validaHorario(this.value)" >
							              <option value="0">Seleccione....</option>
							              <option value="1">S&Iacute;</option>
							              <option value="2">NO</option>
						              </select>
						           <font class='alerta5'>(*)</font></td>
					            </tr>
                                <%ELSE%>
                                <input type="hidden" name="cmbdispoSabDom" id="cmbdispoSabDom" VALUE="0">
								            <input type="hidden" name="cmbdCompromiso" id="cmbdCompromiso" value="0">
                                <%END IF%>
				              </table></td>
						  </tr>
                  </table> 				</td>
 			</tr>
          <tr height=3>
            <td colspan=6 align=left>
            <DIV class="CLS">
              <input type=hidden id="txtOper" name="txtOper" value="">
            </DIV>
            <table cellpadding="0" cellspacing="0" border="0"  width="100%" class="tablam" style="BORDER-TOP: #0F83E1 1px solid; BORDER-LEFT: #0F83E1 1px solid;BORDER-RIGHT: #0F83E1 1px solid" >
              <tr>
                <td colspan=8 background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><span class="mensaje2">6. Declaraci&oacute;n de Veracidad de Datos</span></td>
              </tr>
              <tr height=22 >
                <td width="79%"  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="etiqueta">Declaro bajo juramento que los datos consignados en la presente ficha de inscripci&oacute;n, corresponden a la verdad; los mismos que podr&aacute;n ser verificados con los documentos sustentatorios de mi Curriculum Vitae, conforme presente a la instituci&oacute;n.<br><strong>NOTA: Los datos consignados se contrastar&aacute;n con sus documentos adjuntos</strong><font class='cascade4' color=crimson></font></span></td>
                <td width="21%"  height="28" colspan="2" align="left"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta"><font class='alerta5' >
                  <select id="cmbVeracidad" name="cmbVeracidad" class="e_combo" style="width:120" onChange="validaDJ(this.value)"  >
                    <option selected value="">Seleccione...</option>
                    <option value="1">SI</option>
                    <option value="2">NO</option>
                  </select>
                  (*)</font></span></td>
              </tr>
            </table></td>
          </tr>
      <tr><td colspan="3" height="2"></td></tr>
			<tr>
				<td colspan=3>
					<table border="0" width="100%" align=center cellspacing=0 cellpadding=0>
					<tr height=6>
						<td colspan=4></td></tr>
	                   
					</table>				</td>
			</tr>
      <tr><td colspan="3" height="2"></td></tr> 
			</table>	</td>
	</tr>

     <tr><td height="21" colspan=4 align=center><input type="button" value="Enviar Datos" onClick="javascript:enviarFicha('1')" id="button1" name="button1"  class="boton">	  
			 </td></tr>
	</table>
</form>

</div>
	<div id="divDerechoAutor"></div>
</body>
</html>

