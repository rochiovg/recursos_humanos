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
id_presupuestodet=Request("id_presupuestodet")

 id_rolUsuario=Session("txtTipoUsuarioValido")
 



set wRsDptoapli1 = Micone.execute(" exec pa_proceso_tdr_listar '"& Id_ConvocatoriaCargo &"',"&id_presupuestodet&" ")




	While not wRsDptoapli1.EOF

		Id_ConvocatoriaCargo = wRsDptoapli1(0)
		
		wRsDptoapli1.MoveNext
	Wend
	

	wRsDptoapli1.Close
	Set wRsDptoapli1 = Nothing
	
	
	
	



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
	valores= "lsid_cc=" + escape(id_cc)+"&lsvalor="+escape(valor)+"&lsCampo="+campo+"&lsTipo=168";  // parametros a enviar al servidor	
	
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




function mod_pres_armada(id_armada, id_cc,valor,campo)
{
	
	//valor=valor.replace(/<li\s*\/*><br><li>/g,"\n");
	valor=valor.replace(/<br>/g,"\n");
	ajax=http_request();
	var valores;	
	valores= "id_armada="+escape(id_armada)+"&lsid_cc=" + escape(id_cc)+"&lsvalor="+escape(valor)+"&lsCampo="+campo+"&lsTipo=170";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("p"+campo+id_armada).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
				document.getElementById("p"+campo+id_armada).innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                document.getElementById("p"+campo+id_armada).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("p"+campo+id_armada).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}



function mod_presCron(id_armada, id_cron,valor,campo)
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

	
	valores= "lsId_cc=" + escape(lsid)+"&lsvalor="+escape(valor_nuevo)+"&lsCampo="+escape(campo)+"&lsTipo=169";  // parametros a enviar al servidor	
	
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




function grabar_ModPres_armada(id_armada,lsid, valor_nuevo,campo)
{
	ajax=http_request();
	
	valor_nuevo=valor_nuevo.replace(new RegExp("\\n","g"),'<br>');	
	var valores;	

	
	valores= "id_armada="+escape(id_armada)+"&lsId_cc=" + escape(lsid)+"&lsvalor="+escape(valor_nuevo)+"&lsCampo="+escape(campo)+"&lsTipo=171";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("p"+campo+id_armada).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            						
					objetivo=ajax.responseText.replace(new RegExp("---","g"),'<br>');								
					document.getElementById("p"+campo+id_armada).innerHTML =objetivo;
					
            }
            else if(ajax.status==404){
                     document.getElementById("p"+campo+id_armada).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
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


consulta1 = "EXEC dbo.get_presupuestocargo '"& Id_ConvocatoriaCargo & "'" 
  	

	Set RsP	= Server.CreateObject("ADODB.Recordset") 
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3

	     
	If  Not RsP.BOF And Not RsP.EOF Then  %>
	
    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
                <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3">
                  <tr>
                    <td  align="center" bgcolor="#DAE8F3" class="subtitulo"> Visualizar TDR</td>
                  </tr>
                  <tr>
<td>
		<div align="left" style="font:Arial, Helvetica, sans-serif; font-size:14px; color: #06C; ">
		</div>
		<div id="CollapsiblePanel1" >
		     <div  tabindex="0">
				<div align="left" style="font:Arial, Helvetica, sans-serif; font-size:14px; color: #06C; "> 
						


					
						 
						 
					
			   </div>    

		    </div> 

		<div >
        
       
        
           
            <p class="etiqueta2"><strong>Perfil Servicio:</strong></p>
			<ol class="etiqueta2">
            
            
		    <font id="pperfil">
            <%IF id_rolUsuario=1 or id_rolUsuario=7 THEN%>
            <a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("perfil")%>','perfil')"><%=RsP.Fields("perfil")%></a>
            <%ELSE%>
            <%=RsP.Fields("perfil")%>
            <%END IF%>
            </font>
			</ol>
            
       
            
            
            
            <p class="etiqueta2"><strong>Caracteristicas del Servicio:</strong></p>
			<ol class="etiqueta2">
		    <font id="pcaracteristicas_contrato">
            
                <%IF id_rolUsuario=1 or id_rolUsuario=7 THEN%>
            <a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("Caracteristicas_contrato")%>','caracteristicas_contrato')"><%=RsP.Fields("Caracteristicas_contrato")%></a>
            <%ELSE%>
            <%=RsP.Fields("Caracteristicas_contrato")%>
            
            <%END IF%>
            
            </font>
			</ol>
            

                
 <p class="etiqueta2"><strong></strong><strong>Modalidad de Contrato y Remuneraci&oacute;n:</strong></p>
			<ol class="etiqueta2">
			<font id="pmodalidad">
            
              <%IF id_rolUsuario=1 or id_rolUsuario=7 THEN%>
              
              
            <a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("modalidad")%>','modalidad')"><%=RsP.Fields("modalidad")%></a></font>
		    </ol>
		    <%if isnull(RsP.Fields("bonificacion")) or RsP.Fields("bonificacion")="" then 
			response.write("")
			else%> 
			<p class="etiqueta2"><strong>Bonificaci&oacute;n</strong></p>
			<ol class="etiqueta2">
			<font id="pbonificacion"><a href="javascript:mod_pres('<%=Id_ConvocatoriaCargo%>','<%=RsP.Fields("bonificacion")%>','bonificacion')"><%=RsP.Fields("bonificacion")%></a></font>
			</ol>
			<%end if%>
            
            
            <%ELSE%>
            
                <%=RsP.Fields("modalidad")%></font>
		    </ol>
		    <%if isnull(RsP.Fields("bonificacion")) or RsP.Fields("bonificacion")="" then 
			response.write("")
			else%> 
			<p class="etiqueta2"><strong>Bonificaci&oacute;n</strong></p>
			<ol class="etiqueta2">
			<font id="pbonificacion"><%=RsP.Fields("bonificacion")%></font>
			</ol>
			<%end if%>
            
            <%END IF%>
            
            
            
			
            
            <% SQL5 = "exec dbo.pa_presupuestocargoprod_editar '"&Id_ConvocatoriaCargo&"' "	
		

		Set RSCuad5	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad5.cursorlocation=3
		RSCuad5.Open SQL5, MiCone, 3,3
		
If Not RSCuad5.BOF And Not RSCuad5.EOF Then %>
        <table width="706" height="83"  border="1"  align="center" cellpadding="2" cellspacing="2" class="tabla2" id= bordercolor="#DAE8F3" >
          <tr><th colspan="5" class="etiqueta2"><div align="center"><strong>Productos</strong></div></th></tr>
<tr>
        <th width="61"  bordercolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>Armada</strong></div></th>
        <th width="527"  bordercolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>Producto</strong></div></th>
        <th width="90"  bordercolor="#DAE8F3" class="etiqueta2" ><div align="center"><strong>Monto Armada</strong></div></th>
      </tr>
      
       <%  		
							
			Do While Not RSCuad5.EOF %>
      <tr class='<%=clase%>'>
        <td class='etiqueta'><%=RSCuad5.Fields("nArmadas")%></td>
        <td class='etiqueta'><font id="pDesProducto<%=RSCuad5.Fields("nArmadas")%>">
        
        <%IF id_rolUsuario=1 or id_rolUsuario=7 THEN%>
        <a href="javascript:mod_pres_armada(<%=RSCuad5.Fields("nArmadas")%>,'<%=Id_ConvocatoriaCargo%>','<%=RSCuad5.Fields("DesProducto")%>','DesProducto')"><%=RSCuad5.Fields("DesProducto")%></a>
        <%ELSE%>
        <%=RSCuad5.Fields("DesProducto")%>
        <%END IF%>
        
        </font></td>
        <td class='etiqueta'><font id="pmontoArmada<%=RSCuad5.Fields("nArmadas")%>">
          <%IF id_rolUsuario=1 or id_rolUsuario=7 THEN%>
        <a href="javascript:mod_pres_armada(<%=RSCuad5.Fields("nArmadas")%>,'<%=Id_ConvocatoriaCargo%>','<%=RSCuad5.Fields("montoArmada")%>','montoArmada')"><%=RSCuad5.Fields("montoArmada")%></a>
        <%ELSE%>
        <%=RSCuad5.Fields("montoArmada")%>
        <%END IF%>        
        
        </font></td>

       
      </tr>
                 <%
			RSCuad5.MoveNext
			Loop	
			RSCuad5.close
			set RSCuad5=nothing 
 %>
   
  </table>
    
    <%end if %>
            

		</div>
        
     </div>
     <br>
     <div></div>
     <BR>
     <div>
     
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