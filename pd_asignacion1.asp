<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%

idProyecto=Session("id_proyecto")

sub generaDpto()
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD_UBI '"&lsUbigeo&"'"
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

sub generaCargo()
			
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoAsignacion '"&idProyecto&"' ")

	
	Response.Write "<select class=""e_combo"" style=""width:210px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option value=""999"">Seleccione</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(4)&""" value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>"& wRsDptoapli(3) & "</option>"
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


function validar(ccdd,ccpp,ccdi,id_per,id_puesto,lsUsuario)
{
	var valor=document.getElementById('r'+id_per).value;
		//var data = valor.split('*')
		//ruta=data[1]
		//tcontrato=data[0]
		//pea=data[2]

	if(!confirm("Esta Seguro de asignar la ruta "))
	{
		document.getElementById('r'+id_per).value='0';
		document.getElementById("gua2"+id_per).style.display="block";
		document.getElementById("gua"+dni).style.display="none";
	}else {	

if (ruta=="0" )
{
 alert("Selecciona la ruta");
 document.getElementById('r'+id_per+'').focus();
return false;
			 
	}
			 
///var ubigeo=ccdd+ccpp+ccdi;
	ajax=http_request();
	var valores;	
	valores= "ccdd=" + escape(ccdd) + "&ccpp=" + escape(ccpp)+ "&ccdi=" + escape(ccdi)+ "&valor=" + escape(valor)+ "&id_per=" + escape(id_per)+ "&id_puesto=" + escape(id_puesto)+ "&usuario=" + escape(usuario);  // parametros a enviar al servidor	
	url="m_Proc_rutas.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
               
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					alert('Los Datos Han Sido Correctamente Grabados');
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
	}
	
	function eliminar_ruta(id_asignacion, id_per)
{
	
	if (id_asignacion==0){
		alert ('Aun no se ha asignado una ruta');
		return false;
		}
	
	var valor=document.getElementById('r'+id_per).value;
	ajax=http_request();
	var valores;	
	valores= "cod=" +id_asignacion+"&valor="+valor+"&lsTipo=32";  // parametros a enviar al servidor	
url="m_ingreso.asp";

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					alert('Se procedio a eliminar la ruta');
					cons_asigna('1','1');
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
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso: Asignar Ruta</span></div>
        <div id="lateral">
            <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
      
    <table width='103%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios
                <input name="usuario" type="hidden" id="usuario" value="<%=lsUsuario%>" />
                <span class="criterio">
                <input name="txtRol" type="hidden" id="txtRol" value="<%=lsRol%>" />
                <input name="cboReporte" type="hidden" id="cboReporte" value="5" />
                <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
            <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                </span></td>
              </tr>
              <tr>
                <td width="30%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
                Departamento:&nbsp;</span></td>
                <td width="70%"  align=left bgcolor="#F7F8F9" id="dpto"><%generaDpto()%></td>
              </tr>
              <tr>
                <td  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomreg">Provincia:&nbsp; </span></td>
                <td  align=left bgcolor="#F7F8F9" id="reg2"><select class='e_combo'   name="txtProv1" id="txtProv1"   style="width:200px; "  >
                  <option  title="Todos" value="9999" >Seleccione...</option>
                </select>
                <span class="alerta5">(*)</span></td>
              </tr>
              <tr>
                <td  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdis">
                Distrito:&nbsp;</span></td>
                <td  align=left bgcolor="#F7F8F9" id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1" style="width:200px;"  >
                  <option  title="Todos" value="999998" >Seleccione...</option>
                </select>
                <span class="alerta5">(*)</span></td>
              </tr>
              <tr> 
                <td align="right" bgcolor="#F7F8F9"><span class="criterio" >Cargo:</span></td>
                <td  align="left" bgcolor="#F7F8F9" id="dpto2">
                  <span class="alerta5">
                  <%generaCargo()%>
                  (*)</span></td>
              </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><p>
                  <INPUT name='button1' type='button' class="boton" id='button1' onClick="javascript:cons_asigna(1,1)" value='Aceptar'>
                </p>
                <p>&nbsp; </p></td>
              </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><p>
                  <INPUT name='button1' type='button' class="boton" id='button2' onClick="javascript:reporte_asigna()" value='Reporte'>
                </p>
                <p>&nbsp; </p></td>
              </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><input name='button2' type='button' class="boton" id='button3' onclick="javascript:exportarRAf32()" value='Exportar F3' /></td>
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
