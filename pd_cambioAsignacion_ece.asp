<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%

idProyecto=Session("id_proyecto")

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_cargoAsignaRutas_ece '"&id_proyecto&"' ")
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" >"
	
	Response.Write " <option value=""900"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='"&wRsDptoapli(4)&" - Actividad: "&wRsDptoapli(5)&"'   value=""" &wRsDptoapli(0)& """>" &wRsDptoapli(3) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaRegion()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.pa_sede_ece '"&sedeReg&"' "

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


Response.Expires = 0

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario1 =  Session("txtNombreValido")
lsUsuario =  Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoApli = Session("Ubigeoapli") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")
lsUbigeoDist = Session("UbigeoDist") 

sedeReg=session("sedeReg") 
sedeProv=session("sedeProv") 
sedeDist=session("sedeDist") 


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

	

function generaprov(){
     
      var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m_Provincia_ece.asp";  
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
	
	url="m_Distrito_ece.asp";  
	
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
	
	
function verdatos(){
	
			  if(document.frmMiForm.cmbCargo.value == '999' )
		 {
			 alert("Selecciona el Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 } 
			 
			 if(document.frmMiForm.txtDpto1.value == '99' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
				 if(document.frmMiForm.txtProv1.value == '9999' )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtProv1.focus();
			 return false;
			 
			 } 
			 
	 
			 	 if(document.frmMiForm.txtDist1.value == '999999' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			 if(document.frmMiForm.txtDist1.value == '999999' )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDist1.focus();
			 return false;
			 
			 } 
			 
			  if(document.frmMiForm.txtTipo.value == '' )
		 {
			 alert("Selecciona tipo de modificaci\xf3n de ruta");
			 document.frmMiForm.txtTipo.focus();
			 return false;
			 
			 } 
		

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsUsuario = document.frmMiForm.usuario.value;
		 var lsRol = document.frmMiForm.txtRol.value;
		 var Cargo = document.frmMiForm.cmbCargo.value.substring(1);
		 var tipo = document.frmMiForm.txtTipo.value;

		var url;
  

	ajax=http_request();
	var valores;	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsUsuario="+escape(lsUsuario)+"&lsCargo="+escape(lsCargo)+"&lsRol="+escape(lsRol)+"&tipo="+escape(tipo);  // parametros a enviar al servidor	

url="m_cambioAsignacion.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
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


function  Mostrar1(valor){
		
var lsvalor = valor;
	var lvalor=lsvalor.split("*");
	var idreg=lvalor[0];
	var id_per=lvalor[1];
	var dni=lvalor[2];
	var nombres=lvalor[3]+' '+lvalor[4]+' '+lvalor[5];
	var total=lvalor[6];
	var ie=lvalor[7];
	var ruta=lvalor[8]

		
	document.getElementById("personaA").innerHTML=nombres;
	document.getElementById("rutaA").innerHTML=ruta;
	document.getElementById("ieA").innerHTML=ie;
	document.getElementById("totalA").innerHTML=total;
}

function  Mostrar2(valor){
	
var lsvalor = valor;
	var lvalor=lsvalor.split("*");
	var idreg=lvalor[0];
	var id_per=lvalor[1];
	var dni=lvalor[2];
	var nombres=lvalor[3]+' '+lvalor[4]+' '+lvalor[5];
	var total=lvalor[6];
	var ie=lvalor[7];
	var ruta=lvalor[8]

		
	document.getElementById("personaB").innerHTML=nombres;
	document.getElementById("rutaB").innerHTML=ruta;
	document.getElementById("ieB").innerHTML=ie;
	document.getElementById("totalB").innerHTML=total;
}
	
	
function  cambiarRuta(tipo){
	
	var motivo = document.getElementById("txtCambio").value;
	
	if (motivo==0){
		alert ('Seleccione motivo de cambio de rutas');
		document.getElementById("txtCambio").focus();
		return false 	
	}
	
	var PEA1 = document.getElementById("txtPEA1").value;
	var PEA2 = document.getElementById("txtPEA2").value;
	
	if (PEA1==PEA2){
		alert('Selecciono la misma persona para el cambio, verificar');
		return false;
		}
	
	var lsPEA1=PEA1.split("*");
	var id_per1=lsPEA1[0];
	var id_Contratos1=lsPEA1[1];
	var id_Asignacion1=lsPEA1[2];
	
	var lsPEA1=PEA1.split("*");
	var idreg1=lsPEA1[0];
	var id_per1=lsPEA1[1];
	var dni1=lsPEA1[2];
	var ape_pat1=lsPEA1[3];
	var ape_mat1=lsPEA1[4];
	var nombres1=lsPEA1[5];
	var total1=lsPEA1[6];
	var ie1=lsPEA1[7];
	var ruta1=lsPEA1[8]
	
	var lsPEA2=PEA2.split("*");
	var idreg2=lsPEA2[0];
	var id_per2=lsPEA2[1];
	var dni2=lsPEA2[2];
	var ape_pat2=lsPEA2[3];
	var ape_mat2=lsPEA2[4];
	var nombres2=lsPEA2[5];
	var total2=lsPEA1[6];
	var ie2=lsPEA2[7];
	var ruta2=lsPEA2[8]

	var url;

	ajax=http_request();
	var valores;	
	valores= "idreg1=" + escape(idreg1)+"&id_per1=" + escape(id_per1)+"&dni1="+escape(dni1)+"&ape_pat1="+escape(ape_pat1)+"&ape_mat1="+escape(ape_mat1)+"&nombres1="+escape(nombres1)+"&idreg2="+escape(idreg2)+"&id_per2="+escape(id_per2)+"&dni2="+escape(dni2)+"&ape_pat2="+escape(ape_pat2)+"&ape_mat2="+escape(ape_mat2)+"&nombres2="+escape(nombres2)+"&motivo="+escape(motivo)+"&lsTipo=144";  // parametros a enviar al servidor	


url="m_ingreso.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
				if (ajax.responseText==1){
					alert('El cambio se realizo con exito');
						ver_asignacion_ece(3); 
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
	
	

 function cierreRutas_ece() {
	 
	  for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
      {
          if (document.frmMiForm.nivelRRHH[i].checked == true)
           { lsnivel=document.frmMiForm.nivelRRHH[i].value;
           }
       }
	   
	   	 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lsubidist = document.frmMiForm.lsubidist.value;

			if (lsDPTO=='99'){
				alert('Seleccione la Sede Regional');
				document.frmMiForm.txtDpto1.focus();
				return false
			}
			if (lsPROV=='9999'){
				alert('Seleccione la Sede Provincia');
				document.frmMiForm.txtProv1.focus();
				return false
			}
		
			if (lsubidist!="999999" && lsDIST=="9999999" ){
				alert('Seleccione la Sede Distrital');
				document.frmMiForm.txtDist1.focus();
				return false
				}

		if(document.frmMiForm.cmbCargo.value == '900' )
		 {
			 alert("Selecciona el combo del Cargo");
			 document.frmMiForm.cmbCargo.focus();
			 return false;
		}
		 	 
			 
	ajax=http_request();
	var valores;	
	
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsnivel="+escape(lsnivel)+"&tipo="+escape(tipo)+'&lsTipo=145'; // parametros a enviar al servidor	
	
		url="m_ingreso.asp";  
	
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
              //   document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){

					alert ('Se realizo el cierre con exito');
            }
            else if(ajax.status==404){
                     document.getElementById("divResultado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
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
    <body>
        <div id="top">
           <!--#include file="cabecera.html"-->
	       <!--#include file="pd_menu.asp"-->

       </div> 
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso: Modificaci&oacute;n de Rutas</span></div>
        <div id="lateral">
            <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
      
    <table width='105%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios
                <input name="usuario" type="hidden" id="usuario" value="<%=lsUsuario%>" />
                <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
                <span class="criterio">
                <input name="txtRol" type="hidden" id="txtRol" value="<%=lsRol%>" />
                <input name="lsRol" type="hidden" id="lsRol" value="<%=lsRol%>" />
                <input name="cboReporte" type="hidden" id="cboReporte" value="5" />
                <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
            <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                </span></td> </tr>
                <tr>
                <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">&nbsp;</td></tr>
             
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9"><fieldset>
          <legend class="criterio">&nbsp;&nbsp; Seleccione Tipo Operativo:</legend><br>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="nivelRRHH" id="RA" value="1" />
          <label for="1" class="etiqueta">PRIMARIA</label>
          &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="nivelRRHH" checked="checked" id="RO" value="2"  />
          <label for="2" class="etiqueta" >SECUNDARIA</label>&nbsp;&nbsp;&nbsp;
                </fieldset></td>
		      </tr> 
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Regional:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaRegion()%></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Sede Provincial:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                  <option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
                </select></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Distrital:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                  <option id="txtDist1" 	title="Todos" value="9999999" >Todos </option>
                </select></td>
              </tr>
              <tr id="cargo1">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Cargo:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaCargo()%>
                  <span class="alerta5">(*)</span></td>
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
              <tr> 
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Tipo:</span></td>
                <td  align="left" bgcolor="#F7F8F9"  id="dis2"><select class='e_combo' name="txtTipoRot" id="txtTipoRot" style="width:200px;"  >
                  <option  title="Todos" value="" >Seleccione...</option>
                  <option  title="Entre Titulares" value="1" >Entre titulares</option>
                  <option  title="Rotacion de Rutas" value="2" >De Titular a reserva</option>
                </select></td>
              </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><p>
                  <input name='button1' type='button' class="boton" id='button1' onclick="javascript:ver_asignacion_ece(3)" value='Aceptar' /></td>
              </tr>
              
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><p>
                  <input name='button1' type='button' class="boton" id='button1' onclick="javascript:ver_reporteCambio_ece(1)" value='Reporte' /></td>
              </tr>
              
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><p>
                  <input name='button1' type='button' class="botonR" id='button1' onclick="javascript:ver_reporteCambio_ece(2)" value='Reporte Nacional' /></td>
              </tr>
         <% if lsRol=31 then %>
              
  <tr height=22 bgcolor="#DFEEFD">
                <td colspan="2" align="left" >
                <fieldset>
          <legend class="criterio">&nbsp;&nbsp; Proceso de Cierre: &nbsp;&nbsp; </legend><br>
                <span class="criterio">Tipo Cierre:</span>&nbsp;
                <select class='e_combo' name="txtCierre" id="txtCierre"  style="width:150px">
                <option id="txtProv1" title="Todos" selected value="0" >Seleccione... </option>
                  <option id="txtProv1" title="Todos" value="1" > Cerrar Nacional </option>
                  <option id="txtProv1" title="Todos" value="2" > Abrir Nacional </option>
                  <option id="txtProv1" title="Todos" value="3" > Cerrar en Ubigeo Actual </option>
                  <option id="txtProv1" title="Todos" value="4" > Abrir en Ubigeo Actual </option>
                </select><br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onclick="javascript:procesarCierre_ece(6)" 
                        value='Procesar'>
                        
                 </fieldset>       </td>
              </tr> 
              <%end if%>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">&nbsp;</td>
              </tr>
            </table>
    </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
            <div id="divResultado" style="height:350px" align="center">   </div>
              <div id="mostar_detalle2" style="display:none"  >
                <table width="100%" border="0">
				  <tr>
				    <td align="center"><form action="reporte.asp" method="post" target="_blank" id="FormularioExportacion">
                      <div align="center" style="padding:5px,5px,5px,5px;"><img src="images/excell1.gif" alt="" class="botonExcel" title="EXPORTAR A EXCEL" /></div>
                      <input type="hidden" id="datos_a_enviar" name="datos_a_enviar" />
                    </form></td>
			      </tr>
				  <tr>
				    <td align="center"><span class="criterio">(Exportar Excel)</span></td>
			      </tr>
			    </table></div>
            <div id="mensaje" style="width:100%; float:left; position:inherit; vertical-align:top;"> </div>
            <iframe id="iframe" width="100%" height="100%" src="" frameborder="0"></iframe>
            </div>
        </div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario1%> </span>
        </div>

        <!-- scripts -->
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
