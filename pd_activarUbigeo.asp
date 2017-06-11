<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 
<%

lsUsuario =  Session("id_usuario")


sub generaDpto()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCCDD2 ")

	Response.Write "<select class=""e_combo"" style=""width:170px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov2();"" >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione... </option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub




%>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>..:: Conseccuci&oacute;n de Recursos Humanos ::.. </title>

<script type="text/javascript" src="js/jquery.js"></script> 
<script type="text/javascript" src="js/jquery.min.js"></script>

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


function mostrarCombos(valor){
	
	if (valor==2){
		document.getElementById("rowDepartamento").style.display="block";
		document.getElementById("rowProvincia").style.display="none";
		document.getElementById("divDpto").style.display="none";
		document.getElementById("divProv").style.display="block";
		document.getElementById("divDist").style.display="none";
		document.getElementById('cmbProvincia').value='0';
		document.getElementById('txtDpto1').value='0';
		
	} else if (valor==3){
		document.getElementById("rowDepartamento").style.display="block";
		document.getElementById("rowProvincia").style.display="block";
		document.getElementById("divDpto").style.display="none";
		document.getElementById("divProv").style.display="none";
		document.getElementById("divDist").style.display="block";
		document.getElementById('cmbProvincia').value='0';
		document.getElementById('txtDpto1').value='0';
			} else if (valor==1){
				document.getElementById("rowDepartamento").style.display="none";
				document.getElementById("rowProvincia").style.display="none";
				document.getElementById("divDpto").style.display="block";
				document.getElementById("divProv").style.display="none";
				document.getElementById("divDist").style.display="none";
				generaDepartamento2();
				}
}



function guardarDep(valor, Dep, indicador){
	

	var valores="Dep="+escape(Dep)+"&valor="+escape(valor)+"&indicador="+escape(indicador)+"&lsTipo=74";

	var peticion=$.ajax(
		{
	     url:'m_ingreso.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
		 success:function (respuesta) {	 generaDepartamento2();} ,
         error:function (){  alert('Se a producido un Error'); }
  		} );		
}


function guardarProv(valor, prov, indicador){
	
	if (indicador==0)
		prov=document.getElementById('txtDpto1').value;
				
	var valores="prov="+escape(prov)+"&valor="+escape(valor)+"&indicador="+escape(indicador)+"&lsTipo=73";

	var peticion=$.ajax(
		{
	     url:'m_ingreso.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
		success:function (respuesta) {	generaprov2() } ,
      error:function (){  alert('Se a producido un Error'); }
  }
  );			
}



function guardarDist(valor, Dist,indicador){
	
	if (indicador==0)
	Dist=document.getElementById('cmbProvincia').value;
	
	var valores="Dist="+escape(Dist)+"&valor="+escape(valor)+"&indicador="+escape(indicador)+"&lsTipo=75";
	

	var peticion=$.ajax(
		{
	     url:'m_ingreso.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
		 success:function (respuesta) {	 verdis2();} ,
         error:function (){  alert('Se a producido un Error'); }
  		} );		
}


function generaDepartamento2(){
    
	var datos='99';
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(datos);  // parametros a enviar al servidor	
	
	url="m_Departamento.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDpto").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divDpto").innerHTML =ajax.responseText;
					generaprov2()
            }
            else if(ajax.status==404){
                     document.getElementById("divDpto").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divDpto").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function generaprov2(){
     
    var nivel= document.getElementById("cmbNivelUbigeo").value;
	var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
    
	ajax=http_request();
	var valores;	
	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	

	if (nivel==3) {
	url="m6_Provincia31.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov").innerHTML =ajax.responseText;
					verdis2();
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
	
	if (nivel==2) {
	url="m6_Provincia311.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divProv").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divProv").innerHTML =ajax.responseText;
					
					
            }
            else if(ajax.status==404){
                     document.getElementById("divProv").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divProv").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	}
	
  }

function verdis2(){
    
    var varProv =document.getElementById("cmbProvincia").options[document.getElementById("cmbProvincia").selectedIndex].value;
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m6_Distrito22.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDist").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divDist").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divDist").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divDist").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function verUbigeos(){

	var Dep=99
	var Prov=99
	var Dist=99
	document.getElementById("txtUbigeos").value='1';
	ajax=http_request();
	var valores;	
	valores= "Dep="+escape(Dep)+ "&Prov=" + escape(Prov)+ "&Dist=" + escape(Dist);	
	url="pd_VerUbigeosConvocatoria.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divVistaUbigeos").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divVistaUbigeos").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divVistaUbigeos").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divVistaUbigeos").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
		
	}


function Grabar(){

	
	if (document.getElementById("txtUbigeos").value=''){
		alert("Agregue Ubigeos");
		return false;	
	} else{
	opener.document.getElementById("txtUbigeosTot").value='1';
	window.close() 
	}
}

function limpiar(){
	
	$('input[class=checkDep]').attr('checked', false);
	$('input[class=checkProv]').attr('checked', false);
    $('input[class=checkDist]').attr('checked', false);
	
	$('input[name=todosD]').attr('checked', false);
	$('input[name=todosP]').attr('checked', false);
	$('input[name=todosDi]').attr('checked', false);
	
	document.getElementById("txtUbiDep").value='';
	document.getElementById("txtUbiProv").value='';
	document.getElementById("txtUbiDist").value='';
	document.getElementById("txtUbigeos").value='';
	
	var valores="lsTipo=76";

	var peticion=$.ajax(
		{
	     url:'m_ingreso.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#divCriterio").html("Cargando...");
								
							  },
		success:function (respuesta) {
			
	          		 verUbigeos();
                    document.frmMiForm.reset();
	          
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#divCriterio").html("");
			 
      }
  }
  );
	

}



</script>
	
</head>
<body>
<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_ConvocatoriaCargo.asp">
<div id="divNavegacion" align="center"><span class="subtitulo">Registro: Convocatoria por Cargo </span></div>
<table width="648" border="0" align="center" cellpadding="2" bordercolor="#DAE8F3" cellspacing="2" >
 	            <tr>
 								<th colspan="2"  align="center"><table cellpadding="2" cellspacing="2" border="1" bordercolor="#DAE8F3">
 								  <tr>
 								    <th colspan="3" class="aplicacion" bgcolor="#DAE8F3">SELECCI&Oacute;N DE UBIGEO
							          <input type="hidden" id="txtUbiDep" name="txtUbiDep" value="" />
							        <input type="hidden" id="txtUbiProv" name="txtUbiProv" value="" />
							        <input type="hidden" id="txtUbiDist" name="txtUbiDist" value="" />
                                    <input type="hidden" id="txtUbigeos" name="txtUbigeos" value="" /></th>
							      </tr>
 								  <tr>
 								    <td class="etiqueta">Tipo de Acceso</td>
 								    <td class="etiqueta" align="center"><font class="alerta5">
							        (*)</font></td>
 								    <td><span class="etiqueta"><font class="alerta5">
 								      <select id="cmbNivelUbigeo" name="cmbNivelUbigeo" class='e_combo' style="width:170px" onchange="mostrarCombos(this.value)">
 								        <option selected="selected" value="0">Seleccione...</option>
 								        <option value="1">DEPARTAMENTAL</option>
 								        <option value="2">PROVINCIAL</option>
 								        <option value="3">DISTRITAL</option>
							        </select>
 								    </font></span></td>
							      </tr>
 								  <tr id="rowDepartamento" style="display:none;">
 								    <td class="etiqueta">Departamento</td>
 								    <td class="etiqueta" align="center"><font class="alerta5">(*)</font></td>
 								    <td id="dpto"><span class="etiqueta"><font class="alerta5"><font class="alerta5">
 								      <%generaDpto%>
 								    </font></font></span></td>
							      </tr>
 								  <tr id="rowProvincia" style="display:none;">
 								    <td class="etiqueta">Provincia</td>
 								    <td class="etiqueta" align="center"><font class="alerta5">
							        (*)</font></td>
 								    <td id="prov"><span class="etiqueta"><font class="alerta5">
 								      <select id="cmbProvincia" name="cmbProvincia" class='e_combo' style="width:170px" onchange="valida_nivel3(this.value)">
 								        <option selected="selected" value="0">Seleccione...</option>
							        </select>
 								    </font></span></td>
							      </tr>
							    </table></th>
					  </tr>
 							<tr>
 							  <td height="24" colspan="2" align="center" class='etiqueta'>&nbsp;</td>
					  </tr>
 							<tr bgcolor="#DAE8F3"  >
 							  <td align="center" class="aplicacion" >Ubigeos a Seleccionar</td>
 							  <td align="center" class="aplicacion" >Ubigeos Seleccionados</td>
  </tr>
 							<tr>
 							  <td border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" width="317" class='etiqueta'><table width="311" height="88" border="0" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
 							    <tr>
 							      <td width="303" height="23"><div id="divDpto" style="height: 200px; overflow:auto; display:none; font-size:12px; font-family:Verdana, Geneva, sans-serif; ">
 							    	</div>
                                    <div id="divProv" style="height: 200px; overflow:auto; display:none; font-size:12px; font-family:Verdana, Geneva, sans-serif;"> </div>
                                    <div id="divDist" style="height: 200px; overflow:auto; display:none; font-size:12px; font-family:Verdana, Geneva, sans-serif;"> </div>
                                    
                                    </td>
                                    
						        </tr>
						      </table></td>
 							  <td width="317" class='etiqueta'><table width="315" height="150" >
 							  							    <tr>
 							      <td width="307"> <div id="divVistaUbigeos" style="height: 200px; overflow:auto; font-size:12px; font-family:Verdana, Geneva, sans-serif;"> </div></td>
						        </tr>
						      </table></td>
  </tr>
 							<tr>
 							  <td align="center" class='etiqueta'><input type="button"  name="btnAgregar" class="boton" id="btnAgregar" style="font-family:Arial; font-size:8pt;" onclick="javascript:verUbigeos()" value="Agregar" /></td>
 							  <td class='etiqueta' align="center"><input type="button"  name="btnLimpiar" class="boton" id="btnLimpiar" style="font-family:Arial; font-size:8pt;" value="Limpiar" onclick="javascript:limpiar()" /></td>
  </tr>
 							<tr>
 							  <td  colspan="2" class='etiqueta' align="center"><input type="button" name="btnGrabar" class="boton" id="btnGrabar" style="font-family:Arial; font-size:8pt;" onClick="javascript:Grabar()" value="Grabar" /></td>
  </tr>
				  </table>

</form>
</body>
</html>