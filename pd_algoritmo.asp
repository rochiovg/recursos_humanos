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

sub generaAlgoritmo()
			
	set wRsDptoapli = Micone.execute(" exec dbo.pa_convocatoriacargo_cargoConv '"&id_proyecto&"'  ")

	Response.Write "<select class=""e_combo"" style=""width:250px"" id=""cmbCargo"" name=""cmbCargo"" onchange=""Guardarvalor(this.value);"">"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
Response.Write "<option title="""&wRsDptoapli(1)&""" value=""" &wRsDptoapli(2)&"*"&wRsDptoapli(3)&"*"&wRsDptoapli(4)&"*"&wRsDptoapli(5)&"*"&wRsDptoapli(6)& """>Convocatoria: "&wRsDptoapli(0)&" - "&wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
 
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

function Guardarvalor(valor){
	var acargo = valor;
	var lcargo=acargo.split("*");
	var id_proyecto=lcargo[0];
	var id_presupuesto=lcargo[1];
	var id_Conv=lcargo[2];
	var exp1=lcargo[3];
	var exp2=lcargo[4];

	document.getElementById("id_proy").value=id_proyecto;
	document.getElementById("id_Presupuesto").value=id_presupuesto;
	document.getElementById("id_cc").value=id_Conv;
	
	if (exp1==""){
		document.getElementById("ex1").innerHTML="Años o meses de experiencia en trabajos de Campo (Censo y/o Encuestas)";
	}else{
		document.getElementById("txtExp1").value=exp1;
		document.getElementById("ex1").innerHTML=exp1;
	}
	
	if (exp2==""){
		document.getElementById("ex2").innerHTML="Experiencia en manejo de Grupos";
				
	}else{
		document.getElementById("txtExp2").value=exp1;
		document.getElementById("ex2").innerHTML=exp1;
	}
	
	document.getElementById("Contenido").style.display="";
	
}


function guardarLogaritmo(){
	id_proyecto=document.getElementById("id_proy").value;
	id_presupuesto=document.getElementById("id_Presupuesto").value;
	id_Conv=document.getElementById("id_cc").value;
	
	if (id_presupuesto==""){
		alert('Seleccione el cargo')
		return false;
		}
	
	var var1=document.getElementById("txt1").value;
	var var2=document.getElementById("txt2").value;
	var var3=document.getElementById("txt3").value;
	var var4=document.getElementById("txt4").value;
	var var5=document.getElementById("txt5").value;
	var var6=document.getElementById("txt6").value;
	var var7=document.getElementById("txt7").value;
	var var8=document.getElementById("txt8").value;
	var var9=document.getElementById("txt9").value;
	var var10=document.getElementById("txt10").value;
	var var11=document.getElementById("txt11").value;
	var var12=document.getElementById("txt12").value;
	var var13=document.getElementById("txt13").value;
	var var14=document.getElementById("txt14").value;
	var var151=document.getElementById("txt151").value;
	var var152=document.getElementById("txt152").value;
	var var16=document.getElementById("txt16").value;
	var var171=document.getElementById("txt171").value;
	var var172=document.getElementById("txt172").value;
	var var18=document.getElementById("txt18").value;
	var var191=document.getElementById("txt191").value;
	var var192=document.getElementById("txt192").value;
	var var20=document.getElementById("txt20").value;
	var var211=document.getElementById("txt211").value;
	var var212=document.getElementById("txt212").value;
	var var22=document.getElementById("txt22").value;
	var var231=document.getElementById("txt231").value;
	var var232=document.getElementById("txt232").value;
	var var24=document.getElementById("txt24").value;
	var var251=document.getElementById("txt251").value;
	var var252=document.getElementById("txt252").value;
	var var26=document.getElementById("txt26").value;
	var var271=document.getElementById("txt271").value;
	var var272=document.getElementById("txt272").value;
	var var28=document.getElementById("txt28").value;
	var var291=document.getElementById("txt291").value;
	var var292=document.getElementById("txt292").value;
	var var30=document.getElementById("txt30").value;
	var var311=document.getElementById("txt311").value;
	var var312=document.getElementById("txt312").value;
	var var32=document.getElementById("txt32").value;
	var var33=document.getElementById("txt33").value;
	
	var txtcci1=document.getElementById("txtcci1").value;
	var txtccf1=document.getElementById("txtccf1").value;
	var txtcapp1=document.getElementById("txtcapp1").value;
	var txtcci2=document.getElementById("txtcci2").value;
	var txtccf2=document.getElementById("txtccf2").value;
	var txtcapp2=document.getElementById("txtcapp2").value;
	var txtcci3=document.getElementById("txtcci3").value;
	var txtccf3=document.getElementById("txtccf3").value;
	var txtcapp3=document.getElementById("txtcapp3").value;	
	
	ajax=http_request();
	var valores;	
	valores= "var1=" + escape(var1)+"&var2="+escape(var2)+"&var3="+escape(var3)+"&var4="+escape(var4)+"&var5="+escape(var5)+"&var6="+escape(var6)+"&var7="+escape(var7)+"&var8="+escape(var8)+"&var9="+escape(var9)+"&var10="+escape(var10)+"&var11="+escape(var11)+"&var12="+escape(var12)+"&var13="+escape(var13)+"&var14="+escape(var14)+"&var16="+escape(var16)+"&var171="+escape(var171)+"&var18="+escape(var18)+"&var191="+escape(var191)+"&var20="+escape(var20)+"&var211="+escape(var211)+"&var22="+escape(var22)+"&var231="+escape(var231)+"&var24="+escape(var24)+"&var251="+escape(var251)+"&var26="+escape(var26)+"&var271="+escape(var271)+"&var28="+escape(var28)+"&var291="+escape(var291)+"&var30="+escape(var30)+"&var311="+escape(var311)+"&var32="+escape(var32)+"&var33="+escape(var33)+"&var152="+escape(var152)+"&var172="+escape(var172)+"&var192="+escape(var192)+"&var212="+escape(var212)+"&var232="+escape(var232)+"&var252="+escape(var252)+"&var272="+escape(var272)+"&var292="+escape(var292)+"&var312="+escape(var312)+"&id_proyecto="+escape(id_proyecto)+"&id_presupuesto="+escape(id_presupuesto)+"&id_Conv="+escape(id_Conv)+"&txtcci1="+escape(txtcci1)+"&txtccf1="+escape(txtccf1)+"&txtcapp1="+escape(txtcapp1)+"&txtcci2="+escape(txtcci2)+"&txtccf2="+escape(txtccf2)+"&txtcapp2="+escape(txtcapp2)+"&txtcci3="+escape(txtcci3)+"&txtccf3="+escape(txtccf3)+"&txtcapp3="+escape(txtcapp3)+"&lsTipo=102";  

url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divCriterio").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divCriterio").innerHTML =ajax.responseText;
					alert('Los datos se guardaron correctamente')
					limpiardatos();
					
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
	
function limpiardatos(){
	
document.getElementById("txt1").value="";
document.getElementById("txt2").value="";
document.getElementById("txt3").value="";
document.getElementById("txt4").value="";
document.getElementById("txt5").value="";
document.getElementById("txt6").value="";
document.getElementById("txt7").value="";
document.getElementById("txt8").value="";
document.getElementById("txt9").value="";
document.getElementById("txt10").value="";
document.getElementById("txt11").value="";
document.getElementById("txt12").value="";
document.getElementById("txt13").value="";
document.getElementById("txt14").value="";
document.getElementById("txt151").value="";
document.getElementById("txt152").value="";
document.getElementById("txt16").value="";
document.getElementById("txt171").value="";
document.getElementById("txt172").value="";
document.getElementById("txt18").value="";
document.getElementById("txt191").value="";
document.getElementById("txt192").value="";
document.getElementById("txt20").value="";
document.getElementById("txt211").value="";
document.getElementById("txt212").value="";
document.getElementById("txt22").value="";


}


	
var miPopup 
function abrepopup(){ 
miPopup=window.open("pd_agregarCargo.asp","miwin","width=900,height=600") 
miPopup.focus() 
} 	
	
	
</script>
    </head>
    <body>
        <div id="top">
      <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
       <div id="divNavegacion" align="center"><span class="subtitulo"><%=Session("cmeta")&"-"&Session("nmeta")%> </span></div>
       <table width="50%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <thead><tr>
 	      <th colspan=5 bgcolor="#DAE8F3" class="aplicacion">
</th>
 	    
          <tr>
 	        <td colspan="2"  class="titulo">ALGORITMOS DE EVALUACI&Oacute;N DE CVs<BR>
 	          Busqueda de cargos convocados
 	            <input type="hidden" name="id_proyecto" id="id_proyecto" value="<%=id_proyecto%>" />
            <input type="hidden" name="id_usuario" id="id_usuario" value="<%=id_usuario%>" />
            <input type="hidden" name="ipVisitante" id="ipVisitante" value="<%=ipVisitante%>" />
            
            <input type="hidden" name="id_proy" id="id_proy" value="" />
            <input type="hidden" name="id_Pre" id="id_Presupuesto" value="" />
            <input type="hidden" name="id_cc" id="id_cc" value="" />
            
            <input type="hidden" name="txtprofesionesTot" id="txtprofesionesTot" value="" />
            <input type="hidden" name="txtExp1" id="txtExp1" value="" />
            <input type="hidden" name="txtExp2" id="txtExp2" value="" /></td>
    </tr>

           

         </thead>
         <tbody>
         </tbody>    
                <tfoot>  
                <tr>
			 <td width="23%" align="center" id="prueba" >Cargo: </td>
			 <td width="77%" align="left" id="prueba" ><font class='alerta5' ><%generaAlgoritmo()%>
			 </font>&nbsp;</td>
			 </tr>
          </tfoot>
    </table>
    <!-- style="display:none"-->
    <div  style="display:none" id="Contenido">    
    <table  border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    <tr bgcolor="#FDF7DB"><td colspan="6">Nivel de estudio</td></tr>
    <tr bgcolor="#FDF7DB" align="center">
    <td width="90">Iletrado<br><input name="txt1" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt1" value=""  size="5" maxlength="5" /></td>
    <td width="77">Primaria<br><input name="txtPr" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt2" value=""  size="5" maxlength="5" /></td>
    <td width="78">Secundaria<br><input name="txt3"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt3" value=""  size="5" maxlength="5" /></td>
    <td width="79">Superior No UNiv. Pregrado<br>
      <input name="txt4"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt4" value=""  size="5" maxlength="5" />
      <strong></strong></td>    
    <td width="85">Superior No Univ. Egresado<br>
      <input name="txt5"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt5" value=""  size="5" maxlength="5" /><strong></strong></td>    
    <td width="88">Superior No Univ Titulado<br>
      <input name="txt6"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt6" value=""  size="5" maxlength="5" /></td>    
    </tr>
    <tr  bgcolor="#FDF7DB"  align="center">
    <td>Superior pregrado<br>
      <input name="txt7"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt7" value=""  size="5" maxlength="5" />      <br></td>
    <td>Superior Egresado<br>
      <input name="txt8"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt8" value=""  size="5" maxlength="5" />
      <strong></strong></td>
    <td>Superior bachiller <br>
      <input name="txt9" validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt9" value=""  size="5" maxlength="5" /></td>
    <td>Superior Titulado <br>
      <input name="txt10"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt10" value=""  size="5" maxlength="5" /></td>    
    <td>Superior Maestria <br>
      <input name="txt11"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt11" value=""  size="5" maxlength="5" /></td>    
    <td>Superior Doctorado <br>
      <input name="txt12"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt12" value=""  size="5" maxlength="5" /></td>    
    </tr>
    <tr  bgcolor="#FDF7DB"  align="center">
    <td>Sup
      
      erior Estudio Mestria<br>
      <input name="txt13"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt13" value=""  size="5" maxlength="5" /></td>
    <td>Superior Estudio Doctorado<br>
      <input name="txt14"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt14" value=""  size="5" maxlength="5" />
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
      <input name="txt151"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt151" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt152"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt152" value=""  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt16"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt16" value=""  size="5" maxlength="5" />
      <br>
      <strong></strong></td>
    <td>2do. &nbsp;Intervalo <br>
      <input name="txt171"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt171" value=""  size="5" maxlength="5" /&nbsp;-&nbsp;>&nbsp;-&nbsp;<input name="txt172"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt172" value=""  size="5" maxlength="5" /&nbsp;-&nbsp;></td>
    <td>Puntos<br>
      <input name="txt18"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt18" value=""  size="5" maxlength="5" />
      <strong></strong></td>    
    <td>3er. &nbsp;Intervalo <br>
      <input name="txt191"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt191" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt192"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt192" value=""  size="5" maxlength="5" /></td>    
    <td>Puntos<br>
      <input name="txt20"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt20" value=""  size="5" maxlength="5" />
      <strong></strong></td>    
    </tr>
    <tr bgcolor="#E1F5FF">
      <td colspan="6"><font id="ex1"></font></td></tr>
     <tr bgcolor="#E1F5FF" align="center">
    <td>1er. &nbsp;Intervalo <br>
      <input name="txt211"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt211" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt212"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt212" value=""  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt22"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt22" value=""  size="5" maxlength="5" />
      <strong></strong></td>
    <td>2do. &nbsp;Intervalo <br>
      <input name="txt231"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt231" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt232"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt232" value=""  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt24"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt24" value=""  size="5" maxlength="5" />
      <strong></strong></td>    
    <td>3er. &nbsp;Intervalo <br> 
      <input name="txt251"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt251" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt252"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt252" value=""  size="5" maxlength="5" /></td>    
    <td>Puntos<br>
      <input name="txt26"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt26" value=""  size="5" maxlength="5" />
      <strong></strong></td>    
    </tr>
    <tr bgcolor="#E1F5FF">
      <td colspan="6"><font id="ex2"></font></td></tr>
     <tr bgcolor="#E1F5FF" align="center">
    <td>1er. &nbsp;Intervalo  <br>
      <input name="txt271"validchars="0123456789()," onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt271" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt272"validchars="0123456789()," onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt272" value=""  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt28"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt28" value=""  size="5" maxlength="5" />
      <strong></strong></td>
    <td>2do. &nbsp;Intervalo <br>
      <input name="txt291"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt291" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt292"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt292" value=""  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txt30"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt30" value=""  size="5" maxlength="5" />
      <strong></strong></td>    
    <td>3er. &nbsp;Intervalo <br>
      <input name="txt311"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt311" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txt312"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt312" value=""  size="5" maxlength="5" /></td>    
    <td>Puntos<br>
      <input name="txt32"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt32" value=""  size="5" maxlength="5" />
      <strong></strong></td>    
    </tr>
    
    <tr bgcolor="#FFB0B0">
    <td colspan="6">Curso de Capacitaci&oacute;n:</td>
    </tr>
    
    <tr bgcolor="#FFB0B0">
    <td>1er. &nbsp;Intervalo  <br>
      <input name="txtcci1"validchars="0123456789()," onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcci1" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txtccf1"validchars="0123456789()," onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtccf1" value=""  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txtcapp1"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcapp1" value=""  size="5" maxlength="5" />
      <strong></strong></td>
    <td>2do. &nbsp;Intervalo <br>
      <input name="txtcci2"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcci2" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txtccf2"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtccf2" value=""  size="5" maxlength="5" /></td>
    <td>Puntos<br>
      <input name="txtcapp2"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcapp2" value=""  size="5" maxlength="5" />
      <strong></strong></td>    
    <td>3er. &nbsp;Intervalo <br>
      <input name="txtcci3"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcci3" value=""  size="5" maxlength="5" />&nbsp;-&nbsp;<input name="txtccf3"validchars="0123456789()," onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtccf3" value=""  size="5" maxlength="5" /></td>    
    <td>Puntos<br>
      <input name="txtcapp3"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtcapp3" value=""  size="5" maxlength="5" />
      <strong></strong></td>
    </tr>
    
     <tr bgcolor="#D0EEC4" >
    <td>Agregar Cargos</td>
    <td><img src="images/nivel.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:abrepopup()" /></td>
    <td>Puntaje</td>
    <td><input name="txt2"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt15" value=""  size="10" maxlength="5" /></td>    
    <td>&nbsp;</td>    
    <td>&nbsp;</td>    
    </tr><strong></strong>
    
    <tr bgcolor="#D8B3EC">
    <td>Valor Minimo</td>
    <td><input name="txt33"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt33" value=""  size="10" maxlength="5" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>    
    <td>&nbsp;</td>    
    <td>&nbsp;</td>    
    </tr>
    <tr>
      <td align="center" colspan="6"><span class="alerta4">
        <input name="button" type="button" class="boton" id="button" value="Grabar" onclick="guardarLogaritmo()" />
      </span></td></tr>
    </table></div>
    <br>
    <br>
        

</body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
