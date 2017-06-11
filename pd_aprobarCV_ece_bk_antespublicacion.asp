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

sedeReg=session("sedeReg") 
sedeProv=session("sedeProv") 
sedeDist=session("sedeDist") 

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '9','"&id_proyecto&"' ")
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" OnChange=""generaConvocatoria(this.value);"" >"
	
	Response.Write " <option value=""900"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='"&wRsDptoapli(4)&" - Actividad: "&wRsDptoapli(5)&"'   value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(3) & "</option>"
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

	var vcombo1=0;
	var idcombo;

function valorinicial (valor,id)
{
	idcombo=id;
	vcombo1=valor;
}

function f_contador_cap(idc,id,ID_PER,valor, usuario){
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
	
		ProcesarCV(ID_PER,valor,usuario);
		}
}


function ProcesarCV(ID_PER,VALOR,USUARIO){
	
	var obs="";
	id_proy=document.getElementById("id_proy").value;
	ajax=http_request();
	var valores;	
	valores= "ID_PER=" + escape(ID_PER) + "&VALOR=" + escape(VALOR)+ "&USUARIO=" + escape(USUARIO)+ "&id_proy=" + escape(id_proy)+ "&obs=" + escape(obs);  // parametros a enviar al servidor
	
	url="m_Proc_CV.asp";   // nombre de url a invocar
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 
         }
         else if (ajax.readyState==4){
		
            if(ajax.status==200){
					var tx='';
					if (VALOR==1){
						tx=' Proceda a seleccionar el tipo de aula'
					}
					alert('Los datos han sido correctamente grabados.'+tx);
					if (VALOR==1){
						document.getElementById("txtA"+ID_PER).disabled=false;
						document.getElementById("ta"+ID_PER).bgColor="#CD9C9C"
						document.getElementById("txtA"+ID_PER).focus;
						
					}else{
						document.getElementById("txtA"+ID_PER).value="0";
						document.getElementById("ta"+ID_PER).bgColor=""
						document.getElementById("txtA"+ID_PER).disabled=true;
						act_tipo_aula('A',ID_PER,'0');
						
					}
            }
            else if(ajax.status==404){
				document.getElementById("divResultado").innerHTML = ajax.responseText;
            }
            else{
				document.getElementById("divResultado").innerHTML = ajax.responseText;
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return ;	

}

function act_tipo_aula (id,ID_PER,valor){
	if(id=='A'){
		ajax=http_request();
		var valores;	
		valores= "id_per=" + escape(ID_PER) + "&valor=" + escape(valor);  // parametros a enviar al servidor
		
		url="m_guardar_tipoAula.asp";   // nombre de url a invocar
		
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 
         }
         else if (ajax.readyState==4){
		
            if(ajax.status==200){
						document.getElementById("ta"+ID_PER).bgColor=""
            }
            else if(ajax.status==404){
				document.getElementById("divResultado").innerHTML = ajax.responseText;
            }
            else{
				document.getElementById("divResultado").innerHTML = ajax.responseText;
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return ;	
		
	} else 
	{	
	if(!confirm("Estas seguro de hacer este cambio"))
	{  return false;	}
	else {
		ajax=http_request();
	var valores;	
	valores= "id_per=" + escape(ID_PER) + "&valor=" + escape(valor);  // parametros a enviar al servidor
	
	url="m_guardar_tipoAula.asp";   // nombre de url a invocar
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 
         }
         else if (ajax.readyState==4){
		
            if(ajax.status==200){
					var tx='';
						alert('Los datos han sido correctamente grabados.'+tx);
						document.getElementById("ta"+ID_PER).bgColor="#7EBA65"
						document.getElementById("txtA"+ID_PER).focus;
            }
            else if(ajax.status==404){
				document.getElementById("divResultado").innerHTML = ajax.responseText;
            }
            else{
				document.getElementById("divResultado").innerHTML = ajax.responseText;
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return ;	
	}
	
	}
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

  
function guardarCVAplicador(vcampo,vidper,vvalor){

 	objeto = document.getElementById(vcampo+vidper);
    if (objeto.checked == true)
    { vvalor="1"; }
    else
    {vvalor="0";}
	 
   if (vvalor!='' ) {
    
      ajax=http_request();
      var valores;  
      valores= "campo=" + escape(vcampo) + "&idper=" + escape(vidper)+ "&valor=" + escape(vvalor);   
	  
	     
      divTotal="tr"+vidper;
	  divEstado="tr1"+vidper;
  
      url="m_GrabaNotasCV.asp";   // nombre de url a invocar
      ajax.open ('POST', url, true);
      ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         
         else if (ajax.readyState==4){
          if(ajax.status==200){
			 result  = ajax.responseText;
			 
			 var result1=result.split("*");
			 var valor1=result1[0];
			 var valor2=result1[1];
			 
                document.getElementById(divTotal).innerHTML =valor1;
				document.getElementById(divEstado).innerHTML =valor2;
          }
          else if(ajax.status==404){
                 document.getElementById(divProceso).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
          }
          else{
              document.getElementById(divTotal).innerHTML = ajax.responseText;           
          }
        }
      }
      ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
      ajax.send(valores);
       return;  

   }else 
   {alert("Debe de Ingresar una Nota")}
  }
  
  
function guardarCV(vcampo,vidper,vvalor){

   	alert(vcampo);
	alert(vidper);
	
   if (vvalor!='' ) {
    
      ajax=http_request();
      var valores;  
      valores= "campo=" + escape(vcampo) + "&idper=" + escape(vidper)+ "&valor=" + escape(vvalor);   
	  
	     
      divTotal="tr"+vidper;
	  divEstado="tr1"+vidper;
  
      url="m_GrabaNotasCV.asp";   // nombre de url a invocar
      ajax.open ('POST', url, true);
      ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
         }
         
         else if (ajax.readyState==4){
          if(ajax.status==200){
			 result  = ajax.responseText;
			 
			 var result1=result.split("*");
			 var valor1=result1[0];
			 var valor2=result1[1];
			 
                document.getElementById(divTotal).innerHTML =valor1;
				document.getElementById(divEstado).innerHTML =valor2;
          }
          else if(ajax.status==404){
                 document.getElementById(divProceso).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
          }
          else{
              document.getElementById(divTotal).innerHTML = ajax.responseText;           
          }
        }
      }
      ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
      ajax.send(valores);
       return;  

   }else 
   {alert("Debe de Ingresar una Nota")}
  }
  
</script>
    </head>
    <body>
        <div id="top">
           <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso : Evaluaci&oacute;n de CVs Masivo</span></div>
<div id="lateral">

 <form name="frmMiForm" id="frmMiForm" METHOD="POST" >
            <table width='100%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios<span class="criterio">
                  <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                  <input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
                  <input name="id_proy" type="hidden" id="id_proy" value="<%=id_proyecto%>" />
                   <input name="lsRol" type="hidden" id="lsRol" value="<%=lsRol%>" />
                </span></td>
              </tr>
 
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9"><fieldset>
          <legend class="criterio">&nbsp;&nbsp; Seleccione Nivel de RRHH :</legend><br>
          <input type="radio" name="nivelRRHH" id="TD" value="9" checked="checked" onclick="cargosPorNivel(this.value)" />
          <label for="9" class="etiqueta" >TODOS</label>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="nivelRRHH" id="RA" value="1" onclick="cargosPorNivel(this.value)" />
          <label for="1" class="etiqueta">RAO</label>
          &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="nivelRRHH" id="RO" value="2"   onclick="cargosPorNivel(this.value)"/>
          <label for="2" class="etiqueta" >RO</label>&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="nivelRRHH" id="RO" value="3"  onclick="cargosPorNivel(this.value)"/><label for="3" class="etiqueta" >RTA</label>
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
              <tr id="cargo2" style="display:none">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Cargo:</span></td>
                <td bgcolor="#F7F8F9" id="cargo2N" class='criterio'><select class='e_combo' name="cmbCargo1" id="cmbCargo1"  style="width:200px;" >
                  <option id="9" title="Todos" value="900" >Todos </option>
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
              
	          <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onclick="javascript:ver_detalle_ece(2)" 
                        value='Aceptar'>
                <br><br><div id="msj2"></div></td>
              </tr>  
              <% if lsRol=31 then %>
                           
              <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><br><input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onclick="javascript:calcular_rankin_ece(1)" 
                        value='RANKING'></td>
              </tr>
              
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
                        onclick="javascript:procesarCierre_ece(2)" 
                        value='Procesar'>
                        
                 </fieldset>       </td>
              </tr> 
              <%end if %> 
            </table>    
          </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" align="center" style="height:90%"></div>
		  <div id="mensaje"></div>
            <iframe id="iframe" width="100%" height="90%" src="" frameborder="0"></iframe>
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
