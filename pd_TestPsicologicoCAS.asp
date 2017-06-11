<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUsuario1=Session("id_usuario")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
lsUbigeoDist = Session("UbigeoDist") 
id_proyecto=session("id_proyecto")


sub generaProceso()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_OBTENERPROCESO_CAS ")
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbProceso"" name=""cmbProceso"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
Response.Write "<option title="""&wRsDptoapli(1)&""" value=""" &wRsDptoapli(0)&""">" &wRsDptoapli(1) & "</option>"
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


	var vcombo1=0;
	var idcombo;
function valorinicial (valor,id)
{
    idcombo=id;
	vcombo1=valor;
	}


function enviarcardDatos(dni)
{		
	 			
 pagina = "datosObs.asp?lsdni=" + dni ;
	win = window.open(pagina,'','width=600,height=250,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}


function f_contador_cv(idc,id,ID_PER,valor, usuario){
	var combo=idc;
	var valor=valor;
	var dni=dni;
	//var nota=document.getElementById('txtnota'+ID_PER).value;
	var obs=document.getElementById('txtobs'+ID_PER).value;
	if(!confirm("Estas seguro de hacer este cambio a \n "+id))
	{
		document.getElementById(idc).value=vcombo1;
		vcombo1=0;
		idcombo;
		//document.getElementById('txtnota'+ID_PER).value='';
	
	}else 
	{	
	var contador=parseInt(document.getElementById('txtCapacitacion').value);
		if(valor==1){
		 contador= contador+1;
		//document.getElementById('txtCapacitacion').value=contador;
		}
		else{
			
			/*if (vcombo1!=1 && valor!=1 && contador==0 )
			{
	 	     contador= contador;
		     document.getElementById('txtCapacitacion').value=contador;
			}else {
					if (vcombo1==1 && valor!=1) {
						contador=contador-1;
						document.getElementById('txtCapacitacion').value=contador;
						}
				  }*/
		}
			ProcesarCV(ID_PER,valor,usuario, obs);
	}
}


function ProcesarCV(ID_PER,VALOR,USUARIO, obs){
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
					alert('Los Datos Han Sido Correctamente Grabados');
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



function Flagear (id, id_per, valor, proyecto){

		ajax=http_request();
	
	var valores;	
	valores= "id_per=" + escape(id_per)+"&valor="+ escape(valor)+"&proyecto="+ escape(proyecto);  // parametros a enviar al servidor	
	
	
	url="m_actualizarTest.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("muestra"+id_per).innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("muestra"+id_per).innerHTML =ajax.responseText;
					alert("Grabado con exito");
            }
            else if(ajax.status==404){
                     document.getElementById("muestra"+id_per).innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("muestra"+id_per).innerHTML = ajax.responseText;	
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
       
        <div align="center" class="subtitulo">
 	        <input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" />
           </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso: Evaluaci&oacute;n de CV de la RO</span></div>



<div id="lateral" >
        <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_preseleccion.asp">
            <table width='99%' border='0' cellpadding="2" cellspacing="2">
                   
		  <tr>
		    <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios</td>
		    </tr>
		  <tr>
		    <td width="31%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
		      <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
            <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
              <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
              <input name="id_proy" type="hidden" id="id_proy" value="<%=id_proyecto%>" />
            Proceso:&nbsp;</span></td>
		    <td width="69%" align=left bgcolor="#F7F8F9" id="dpto"  nowrap="nowrap"><%generaProceso()%>
	        <span class="alerta5">(*)</span></td>
		    </tr>
		  <tr>
		    <td align=right bgcolor="#F7F8F9">&nbsp;</td>
		    <td align=left bgcolor="#F7F8F9" id="dpto4"  nowrap="nowrap">&nbsp;</td>
		    </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><input name='button1' type='button' class="boton" id='button1' onclick="javascript:verTestCAS()" value='Aceptar' /></td>
              </tr>
              <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><input name='button2' type='button' class="boton" id='button2' onclick="javascript:verTestCASExcel()" value='Reporte' /></td>
              </tr>
             
            </table>

       
       
    </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" align="center" style="height:650px"></div>
		  <div id="divProceso"></div>
            <iframe id="iframe" width="100%" height="100%" src="" frameborder="0"></iframe>
            </div>
        </div>
        
      <!--  <div id="footer">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>-->

        <!-- scripts -->
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
