<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 
 <%
 
lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
idProyecto=Session("id_proyecto")
 
 sub generaSede()
			
	set wRsDptoapli = Micone.execute(" exec uspGet_Sede")
	Response.Write "<select class=""e_combo"" style=""width:300px"" id=""cmbSede"" name=""cmbSede""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title=""" & wRsDptoapli("desc_sede_sed") & """ value=""" & wRsDptoapli("codi_sede_sed") & """>"&wRsDptoapli("desc_sede_sed")&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing  
	
	
End sub

 sub generaTipoOfc()
			
	set wRsDptoapli = Micone.execute(" exec PA_abreviatura_oficios_LISTAR")
	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""cmbTipoOfc1"" name=""cmbTipoOfc1""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title=""" & wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

 sub generaTipoOfc2()
			
	set wRsDptoapli = Micone.execute(" exec PA_abreviatura_oficios_LISTAR_2")
	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""cmbTipoOfc2"" name=""cmbTipoOfc2""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title=""" & wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaDependencia()
			
	set wRsDptoapli = Micone.execute(" exec uspGet_dependencias")
	Response.Write "<select class=""e_combo"" style=""width:300px"" id=""cmbDependencia"" name=""cmbDependencia""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli("DESC_DEPE_TDE")&""" value=""" & wRsDptoapli("CODI_DEPE_TDE") & """>"&wRsDptoapli("DESC_DEPE_TDE")&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub




sub generaCargoPresupuesto()
			
	set wRsDptoapli = Micone.execute(" exec getcargoPresupuesto '"&idProyecto&"' ")
	
	Response.Write "<select class=""e_combo"" style=""width:340px"" id=""cmbCargo"" name=""cmbCargo""  onchange=""javascrip:topes(this.value)""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(5)&" ("&wRsDptoapli(2)&")" &" - Actividad: "&wRsDptoapli(4)& " - PEA LIBRE A CERTIFICAR: "&wRsDptoapli(6)&""& " F.Fto:"&wRsDptoapli(7)&""" value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
	
	
End sub

ANIO_A=Year(Date)
ANIO_AN=Year(Date)-1

If lsUbigeo <> "" then


	

%>	
    
<HTML>
<HEAD> 
      <title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>
    
    
	<script type="text/javascript" src="js/envio_ajax.js"></script>
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
	<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
    <link rel="shortcut icon" href="images/favicon.ico" />
     
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

function narmadas(tiempo,tipoperiodo)
{
	var ntiempo=Math.ceil(tiempo);
	var ntipoperiodo=Math.ceil(tipoperiodo);
	var narmadas;
	var tiempo= ntiempo%30;
	
	if (tipoperiodo==1){
		if (tiempo>0)
		narmadas=ntiempo/30+1;
		else 
		narmadas=ntiempo/30;
	}else{
		narmadas=ntiempo;
	}
	
	document.frmMiForm.txtarmadas.value = parseInt(narmadas);
	
				if (tipoperiodo==2 || tipoperiodo==1)
				{
						
							$( "#users tbody" ).empty();
						for (i=1;i<=narmadas;i++) { 
							$( "#users tbody" ).append( "<tr>" +
							 "<td class='etiqueta' > Armada N&deg;&nbsp;"+i+" </td>" + 
							"<td colspan='3'><input type='text' name='n"+i+"' id='n"+i+"' onkeypress='return TextUtil.allowChars(this, event)'  validchars='1234567890.'>(.)decimal</td>" + 
							
							"</tr>" ); 
						}
				}
	}
	
	
function topes(valor)
{
		document.getElementById("txtCantPea").value='';
	document.getElementById("txtnperiodo").value='';

	$( "#users tbody" ).empty();
	
		ajax=http_request();
	var valores;	
	valores= "datos=" + escape(valor)+"&lsTipo=47";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("topes").innerHTML ="";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("topes").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("topes").innerHTML = "";
            }
            else{
                     document.getElementById("topes").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	

	
	}


function Activar(oficio,fecha,nsolicitid,fsolicitud,ArrayChek){
	
	df1=fecha.substring(0,2);
	mf1=fecha.substring(3,5);
	af1=fecha.substring(6);
	f1=af1+mf1+df1;
	
	df2=fsolicitud.substring(0,2);
	mf2=fsolicitud.substring(3,5);
	af2=fsolicitud.substring(6);
	f2=af2+mf2+df2;
	
	result=parseInt(f2)-parseInt(f1);
	
	if (result>=1){
		alert('Error de registro, la fecha del CCP no puede ser menor a la fecha de la Solicitud');
		return false;
		
		}
					Id_Usuario=document.getElementById("txtUsuario").value
					ajax=http_request();
					var valores;	
					valores= "lsOficio=" + escape(oficio)+"&lsFoficio="+escape(fecha)+"&lsIdUsuario="+escape(Id_Usuario)+"&nsolicitid="+escape(nsolicitid)+"&fsolicitud="+escape(fsolicitud)+"&ArrayChek="+escape(ArrayChek)+"&lsTipo=43";  // parametros a enviar al servidor	

	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divCriterio").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){							
				MostrarCCPresupuestario();
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


function validaPeriodo(valor)
{
	var tipop;
	var periodop=document.getElementById("txtnPermax").value;
	var tipoper=document.getElementById("txttipoperiodo").value;
	var tipoperiodo=document.getElementById("txttipoperiodo").value.substring(0,1);
	if (tipoperiodo=='M')
	tipop=2;
	else
	tipop=1;
	
	var peridoccp=document.getElementById("txtnperiodo").value;
	
	if (peridoccp=='')
	{
		alert("Ingrese perido")
		document.getElementById("cmbperiodo1").value="0";
		document.getElementById("txtnperiodo").focus();	
		return false;	
	}
	
	if (periodop!='')
	{
		var valorPre;
		if(tipop==valor){
		if (parseInt(periodop) < parseInt(peridoccp))
		{
			alert("Error!! Cant. m\xe1xima Periodo  de "+ periodop + " "+ tipoper)
			document.getElementById("txtnperiodo").value="";
			document.getElementById("cmbperiodo1").value="0";
			$( "#users tbody" ).empty();	
			return false;
			} 
		} else if(tipop==2 && valor==1) {
			valorPre=30*periodop;
				if (parseInt(valorPre) < parseInt(peridoccp)){
				alert("Error!! Cant. m\xe1xima Periodo  de "+valorPre+ " D\xeda(s)")
				document.getElementById("txtnperiodo").value="";
				document.getElementById("cmbperiodo1").value="0";
				$( "#users tbody" ).empty();	
				return false;
				} 
			
		} else if (tipop==1 && valor==2){
			valorPre=periodop/30.0;
			var num;
			
				if (parseInt(valorPre) < parseInt(peridoccp)){
				alert("Error!! Cant. m\xe1xima Periodo  de "+ valorPre.toFixed(2) + 'Mes(es)')
				document.getElementById("txtnperiodo").value="";
				document.getElementById("cmbperiodo1").value="0";
				$( "#users tbody" ).empty();	
				return false;
				}
		}
		narmadas(peridoccp,valor);
	
	}else {
		alert("Selecciona el Cargo Presupuestado")
		document.getElementById("txtnperiodo").value="";
	}
}


function valida( valor)
{
	vmax=document.getElementById("txtvalmax").value;
if (vmax!='')
{
	if (parseInt(vmax) < parseInt(valor))
	{
		alert("Error!! Cant. m\xe1xima PEA  de "+vmax)
		document.getElementById("txtCantPea").value="";
		
	}
}else 
{		alert("Selecciona el Cargo Presupuestado")
			document.getElementById("txtCantPea").value="";

	
	}


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

		var name = $( "#noficio" ),
			email = $( "#fecha_resol" ),
			idCar = $( "#txtid" ),
			nsolicitud = $ ( "#nsolicitud" ),
			fsolicitud = $( "#fsolicitud" ),
			allFields = $( [] ).add( name ).add( email ).add( idCar ).add( nsolicitud ).add( fsolicitud ),
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
			height: 500,
			width: 450,
			modal: true,
			buttons: {
				
						
				
				"Grabar": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

					var a=$("#nsolicitud").val();
					var b=$("#cmbperiodo11").val();
		
					var c=$("#cmbTipoOfc1").val();
					var nsolicitid=a+'-'+b+'-'+c;

					var fsolicitud=$("#fsolicitud").val();
					
					var d=$("#noficio").val();
					var e=$("#cmbperiodo2").val();
					var f=$("#cmbTipoOfc2").val();
					var oficio=d+'-'+e+'-'+f;
					
					var fecha=$("#fecha_resol").val();

					if ( bValid ) {
				
					var selectedItems = new Array();
					$("input[@name='itemSelect[]']:checked").each(function(){
							selectedItems.push($(this).val());
						});

					Activar(oficio,fecha,nsolicitid,fsolicitud,selectedItems)
					
						$( this ).dialog( "close" );
					}
				},
				Cerrar: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				//allFields.val( "" ).removeClass( "ui-state-error" );
				$("#noficio" ).val("");
				$("#nsolicitud").val("");
				$("#fecha_resol").val("");
				$("#fsolicitud").val("");
			}
		});

	});
	

function MostrarCCPresupuestario()
{	
	document.getElementById("divC").style.display="";
	var valores="";
	var peticion=$.ajax(
		{
	     url:'pd_ListarCCPresupuestario.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			  $("#divCriterio").html("Cargando...");
							  },
		success:function (respuesta) {
	          $('#divCriterio').html(respuesta);
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#divCriterio").html(""); 
      }
  }
  );
}	

function VerDet_CCP(id_ccp)
{	

	document.getElementById("divC").style.display="none";
	var valores="id_ccp="+id_ccp;
	var peticion=$.ajax(
		{
	     url:'pd_ListarCCPDet.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
			  $("#divCriterio").html("Cargando...");
							  },
		success:function (respuesta) {
	          $('#divCriterio').html(respuesta);
      } ,
      error:function (e){alert('Se a producido un Error'); 
			 $("#divCriterio").html(e.responseText); 
      }
  }
  );
}

function editar_ccp (flag, pea) {

	document.getElementById("div_1").style.display="none";
	document.getElementById("div_2").style.display="none";
	document.getElementById("div_3").style.display="none";
	document.getElementById("div_4").style.display="none";
	//document.getElementById("div_5").style.display="none";
	
	document.getElementById("td_1").style.background="#FFFFFF";
	document.getElementById("td_2").style.background="#FFFFFF";
	document.getElementById("td_3").style.background="#FFFFFF";
	document.getElementById("td_4").style.background="#FFFFFF";
	
	document.getElementById("div_"+flag).style.display="";
	document.getElementById("td_"+flag).style.background="#FFF9F9";
}

function guardar_editar (id_CCP, id_usuario, ip_usuario, flag) {
	if(confirm("Est\xe1 seguro de realizar el cambio?"))
		{
		valor_act=document.getElementById("txtdiv_"+flag).value;
		
		if (valor_act==""){
			alert(' antes de realizar el cambio');
			return false;
		}
		
		ajax=http_request();
		var valores;	
		valores= "id_CCP=" + escape(id_CCP)+"&id_usuario="+escape(id_usuario)+"&ip_usuario="+escape(ip_usuario)+"&valor_act="+escape(valor_act)+"&flag="+escape(flag)+"&lsTipo=120";  // parametros a enviar al servidor
			
		url="m_ingreso.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
	
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){
					
					val=ajax.responseText;
					
					if (val==1) {
						alert('La actualizaci\xf3n se realiz\xf3 correctamente.');
						VerDet_CCP(id_CCP);
					}
					else if (val==2) {
						alert('No se puede realizar el cambio, el cargo ya fu\xe9 publicado en una convocatoria');
						return false;
					}
					else if (val==3) {
						alert('No se puede realizar el cambio, el cargo ya fu\xe9 certificado');
						return false;
					} else {
						alert('ERROR EN LA ACTUALIZACI\xd3N DE DATOS DEL PRESUPUESTO')
						}
				}
				else if(ajax.status==404){
				}
				else{
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		
	   return;	 
	}
}

function verificarPeaReb(valor, maximo, pago_per) {
	if (valor==""){
		return false;
	}
	
	if (valor=="0"){
		alert ('El registro tiene que ser mayor a 0, verificar.');
		document.getElementById("PEA_REBAJA").value="";
		return false;
	}
	if (valor>maximo){
		alert ('Error!!! La cantidad m\xe1xima a rebajar es: '+maximo);
		document.getElementById("PEA_REBAJA").value="";
		return false;
	}
	
	if (valor<=maximo){
		document.getElementById("monto_rebaja").innerHTML =valor*pago_per;
		document.getElementById("hmonto_rebaja").value=valor*pago_per;
	}

}


function GUARDAR_REBAJA(ID_CCP,id_usuario,ipVisitante,ID_PRESUPUESTO){
	if(confirm("Est\xe1 seguro de registrar la rebaja?"))
		{
		a=document.getElementById("solicitudR").value;
		b=document.getElementById("cmbperiodoSR").value;
		c=document.getElementById("cmbTipoOfcR1").value;
		of_solicitud=a+'-'+b+'-'+c;
		fsolicitudSR=document.getElementById("fsolicitudSR").value;
		
		d=document.getElementById("oficioR").value;
		e=document.getElementById("cmbperiodoR").value;
		f=document.getElementById("cmbTipoOfcR2").value;
		of_rebaja=d+'-'+e+'-'+f;
		
		fechaRebaja=document.getElementById("fechaRebaja").value;
		
		PEA_REBAJA=document.getElementById("PEA_REBAJA").value;
		hmonto_rebaja=document.getElementById("hmonto_rebaja").value;
		
		if (PEA_REBAJA==""){
			alert('Registre la cantidad de PEA para rebajar en la certificaci\xf3n');
			document.getElementById("PEA_REBAJA").focus();
			return false;
		}
		if (a==""){
			alert('Registre n\xfamero de Solicitud de rebaja de certificaci\xf3n');
			document.getElementById("solicitudR").focus();
			return false;
		}
		if (c=="0"){
			alert('Registre detalle de Solicitud de rebaja de certificaci\xf3n');
			document.getElementById("cmbTipoOfcR1").focus();
			return false;
		}
		if (fsolicitudSR==""){
			alert('Registre fecha de Solicitud de rebaja de certificaci\xf3n');
			document.getElementById("fsolicitudSR").focus();
			return false;
		}
		
		if (d==""){
			alert('Registre n\xfamero de Oficio de aprobaci\xf3n de rebaja de certificaci\xf3n');
			document.getElementById("oficioR").focus();
			return false;
		}
		if (f=="0"){
			alert('Registre detalle de Oficio de aprobaci\xf3n de rebaja de certificaci\xf3n');
			document.getElementById("cmbTipoOfcR2").focus();
			return false;
		}
		if (fechaRebaja==""){
			alert('Registre fecha del oficio de aprobaci\xf3n de rebaja de certificaci\xf3n');
			document.getElementById("fechaRebaja").focus();
			return false;
		}
		
		ajax=http_request();
		var valores;	
		valores= "of_solicitud=" + escape(of_solicitud)+"&fsolicitudSR="+escape(fsolicitudSR)+"&of_rebaja="+escape(of_rebaja)+"&fechaRebaja="+escape(fechaRebaja)+"&PEA_REBAJA="+escape(PEA_REBAJA)+"&hmonto_rebaja="+escape(hmonto_rebaja)+"&ID_CCP="+escape(ID_CCP)+"&id_usuario="+escape(id_usuario)+"&ipVisitante="+escape(ipVisitante)+"&ID_PRESUPUESTO="+escape(ID_PRESUPUESTO)+"&lsTipo=121";  // parametros a enviar al servidor
			
		url="m_ingreso.asp";  
		ajax.open ('POST', url, true);
		ajax.onreadystatechange = function() {
			 if (ajax.readyState==1) {
	
			 }
			 else if (ajax.readyState==4){
				if(ajax.status==200){
					
					alert('Se registr\xf3 correctamente el registro de la rebaja')
						VerDet_CCP(ID_CCP);

				}
				else if(ajax.status==404){
				}
				else{
				}
			}
		}
		ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		ajax.send(valores);
		
	   return;	 
	}	
	
}


var miPopup 
function registrar_UbigeoCCP(id_ccp, id_usuario){ 
miPopup=window.open("pd_InsertarUbigeoCCP.asp?id_ccp="+id_ccp+"&id_usuario="+id_usuario,"miwin","width=900,height=600") 
miPopup.focus() 
} 





function EliminarRegCCPres(Id_ccpresupuestario)
{



  if (confirm('¿Esta Seguro de Eliminar el Registro?')==true )
 
	{ 
	

    var valores="Id_ccpresupuestario="+Id_ccpresupuestario+"&lsTipo=147";


		
	var peticion=$.ajax(
		{
			

	     url:"m_ingreso.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){

							  },
		success:function (respuesta) {
								
                     				    if (respuesta==2)
							          {
							 
	 					          alert('Se eliminó el registro correctamente.');
									   MostrarCCPresupuestario();
                                       
								       }
								 	   else
								       {
									    return true;
								       }


								
									
											
									 } ,
		error:function (){
			  alert('No se puede eliminar el registro'); 

						}
		}
		);
   }
}



</script> 
</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue  onLoad="MostrarCCPresupuestario()">
	<!--#include file="cabecera.html"-->

<!--#include file="pd_menu.asp"-->
<div id="formulario">
  <div id="divNavegacion" align="center"><span class="subtitulo">Registro: Solicitud CCP </span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
  <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">
   
<table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <thead><tr>
 	      <th colspan=7 class="aplicacion" bgcolor="#DAE8F3">
 	        <span class="dato">
 	
            <%=Session("cmeta")&"-"&Session("nmeta")%> -<%=Session("actividad")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>">
            </span></th>
 	    
          <tr>
 	        <td colspan="4"  class='etiqueta'> <span class="alerta5">(*) Datos Obligatorios<span class="aplicacion"></span></span></td>
 	        </tr>
 	    <tr>
 	      <td width="19%" class='etiqueta'>Cargo Presupuestado<font class="alerta5">&nbsp;</font></td>
 	      <td width="36%" class='etiqueta'><font class='alerta5'>
 	        <%generaCargoPresupuesto()%>
 	        </font><font class='alerta5'>(*) 
 	        <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=Session("id_Usuario")%>">
 	        </font></td>
 	      <td width="15%" class='etiqueta'>Dependencia</td>
 	      <td width="30%" class='etiqueta'><%generaDependencia()%>
            <font class='alerta5'>(*) </font></td>
 	      </tr>
 	    <tr>
 	      <td class='etiqueta'>Periodo</td>
 	      <td class='etiqueta'><input name="txtnperiodo" type="text" class="e_td_number" id="txtnperiodo" onKeyPress="return TextUtil.allowChars(this, event)" size="5" maxlength="5" validchars="1234567890,." />
 	        <select name="cmbperiodo1" class="e_combo" id="cmbperiodo1"  onChange="validaPeriodo(this.value);" >
 	          <option value="0">Seleccione</option>
 	          <option value="1">D&iacute;a</option>
 	          <option value="2">Mes</option>
 	          </select>
<div style="position:absolute"id="topes"></div></td>
 	      <td class='etiqueta'>Total de PEA</td>
 	      <td class='etiqueta'><font class='alerta5'>
 	        <input name="txtCantPea" type="text" class="e_td_number" id="txtCantPea" onKeyPress="return TextUtil.allowChars(this, event);" onKeyUp="valida(this.value);" size="5" maxlength="5" validchars="1234567890">
(*) 
<input name="txtarmadas" type="hidden" id="txtarmadas" value="">
 	      </font></td>
 	      </tr>

 	        </thead>
         <tbody>
 	            </tbody>    
                <tfoot>  
                <tr>
			 <td colspan="4" align="center" >
                <input name="button" type="button" class="boton" id="button" value="Grabar" onClick="enviar_cargo()">
                  <span class="etiqueta"><span class="alerta4">
 				Detalle</span>
 	      <font class='alerta5'><img src="images/ventana.png" alt="" border="0" style="CURSOR: hand" onClick="window.open('http://boardweb.inei.gob.pe:83','','scrollbars=yes,width=880,height=700,resizable=1')" />
 	      </font></span></td>
          
          
           <!-- td colspan="4" align="center" >
                <input name="button" type="button" class="boton" id="button" value="Grabar" onClick="enviar_cargo()">
                  <span class="etiqueta"><span class="alerta4">
 				Detalle</span>
 	      <font class='alerta5'><img src="images/ventana.png" alt="" border="0" style="CURSOR: hand" onClick="window.open('pd_conAdministrativaDetalle.asp?lstipoReport=2&amp;wwwHora=<'%=time()%>','','top=10,left=25,scrollbars=yes,width=880,height=700,resizable=1')" />
 	      </font></span></td -->
          
          
          
                   
             
 	      </tr></tfoot>
 	    </table>
 	</div>	
		</td>
	</tr>	
	</table></form>
    <div id="divC" style="vertical-align:top; overflow:auto; height:4%;" width:"10%" >
    <%
	response.Write " <table width=""94%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
	response.Write " <td width=""3%"">Fuente  <br>Fto.</td>"
    response.Write "    <td width=""15%"">Cargo  <br> Funcional</td>"
    response.Write "    <td width=""15%"">Cargo de  <br>Contrataci&oacute;n</td>"
	response.Write "    <td width=""25%"">Dependencia</td>"
	response.Write " <td width=""5%"">Cant. PEA <br> Presup.</td>"
	response.Write " <td width=""5%"">Cant PEA CCP</td>"
	response.Write "    <td width=""5%"">Sueldo</td>"
	response.Write " <td width=""5%"">C&oacute;digo de Operaci&oacute;n</td>"
	response.Write " <td width=""6%""><input name=""button2"" type=""button"" class=""boton"" id=""button2"" value=""Activar"" onClick=""javascript:llamar()""></td>"
	response.Write " <td width=""6%""> Ubigeo</td>"
	response.Write " <td width=""6%""> Detalle</td>"
    response.Write "  </tr></table> "
	%>
    </div>
    <div id="divCriterio" style="vertical-align:top; overflow:auto; height:300px;"></div>
	
</div>
<BR>
 <div id="footer" align="right">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>

<div id="ficha" align="center"></div>
<div id="dialog-form" title="Ingresar Oficio de Solicitud CCP">
	<p class="validateTips">Todos los campos son obligatorios
	  <input type="hidden" name="txtid" id="txtid">
	</p>
	<form>
	<fieldset>
   	  <label for="email">N&deg; DE SOLICITUD</label><br>
	 Oficio N&deg; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;
	 <input name="nsolicitud" type="text" class="" id="nsolicitud" style="width:60px" maxlength="5" onKeyPress="return fs_numeros(event)" /> - <select name="cmbperiodo11" style="width:60px"  id="cmbperiodo11"  onChange="validaPeriodo(this.value);"  on >
 	          <option selected value="<%=ANIO_A%>"><%=ANIO_A%></option>
 	          <option value="<%=ANIO_AN%>"><%=ANIO_AN%></option>
 	          </select>
	 - <%generaTipoOfc()%><br><BR>
 <label for="email">Fecha de Solicitud</label>
 &nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
		<input type="text" name="fsolicitud" onKeyUp="this.value=formateafecha(this.value);" id="fsolicitud" value="" class="" width="150px" /><br><BR>   
    
  <label for="name">N&deg; DE OFICIO DEL CCP</label><BR>
  Oficio N&deg; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<input name="noficio" type="text" class="" style="width:60px" id="noficio" value="" 
										onKeyPress="return fs_numeros(event)" /> - 
      <select name="cmbperiodo2" style="width:60px"  id="cmbperiodo2"  onChange="validaPeriodo(this.value);" >
        <option selected value="<%=ANIO_A%>"><%=ANIO_A%></option>
        <option value="<%=ANIO_AN%>"><%=ANIO_AN%></option>
      </select> - <%generaTipoOfc2()%>
      <br><br>
		<label for="email">Fecha</label>
        <label for="name2">Oficio</label>
del CCP:&nbsp;&nbsp;
<input type="text" name="fecha_resol" onKeyUp="this.value=formateafecha(this.value);" id="fecha_resol" value=""class="" width="150px" />
		
	</fieldset>
	</form>
</div> 
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
