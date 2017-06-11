<%@ Language=VBScript %>

<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario1 =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist= Session("UbigeoDist")
lsUsuario=Session("id_usuario")

id_proyecto=session("id_proyecto")  



%>

<script type="text/javascript">
function exportarExcelCapa()
{
  
      
     if(document.frmMiForm.txtDpto1.value == '99' || document.frmMiForm.txtDpto1.value == '0' )
     {
          alert("Selecciona el Departamento");
       document.frmMiForm.txtDpto1.focus();
       return false;
       
       }   
         if(document.frmMiForm.txtProv1.value == '' )
     {
       alert("Selecciona la Provincia");
       document.frmMiForm.txtProv1.focus();
       return false;
       
       } 

         if(document.frmMiForm.txtDist1.value == '' )
     {
       alert("Selecciona el Distrito");
       document.frmMiForm.txtDist1.focus();
       return false;
       
       } 

     var lsDPTO = document.frmMiForm.txtDpto1.value;
     var lsPROV = document.frmMiForm.txtProv1.value;
     var lsDIST = document.frmMiForm.txtDist1.value;
    var lsUsuario = document.frmMiForm.txtUsuario.value;
    var lsCargo1 = document.frmMiForm.cmbCargo1.value;
     var lsCargo = document.frmMiForm.cmbCargo.value;
      if(lsCargo1=='900'){
       lsCargo=lsCargo;
    } else 
       lsCargo=lsCargo1;

    var lsConvocaroria = document.frmMiForm.txtConvocartoria.value;

    pagina = "exportarCapacitacionPiloto.asp?lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&lsConvocaroria="+escape(lsConvocaroria);
    win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');



}

</script>


<%

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '9','"&id_proyecto&"' ")
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" OnChange=""generaConvocatoria(this.value);"" >"
	
	Response.Write " <option value=""200"">Todos</option>"
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


function guardarCAPA(vtabla,vidper,vidCapa,vvalor){


   if (vvalor!='' ) {
    
      ajax=http_request();
      var valores;  
      valores= "tabla=" + escape(vtabla) + "&idper=" + escape(vidper)+ "&valor=" + escape(vvalor)+ "&vidCapa=" + escape(vidCapa);   
	  
	     
      divProceso="tr"+vidper;
      url="m_GrabaNotasCapaCon.asp";   // nombre de url a invocar
      ajax.open ('POST', url, true);
      ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         
         else if (ajax.readyState==4){
          if(ajax.status==200){
			 

                document.getElementById(divProceso).innerHTML =ajax.responseText;
          
          }
          else if(ajax.status==404){
                 document.getElementById(divProceso).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
          }
          else{
              document.getElementById(divProceso).innerHTML = ajax.responseText;           
          }
        }
      }
      ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
      ajax.send(valores);
       return;  

   }else 
   {alert("Debe de Ingresar una Nota")}
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



function Seleccionar(id_per,valor){
	
		ajax=http_request();
		var valores;	
		valores= "id_per=" + escape(id_per) + "&valor=" + escape(valor);  
		
		url="m_registraTitularidad.asp";   // nombre de url a invocar
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
			 
			 }
			 
			 else if (ajax.readyState==4){
				if(ajax.status==200){
				alert('Los Datos Han Sido Correctamente Grabados');
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


</script>
    </head>
    <body>
        <div id="top">
          <!--#include file="cabecera.html"-->
          <!--#include file="pd_menu.asp"-->

       </div>
    <div id="divNavegacion" align="center"><span class="subtitulo"><input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
    <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" /></span></div>     
       
<div id="divNavegacion" align="center"><span class="subtitulo">Selecci&oacute;n de Titularidad</span></div>      
  <div id="lateral">
                 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_consultas.asp">
            <table width='100%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios<span class="criterio">
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                  <input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
                <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
                </span></td>
              </tr>
 
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9"><fieldset>
          <legend class="criterio">&nbsp;&nbsp; Seleccione Nivel de RRHH :</legend><br>
          <input type="radio" name="nivelRRHH" id="TD" value="9" checked="checked" onClick="cargosPorNivel(this.value)" />
          <label for="9" class="etiqueta" >TODOS</label>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="nivelRRHH" id="RA" value="1" onClick="cargosPorNivel(this.value)" />
          <label for="1" class="etiqueta">RAO</label>
          &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="nivelRRHH" id="RO" value="2"   onclick="cargosPorNivel(this.value)"/>
          <label for="2" class="etiqueta" >RO</label>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="nivelRRHH" id="RO" value="3"  onclick="cargosPorNivel(this.value)"/><label for="3" class="etiqueta" >RTA</label>
        </fieldset></td>
		      </tr> 
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
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                  <option id="txtDist1" 	title="Todos" value="999999" >Todos </option>
                </select></td>
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
              
	          <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onClick="javascript:capacitacionCon()" 
                        value='Aceptar'></td>
              </tr>
	          <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9">&nbsp;</td>
                        
              </tr>
              
               <tr height=22 style="display:none">
	            <td colspan="2" align="center" bgcolor="#F7F8F9">&nbsp;</td>
                        
              </tr>
              
               <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button3' style="display:none"  type='button' class="botonR" 				
                        id='button3' 
                        onclick="javascript:exportarRA(2)" 
                        value='Exportar F2 Capacitaci&oacute;n Hist&oacute;tico' /></td>
                        
              </tr>
              
              
            <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button5' style="display:none"  type='button' class="botonR" 				
                        id='button5' 
                        onclick="javascript:exportarRA(2)" 
                        value='Exportar F2 Selecci&oacute;n Hist&oacute;tico' /></td>
                        
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
          <div id="divDetallem" style="width:100%; height:360px; overflow:auto; float: left ; position: inherit; vertical-align:top;"> </div>
              
               <div id="deta" style="width:100%; float:left; position:inherit;  vertical-align:top;"> </div>
            <div id="mensa" style="width:100%; float:left; position:inherit; vertical-align:top;"> </div>
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
