<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%

idProyecto=Session("id_proyecto")

sub generaDpto()
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD_UBI12 '"&lsUbigeo&"'"
	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option  value=""99"">Seleccione</option>"
	While not wRsDptoapli.EOF
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5""> </span>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaCargo()
			
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoAsignacion '"&idProyecto&"' ")

	
	Response.Write "<select class=""e_combo"" style=""width:210px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option value=""999"">Seleccione</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(4)&""" value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(3) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

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
	
	url="m711_ProvinciaAR.asp";  
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
	
	url="m71_DistritoAR.asp";  
	
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
	var id_per=lvalor[0];
	var id_Contratos=lvalor[1];
	var id_Asignacion=lvalor[2];
	var ruta=lvalor[3];
	var total=lvalor[4];
	var estado=lvalor[5];
		
	document.getElementById("rutaA").innerHTML=ruta;
	document.getElementById("totalA").innerHTML=total;
	document.getElementById("estadoA").innerHTML=estado;
}

function  Mostrar2(valor){
	
var lsvalor = valor;
	var lvalor=lsvalor.split("*");
	var id_per=lvalor[0];
	var id_Contratos=lvalor[1];
	var id_Asignacion=lvalor[2];
	var ruta=lvalor[3];
	var total=lvalor[4];
	var estado=lvalor[5];
		
	document.getElementById("rutaB").innerHTML=ruta;
	document.getElementById("totalB").innerHTML=total;
	document.getElementById("estadoB").innerHTML=estado;
}
	
	
function  cambiarRuta(tipo){
	
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
	
	var lsPEA2=PEA2.split("*");
	var id_per2=lsPEA2[0];
	var id_Contratos2=lsPEA2[1];
	var id_Asignacion2=lsPEA2[2];

	var url;

	ajax=http_request();
	var valores;	
	valores= "id_per1=" + escape(id_per1)+"&id_Contratos1="+escape(id_Contratos1)+"&id_Asignacion1="+escape(id_Asignacion1)+"&id_per2="+escape(id_per2)+"&id_Contratos2="+escape(id_Contratos2)+"&id_Asignacion2="+escape(id_Asignacion2)+"&tipo="+escape(tipo)  +"&lsTipo=92";  // parametros a enviar al servidor	

url="m_ingreso.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					alert('El cambio se realizo con exito')
				  verdatos()
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
                <span class="criterio">
                <input name="txtRol" type="hidden" id="txtRol" value="<%=lsRol%>" />
                <input name="cboReporte" type="hidden" id="cboReporte" value="5" />
                <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
            <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                </span></td> </tr>
                <tr>
                <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">&nbsp;</td></tr>
             
              <tr>
                <td width="35%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
                Cargo:&nbsp;</span></td>
                <td width="65%"  align=left bgcolor="#F7F8F9" ><span class="criterio"><span class="alerta5">
                  <%generaCargo()%>
                </span></span></td>
              </tr>
              <tr>
                <td  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomreg">Departamento:&nbsp; </span></td>
                <td  align=left bgcolor="#F7F8F9" id="dpto"><%generaDpto()%></td>
              </tr>
              <tr>
                <td  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdis">Provincia:&nbsp;</span></td>
                <td  align=left bgcolor="#F7F8F9" id="reg2" ><select class='e_combo'   name="txtProv1" id="txtProv1"   style="width:200px; "  >
                  <option  title="Todos" value="9999" >Seleccione...</option>
                </select></td>
              </tr>
              <tr> 
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                <td  align="left" bgcolor="#F7F8F9"  id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1" style="width:200px;"  >
                  <option  title="Todos" value="999998" >Seleccione...</option>
                </select></td>
              </tr>
             
              <tr> 
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Tipo:</span></td>
                <td  align="left" bgcolor="#F7F8F9"  id="dis2"><select class='e_combo' name="txtTipo" id="txtTipo" style="width:200px;"  >
                  <option  title="Todos" value="" >Seleccione...</option>
                  <option  title="Rotacion de Rutas" value="1" >Rotacion de Rutas</option>
                  <option  title="Rotacion de Rutas" value="2" >De Titular a reserva</option>
                  <option  title="Rotacion de Rutas" value="2" >De Baja a reserva</option>

                </select></td>
              </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><p>&nbsp;</p>
                <p>&nbsp; </p></td>
              </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><p>
                  <input name='button1' type='button' class="boton" id='button1' onclick="javascript:verdatos()" value='Aceptar' />
                </p>
                <p>&nbsp; </p></td>
              </tr>
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
