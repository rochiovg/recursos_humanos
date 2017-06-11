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
lsUsuario =  Session("id_usuario")
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


function baja_procesar(codigo,tipos,usuario)
{
	ajax=http_request();
	var valores;	
	valores= "codigo="+escape(codigo)+"&tipo="+tipos+"&Usuario="+(usuario)+"&lsTipo=36";  // parametros a enviar al servidor	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
		 document.getElementById("mensa").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
				if (tipos=="2")
				{var  texto="Descartado"}
				else if (tipos=="1")
				{var texto="Ejecutado"}
				
				document.getElementById("e"+codigo).innerHTML="";
				document.getElementById("e"+codigo).innerHTML=texto;
				
				document.getElementById("d"+codigo).innerHTML="";
				document.getElementById("d"+codigo).innerHTML=texto;
				
				document.getElementById("mensa").innerHTML =ajax.responseText;
		
            }
            else if(ajax.status==404){
          document.getElementById("mensa").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

           document.getElementById("mensa").innerHTML = ajax.responseText;	
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

function validar_fecha(valor,id,band)
{
	if (valor!='')
	{
	 valor2= valor.split("/") ;

		dateIng=new Date ()
		dateIng.setMonth(parseInt(valor2[1]) - 1); 
		dateIng.setDate(valor2[0]);
		dateIng.setYear(valor2[2]);
		
		dateIni=new Date ()
		dateIni.setDate(01);
		dateIni.setMonth(02); 
		dateIni.setYear(2012);
		
		dateFin=new Date ()
		dateFin.setDate(30);
		dateFin.setMonth(07); 
		dateFin.setYear(2012);
                                                 


 var difIni = dateIng.getTime()  - dateIni.getTime()   ; //quiero positivo
 var difFin = dateFin.getTime()  - dateIng.getTime()   ; // quiero positivo 

		 if (difIni<0 || difFin<0 )
		 {alert("Fecha err\xf3nea");
		document.getElementById(id).value=''
		document.getElementById(id).focus();
		return false;
		 }
			 
			if (band=='2')// fecha de fin de contrato  con la de inicio de contrato	
			 {
					valor1=document.getElementById("txtititu").value;
				 	valor3= valor1.split("/") ;
					date2=new Date ()
					date2.setMonth(parseInt(valor3[1]) - 1); 
					date2.setDate(valor3[0]);
					date2.setYear(valor3[2]);
				 var difi1= dateIng.getTime()  - date2.getTime() 
				  if (difi1<0  )
						 {alert("Fecha err\xf3nea");
						document.getElementById(id).value=''
						document.getElementById(id).focus();
						 }else 
						 {
							 
						 }
				}else if (band=='3')
					{
					
					valor1=document.getElementById("txtftitu").value;
				 
					if (valor1=='')
					{alert("Ingresa Fecha de fin de contrato")
					return false;
					}
				 	valor3= valor1.split("/") ;
					date2=new Date ()
					date2.setMonth(parseInt(valor3[1]) - 1); 
					date2.setDate(valor3[0]);
					date2.setYear(valor3[2]);
				 var difi1= dateIng.getTime()  - date2.getTime() 
				  if (difi1<0  )
						 {alert("Fecha de Inicio debe de ser mayor a la final de contrato");
						document.getElementById(id).value=''
						document.getElementById(id).focus();
						 }	
						
						
					}
	}


}

function alerta_datos(dni,cab,usuario)
{
var valor;
 if (cab.checked == true)
valor=1;
else if (cab.checked == false)
valor=0;

	ajax=http_request();
		var valores;	
		valores= "dni="+dni+"&valor="+valor+"&usuario="+usuario+"&lsTipo=30";  // parametros a enviar al servidor	
		
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
						alert("Ingrese otro n\xFAmero de DNI");
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

	
</script>
    </head>
    <body>
        <div id="top">
      <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Procesos: Ejecutar Bajas</span></div>
        <div id="lateral">
            <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
      <table width='260' border='0' cellpadding="2" cellspacing="2">
      <tr>
        <td colspan="2"  align="left" bgcolor="#F7F8F9"><span class="criterio"> <span class="alerta5">(*)</span></span><span class="proyecto">Campo Obligatorio</span></td>
      </tr>
      <tr>
        <td width="94" align="right" bgcolor="#F7F8F9"><span class="criterio" id="nomreg">Fecha:</span></td>
        <td width="152" align="left" bgcolor="#F7F8F9" id="reg"><input name="txtfecha" type="text" class="e_input" id="txtfecha" onkeyup="this.value=formateafecha(this.value);" size="10" maxlength="10" /></td>
      </tr>

       
      <tr height=22>
        <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                            name='button1'  type='button' class="boton" 				
                            id='button1' 
                            onClick="javascript:ejecutar_baja('<%=lsUsuario%>')" 
                            value='Aceptar'></td>
      </tr>
      <tr height=22>
        <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                            name='button2'  type='button' class="boton" 				
                            id='button2' 
                            onclick="javascript:exp_AB3()" 
                            value='F2 Ejecutado' /></td>
      </tr>
      </table>
    </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
            <div id="divDetallem" style="width:100%; height:280px; overflow:auto; float: left ; position: inherit; vertical-align:top;"> </div>
              
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
