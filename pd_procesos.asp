<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
id_usuario=Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
lsUbigeoDist = Session("UbigeoDist") 
id_proyecto=session("id_proyecto")

ipVisitante = Request.ServerVariables("REMOTE_ADDR")


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

function cargarProceso(valor){
		var url;


	ajax=http_request();
	var valores;	
	valores= ""  // parametros a enviar al servidor	
	
	
	if (valor==1)
	url="pd_calificacion_automarica.asp";
	else if (valor==2)
	url="pd_NotaCV.asp";
	else if (valor==3)
	url="pd_entrevistaFInal.asp"
	else if (valor==4)
	url="pd_EvalConocimientos.asp"
	else if (valor==5)
	url="pd_seleccion.asp"
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divVista").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
								
					document.getElementById("divVista").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divVista").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("divVista").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
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


function verificar_cv(dni){
	
	var fdni=document.getElementById("fdni").value;
	
	if (fdni==0 || fdni==""){
	document.getElementById("TR"+dni).style.background="#EAEE35";
	document.getElementById("fdni").value=dni;
	} else if ( fdni!=dni){
		document.getElementById("TR"+dni).style.background="#EAEE35";
		document.getElementById("TR"+fdni).style.background="";
	} else if ( fdni==dni){
		document.getElementById("TR"+dni).style.background="#EAEE35";
	}
	else {
		document.getElementById("TR"+dni).style.background="#EAEE35";
		document.getElementById("TR"+fdni).style.background=""
	}
	document.getElementById("fdni").value=dni;
	
	ajax=http_request();
	var valores;	
	valores= "dni=" + escape(dni);  // parametros a enviar al servidor	
	
	url="m_vistaCV_.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="Cargando......";
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

function ver_cv(id){
	
	if (id==1){
		document.getElementById("foto1").style.display="";
		document.getElementById("foto2").style.display="none";
		document.getElementById("foto3").style.display="none";
		
	}
	if (id==2){
		document.getElementById("foto1").style.display="none";
		document.getElementById("foto2").style.display="";
		document.getElementById("foto3").style.display="none";
		
	}
	if (id==3){
		document.getElementById("foto1").style.display="none";
		document.getElementById("foto2").style.display="none";
		document.getElementById("foto3").style.display="";
		
	}

}


function generaConvocatoria(){
     
      var varcargo =document.getElementById("cmbCargo").options[document.getElementById("cmbCargo").selectedIndex].value;
	  
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


function calificar(valor){
	
	 if(document.frmMiForm.txtDpto1.value == '0' )
		 {
			 alert("Selecciona el Departamento");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
			 	 if(document.frmMiForm.txtProv1.value == 9999 )
		 {
			 alert("Selecciona la Provincia");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 	 if(document.frmMiForm.txtDist1.value == 999999 )
		 {
			 alert("Selecciona el Distrito");
			 document.frmMiForm.txtDpto1.focus();
			 return false;
			 
			 }
			 
							 
			 	 if(document.frmMiForm.cmbCargo.value == '0' )
		 {
			 alert("Selecciona el combo del Cargo");
			
			 document.frmMiForm.cmbCargo.focus();
			 return false;
			 
			 }
			 if (valor==1 ){
				vmin=0;
				vmax=0;
				vcantidad=0;		 
			} else if (valor==2){
				vmin= document.frmMiForm.txtmin.value;
				vmax=document.frmMiForm.txtmax.value;
				vcantidad=0;
				if (vmin==""){
				alert('Ingrese Valor minimo de nota para la seleccion');
				document.frmMiForm.txtmin.focus();
				return false;
				}
				if (vmin<0 || vmin>20 ){
				alert('Los valores se deben de encontrar entre 0 y 20, verificar');
				document.frmMiForm.txtmin.focus();
				return false;
				}
				if (vmax==""){
				alert('Ingrese Valor minimo de nota para la seleccion');
				document.frmMiForm.txtmax.focus();
				return false;
				}
				if (vmax<0 || vmax>20 ){
				alert('Los valores se deben de encontrar entre 0 y 20, verificar');
				document.frmMiForm.txtmax.focus();
				return false;
				}
				if (vmin>vmax){
					alert ('valor minimo mayor al valor maximo, verificar');
					 document.frmMiForm.txtmin.value="";
					 document.frmMiForm.txtmax.value="";
					 document.frmMiForm.txtmin.focus();
					return false;
				}
			}else{
				vmin= 0;
				vmax=0;
				vcantidad=document.frmMiForm.txtcantidad.value;
				if (vcantidad==""){
					alert('Registre la cantidad de personas que desea revisar');
					document.frmMiForm.txtcantidad.focus();
					return false
					}
			}

		 var lsDPTO = document.frmMiForm.txtDpto1.value;
		 var lsPROV = document.frmMiForm.txtProv1.value;
		 var lsDIST = document.frmMiForm.txtDist1.value;
		 var lsUsuario = document.frmMiForm.txtUsuario.value;
		 var lsCargo = document.frmMiForm.cmbCargo.value;
		 var lproyecto = document.frmMiForm.id_proyecto.value;

	ajax=http_request();
	var valores;
	valores= "lsDPTO=" + escape(lsDPTO)+"&lsPROV="+escape(lsPROV)+"&lsDIST="+escape(lsDIST)+"&lsCargo="+escape(lsCargo)+"&lsUsuario="+escape(lsUsuario)+"&valor="+escape(valor)+"&vmin="+escape(vmin)+"&vmax="+escape(vmax)+"&vcantidad="+escape(vcantidad)+"&lproyecto="+escape(lproyecto)+"&lsTipo=100";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
		
         if (ajax.readyState==1) {
                 document.getElementById("divResultado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					Calificacion_automatica(valor)
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

</script>
    </head>
    <body>
        <div id="top">
      <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
       <div id="divNavegacion" align="center"><span class="subtitulo"><%=Session("cmeta")&"-"&Session("nmeta")%> </span></div>
       <table width="100%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <thead><tr>
 	      <th colspan=6 bgcolor="#DAE8F3" class="aplicacion">
</th>
 	    
          <tr>
 	        <td colspan="5"  class="titulo">PROCESOS DE SELECCI&Oacute;N 
 	          <input type="hidden" name="id_proyecto" id="id_proyecto" value="<%=id_proyecto%>" />
            <input type="hidden" name="id_usuario" id="id_usuario" value="<%=id_usuario%>" />
            <input type="hidden" name="ipVisitante" id="ipVisitante" value="<%=ipVisitante%>" /></td>
    </tr>
         </thead>
         <tbody>
         </tbody>    
                <tfoot>  
                <tr>
			 <td width="25%" align="center" id="prueba" ><input name='button1' type='button' class="botonProcesos" id='button1' onclick="javascript:cargarProceso(1)" value='CALIFIACI&Oacute;N AUTOM&Aacute;TICA' /></td>
			 <td width="25%" align="center" id="prueba" ><input name='button1' type='button' class="botonProcesos" id='button1' onclick="javascript:cargarProceso(2)" value='EVALUACI&Oacute;N DE CVs' /></td>
			 <td width="25%"  align="center" id="prueba" ><input name='button1' type='button' class="botonProcesos" id='button1' onclick="javascript:cargarProceso(3)" value='ENTREVISTA PERSONAL y EVALUACI&Oacute;N DE COMPETENCIAS' /></td>
             <td width="25%"  align="center" id="prueba" ><input name='button1' type='button' class="botonProcesos" id='button1' onclick="javascript:cargarProceso(4)" value='EVALUACI&Oacute;N DE CONOCIMIENTOS' /></td>
              <td width="25%"  align="center" id="prueba" ><input name='button2' type='button' class="botonProcesos" id='button2' onclick="javascript:cargarProceso(5)" value='SELECCI&Oacute;N DE PERSONAL' /></td>
 	            </tr>
          </tfoot>
    </table>
    <div id="divVista" align="center" style="">    </div>
       

</body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
