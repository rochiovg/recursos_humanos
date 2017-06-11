<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUsuarioID = Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
id_proyecto=session("id_proyecto") 
id_aula=session("aulas") 


sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '9' ,'"&id_proyecto&"'  ")
	


	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" >"
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
	Response.Write " <option  value=""0"">Seleccione</option>"
	While not wRsDptoapli.EOF
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
			wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">&nbsp;(*)</span>"

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

function f_contador_pre1(idc,id,ID_PER,valor, usuario){
	var combo=valor;
	var valor=valor;
	var ID_PER=ID_PER;
	
	if(!confirm("Estas seguro de hacer este cambio a \n "+id))
	{
		document.getElementById(idc).value=vcombo1;
		
		vcombo1=0;
		idcombo;
	
	}else 
	{	
	var contador=parseInt(document.getElementById('txtCapacitacion').value);
		if(combo==1){
		 contador= contador+1;
		document.getElementById('txtCapacitacion').value=contador;
		}
		else{
			
			if (contador>0)
			{
	 	 contador= contador-1;
		document.getElementById('txtCapacitacion').value=contador;
			}else document.getElementById('txtCapacitacion').value=0;
		
		}
	
		ProcesarPre(ID_PER,valor,usuario);
		}
}


function mostrardiv(valor){
	if (valor==9){
		document.getElementById("posicion").style.display='none';
		document.getElementById("nota").style.display='none';
		Calificacion_automatica(1)
	}
	if (valor==1){
		document.getElementById("posicion").style.display='none';
		document.getElementById("nota").style.display='';	
	}	
	if (valor==2){
		document.getElementById("posicion").style.display='';
		document.getElementById("nota").style.display='none';	
	}	
}

function enviarcardDatos(dni)
{		
	 			
 pagina = "datosObs.asp?lsdni=" + dni ;
	win = window.open(pagina,'','width=600,height=250,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

function alerta_datos(id_per,cab,usuario, indic)
{
	
var valor;
 if (cab.checked == true)
valor=1;
else if (cab.checked == false)
valor=0;

	ajax=http_request();
		var valores;	
		valores= "id_per="+id_per+"&valor="+valor+"&usuario="+usuario+"&indic="+indic+"&lsTipo=106";  // parametros a enviar al servidor	
		
		url="m_ingreso.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
		
			 if (ajax.readyState==1) {
					 document.getElementById("alerta").innerHTML ="Cargando......";
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){
														
						document.getElementById("alerta").innerHTML =ajax.responseText;
						alert('El registro se guardo correctamente');
						
				}
				else if(ajax.status==404){
						 document.getElementById("alerta").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else{
	
						 document.getElementById("alerta").innerHTML = ajax.responseText;	
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
	   return;	
		
		
	
	}

function generaprov(){
     
      var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m_LocalesCapacitacionUsuario.asp";  
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


function verAulas(){

 var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
 var lsUbiDist =document.getElementById("txtIdAaula").value;

	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&Aulas="+escape(lsUbiDist);  // parametros a enviar al servidor	
	
	url="m_AulasCapacitacionUsuario.asp";  
	
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
<div id="divNavegacion" align="center"><span class="subtitulo">Asistencia a Capacitaci&oacute;n</span></div>
<div id="lateral">
        <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_preseleccion.asp">
            <table width='99%' border='0' cellpadding="2" cellspacing="2">
                   
		  <tr>
		    <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios
	        <span class="criterio">
	        <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
            <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
            <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuarioID%>" />
            <input name="id_proyecto" type="hidden" id="id_proyecto" value="<%=id_proyecto%>" />
            <input name="txtRol" type="hidden" id="txtRol" value="<%=lsRol%>" />
            <input name="txtIdAaula" type="hidden" id="txtIdAaula" value="<%=id_aula%>" />
	        </span></td>
		    </tr>
		  <tr>
		    <td width="31%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
	        Departamento:&nbsp;</span></td>
		    <td width="69%" align=left bgcolor="#F7F8F9" id="dpto"  nowrap="nowrap"><%generaDpto()%></td>
		    </tr>
		  <tr>
		    <td align=right bgcolor="#F7F8F9"><span class="criterio" id="nomreg">Local capacitaci&oacute;n:</span></td>
		    <td align=left bgcolor="#F7F8F9" id="reg2"  nowrap="nowrap"><select class='e_combo' name="txtProv1" id="txtProv1"   style="width:200px; "  >
		      <option  title="Todos" value="9999" >Seleccione...</option>
		      </select>
		      <span class="alerta5">(*)</span></td>
		    </tr>
		  <tr>
		    <td align=right bgcolor="#F7F8F9"  nowrap="nowrap"><span class="criterio" id="nomdis">Aula:</span></td>
		    <td align=left bgcolor="#F7F8F9" id="dis2" nowrap="nowrap"><select class='e_combo' name="txtDist1" id="txtDist1" style="width:200px;"  >
		      <option  title="Todos" value="999999" >Seleccione...</option>
		      </select>
		      <span class="alerta5">(*)</span></td>
		    </tr>
		  <tr>
		    <td align=right bgcolor="#F7F8F9">&nbsp;</td>
		    <td align=left bgcolor="#F7F8F9" id="dpto4"  nowrap="nowrap">&nbsp;</td>
		    </tr>
              <tr>
                <td height="4" colspan="4" align="center" bgcolor="#F7F8F9"><input name='button1' type='button' class="boton" id='button1' onclick="javascript:cons_Vcapa()" value='Aceptar' /></td>
                
              </tr>
              
               <tr>
                <td height="4" colspan="4" id="alerta" align="center" bgcolor="#F7F8F9">
                </td>
                
              </tr>
              
               <tr>
                <td height="4" colspan="4" align="center" bgcolor="#F7F8F9"><div id="nota" style="display:none" >
                
                <table><tr><td>Valor Minimo: </td><td><input type="text" name="txtmin" id="txtmin" class="e_texto" validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" maxlength="2" /></td></tr>
                <tr><td>Valor Maximo:</td><td><input type="text" name="txtmax" id="txtmax" class="e_texto" validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" maxlength="2" /></td></tr>
                <tr>
                  <td colspan="2" align="center"><input name='button2' type='button' class="boton" id='button2' onclick="javascript:Calificacion_automatica(2)" value='Aceptar' /></td></tr></table>
                </div>
          <div id="posicion"  style="display:none">
          <table><tr>
              <td>Seleccionar los: </td><td><input type="text" name="txtcantidad" id="txtcantidad" class="e_texto" validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" maxlength="2" /> primeros</td></tr>
                <tr>
            <td colspan="2" align="center"><input name='button2' type='button' class="boton" id='button2' onclick="javascript:Calificacion_automatica(3)" value='Aceptar' /></td></tr></table>
                </div>
                </td>
                
              </tr>
              
               <tr>
                <td height="4" colspan="4" align="center" bgcolor="#F7F8F9">&nbsp;</td>
                
              </tr>

            </table>
</form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" style="margin:0;" align="center"></div>
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
