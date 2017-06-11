<%@ Language=VBScript %>
<%session.lcid=2057%>
<!-- #include file="Conexion.asp"  --> 
<%  		 	 
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 

Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario = Session("id_usuario")
Id_ConvocatoriaCargo=Request("lsIdConvocatoriaCargo")

sub generaProceso(id)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec pa_proceso_convocatoria_listar '"& Id_ConvocatoriaCargo &"' ")
	Response.Write "<select  style=""width:200px"" class=""e_combo"" id=""cmbproceso"&id&""" name=""cmbproceso"&id&""" onChange=""guardarDetalle(this.value, '"& id &"')""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if id=wRsDptoapli(0) then
		Response.Write "<option selected title=""" & wRsDptoapli(1) & """ value="""&wRsDptoapli(0)&"*"&wRsDptoapli(2)& """>"&wRsDptoapli(1)&"</option>"
	else
		Response.Write "<option title=""" & wRsDptoapli(1) & """ value=""" &wRsDptoapli(0)&"*"&wRsDptoapli(2)&  """>"&wRsDptoapli(1)&"</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaProcesoN(id)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec pa_proceso_convocatoria_listar '"& Id_ConvocatoriaCargo &"' ")
	Response.Write "<select  style=""width:200px"" class=""e_combo"" id=""cmbprocesoN"" name=""cmbprocesoN"" onChange=""verDetalleProc(this.value)""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if id=wRsDptoapli(0) then
		Response.Write "<option selected title=""" & wRsDptoapli(1) & """ value="""&wRsDptoapli(0)& """>"&wRsDptoapli(1)&"</option>"
	else
		Response.Write "<option title=""" & wRsDptoapli(1) & """ value=""" &wRsDptoapli(0)& """>"&wRsDptoapli(1)&"</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaDpto2()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_dpto_cerresidencia   ")
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto2"" name=""txtDpto2""   onChange=""generaprov2()"" >"
	Response.Write " <option id="""" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

	
End sub


sub generaNivel()
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getNivel_editar '"& Id_ConvocatoriaCargo &"' ")
		
	While not wRsDptoapli.EOF
	
	if isnull(wRsDptoapli(2)) or wRsDptoapli(2)="" then 
		Response.Write "<input class=""checkbox1"" type=""checkbox"" name="""& wRsDptoapli(0) &""" id=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "<br/>"
	else 
		Response.Write "<input checked class=""checkbox1"" type=""checkbox"" name="""& wRsDptoapli(0) &""" id=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "<br/>"
	end if
		wRsDptoapli.MoveNext
	Wend
		
	Response.Write "</select>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaGrado()
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getgGrado_editar '"& Id_ConvocatoriaCargo&"' ")
		
	While not wRsDptoapli.EOF
	 if isnull(wRsDptoapli(2)) or wRsDptoapli(2)="" then 
		Response.Write "<input type=""checkbox""  class=""checkbox2""  name="""& wRsDptoapli(0) &""" id=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "<br/>"
	else 
		Response.Write "<input checked type=""checkbox""  class=""checkbox2""  name="""& wRsDptoapli(0) &""" id=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "<br/>"
	end if 
		wRsDptoapli.MoveNext
	Wend
		
	Response.Write "</select>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

%>

<html>
<head>
 <title>..:: SISTEMA DE CONSECUCI&OACUTE,N DE RECURSOS HUMANOS ::..</title>

   <link rel="stylesheet" type="text/css" href="Styles/inei.css">   
   <script src="js/jquery-1.7.2.js"></script>
   
   <style>
   p
	{
	white-space:pre-line;
	} 

   </style>
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

function actualizarCronograma (id, estado){
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&estado="+escape(estado)+"&lsTipo=151";
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                // document.getElementById("p"+campo).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            	alert("El cambio se realizo correctamente")
            	location.reload(true);									
				//document.getElementById("p"+campo).innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
               // document.getElementById("p"+campo).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                    // document.getElementById("p"+campo).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function mod_pres(id_cc,valor,campo)
{
	
	//valor=valor.replace(/<li\s*\/*><br><li>/g,"\n");
	valor=valor.replace(/<br>/g,"\n");
	ajax=http_request();
	var valores;	
	valores= "lsid_cc=" + escape(id_cc)+"&lsvalor="+escape(valor)+"&lsCampo="+campo+"&lsTipo=68";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("p"+campo).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
				document.getElementById("p"+campo).innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                document.getElementById("p"+campo).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("p"+campo).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function mod_presCron(id_cron,valor,campo)
{
	valor=valor.replace(/<br>/g,"\n");
	ajax=http_request();
	var valores;	
	valores= "lsid_cc=" + escape(id_cron)+"&lsvalor="+escape(valor)+"&lsCampo="+campo+"&lsTipo=149";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("p"+campo+id_cron).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
				document.getElementById("p"+campo+id_cron).innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                document.getElementById("p"+campo+id_cron).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("p"+campo+id_cron).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function grabar_ModPres(lsid, valor_nuevo,campo)
{
	ajax=http_request();
	
	valor_nuevo=valor_nuevo.replace(new RegExp("\\n","g"),'<br>');	
	var valores;	

	
	valores= "lsId_cc=" + escape(lsid)+"&lsvalor="+escape(valor_nuevo)+"&lsCampo="+escape(campo)+"&lsTipo=69";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("p"+campo).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            						
					objetivo=ajax.responseText.replace(new RegExp("---","g"),'<br>');								
					document.getElementById("p"+campo).innerHTML =objetivo;
					
            }
            else if(ajax.status==404){
                     document.getElementById("p"+campo).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     objetivo=ajax.responseText.replace(new RegExp("\\n","g"),'<br>');								
					document.getElementById("p"+campo).innerHTML =objetivo;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function grabar_ModPresCron(lsid, valor_nuevo,campo)
{
	ajax=http_request();
	
	valor_nuevo=valor_nuevo.replace(new RegExp("\\n","g"),'<br>');	
	var valores;	

	
	valores= "lsId_cc=" + escape(lsid)+"&lsvalor="+escape(valor_nuevo)+"&lsCampo="+escape(campo)+"&lsTipo=150";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("p"+campo+lsid).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            						
					objetivo=ajax.responseText.replace(new RegExp("---","g"),'<br>');								
					document.getElementById("p"+campo+lsid).innerHTML =objetivo;
					
            }
            else if(ajax.status==404){
                     document.getElementById("p"+campo+lsid).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     objetivo=ajax.responseText.replace(new RegExp("\\n","g"),'<br>');								
					document.getElementById("p"+campo+lsid).innerHTML =objetivo;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function guardar(div,id,valor){
	
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&valor=" + escape(valor)+"&div=" + escape(div)+"&lsTipo=105";  // parametros a enviar al servidor	
		

		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById(div).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById(''+div+'').innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                      document.getElementById(''+div+'').innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById(''+div+'').innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function EliminarUbigeocargo(id, ccdd,ccpp, ccdi, tipo){
 	if (confirm("Esta seguro(a) de modificar este registro?")) {
		
		pea=0
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&ccdd=" + escape(ccdd)+"&ccpp=" + escape(ccpp)+"&ccdi=" + escape(ccdi)+"&pea=" + escape(pea)+"&tipo=" + escape(tipo)+"&lsTipo=107";  // parametros a enviar al servidor	
		

		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divLug").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				alert("El cambio se realizo correctamente")
            		location.reload(true);
            }
            else if(ajax.status==404){
                      document.getElementById("divLug").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divLug").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
		
		
		}
		else 
		return false;	
}



function AddUbigeocargo(id,tipo){
 	if (confirm("Esta seguro(a) de agregar el registro?")) {
		
	var ccdd =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
	if (ccdd==""){
		alert("Seleccione un Departamento");
		return false
		}
	
	var ccpp =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
	if (ccpp==""){
		alert("Seleccione una Provincia");
		return false
		}
		
		
		
		
	var ccdi =document.getElementById("txtDist2").options[document.getElementById("txtDist2").selectedIndex].value;
	if (ccdi==""){
		alert("Seleccione un Distrito");
		return false
		}
		
		
	var pea=document.getElementById("peaNue").value;
	if (pea==""){
		alert("Seleccione la cantidad ed Personal que se requiere");
		return false
		}
		
		
	ajax=http_request();
	var valores;	
	valores= "id=" + escape(id)+"&ccdd=" + escape(ccdd)+"&ccpp=" + escape(ccpp)+"&ccdi=" + escape(ccdi)+"&pea=" + escape(pea)+"&tipo=" + escape(tipo)+"&lsTipo=107";  // parametros a enviar al servidor	
		

		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divLug").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            		alert("Se agrego el ubigeo correctamente")
					location.reload(true);
				//	document.getElementById("divLug").innerHTML = ajax.responseText;
            }
            else if(ajax.status==404){
                      document.getElementById("divLug").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divLug").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
		
		
		}
		else 
		return false;	
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
					verdis3();
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

function verdis2(){

    
    var varProv =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
 

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

function grabarNG(id_cc){

	var nivel='';
	var grado='';
	var test_psico=document.getElementById("cmbCompetencias").value;
	var mom_psico=document.getElementById("cmbMomentoComp").value;
	var test_cono=document.getElementById("cmbConocimientos").value;
	var mom_cono=document.getElementById("cmbMomentoCono").value;
	
	
	
if ( document.getElementById("Datos_adicionales").checked==true) 
{	Datos_adicionales= 1
	}
	/* var Datos_adicionales=document.getElementById("Datos_adicionales").value;
	 var Adjuntar_cv=document.getElementById("Adjuntar_cv").value;
	 var ver_tambo=document.getElementById("ver_tambo").value;
	 var valProvNac=document.getElementById("valProvNac").value;
	 var valDistNac=document.getElementById("valDistNac").value;
	 var valDptoNac=document.getElementById("valDptoNac").value;
	 var valHijoUnico=document.getElementById("valHijoUnico").value;
	 var valJefeHogar=document.getElementById("valJefeHogar").value;
	 var valLengMat=document.getElementById("valLengMat").value;
	 var valLeng=document.getElementById("valLeng").value;
	 var valIdiomaC=document.getElementById("valIdiomaC").value;
	 var valNivelIdioma=document.getElementById("valNivelIdioma").value;
	 var valDomIdioma=document.getElementById("valDomIdioma").value;
	 var valOperTel=document.getElementById("valOperTel").value;
	 var valFecExpGrado=document.getElementById("valFecExpGrado").value;
	 var valRegGrado=document.getElementById("valRegGrado").value;

	 
	 var valperioalc=document.getElementById("valperioalc").value;
	 var valPeriodo=document.getElementById("valPeriodo").value;
	 var valUniversidad=document.getElementById("valUniversidad").value;
	 var valCentro=document.getElementById("valCentro").value;
	 var valTipZona=document.getElementById("valTipZona").value;

	 var valNomZona=document.getElementById("valNomZona").value;
	 var valExpNomInst=document.getElementById("valExpNomInst").value;
	 var valExpTiempoAnio=document.getElementById("valExpTiempoAnio").value;
	 var valExpTiempoMeses=document.getElementById("valExpTiempoMeses").value;
	 var valProyectosInei=document.getElementById("valProyectosInei").value;

	 var valInstitucion=document.getElementById("valInstitucion").value;
	 var valFechaNac=document.getElementById("valFechaNac").value;
	 var valEdad=document.getElementById("valEdad").value;*/
	 
	 
	 

Datos_adicionales= 0;
Adjuntar_cv=0	;
ver_tambo=0	;
valProvNac=0	;
valDistNac=0	;
valDptoNac=	0;
valHijoUnico=0	;
valJefeHogar=0	;
valLeng=0	;
valIdiomaC=0	;
valOperTel=	0;
valFecExpGrado=0;	
valRegGrado=0	;
valperioalc=0	;


valPeriodo=0	;
valUniversidad=0;	
valCentro=0	;
valTipZona=0	;
valNomZona=0	;
valExpNomInst=0	;
valExpTiempoAnio=0	;
valExpTiempoMeses=0	;
valProyectosInei=0	;
valInstitucion=0	;
valFechaNac=0	;
valEdad=0	;
valNivelIdioma=0;	
valDomIdioma=0;
valLengMat=0;

	
if ( document.getElementById("Datos_adicionales").checked==true) {	Datos_adicionales= 1;	}
if ( document.getElementById("Adjuntar_cv").checked==true) {	Adjuntar_cv=1;	}
if ( document.getElementById("ver_tambo").checked==true) {	ver_tambo=1;	}
if ( document.getElementById("valProvNac").checked==true) {	valProvNac=1;	}
if ( document.getElementById("valDistNac").checked==true) {	valDistNac=1;	}
if ( document.getElementById("valDptoNac").checked==true) {	valDptoNac=1;	}
if ( document.getElementById("valHijoUnico").checked==true) {	valHijoUnico=1;	}
if ( document.getElementById("valJefeHogar").checked==true) {	valJefeHogar=1;}

if ( document.getElementById("valLengMat").checked==true) {	valLengMat=1;}

if ( document.getElementById("valLeng").checked==true) {	valLeng=1;	}

if ( document.getElementById("valIdiomaC").checked==true) {	valIdiomaC=1;	}
if ( document.getElementById("valNivelIdioma").checked==true) {	valNivelIdioma=1;	}
if ( document.getElementById("valDomIdioma").checked==true) {	valDomIdioma=1;	}

if ( document.getElementById("valOperTel").checked==true) {	valOperTel=1;	}
if ( document.getElementById("valFecExpGrado").checked==true) {	valFecExpGrado=1;	}
if ( document.getElementById("valRegGrado").checked==true) {	valRegGrado=1;	}
if ( document.getElementById("valperioalc").checked==true) {	valperioalc=1;	}


if ( document.getElementById("valPeriodo").checked==true) {	valPeriodo=1;	}
if ( document.getElementById("valUniversidad").checked==true) {	valUniversidad=1;	}
if ( document.getElementById("valCentro").checked==true) {	valCentro=1;	}
if ( document.getElementById("valTipZona").checked==true) {	valTipZona=1;	}
if ( document.getElementById("valNomZona").checked==true) {	valNomZona=1;	}
if ( document.getElementById("valExpNomInst").checked==true) {	valExpNomInst=1;	}
if ( document.getElementById("valExpTiempoAnio").checked==true) {	valExpTiempoAnio=1;	}
if ( document.getElementById("valExpTiempoMeses").checked==true) {	valExpTiempoMeses=1;	}
if ( document.getElementById("valProyectosInei").checked==true) {	valProyectosInei=1;	}
if ( document.getElementById("valInstitucion").checked==true) {	valInstitucion=1;	}
if ( document.getElementById("valFechaNac").checked==true) {	valFechaNac=1;	}
if ( document.getElementById("valEdad").checked==true) {	valEdad=1;	}
	
  
  
	
	if (test_psico!= 0 && mom_psico==0){
		alert ('Seleccione en que momento se realziar\xe1 el test psicol\xf3gico');
		return false;
	}
	
	if (mom_psico!= 0 && test_psico==0){
		alert ('Seleccione el test psicológico que se va a aplicar a la convocatoria');
		return false;
	}
	
	if (test_cono!= 0 && mom_cono==0){
		alert ('Seleccione en que momento se realziar\xe1 el test psicol\xf3gico');
		return false;
	}
	
	/*if (mom_cono != 0 && test_cono==0){
		alert ('Seleccione el test de competencias que se va a aplicar a la convocatoria');
		return false;
	}*/
	
	
					
	$('.checkbox1').each(function(){ 
	var checkbox1 = $(this); 
					//alert('El checkbox ' + checkbox1.attr('name') + ' está checkeado? ' + checkbox1.is(':checked') ); 
	if (checkbox1.is(':checked')==true)
		nivel=nivel+checkbox1.attr('name')+',';
	});
					
	$('.checkbox2').each(function(){ 
	var checkbox2 = $(this); 
					//alert('El checkbox ' + checkbox1.attr('name') + ' está checkeado? ' + checkbox1.is(':checked') ); 
	if (checkbox2.is(':checked')==true)
		grado=grado+checkbox2.attr('name')+',';
	});
	
	if (nivel==''){
		alert('Seleccione Nivel Acad\xe9mico');
		return false;
	}
		
	if (grado==''){
			alert('Seleccione Grado Acad\xe9mico');
			return false;
	}
	
	var cantNivel = nivel.length;
	var Nivel1 = nivel.substring(0,(cantNivel-1)); 
			
	var cantGrado= grado.length;
	var Grado1 = grado.substring(0,(cantGrado-1));
	
	
	if (confirm("Esta seguro(a) de agregar el registro?")) {
		
	ajax=http_request();
	var valores;	
	 valores= "nivel=" + escape(Nivel1)+"&grado=" + escape(Grado1)+"&id_cc=" + escape(id_cc)+"&test_psico=" + escape(test_psico)+"&mom_psico=" + escape(mom_psico)+"&test_cono=" + escape(test_cono)+"&mom_cono=" + escape(mom_cono)+"&lsTipo=148"+"&Datos_adicionales="+escape(Datos_adicionales )+"&Adjuntar_cv= "+escape(Adjuntar_cv)+"&ver_tambo="+escape(ver_tambo)+  "&valProvNac="+escape(valProvNac)+  "&valDistNac="+escape(valDistNac)+  "&valDptoNac="+escape(valDptoNac)+ "&valHijoUnico="+escape(valHijoUnico)+  "&valJefeHogar="+escape(valJefeHogar)+  "&valLengMat="+escape(valLengMat)+ "&valLeng="+escape(valLeng)+  "&valIdiomaC="+escape(valIdiomaC)+ "&valNivelIdioma="+escape(valNivelIdioma)+  "&valDomIdioma="+escape(valDomIdioma)+  "&valOperTel="+escape(valOperTel)+  "&valFecExpGrado = "+escape(valFecExpGrado)+  "&valRegGrado = "+escape(valRegGrado)+  "&valperioalc ="+escape(valperioalc)+  "&valPeriodo = "+escape(valPeriodo)+  "&valUniversidad = "+escape(valUniversidad )+  "&valCentro = "+escape(valCentro)+  "&valTipZona = "+escape(valTipZona)+  "&valNomZona = "+escape(valNomZona)+    "&valExpNomInst = "+escape(valExpNomInst)+  "&valExpTiempoAnio = "+escape(valExpTiempoAnio)+  "&valExpTiempoMeses = "+escape(valExpTiempoMeses)+  "&valProyectosInei = "+escape(valProyectosInei)+  
  "&valInstitucion = "+escape(valInstitucion)+  "&valFechaNac = "+escape(valFechaNac)+  "&valEdad = "+escape(valEdad); // parametros a enviar al servidor	
		

		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
               //  document.getElementById("divLug").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            		alert("Se actualizo el nivel y grado")
					location.reload(true);
				//	document.getElementById("divLug").innerHTML = ajax.responseText;
            }
            else if(ajax.status==404){
                    //  document.getElementById("divLug").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                    // document.getElementById("divLug").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
		
		
		}
		else {
			return false;	
		}
	
}


function verDetalleProc (valor, id){
	var Datos = new Array();             
    Datos=valor.split("*");
	var datos_ver=''
	if (Datos[1]!='' ) {
		datos_ver=Datos[1];
	}
	document.getElementById("txtDetalleProc").value=datos_ver;
	
}

function guardarDetalle (valor, id_cronograma){
	var Datos = new Array();             
    Datos=valor.split("*");
	var id_proceso=Datos[0];
	
	ajax=http_request();
	var valores;	
	valores= "id_proceso=" + escape(id_proceso)+'&id_cronograma='+id_cronograma+'&lsTipo=152';  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			// document.getElementById("distcon").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					//	document.getElementById("distcon").innerHTML =ajax.responseText;//}
				alert("Se realizo el cambio correctamente")
				location.reload(true);
					
            }
            else if(ajax.status==404){
                   //  document.getElementById("distcon").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                  //   document.getElementById("distcon").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}

function formateafecha(fecha) 

{ 

var long = fecha.length; 

var dia; 

var mes; 

var ano; 

function IsNumeric(valor) 

{ 

var log=valor.length; var sw="S"; 

for (x=0; x<log; x++) 

{ v1=valor.substr(x,1); 

v2 = parseInt(v1); 

//Compruebo si es un valor numérico 

if (isNaN(v2)) { sw= "N";} 

} 

if (sw=="S") {return true;} else {return false; } 

} 

if ((long>=2) && (primerslap==false)) { dia=fecha.substr(0,2); 

if ((IsNumeric(dia)==true) && (dia<=31) && (dia!="00")) { fecha=fecha.substr(0,2)+"/"+fecha.substr(3,7); primerslap=true; } 

else { fecha=""; primerslap=false;} 

} 

else 

{ dia=fecha.substr(0,1); 

if (IsNumeric(dia)==false) 

{fecha="";} 

if ((long<=2) && (primerslap=true)) {fecha=fecha.substr(0,1); primerslap=false; } 

} 

if ((long>=5) && (segundoslap==false)) 

{ mes=fecha.substr(3,2); 

if ((IsNumeric(mes)==true) &&(mes<=12) && (mes!="00")) { fecha=fecha.substr(0,5)+"/"+fecha.substr(6,4); segundoslap=true; } 

else { fecha=fecha.substr(0,3);; segundoslap=false;} 

} 

else { if ((long<=5) && (segundoslap=true)) { fecha=fecha.substr(0,4); segundoslap=false; } } 

if (long>=7) 

{ ano=fecha.substr(6,4); 

if (IsNumeric(ano)==false) { fecha=fecha.substr(0,6); } 

else { if (long==10){ if ((ano==0) || (ano<1900) || (ano>2100)) { fecha=fecha.substr(0,6); } } } 

} 



if (long>=10) 

{ 

fecha=fecha.substr(0,10); 

dia=fecha.substr(0,2); 

mes=fecha.substr(3,2); 

ano=fecha.substr(6,4); 

// Año no viciesto y es febrero y el dia es mayor a 28 

if ( (ano%4 != 0) && (mes ==02) && (dia > 28) ) { fecha=fecha.substr(0,2)+"/"; } 

if ( mes == 4 || mes == 6 || mes == 9 || mes == 11 ){ if (dia==31) fecha=fecha.substr(0,2)+"/"; }

} 

return (fecha); 

}   

function verificarFechas (){
	var fec_ini=document.getElementById("txtIniProc").value;
	var fec_fin=document.getElementById("txtFinProc").value;
 
	if (fec_fin!=''){
		var fecFin = new Array();
		fecFin=fec_fin.split("/");
		var fecFin_t=fecFin[2]+fecFin[1]+fecFin[0];
		
		if (fec_ini!=''){
			var fecIni = new Array();
			fecIni=fec_ini.split("/");
			var fecIni_t=fecIni[2]+fecIni[1]+fecIni[0];
			if (fecIni_t>fecFin_t){
				alert ('Fecha de inicio mayor a fecha final, corregir');
				document.getElementById("txtIniProc").value='';
				document.getElementById("txtFinProc").value='';
				document.getElementById("txtIniProc").focus();
				return false;
			}

		} else {
			alert ('Registre fecha de inicio del proceso');
			document.getElementById("txtIniProc").focus();
			return false;
		}
		
	} else {
		return false;
		}
}


function guardarCronograma (id_cc){
	var proceso_id=document.getElementById("cmbprocesoN").value;
	var detalle=document.getElementById("txtDetalleProc").value;
	var fec_ini=document.getElementById("txtIniProc").value;
	var fec_fin=document.getElementById("txtFinProc").value;
	var nota=document.getElementById("txtNota").value;
 
 	if (parseInt(proceso_id)==0){
		alert ('Seleccione el tipo de proceso en el cronograma, no puede dejar en seleccione');
		return false;
	}
	
	if (detalle==""){
		alert ('Registre la descripcion del proceso en el cronograma, no puede dejar en blanco');
		return false;
	}
	detalle=detalle.replace(new RegExp("\\n","g"),'<br>');
 
	if (fec_fin!=''){
		var fecFin = new Array();
		fecFin=fec_fin.split("/");
		var fecFin_t=fecFin[2]+fecFin[1]+fecFin[0];
				
		if (fec_ini!=''){
			var fecIni = new Array();
			fecIni=fec_ini.split("/");
			var fecIni_t=fecIni[2]+fecIni[1]+fecIni[0];
			if (fecIni_t>fecFin_t){
				alert ('Fecha de inicio mayor a fecha final, corregir');
				document.getElementById("txtIniProc").value='';
				document.getElementById("txtFinProc").value='';
				document.getElementById("txtIniProc").focus();
				return false;
			}
		
		} else {
			alert ('Registre fecha de inicio del proceso');
			document.getElementById("txtIniProc").focus();
			return false;
		}
			
	} else {
		if (fec_ini==''){
			alert ('Registre fecha de inicio del proceso');
			document.getElementById("txtIniProc").focus();
			return false;
		}
	}
			
	ajax=http_request();
	var valores;	
	valores= "proceso_id=" + escape(proceso_id)+'&detalle='+escape(detalle)+'&fec_ini='+escape(fec_ini)+'&fec_fin='+escape(fec_fin)+'&nota='+escape(nota)+'&id_cc='+escape(id_cc)+'&lsTipo=153';  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				alert("Se ingreso el nuevo proceso al cronograma")
				location.reload(true);
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

</script>

   <style type="text/css">
<!--
.style4 {font-weight: normal; font-size: 11px; font-family: verdana, arial, sans-serif; text-align: left; padding: 2px;}
.style5 {font-weight: normal; font-size: 10px; font-family: verdana, arial, sans-serif; text-align: left; padding: 2px;}
-->


   </style>
   
   <style>
<!--
A:link {text-decoration: none}
A:visited {text-decoration: none}
-->
</style>
</head>

<%

consulta = "EXEC dbo.get_publicacion '"&Id_ConvocatoriaCargo&"'" 


	Set RsP1	= Server.CreateObject("ADODB.Recordset") 
	RsP1.cursorlocation=3
	RsP1.Open consulta, MiCone, 3,3

consulta1 = "EXEC dbo.get_Convocatoriacargo '"& Id_ConvocatoriaCargo & "'" 
  	

	Set RsP	= Server.CreateObject("ADODB.Recordset") 
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3

	     
	If  Not RsP.BOF And Not RsP.EOF Then  %>
	
    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
                <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3">
                  <tr>
                    <td  align="center" bgcolor="#DAE8F3" class="subtitulo"> Visualizar Convocatoria</td>
                  </tr>
                  <tr>
<td>
		<div align="left" style="font:Arial, Helvetica, sans-serif; font-size:14px; color: #06C; ">
		</div>
		<div id="CollapsiblePanel1" >
		     <div  tabindex="0">
				<div align="left" style="font:Arial, Helvetica, sans-serif; font-size:14px; color: #06C; "> 
						<div align="left" style="font:Arial, Helvetica, sans-serif; font-size:14px; color: #06C; "><strong><%=RsP.Fields("pea")%>&nbsp;<%=RsP.Fields("subtitulo")%> - <%=RsP.Fields("departamento")%> </strong><strong style="">&nbsp;&nbsp;&nbsp;[clic para ver detalle]</strong>
						</div>


					<p><span class="etiqueta2"><strong>Se requiere:<%=RsP.Fields("pea")%>&nbsp; <%=RsP.Fields("subtitulo")%> - </strong><strong><%=RsP.Fields("departamento")%></strong><br>
               <%=RsP1.Fields("dependencia")%> <br><br></span></p> 
						<p><span class="etiqueta2"><font id="pobjetivo"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("objetivo")%>','objetivo');" ><%=RsP.Fields("objetivo")%></a></font></span></p>
						 
						 
						 
						 <p><span class="etiqueta2"><strong>Duraci&oacute;n de Convocatoria</strong> <br>
						Inicio: <%=RsP.Fields("inicio")%><br>
						Fin: <%=RsP.Fields("fin")%></span></p> 
				</div>    

		    </div> 

		<div >
        
        <% SQL5 = "exec dbo.pa_ubigeocaro_listarPea_Editar '"&Id_ConvocatoriaCargo&"' "	
		

		Set RSCuad5	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad5.cursorlocation=3
		RSCuad5.Open SQL5, MiCone, 3,3
		
If Not RSCuad5.BOF And Not RSCuad5.EOF Then %>
        <table class="tabla2"  border="1" cellpadding="2" cellspacing="2" id= bordercolor="#DAE8F3"  align="center" >
          <tr><th colspan="5" class="etiqueta2"><div align="center"><strong>Personal Convocado por ODEI</strong></div></th></tr>
<tr>
        <th  bordercolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>DEP</strong></div></th>
        <th  bordercolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>PROV</strong></div></th>
        <th  bordercolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>DIST</strong></div></th>
        <th align="center"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="etiqueta2"><div align="center"><strong>Personal Requerido</strong></div></th>
        <th align="center"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="etiqueta2"><div align="center"><strong>Editar      </strong></div></th>
      </tr>
      
       <%  		
							
			Do While Not RSCuad5.EOF %>
      <tr class='<%=clase%>'>
        <td class='etiqueta'>&nbsp;<%=RSCuad5.Fields("DPTO")%></td>
        <td class='etiqueta'>&nbsp;<%=RSCuad5.Fields("PROV")%></td>
        <td class='etiqueta'>&nbsp;<%=RSCuad5.Fields("DIST")%></td>
        <td class='etiqueta' id="co<%=RSCuad5.Fields("codigo")%>"> <input name="<%=RSCuad5.Fields("codigo")%>" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="<%=RSCuad5.Fields("codigo")%>" value="<%=RSCuad5.Fields("pea")%>"  onblur="guardar('co<%=RSCuad5.Fields("codigo")%>',this.id,this.value)" size="5" maxlength="5" />
        </td>
        <td class='etiqueta'>
        <%if RSCuad5.Fields("estado")=1 then%>
        <img src="images/eliminar.png" title="Deshabiliatr ubigeo" style="CURSOR:HAND"  onclick="EliminarUbigeocargo('<%=Id_ConvocatoriaCargo%>','<%=RSCuad5.Fields("id_ccdd")%>','<%=RSCuad5.Fields("id_ccpp")%>','<%=RSCuad5.Fields("id_ccdi")%>', '1')" ></img>
        <%else%>
        <img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="EliminarUbigeocargo('<%=Id_ConvocatoriaCargo%>','<%=RSCuad5.Fields("id_ccdd")%>','<%=RSCuad5.Fields("id_ccpp")%>','<%=RSCuad5.Fields("id_ccdi")%>', '2')" ></img>
        <%end if%>
        <div id="divLug"></div></td>
      </tr>
                 <%
			RSCuad5.MoveNext
			Loop	
			RSCuad5.close
			set RSCuad5=nothing 
 %>
     <tr class='<%=clase%>'>
        <td class='etiqueta'><% generaDpto2()%></td>
        <td class='etiqueta' id="prov2"><select name="txtProv2" id="txtProv2"   class='e_combo' style="width:200px;" >
								  <option title="Todos" value=""  selected>Seleccione... </option>
								  </select></td>
        <td class='etiqueta' id="distcon"><select name="txtDist2" id="txtDist2"  class='e_combo' style="width:200px;">
                                  <option title="Todos" value="" selected>Seleccione...</option>
                                </select></td>
        <td class='etiqueta' ><input name="peaNue" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="peaNue" value=""  size="5" maxlength="5" /></td>
        <td class='etiqueta'>
        <img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="AddUbigeocargo('<%=Id_ConvocatoriaCargo%>','3')" ></img>
        <div id="divLug"></div></td>
      </tr> 
  </table>
    
    <%end if %>
        
           
            <p class="etiqueta2"><strong>Perfil Requerido:</strong></p>
			<ol class="etiqueta2">
		    <font id="pperfil"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("perfil")%>','perfil')"><%=RsP.Fields("perfil")%></a></font>
			</ol>
            
            <p class="etiqueta2"><strong>Datos Complementarios:</strong></p>
			<ol class="etiqueta2">
			<font class="etiqueta" id="pdatos_complementarios"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("datos_complementarios")%>','datos_complementarios')"><%=RsP.Fields("datos_complementarios")%></a></font>
			</ol>
            
            
            
            <p class="etiqueta2"><strong>Caracteristicas del Contrato:</strong></p>
			<ol class="etiqueta2">
		    <font id="pcaracteristicas_contrato"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Caracteristicas_contrato")%>','caracteristicas_contrato')"><%=RsP.Fields("Caracteristicas_contrato")%></a></font>
			</ol>
            
            
			<p class="etiqueta2"><strong>Proceso de Selecci&oacute;n</strong></p>
		

 <table class="tabla2" style="display:none"  border="1" cellpadding="2" cellspacing="2" id= bordercolor="#DAE8F3"  align="center" >
	<tr><th colspan="2" class="etiqueta2"><div align="center"><strong>Cronograma</strong></div></th></tr>
    
    <tr class='<%=clase%>'>
	   <td class="etiqueta2" width="50%" >Publicaci&oacute;n de la convocatoria www.inei.gob.pe</td>
        <td class='etiqueta' width="20%"><font id="pInscripcion"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Inscripcion")%>','Inscripcion')"><%=RsP.Fields("Inscripcion")%></a></font>
</td>
      </tr>
    
    <tr class='<%=clase%>'>
	   <td class="etiqueta2" >Registro de Ficha de Postulantes a a trav&eacute;s de la p&aacute;gina web Institucional www.inei.gob.pe</td>
        <td class='etiqueta'><font id="pLlenado_ficha"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Llenado_ficha")%>','Llenado_ficha')"><%=RsP.Fields("Llenado_ficha")%></a></font></td>
      </tr>
      
      <tr class='<%=clase%>'>
        <td class='etiqueta2'>Evaluaci&oacute;n Curricular (Ficha de datos del postulante)</td>
        <td class='etiqueta'><font id="pev_curricular"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("ev_curricular")%>','ev_curricular')"><%=RsP.Fields("ev_curricular")%></a></font></td>
      </tr>
      
      <tr class='<%=clase%>'>
        <td class='etiqueta2'>Resultado de Evaluaci&oacute;n Curricular:</td>
        <td class='etiqueta'><font id="pPub_ResultadosCV"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Pub_ResultadosCV")%>','Pub_ResultadosCV')"><%=RsP.Fields("Pub_ResultadosCV")%></a></font></td>
      </tr>
      
      <tr class='<%=clase%>'>
        <td class='etiqueta2'>Evaluaci&oacute;n Conocimientos y Competencias</td>
        <td class='etiqueta'><font id="pPrueba_Conocimientos"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Prueba_Conocimientos")%>','Prueba_Conocimientos')"><%=RsP.Fields("Prueba_Conocimientos")%></a></font></td>
      </tr>
      
      <tr class='<%=clase%>'>
        <td class='etiqueta2'>Publicaci&oacute;n de Resultados de evaluaci&oacute;n</td>
        <td class='etiqueta'><font id="pPub_resultadosPrueba"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Pub_resultadosPrueba")%>','Pub_resultadosPrueba')"><%=RsP.Fields("Pub_resultadosPrueba")%></a></font></td>
      </tr>
      
      <tr class='<%=clase%>'>
        <td class='etiqueta2'>Entrevista Personal:<BR>
        <font id="pproceso"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("proceso")%>','proceso')"><%=RsP.Fields("proceso")%></a></font>
        </td>
        <td class='etiqueta'><font id="pEntrevistaPersonal"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("EntrevistaPersonal")%>','EntrevistaPersonal')"><%=RsP.Fields("EntrevistaPersonal")%></a></font></td>
      </tr>
     
     <tr class='<%=clase%>'>
        <td class='etiqueta2'>Resultado Final:</td>
        <td class='etiqueta'><font id="pPub_resultadoFinal"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Pub_resultadoFinal")%>','Pub_resultadoFinal')"><%=RsP.Fields("Pub_resultadoFinal")%></a></font></td>
      </tr>
     
    </table>
    
    <% 
				
				SQ0 = "exec dbo.pa_convocatoria_cronograma_listar '"&Id_ConvocatoriaCargo&"' "
				  
				Set RS0	= Server.CreateObject("ADODB.Recordset") 	
				RS0.cursorlocation=3
				RS0.Open SQ0, MiCone, 3,3
				
				If Not RS0.BOF And Not RS0.EOF Then   %>
                
            <table class="tabla2"  border="1" cellpadding="2" cellspacing="2" id= bordercolor="#DAE8F3"  align="center" width="70%">
                	<tr>
                    	<td colspan="6" class="etiqueta2" bgcolor="#84C1FF" style="text-align:center"><STRONG>CRONOGRAMA</STRONG>
                        </td>
                 	</tr>
              <tr bgcolor="#DAE8F3">
                    	<td class="etiqueta2" style="text-align:center"> PROCESO </td>
                        <td class="etiqueta2" style="text-align:center"> DETALLE </td>
                        <td class="etiqueta2" style="text-align:center"> FECHA INICIO</td>
                        <td class="etiqueta2" style="text-align:center"> FECHA FIN </td>
                        <td class="etiqueta2" style="text-align:center"> NOTA </td>
                        <td class="etiqueta2" style="text-align:center"> EDITAR</td>
                    
              </tr>
                  <%  Do While Not RS0.EOF	 %>
                    
                	<tr>
                    	<td class="etiqueta2"><%generaProceso(RS0.Fields("PROCESO_ID")) %>
                        </td>
                    	<td class="etiqueta2">
                        <font id="pDESCRIPCION<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>"><a href="javascript:mod_presCron('<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>','<%=RS0.Fields("descripcion")%>','DESCRIPCION')"><%=RS0.Fields("descripcion")%></a></font>
                      </td>
                        <td class="etiqueta2">
						<font id="pfecha_inicio<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>"><a href="javascript:mod_presCron('<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>','<%=RS0.Fields("fec_ini")%>','fecha_inicio')"><% if RS0.Fields("fec_ini")="01/01/1900" then 
									response.Write(" - ")
								else
									response.Write(RS0.Fields("fec_ini"))
								end if
						%></a></font>
                        </td>
                        <td class="etiqueta2">
						<font id="pfecha_fin<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>"><a href="javascript:mod_presCron('<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>','<%=RS0.Fields("fec_fin")%>','fecha_fin')"><% if RS0.Fields("fec_fin")="01/01/1900" then 
									response.Write(" - ")
								else
									response.Write(RS0.Fields("fec_fin"))
								end if
						%></a></font>
                        </td>
                        <td class="etiqueta2">
						<font id="pnota<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>"><a href="javascript:mod_presCron('<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>','<%=RS0.Fields("nota")%>','nota')"><% if RS0.Fields("nota")="" or isnull(RS0.Fields("nota")) then 
									response.Write(" - ")
								else
									response.Write(RS0.Fields("nota"))
								end if
						%></a></font>
                        </td>
                        <td class="etiqueta2">
						<%if RS0.Fields("estado")=1 then%>
        <img src="images/eliminar.png" title="Deshabilitar proceso de cronograma" style="CURSOR:HAND"  onclick="actualizarCronograma('<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>','2')" ></img>
        				<%else%>
        <img src="images/ok.gif" title="Habilitar proceso de cronograma" style="CURSOR:HAND"  onclick="actualizarCronograma('<%=RS0.Fields("ID_CRONOGRAMA_CONV")%>', '1')" ></img>
        				<%end if%>
                      </td>
                    </tr>
                    
                  <%  RS0.MoveNext
					  Loop	
					  RS0.close
					  set RS0=nothing
				  
				  %> 
                  
              <tr id="tr_p_20">
      <td class="etiqueta" id="td20"><% generaProcesoN(11) %></td>
      <td class="etiqueta"><textarea name="txtDetalleProc" style="width:250; height:40" class="e_input" id="txtDetalleProc"></textarea></td>
      <td class="etiqueta">
      	<input type='text' class='e_input' id='txtIniProc' name='txtIniProc' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
		</td>
      <td class="etiqueta">
      	<input type='text' class='e_input' id='txtFinProc' name='txtFinProc' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas()">
      </td>
      <td class="etiqueta"><textarea name="txtNota" style="width:250; height:40" class="e_input" id="txtNota"></textarea></td>
      <td class="etiqueta" id="td_bot20">
      	<img src="images/ok.gif" title="Habilitar proceso de cronograma" style="CURSOR:HAND"  onclick="guardarCronograma('<%=Id_ConvocatoriaCargo%>')" ></img>
      </td>
    </tr> 
                    
            </table>
                
                <% ELSE %>
                
                
                <table class="tabla2"  border="1" cellpadding="2" cellspacing="2" id= bordercolor="#DAE8F3"  align="center" width="70%">
                	<tr>
                    	<td colspan="6" class="etiqueta2" bgcolor="#84C1FF" style="text-align:center"><STRONG>CRONOGRAMA</STRONG>
                        </td>
                 	</tr>
                  <tr bgcolor="#DAE8F3">
                    	<td class="etiqueta2" style="text-align:center"> PROCESO </td>
                        <td class="etiqueta2" style="text-align:center"> DETALLE </td>
                        <td class="etiqueta2" style="text-align:center"> FECHA INICIO</td>
                        <td class="etiqueta2" style="text-align:center"> FECHA FIN </td>
                         <td class="etiqueta2" style="text-align:center"> NOTA </td>
                        <td class="etiqueta2" style="text-align:center"> EDITAR</td>
                    
                  </tr>
                  <tr id="tr_p_20">
      <td class="etiqueta" id="td20"><% generaProcesoN(11) %></td>
      <td class="etiqueta"><textarea name="txtDetalleProc" style="width:250; height:40" class="e_input" id="txtDetalleProc"></textarea></td>
      <td class="etiqueta">
      	<input type='text' class='e_input' id='txtIniProc' name='txtIniProc' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
		</td>
      <td class="etiqueta">
      	<input type='text' class='e_input' id='txtFinProc' name='txtFinProc' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas()">
      </td>
      <td class="etiqueta"><textarea name="txtNota" style="width:250; height:40" class="e_input" id="txtNota"></textarea></td>
      <td class="etiqueta" id="td_bot20">
      	<img src="images/ok.gif" title="Habilitar proceso de cronograma" style="CURSOR:HAND"  onclick="guardarCronograma('<%=Id_ConvocatoriaCargo%>')" ></img>
      </td>
    </tr> 
                    
                </table>
                
                
                
				<% end if %>
                
 <p class="etiqueta2"><strong></strong><strong>Modalidad de Contrato y Remuneraci&oacute;n:</strong></p>
			<ol class="etiqueta2">
			<font id="pmodalidad"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("modalidad")%>','modalidad')"><%=RsP.Fields("modalidad")%></a></font>
		    </ol>
		    <%if isnull(RsP.Fields("bonificacion")) or RsP.Fields("bonificacion")="" then 
			response.write("")
			else%> 
			<p class="etiqueta2"><strong>Bonificaci&oacute;n</strong></p>
			<ol class="etiqueta2">
			<font id="pbonificacion"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("bonificacion")%>','bonificacion')"><%=RsP.Fields("bonificacion")%></a></font>
			</ol>
			<%end if%>
			<p class="etiqueta2"><strong>Vigencia del Contrato:</strong></p>
			<ol class="etiqueta2">
			<font class="etiqueta" id="pvigencia"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("vigencia")%>','vigencia')"><%=RsP.Fields("vigencia")%></a></font>
			</ol>

		</div>
        
     </div>
     <br>
     <div>
     <table class="tabla2"  border="1" cellpadding="2" cellspacing="2" id= bordercolor="#DAE8F3"  align="center" width="70%" >
     	<tr>
     		<td colspan="4" align="center" bgcolor="#84C1FF"><strong class="etiqueta2">DATOS DE LA FICHA</strong>
     		</td>
         </tr>
         
         <tr>
         	<td bgcolor="#DAE8F3"><span class="etiqueta2"><strong>EXPERIENCIA 1</strong></span><br>
            </td>
            <td colspan="3">
            <font id="pExperiencia_1">
            	<a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Experiencia_1")%>','Experiencia_1')">
					<% if RsP.Fields("Experiencia_1")="" then 
                            response.Write(" - ")
                      else
                            response.Write(RsP.Fields("Experiencia_1"))
                      end if %>
                </a></font>
            </td>
            </tr>
            <tr>
         	<td bgcolor="#DAE8F3"><span class="etiqueta2"><strong>EXPERIENCIA 2</strong></span><br>
            </td>
            <td colspan="3">
            <font id="pExperiencia_2">
            	<a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Experiencia_2")%>','Experiencia_2')">
					<% if RsP.Fields("Experiencia_2")="" then 
                            response.Write(" - ")
                      else
                            response.Write(RsP.Fields("Experiencia_2"))
                      end if %>
                </a></font>
            </td>
            </tr>
            <tr>
         	<td bgcolor="#DAE8F3"><span class="etiqueta2"><strong>EXPERIENCIA 3</strong></span><br>
            </td>
            <td colspan="3">
            <font id="pExperiencia_3">
            	<a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Experiencia_3")%>','Experiencia_3')">
					<% if RsP.Fields("Experiencia_3")="" then 
                            response.Write(" - ")
                      else
                            response.Write(RsP.Fields("Experiencia_3"))
                      end if %>
                </a></font>
            </td>
            </tr>
            <tr>
         	<td bgcolor="#DAE8F3"><span class="etiqueta2"><strong>EXPERIENCIA 4</strong></span><br>
            </td>
            <td colspan="3">
            <font id="pExperiencia_4">
            	<a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Experiencia_4")%>','Experiencia_4')">
					<% if RsP.Fields("Experiencia_4")="" then 
                            response.Write(" - ")
                      else
                            response.Write(RsP.Fields("Experiencia_4"))
                      end if %>
                </a></font>
            </td>
            </tr>
            <tr>
         	<td bgcolor="#DAE8F3"><span class="etiqueta2"><strong>EXPERIENCIA 5</strong></span><br>
            </td>
            <td colspan="3">
            <font id="pExperiencia_5">
            	<a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Experiencia_5")%>','Experiencia_5')">
					<% if RsP.Fields("Experiencia_5")="" then 
                            response.Write(" - ")
                      else
                            response.Write(RsP.Fields("Experiencia_5"))
                      end if %>
                </a></font>
            </td>
            </tr>
         
         <tr bgcolor="#DAE8F3">
         	<td><span class="etiqueta2"><strong>TEST PSICOL&Oacute;GICO</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>TEST CONOCIMIENTOS</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>NIVEL</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>GRADO</strong></span><br>
            </td>
         </tr>
         <%  text=""
		 if RsP.Fields("estado_c")<>"0" then 
		 		text="disabled"
			end if
		 %>
         <tr>
         	<td valign="top">
            <span class="etiqueta">Test &nbsp;&nbsp;&nbsp;:
            	<select <%=text%> id="cmbCompetencias" name="cmbCompetencias" class='e_combo' style="width:100px">
                    <option <% if RsP.Fields("test_psicologico")="0" then
							   	response.Write("selected")
							   end if%> value="0">Sin test</option>
                    <option <% if RsP.Fields("test_psicologico")="1" then
							   	response.Write("selected")
							   end if%> value="1">De 185 preguntas</option>
                    <option <% if RsP.Fields("test_psicologico")="2" then
							   	response.Write("selected")
							   end if%> value="2">De 24 preguntas</option>
      			</select></span><br>
            <span class="etiqueta">Momento:
            	<select <%=text%> id="cmbMomentoComp" name="cmbMomentoComp" class='e_combo' style="width:100px">
                    <option <% if RsP.Fields("momento_psico")="0" then
							   	response.Write("selected")
							   end if%> value="0">Seleccione...</option>
                    <option <% if RsP.Fields("momento_psico")="1" then
							   	response.Write("selected")
							   end if%> value="1">En Inscripci&oacute;n</option>
                    <option <% if RsP.Fields("momento_psico")="2" then
							   	response.Write("selected")
							   end if%> value="2">En fecha Establecida</option>
                  </select></span>
            </td>
            <td valign="top">
            <span class="etiqueta">Test &nbsp;&nbsp;&nbsp;:
            <select <%=text%> id="cmbConocimientos" name="cmbConocimientos" class='e_combo' style="width:100px">
                    <option <% if rtrim(ltrim(RsP.Fields("test_conocimientos")))="0" then
							   	response.Write("selected")
							   end if%> value="0">Sin test</option>
                    <option <% if RsP.Fields("test_conocimientos")="1" then
							   	response.Write("selected")
							   end if%> value="1" >Ofim&aacute;tica</option>
              </select>
            <%generaNivel()%>
            </span><br>
            <span class="etiqueta">Momento:
            <select <%=text%> id="cmbMomentoCono" name="cmbMomentoCono" class='e_combo' style="width:100px">
                    <option <% if RsP.Fields("momento_cono")="0" then
							   	response.Write("selected")
							   end if%> value="0">Seleccione...</option>
                    <option <% if RsP.Fields("momento_cono")="1" then
							   	response.Write("selected")
							   end if%> value="1">En Inscripci&oacute;n</option>
                    <option <% if RsP.Fields("momento_cono")="2" then
							   	response.Write("selected")
							   end if%> value="2">En fecha Establecida</option>
                  </select></span>
            </td>
            <td valign="top"><br>
            </td>
            <td><span class="etiqueta"><%generaGrado()%></span>
            </td>
         </tr>
         
         <!------------NUEVSA COLUMNAS------------------------>
         
         
         <tr bgcolor="#DAE8F3">
	    	<td><span class="etiqueta2"><strong>DATOS ADICIONALES</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>ADJUNTAR CV</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>TAMBO</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>DPTO NAC</strong></span><br>
			</tr>


			<tr>
         	<td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="Datos_adicionales" name="Datos_adicionales" placeholder="I"
			<% if RsP.Fields("Datos_adicionales")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="Adjuntar_cv" name="Adjuntar_cv" placeholder="I"
			<% if RsP.Fields("Adjuntar_cv")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="ver_tambo" name="ver_tambo" placeholder="I"
			<% if RsP.Fields("ver_tambo")=1 then
			response.Write("checked")
			end if%>
			>
			
            </td>
            <td><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valDptoNac" name="valDptoNac" placeholder="I"
			<% if RsP.Fields("valDptoNac")=1 then
			response.Write("checked")
			end if%>
			>
			
			</span>
            </td>
         </tr>


			<tr bgcolor="#DAE8F3">
			<td><span class="etiqueta2"><strong>PROV NAC</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>DIST NAC</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong></strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong></strong></span><br>
			</td>
			</tr>


			<tr>
         	<td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valProvNac" name="valProvNac" placeholder="I"
			<% if RsP.Fields("valProvNac")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valDistNac" name="valDistNac" placeholder="I"
			<% if RsP.Fields("valDistNac")=1 then
			response.Write("checked")
			end if%>>
            </td>
            <td valign="top"><span class="etiqueta">
			
            </td>
            <td><span class="etiqueta">
			
			</span>
            </td>
         </tr>




			<tr bgcolor="#DAE8F3">
			<td><span class="etiqueta2"><strong>HIJO UNICO</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>JEFE HOGAR</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>LENG MAT</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>LENG</strong></span><br>
			</td>
			</tr>

  <tr>
         	<td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valHijoUnico" name="valHijoUnico" placeholder="I"
			<% if RsP.Fields("valHijoUnico")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valJefeHogar" name="valJefeHogar" placeholder="I"
			<% if RsP.Fields("valJefeHogar")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valLengMat" name="valLengMat" placeholder="I"
			<% if RsP.Fields("valLengMat")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valLeng" name="valLeng" placeholder="I"
			<% if RsP.Fields("valLeng")=1 then
			response.Write("checked")
			end if%>
			>
			</span>
            </td>
         </tr>



			<tr bgcolor="#DAE8F3">
			<td><span class="etiqueta2"><strong>IDIOMA</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>NIVEL IDIOMA</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>DOM IDIOMA</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>OPER. CEL</strong></span><br>
			</td>
			</tr>
			
  <tr>
         	<td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valIdiomaC" name="valIdiomaC" placeholder="I"
			<% if RsP.Fields("valIdiomaC")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valNivelIdioma" name="valNivelIdioma" placeholder="I"
			<% if RsP.Fields("valNivelIdioma")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valDomIdioma" name="valDomIdioma" placeholder="I"
			<% if RsP.Fields("valDomIdioma")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valOperTel" name="valOperTel" placeholder="I"
			<% if RsP.Fields("valOperTel")=1 then
			response.Write("checked")
			end if%>
			>
			</span>
            </td>
            
            <!--------NUEVAS COLUMNAS---------------->
         </tr>


			<tr bgcolor="#DAE8F3">
			<td><span class="etiqueta2"><strong>FEC. EXP GRADO</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>REG. GRADO</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>PER. ALC</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>TIPO PER</strong></span><br>
			</td>
			</tr>



						
  <tr>
         	<td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valFecExpGrado" name="valFecExpGrado" placeholder="I"
			<% if RsP.Fields("valFecExpGrado")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valRegGrado" name="valRegGrado" placeholder="I"
			<% if RsP.Fields("valRegGrado")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valperioalc" name="valperioalc" placeholder="I"
			<% if RsP.Fields("valperioalc")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valPeriodo" name="valPeriodo" placeholder="I"
			<% if RsP.Fields("valPeriodo")=1 then
			response.Write("checked")
			end if%>
			>
			</span>
            </td>
         </tr>



			<tr bgcolor="#DAE8F3">
			<td><span class="etiqueta2"><strong>UNIVERSIDAD</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>CENTRO EST</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>TIP. ZONA</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>NOM. ZONA</strong></span><br>
			</td>
			</tr>

			
						
  <tr>
         	<td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valUniversidad" name="valUniversidad" placeholder="I"
			<% if RsP.Fields("valUniversidad")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valCentro" name="valCentro" placeholder="I"
			<% if RsP.Fields("valCentro")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valTipZona" name="valTipZona" placeholder="I"
			<% if RsP.Fields("valTipZona")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valNomZona" name="valNomZona" placeholder="I"
			<% if RsP.Fields("valNomZona")=1 then
			response.Write("checked")
			end if%>
			>
			</span>
            </td>
         </tr>




			<tr bgcolor="#DAE8F3">
			<td><span class="etiqueta2"><strong>EXP. NOM. INST</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>EXP. AÑOS</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>EXP. MESES</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>PROYECTOS INEI</strong></span><br>
			</td>
			</tr>
				
						
  <tr>
         	<td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valExpNomInst" name="valExpNomInst" placeholder="I"
			<% if RsP.Fields("valExpNomInst")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valExpTiempoAnio" name="valExpTiempoAnio" placeholder="I"
			<% if RsP.Fields("valExpTiempoAnio")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valExpTiempoMeses" name="valExpTiempoMeses" placeholder="I"
			<% if RsP.Fields("valExpTiempoMeses")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valProyectosInei" name="valProyectosInei" placeholder="I"
			<% if RsP.Fields("valProyectosInei")=1 then
			response.Write("checked")
			end if%>
			>
			</span>
            </td>
         </tr>
			
			<tr bgcolor="#DAE8F3">
			<td><span class="etiqueta2"><strong>INSTITUCION</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>FEC. NAC</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong>EDAD</strong></span><br>
            </td>
            <td><span class="etiqueta2"><strong></strong></span><br>
			</td>
			</tr>


									
  <tr>
         	<td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valInstitucion" name="valInstitucion" placeholder="I"
			<% if RsP.Fields("valInstitucion")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
            <input style="width:20px; height:20px" type="checkbox" id="valFechaNac" name="valFechaNac" placeholder="I"
			<% if RsP.Fields("valFechaNac")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td valign="top"><span class="etiqueta">
			<input style="width:20px; height:20px" type="checkbox" id="valEdad" name="valEdad" placeholder="I"
			<% if RsP.Fields("valEdad")=1 then
			response.Write("checked")
			end if%>
			>
            </td>
            <td><span class="etiqueta">
			
			</span>
            </td>
         </tr>
  
         
         
         <!-----  NUEVAS COLUMNAS------------------->
         
         
         
         
         
         
         
         
         <tr>
     		<td colspan="4" align="center"> <input name="button" type="button" class="boton" id="button" value="Grabar" onClick="grabarNG('<%=Id_ConvocatoriaCargo%>')">
     		</td>
         </tr>
     </table>
     </div>
     <BR>
     <div>
     <table class="tabla2"  border="1" cellpadding="2" cellspacing="2" id= bordercolor="#DAE8F3"  align="center" >
     	<tr>
     		<td align="center" bgcolor="#84C1FF"><strong class="etiqueta2">DATOS DE P&Aacute;GINA DE CONFIRMACI&Oacute;N</strong>
     		</td>
         </tr>
         <tr bgcolor="#DAE8F3">
         	<td style="text-align:center"><span class="etiqueta2"><strong>Mensaje de confirmaci&oacute;n de Aptos</strong></span></td>

         </tr>
         <%  text=""
		 if RsP.Fields("estado_c")<>"0" then 
		 		text="disabled"
			end if
		 %>
         <tr>
         	<td valign="top"><font id="pmensaje_confirmacion">
            	<a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("mensaje_confirmacion")%>','mensaje_confirmacion')">
					<% if RsP.Fields("mensaje_confirmacion")="" then 
                            response.Write(" - ")
                      else
                            response.Write(RsP.Fields("mensaje_confirmacion"))
                      end if %>
                </a></font></td>
         </tr>
         <tr bgcolor="#DAE8F3">
         	<td style="text-align:center"><span class="etiqueta2"><strong>Mensaje de confirmaci&oacute;n de No Aptos</strong></span></td>

         </tr>
         <%  text=""
		 if RsP.Fields("estado_c")<>"0" then 
		 		text="disabled"
			end if
		 %>
         <tr>
         	<td valign="top"><font id="pmensaje_confirmacion_des">
            	<a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("mensaje_confirmacion_des")%>','mensaje_confirmacion_des')">
					<% if RsP.Fields("mensaje_confirmacion_des")="" then 
                            response.Write(" - ")
                      else
                            response.Write(RsP.Fields("mensaje_confirmacion_des"))
                      end if %>
                </a></font></td>
         </tr>
     </table>
     </div>
     
<div id="carga"> </div>

</td>
 </tr>
</table>
	   
<% else %>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles</td>
                  </tr>
</table>
</form>
<% end If %>



</body>
</html>