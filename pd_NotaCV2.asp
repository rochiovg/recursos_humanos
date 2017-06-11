<%@ Language=VBScript %>

<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")

lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist= Session("UbigeoDist")
lsUsuario1=Session("id_usuario")
id_proyecto=session("id_proyecto") 



sub generaCargo()

  IF lsRol=35 THEN 
  set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO_MIN '9','"&id_proyecto&"' ")
  ELSEIF lsRol=51 THEN 
  set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO_ESP '9','"&id_proyecto&"' ")
  ELSE
  set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '9','"&id_proyecto&"' ")
  END IF
  

  Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" OnChange=""generaConvocatoria(this.value);"" >"
  
  Response.Write " <option value=""900"">Todos</option>"
  While not wRsDptoapli.EOF
    Response.Write "<option title='"&wRsDptoapli(4)&" - Actividad: "&wRsDptoapli(5)&"'   value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(3) & "</option>"
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
  response.Write "<span class=""alerta5"">(*)</span>"

  wRsDptoapli.Close
  Set wRsDptoapli = Nothing
   	  
End sub


If lsUbigeo <> "" Then

%>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>..::Empadronamiento Distrital de Poblaci&oacute;n y Vivienda ::..</title>
  <link rel="stylesheet" href="Styles/main.css" type="text/css" />
  <link rel="shortcut icon" href="images/favicon.ico" />
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
  
  
  <link rel="stylesheet" type="text/css" href="Styles/inei.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
 
	<script type="text/javascript"  src="js/envio_ajax.js"></script>
	<script type="text/javascript"  src="js/valida.js"></script>
	<script type="text/javascript" src="js/main.js"></script> 
	<script language="javascript">
			$(document).ready(function() {
				$(".botonExcel").click(function(event) {
					$("#datos_a_enviar").val( $("<div>").append( $("#Exportar_a_Excel").eq(0).clone()).html());
					$("#FormularioExportacion").submit();
			});
			});
	</script>
	<script>
	  $( function() {
		$( "#accordion" ).accordion();
	  } );
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
	
	function MostrarBoton(){
	
	
	var rep =document.getElementById("cboReporte").options[document.getElementById("cboReporte").selectedIndex].value; 
	if (rep==7){
		document.getElementById("button3").style.display='block';
		}
		else{
			document.getElementById("button3").style.display='none';
			}
	if (rep==5){
		document.getElementById("button5").style.display='block';
		}
		else{
			document.getElementById("button5").style.display='none';
			}
	
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


function verzona(){

 var varDist=document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value;
 
 var lsUbiDist =document.getElementById("lsubidist").value;
	ajax=http_request();
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDist)+"&lsUbiDist="+escape(lsUbiDist);  // parametros a enviar al servidor	
	
	url="m71_zona.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("zona2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("zona2").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("zona2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("zona2").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}




function verseccion(){

 var varProv =document.getElementById("txtzona1").options[document.getElementById("txtzona1").selectedIndex].value;
 
 var lsUbiDist =document.getElementById("lsubidist").value;
	ajax=http_request();
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&lsUbiDist="+escape(lsUbiDist);  // parametros a enviar al servidor	
	
	url="m71_seccion.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("seccion2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("seccion2").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("seccion2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("seccion2").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function generaConvocatoria(valor){     
	 var varcargo =valor;   
	ajax=http_request();
	
	var valores;	
	valores= "datos=" + escape(varcargo);  // parametros a enviar al servidor	
	
	
	url="m_numConvocatoria.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("conv").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("conv").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("conv").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("conv").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function cargosPorNivel(valor){
	document.getElementById("cargo1").style.display="none";
	<!-- -->document.getElementById("cargo2").style.display="";
	
	ajax=http_request();
	
	var valores;	
	valores= "valor=" + escape(valor);  // parametros a enviar al servidor	
	
	
	url="m_cargoPorNivel.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("cargo2N").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("cargo2N").innerHTML =ajax.responseText;
					generaConvocatoria()
					
            }
            else if(ajax.status==404){
                     document.getElementById("cargo2N").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("cargo2N").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


<!-- inicio prueba -->

function verFields(valor){
	
	if (valor==1) {
		document.getElementById("reportes").style.display="none";
		document.getElementById("inscripciones").style.display="";
	}
	else if (valor==21 || valor==23 || valor==24 || valor==25){
		document.getElementById("reportes").style.display="";
		document.getElementById("inscripciones").style.display="none";
	}
	else{
		document.getElementById("reportes").style.display="none";
		document.getElementById("inscripciones").style.display="none";
	}
}

 function verificar_cv(dni)
	  {
		 var fdni=document.getElementById("fdni").value;
	  
		if (fdni==0 || fdni==""){
		document.getElementById("TR"+dni).style.background="#EAEE35";
		document.getElementById("fdni").value=dni;
		} else if ( fdni!=dni){
		  document.getElementById("TR"+dni).style.background="#EAEE35";
		  document.getElementById("TR"+fdni).style.background="";
		} else if ( fdni==dni){
		  document.getElementById("TR"+dni).style.background="#EAEE35";
		}
		else {
		  document.getElementById("TR"+dni).style.background="#EAEE35";
		  document.getElementById("TR"+fdni).style.background=""
		}
		document.getElementById("fdni").value=dni;
		
		ajax=http_request();
		var valores;  
		valores= "dni=" + escape(dni);  // parametros a enviar al servidor  
		
		url="m_vistaCV_2.asp";  
		
		ajax.open ('POST', url, true);
		  ajax.onreadystatechange = function() {
			   if (ajax.readyState==1) {
					   document.getElementById("divResultado").innerHTML ="Cargando......";
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

function ver_cv(id){
	
	vista=document.getElementById("num_vista").value;
	document.getElementById("foto"+vista).style.display="none";
	document.getElementById("foto"+id).style.display="";
	document.getElementById("num_vista").value=id;

}

function f_contador_cv(idc,id,ID_PER,valor, usuario){
	var combo=idc;
	var valor=valor;
	var dni=dni;
	var obs=document.getElementById('txtobs'+ID_PER).value;
	var obs1=document.getElementById('cmbObservacion').value;
	
	obs=obs1+' '+obs;
	if(!confirm("Estas seguro de hacer este cambio a \n "+id))
	{
		document.getElementById(idc).value=vcombo1;
		vcombo1=0;
		idcombo;
	}else 
	{	
		ProcesarCV(ID_PER,valor,usuario, obs);
	}
}

function ProcesarCV(ID_PER,VALOR,USUARIO, obs){
	
	id_proy=document.getElementById("id_proy").value;
	ajax=http_request();
	var valores;	
	valores= "ID_PER=" + escape(ID_PER) + "&VALOR=" + escape(VALOR)+ "&USUARIO=" + escape(USUARIO)+ "&id_proy=" + escape(id_proy)+ "&obs=" + escape(obs);  // parametros a enviar al servidor
	
	url="m_Proc_CV.asp";   // nombre de url a invocar
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 
         }
         else if (ajax.readyState==4){
		
            if(ajax.status==200){
					alert('Los Datos Han Sido Correctamente Grabados');
            }
            else if(ajax.status==404){
				document.getElementById("divResultado").innerHTML = ajax.responseText;
            }
            else{
				document.getElementById("divResultado").innerHTML = ajax.responseText;
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return ;	

}


<!--fin de prueba -->
	</script>
</head>
<body>
 <div id="top">
    <!--#include file="cabecera.html"-->
    <!--#include file="pd_menu.asp"-->
</div>
<div 
    id="divNavegacion" align="center"><span class="subtitulo"><input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
    <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" /></span>
</div> 
<div id="accordion">
  	<h3>Convocatorias</h3>
	<div>
		<div>
			<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_consultas.asp">
			<table width="1161" height="79" border="0" align="center">
			<tr>
						<td colspan="4" align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios
						<span class="criterio">
						  <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
						  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
						  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
						  <input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
						  <input name="id_proy" type="hidden" id="id_proy" value="<%=id_proyecto%>" />
						  <input name="lsRol" type="hidden" id="lsRol" value="<%=lsRol%>" />
						</span></td>
			</tr>
			<tr>
				<td colspan="4"> <fieldset>
				  <legend class="criterio">&nbsp;&nbsp; Seleccione Nivel de RRHH :</legend>
				  <input type="radio" name="nivelRRHH" id="TD" value="9" checked="checked" onClick="cargosPorNivel(this.value)" />
				  <label for="9" class="etiqueta" >TODOS</label>
				  &nbsp;&nbsp;&nbsp;&nbsp;
				  <input type="radio" name="nivelRRHH" id="RA" value="1" onClick="cargosPorNivel(this.value)" />
				  <label for="1" class="etiqueta">RAO</label>
				  &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="nivelRRHH" id="RO" value="2"   onclick="cargosPorNivel(this.value)"/>
				  <label for="2" class="etiqueta" >RO</label>&nbsp;&nbsp;&nbsp;&nbsp;
				  <input type="radio" name="nivelRRHH" id="RO" value="3"  onclick="cargosPorNivel(this.value)"/><label for="3" class="etiqueta" >RTA</label>
				</fieldset></td>
			</tr>
			<tr>
			  <td width="330" >Departamento</td>
			  <td width="330">Provincia</td>
			  <td width="330">Distrito</td>
			  <td width="330">Zona</td>
			</tr>
			<tr>
			  <td><span class="criterio">
				<%generaDpto()%>
			  </span></td>
				<td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
						  <option id="txtProv1"   title="Todos" value="9999" > Todos </option>
						</select></td>
			  <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
						  <option id="txtDist1" 	title="Todos" value="999999" >Todos </option>
						</select></td>
				<td id="pazona" bgcolor="#F7F8F9" class='criterio'><select class='e_combo' name="txtzona1" id="txtzona1"  style="width:200px;" >
						  <option id="txtzona1"   title="Todos" value="999999" >Todos </option>
				   </select>
				</td>
			</tr>
			<tr>
			  <td>Seccion</td>
			  <td>Cargo </td>
			  <td>Convocatoria </td>
			  <td colspan="2" align="center" valign="middle" bgcolor="#F7F8F9"><div align="center">
				<input 
								name='button1'  type='button' class="boton"         
								id='button1' 
								onclick="javascript:calificarCV(1)" 
								value='Aceptar'>
			  </div></td>
			</tr>
			<tr>
				<td id="paseccion" bgcolor="#F7F8F9" class='criterio'><select class='e_combo' name="txtseccion1" id="txtseccion1"  style="width:200px;" >
						  <option id="txtseccion1"  title="Todos" value="999999" >Todos </option>
						</select></td>
			  <td id="cargo1"><span class="criterio">
				<%generaCargo()%>
			  </span> <select class='e_combo' name="cmbCargo1" id="cmbCargo1"  style="width:200px;" >
						  <option id="9" 	title="Todos" value="900" >Todos </option>
						</select></td>
			  <td bgcolor="#F7F8F9" class='criterio' id="conv">
						  <select class='e_combo' name="txtConvocartoria" id="txtConvocartoria"  style="width:200px;" >
						  <option id="txtconv"  title="Todos" value="0" >Todos </option>
						</select></td>
			</tr>
		  </table> 
		  </form>
		</div>
		<br>
 		<div id="contenido" style="height:300px; overflow-y: scroll;" align="center"></div>
	</div>
  	<h3>Evaluaci&oacute;n de Curriculum Vitae</h3>
	<div>
			<div id="divResultado" style="margin:0; height:500px;overflow-y: scroll;" align="center"></div>
			<!--<div id="divProceso"></div>  -->
 	</div>
	<h3>Prueba Psiclogica</h3>
	<div>
		<p>
		Cras dictum. Pellentesque habitant morbi tristique senectus et netus
		et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
		faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
		mauris vel est.
		</p>
	</div>
	<h3>Seleccion</h3>
	<div>
		<p>
		Cras dictum. Pellentesque habitant morbi tristique senectus et netus
		et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
		faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
		mauris vel est.
		</p>
  </div>
  <h3>Entrevista</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
  </div>
    <h3>Otro</h3>
  <div>
    <p>
    Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
    purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
    velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
    suscipit faucibus urna.
    </p>
  </div>
</div>
</body>
</html>

 <%Else
		Response.Redirect("default.asp")
		End If%> 