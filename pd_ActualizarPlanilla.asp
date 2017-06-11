<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0


 id_usuario=  Session("id_usuario")
 ipVisitante = Request.ServerVariables("REMOTE_ADDR")


lsRol = CStr(Session("txtTipoUsuarioValido"))
'lsUsuario=Session("id_usuario")
lsUsuario =  Session("txtNombreValido")
lsUsuario1 =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 
id_proyecto=session("id_proyecto")
lsnivel = Request("lsnivel")

sub generaCargo()
			
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO ""2"" ")

	
	Response.Write "<select class=""e_combo"" style=""width:210px"" id=""cmbCargo"" name=""cmbCargo"" >"
	Response.Write " <option value=""999"">Seleccione</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(1) & "</option>"
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
	Response.Write " <option  value=""99"">Todos</option>"


	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub

sub generaDptoSelec()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getCCDD_UBI '"&lsUbigeo&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option  value=""99"">Todos</option>"
'	Response.Write " <option  value=""0"">Seleccione...</option>"


	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
    response.Write "<span class=""alerta5"">(*)</span>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub


sub generaPerPlanilla() 
			

	
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.spu_ListarPerPlanillaTipo '3','"&id_proyecto&"'  "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmboPerPlanilla"" name=""cmboPerPlanilla"" OnChange=""validarBotones(this.value);""  >"
	Response.Write "<OPTION value=""0"">seleccione....</OPTION>"
	
	While not wRsDptoapli.EOF		
		Response.Write "<option title="""&wRsDptoapli(0)&" "&wRsDptoapli(1)&"  Estado:"&wRsDptoapli(4)&"" & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(0)&" "&wRsDptoapli(1)&"  ("&wRsDptoapli(4)&") " & "</option>"		
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
	
	
    <link rel="stylesheet" type="text/css" href="Styles/calendar-blue.css">
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calendar-setup.js"></script>
	<script type="text/javascript" src="js/calendar-es.js"></script>
	<script type="text/javascript" src="js/sorttable.js"></script>


<script language="javascript">
$(document).ready(function() {
	$(".botonExcel").click(function(event) {
		$("#datos_a_enviar").val( $("<div>").append( $("#Exportar_a_Excel").eq(0).clone()).html());
		$("#FormularioExportacion").submit();
});
});
</script>
<script>

function validaIngLetras(e) {

tecla = (document.all) ? e.keyCode : e.which; 
patron = /^([a-z]|[A-Z]|||\s)*$/;
te = String.fromCharCode(tecla); 

if(tecla == 9) {return false};
if(tecla == 13 ){

			//pasarCajas(cval,cpas);	
			return true; 	        
    }
	return patron.test(te); 
}






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

	var vcombo1=0;
	var idcombo;
function valorinicial (valor,id)
{
idcombo=id;
	vcombo1=valor;
	}
var C2argo='';

function gseleccio(id_per,valor,idc,nombre,cargo)
{C2argo=cargo;

var nota = document.getElementById("txt"+id_per).value;
	if (nota='' || nota==0 ){
	alert("Debe de Registrar una Nota antes seleccionar estado")
	document.getElementById("txt"+id_per).focus();
	document.getElementById("est"+id_per).value=9;
	return false;	
	}

var tcarg="cmbCargo"+id_per;
CCargo = document.getElementById(''+tcarg+'').value;
		if(confirm("Estas seguro de registrar este cambio a:\n"+nombre)==true)
		{
			var contador=parseInt(document.getElementById('txtCapacitacion').value);
		if(valor==1 ){
		 contador= contador+1;
		document.getElementById('txtCapacitacion').value=contador;
		}
		else{
			if (contador>0)
			{
	 	 contador= contador-1;
		document.getElementById('txtCapacitacion').value=contador;

			}else 
					document.getElementById('txtCapacitacion').value=0;
			
		}		
		ProcesarSel(id_per,valor);
		
				}else 
		{   
					document.getElementById(idc).value=vcombo1;
		vcombo1=0;
		idcombo;

		}

}
function cambiar_cargo(cmbcargo,dni)
{
	ajax=http_request();
	valor= "dni="+dni+"&lsTipo=27&lscargo="+cmbcargo; 
		   var url = "m_ingreso.asp";		  

	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("mensaje").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("mensaje").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("mensaje").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{
                     document.getElementById("mensaje").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valor);
   return;

	
	}
	
	
function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;

	var lsUbiProv =document.getElementById("lsubiprov").value;
	var lsrolusu = document.frmMiForm.txtRol.value;

	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&lsUbiProv="+lsUbiProv+"&lsrolusu="+lsrolusu;  // parametros a enviar al servidor

   		
	url="pd_ProvinciaPlanilla.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("reg2").innerHTML ="Cargando......";
				
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("reg2").innerHTML =ajax.responseText;
					
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
	
    var lsUbiDist =document.getElementById("lsubiDist").value;
    var lsrolusu = document.frmMiForm.txtRol.value;
 
	ajax=http_request();
	var valores;	

	valores= "datos=" + escape(varProv)+"&lsUbiDist="+lsUbiDist+"&lsrolusu="+lsrolusu;  // parametros a enviar al servidor	
	
	url="pd_DistritoPlanilla.asp";  
	
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
	

function contarChkS(){
	var total = 0;

}
function guardar_capa(valor,dni)
{
	cargos2=valor;
	
	}

function guardar_titu(valor,dni)
{
	titu12=valor;
	}

function guardar_lug(valor,dni)
{
	lugar2=valor;
	
	}


function cambiar2(val)
{ 	
	var contador=parseInt(document.getElementById('txtCapacitacion').value);
		if(val=='0' ){
		 contador= contador+1;
		document.getElementById('txtCapacitacion').value=contador;
		}
		else if (val=='1' ){
	 	 contador= contador-1;
		document.getElementById('txtCapacitacion').value=contador;
		}
}


function GrabarProcesar()
{    
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var txtusuario=$("#txtusuario").val();
 var txtipusuario=$("#txtipusuario").val();

     if ( lsperiodo=='0')
     {
	  alert ("Seleccionar el periodo")
	  document.getElementById("cmboPerPlanilla").focus();
	  return false
	 }

	ajax=http_request();

	
    var valores= "lsperiodo=" + escape(lsperiodo)+"&txtusuario="+escape(txtusuario)+"&txtipusuario="+escape(txtipusuario); 

	
	var peticion=$.ajax(
		{
		
		 url:'pd_VerificarEstadoPer.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {

		      if (respuesta==1) 
				{								  

				alert('No se puede cerrar la pre conformidad, el periodo se encuentra con conformidad cerrada/aprobada.');

		       } 
			 else
		
		       {
			        					 
                     if (confirm('Est seguro de cerrar la pre conformidad.?')==true )
 
	                   { 
					 
						 ProcesarPlanDetalle();
					    } 

			   }
			 		 			  	          
      } ,
      error:function (e){alert('Se ha producido un Erroraaaa'); 
	  
	  $("#idd").html(e.responseText);
	  
		 
      }
  }
  );
  

}




function ProcesarPlanDetalle()
{    
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var txtusuario=$("#txtusuario").val();
 var txtipusuario=$("#txtipusuario").val();

     if ( lsperiodo=='0')
     {
	  alert ("Seleccionar el periodo")
	  document.getElementById("cmboPerPlanilla").focus();
	  return false
	 }

	ajax=http_request();

	
    var valores= "lsperiodo=" + escape(lsperiodo)+"&txtusuario="+escape(txtusuario)+"&txtipusuario="+escape(txtipusuario); 

	
	var peticion=$.ajax(
		{
		
		 url:'pd_ProcesarPlanilla.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
					   
		       if (respuesta==1) 
		       {
				   
				   $('#idd').html(respuesta);
			         alert("Se procesaron correctamente los registros.");
					 SeleccionarConfPlan(1);

			  }			 		 			  	          
      } ,
      error:function (e){alert('Se ha producido un Erroreeeeee'); 
	  $('#idd').html(e.responseText);
		 
      }
  }
  );
  

}

function maximaLongitud(texto,maxlong) {
var tecla, in_value, out_value;

if (texto.value.length > maxlong) {
in_value = texto.value;
out_value = in_value.substring(0,maxlong);
texto.value = out_value;
return false;
}
return true;
}



function guardarRecibo(id_per,id_contratos,periodo,valor,num,usuario, proyecto){

	ajax=http_request();
	var valores;	
	valores= "id_per=" + escape(id_per)+"&id_contratos=" + escape(id_contratos)+"&periodo=" + escape(periodo)+"&valor=" + escape(valor)+"&num=" + escape(num)+"&usuario=" + escape(usuario)+"&proyecto=" + escape(proyecto)+"&lsTipo=94";  // parametros a enviar al servidor	
		
		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 if (num==1)
                 document.getElementById('ids'+id_contratos).innerHTML ="Cargando......";
			else if(num==2)
				document.getElementById('idn'+id_contratos).innerHTML ="Cargando......";	
			else 	
				document.getElementById('idf'+id_contratos).innerHTML ="Cargando......";		 												
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			if (num==1)
                 document.getElementById('ids'+id_contratos).innerHTML =ajax.responseText;
			else if(num==2)
				document.getElementById('idn'+id_contratos).innerHTML =ajax.responseText;
			else 	
				document.getElementById('idf'+id_contratos).innerHTML =ajax.responseText;	

            }
            else if(ajax.status==404){
				
			if (num==1)
                 document.getElementById('ids'+id_contratos).innerHTML == "La direccion buscada no existe o no esta disponible temporalmente";
			else if(num==2)
				document.getElementById('idn'+id_contratos).innerHTML == "La direccion buscada no existe o no esta disponible temporalmente";
			else 	
				document.getElementById('idf'+id_contratos).innerHTML == "La direccion buscada no existe o no esta disponible temporalmente";

            }
            else{
             if (num==1)
                 document.getElementById('ids'+id_contratos).innerHTML =ajax.responseText;
			else if(num==2)
				document.getElementById('idn'+id_contratos).innerHTML =ajax.responseText;	
			else 	
				document.getElementById('idf'+id_contratos).innerHTML =ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}




function AperturarCierreConsulta(indic)
{    




 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 

     if ( lsperiodo=='0')
     {
	  alert ("Seleccionar el periodo")
	  document.getElementById("cmboPerPlanilla").focus();
	  return false
	 }
	 
	
	 

	ajax=http_request();

	
    var valores= "lsperiodo=" + escape(lsperiodo); 

	
	var peticion=$.ajax(
		{
		
		 url:'pd_VerificarEstadoPlanilla.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
		
		      if (respuesta==1) 
				{								  
				if (indic==1){
					alert('No se puede Aperturar Conformidad, el periodo se encuentra con conformidad Cerrada definitiva o es una Pre Conformidad Aperturada.');}
				else {
					alert('No se puede realizar Cierre Definitiva, el periodo se encuentra con conformidad Cerrada definitiva o es una Pre Conformidad Aperturada.');}
		       } 
			 else
		
		       {
				   
			        if (indic==1)	{				 
						 if (confirm('Est seguro de Aperturar la conformidad.?')==true ) { 
								AperturarCierre();
							} 
					} else 
						if (confirm('Est seguro de Realizar el cierre Definitivo de la conformidad.?')==true ) { 
								CierreDefinitivo();
							} 
						

			   }
			 		 			  	          
      } ,
      error:function (e){alert('Se ha producido un Erroraaaa'); 
	  
	  $("#idd").html(e.responseText);
	  
		 
      }
  }
  );
  

}


function AperturarCierre()
{    
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var txtusuario=$("#txtusuario").val();
 var txtipusuario=$("#txtipusuario").val();

     if ( lsperiodo=='0')
     {
	  alert ("Seleccionar el periodo")
	  document.getElementById("cmboPerPlanilla").focus();
	  return false
	 }

	ajax=http_request();

	
    var valores= "lsperiodo=" + escape(lsperiodo)+"&txtusuario="+escape(txtusuario)+"&txtipusuario="+escape(txtipusuario); 

	
	var peticion=$.ajax(
		{
		
		 url:'pd_AperturarPlanilla.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
			/*$("#idd").html(respuesta);*/
			
		       if (respuesta==1) 
		       {
			         alert("Se aperturo correctamente la planilla");
					 SeleccionarConfPlan(1);

			  }
			 		 			  	          
      } ,
      error:function (e){alert('Se ha producido un Erroreeeeee'); 
	  $('#idd').html(e.responseText);
		 
      }
  }
  );
}



function CierreDefinitivo()
{   var SIAF; 

	
		
		SIAF=prompt('Ingrese el Nro de SIAF:','');
		//Verificar que tenga numeros
		 if (!/^([0-9])*$/.test(SIAF)){
			  alert("SIAF solo debe tener Numeros");
			  return;
		  }
		  //verifica cadena <> 0 
		   if (SIAF.trim().length==0 ){
			  alert("Debe llenar el SIAF");
			  return;
		  }
		  
  
	
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var txtusuario=$("#txtusuario").val();
 var txtipusuario=$("#txtipusuario").val();

     if ( lsperiodo=='0')
     {
	  alert ("Seleccionar el periodo")
	  document.getElementById("cmboPerPlanilla").focus();
	  return false
	 }

	ajax=http_request();

	
    var valores= "lsperiodo=" + escape(lsperiodo)+"&txtusuario="+escape(txtusuario)+"&txtipusuario="+escape(txtipusuario)+"&SIAF="+SIAF; 

	
	var peticion=$.ajax(
		{
		
		 url:'pd_CierreDefinitivo.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
		

		
		       if (respuesta==1) 
		       {
			         alert("Se realizo el cierre definitivo de la planilla");
					 SeleccionarConfPlan(1);

			  }
			 		 			  	          
      } ,
      error:function (e){alert('Se ha producido un Erroraaaa'); 
	  
	  $("#idd").html(e.responseText);
	  
		 
      }
  }
  );
  

}


function validarBotones (periodo){
	
	ajax=http_request();

	var valores= "periodo=" + escape(periodo); 

	
	var peticion=$.ajax(
		{
		
		 url:'pd_validaPeriodo.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
			var aestado = respuesta;
			var lestado=aestado.split("*");
			var estado=lestado[0];
			var descripcion=lestado[1];
			
			document.getElementById("estado").innerHTML=descripcion;
			
		       if (estado==1 || estado==2) 
		       {
			      $('#btnCP').attr('disabled', false);
				  $('#btnAP').attr('disabled', true);
				  $('#btnCD').attr('disabled', true);
				 
			  } else if (estado==3){
				  $('#btnCP').attr('disabled', false);
				  $('#btnAP').attr('disabled', false);
				  $('#btnCD').attr('disabled', false);
				  
			  } else if (estado=4){
				  $('#btnCP').attr('disabled', true);
				  $('#btnAP').attr('disabled', true);
				  $('#btnCD').attr('disabled', true);
				  } else
				  alert("No se selecciono ningun periodo")
					          
      } ,
      error:function (e){alert('Se ha producido un Erroraaaa'); 
	  
	  $("#idd").html(e.responseText);
	  
		 
      }
  }
  );

}


function Anular_pago (periodo_pla,id_contrato, valor, id_contrato ){
	
	//alert (contrato);
		
}

</script>
    </head>
    <body>
        <div id="top">
           <!--#include file="cabecera.html"--><!--#include file="pd_menu.asp"-->

       </div>
<div id="divNavegacion" align="center"><span class="subtitulo">Pago :Aprobaci&oacute;n de Pre Conformidad</span></div>
        <div id="lateral">
                 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_ActualizarPlanilla.asp">
                   <table width='98%' border='0' cellpadding="2" cellspacing="2">
                   <tr>
                   <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><table width='98%' border='0' cellpadding="2" cellspacing="2">
                     <tr>
                       <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios<span class="criterio">
                         <input name="cboReporte" type="hidden" id="cboReporte" value="4" />
                         <input name="txtRol" type="hidden" id="txtRol" value="<%=lsRol%>" />
                         <input type="hidden" id=txtipusuario name=txtipusuario value="<%=ipVisitante%>" />
                         <input type="hidden" id=txtusuario name=txtusuario value="<%=id_usuario%>" />
                         <input type="hidden" id="lsubiprov"  name="lsubiprov" value="<%=lsUbigeoapli%>" />
                         <input type="hidden" id="lsubiDist" name="lsubiDist" value="<%=lsUbigeoDist%>" />
                       </span></td>
                     </tr>
                     <tr>
                       <td width="8%"  align=right bgcolor="#F7F8F9"><p><span class="criterio" >Per&iacute;odo :</span></p></td>
                       <td width="67%" align="left"   bgcolor="#EFF5FA" class="mensaje2"><%generaPerPlanilla()%>
                         <span class="alerta5">(*)</span></td>
                     </tr>
                     <tr>
                       <td width="8%"  align=right bgcolor="#F7F8F9"><span class="criterio" id="nomdpto" >
                         <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                         Departamento:&nbsp;</span></td>
                       <% IF (lsRol ="7" OR lsRol="1")  THEN %>
                       <td width="67%" align=left bgcolor="#F7F8F9" id="dep"  nowrap="nowrap"><%generaDpto()%>
                         <span class="criterio">
                           <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
                         </span></td>
                       <%ELSE %>
                       <td width="25%" align=left bgcolor="#F7F8F9" id="dep"  nowrap="nowrap"><%generaDptoSelec()%>
                         <span class="criterio">
                           <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
                         </span></td>
                       <%END IF %>
                     </tr>
                     <tr>
                       <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Provincia:</span></td>
                       <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                         <% IF (lsRol ="7" OR lsRol="1")  THEN %>
                         <option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
                         <%ELSE %>
                         <option id="txtProv1" 	title="Todos" value="9999" > Seleccione... </option>
                         <%END IF %>
                       </select></td>
                     </tr>
                     <tr>
                       <td  align="right" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                       <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                         <% IF (lsRol ="7" OR lsRol="1")  THEN %>
                         <option id="txtDist1" 	title="Todos" value="999998" >Todos </option>
                         <%ELSE %>
                         <option id="txtDist1" 	title="Todos" value="999998" > Seleccione... </option>
                         <%END IF %>
                       </select></td>
                     </tr>
                     <tr>
                       <td colspan="4"  align="left" bgcolor="#F7F8F9" style=" font-family:Arial;height:45px;border:1;"><br />
                         <fieldset style=" font-family:Arial;height:45px;border:1;width:100;">
                           <legend class="criterio" style=" font-family:Arial;height:20px;">&nbsp;&nbsp;Nivel de RRHH :</legend>
                           <table>
                             <tr  bgcolor="#F7F8F9" style=" font-family:Arial;height:5px;border:1;">
                               <td  colspan="4"><input type="radio" name="nivelRRHH" id="TODOS" value="9" checked="checked"/>
                                 <label for="4" class="etiqueta" ><strong>TODOS</strong></label>
                                 &nbsp;&nbsp;&nbsp;
                                 <input type="radio" name="nivelRRHH" id="AD" value="3"  />
                                 <label for="3" class="etiqueta" >RTA</label>
                                 &nbsp;&nbsp;&nbsp;
                                 <input type="radio" name="nivelRRHH" id="RA" value="1"  />
                                 <label for="1" class="etiqueta">RAO</label>
                                 &nbsp;&nbsp;&nbsp;
                                 <input type="radio" name="nivelRRHH" id="RO" value="2" />
                                 <label for="2" class="etiqueta" >RO</label></td>
                             </tr>
                           </table>
                         </fieldset>
                         </td>
                     </tr>
                     <tr>
                     <td class="alerta">Estado:                  
                     </td>
                     <td class="alerta"> <font id="estado"></font>   </td>
                     </tr>
             
                     <tr>
                       <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><input name='button1' type='button' class="boton" id='button1' onclick="SeleccionarConfPlan(1);" value='Aceptar' />
                         <br />
                         <br /></td>
                     </tr>
                     <tr>
                       <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><input name='button1' type='button' class="boton" id='button1' onclick="javascript:SeleccionarPlanResumen(1); " value='Resumen' /></td>
                     </tr>
                     <tr>
                       <td id="idd" >&nbsp;</td>
                     </tr>
                       <td height="4" colspan="4" align=center  bgcolor="#F7F8F9" class="alerta5">Se procesar&aacute;n todos los registros para el periodo seleccionado.</td>
                     </tr>
                     <% IF (lsRol ="7" OR lsRol="1")  THEN %>
                     <tr>
                       <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><input name='btnCP' type='button' class="botonCerrar" id='btnCP' onclick="javascript:GrabarProcesar()" value='Cerrar Pre Conformidad' /></td>
                     </tr>
                     <tr>
                       <td height="4" colspan="4" align=center bgcolor="#F7F8F9">------------------------------------------<br><input name='btnAP' type='button' class="botonCerrar" id='btnAP' onclick="javascript:AperturarCierreConsulta('1')" value='Aperturar Conformidad' /></td>
                     </tr>
                      <tr>
                       <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><input name='btnCD' type='button' class="botonCerrar" id='btnCD' onclick="javascript:AperturarCierreConsulta('2')" value='Cierre Definitivo' /></td>
                     </tr>
                     <%ELSE%>
                   <!--  <tr>
                       <td height="4" colspan="4" align=center bgcolor="#F7F8F9"><input name='button1' type='button' class="botonCerrar" id='button1' onclick="javascript:GrabarProcesar()" value='Cerrar Pre Conformidad' /></td>
                     </tr>-->
                     <%END IF%>
                     <tr height=22>
                       <td colspan="2" align="center" bgcolor="#F7F8F9"></td>
                     </tr>
                     <tr height=22></tr>
                   </table></td>
                   </tr>
                   </table>
          </form>
        </div>
        
        <div id="content">
           
            <a id="toggler"></a>
            <div id="render">
             <div id="divResultado" align="center"  style=" font-family:Arial;font-size:10px;height:100%; overflow:scroll"></div>
		  <div id="mensaje" ></div>

			<iframe id="iframe" width="100%" height="100%" src="" frameborder="0"></iframe>
            </div>
        </div>
        
        <div id="footer">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>
    </body>
</html>
<%Else
Response.Redirect("default.asp")
End If%>
