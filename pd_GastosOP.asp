<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUsuario1=Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 




sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO ""2"" ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
Response.Write "<option title="""&wRsDptoapli(4)&""" value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(3) & "</option>"
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
	Response.Write " <option  value=""0"">Seleccione</option>"
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
   <link rel="shortcut icon" href="images/favicon.ico" />

<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script> 
<script type="text/javascript" src="js/main.js"></script> 
<link rel="stylesheet" href="Styles/main.css" type="text/css" />
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="Styles/inei.css">
<script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript"  src="js/envio_ajax.js"></script>
<script src="js/valida_fecha.js"></script>



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

function mostrarCombos(valor) {
	
	if (valor==1){
		 document.getElementById('trCapacita').style.display="";
		 document.getElementById('trDesembolso').style.display="none";
		 document.getElementById('trenvio').style.display="none";
	}else
	{
		document.getElementById('trCapacita').style.display="none";
		 document.getElementById('trDesembolso').style.display="";
		 document.getElementById('trenvio').style.display="";
		}
}

function generarDesembolso()
{
   var TipoGasto=document.getElementById("cmbTipoGasto").value; 
	if ( TipoGasto=='0')
     {
                  alert ("Seleccionar el Tipo de Gasto")
                  document.getElementById("cmbTipoGasto").focus();
                  return false
     }
	 
	if (TipoGasto==1){ 
	var desembolso=document.getElementById("cmbGastoCapa").value; 
	var envio=1;
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbGastoCapa").focus();
					  return false
		} 
	}else {
		var desembolso=document.getElementById("cmbDesembolso").value; 
		var envio=document.getElementById("cmbenvio").value; 	
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbDesembolso").focus();
					  return false
		}
		if ( envio=='0')
		 {
					  alert ("Seleccionar el Tipo de Envio")
					  document.getElementById("cmbenvio").focus();
					  return false
		}
	}
	
	var inicio=document.getElementById("txtfechaInicio").value; 	
	if ( inicio=='')
		 {
					  alert ("Seleccionar fecha de inicio")
					  document.getElementById("txtfechaInicio").focus();
					  return false
		}
		
	var fin=document.getElementById("txtfechaFin").value; 	
	if ( fin=='')
		 {
					  alert ("Seleccionar fecha fin")
					  document.getElementById("txtfechaFin").focus();
					  return false
		}
	

	ajax=http_request();

	 var valores="TipoGasto="+(TipoGasto)+"&desembolso="+desembolso+"&envio="+envio+"&inicio="+inicio+"&fin="+fin+"&lsTipo=88"; 
	 
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
             document.getElementById("divResultado").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				result=ajax.responseText;
				
				document.getElementById("divResultado").innerHTML=result;	
				
				if (result==2){
					document.getElementById("divResultado").innerHTML=" ";
					alert('Ya se genero el archivo de desembolso,  estado actual es cerrado');
					return false;
				} else if (result==1){
					alert('Se realizo la generacion del desembolso con exito');
					document.getElementById("divResultado").innerHTML=" ";	
					return false;				
					} else if (result==0){
					alert('No se genero el desembolso, no hay PEA pendidente de pago');
					document.getElementById("divResultado").innerHTML=" ";	
					return false;				
					} else if (result==3){
					alert('Se actualizo el archivo de desembolso');
					document.getElementById("divResultado").innerHTML=" ";	
					return false;				
					}				
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


function mostrarDesembolso()
{
   var TipoGasto=document.getElementById("cmbTipoGasto").value; 
	if ( TipoGasto=='0')
     {
                  alert ("Seleccionar el Tipo de Gasto")
                  document.getElementById("cmbTipoGasto").focus();
                  return false
     }
	 
	if (TipoGasto==1){ 
	var desembolso=document.getElementById("cmbGastoCapa").value; 
	var envio=1;
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbGastoCapa").focus();
					  return false
		} 
	}else {
		var desembolso=document.getElementById("cmbDesembolso").value; 
		var envio=document.getElementById("cmbenvio").value; 	
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbDesembolso").focus();
					  return false
		}
		if ( envio=='0')
		 {
					  alert ("Seleccionar el Tipo de Envio")
					  document.getElementById("cmbenvio").focus();
					  return false
		}
	}

	ajax=http_request();

	 var valores="TipoGasto="+(TipoGasto)+"&desembolso="+desembolso+"&envio="+envio; 

	url="m_gastosOp.asp";  
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

function exportarDesembolso(){
	
	   var TipoGasto=document.getElementById("cmbTipoGasto").value; 
	if ( TipoGasto=='0')
     {
                  alert ("Seleccionar el Tipo de Gasto")
                  document.getElementById("cmbTipoGasto").focus();
                  return false
     }
	 
	if (TipoGasto==1){ 
	var desembolso=document.getElementById("cmbGastoCapa").value; 
	var envio=1;
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbGastoCapa").focus();
					  return false
		} 
	}else {
		var desembolso=document.getElementById("cmbDesembolso").value; 
		var envio=document.getElementById("cmbenvio").value; 	
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbDesembolso").focus();
					  return false
		}
		if ( envio=='0')
		 {
					  alert ("Seleccionar el Tipo de Envio")
					  document.getElementById("cmbenvio").focus();
					  return false
		}
	}
	
	pagina = "m_gastosopexp.asp?TipoGasto="+(TipoGasto)+"&desembolso="+desembolso+"&envio="+envio;
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
	
	}
	
	
	
function limpiar()
{
   var TipoGasto=document.getElementById("cmbTipoGasto").value; 
	if ( TipoGasto=='0')
     {
                  alert ("Seleccionar el Tipo de Gasto")
                  document.getElementById("cmbTipoGasto").focus();
                  return false
     }
	 
	if (TipoGasto==1){ 
	var desembolso=document.getElementById("cmbGastoCapa").value; 
	var envio=1;
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbGastoCapa").focus();
					  return false
		} 
	}else {
		var desembolso=document.getElementById("cmbDesembolso").value; 
		var envio=document.getElementById("cmbenvio").value; 	
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbDesembolso").focus();
					  return false
		}
		if ( envio=='0')
		 {
					  alert ("Seleccionar el Tipo de Envio")
					  document.getElementById("cmbenvio").focus();
					  return false
		}
	}

	ajax=http_request();

	 var valores="TipoGasto="+(TipoGasto)+"&desembolso="+desembolso+"&envio="+envio+"&lsTipo=89"; 

	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					var resp=ajax.responseText;
					if (resp==2){
						alert('No se ha generado gasto Operativo');
						return false;
					}  else if (resp==1){
						alert('Los datos del gasto operativo no se pueden eliminar, se cerro proceso');
						return false;
						} else{
							alert('Se ha elminado los registros');
							document.getElementById("divResultado").innerHTML ="";
							}
					
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


function cerrarGasto()
{
   var TipoGasto=document.getElementById("cmbTipoGasto").value; 
	if ( TipoGasto=='0')
     {
                  alert ("Seleccionar el Tipo de Gasto")
                  document.getElementById("cmbTipoGasto").focus();
                  return false
     }
	 
	if (TipoGasto==1){ 
	var desembolso=document.getElementById("cmbGastoCapa").value; 
	var envio=1;
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbGastoCapa").focus();
					  return false
		} 
	}else {
		var desembolso=document.getElementById("cmbDesembolso").value; 
		var envio=document.getElementById("cmbenvio").value; 	
		if ( desembolso=='0')
		 {
					  alert ("Seleccionar el Tipo de Desembolso")
					  document.getElementById("cmbDesembolso").focus();
					  return false
		}
		if ( envio=='0')
		 {
					  alert ("Seleccionar el Tipo de Envio")
					  document.getElementById("cmbenvio").focus();
					  return false
		}
	}

	ajax=http_request();

	 var valores="TipoGasto="+(TipoGasto)+"&desembolso="+desembolso+"&envio="+envio+"&lsTipo=90"; 

	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					var resp=ajax.responseText;

					if (resp==2){
						alert('No se ha generado gasto Operativo');
						document.getElementById("divResultado").innerHTML ="";
						return false;
					}  else if (resp==1){
						alert('ya se cerro proceso de gastos operativos');
						document.getElementById("divResultado").innerHTML ="";
						return false;
						} else{
							alert('Se realizo el cierre con exito');
							document.getElementById("divResultado").innerHTML ="";
							}
					
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

function verificarFechas(){
		var lsFechainicio =document.getElementById("txtfechaInicio").value ;
		var lsFechaFin =document.getElementById("txtfechaFin").value ;
	
	  if (Compara_Menor(lsFechainicio,lsFechaFin) != false  )
						 {
							 
							alert("Fecha err\xf3nea, fecha fin menor a fecha de inicio");
							document.getElementById("txtfechaInicio").value=''
							document.getElementById("txtfechaFin").value=''
							document.getElementById("txtfechaInicio").focus();
							
						 }
						 
}	

</script>
    </head>
    <body>
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso: Generación de Gastos Operativos</span></div>
<div id="lateral">
        <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_GastosOP.asp">
        
        <table width='100%' border='1'   align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
          
          <tr><th colspan=2 ></th></tr>         
		  <tr>
		    <th colspan=2 class="aplicacion" bgcolor="#DAE8F3">Operaci&oacute;n de campo</th></tr>
          <tr>
            
		    <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios<span class="criterio">

		    <input name="cboReporte" type="hidden" id="cboReporte" value="4" />
		    <input name="txtRol" type="hidden" id="txtRol" value="<%=lsRol%>" />
			
	       <INPUT type="hidden" id=txtipusuario name=txtipusuario value="<%=ipVisitante%>">
           <INPUT type="hidden" id=txtusuario name=txtusuario value="<%=id_usuario%>">
           <INPUT type="hidden" id="lsubiprov"  name="lsubiprov" value="<%=lsUbigeoapli%>" >
           <INPUT type="hidden" id="lsubiDist" name="lsubiDist" value="<%=lsUbigeoDist%>">
			
		    </span></td>
		  </tr>
		  <tr border="1">
                <td width="31%" height="5%"  align=right bgcolor="#F7F8F9"><p><span class="criterio" >Tipo Gasto :</span></p></td>

                
                <td bgcolor="#F7F8F9" class='criterio'id="regPerPla">
                <select class='e_combo' name="cmbTipoGasto" id="cmbTipoGasto"  style="width:200px" onchange="mostrarCombos(this.value)">
					<option value="0" > Seleccione... </option>
                    <option value="1" > Capacitaci&oacute;n</option>
                    <option  value="2" >Operaci&oacute;n de Campo </option>
                </select>
                </td>	
          </tr>
          <tr id="trCapacita" style="display:none">
              <td class="etiqueta" width="31%" align="right"><span class="criterio">Desembolso:<font class="alerta5">(*)</font></span></td>
              <td><span class="criterio">
              <select class='e_combo' name="cmbGastoCapa" id="cmbGastoCapa"  style="width:150px">
                  <option title="Todos" value="0" > Seleccione... </option>
                  <option title="Todos" value="1" > Titulares</option>
                  <option title="Todos" value="2" > No seleccionados</option>
                  <option title="Todos" value="3" > Tercera Capac.</option>
              </select>
              </span></td>
          </tr>
              <tr id="trDesembolso" style="display:none">
              <td class="etiqueta" width="31%" align="right"><span class="criterio">Desembolso:<font class="alerta5">(*)</font></span></td>
              <td><span class="criterio">
                <select class='e_combo' name="cmbDesembolso" id="cmbDesembolso"  style="width:150px">
                  <option value="0" > Seleccione... </option>
                  <option value="1" > Primer Desembolso</option>
                  <option value="2" > Segundo Desembolso</option>
                  <option value="3" > Tercer Desembolso</option>
                  <option value="4" > Cuarto Desembolso</option>
                  <option value="5" > Quinto Desembolso</option>
                  <option value="6" > Sexto Desembolso</option>
                  <option value="7" > Septimo Desembolso</option>
                  <option value="8" > Octavo Desembolso</option>
                  <option value="9" > Noveno Desembolso</option>
                  <option value="10" > Decimo Desembolso</option>
                  <option value="11" > Decimo primer Desembolso</option>
                  <option value="12" > Decimo Segundo Desembolso</option>
                  <option value="13" > Decimo Tercero Desembolso</option>
                  <option value="14" > Decimo Cuarto Desembolso</option>
                  <option value="15" > Decimo Quinto Desembolso</option>
                  <option value="16" > Decimo Sexto Desembolso</option>
                  <option value="17" > Decimo Septimo Desembolso</option>
                  <option value="18" > Decimo Octavo Desembolso</option>
                  <option value="19" > Decimo Noveno Desembolso</option>
                  <option value="20" > Vigesimo Desembolso</option>
                  <option value="21" > Vigesimo Primer Desembolso</option>
                  <option value="22" > Vigesimo Segundo Desembolso</option>
                  <option value="23" > Vigesimo Tercero Desembolso</option>
                  <option value="24" > Vigesimo Cuarto Desembolso</option>
                  <option value="25" > Vigesimo Quinto Desembolso</option>
                  
                </select>
              </span></td>
              </tr>
               <tr id="trenvio" style="display:none">
              <td class="etiqueta" width="31%" align="right"><span class="criterio">Envío:<font class="alerta5">(*)</font></span></td>
              <td><span class="criterio">
                <select class='e_combo' name="cmbenvio" id="cmbenvio"  style="width:150px">
                  <option value="0" > Seleccione... </option>
                  <option value="1" > Primer Env&iacute;o</option>
                  <option value="2" > Segundo Env&iacute;o</option>
                  <option value="3" > Tercer Env&iacute;o</option>
                  <option value="4" > Cuarto Env&iacute;o</option>
                  <option value="5" > Quinto Env&iacute;o</option>
                  <option value="6" > Sexto Env&iacute;o</option>
                  <option value="7" > Septimo Env&iacute;o</option>
                  <option value="8" > Octavo Env&iacute;o</option>
                  <option value="9" > Noveno Env&iacute;o</option>
                  <option value="10" > Decimo Env&iacute;o</option>
                  <option value="11" > Decimo primer Env&iacute;o</option>
                  <option value="12" > Decimo segundo Env&iacute;o</option>
                  <option value="13" > Decimo tercero Env&iacute;o</option>
                  <option value="14" > Decimo cuarto Env&iacute;o</option>
                  <option value="15" > Decimo quinto Env&iacute;o</option>
                </select>
              </span></td>
              </tr>
              <tr  >
              <td class="etiqueta" width="31%" align="right"><span class="criterio">Fecha Inicio:</span></td>
              <td><span class="etiqueta">
                <input name="txtfechaInicio" type="text" class="e_input" id="txtfechaInicio"  size="10" maxlength="10" />
              </span></td>
              </tr>
              <tr >
              <td class="etiqueta" width="31%" align="right"><span class="criterio">Fecha Inicio:</span></td>
              <td><span class="etiqueta">
                <input name="txtfechaFin" type="text" class="e_input" id="txtfechaFin" onblur="verificarFechas()" size="10" maxlength="10" />
              </span></td>
              </tr>

                <input type="hidden" name="txtactivoc" id="txtactivoc" class="e_input_text" />


                <input type="hidden" name="txtFlagPagoCom" id="txtFlagPagoCom" class="e_input_text" />
              
               <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">

     
                </td>
              </tr>
			  
              <tr>
                <th colspan=2 class="aplicacion" bgcolor="#DAE8F3">Procesos</th></tr>

			  <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">
                <INPUT name='button1' type='button' class="botonCerrar" id='button1' onClick="javascript:generarDesembolso()" value='Generar'></td>
              </tr>
              
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">
                <INPUT name='button2' type='button' class="botonCerrar" id='button2' onClick="javascript:mostrarDesembolso()" value='Mostrar'>&nbsp;&nbsp;<INPUT name='button3' type='button' class="botonCerrar" id='button3' onClick="javascript:exportarDesembolso()" value='Exportar'></td>
              </tr>
			  <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">
               <INPUT name='button4' type='button' class="botonCerrar" id='button4' onClick="javascript:limpiar()" value='Limpiar' >&nbsp;&nbsp;
               <INPUT name='button5' type='button' class="botonCerrar" id='button5' onClick="javascript:cerrarGasto()" value='Cerrar  Apertura' >
                </td>
              </tr>
              <tr>
		    <th colspan=2 class="aplicacion" bgcolor="#DAE8F3">Personal Administrativo</th></tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">
                <INPUT name='button2' type='button' class="botonCerrar" id='button2' onClick="javascript:mostrarDesembolso()" value='Mostrar'>&nbsp;&nbsp;<INPUT name='button3' type='button' class="botonCerrar" id='button3' onClick="javascript:exportarDesembolso()" value='Exportar'></td>
              </tr>
			  
			  
               <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"></td>
              </tr>	     
            </table>
    </form>
    </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" style="margin:0;height:90%;" align="center" ></div>
		  <div id="divProceso"></div>
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
