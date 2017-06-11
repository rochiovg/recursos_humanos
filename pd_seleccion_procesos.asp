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
id_usuario=Session("id_usuario")

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

	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_listar_sede_seleccion '"&id_proyecto&"' ")
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtSedeop""  name=""txtSedeop""  >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione...</option>"
	Response.Write " <option id=""valor_defecto"" value=""9"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(0) &" "&wRsDptoapli(1)& "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

end sub


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
		
		if (id_proy==47)  {
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


function enviar_consultaEXP(){
		
		 		 if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte Fuente");
			 document.frmMiForm.cboReporte.focus();
			 return false;
		 }
		
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
		
		if (document.frmMiForm.txtConvocartoria.value=='0'){
			alert("Selecciona el combo de la Convocatoria");
			document.frmMiForm.txtConvocartoria.focus();
			return false;
		}
		
		var lsReporte = document.frmMiForm.cboReporte.value;
		var valor=9

 		 var lsDPTO = 99;
		 var lsPROV = 9999;
		 var lsDIST = 999999;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsCargo1 = document.frmMiForm.cmbCargo1.value;
		 var txtSedeop = 0;
		 var txtProvSed = 9999;
		 var txtDistSed = 999999;

		 if(lsCargo1=='900'){
			 lsCargo=lsCargo;
		} else 
			 lsCargo=lsCargo1;
			 
			 
			 
		for (i=0;i<document.forms.item(0).nivelRRHH.length;i++)
		 {
			 if (document.forms.item(0).nivelRRHH[i].checked == true)
			 var lsnivel=document.frmMiForm.nivelRRHH[i].value;
		 }
		var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;
		var url;
		
		var sede=9;

	
	pagina = "m_seleccionGlobalReporte.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsReporte="+escape(lsReporte)+"&lsConvocaroria="+escape(lsConvocaroria)+"&valor="+escape(valor)+"&lsnivel="+escape(lsnivel)+"&txtSedeop="+escape(txtSedeop)+"&sede="+escape(sede)+"&txtProvSed="+escape(txtProvSed)+"&txtDistSed="+escape(txtDistSed);
	win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
}


function ver_validacion(){
	
	
			 if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte Fuente");
			 document.frmMiForm.cboReporte.focus();
			 return false;
		 }
		
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
		
		if (document.frmMiForm.txtConvocartoria.value=='0'){
			alert("Selecciona el combo de la Convocatoria");
			document.frmMiForm.txtConvocartoria.focus();
			return false;
		}
		
		var lsReporte = document.frmMiForm.cboReporte.value;
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsCC = document.frmMiForm.txtConvocartoria.value;

	
	for (i=0;i<document.forms.item(0).nivelObs.length;i++)
		 {
			 if (document.forms.item(0).nivelObs[i].checked == true)
			 var tipo=document.frmMiForm.nivelObs[i].value;
		 }
		 
		document.getElementById("divDetallem").innerHTML ="Cargando......";
		 
	ajax=http_request();
	var valores;	
	valores= "tipo="+tipo+"&lsReporte="+lsReporte+"&lsCargo="+lsCargo+"&lsCC="+lsCC;  // parametros a enviar al servido
	
	url="m_validacion.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("divDetallem").innerHTML =ajax.responseText;
					
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}



function validacion_exportar(){
	
	if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte Fuente");
			 document.frmMiForm.cboReporte.focus();
			 return false;
		 }
		
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
		
		if (document.frmMiForm.txtConvocartoria.value=='0'){
			alert("Selecciona el combo de la Convocatoria");
			document.frmMiForm.txtConvocartoria.focus();
			return false;
		}
		
	
	for (i=0;i<document.forms.item(0).nivelObs.length;i++)
		 {
			 if (document.forms.item(0).nivelObs[i].checked == true)
			 var tipo=document.frmMiForm.nivelObs[i].value;
		 }
		 
		 var lsReporte = document.frmMiForm.cboReporte.value;
		var lsCargo = document.frmMiForm.cmbCargo.value;
		var lsCC = document.frmMiForm.txtConvocartoria.value;
		 
 pagina = "m_validacion_exp.asp?tipo=" + tipo+"&lsReporte="+lsReporte+"&lsCargo="+lsCargo+"&lsCC="+lsCC;
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
				
}




function Guardar(id){
	
	var mensaje
	if (id==1){
		mensaje="Est\xe1 seguro de incrementar aprobados al proceso? "
		}
	if (id==2){
		mensaje="Est\xe1 seguro de realizar la selecci\xf3n general del personal en el proceso?"
		}
		
	
	if(confirm(mensaje)){
		
		
		 if(document.frmMiForm.cboReporte.value == '' )
		 {
			 alert("Selecciona el tipo de Reporte Fuente");
			 window.parent.document.frmMiForm.cboReporte.focus();
			 return false;
		 }
		
		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 if (document.frmMiForm.cmbCargo1.value=='900' || document.frmMiForm.cmbCargo1.value=='100' || document.frmMiForm.cmbCargo1.value=='200' || document.frmMiForm.cmbCargo1.value=='300') {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 }
		}
		
		if (window.parent.document.frmMiForm.txtConvocartoria.value=='0'){
			alert("Selecciona el combo de la Convocatoria");
			document.frmMiForm.txtConvocartoria.focus();
			return false;
		}
		
		if (window.parent.document.frmMiForm.txtSedeop.value=='0'){
			alert("Selecciona el combo de Sede Operativa");
			document.frmMiForm.txtSedeop.focus();
			return false;
		}
			
	id_proyecto=document.getElementById("id_proyecto").value;
	id_usuario=document.getElementById("id_usuario").value;
	tipo_seleccion=document.getElementById("cboReporte").value;
	id_cc=document.getElementById("txtConvocartoria").value;
	txtSedeop=document.getElementById("txtSedeop").value;
	
	ajax=http_request();
	var valores;	
	valores= "id_proyecto=" + escape(id_proyecto)+'&id_usuario='+id_usuario+'&tipo_seleccion='+tipo_seleccion+'&id_cc='+id_cc+'&id='+id+'&txtSedeop='+txtSedeop;  // parametros a enviar al servidor	
	
	url="m_guardarSeleccion.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divDetallem").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
			alert('Se guardaron los campos')					
					//document.getElementById("divDetallem").innerHTML =ajax.responseText;
					
            }
            else if(ajax.status==404){
                     document.getElementById("divDetallem").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divDetallem").innerHTML = ajax.responseText;	
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
    <body >
        <div id="top">
          <!--#include file="cabecera.html"-->
          <!--#include file="pd_menu.asp"-->

       </div>
    <div id="divNavegacion" align="center"><span class="subtitulo"><input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
    <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" /></span></div>     
       
<div id="divNavegacion" align="center"><span class="subtitulo">CONSULTAS</span></div>      
  <div id="lateral">
                 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
            <table width='100%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios<span class="criterio">
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                  <input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
                  <input name="id_proyecto" type="hidden" id="id_proyecto" value="<%=id_proyecto%>" />
                  <input name="id_usuario" type="hidden" id="id_usuario" value="<%=id_usuario%>" />
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
                <td align="right" bgcolor="#F7F8F9"><span class="criterio">Etapa Proceso:</span></td>
			    <td bgcolor="#F7F8F9" class='criterio'><span class="alerta5">					
                <select id='cboReporte' name='cboReporte' class='e_combo'  style="width:200px;"  >
                  <option value='' selected>Seleccione...</option>
                   <option value='0' selected>Preselecci&oacute;n Ficha</option>
                  <option value='1' title="Para Aprobaci&oacute;n CV">Para Aprobaci&oacute;n CV</option>
                  <option value='2' title="Para Preselecci&oacute;n">Para Preselecci&oacute;n</option>
                  <option value='3' title="Para Capacitaci&oacute;n">Para Capacitaci&oacute;n</option>
                  <option value='4' title="Para Selecci&oacute;n">Para Selecci&oacute;n</option>
                </select>
                (*) </span></td>
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
              
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede:</span></td>
                <td bgcolor="#F7F8F9" class='criterio' id="conv"><%generaSedeOp()%></td>
              </tr>
              
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
              
	         <!-- <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onClick="javascript:lista_calificar()" 
                        value='Aceptar'></td>
              </tr> -->
               <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9" ><font class="criterio">Subir Archivo (Formato CSV)</font></td>
              </tr>
              <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9" ><div>
	              <iframe width="100%" height="120px" id="Archivos_Subir" style="border:none;" src="carga_archivosCSV.asp"></iframe> 
    </div></td>
              </tr>
              <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button3' style="display:none"  type='button' class="botonR" 				
                        id='button3' 
                        onclick="javascript:exportarRA(2)" 
                        value='Exportar F2 Capacitaci&oacute;n Hist&oacute;tico' />
                &nbsp;</td>
              </tr>
              
            <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9">
                <fieldset>
          <legend class="criterio">Verificar </legend><br>
          <input type="radio" name="nivelObs" id="TD" value="9"   />
          <label for="9" class="etiqueta" >Todos</label>
          &nbsp;&nbsp;
          <input type="radio" name="nivelObs" id="SO" value="1"  />
          Correctos
          &nbsp;&nbsp;
          <input type="radio" name="nivelObs" id="CO" value="2"  checked="checked" /> 
          Observados
          <label for="2" class="etiqueta" ></label>
          
          <br><br>
                <input 
                        name='button2'  type='button' class="boton" 				
                        id='button2' 
                        onclick="javascript:ver_validacion()" 
                        value='Ver' /> &nbsp;&nbsp;
                <input 
                        name='button21'  type='button' class="boton" 				
                        id='button21' 
                        onclick="javascript:validacion_exportar()" 
                        value='Exportar' />
                        
                        <br>
                </fieldset><br>
                      <fieldset>
          <legend class="criterio">Seleciona </legend>
                        <br>
                        <input 
                        name='button3'  type='button' class="botonR" 				
                        id='button3' 
                        onclick="javascript:Guardar(2)" 
                        value='Selecci&oacute;n Global' /><br><br>
                        <input 
                        name='button3'  type='button' class="botonR" 				
                        id='button3' 
                        onclick="javascript:Guardar(1)" 
                        value='A&ntilde;adir Selecci&oacute;n' />
                  </fieldset>
                  
                        
                 </td>
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
          <div id="divDetallem" style="width:100%; height:360px; overflow:auto; float: left ; position: inherit; vertical-align:top;"> </div>
              
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
