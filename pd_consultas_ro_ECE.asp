<%@ Language=VBScript %>

<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%

Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist= Session("UbigeoDist")
id_proyecto=session("id_proyecto") 
codigoMeta=Session("codigoProyecto")

sedeReg=session("sedeReg") 

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '9','"&id_proyecto&"' ")
	

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
	Response.Write " <option  value=""99"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub


sub generaSedeOp()

if lsRol=34 then
	IF lsUbigeoDist="999999" THEN
		lsUbigeo=lsUbigeoapli
	ELSE 
		lsUbigeo=lsUbigeoDist
	END IF
end if

	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_listar_sede_proyecto '"&lsUbigeo&"', '"&id_proyecto&"' ")
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtSedeop""  name=""txtSedeop"" onChange=""generaProvSEDE (this.value,'"&id_proyecto&"' )""  >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(2) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

end sub

sub generaRegion()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	if id_proyecto = 139 then
		sql1 = " exec dbo.pa_sede_ednom "&sedeReg&"' "	
	else
		sql1 = " exec dbo.pa_sede_ece '"&sedeReg&"' "	
	end if

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtSedeop"" name=""txtSedeop"" onChange=""generaprovEce();"">"
	Response.Write " <option selected  value=""99"">Todos</option>"
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

function generaProvSEDE(valor, id_proyecto){
      
	ajax=http_request();
	var valores;	
	valores= "sede=" + escape(valor)+"&id_proyecto="+id_proyecto;  // parametros a enviar al servidor	
	
	url="m_ProvinciaSEDE.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("regSProv").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("regSProv").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("regSProv").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("regSProv").innerHTML = ajax.responseText;	
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


function verdisSede(valor){  
 
 	id_proy=document.getElementById("id_proyecto").value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(valor)+'&id_proy='+id_proy;  // parametros a enviar al servidor	
	
	url="m_DistritoSEDE.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("regSDist").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("regSDist").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("regSDist").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("regSDist").innerHTML = ajax.responseText;					 
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
	document.getElementById("cargo2").style.display="";
	
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


function verFields(valor){
	
	if (valor==1 ) {
		document.getElementById("reportes").style.display="none";
		document.getElementById("inscripciones").style.display="";
	}
	else if (valor==21 || valor==23 || valor==24 || valor==25|| valor==28){
		document.getElementById("reportes").style.display="";
		document.getElementById("inscripciones").style.display="none";
	}
	else{
		document.getElementById("reportes").style.display="none";
		document.getElementById("inscripciones").style.display="none";
	}
}


function porSede(valor){
	
	id_proy=document.getElementById("id_proyecto").value;

	if (valor=='1'){
		
		document.getElementById("sodepECE").style.display='none';  
		document.getElementById("soprovECE").style.display='none';
		document.getElementById("sodistECE").style.display='none';
		
		document.getElementById("txtSedeop").value="0";
		document.getElementById("txtProvSed").value="9999";
		document.getElementById("txtDistSed").value="999999";
		
		document.getElementById("padep").style.display='';  
		document.getElementById("paprov").style.display='';
		document.getElementById("padist").style.display='';
		

	}
	
	if (valor=='2'){
		
		document.getElementById("sodepECE").style.display='';
		
		if (id_proy==47 || id_proy==103)  {
			document.getElementById("soprovECE").style.display='';
			document.getElementById("sodistECE").style.display='';
		} 
				
		document.getElementById("txtDpto1").value="99";
		document.getElementById("txtProv1").value="9999";
		document.getElementById("txtDist1").value="999999";
		
		document.getElementById("padep").style.display='none';  
		document.getElementById("paprov").style.display='none';
		document.getElementById("padist").style.display='none';
	}
	
}


function generaprovEce(){
     
      var varDpto =document.getElementById("txtSedeop").options[document.getElementById("txtSedeop").selectedIndex].value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m_ProvinciaCon_ece.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("regSProv").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("regSProv").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("regSProv").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
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


function verdisEce(){

 var varProv =document.getElementById("txtProvSed").options[document.getElementById("txtProvSed").selectedIndex].value;
 
 var lsUbiDist =document.getElementById("lsubidist").value;
	ajax=http_request();
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&lsUbiDist="+escape(lsUbiDist);  // parametros a enviar al servidor	
	
	url="m_DistritoCon_ece.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("regSDist").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("regSDist").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("dis2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("regSDist").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

</script>
    </head>
    <body onload="porSede('1')">
        <div id="top">
          <!--#include file="cabecera.html"-->
          <!--#include file="pd_menu.asp"-->

       </div>
    <div id="divNavegacion" align="center"><span class="subtitulo"><input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
    <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" /></span></div>     
       
<div id="divNavegacion" align="center"><span class="subtitulo">CONSULTAS</span></div>      
  <div id="lateral">
                 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_consultas.asp">
            <table width='100%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios<span class="criterio">
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                  <input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
                  <input name="id_proyecto" type="hidden" id="id_proyecto" value="<%=id_proyecto%>" />
                  <input name="lsRol" type="hidden" id="lsRol" value="<%=lsRol%>" />
                </span></td>
              </tr>
 
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9"><fieldset>
          <legend class="criterio">&nbsp;&nbsp; Seleccione Nivel de RRHH :</legend><br>
          <input type="radio" name="nivelRRHH" id="TD" value="9" checked="checked" onclick="cargosPorNivel(this.value)" />
          <label for="9" class="etiqueta" >TODOS</label>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="nivelRRHH" id="RA" value="1" onclick="cargosPorNivel(this.value)" />
          <label for="1" class="etiqueta">RAO</label>
          &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="nivelRRHH" id="RO" value="2"   onclick="cargosPorNivel(this.value)"/>
          <label for="2" class="etiqueta" >RO</label>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="nivelRRHH" id="RO" value="3"  onclick="cargosPorNivel(this.value)"/><label for="3" class="etiqueta" >RTA</label>
        </fieldset></td>
		      </tr> 
              
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9"><fieldset>
          <legend class="criterio">&nbsp;&nbsp;Consulta por Distribuci&oacute;n
          <br>
          <input type="radio" name="divPA" id="PA" value="1" checked="checked" onclick="porSede(this.value)" />
          <label for="9" class="etiqueta" >Pol&iacute;tico Adminsitrativo</label>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="divPA" id="SE" value="2" onclick="porSede(this.value)" />
          <label for="1" class="etiqueta">Por sede</label>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </legend></fieldset></td>
		      </tr> 
              
              
              <tr>
                <td align="right" bgcolor="#F7F8F9"><span class="criterio">Reporte:</span></td>
			    <td bgcolor="#F7F8F9" class='criterio'><span class="alerta5">					
                <select id='cboReporte' name='cboReporte' class='e_combo'  style="width:200px;" onchange="verFields(this.value)"  >
                    <option value='' selected>Seleccione...</option>
<%if (codigoMeta="0051" and id_proyecto<>63) or (codigoMeta="0053")  then
	 %>
    <option value='1'>Inscritos Totales</option>
    				 <option value='28'>Preselecci&oacute;n Ficha</option>
                    <option value='23'>Evaluaci&oacute;n Curricular</option>
                    <option value='2'>Preselecci&oacute;n</option>
                    <option value='3'>Capacitaci&oacute;n</option>       
                    <option value='4' >Seleccionados (Titulares y Reserva)</option>
                    <option value='5' > Seleccionados Titulares</option>
                    <option value='27' >Contratados</option>
                    <option value='28' >Reporte Procesos</option>


<% else
if lsRol=1 then%>
                    <option value='1' >Inscritos Totales</option>
                    <option value='27' >Contratados</option>
					<%elseif lsRol=22 or lsRol=23   then%>
                    <option value='26'>Aptos Entrevista</option>       
                    <%else%>
                    <option value='1' >Inscritos Totales</option>
                    <option value='21'>Calificaci&oacute;n Autom&aacute;tica</option>
                    <option value='23'>Evaluaci&oacute;n Curricular</option>
                    <option value='25'>Eval. Conocimientos y/o Competencias</option>
                    <option value='26'>Aptos Entrevista</option>
                    <option value='24'>Entrevista personal</option>
                    <option value='4' >Seleccionados (Titulares y Reserva)</option>
                    <option value='5' > Seleccionados Titulares</option>
                    <option value='27' >Contratados</option>
                    
                    <%end if %>	
                    
				
<%end if%>
                </select>
                (*) </span></td>
              </tr> 
              <tr id="padep">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Departamento:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaDpto()%></td>
              </tr>
              <tr  id="paprov">
                <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Provincia:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                  <option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
                </select></td>
              </tr>
              <tr id="padist">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                  <option id="txtDist1" 	title="Todos" value="999999" >Todos </option>
                </select></td>
              </tr>
              
              <tr id="sodepECE">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Regional:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis2"><%generaRegion()%></td>
              </tr>
              <tr id="soprovECE">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Provincial:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="regSProv"><select class='e_combo' name="txtProvSed" id="txtProvSed"  style="width:200px">
                  <option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
                </select></td>
              </tr>
              <tr id="sodistECE">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Distrital:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="regSDist"><select class='e_combo' name="txtDistSed" id="txtDistSed"  style="width:200px">
                  <option id="txtProv1" selected title="Todos" value="999999" > Todos </option>
                </select></td>
              </tr>
              
              <tr id="cargo1">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Cargo:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaCargo()%>
                  <span class="alerta5">(*)</span></td>
              </tr>
              <tr id="cargo2" style="display:none">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Cargo:</span></td>
                <td bgcolor="#F7F8F9" id="cargo2N" class='criterio'><select class='e_combo' name="cmbCargo1" id="cmbCargo1"  style="width:200px;" >
                  <option id="9" 	title="Todos" value="900" >Todos </option>
                </select></td>
              </tr>
               <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Convocatoria:</span></td>
                <td bgcolor="#F7F8F9" class='criterio' id="conv">
                  <select class='e_combo' name="txtConvocartoria" id="txtConvocartoria"  style="width:200px;" >
                  <option id="txtconv" 	title="Todos" value="0" >Todos </option>
                </select></td>
              </tr>
              
               <tr height=22 >
	            <td align="left" bgcolor="#F7F8F9"><span class="criterio">Fecha Registro:&nbsp;</span></td>
	            <td align="left" bgcolor="#F7F8F9"><span class="criterio">
	              <input name="txtfecha" type="text" class="e_input" id="txtfecha" onkeyup="this.value=formateafecha(this.value);" size="10" maxlength="10" value="" />
	            </span></td>
              </tr>
              <%if (codigoMeta="0051" and id_proyecto<>63) or (codigoMeta="0053")  then
	 %>
              <tr height=22 >
	            <td align="left" bgcolor="#F7F8F9"><span class="criterio">Trab. INEI:&nbsp;</span></td>
	            <td align="left" bgcolor="#F7F8F9"><span class="criterio">
	              <select class='e_combo' name="txtTrabI" id="txtTrabI"  style="width:100px;" >
	                 <option title="Todos" value="" >Todos </option>
                    <option title="Si" value="1" >Si </option>
                    
                    <option title="No" value="2"  >No </option>
                </select>
	            </span></td>
              </tr>
              <%else%>
              <input name="txtTrabI" id="txtTrabI" type="hidden" value="0" />
              <%end if%>
               <tr height=22>
                <td colspan="2" align="left" bgcolor="#F7F8F9">
                
                <fieldset id="reportes" style="display:none">
          <legend class="criterio">&nbsp;Estado&nbsp;</legend><br>
          <input type="radio" name="treportes" id="T" value="9" checked="checked" />
          <label for="9" class="etiqueta" >Todos</label>
          &nbsp;&nbsp;
          <input type="radio" name="treportes" id="TD" value="1" />
          <label for="1" class="etiqueta" >Aprobados</label>
          &nbsp;&nbsp;
          <input type="radio" name="treportes" id="RA" value="2" />
          <label for="2" class="etiqueta">Desaprobados</label>
          &nbsp;&nbsp;
                </fieldset>
                
                <fieldset id="inscripciones"  style="display:none">
          <legend class="criterio">&nbsp;Estado&nbsp;</legend>
          <input type="radio" name="treportes1" id="T1" value="9" checked="checked" />
          <label for="9" class="etiqueta" >Todos</label><br>
          <input type="radio" name="treportes1" id="TD1" value="1"/>
          <label for="1" class="etiqueta" >Inscripciones Completas</label><br>
          <input type="radio" name="treportes1" id="RA1" value="2"  />
          <label for="2" class="etiqueta">Inscripciones Incompletas</label>
          &nbsp;&nbsp;&nbsp;&nbsp;
                </fieldset>
                
                </td>
              </tr>
              
	          <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onClick="javascript:enviar_consulta_ece(2)" 
                        value='Aceptar'>&nbsp;&nbsp;&nbsp; <input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onClick="javascript:enviar_consultaReporte()" 
                        value='Exportar'> </td>
              </tr>
	          <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button2'  type='button' class="boton" 				
                        id='button2' 
                        onclick="javascript:exportarRA_ece()" 
                        value='Exportar F2' /></td>
                        
              </tr>
            
               <tr height=22 >
              
	            <td colspan="2" align="center" bgcolor="#F7F8F9">
                <input 
                        name='button5'  type='button' class="botonR" 				
                        id='button5' 
                        onclick="javascript:exportarECENotas(5)" 
                        value='Reporte Notas' /></td>
              </tr>
              
                <% IF codigoMeta="0051" or codigoMeta="0053" THEN%>
               <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button2'  type='button' class="boton" 				
                        id='button2' 
                        onclick="javascript:exportarECE(1)"  
                        value='Reporte 5.1' />&nbsp;&nbsp;<input 
                        name='button2'  type='button' class="boton" 				
                        id='button2' 
                        onclick="javascript:exportarECE(2)" 
                        value='Reporte 5.2' />&nbsp;&nbsp;<input 
                        name='button3'  type='button' class="boton" 				
                        id='button3' 
                        onclick="javascript:exportarECE(3)" 
                        value='Reporte 5.3' /></td>
                        
              </tr>
              
              <tr height=22 >
	            <td colspan="2" align="center" bgcolor="#F7F8F9">
                <input 
                        name='button4'  type='button' class="boton" 				
                        id='button4' 
                        onclick="javascript:exportarECE(4)" 
                        value='Reporte 5.4' />&nbsp;&nbsp;<input 
                        name='button5'  type='button' class="boton" 				
                        id='button5' 
                        onclick="javascript:exportarECE(5)" 
                        value='Reporte 5.5' />&nbsp;&nbsp;<input 
                        name='button5'  type='button' class="boton" 				
                        id='button5' 
                        onclick="javascript:exportarECE(6)" 
                        value='Reporte 5.6' /></td>
              </tr>
          
            <tr height=22 >
	            <td colspan="2" align="center" bgcolor="#F7F8F9">
                <input 
                        name='button4'  type='button' class="boton" 				
                        id='button4' 
                        onclick="javascript:exportarECE(61)" 
                        value='Reporte 6.1' />&nbsp;&nbsp;<input 
                        name='button5'  type='button' class="boton" 				
                        id='button5' 
                        onclick="javascript:exportarECE(62)" 
                        value='Reporte 6.2' />&nbsp;&nbsp;<input 
                        name='button5'  type='button' class="boton" 				
                        id='button5' 
                        onclick="javascript:exportarECE(63)" 
                        value='Reporte 6.3' /></td>
              </tr>
              

              <%END IF%>
              <tr height=22 >
	            <td colspan="2" align="center" bgcolor="#F7F8F9">
                <br><input 
                        name='button2'  type='button' class="botonR" 				
                        id='button2' 
                        onclick="javascript:cobertura_cargo_ece(1) " 
                        value='Cobertura S. Regional' /><br><br>

                        <input 
                        name='button2'  type='button' class="botonR" 				
                        id='button2' 
                        onclick="javascript:cobertura_cargo_ece(3) " 
                        value='Cobertura Provincial / Distrital' />
                        </td>
              </tr>
               <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button3' style="display:none"  type='button' class="botonR" 				
                        id='button3' 
                        onclick="javascript:exportarRA(2)" 
                        value='Exportar F2 Capacitaci&oacute;n Hist&oacute;tico' /></td>
                        
              </tr>
              
              
            <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button5' style="display:none"  type='button' class="botonR" 				
                        id='button5' 
                        onclick="javascript:exportarRA(2)" 
                        value='Exportar F2 Selecci&oacute;n Hist&oacute;tico' /></td>
                        
              </tr>
              
            </table>
          </form>
    </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
            <div id="mostar_detalle2" style="display:none"  >
                <table width="100%" border="0">
				  <tr>
				    <td align="center"><form action="reporte.asp" method="post" target="_blank" id="FormularioExportacion">
                    <input type="hidden" id="datos_a_enviar" name="datos_a_enviar" />
                    </form></td>
			      </tr>
			    </table></div>
          <div id="divDetallem" style="width:100%; height:100%; overflow:auto; float: left ; position: inherit; vertical-align:top;"> </div>
              
               <div id="deta" style="width:100%; float:left; position:inherit;  vertical-align:top;"> </div>
            <div id="mensa" style="width:100%; float:left; position:inherit; vertical-align:top;"> </div>
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
