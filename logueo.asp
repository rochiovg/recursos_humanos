<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!- <!--#include file="Include/pd_funcion.asp"--> -->


<%
Response.Expires = 0
Session.Contents.RemoveAll()

Response.ContentType="text/html; charset=iso-8859-1"


id=request("id")
id_proyecto=request("p")


%>



<html>
<head>
<meta name="RRHH" content="">
   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
    <link rel="stylesheet" type="text/css" href="Styles/inei.css">
    
   <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"></script>
   <link rel="stylesheet" href="css/jquery-ui.css" />
<script src="js/jquery-1.9.1.js"></script>
<script src="js/jquery-ui.js"></script>

<script type="text/javascript" src="js/funciones.js?id=<%Now()%>"></script>

 
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
  
var enProceso = false; // lo usamos para ver si hay un proceso activo
var http = getHTTPObject(); // Creamos el objeto XMLHttpRequest
function handleHttpResponse() {
    if (http.readyState == 4) {	
       if (http.status == 200) {	   	
          if (http.responseText.indexOf('invalid') == -1) {
             results = http.responseText.split(",");
			  if( results[0] ==  "1" ){
				  alert("Usted esta descalificado para este proceso");
			   document.getElementById('msj').style.display='block';
			   document.getElementById("msj").innerHTML ="Usted esta descalficado para este proceso!!";
			   setTimeout("document.getElementById('txtDNI').focus();",1);
               document.getElementById("button1").disabled=true;
			   enProceso = false;
			  }else if( results[0] ==  "2"){
			  alert("El DNI ya fue registrado");
			document.getElementById('msj').style.display='block';
			   document.getElementById("msj").innerHTML ="El DNI ya fue registrado!!";
			   setTimeout("document.getElementById('txtDNI').focus();",1);
               document.getElementById("button1").disabled=true;
               enProceso = false;
			  }
			  else{
			  document.getElementById('msj').style.display='none';
			   document.getElementById("button1").disabled=false;
			   enProceso = false;
			  }
          }
       }
    }
}



</script>



 <style type="text/css">
<!--
.style1 {color: #002084}

.botoningresar { 
  background-image:url(images/fondoc1.gif);
  height:20px;
  width:85px;
  background-position:left;
}
.style2 {color: #0066CC}
-->

   </style>

   <link rel="shortcut icon" href="images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
body {
	background-color: #F7F8F9;
}
</style>
</head>
<body oncontextmenu="return false" topmargin=0>
<BR>
<BR>
<BR><BR>

		
<br><BR><BR>
	 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_confirmacionAct.asp">	
     <input type="hidden" name="id_cc" id="id_cc" value="<%=id%>">
     <div id="divContenido">
	<TABLE WIDTH="600" height="300" BORDER=0 CELLSPACING=1 CELLPADDING=1 align='center' >
      <tr>
        <td align="center">
<TABLE WIDTH="600" height="350" BORDER=0 CELLSPACING=1 CELLPADDING=1 align='center' background="images/login.png">
<tr>
	<td height="120" colspan=3 align="center"><strong style="color: #002F5E; font-size:16px" class="titulo">SISTEMA DE CONSECUCION DE RRHH<br>CONSULTA DE INSCRIPCI&Oacute;N</strong></td>
</tr>
<tr>
  <td></td>
  <td align="center" class="titulo">Ingrese N&uacute;mero de DNI</td>
  <td align="center">
</tr>
<tr>	
	<td width="14%">	</td>
	<td width="64%" align="left" class="titulo" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100%" colspan="2">
        <table align="left" border="0"  cellpadding="0" cellspacing="0" width="98%">
	<tr>
		<td width="8%"></td>
		<td width="32%"></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="3" class="titulo"><input name="txtIDPER" id="txtIDPER" type="hidden" value="">
		  <input name="txtID_CC" id="txtID_CC" type="hidden" value="<%=id%>">
          <input name="id_proy" id="id_proy" type="hidden" value="<%=id_proyecto%>">
		  <input name="txtID_proyecto" id="txtID_proyecto" type="hidden" value=""></td>
	</tr>
	<tr>
		<td height="22" colspan="2" align="left" class="criterio">Nro de DNI:</td>
		<td><input 
        type="text" 
        class='e_texto' 
        name="txtDNII" 
        id="txtDNII" 
        value="" 
        maxlength='8'  
        onKeyDown="enter(event, '1')"  
        onKeyPress="return fs_numeros(event)"
        style=" background-color:transparent; border:#004080 solid 1px"></td>
		</tr>
	<tr>
    <td height="22" colspan="2" align="left" class="criterio">Apellido Paterno:</td>
		<td height="22" align="left"><input 
        type="text" 
        class='e_textoA' 
        name="txtApePat" 
        id="txtApePat" 
        value="" 
        maxlength='100'  
        onKeyDown="enter(event,'2')"  
        onKeyPress="return fs_SoloLetrasLog(event)"
        style=" background-color:transparent; border:#004080 solid 1px"></td>
		</tr>
	<tr>
		<td colspan="3" align="left"></td>
		</tr>
	
	<tr>
		<td colspan="3" class="mensaje1"></td>
	</tr>
	<tr>
		<td colspan="2" class="criterio">Apellido Materno:</td>
		<td align='left' height="22"><input 
        type="text" 
        class='e_textoA' 
        name="txtApeMat" 
        id="txtApeMat" 
        value="" 
        maxlength='100'  
        onKeyDown="enter(event,'3')"  
        onKeyPress="return fs_SoloLetrasLog(event)"
        style=" background-color:transparent; border:#004080 solid 1px"></td>
		</tr>
    <tr>
		<td colspan="2" class="criterio" height="22">Nombres:</td>
		<td align='left'><input 
        type="text" 
        class='e_textoA' 
        name="txtNombres" 
        id="txtNombres" 
        value="" 
        maxlength='100'  
        onKeyDown="enter(event,'4')"  
        onKeyPress="return fs_SoloLetrasLog(event)"
        style=" background-color:transparent; border:#004080 solid 1px"></td>
		</tr>
        <tr>
		<td colspan="2" class="criterio" height="22">Fecha Emisi&oacute;n DNI: </td>
		<td align='left'><input class='e_textoA' name="txtFecEmi" maxlength="10" style="width:120; background-color:transparent; border:#004080 solid 1px;  " id="txtFecEmi" type="text" value="" onKeyPress="return fs_numeros(event)" onBlur="verificaFechaT(this.value, this.id)" onKeyUp="this.value=formateafecha(this.value);" /> <span class="alerta">(dd/mm/aaaa)</span>
        </td>
		</tr>
    <tr>
		<td colspan="3" align="center"><input id="button4" name="button4" type=button value=Postular class="boton2" style="font-size:10px" onClick="Validar();" ></td>
	</tr>
    <tr>
        <td height="22" colspan="3" align="left" class="criterio">
		  <span id="msj" style="display:none;" class="mensaje1" >Este DNI ya se encuentra registrado.</span>
		</td>
    </tr>
	</table></td>
      </tr>
    </table><br><br>
	
	</td>
	<td width="22%" align="center"></tr>
</TABLE>

</td>
      </tr>
    </table>
</div>	   


<div id="ficha" align="center"></div>
<div id="ficha_nueva" align="center" class="titulo"><div align="justify"> <strong class="tituloPrin" style="color:#F00">NOTA IMPORTANTE</strong><br>   <span style="text-align:justify; color:#F00"> -LAS FECHAS DE EMISI&Oacute;N DE RNP(REGISTRO NACIONAL DE PROVEEDORES) QUE USTED REGISTRE EN EL PRESENTE LINK DEBEN SER LAS MISMAS QUE FIGURAN EN EL DOCUMENTO F&Iacute;SICO RNP QUE USTED<br>TIENE HABILITADO, AS&Iacute; COMO TODA LA INFORMACI&Oacute;N QUE USTED DECLARE EN LA PRESENTE FICHA DE INSCRIPCI&Oacute;N, EN CASO CONTRARIO ESTA  FICHA SER&Aacute; CONSIDERADA INV&Aacute;LIDA</span></li></ul></div></div>
	  </form>
</body>
</html>

