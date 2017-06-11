<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 
 <%
 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
idProyecto=Session("id_proyecto")

 
 sub generaCargo()
			
	set wRsDptoapli = Micone.execute(" exec dbo.uspget_CargoContrato '"&idProyecto&"' ")
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" onChange=""verValores(this.value);""  >"
	
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='N.Conv.: "&wRsDptoapli(0)&" - Periodo: "&wRsDptoapli("nPeriodo")&" "& wRsDptoapli("num")&" - Actividad: "& wRsDptoapli(7)&"'   value=""" &wRsDptoapli(0)&"*"&wRsDptoapli(1)&"*"&wRsDptoapli(2)&"*"&wRsDptoapli(3)&"*"&wRsDptoapli("documento_CCP")&"*"&wRsDptoapli("totalPEACont")&"*"&wRsDptoapli("totalPEA_CCP")&"*"&wRsDptoapli("resta")&"*"&wRsDptoapli("max_fecha")& """>" &wRsDptoapli(4) & "</option>"

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

If lsUbigeo <> "" then







%>	
    
<HTML>
<HEAD> 
      <title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>
   <link rel="shortcut icon" href="images/favicon.ico" />
 <script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript" src="js/envio_ajax.js"></script>
<script type="text/javascript" src="js/valida.js"></script>
	<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
	<script src="js/jquery-1.7.2.js"></script>
	<script src="external/jquery.bgiframe-2.1.2.js"></script>
	<script src="ui/jquery.ui.core.js"></script>
	<script src="ui/jquery.ui.widget.js"></script>
	<script src="ui/jquery.ui.mouse.js"></script>
	<script src="ui/jquery.ui.button.js"></script>
	<script src="ui/jquery.ui.draggable.js"></script>
	<script src="ui/jquery.ui.position.js"></script>
	<script src="ui/jquery.ui.resizable.js"></script>
	<script src="ui/jquery.ui.dialog.js"></script>
	<script src="ui/jquery.effects.core.js"></script>
	<script src="js/valida_fecha.js"></script>

	<link rel="stylesheet" href="css/demos.css">
    <link rel="stylesheet" type="text/css" href="Styles/inei.css">

	<style>
			input.text { margin-bottom:12px; width:95%; padding: .4em; }

		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
	</style>


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

function verValores(valor){
	var acargo = valor;
	var lcargo=acargo.split("*");
	var numConvocatoria=lcargo[0];
	var idPresupuesto=lcargo[1];
	var idConvocatoriaCargo=lcargo[2];
	var idCCPresupuestario=lcargo[3];
	var doc_ccpresup=lcargo[4];
	var PEA_pre=lcargo[5];
	var PEA_ccp=lcargo[6];
	var PEA_fal=lcargo[7];
	var MAX_FECHA=lcargo[8];
		
	document.getElementById("demo").innerHTML=doc_ccpresup;
	document.getElementById("peap").innerHTML=PEA_pre;
	document.getElementById("peac").innerHTML=PEA_ccp;
	document.getElementById("peax").innerHTML=PEA_fal;
	document.getElementById("txtIdPresupuesto"). value=idPresupuesto;
	document.getElementById("txtpea_f"). value=PEA_fal;
	document.getElementById("txtIdCcpresupuestario").value=idCCPresupuestario;
	document.getElementById("txtNumConvocatoria").value=numConvocatoria;
	document.getElementById("txtIdConvCargo").value=idConvocatoriaCargo;
	document.getElementById("txtfecha_FIN").value=MAX_FECHA;
	var id_proyecto=document.getElementById("txtproyecto").value;
	
	verPEAContratar(idPresupuesto,idConvocatoriaCargo, id_proyecto, '1');
	
	
}

function verPEAContratar(idPresupuesto,idConvocatoriaCargo, id_proyecto,id){
	
	var fecha_FIN =document.getElementById("txtfechaContrato").value;

	ajax=http_request();
	var valores;	
	valores= "lsIdPresupuesto=" + escape(idPresupuesto)+"&lsIdConvocatoriaCargo="+escape(idConvocatoriaCargo)+"&id_proyecto="+escape(id_proyecto)+"&lsTipo=56";  // parametros a enviar al servidor	

url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("pea").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("pea").innerHTML =ajax.responseText;
					if (id==2){
						verificarFechasMax();
						} 
					
            }
            else if(ajax.status==404){
                     document.getElementById("pea").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("pea").innerHTML = ajax.responseText;	
		 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;		
}

// Para validar fechas

function ver_PEA(lsIdPresupuesto,lsIdConvocatoriaCargo){
	var fecha_FIN =document.getElementById("txtfechaContrato").value;
	var fecha =document.getElementById("txtfecha_FIN").value;
	
	 pagina = "pd_PEAaContratar.asp?lsIdPresupuesto="+lsIdPresupuesto+"&lsIdConvocatoriaCargo="+lsIdConvocatoriaCargo +"&fecha_FIN="+fecha_FIN;
	win = window.open(pagina,'','scrollbars=yes,resizable=yes');	
	}


function ver_PEA_exportar(lsIdPresupuesto,lsIdConvocatoriaCargo){
	var fecha_FIN =document.getElementById("txtfechaContrato").value;
	var fecha =document.getElementById("txtfecha_FIN").value;
	
	 pagina = "pd_reporte_PEAaContratar.asp?lsIdPresupuesto="+lsIdPresupuesto+"&lsIdConvocatoriaCargo="+lsIdConvocatoriaCargo +"&fecha_FIN="+fecha_FIN;
	win = window.open(pagina,'','scrollbars=yes,resizable=yes');	
	}
	
	
function VerificaFechaInicio(){
	fechaContrato=document.getElementById("txtfechaContrato").value;
	fechaInicio=document.getElementById("txtfechaInicio").value;

	if(fechaContrato==''){
	alert ("Ingrese Fecha de Contrato");
	document.getElementById("txtfechaContrato").focus();
	return false;
	} else if (fechaInicio<fechaContrato){
		alert ("La Fecha de Inicio de Inicio de Labores no puede ser menor a la fecha de Contrato");
		document.getElementById("txtfechaInicio").value="";
		document.getElementById("txtfechaInicio").focus();
		return false;
		}
}


function VerificaFechaFin(){
	fechaFin=document.getElementById("txtfechaFin").value;
	fechaInicio=document.getElementById("txtfechaInicio").value;

	if(fechaInicio==''){
	alert ("Ingrese Fecha de Inicio de Labores");
	document.getElementById("txtfechaInicio").focus();
	return false;
	} else if (fechaFin<fechaInicio){
		alert ("La Fecha de Inicio de Fin de Labores no puede ser menor a la fecha de Contrato");
		document.getElementById("txtfechaInicio").value="";
		document.getElementById("txtfechaInicio").focus();
		return false;
		}
}


function Activar1(oficio, fecha,ArrayChek){

	var lsIpRegistro=document.getElementById("txtIPregistro").value;
	var Id_Usuario=document.getElementById("txtUsuario").value;
	var id_proyecto=document.getElementById("txtproyecto").value;
	var cenvdatos=document.getElementById("txtCenvdatos").value;
	
	
	ajax=http_request();
	var valores;	
	valores= "lsOficio=" + escape(oficio)+"&lsFoficio="+escape(fecha)+"&lsIdUsuario="+Id_Usuario+"&lsIpRegistro="+escape(lsIpRegistro)+"&id_proyecto="+escape(id_proyecto)+"&cenvdatos="+escape(cenvdatos)+"&ArrayChek="+escape(ArrayChek)+"&lsTipo=58";
	
	 	
	$.post('m_ingreso.asp', valores, function(result) {$('#divCriterio').html(result)});

}


	function llamar(valor)
	{
	
		var chec=false;
		$("input[@name='itemSelect[]']:checked").each(function(){
			chec = true;
			});
						
        if(chec) {  
			$( "#dialog-form" ).dialog( "open" );
      
        } else {  
            alert("Debes de Seleccionar al menos un Ingreso");  
        }  
    ; 
		
		
	}
	
	$(function() {
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
		var name = $( "#nsolicitud" ),
			email = $( "#fsolicitud" ),
			idCar = $( "#txtid" ),
			allFields = $( [] ).add( name ).add( email ).add( idCar ),
			tips = $( ".validateTips" );

		function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}

		function checkLength( o, n, min, max ) {
			if ( o.val().length > max || o.val().length < min ) {
				o.addClass( "ui-state-error" );
				updateTips( "Length of " + n + " must be between " +
					min + " and " + max + "." );
				return false;
			} else {
				return true;
			}
		}

		function checkRegexp( o, regexp, n ) {
			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass( "ui-state-error" );
				updateTips( n );
				return false;
			} else {
				return true;
			}
		}
		
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 400,
			width: 350,
			modal: true,
			buttons: {
				"Grabar": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

					bValid = bValid && checkLength( name, "Nro Oficio de Contratacion", 3, 60 );
					bValid = bValid && checkLength( email, "Fecha Oficio de Contratacion", 0, 10 );

					if ( bValid ) {
				
					var selectedItems = new Array();
					$("input[@name='itemSelect[]']:checked").each(function(){
							selectedItems.push($(this).val());
						});

					Activar1(name.val(),email.val(),selectedItems)

					
						$( this ).dialog( "close" );
					}
				},
				Cerrar: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}
		});

	});


function verificarFechas(){
		var lsFechainicio =document.getElementById("txtfechaInicio").value ;
		var lsFechaFin =document.getElementById("txtfechaFin").value ;
	
	  if (Compara_Menor(lsFechainicio,lsFechaFin) != false  )
						 {
							 
							alert("Fecha err\xf3nea, fecha fin menor a fecha de inicio de labores");
							document.getElementById("txtfechaInicio").value=''
							document.getElementById("txtfechaFin").value=''
							document.getElementById("txtfechaInicio").focus();
							
						 }
						 
}

function verificarFechasCap(){
		var lsFechainicio =document.getElementById("txtfechaInicio").value ;
		var lsFechaFin =document.getElementById("txtfechaFin").value ;
		var lsFechaContrato =document.getElementById("txtfechaContrato").value ;
		
		
		var lsFechainicioCap =document.getElementById("txtFecIniCap").value ;
		var lsFechaFinCap =document.getElementById("txtFecFinCap").value ;
		
		
	
	  if (Compara_MenorIgual(lsFechainicioCap,lsFechaFinCap) != false  )
						 {
							 
							alert("Fecha err\xf3nea, fecha fin Capacitacion menor igual a fecha de inicio de capacitacion");
							document.getElementById("txtFecIniCap").value=''
							document.getElementById("txtFecFinCap").value=''
							document.getElementById("txtFecIniCap").focus();
							
						 }
						 
 		if (Compara_MenorIgual(lsFechainicioCap,lsFechainicio) != false  )
						 {
							 
							alert("Fecha err\xf3nea, fecha inicio Capacitacion mayor a fecha de inicio labores");
							document.getElementById("txtFecIniCap").value=''
							document.getElementById("txtFecFinCap").value=''
							document.getElementById("txtFecIniCap").focus();
							
						 }
						 						 
				if (Compara_MenorIgual(lsFechaFinCap,lsFechainicio) != false  )
						 {
							 
							alert("Fecha err\xf3nea, fecha fin Capacitacion menor a fecha de inicio labores");
							document.getElementById("txtFecIniCap").value=''
							document.getElementById("txtFecFinCap").value=''
							document.getElementById("txtFecIniCap").focus();
							
						 }
				if (Compara_MenorIgual(lsFechaContrato, lsFechainicioCap) != false  )
						 {
							 
							alert("Fecha err\xf3nea, fecha inicio Capacitacion menor a fecha de Contrato");
							document.getElementById("txtFecIniCap").value=''
							document.getElementById("txtFecFinCap").value=''
							document.getElementById("txtFecIniCap").focus();
							
						 }		 					 
						 
						 

			if (Compara_MenorIgual(lsFechaContrato,lsFechaFinCap) != false  )
						 {
							 
							alert("Fecha err\xf3nea, fecha fin Capacitacion menor a fecha de Contrato");
							document.getElementById("txtFecIniCap").value=''
							document.getElementById("txtFecFinCap").value=''
							document.getElementById("txtFecIniCap").focus();
							
						 }		 										 
						 
}	



 
function verificarFechasMax(){	
		
		var txtno_Afiliado=document.getElementById("txtno_Afiliado").value;
		 if (txtno_Afiliado>=1 ){
			 alert('Existe '+ txtno_Afiliado+'persona(s) que no registro(aron) AFP, favor verificar');
			 return false;
			 }
		
		var lsFechainicio =document.getElementById("txtfechaInicio").value ;
		var lsFechaMax =document.getElementById("txtfecha_FIN").value ;
		var lsFechaFin =document.getElementById("txtfechaFin").value ;

		if (lsFechainicio==""){
			 alert ('Registre fecha de Inicio de labores');
			 document.getElementById("txtfechaInicio").focus();
			 return false;
			 }
			 
		if (lsFechaFin==""){
			 alert ('Registre fecha de Fin de labores');
			 document.getElementById("txtfechaFin").focus();
			 return false;
			 }		
	
		if (Compara_Menor(lsFechainicio,lsFechaFin) != false  )
		{							 
			alert("Fecha err\xf3nea, fecha fin menor a fecha de inicio de labores");
			document.getElementById("txtfechaInicio").value=''
			document.getElementById("txtfechaFin").value=''
			document.getElementById("txtfechaInicio").focus();
			return false;
		}
		
		alert (lsFechaMax ) ;
		alert ( lsFechainicio) ;

		
	  if (Compara_Menor(lsFechaMax,lsFechainicio) != false  )
	  
						 {

							
							alert("Existe personas con cruce de fechas, verificar");
							return false;		
						 } else
						 enviar_contrato();						 
}


function contratos(){
	var acargo = document.getElementById("cmbCargo").value;
	var lcargo=acargo.split("*");
	var idPresupuesto=lcargo[1];
	var idConvocatoriaCargo=lcargo[2];
	var id_proyecto=document.getElementById("txtproyecto").value;
	
	verPEAContratar(idPresupuesto,idConvocatoriaCargo, id_proyecto, '2');
	
	}
	  
	</script>
</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 

	 <!--#include file="pd_menu.asp"-->

	<div id="formulario">
    <div id="divNavegacion" align="center"><span class="subtitulo">
    <input name="txtproyecto" type="hidden" id="txtproyecto" value="<%=Session("id_proyecto")%>" /><input name="txtmeta" type="hidden" id="txtmeta" value="<%=Session("cmeta")%>" />
            <%=Session("cmeta")&"-"&Session("nmeta")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>" /></span></div>
   		<div id="divNavegacion" align="center"><span class="subtitulo">Registro: Oficio de Contrataci&oacute;n</span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
      <table  width="100%"  border="0" align="center">
        <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">
   
<table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <thead><tr>
 	      <th colspan=9 class="aplicacion" bgcolor="#DAE8F3">
</th>
 	    
          <tr>
 	        <td colspan="6"  class='etiqueta'> <span class="alerta5">(*) Datos Obligatorios<span class="aplicacion"><font class='alerta5'>
            <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=Session("id_Usuario")%>">
            <input name="txtIdPresupuesto" type="hidden" id="txtIdPresupuesto" value="">
            <input name="txtIdCcpresupuestario" type="hidden" id="txtIdCcpresupuestario" value="">
            <input name="txtNumConvocatoria" type="hidden" id="txtNumConvocatoria" value="">
            <input name="txtIdConvCargo" type="hidden" id="txtIdConvCargo" value="">
            <input name="txtIPregistro" type="hidden" id="txtIPregistro" value="<%=ipVisitante%>">
 	        <input name="txtfecha_FIN" type="hidden" id="txtfecha_FIN" value="">
 	        <input name="txtpea_f" type="hidden" id="txtpea_f" value="">
 	        </font></span></span></td>
 	        </tr>
 	    <tr>
 	      <td width="17%" class='etiqueta'>Cargo:<font class="alerta5">&nbsp;</font></td>
 	      <td width="21%" class='etiqueta'><font class='alerta5'>
 	        <%generaCargo()%>
 	        </font><font class='alerta5'>(*) 
 	        
 	        </font></td>
 	      <td colspan="2" class='etiqueta'>Oficio CCP: <font id="demo"></font></td>
 	      <td colspan="2" class='etiqueta'>PEA Titular Asociada: <font id="pea"></font> </td>
 	      </tr>
          
           	    <tr>
 	      <td colspan="2" class='etiqueta'>PEA CCP: <font id="peac"></font></td>
 	      <td colspan="2" class='etiqueta'>PEA Contratada: <font id="peap"></font></td>
 	      <td colspan="2" class='etiqueta'>PEA que falta Contratar: <font id="peax"></font> </td>
 	      </tr>
          
           <tr>
 	      <td width="17%" class='etiqueta'>Fecha Contrato:<font class="alerta5">&nbsp;</font></td>
 	      <td width="21%" class='etiqueta'><input name="txtfechaContrato" type="text" class="e_input" id="txtfechaContrato" onKeyUp="this.value=formateafecha(this.value);" size="10" maxlength="10" /></td>
 	      <td width="13%" class='etiqueta'>Fecha Inicio de labores: <font id="demo"></font></td>
 	      <td width="18%" class='etiqueta'><input name="txtfechaInicio" type="text" class="e_input" id="txtfechaInicio" onKeyUp="this.value=formateafecha(this.value);"  size="10" maxlength="10" /></td>
 	      <td width="13%" class='etiqueta'>Fecha Fin: <font id="pea"></font> </td>
 	      <td width="18%" class='etiqueta'><input name="txtfechaFin" type="text" class="e_input" id="txtfechaFin" onKeyUp="this.value=formateafecha(this.value);" size="10" maxlength="10" /></td>
 	       </tr>
           
           <tr>
 	      <td colspan="2" class='etiqueta'>Observacion (En caso de capacitaci&oacute;n):<font class="alerta5">&nbsp;</font><font id="pea"></font> </td>
 	      <td colspan="4" class='etiqueta'><input name="txtObservacion" type="text" id="txtObservacion" size="80" maxlength="80" /></td>
 	      </tr>
          
           <tr>
 	      <td colspan="2" class='etiqueta'>Fec.Inicio Cap:<input name="txtFecIniCap" type="text" id="txtFecIniCap" onKeyUp="this.value=formateafecha(this.value);" size="10" maxlength="10"  /> </td>
 	      <td colspan="4" class='etiqueta'>Fec.Fin Cap:<input name="txtFecFinCap" type="text" id="txtFecFinCap" onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechasCap()" size="10" maxlength="10"  /></td>
 	      </tr>
          
          
          

           

 	        </thead>
         <tbody>
 	            </tbody>    
                <tfoot>  
                <tr>
			 <td colspan="6" align="center" id="prueba" ><span class="etiqueta"><span class="alerta4">
 				<input name="button" type="button" class="boton" id="button" value="Grabar" onClick="contratos()">
 				Detalle</span>
 	      <font class='alerta5'><img src="images/ventana.png" alt="" border="0" style="CURSOR: hand" onClick="window.open('pd_conAdministrativaDetalle.asp?lstipoReport=4&amp;wwwHora=<%=time()%>','','top=10,left=25,scrollbars=yes,width=880,height=700,resizable=1')" />
 	      </font></span></td>
                   
             
 	      </tr></tfoot>
 	    </table>
 	</div>	
		</td>
	</tr>	
	</table></form>
    <div id="divCriterio" align="center" style=""><%modContratos(idProyecto)%>
    </div>
	
</div>

<div id="ficha" align="center"></div>
<div id="dialog-form" title="Ingresar Oficio de Solicitud CCP">
	<p class="validateTips">Todos los campos son obligatorios
	  <input type="hidden" name="txtid" id="txtid">
	</p>
	<form>
	<fieldset>
    
    
    	
   	  <label for="email">N&deg; de Oficio de Contrataci&oacute;n</label>
   	  <input name="nsolicitud" type="text" class="text ui-widget-content ui-corner-all" id="nsolicitud"  value="Oficio N&deg; "
										onKeyPress="return TextUtil.allowChars(this, event)" 		validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ  -0123456789" /><br>
    
 <label for="email">Fecha de Oficio de Contrataci&oacute;n</label>
 <input type="text" name="fsolicitud" onKeyUp="this.value=formateafecha(this.value);" id="fsolicitud" value="" class="text ui-widget-content ui-corner-all" />
 <br>
	</fieldset>
	</form>
</div> 
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>

