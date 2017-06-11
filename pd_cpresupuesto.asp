<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.ContentType="text/html; charset=iso-8859-1"

 id_rolUsuario=Session("txtTipoUsuarioValido")
 
sub generaActividad()

	set wRsDptoapli = Micone.execute(" exec uspGet_ActividadPresupuestal")
	Response.Write "<select class=""e_combo"" style=""width:260px"" id=""cmbActividad"" name=""cmbActividad""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title ="""&wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaFuenteFTO()

	set wRsDptoapli = Micone.execute(" exec pa_fuentefto_listar")
	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""cmbftto"" name=""cmbftto""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title ="""&wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(2) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaFuncional()
			
	set wRsDptoapli = Micone.execute(" exec  getTodoFuncional ")
	Response.Write "<select class=""e_combo"" style=""width:260px"" id=""txtNombre"" name=""txtNombre""  >"
	Response.Write " <option value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title ="""&wRsDptoapli("desc_CargoFuncional") & """ value=""" & wRsDptoapli("id_Cargofuncional") & """>"&wRsDptoapli("desc_CargoFuncional") & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub
sub generaCargo()

	set wRsDptoapli = Micone.execute(" exec getCargoSiga")
	Response.Write "<select class=""e_combo"" style=""width:260px"" id=""cmbCargo"" name=""cmbCargo""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" &""" value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" & "</option>"
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
   
		<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/main.js"></script> 
        <script type="text/javascript"  src="js/cliente.js"></script>
		<script type="text/javascript"  src="js/envio_ajax.js"></script>
		<script type="text/javascript"  src="js/valida.js"></script>
        
        <link rel="stylesheet" href="css/demos.css">
    	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
        <link rel="shortcut icon" href="images/favicon.ico" />
		
        <style>
		input.text { margin-bottom:12px; width:95%; padding: .4em; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
		</style>
    
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
function mod_pres(id_presDet,valor,campo, id_presupuesto)
{
	div=campo+id_presDet;

	ajax=http_request();
	var valores;	
	valores= "lsid_presDet=" + escape(id_presDet)+"&lsvalor="+valor+"&lsCampo="+campo+"&lsId_presupuesto="+id_presupuesto+"&lsTipo=53";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById(div).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            	document.getElementById(div).innerHTML =ajax.responseText;
				document.getElementById("txtp"+id_presDet).focus();
            }
            else if(ajax.status==404){
                document.getElementById(div).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                document.getElementById(div).innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}



function grabar_ModPres(lsid, valor_nuevo,lsVal_antiguo,lsCampo,div,lsId_presup)
{
	
	lsdiv=lsCampo+lsid;
	usuario=document.getElementById("txtUsuario").value;
	ajax=http_request();
	var valores;	
	id_proyecto=document.getElementById("txtactividad").value;
	
	
//	valores= "lsId_presupueto=" + escape(lsid)+"&lsvalor="+valor_nuevo+"&lsCampo="+lsCampo+"&lsdiv="+lsdiv+"&lsUsuario="+usuario+"&lsTipo=54";  // parametros a enviar al servidor	
	
	
//	if ( id_proyecto == 206 || id_proyecto == 211 )	{
	valores= "lsId_presupueto=" + escape(lsid)+"&lsvalor="+valor_nuevo+"&lsCampo="+lsCampo+"&lsdiv="+lsdiv+"&lsUsuario="+usuario+"&lsTipo=175";  // parametros a enviar al servidor	
//	}
	
	
	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById(lsdiv).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            	id=ajax.responseText;
				VerDet_pres(lsId_presup)		
            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divCriterio").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}
/*
function grabar_ModPres(lsid, valor_nuevo,lsVal_antiguo,lsCampo,div,lsId_presup)
{
	
	lsdiv=lsCampo+lsid;
	usuario=document.getElementById("txtUsuario").value;
	ajax=http_request();
	var valores;	
	valores= "lsId_presupueto=" + escape(lsid)+"&lsvalor="+valor_nuevo+"&lsCampo="+lsCampo+"&lsdiv="+lsdiv+"&lsUsuario="+usuario+"&lsTipo=54";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById(lsdiv).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            	id=ajax.responseText;
				VerDet_pres(lsId_presup)		
            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divCriterio").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}*/

function MostrarPresupuestos()
{	
document.getElementById("divC").style.display="";
	var valores="";
	var peticion=$.ajax(
		{
	     url:'pd_ListarPresupuesto.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			  $("#divCriterio").html("Cargando...");
							  },
		success:function (respuesta) {
	          $('#divCriterio').html(respuesta);
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#divCriterio").html(""); 
      }
  }
  );
}	


function VerDet_pres(id_presupuesto)
{	
	var valores="id_presupuesto="+id_presupuesto;
	var peticion=$.ajax(
		{
	     url:'pd_ListarPresupuestoDet.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			  $("#divCriterio").html("Cargando...");
							  },
		success:function (respuesta) {
			document.getElementById("divC").style.display="None";
	          $('#divCriterio').html(respuesta);
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#divCriterio").html(""); 
      }
  }
  );
}


function agregar_presDet(id_presupuesto, sueldo)
{
	var total_pea=document.getElementById("txtcantDET").value;
	var n_periodo=document.getElementById("txtnperiodoDET").value;
	var periodo=document.getElementById("cmbperiodoDet").value;
	var armadas=document.getElementById("txtArmadas").value;
		
	var id_presupuesto=id_presupuesto
	var sueldo=sueldo
		
	if (total_pea==""){
		alert('Registre la cantidad de PEA a agregar al presupuesto')
		return false;
		}
	
	if (n_periodo==""){
		alert('Registre el periodo de lo presupuestado')
		return false;
		}	
	
	if (periodo==""){
		alert('Registre el tipo de periodo de lo presupuestado')
		return false;
		}		
		
if (armadas==""){
		alert('Registre la cantidad de Armadas')
		return false;
		}				
	
	ajax=http_request();
	var valores;	
	valores= "armadas="+escape(armadas)+"&total_pea=" + escape(total_pea)+"&n_periodo="+n_periodo+"&periodo="+periodo+"&id_presupuesto="+id_presupuesto+"&sueldo="+sueldo+"&lsTipo=113";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divTotal").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				VerDet_pres(id_presupuesto)
				//document.getElementById("divTotal").innerHTML = ajax.responseText;
            }
            else if(ajax.status==404){
                document.getElementById("divTotal").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divTotal").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function editar_presupuesto (flag) {

	document.getElementById("div_1").style.display="none";
	document.getElementById("div_2").style.display="none";
	document.getElementById("div_3").style.display="none";
	document.getElementById("div_4").style.display="none";
	document.getElementById("div_5").style.display="none";
	
	document.getElementById("td_1").style.background="#FFFFFF";
	document.getElementById("td_2").style.background="#FFFFFF";
	document.getElementById("td_3").style.background="#FFFFFF";
	document.getElementById("td_4").style.background="#FFFFFF";
	document.getElementById("td_5").style.background="#FFFFFF";
	
	
	document.getElementById("div_"+flag).style.display="";
	document.getElementById("td_"+flag).style.background="#FFF9F9";
}

function guardar_editar (id_presupuesto, id_usuario, ip_usuario, flag) {
	
	valor_act=document.getElementById("txtdiv_"+flag).value;
	
	if (valor_act==""){
		alert('Seleccione una opci\xf3n antes de realizar el cambio');
		return false;
	}
	
	ajax=http_request();
	var valores;	
	valores= "id_presupuesto=" + escape(id_presupuesto)+"&id_usuario="+escape(id_usuario)+"&ip_usuario="+escape(ip_usuario)+"&valor_act="+escape(valor_act)+"&flag="+escape(flag)+"&lsTipo=119";  // parametros a enviar al servidor
		
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {

         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				val=ajax.responseText;
				
				if (val==1) {
					alert('La actualizaci\xf3n se realiz\xf3 correctamente.');
					VerDet_pres(id_presupuesto);
				}
				else if (val==2) {
					alert('No se puede realizar el cambio, el cargo ya fu\xe9 publicado en una convocatoria');
					return false;
				}
				else if (val==3) {
					alert('No se puede realizar el cambio, el cargo ya fu\xe9 certificado');
					return false;
				} else {
					alert('ERROR EN LA ACTUALIZACI\xd3N DE DATOS DEL PRESUPUESTO')
					}
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





function EliminarReg (id_presupuesto) {
	
	if(!confirm("Estas seguro de Eliminar el Presupuesto"))
	{ return; }
	
	ajax=http_request();
	var valores;	
	valores= "id_presupuesto=" + escape(id_presupuesto)+"&lsTipo=155";  // parametros a enviar al servidor
		
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {

         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				val=ajax.responseText;
				
				if (val==1) {
					alert('La actualizaci\xf3n se realiz\xf3 correctamente.');
					MostrarPresupuestos();
				}
				else if (val==2) {
					alert('No se puede realizar el cambio, el cargo ya fu\xe9 publicado en una convocatoria');
					return false;
				}
				else if (val==3) {
					alert('No se puede realizar el cambio, el cargo ya fu\xe9 certificado');
					return false;
				} else {
					alert('ERROR EN LA ACTUALIZACI\xd3N DE DATOS DEL PRESUPUESTO')
					}
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
    </head>
    <body  onLoad="MostrarPresupuestos()">
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
    <div id="formulario" >
	  <div id="divNavegacion" align="center"><span class="subtitulo">Registro: CARGOS PRESUPUESTADOS DE LA PEA</span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
  <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">
   
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <tr>
 	      <th colspan="6" class="aplicacion" bgcolor="#DAE8F3"><span class="dato">
 	        <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           </span></th>
 	      <tr>
 	        <td colspan="6"   class='etiqueta'> <span class="alerta5">(*) Datos Obligatorios</span></td>
 	        </tr>
 	         <tr>
 	           <td class='etiqueta'>Actividad Presupuestal</td>
 	           <td class='etiqueta'><font class='alerta5'>
 	             <%generaActividad()%>
                </font></td>
 	           <td class='etiqueta'>Fuente de Finaciamiento</td>
 	           <td width="255" class='etiqueta'><%generaFuenteFTO()%><font class='alerta5'>(*)<font class='alerta5'>
                 <input name="tcontrato" type="hidden" id="tcontrato" value="03" />
                </font></font></td>
 	           <td width="127" class='etiqueta'>Nivel de RRHH</td>
 	           <td width="197" class='etiqueta'><select name="cmbnivel" class="e_combo" id="cmbnivel">
 	             <option value="0">Seleccione</option>
 	             <option title="Red T&eacute;cnica Administrativa" value="3">RTA</option>
 	             <option title="Red Administrativa Operativa" value="1">RAO</option>
 	             <option title="Red Operativa" value="2">RO</option>
 	             </select>
                <font class='alerta5'>(*)</font></td>
              </tr>
 	         <tr>
 	      <td width="148" class='etiqueta'>Cargo Funcional<font class="alerta5">&nbsp;</font></td>
 	      <td width="280" class='etiqueta'><font class='alerta5'>
 	        <%generaFuncional()%>
          </font><font class='alerta5'>(*) </font><font class='alerta5'><input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=Session("id_Usuario")%>">
 	        </font></td>
 	      <td width="152" class='etiqueta'>Cargo Contrataci&oacute;n</td>
 	      <td colspan="3" class='etiqueta'><%generaCargo()%>
 	        <font class='alerta5'>(*) 	        </font></td>
 	      </tr>
         
 	    <tr>
 	      <td class='etiqueta'>Total Pea</td>
 	      <td class='etiqueta'><input name="txtcant" type="text" class="e_td_number" id="txtcant" onkeypress="return TextUtil.allowChars(this, event)" size="5" maxlength="5" validchars="1234567890"/>
            <font class='alerta5'>(*)</font></td>
 	      <td class='etiqueta'>Periodo</td>
 	      <td colspan="3" class='etiqueta'><input name="txtnperiodo" type="text" class="e_td_number" id="txtnperiodo" onkeypress="return TextUtil.allowChars(this, event)" size="5" maxlength="5" validchars="1234567890." />
 	        <select name="cmbperiodo" class="e_combo" id="cmbperiodo">
 	          <option value="0">Seleccione</option>
 	          <option value="1">D&iacute;a</option>
 	          <option value="2">Mes</option>
 	          </select>
 	        <font class='alerta5'>(*)</font></td>
 	      </tr> 
 	    <tr>
 	      <td colspan="6" align="center">
           <%IF id_rolUsuario=1 or id_rolUsuario=7  or id_rolUsuario=6 THEN%>
          <input name="button"  type="button" class="boton" id="button" value="Grabar" onclick="enviar_Presu()" /> 	        
          <%END IF%>
 	      <span class="etiqueta"><span class="alerta4">
 				<!--<a href="pd_conPresupuesto.asp?lstipoReport=1" target="_blank" class="criterio">Detalle</a></span> -->
 				Detalle</span>
 	      <font class='alerta5'><img src="images/ventana.png" alt="" border="0" style="CURSOR: hand" onclick="window.open('pd_conAdministrativaDetalle.asp?lstipoReport=1&amp;wwwHora=<%=time()%>','','top=10,left=25,scrollbars=yes,width=880,height=700,resizable=1')" />&nbsp;&nbsp;
 	      </font></span></td>
 	      </tr>

 	    </table>
 	</div>	
		</td>
	</tr>	
	</table>              				    	    				    
  
	</form>
     <div id="divC" style="vertical-align:top; overflow:auto; height:100%; width:98.48%; display:""; " >
     <% 	  
	   response.Write " <table align=""center"" width=""90%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write "<tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
    response.Write "<td width=""2%"">N&deg;</td>"
    response.Write "<td width=""35%"">Cargo Funcional</td>"
    response.Write "<td width=""38%"">Cargo de Contrataci&oacute;n</td>"
	response.Write "<td width=""5%"">Sueldo</td>"
	response.Write "<td width=""5%"" align=""center"" >PEA</td>"
	response.Write " <td width=""10%"">Monto Total</td>"
    response.Write " <td width=""7%"">Detalle</td>"
    response.Write "  </tr>"
	response.Write "  </table>" %>
     </div>
      <div id="divCriterio" style="vertical-align:top; overflow:auto; height:250px;" >
	 </div>  
</div><BR>
        <div id="footer" align="right">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
