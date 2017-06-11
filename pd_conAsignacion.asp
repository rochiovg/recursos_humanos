<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0

idProyecto=Session("id_proyecto")

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

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
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

	var vcombo1=0;
	var idcombo;
function valorinicial (valor,id)
{
idcombo=id;
	vcombo1=valor;
	}

function valida_dias(dni)
{
	
	document.getElementById('d'+dni).disabled=false;
		var valor=document.getElementById('r'+dni).value;
		var data = valor.split('*')
		TCONTRATO=data[0]
		RUTA=data[1]
document.getElementById("tco"+dni).value=TCONTRATO;

	}
	
	function vdcontrata(ingreso,dni)
	{
	grupo=document.getElementById("tco"+dni).value;
	if (grupo==ingreso)
	 {
		 document.getElementById("gua"+dni).style.display="block"
		 document.getElementById("gua2"+dni).style.display="none"
		 }else 
		 {		 document.getElementById("gua"+dni).style.display="none"
		 document.getElementById("gua2"+dni).style.display="block"

			 alert("Dato err\xF3neo")
			 document.getElementById("d"+dni).value="";
			 document.getElementById("r"+dni).focus();
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



function valida_area(valor)
{
	if(valor=='10' || valor=='58'|| valor=='64'|| valor=='87' || valor=='102'   || valor=='125' )
	{
		
		document.getElementById("txtarea").value="0";
			document.getElementById("txtarea").disabled=true;

		
		}else 
		{document.getElementById("txtarea").disabled=false;
		
				}
	}


function validar(dni,ccdd,ccpp,ccdi,lsarea,lscargo,lsUsuario)
{
	var valor=document.getElementById('r'+dni).value;
		var data = valor.split('*')
		ruta=data[1]
		tcontrato=data[0]
		pea=data[2]

	if(!confirm("Esta Seguro de asignar la ruta "+ruta+"\n Con :"+tcontrato+" d\xEDas "))
	{
		document.getElementById('r'+dni).value='0';
		document.getElementById('d'+dni).value='';
		document.getElementById("gua2"+dni).style.display="block";
				document.getElementById("gua"+dni).style.display="none";
	}else {	

if (ruta=="0" )
{
 alert("Selecciona la ruta");
 document.getElementById('r'+dni+'').focus();
return false;
			 
	}
			 
var ubigeo=ccdd+ccpp+ccdi;
	ajax=http_request();
	var valores;	
	valores= "dni="+dni+"&ubigeo="+escape(ubigeo)+"&lsarea="+escape(lsarea)+"&lscargo="+escape(lscargo)+"&lsruta="+escape(ruta)+"&pea="+escape(pea)+"&tcontrato="+escape(tcontrato)+"&lsUsuario="+escape(lsUsuario)+"&lsTipo=18";  // parametros a enviar al servidor	
	url="m_ingreso.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("t"+dni).innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					
					var valor = ajax.responseText;	
				  
				  var respuesta = valor.split('-')
				  ruta=respuesta[0]
				  resp=respuesta[1]
				  if (ruta!="0")
				  {
				 document.getElementById('r'+dni+'').disabled=true;
				 document.getElementById('d'+dni+'').value="";
				 document.getElementById('d'+dni+'').disabled=true;
				 document.getElementById("gua2"+dni).style.display="block";
				document.getElementById("gua"+dni).style.display="none";
				  }else 
				  {
					  alert("Error")
					   document.getElementById("gua2"+dni).style.display="block";
				document.getElementById("gua"+dni).style.display="none";
					  document.getElementById('r'+dni+'').value="0";
					  document.getElementById('d'+dni+'').value="";
					   document.getElementById('d'+dni+'').disabled=true;
					  }
				
				document.getElementById("t"+dni).innerHTML=	resp ;
				
				
            }
            else if(ajax.status==404){
                     document.getElementById("t"+dni).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
 				
                 document.getElementById("t"+dni).innerHTML =ajax.responseText;
				 
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
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Consultas: Directorio de la RTA</span></div>      
  <div id="lateral">
                 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_consultas.asp">
            <table width='100%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios
                  <input name="usuario" type="hidden" id="usuario" value="<%=lsUsuario%>" />
                  <span class="criterio">
                  <input name="txtRol" type="hidden" id="txtRol" value="<%=lsRol%>" />
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                  </span></td>
              </tr>
              <tr>

              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Departamento:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaDpto()%></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Provincia:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                  <option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
                </select></td>
              </tr>
              <tr>
                <td height="25"  align="right" bgcolor="#F7F8F9" id="nomdis2"><span class="criterio">Distrito:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                  <option id="txtDist1" 	title="Todos" value="999999" >Todos </option>
                </select></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Cargo:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaCargo()%>
                  <span class="alerta5">(*)</span></td>
              </tr>
	          <tr height=22>
                <td height="23" colspan="2" align="center" bgcolor="#F7F8F9"><p>
                  <input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onClick="javascript:enviar_consultaAsigna()" 
                        value='Aceptar'>
                </p>
                <p>&nbsp; </p></td>
              </tr>
              
                      <td colspan="2"  align="CENTER" bgcolor="#F7F8F9" ><fieldset>
          <legend class="criterio">REPORTES DE GASTOS OPERATIVOS:</legend>
          <p>
            <input type="radio" name="nivelRRHH" id="AD" value="1"  checked="checked" />
            <label for="1" class="etiqueta" >1er. Env&iacute;o (1)</label>
            <input type="radio" name="nivelRRHH" id="RA" value="2"  />
            <span class="etiqueta">1er. Env&iacute;o (2)</span></p>
          <p>
            <input type="radio" name="nivelRRHH" id="AD2" value="3"  />
            <label for="12" class="etiqueta" >2er. Env&iacute;o (1)</label>
            <input type="radio" name="nivelRRHH" id="RA2" value="4"  />
            <span class="etiqueta">2er. Env&iacute;o (2)</span></p>
          <p>&nbsp;</p>
          <p>
            <input 
                        name='button2'  type='button' class="boton" 				
                        id='button2' 
                        onclick="javascript:ReporteSiga()" 
                        value='Reporte SIGA' />  <BR /><BR />
          </p>
          <p>_____________________________________</p>
          <p>&nbsp;</p>
          <p>
            <input 
                        name='button4'  type='button' class="boton" 				
                        id='button4' 
                        onclick="javascript:ReporteResumen()" 
                        value='Resumen' />
            <br/>
          </p>
                      </fieldset></td>
        </tr>
               <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button3' style="display:none"  type='button' class="botonR" 				
                        id='button3' 
                        onclick="javascript:exportarRA(2)" 
                        value='Exportar F2 Capacitaci&oacute;n Hist&oacute;tico' /></td>
                        
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
                      <div align="center" style="padding:5px,5px,5px,5px;"><img src="images/excell1.gif" alt="" class="botonExcel" title="EXPORTAR A EXCEL" /></div>
                      <input type="hidden" id="datos_a_enviar" name="datos_a_enviar" />
                    </form></td>
			      </tr>
				  <tr>
				    <td align="center"><span class="criterio">(Exportar Excel)</span></td>
			      </tr>
			    </table></div>
          <div id="divDetallem" style="margin:0;
	vertical-align:top;
	padding: 1px 4px 1px 1px;
	height: 340px;
	overflow: auto;"> </div>
              
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
