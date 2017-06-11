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

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '2','"&id_proyecto&"'  ")



	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
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


function verificar_cv(){
	
	var dni=document.getElementById("txtDNI").value;
	
	if (dni==""){
		alert('Ingrese el numero de DNI');
		return false;
		
		}

	ajax=http_request();
	var valores;	
	valores= "dni=" + escape(dni);  // parametros a enviar al servidor	
	
	url="m_vistaEntrevista_.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divCriterio").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divCriterio").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divCriterio").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}

function GuardarCalif(valor, id, idp){
	var valor=valor;
	var id=id;
	var idp=idp;
	
	if (id=='qq'){
			document.getElementById("qq1").checked="";
			document.getElementById("qq2").checked="";
			document.getElementById(idp).checked="checked";
			document.getElementById("qqf").value=valor;
		}
	if (id=='qqs'){
			document.getElementById("qqs1").checked="";
			document.getElementById("qqs2").checked="";
			document.getElementById(idp).checked="checked";
			document.getElementById("qqsf").value=valor;
		}
		
		
	if (id=='pp'){
			document.getElementById("pp1").checked="";
			document.getElementById("pp2").checked="";
			document.getElementById("pp3").checked="";
			document.getElementById("pp4").checked="";
			document.getElementById(idp).checked="checked";
			document.getElementById("ppf").value=valor;
		}
	if (id=='ta'){
			document.getElementById("ta1").checked="";
			document.getElementById("ta2").checked="";
			document.getElementById("ta3").checked="";
			document.getElementById("ta4").checked="";
			document.getElementById(idp).checked="checked";
			document.getElementById("taf").value=valor;
		}
	if (id=='pr'){
			document.getElementById("pr1").checked="";
			document.getElementById("pr2").checked="";
			document.getElementById("pr3").checked="";
			document.getElementById("pr4").checked="";
			document.getElementById(idp).checked="checked";
			document.getElementById("prf").value=valor;
		}
	if (id=='in'){
			document.getElementById("in1").checked="";
			document.getElementById("in2").checked="";
			document.getElementById("in3").checked="";
			document.getElementById("in4").checked="";
			document.getElementById(idp).checked="checked";
			document.getElementById("inf").value=valor;
		}
	if (id=='vo'){
			document.getElementById("vo1").checked="";
			document.getElementById("vo2").checked="";
			document.getElementById("vo3").checked="";
			document.getElementById("vo4").checked="";
			document.getElementById(idp).checked="checked";
			document.getElementById("vof").value=valor;
		}
	if (id=='mo'){
			document.getElementById("mo1").checked="";
			document.getElementById("mo2").checked="";
			document.getElementById("mo3").checked="";
			document.getElementById("mo4").checked="";
			document.getElementById(idp).checked="checked";
			document.getElementById("mof").value=valor;
		}

}


	function GuradarEntrevistaNSP()
{
var agree=confirm("Esta seguro de realizar esta accion?");
if (agree)
	GuradarEnt() ;
else
	return false ;
}


function GuradarEnt(){
	var id_proyecto=document.getElementById("id_proyecto").value;
	var dni=document.getElementById("txtDNI").value;
	
	ajax=http_request();
	var valores;	
	valores= "dni=" + escape(dni)+"&id_proyecto="+escape(id_proyecto);  // parametros a enviar al servidor	
	
	url="m_Guardar_entrevista.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divCriterio").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					alert('Los datos se guardaron Correctamente');
					verificar_cv();

            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divCriterio").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function GuradarEntrevista(){
	var pp=document.getElementById("ppf").value;
	var ta=document.getElementById("taf").value;
	var pr=document.getElementById("prf").value;
	var inf=document.getElementById("inf").value;
	var vo=document.getElementById("vof").value;
	var mo=document.getElementById("mof").value;
	
	var qqf=document.getElementById("qqf").value;
	var qqsf=document.getElementById("qqsf").value;
	var dni=document.getElementById("txtDNI").value;
	var dpto=document.getElementById("txtDpto1").value;
	var id_proyecto=document.getElementById("id_proyecto").value;
	var id_usuario=document.getElementById("id_usuario").value;
	var ipVisitante=document.getElementById("ipVisitante").value;
	var obs=document.getElementById("txtobs").value;
	
	var dpto1 = dpto.substring(0,2);

	if (pp=='0'){
	alert('Califique presentacion personal');
	return false;
	}
	if (ta=='0'){
	alert('Califique Desenvolvimiento');	
	return false;
	}
	
	if (pr=='0'){
	alert('Califique dominio del lenguaje');	
	return false;
	}
	
	if (inf=='0'){
	alert('Califique Informacion');	
	return false;
	}
	if (vo=='0'){
	alert('Califique vocacion de servicio');	
	return false;
	}
	
	if (mo=='0'){
	alert('Califique motivacion');	
	return false;
	}
	
	ajax=http_request();
	var valores;	
	valores= "dni=" + escape(dni)+"&pp="+escape(pp)+"&ta="+escape(ta)+"&pr="+escape(pr)+"&vo="+escape(vo)+"&inf="+escape(inf)+"&mo="+escape(mo)+"&qqf="+escape(qqf)+"&qqsf="+escape(qqsf)+"&id_proyecto="+escape(id_proyecto)+"&id_usuario="+escape(id_usuario)+"&ipVisitante="+escape(ipVisitante)+"&obs="+escape(obs)+"&lsTipo=101";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divCriterio").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divCriterio").innerHTML =ajax.responseText;
					alert('Los datos se guardaron Correctamente');
					verificar_cv();
            }
            else if(ajax.status==404){
                     document.getElementById("divCriterio").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("divCriterio").innerHTML = ajax.responseText;					 
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
    <div id="botones" align="center"></div><br>
       <div id="entrevista" style="width:100%; height:100%">
       <table width="50%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  		<thead>
          	<tr>
 	        <td colspan="3"  class="titulo">ENTREVISTA PERSONAL<BR>Busqueda de postulante por DNI
 	          <input type="hidden" name="id_proyecto" id="id_proyecto" value="<%=id_proyecto%>" />
 	          <input type="hidden" name="id_usuario" id="id_usuario" value="<%=id_usuario%>" />
 	          <input type="hidden" name="ipVisitante" id="ipVisitante" value="<%=ipVisitante%>" /></td>
    </tr>
         </thead>   
            <tfoot>  
                <tr>
			 <td align="center" id="prueba" >DNI: <font class='alerta5' >
			   <input 
									type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtDNI" 
									name="txtDNI" 
									value="" 
									maxlength="8" 
									validchars="0123456789" 
									onkeypress="return TextUtil.allowChars(this, event)" onblur="Validar()" /> <img id = 'btnbuscar' name = 'btnbuscar'  style="cursor:pointer; " onClick="verificar_cv();"  src = "images/buscar.jpg"  ></img>
			 </font></td>
			 <td align="center" id="prueba" > <A href="pdf/instrucciones.pdf" title="RESULTADOS" target="_blank">Instructivo</A> 
             
             </td>
		      </tr>
          </tfoot>
    </table><br><br>
   <!-- <div id="divCriterio" align="center" style=" overflow:auto; border:#346555 solid 1px; height:700px; width:1200px " >    </div>-->
       <div id="divCriterio" align="center" style="width:100%; height:100%;border-style:solid;">    </div>
    </div>

</body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
