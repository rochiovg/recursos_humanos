<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.ContentType="text/html; charset=iso-8859-1"

sub generaODei(id)

	set wRsDptoapli = Micone.execute(" exec pa_odei_listar ")
	Response.Write "<select class=""e_combo"" id=""cmbOdei"&id&""" name=""cmbOdei"&id&""" onChange=""generaSedeCap(this.value, '"&id&"')""  >"
	Response.Write " <option value=""0"">Todos...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title ="""&wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


Response.Expires = 0

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoApli = Session("Ubigeoapli") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")
idProyecto=Session("id_proyecto")



If lsUbigeo <> "" Then




%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
         <title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>
   
		
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/main.js"></script> 
        <script type="text/javascript"  src="js/cliente.js"></script>
		<script type="text/javascript"  src="js/envio_ajax.js"></script>
		<script type="text/javascript"  src="js/valida.js"></script>
        
        <link rel="stylesheet" href="css/demos.css">
    	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
        <link rel="shortcut icon" href="images/favicon.ico" />

        <link href="css/fixedheadertable.css" rel="stylesheet" media="screen"/>
        <link href="css/table.css" rel="stylesheet" media="screen" />
        <script type="text/javascript" src="js/jquery.min.js"></script>

        <script src="js/jquery.fixedheadertable.js"></script>
        
        <style>
			input.text { margin-bottom:12px; width:95%; padding: .4em; }
			.ui-dialog .ui-state-error { padding: .3em; }
			.validateTips { border: 1px solid transparent; padding: 0.3em; }
			.container_12 {
				margin-left: auto;
				margin-right: auto;
				width: 90%;
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
		
$(document).ready(function() {
	document.getElementById("titulo").innerHTML ="REPORTE DE PRESUPUESTO POR ODEI/OZEI OPERATIVA";
	verReporte_1();
});
			


function verReporte_1(){
			
	var cod_odei=document.getElementById("cmbOdei1").value;
	var fase=document.getElementById("cmbFase1").value;
			
	ajax=http_request();
	var valores;	
	valores= "cod_odei=" + escape(cod_odei)+"&fase="+escape(fase) ;
	url="m_reporteFort1.asp";
	ajax.open ('POST', url, true);
	ajax.onreadystatechange = function() {
		if (ajax.readyState==1) {
			document.getElementById("divContenido").innerHTML ="<span class=etiqueta>Cargando......</span>";
			}
		else if (ajax.readyState==4){
			if(ajax.status==200){
				document.getElementById("divContenido").innerHTML =ajax.responseText;
			//	$('#tabla_rep').fixedHeaderTable({ footer: false, altClass: 'odd' });
			}
			else if(ajax.status==404){
				document.getElementById("divContenido").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
			}
		else{
			document.getElementById("divContenido").innerHTML = ajax.responseText;	
			}
	}
				}
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	ajax.send(valores);
	return;	 	
}


function verReporte_2(){
			
	var cod_odei=document.getElementById("cmbOdei2").value;
	var fase=document.getElementById("cmbFase2").value;
	var sede_cap=document.getElementById("cmbSedeCap2").value;
	var periodo=document.getElementById("cmbPeriodo2").value;
			
	ajax=http_request();
	var valores;	
	valores= "cod_odei=" + escape(cod_odei)+"&fase="+escape(fase)+"&sede_cap="+escape(sede_cap)+"&periodo="+escape(periodo) ;
	url="m_reporteFort2.asp";
	ajax.open ('POST', url, true);
	ajax.onreadystatechange = function() {
		if (ajax.readyState==1) {
			document.getElementById("divContenido").innerHTML ="<span class=etiqueta>Cargando......</span>";
			}
		else if (ajax.readyState==4){
			if(ajax.status==200){
				document.getElementById("divContenido").innerHTML =ajax.responseText;
				//$('#tabla_rep').fixedHeaderTable({ footer: false, altClass: 'odd' });
			}
			else if(ajax.status==404){
				document.getElementById("divContenido").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
			}
		else{
			document.getElementById("divContenido").innerHTML = ajax.responseText;	
			}
	}
				}
	ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	ajax.send(valores);
	return;	 	
}
			

function verDatosRep (id){
	document.getElementById("tr_1").style.display="none";
	document.getElementById("tr_2").style.display="none";
	document.getElementById("tr_3").style.display="none";
	
	document.getElementById("divC1").style.display="none";
	document.getElementById("divC2").style.display="none";
	document.getElementById("divC3").style.display="none";

	document.getElementById("cmbOdei1").value="0";
	document.getElementById("cmbOdei2").value="0";
	document.getElementById("cmbOdei3").value="0";
	
	document.getElementById("cmbFase1").value="0";
	document.getElementById("cmbFase2").value="0";
	document.getElementById("cmbFase3").value="0";
	
	document.getElementById("cmbSedeCap2").value="0";
	document.getElementById("cmbSedeCap3").value="0";
	
	document.getElementById("cmbPeriodo2").value="0";
	document.getElementById("cmbPeriodo3").value="0";
	
	document.getElementById("cmbDistrito3").value="0";
	document.getElementById("cmbAula3").value="0";
	
	document.getElementById("tr_"+id).style.display="";
	document.getElementById("divC"+id).style.display="";		

	if (id==1){
		verReporte_1();
		document.getElementById("titulo").innerHTML ="REPORTE DE PRESUPUESTO POR ODEI/OZEI OPERATIVA";
	}else {
		if (id==2){
			document.getElementById("titulo").innerHTML ="REPORTE DE PRESUPUESTO POR SEDE DE CAPACITACION";
		} else {
			document.getElementById("titulo").innerHTML ="REPORTE DE PRESUPUESTO FUNCIONARIO MUNICIPAL";
			}
		document.getElementById("divContenido").innerHTML ="";
	}
}

function generaSedeCap(valor, id) {
	if (id==1){
		verReporte_1();
	}
	else {
		ajax=http_request();
		var valores;	
		valores= "valor=" + escape(valor)+"&id="+escape(id) ;
		url="m_SedeFortalecimiento.asp";
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			if (ajax.readyState==1) {
				document.getElementById("td_sedecap"+id).innerHTML ="<span class=etiqueta>Cargando......</span>";
				}
			else if (ajax.readyState==4){
				if(ajax.status==200){
					document.getElementById("td_sedecap"+id).innerHTML =ajax.responseText;
					if (id==2){
						verReporte_2();
					}
				}
				else if(ajax.status==404){
					document.getElementById("td_sedecap"+id).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
			else{
				document.getElementById("td_sedecap"+id).innerHTML = ajax.responseText;	
				}
		}
					}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		return;	
	}
}


</script>
    </head>
    <body>
        <div id="top">
           <!--#include file="cabecera.html"--></div>
    <div id="formulario" >
	  <div id="divNavegacion" align="center"><span class="subtitulo">Registro: CARGOS PRESUPUESTADOS DE LA PEA</span></div>

      <!--#include file="pd_menu.asp"-->
<table  width="100%"  border="0" align="center">
	<tr>
		<td valign=top align=center>
        	<table width="100%" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
		  		<tr>
 	      			<th colspan="12" bgcolor="#DAE8F3" class="aplicacion"><span class="dato">
 	        <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           </span></th>
           		</tr>
 	      <tr>
 	        <td colspan="12"   class='etiqueta'>Seleccione tipo de Reporte a Visualizar</td>
 	        </tr>
          <tr>
 	        <td colspan="4" class='etiqueta' >
            	<input type="radio" name="nivelRep" id="rep1" value="1" checked="checked" onclick="verDatosRep(this.value)" />
          		<label for="1" class="etiqueta" >Por ODEI/OZEI</label>
            </td>
 	        <td colspan="4"   class='etiqueta'>
 	          <input type="radio" name="nivelRep" id="rep2" value="2"  onclick="verDatosRep(this.value)" />
 	          <label for="2" class="etiqueta" >Por Sede de Capacitaci&oacute;n</label>
 	          </td>
              <td colspan="4"   class='etiqueta'>
            	<input type="radio" name="nivelRep" id="rep3" value="3"  onclick="verDatosRep(this.value)" />
          		<label for="3" class="etiqueta" >Por Funcionario Municipal</label>
            </td>
 	        </tr>
            <tr id="tr_1">
 	        <td class='etiqueta'>ODEI:</td>
 	        <td class='etiqueta'><% generaODei(1) %></td>
 	        <td class='etiqueta'>FASE:</td>
 	        <td class='etiqueta' id="td_sedecap"><select name="cmbFase1" class="e_combo" id="cmbFase1" onchange="verReporte_1()">
 	          <option value="0">Todos...</option>
 	          <option value="I">Fase 1</option>
 	          <option value="II">Fase 2</option>
 	          </select></td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        </tr>
            <tr id="tr_2" style="display:none">
 	        <td class='etiqueta'>ODEI:</td>
 	        <td class='etiqueta'><% generaODei(2) %></td>
 	        <td class='etiqueta'>SEDE CAP.:</td>
 	        <td class='etiqueta' id="td_sedecap2"><select name="cmbSedeCap2" class="e_combo" id="cmbSedeCap2" onchange="verReporte_2()">
 	          <option value="0">Todos...</option>
 	          </select></td>
 	        <td class='etiqueta'>FASE:</td>
 	        <td class='etiqueta'><select name="cmbFase2" class="e_combo" id="cmbFase2" onchange="verReporte_2()">
 	          <option value="0">Todos...</option>
 	          <option value="I">Fase 1</option>
 	          <option value="II">Fase 2</option>
 	          </select></td>
 	        <td class='etiqueta'>PERIODO:</td>
 	        <td class='etiqueta'><select name="cmbPeriodo2" class="e_combo" id="cmbPeriodo2" onchange="verReporte_2()">
 	          <option value="0">Todos...</option>
 	          <option value="1">Periodo 1</option>
 	          <option value="2">Periodo 2</option>
              <option value="3">Periodo 3</option>
              <option value="4">Periodo 4</option>
              <option value="5">Periodo 5</option>
 	          </select></td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        <td class='etiqueta'>&nbsp;</td>
 	        </tr>
            <tr id="tr_3"  style="display:none">
 	        <td class='etiqueta'>ODEI:</td>
 	        <td class='etiqueta'><% generaODei(3) %></td>
 	        <td class='etiqueta'>SEDE CAP.:</td>
 	        <td class='etiqueta' id="td_sedecap3"><select name="cmbSedeCap3" class="e_combo" id="cmbSedeCap3">
 	          <option value="0">Todos...</option>
 	          </select></td>
 	        <td class='etiqueta'>DISTRITO:</td>
 	        <td class='etiqueta' id="td_distrito"><select name="cmbDistrito3" class="e_combo" id="cmbDistrito3">
 	          <option value="0">Todos...</option>
 	          </select></td>
 	        <td class='etiqueta' id="td_aula">NRO.AULA:</td>
 	        <td class='etiqueta'><select name="cmbAula3" class="e_combo" id="cmbAula3">
 	          <option value="0">Todos...</option>
 	          </select></td>
 	        <td class='etiqueta'>FASE:</td>
 	        <td class='etiqueta'><select name="cmbFase3" class="e_combo" id="cmbFase3">
 	          <option value="0">Todos...</option>
 	          <option value="I">Fase 1</option>
 	          <option value="II">Fase 2</option>
 	          </select></td>
 	        <td class='etiqueta'>PERIODO:</td>
 	        <td class='etiqueta'><select name="cmbPeriodo3" class="e_combo" id="cmbPeriodo3">
 	          <option value="0">Todos...</option>
 	          <option value="1">Periodo 1</option>
 	          <option value="2">Periodo 2</option>
              <option value="3">Periodo 3</option>
              <option value="4">Periodo 4</option>
              <option value="5">Periodo 5</option>
 	          </select></td>
 	        </tr>

 	    </table>

		</td>
	</tr>	
    <tr>
    	<td>
        
        <div id="divC1" align="center" style="vertical-align:top; overflow:auto; height:15%; width:98.5%">
         <div style="text-align:center"> <font id="titulo" class="tituloPrin"> </font></div>
     	<%
			response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.write"<thead> "
	response.write"<tr bgcolor=""#DAE8F3""> "
	response.write"     <th rowspan=""2"" width=""4%"">N&deg;</th> "
	response.write"     <th rowspan=""2"" width=""6%"">CodSede ODEI / OZEI</th> "
	response.write"     <th rowspan=""2"" width=""32%"">ODEI / OZEI</th> "
	response.write"     <th rowspan=""2"" width=""6%"">TOTAL SEDES PROV. DE CAP.</th> "
	response.write"     <th rowspan=""2"" width=""6%"">Total AULAS</th> "
	response.write"     <th rowspan=""2"" width=""6%"">Total Funcionarios Municipales</th>"
	response.write"     <th colspan=""4"" width=""40%"">ASIGNACI&Oacute;N S/.</th> "
	response.write"</tr> "
	response.write"<tr bgcolor=""#DAE8F3""> "
	response.write"     <th width=""10%"">Total Asignaci&oacute;n</th> "
	response.write"     <th width=""10%"">Total Pasaje</th>"
	response.write"     <th width=""10%"">Total Movilidad</th> "
	response.write"     <th width=""10%"">Total</th> "
	response.write"</tr> "
	response.write"</thead> "
    response.Write " </table>"
		%>
     </div>
      <div id="divC2" align="center" style="display:none; vertical-align:top; overflow:auto; height:15%; width:98.5%">
         <div style="text-align:center"> <font id="titulo" class="tituloPrin"> </font></div>
     	<%
		response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
		 response.write"<thead> "
		 response.write"<tr bgcolor=""#DAE8F3""> "
		 response.write"  	<th rowspan=""2"" width=""4%"">N&deg;</th>"
		 response.write"    <th rowspan=""2"" width=""6%"">CodSede ODEI / OZEI</th>"
		 response.write"    <th rowspan=""2"" width=""20%"">ODEI/OZEI</th>   "
		 response.write"    <th rowspan=""2"" width=""6%"">Departamento</th> "
		 response.write"    <th rowspan=""2"" width=""6%"">SEDE DE CAPACITACI&Oacute;N PROVINCIAL</th>"
		 response.write"    <th rowspan=""2"" width=""6%"">Total Aulas</th>     "
		 response.write"    <th rowspan=""2"" width=""6%"">Total Distritos</th> "
		 response.write"    <th rowspan=""2"" width=""6%"">Total Funcionarios Municipales</th> "
		 response.write"    <th colspan=""4"" width=""40%"">ASIGNACI&Oacute;N S/.</th> "
		 response.write"</tr> "
		 response.write"<tr bgcolor=""#DAE8F3"">  "
		 response.write"    <th width=""10%"">Gastos Asignados</th> "
		 response.write"    <th width=""10%"">Total Pasaje</th>     "
		 response.write"    <th width=""10%"">Total Movilidad</th>  "
		 response.write"    <th width=""10%"">Total</th> "
		 response.write"</tr> "
	response.write"</thead> "
    response.Write " </table>"
		%>
     </div>
      <div id="divC3" align="center" style="display:none; vertical-align:top; overflow:auto; height:15%; width:98.5%">
         <div style="text-align:center"> <font id="titulo" class="tituloPrin"> </font></div>
     	<%
			response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.write"<thead> "
	response.write"<tr bgcolor=""#DAE8F3""> "
	response.write"     <th rowspan=""2"" width=""4%"">N&deg;</th> "
	response.write"     <th rowspan=""2"" width=""6%"">CodSede ODEI / OZEI</th> "
	response.write"     <th rowspan=""2"" width=""32%"">ODEI / OZEI</th> "
	response.write"     <th rowspan=""2"" width=""6%"">TOTAL SEDES PROV. DE CAP.</th> "
	response.write"     <th rowspan=""2"" width=""6%"">Total AULAS</th> "
	response.write"     <th rowspan=""2"" width=""6%"">Total Funcionarios Municipales</th>"
	response.write"     <th colspan=""4"" width=""40%"">ASIGNACI&Oacute;N S/.</th> "
	response.write"</tr> "
	response.write"<tr bgcolor=""#DAE8F3""> "
	response.write"     <th width=""10%"">Total Asignaci&oacute;n</th> "
	response.write"     <th width=""10%"">Total Pasaje</th>"
	response.write"     <th width=""10%"">Total Movilidad</th> "
	response.write"     <th width=""10%"">Total</th> "
	response.write"</tr> "
	response.write"</thead> "
    response.Write " </tr> </table>"
		%>
     </div>
     <div id="divContenido" style="vertical-align:top; overflow:auto; height:350px;" align="center" ></div>
        
        
        </td>
    </tr>
	</table>              				    	    				    
</div><BR>
        <div id="footer" align="right">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>
      
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
