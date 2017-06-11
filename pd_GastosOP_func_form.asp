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
aulas=Session("aulas")

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO ""2"" ")

	
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
<script src="js/valida_fecha.js"></script>

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

function generarDesembolso(){
	
	var fase=document.getElementById("cmbFase").value;
	var periodo=document.getElementById("cmbPeriodo").value;
	
	ajax=http_request();
	var valores;	
	valores= "fase=" + escape(fase)+"&periodo=" + escape(periodo)&"lsTipo=1";  // parametros a enviar al servidor	
	
	url="m_ingreso_for.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 //document.getElementById("reg2").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					var total =ajax.responseText;
					if (total==0){
						alert('No hay pagos pendientes para la fase y periodo seleccionados');	
					} else {
						registrar_desembolso(fase, periodo);
					}
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

function registrar_desembolso(fase, periodo){
	
}

function mostrarDesembolsoFort (){

	var reporte=document.getElementById("cmbReporte").value;
	var gasto=document.getElementById("cmbGasto").value;
	var formato=document.getElementById("cmbFormato").value;
	var aula=document.getElementById("h_aula").value;
	var dist=document.getElementById("h_dist").value;
	
	if (reporte==0){
		alert ('Seleccione una opci\xf3n en el combo Reporte');
		return false;
	}
	if (gasto==0){
		alert ('Seleccione una opci\xf3n en el combo Tipo de gasto');
		return false;
	}
	if (formato==0){
		alert ('Seleccione una opci\xf3n en el combo Formato');
		return false;
	}

	if (gasto==3 ){
		if (formato!=3){
			alert ('Tipo de formato incorrecto');	
		} else {
			 pagina = "pasajes_for.asp?reporte=" + reporte+"&gasto="+gasto+"&formato="+formato;
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
		}
		
	} 
	if (gasto==1 ){
		if (formato==3){
			alert ('Tipo de formato incorrecto');	
		} else {
				var w= window.open("http://aplicaciones.inei.gob.pe/sys.sgpc/web/ece_gastos/reporteGastosFortal_pdf_01?cod_sede="+dist+"&tipo_reporte="+gasto+"&formato="+formato+"&id_goperativo="+reporte+"&aula="+aula+"","_blank","width=500,height=500,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
			
	//	var w= window.open("http://localhost:8080/sys.sgpc/web/ece_gastos/reporteGastosFortal_pdf_01?cod_sede="+dist+"&tipo_reporte="+gasto+"&formato="+formato+"&id_goperativo="+reporte+"&aula="+aula+"","_blank","width=500,height=500,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");	
			
		}
		
	} 
	
	if (gasto==2 ){
		if (formato!=2){
			alert ('Tipo de formato incorrecto');	
		} else {
			 var w= window.open("http://aplicaciones.inei.gob.pe/sys.sgpc/web/ece_gastos/reporteGastosFortal_pdf_01?cod_sede="+dist+"&tipo_reporte="+gasto+"&formato="+formato+"&id_goperativo="+reporte+"&aula="+aula+"","_blank","width=500,height=500,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
			//		var w= window.open("http://localhost:8080/sys.sgpc/web/ece_gastos/reporteGastosFortal_pdf_01?cod_sede="+dist+"&tipo_reporte="+gasto+"&formato="+formato+"&id_goperativo="+reporte+"&aula="+aula+"","_blank","width=500,height=500,top=4,left=0,resizable=yes,scrollbars=yes,menubar=no,toolbar=no,status=no,location=no");
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
<div id="divNavegacion" align="center"><span class="subtitulo">Proceso: Generación de Gastos Operativos</span></div>
<div id="lateral">
        <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_GastosOP.asp">
          <table width='100%' border='1'   align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
          
          <tr><th colspan=2 ></th></tr>         
		  <tr>
		    <th colspan=2 class="aplicacion" bgcolor="#DAE8F3">Operaci&oacute;n de campo</th></tr>
          <tr>
            
		    <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios 
            	<input name="h_aula" id="h_aula" type="hidden" value="<%=aulas%>" />
                <input name="h_dist" id="h_dist" type="hidden" value="<%=lsUbigeoDist%>" />
            </td>
		  </tr>
          <tr >
              <td class="etiqueta" width="31%" align="right"><span class="criterio">Reporte:</span></td>
              <td id="td_reportes"><select class='e_combo' name="cmbReporte" id="cmbReporte"  style="width:200px">
                <option value="0" > Seleccione... </option>
                <option value="1" > Fase I, Periodo 1</option>
                <option value="2" > Fase I, Periodo 2</option>   
                <option value="3" > Fase I, Periodo 3</option>   
              </select></td>
          </tr>
          <tr>
              <td class="etiqueta" width="31%" align="right"><span class="criterio">Tipo Gasto:</span></td>
              <td id="td_reportes"><select class='e_combo' name="cmbGasto" id="cmbGasto"  style="width:200px">
                <option value="0" > Seleccione... </option>
                <option value="1" > Gasto Operativo</option>
                <option value="2" > Movilidad Local </option>
                <option value="3" > Pasajes</option>
              </select></td>
          </tr>
          <tr>
              <td class="etiqueta" width="31%" align="right"><span class="criterio">Formato:</span></td>
              <td id="td_reportes"><select class='e_combo' name="cmbFormato" id="cmbFormato"  style="width:200px">
                <option value="0" > Seleccione... </option>
                <option value="1" > Formato B</option>
                <option value="2" > Formato 4 </option>
                <option value="3" > Formato Pasajes</option>
              </select></td>
          </tr>

                <input type="hidden" name="txtactivoc" id="txtactivoc" class="e_input_text" />


                <input type="hidden" name="txtFlagPagoCom" id="txtFlagPagoCom" class="e_input_text" />
              
               <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">

     
                </td>
              </tr>

                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">
                <INPUT name='button2' type='button' class="botonCerrar" id='button2' onClick="javascript:mostrarDesembolsoFort()" value='Aceptar'>&nbsp;&nbsp;</td>
              </tr>
			  <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">&nbsp;&nbsp;</td>
              </tr>
			  
			  
               <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"></td>
              </tr>	     
          </table>
  </form>
    </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" style="margin:0;height:90%;" align="center" ></div>
		  <div id="divProceso"></div>
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
