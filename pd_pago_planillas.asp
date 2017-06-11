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

sub generaSede()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRssede = Micone.execute(" exec dbo.USP_LISTA_SEDE_EDNOM2016 ")
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cboSede"" name=""cboSede"" onChange=""generaLocales();"">"
	
	Response.Write " <option value=""999"">Seleccione</option>"
	While not wRssede.EOF
		Response.Write "<option title='"&wRssede(1)&"'   value=""" &wRssede(0)& """>" &wRssede(1) & "</option>"
		wRssede.MoveNext
	Wend
	Response.Write "</select>"

	wRssede.Close
	Set wRssede = Nothing
	
End sub


sub generaLocal()	
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cbolocal"" name=""cbolocal"" >"
	Response.Write " <option  value=""99"">Seleccione</option>"

	Response.Write "</select>"

End sub

sub generaCargo()
	Set wRscargo = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.USP_LISTA_CARGO_EDNOM2016 "

	wRscargo.CursorLocation=3
	wRscargo.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cboCargo"" name=""cboCargo"" >"
	Response.Write " <option value=""999"">Seleccione</option>"
	While not wRscargo.EOF
		Response.Write "<option value=""" & wRscargo(0) & """>" &wRscargo(1) & "</option>"
		wRscargo.MoveNext
	Wend
	Response.Write "</select>"

	wRscargo.Close
	Set wRscargo = Nothing
End sub



sub generaActividad()
	Set wRsactividad = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.USP_LISTA_ACTIVIDAD_EDNOM2016 "

	wRsactividad.CursorLocation=3
	wRsactividad.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cboActividad"" name=""cboActividad"" >"
	Response.Write " <option value=""999"">Seleccione</option>"
	While not wRsactividad.EOF
		Response.Write "<option value=""" & wRsactividad(0) & """>" &wRsactividad(1) & "</option>"
		wRsactividad.MoveNext
	Wend
	Response.Write "</select>"

	wRsactividad.Close
	Set wRsactividad = Nothing
End sub


If lsUbigeo <> "" Then


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
   <link rel="shortcut icon" href="images/favicon.ico" />
<!--<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script> -->
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>

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
	$("#button1").click(function(event) {
	
	var sede = $("#cboSede").val();
	var local= $("#cboLocal").val();
	var cargo= $("#cboCargo").val();
	var tipo= $("#cboActividad").val();
	window.open('http://aplicaciones.inei.gob.pe/sys.sgpc/web/ednom2016/reporte_planilla_pago?sede='+sede+'&local='+local+'&cargo='+cargo+'&tipo='+tipo+'','REPORTE','type=fullWindow,fullscreen,scrollbars=yes');
		
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


function generaLocales(){
     
      var varDpto =document.getElementById("cboSede").options[document.getElementById("cboSede").selectedIndex].value;
	ajax=http_request();
	var valores;	
	valores= "local_id=" + escape(varDpto);  // parametros a enviar al servidor	
	
	//alert(valores);
	url="m_Locales_ednom2016.asp";  
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




  
  
</script>
    </head>
    <body>
        <div id="top">
      <!--#include file="cabecera.html"-->
	  <!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso : Asignaci&oacute;n de Rutas</span></div>
<div id="lateral">

 <form name="frmMiForm" id="frmMiForm" METHOD="POST" >
            <table width='100%' border='0' cellpadding="2" cellspacing="2">
              <tr>
                <td colspan="2" align="left" bgcolor="#F7F8F9" class="alerta5">(*)Datos Obligatorios<span class="criterio">
                  <input name="txtUsuario" type="hidden" id="txtUsuario" value="" />
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="" />
                  <input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
                  <input name="id_proy" type="hidden" id="id_proy" value="" />
                   <input name="lsRol" type="hidden" id="lsRol" value="" />
                </span></td>
              </tr>
 
             
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Regional:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaSede()%></td>
              </tr>
              
			   <tr>
                <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Local:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                  <option id="txtProv1" 	title="Todos" value="999" > Seleccione </option>
                </select></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede Distrital:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaCargo()%></td>
              </tr>
              <tr id="cargo1">
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Sede:</span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaActividad()%>
                  <span class="alerta5">(*)</span></td>
              </tr>
                            
	          <tr height=22>
                <td colspan="2" align="center" bgcolor="#F7F8F9"><input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onclick="" 
                        value='exportar'>
                <br><br></td>
              </tr>  
                


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
