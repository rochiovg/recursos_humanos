<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%





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

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


Response.Expires = 0

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoApli = Session("Ubigeoapli") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")

lsUsuario1=Session("id_usuario")
lsCargoUsuario= Session("cargoUsuario")


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
<script type="text/javascript"  src="js/valida_fecha.js"></script>


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




function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m7_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("reg2").innerHTML =ajax.responseText;
					verdis();
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
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m61_Distrito.asp";  
	
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


function alerta_datos(id_Contratos,cab,usuario, id_proyecto)
{
	

var valor;
 if (cab.checked == true)
valor=1;
else if (cab.checked == false)
valor=0;

	ajax=http_request();
		var valores;	
		valores= "id_Contratos="+id_Contratos+"&valor="+valor+"&usuario="+usuario+"&id_proyecto="+id_proyecto+"&lsTipo=30";  // parametros a enviar al servidor	
		
		url="m_ingreso.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
					 document.getElementById("chek").innerHTML ="Cargando......";
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){
														
						document.getElementById("chek").innerHTML =ajax.responseText;
						
				}
				else if(ajax.status==404){
						 document.getElementById("chek").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else{
	
						 document.getElementById("chek").innerHTML = ajax.responseText;	
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
	   return;	
	
}




function valida_dni(titular,reemplazante,nivel,idtxt)
{
	if (titular==reemplazante)
	{
		alert("Ingrese otro n\xFAmero de DNI");
		document.getElementById(idtxt).value=''
		
		return false
		
	}{
		
		
		if (reemplazante.length < 8 )
		{
				alert("Ingrese correctamente n\xFAmero de DNI");
				return false

		}
		{
		ajax=http_request();
		var valores;	
		valores= "dni=" + reemplazante+"&dniT="+titular+"&nivel="+nivel+"&lsTipo=20";  // parametros a enviar al servidor	
		
		url="m_ingreso.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
					 document.getElementById("divdni").innerHTML ="Cargando......";
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){
														
						var  resp=ajax.responseText.split('*');
						if (resp[0]!='-')
						{
						  document.getElementById("divdni").innerHTML = resp[0];
						  document.getElementById("idcargo").innerHTML = resp[1];
						}else 
						{
						alert("Ingrese otro n\xFAmero de DNI no cumple con los requerimientos para ser una alta");
						document.getElementById("txtdnire").value=''
						document.getElementById("divdni").innerHTML = "";
						  document.getElementById("idcargo").innerHTML = "";	
						}
				}
				else if(ajax.status==404){
						 document.getElementById("divdni").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
				}
				else{
	
												document.getElementById("divdni").innerHTML =ajax.responseText;
 
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
	   return;	
		}
		}
	}


function validaCum(valor,id){
	
	if (valor >20 || valor <0){
		alert("Nota Incorrecta, el valor se debe encontrar entre 0 y 20")
		document.getElementById(id).value='';
		document.getElementById(id).focus();
	} else
		return false;
}

function validaVE(valor,id){
	
	if (valor >20 || valor <0){
		alert("Nota Incorrecta, el valor se debe encontrar entre 0 y 20")
		document.getElementById(id).value='';
		document.getElementById(id).focus();
	} else
		return false;
}

function validaVS(valor,id){
	
	if (valor >20 || valor <0){
		alert("Nota Incorrecta, el valor se debe encontrar entre 0 y 20")
		document.getElementById(id).value='';
		document.getElementById(id).focus();
	} else
		return false;
}



function validartipo(valor){

	if (valor==9){
		
		var inic=document.getElementById("txtititu").value;
		var fin=document.getElementById("txtftitu").value;
		if (inic==fin){
			alert("La fecha de inicio y fin de labores no pueden ser iguales, verificar");
			document.getElementById("txtftitu").value="";
			document.getElementById("cmbejust").value="0";
			return false;
			}
		document.getElementById("txtdnire").disabled=true;
		document.getElementById("txtirem").disabled=true;
	}
	
	else {
		document.getElementById("txtdnire").disabled=false;
		document.getElementById("txtirem").disabled=false;	
	}
	
}


	 
</script>
    </head>
    <body>
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
  <div id="divNavegacion" align="center"><span class="subtitulo"><%=Session("cmeta")&"-"&Session("nmeta")%> -<%=Session("actividad")%> </span></div>     
       
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso:Altas y Bajas </span></div>
        <div id="lateral">
            <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
      <table width='330' border='0' cellpadding="2" cellspacing="2">
      <tr>
        <td colspan="2"  align="left" bgcolor="#F7F8F9"><span class="criterio"> <span class="alerta5">(*)</span></span><span class="proyecto">Campo Obligatorio<span class="criterio">
          <input name="lsUsuario1" type="hidden" id="lsUsuario1" value="<%=lsUsuario1%>"/>
          <input name="lsCargoUsuario" type="hidden" id="lsCargoUsuario" value="<%=lsCargoUsuario%>"/>
        </span></span></td>
      </tr>
      <tr>
        <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Departamento:</span></td>
        <td bgcolor="#F7F8F9" class='criterio'><%generaDpto()%></td>
      </tr>
      <tr>
        <td bgcolor="#F7F8F9" align="right"><span class="criterio">Provincia:</span></td>
        <td bgcolor="#F7F8F9" class='criterio' id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
          <option id="txtProv1" value="9999" > Seleccione </option>
        </select>
          <span class="alerta5">(*)</span></td>
      </tr>
      <tr>
        <td  align="right" bgcolor="#F7F8F9" ><span class="criterio">
          <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
        Distrito:</span></td>
        <td bgcolor="#F7F8F9" class='criterio' id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
          <option id="txtDist1" value="999999" >Seleccione </option>
        </select>
          <span class="alerta5">(*)</span></td>
      </tr>
      <tr>
        <td colspan="2"  align="left" bgcolor="#F7F8F9" ><fieldset>
          <legend class="criterio">&nbsp;&nbsp;Nivel de RRHH :</legend>
          <input type="radio" name="nivelRRHH" id="AD" value="3"  />
          <label for="3" class="etiqueta" >RTA</label><br/>
          <input type="radio" name="nivelRRHH" id="RA" value="1"  />
          <label for="1" class="etiqueta">RAO</label><br/>
          <input type="radio" name="nivelRRHH" id="RO" value="2" checked="checked" />
          <label for="2" class="etiqueta" >RO</label>
        </fieldset></td>
        </tr>
      <tr height=22>
        <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                            name='button1'  type='button' class="boton" 				
                            id='button1' 
                            onClick="javascript:enviar_consulta2()" 
                            value='Aceptar'></td>
      </tr>
    </table>
    </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
            <div id="divDetallem" style="width:100%; height:340px; overflow:auto; float: left ; position: inherit; vertical-align:top;"> </div>
              
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
