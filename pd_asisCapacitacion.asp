<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%



lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUsuarioID = Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 

id_proyecto=session("id_proyecto") 
sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO ""2"", "&id_proyecto&"")

	
	Response.Write "<select class=""e_combo"" style=""width:210px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option value=""999"">Seleccione...</option>"
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


Response.Expires = 0

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoApli = Session("Ubigeoapli") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")


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


function f_contador_AsisCapa(idc,id,ID_PER,valor){
	var combo=idc;
	var valor=valor;
	var ID_PER=ID_PER;
	var usuario= document.getElementById("txtUsuarioId").value;
	
	if(!confirm("Estas seguro de hacer este cambio a \n "+id))
	{
		document.getElementById(idc).value=vcombo1;
		vcombo1=0;
		idcombo;
	
	}else 
	{
		
	var meta = document.getElementById('MetaSeleccion').value;

	var contador=parseInt(document.getElementById('txtCapacitacion').value);
	

	
		if(valor==1){
		 contador= contador+1;
		document.getElementById('txtCapacitacion').value=contador;
		}
		else{
			
			if (vcombo1!=1 && valor!=1 && contador==0 )
			{
	 	     contador= contador;
		     document.getElementById('txtCapacitacion').value=contador;
			}else {
					if (vcombo1==1 && valor!=1) {
						contador=contador-1;
						document.getElementById('txtCapacitacion').value=contador;
						}
				  }
		}
	
		ProcesarConAsis(ID_PER,valor, usuario);
		
	}
}

//fin metodo modificado

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

</script>
    </head>
    <body>
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso:Verificaci&oacute;n de Asistencia a Capacitaci&oacute;n</span></div>
        <div id="lateral">
            <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
      
    <table width='103%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios<span class="criterio">
                  <input name="txtRol" type="hidden" id="txtRol" value="<%=lsRol%>" />
                <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                </span></td>
              </tr>
              <tr>
                <td width="30%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
                <input name="cboReporte" type="hidden" id="cboReporte" value="7" />
                <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
                <input name="txtUsuarioId" type="hidden" id="txtUsuarioId" value="<%=lsUsuarioID%>" />
                Departamento:&nbsp;</span></td>
                <td width="70%"  align=left bgcolor="#F7F8F9" id="dpto"><%generaDpto()%></td>
              </tr>  
              <tr>
                <td  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomreg">Provincia:&nbsp; </span></td>
                <td  align=left bgcolor="#F7F8F9" id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"   style="width:200px; "  >
                  <option  title="Todos" value="9999" >Seleccione...</option>
                </select>
                <span class="alerta5">(*)</span></td>
              </tr>
              <tr>
                <td  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdis">Distrito:                &nbsp;</span></td>
                <td  align=left bgcolor="#F7F8F9" id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1" style="width:200px;"  >
                  <option  title="Todos" value="999999" >Seleccione...</option>
                </select>
                <span class="alerta5">(*)</span></td>
              </tr>
              <tr> 
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio" >Cargo:</span></td>
                <td  align="left" bgcolor="#F7F8F9" id="dpto2"><%generaCargo()%>
                  <span class="alerta5">(*)</span></td>
              </tr> 
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><INPUT name='button1' type='button' class="boton" id='button1' onClick="javascript:cons_Vcapa(1)" value='Aceptar'></td>
              </tr>
                <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><p>
	              <input 
                        name='button2'  type='button' class="boton" 				
                        id='button2' 
                        onclick="javascript:exportarRA(2)" 
                        value='Exportar F2 H' />
	            </p></td>
              </tr>
              
              <tr>
                <td colspan="4"  bgcolor="#F7F8F9"><fieldset><div align="left">
          <legend class="criterio">&nbsp;Formato B:<br/>
          </legend>
                </div>     
     <div align="center">   <input name="button" onclick="envioB()" type="button" style="size:320px; color: #FFF; background-color:#006699; font-family:Arial, Helvetica, sans-serif; font-size:10px; font-weight:bold;	 "  id="button" value="Exportar Formato B" /></div></fieldset></td>
              </tr>
              
              </table>
    </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
            <div id="divResultado" align="center">   </div>
            <div id="mensaje" style="width:100%; float:left; position:inherit; vertical-align:top;"> </div>
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
