<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 

<%
sub generaDpto()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_CCDD_CONVO_uno '"&id&"' ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1""  name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaProyectos()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_CUENTA_ACCESOPROYECTOS ")


	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""txtProyecto""  name=""txtProyecto"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("id_proyecto") & """>"& Server.HtmlEncode(wRsDptoapli("desc_proyecto")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

Response.Expires = 0
Session.Contents.RemoveAll()


If Request.Form <> "" Then
    
  strRpta =""
  strUsuario = Request.Form("txtU")
  strClave = Request.Form("txtC")
  strNombre = ""
  strTipoUsuario = ""
  strMensaje = ""
  strUbigeo = ""
  strUbigeoapli = ""
  strPuesto = ""
  strCargosEv = ""
  strCargoUsuario = ""
  strProyecto = ""
  strMeta = ""
  'proyecto = Request.Form("txtProyecto")
  proyecto = "177"

 strRpta = validarUsuario(strUsuario, strClave, strUbigeo, strPuesto, strNombre, strTipoUsuario, strUbigeoapli,strUbigeoDist,meta,nmeta,actividad,proyecto,id_usuario,strCargosEv,strCargoUsuario,strProyecto,strMeta, strAula,srtCuenta_competencias,srtSedeReg,srtSedeProv,srtSedeDist,  zona,  seccion_i,   subccdd ,   subccpp ,   subccdi  ,    subzona ,   subseccion )
 	   
  If strRpta = "USUARIO_ACTIVO" Then
    Session.Timeout = 50
    Session("txtUsuarioValido") = strUsuario
	Session("id_usuario") = id_usuario
    Session("txtNombreValido") = strNombre
    Session("txtTipoUsuarioValido") = strTipoUsuario
	Session("txtEstadoUsuario") = strFlag
	Session("Ubigeo") = strUbigeo
	Session("Ubigeoapli") = strUbigeoapli
	Session("UbigeoDist") = strUbigeoDist
	Session("cmeta") = meta
	Session("nmeta") = nmeta
	Session("actividad") = actividad
	Session("id_proyecto") = proyecto
	Session("cargosEvaluar") = strCargosEv
	Session("cargoUsuario") = strCargoUsuario
	Session("codigoProyecto") = strProyecto
	Session("codigoMeta") = strMeta
	Session("aulas") = strAula
	Session("cuenta_competencias") = srtCuenta_competencias
	Session("sedeReg") = srtSedeReg
	Session("sedeProv") = srtSedeProv
	Session("sedeDist") = srtSedeDist
	
	
	 
	Session("zona") = zona
	Session("seccion_i") = seccion_i
	Session("subccdd") = subccdd
	Session("subccpp") = subccpp
	Session("subccdi") = subccdi
	Session("subzona") = subzona
	Session("subseccion") = subseccion
	

   Response.Redirect("pd_welcome.asp")



  Else
    Select Case strRpta
    Case "USUARIO_NO_ACTIVO"
      strMensaje = "Usuario no est� activo."
    Case "USUARIO_NO_VALIDADO"
      strMensaje = "Usuario o Contrase�a incorrecta.<BR>Vuelva a intentarlo."
    End Select
  End If
End If
%>



<html>
<head>
   <title>..::SISTEMA DE GESTI&Oacute;N DE RRHH::..</title>
<meta name="MULTIPROYECTO" content="">
   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
<script language=JavaScript1.1 src="js/cliente.js"></script>

<script>

/*
function validarNumeros(valor){
	var key=window.event.keyCode;
	if (key==8 || key!=13) return true;
	if (key!=13 || key!=8){
		var objnum = eventoKey(valor);
		var expr = /^([a-z]|[A-Z]|@|�|�|\s)*$/;
		if (expr.test(valor)) {
			return true;
		} else {
			alert("Ingrese solo numeros o letras");
			return false;
		}
	}
}					
*/
	function enviar(){
		if(document.form1.txtU.value==""){
			alert("Ingrese su Usuario");
			document.form1.txtU.focus();
			return false;
		}
		if(document.form1.txtC.value==""){
			alert("Ingrese su Contrase�a");
			document.form1.txtC.focus();
			return false;
		}
		
		document.form1.submit();

	}
	function enter(e){
		if (e.keyCode==13)
		enviar();
	}
	function mayuscula(objeto){ 
		objeto.value = objeto.value.toUpperCase();
	}

	function cargar()
	{
	document.form1.txtU.focus();
	}
	
	
</script>

   <link rel="shortcut icon" href="images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript" src="js/funciones.js"></script>

</head>
<body onLoad="cargar()" oncontextmenu="return false" topmargin=0>
<BR>
<BR>
<BR><BR>
<div id="divContenido">
	
		
<br><BR><BR>	
	<TABLE WIDTH="600" height="300" BORDER=0 CELLSPACING=1 CELLPADDING=1 align='center' >
      <tr>
        <td align="center"><FORM action="default.asp" method="POST" id="form1" name="form1" onload="buscar('none')">
<TABLE WIDTH="600" height="350" BORDER=0 CELLSPACING=1 CELLPADDING=1 align='center' background="images/login.png">
<tr>
	<td height="120" colspan=3 align="center"><strong style="color: #002F5E; font-size:16px" class="titulo">SISTEMA DE CONSECUCION DE RRHH <BR>CENSO 2017</strong></td>
</tr>
<tr>
  <td></td>
  <td align="center" class="titulo">Ingrese Usuario y Contrase�a</td>
  <td align="center">
</tr>
<tr>	
	<td width="24%">	</td>
	<td width="54%" align="left" class="titulo" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="100%" colspan="2"><table align="left" border="0"  cellpadding="0" cellspacing="0" width="98%">
	<tr>
		<td width="20%"></td>
		<td width="24%"></td>
		<td width="56%"></td>
	</tr>
	<tr>
		<td colspan="3" class="titulo">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td height="22" align="left"></td>
		<td align="left" class="criterio">Usuario:</td>
		<td><input 
        type="text" 
        class='e_texto' 
        name="txtU" 
        value="<%=strUsuario%>" 
        maxlength='50'  
        onKeyDown="enter(event)" 
        onKeyPress="if (event.keyCode == 13) enviar(); return fs_alfanumerico(event)"
       	style=" background-color:transparent; border:#004080 solid 1px"  onpaste="return false"></td>
	</tr>
	<tr>
		<td align="left"  height="22"></td>
		<td align="left" class="criterio">Contrase�a:</td>
		<td>
			<input type="password" class='e_texto' name="txtC" maxlength='20' style=" background-color:transparent; border:#004080 solid 1px"	onKeyPress="if (event.keyCode == 13) enviar(); return fs_alfanumerico(event)"  onpaste="return false" >
		</td>
	</tr>
    <!-- tr>
		<td align="left"  height="22"></td>
		<td align="left" class="criterio">Proyecto:</td>
		<td><%generaProyectos()%></td>
	</tr -->
	
	<tr>
		<td colspan="3" class="mensaje1"><b><%=strMensaje%></b></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align='left'>
		<input type=button value=Aceptar class="boton2" style="font-size:10px" onClick="enviar();" >
		</td>
		<td align='center'>
		  <input type=reset value=Cancelar style="font-size:10px" class="boton2">
		</td>
	</tr>
	</table></td>
      </tr>
    </table><br><br>
	 
     
	</td>
	<td width="22%" align="center"></tr>
</TABLE>

</FORM>
</td>
      </tr>
    </table>

</div>
</body>
</html>

