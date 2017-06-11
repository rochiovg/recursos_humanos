<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
id_usuario=Session("id_usuario")
lsUbigeoDist = Session("UbigeoDist") 
id_proyecto=session("id_proyecto")

id_Conv=Request.Form("id_Conv")

ipVisitante = Request.ServerVariables("REMOTE_ADDR")


SQL1 = "exec dbo.ps_algoritmoCV_listar_uno '" & id_Conv & "' "	

	Set RSCuad = Server.CreateObject("ADODB.Recordset")

	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3
	
	
	If Not RSCuad.BOF And Not RSCuad.EOF Then
	
	t1=RSCuad.Fields("ILETRADO")
	t2=RSCuad.Fields("PRIMARIA")
	t3=RSCuad.Fields("SECUNDARIA")
	t4=RSCuad.Fields("SUPERIOR_NOUNIV_PREGRADO")
	t5=RSCuad.Fields("SUPERIOR_NOUNIV_EGRESADO")
	t6=RSCuad.Fields("SUPERIOR_NOUNIV_TITULADO")
	t7=RSCuad.Fields("SUPERIOR_PREGRADO")
	t8=RSCuad.Fields("SUPERIOR_EGRESADO")
	t9=RSCuad.Fields("SUPERIOR_BACHILLER")
	t10=RSCuad.Fields("SUPERIOR_TITULADO")
	t11=RSCuad.Fields("SUPERIOR_MAGISTER")
	t12=RSCuad.Fields("SUPERIOR_DOCTORADO")
	t13=RSCuad.Fields("SUPERIOR_EST_MAESTRIA")
	t14=RSCuad.Fields("SUPERIOR_EST_DOCTORADO")
	t15=RSCuad.Fields("EXP_GEN_ANIOS_I1")
	t16=RSCuad.Fields("EXP_GEN_ANIOS_I1F")
	t17=RSCuad.Fields("EXP_GEN_ANIOS_I1_PUNTOS")
	t18=RSCuad.Fields("EXP_GEN_ANIOS_I2")
	t19=RSCuad.Fields("EXP_GEN_ANIOS_I2F")
	t20=RSCuad.Fields("EXP_GEN_ANIOS_I2_PUNTOS")
	t21=RSCuad.Fields("EXP_GEN_PUNTOS_I3")
	t22=RSCuad.Fields("EXP_GEN_PUNTOS_I3F")
	t23=RSCuad.Fields("EXP_GEN_PUNTOS_I3_PUNTOS")
	t24=RSCuad.Fields("EXP_GEN_CAMPO_I1")
	t25=RSCuad.Fields("EXP_GEN_CAMPO_I1F")
	t26=RSCuad.Fields("EXP_GEN_CAMPO_I1_PUNTOS")
	t27=RSCuad.Fields("EXP_GEN_CAMPO_I2")
	t28=RSCuad.Fields("EXP_GEN_CAMPO_I2F")
	t29=RSCuad.Fields("EXP_GEN_CAMPO_I2_PUNTOS")
	t30=RSCuad.Fields("EXP_GEN_CAMPO_I3")
	t31=RSCuad.Fields("EXP_GEN_CAMPO_I3F")
	t32=RSCuad.Fields("EXP_GEN_CAMPO_I3_PUNTOS")
	t33=RSCuad.Fields("EXP_GEN_MANG_I1")
	t34=RSCuad.Fields("EXP_GEN_MANG_I1F")
	t35=RSCuad.Fields("EXP_GEN_MANG_I1_PUNTOS")
	t36=RSCuad.Fields("EXP_GEN_MANG_I2")
	t37=RSCuad.Fields("EXP_GEN_MANG_I2F")
	t38=RSCuad.Fields("EXP_GEN_MANG_I2_PUNTOS")
	t39=RSCuad.Fields("EXP_GEN_MANG_I3")
	t40=RSCuad.Fields("EXP_GEN_MANG_I3F")
	t41=RSCuad.Fields("EXP_GEN_MANG_I3_PUNTOS")
	t42=RSCuad.Fields("CAPACITACION_I1I")
	t43=RSCuad.Fields("CAPACITACION_I1F")
	t44=RSCuad.Fields("CAPACITACION_I1_PUNTOS")
	t45=RSCuad.Fields("CAPACITACION_I2I")
	t46=RSCuad.Fields("CAPACITACION_I2F")
	t47=RSCuad.Fields("CAPACITACION_I2_PUNTOS")
	t48=RSCuad.Fields("CAPACITACION_I3I")
	t49=RSCuad.Fields("CAPACITACION_I3F")
	t50=RSCuad.Fields("CAPACITACION_I3_PUNTOS")
	t51=RSCuad.Fields("PUNTAJE_MINIMO")
	exp1=RSCuad.Fields("Experiencia_1")
	exp2=RSCuad.Fields("Experiencia_2")


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


	
	
</script>
    </head>
    <body>
       
    
    <table  border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    <tr bgcolor="#FDF7DB"><td colspan="6">Nivel de estudio</td></tr>
    <tr bgcolor="#FDF7DB" align="center">
    <td width="90">Iletrado<br><input name="txt1" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt1" value="<%=t1%>"  size="5" maxlength="5" /></td>
    <td width="77">Primaria<br><input name="txtPr" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt2" value="<%=t2%>"  size="5" maxlength="5" /></td>
    <td width="78">Secundaria<br><input name="txt3"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt3" value="<%=t3%>"  size="5" maxlength="5" /></td>
    <td width="79">Superior No UNiv. Pregrado<br>
      <input name="txt4"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt4" value="<%=t4%>"  size="5" maxlength="5" />
      <strong></strong></td>    
    <td width="85">Superior No Univ. Egresado<br>
      <input name="txt5"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt5" value="<%=t5%>"  size="5" maxlength="5" /><strong></strong></td>    
    <td width="88">Superior No Univ Titulado<br>
      <input name="txt6"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt6" value="<%=t6%>"  size="5" maxlength="5" /></td>    
    </tr>
    <tr  bgcolor="#FDF7DB"  align="center">
    <td>Superior pregrado<br>
      <input name="txt7"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt7" value="<%=t7%>"  size="5" maxlength="5" />      <br></td>
    <td>Superior Egresado<br>
      <input name="txt8"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt8" value="<%=t8%>"  size="5" maxlength="5" />
      <strong></strong></td>
    <td>Superior bachiller <br>
      <input name="txt9" validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt9" value="<%=t9%>"  size="5" maxlength="5" /></td>
    <td>Superior Titulado <br>
      <input name="txt10"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt10" value="<%=t10%>"  size="5" maxlength="5" /></td>    
    <td>Superior Maestria <br>
      <input name="txt11"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt11" value="<%=t11%>"  size="5" maxlength="5" /></td>    
    <td>Superior Doctorado <br>
      <input name="txt12"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt12" value="<%=t12%>"  size="5" maxlength="5" /></td>    
    </tr>
    <tr  bgcolor="#FDF7DB"  align="center">
    <td>Sup
      
      erior Estudio Mestria<br>
      <input name="txt13"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt13" value="<%=t13%>"  size="5" maxlength="5" /></td>
    <td>Superior Estudio Doctorado<br>
      <input name="txt14"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt14" value="<%=t14%>"  size="5" maxlength="5" />
      <strong></strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>    
    <td>&nbsp;</td>    
    <td>&nbsp;</td>    
    </tr>
    <tr bgcolor="#E1F5FF">
      <td colspan="6">Experiencia (Registro en Meses)</td></tr>
      <tr bgcolor="#E1F5FF">
      <td colspan="6">Experiencia General</td></tr>
     <tr bgcolor="#E1F5FF" align="center">
    <td>1er. Intervalo<br>
      <input name="txt151"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt151" value="<%=t15%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt152"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt152" value="<%=t16%>"  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt16"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt16" value="<%=t17%>"  size="5" maxlength="5" />
      <br>
      <strong></strong></td>
    <td>2do. &nbsp;Intervalo <br>
      <input name="txt171"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt171" value="<%=t18%>"  size="5" maxlength="5" /&nbsp;-&nbsp;>&nbsp;-&nbsp;<input name="txt172"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt172" value="<%=t19%>"  size="5" maxlength="5" /&nbsp;-&nbsp;></td>
    <td>Puntos<br>
      <input name="txt18"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt18" value="<%=t20%>"  size="5" maxlength="5" />
      <strong></strong></td>    
    <td>3er. &nbsp;Intervalo <br>
      <input name="txt191"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt191" value="<%=t21%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt192"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt192" value="<%=t22%>"  size="5" maxlength="5" /></td>    
    <td>Puntos<br>
      <input name="txt20"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt20" value="<%=t23%>"  size="5" maxlength="5" />
      <strong></strong></td>    
    </tr>
    <tr bgcolor="#E1F5FF">
      <td colspan="6"><font id="ex1"><%=exp1%></font></td></tr>
     <tr bgcolor="#E1F5FF" align="center">
    <td>1er. &nbsp;Intervalo <br>
      <input name="txt211"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt211" value="<%=t24%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt212"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt212" value="<%=t25%>"  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt22"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt22" value="<%=t26%>"  size="5" maxlength="5" />
      <strong></strong></td>
    <td>2do. &nbsp;Intervalo <br>
      <input name="txt231"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt231" value="<%=t27%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt232"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt232" value="<%=t28%>"  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt24"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt24" value="<%=t29%>"  size="5" maxlength="5" />
      <strong></strong></td>    
    <td>3er. &nbsp;Intervalo <br> 
      <input name="txt251"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt251" value="<%=t30%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt252"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt252" value="<%=t31%>"  size="5" maxlength="5" /></td>    
    <td>Puntos<br>
      <input name="txt26"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt26" value="<%=t32%>"  size="5" maxlength="5" />
      <strong></strong></td>    
    </tr>
    <tr bgcolor="#E1F5FF">
      <td colspan="6"><font id="ex2"><%=exp2%></font></td></tr>
     <tr bgcolor="#E1F5FF" align="center">
    <td>1er. &nbsp;Intervalo  <br>
      <input name="txt271"validchars="0123456789()," onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt271" value="<%=t33%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt272"validchars="0123456789()," onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt272" value="<%=t34%>"  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt28"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt28" value="<%=t35%>"  size="5" maxlength="5" />
      <strong></strong></td>
    <td>2do. &nbsp;Intervalo <br>
      <input name="txt291"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt291" value="<%=t36%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt292"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt292" value="<%=t37%>"  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt30"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt30" value="<%=t38%>"  size="5" maxlength="5" />
      <strong></strong></td>    
    <td>3er. &nbsp;Intervalo <br>
      <input name="txt311"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt311" value="<%=t39%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt312"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt312" value="<%=t40%>"  size="5" maxlength="5" /></td>    
    <td>Puntos<br>
      <input name="txt32"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt32" value="<%=t41%>"  size="5" maxlength="5" />
      <strong></strong></td>    
    </tr>
    
    <tr bgcolor="#FFB0B0">
    <td colspan="6">Curso de Capacitaci&oacute;n:</td>
    </tr>
    
    <tr bgcolor="#FFB0B0">
    <td>1er. &nbsp;Intervalo  <br>
      <input name="txtcci1"validchars="0123456789()," onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcci1" value="<%=t42%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txtccf1"validchars="0123456789()," onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtccf1" value="<%=t43%>"  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txtcapp1"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcapp1" value="<%=t44%>"  size="5" maxlength="5" />
      <strong></strong></td>
    <td>2do. &nbsp;Intervalo <br>
      <input name="txtcci2"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcci2" value="<%=t45%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txtccf2"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtccf2" value="<%=t46%>"  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txtcapp2"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcapp2" value="<%=t47%>"  size="5" maxlength="5" />
      <strong></strong></td>    
    <td>3er. &nbsp;Intervalo <br>
      <input name="txtcci3"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcci3" value="<%=t48%>"  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txtccf3"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtccf3" value="<%=t49%>"  size="5" maxlength="5" /></td>    
    <td>Puntos<br>
      <input name="txtcapp3"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcapp3" value="<%=t50%>"  size="5" maxlength="5" />
      <strong></strong></td>
    </tr>
    
     <tr bgcolor="#D0EEC4" >
    <td>Agregar Cargos</td>
    <td><img src="images/nivel.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:abrepopup()" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>    
    <td>&nbsp;</td>    
    <td>&nbsp;</td>    
    </tr><strong></strong>
    
    <tr bgcolor="#D8B3EC">
    <td>Valor Minimo</td>
    <td><input name="txt33"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt33" value="<%=t51%>"  size="10" maxlength="5" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>    
    <td>&nbsp;</td>    
    <td>&nbsp;</td>    
    </tr>
    <tr>
      <td align="center" colspan="6"><span class="alerta4">
        <input name="button" type="button" class="boton" id="button" value="Actualizar" onclick="guardarLogaritmo()" />
      </span></td></tr>
    </table>
    <%else
	response.Write("No existen datos")
	end if%> 

</body>
</html>

