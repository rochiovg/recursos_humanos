<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->
<%
Response.Expires = 0

id_proyecto=session("id_proyecto")
 id_usuario=  Session("id_usuario")
 ipVisitante = Request.ServerVariables("REMOTE_ADDR")


lsRol = CStr(Session("txtTipoUsuarioValido"))
'lsUsuario=Session("id_usuario")
lsUsuario =  Session("txtNombreValido")
lsUsuario1 =  Session("txtNombreValido")
lsUbigeo = Session("Ubigeo") 
lsUbigeoapli = Session("Ubigeoapli") 
lsUbigeoDist = Session("UbigeoDist") 

lsnivel = Request("lsnivel")


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
	Response.Write " <option  value=""0"">Seleccione...</option>"


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
    


<script>


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
	
// onblur  Verificar DNI Existe en Ficha y DNI tiene contrato
function ValidaExisteDNIFicha(){

 var txtDNI=$("#txtDNI").val();
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var obj=document.getElementById('txtDNI');
 
 if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
  
 
   if (document.frmMiForm.txtDNI.value.length <8)
   {
	 alert("El DNI debe de tener 8 digitos")
	 document.getElementById("txtDNI").focus();
	 return false

   }
      
   ajax=http_request();


var valores="txtDNI="+txtDNI+"&lsperiodo="+escape(lsperiodo)+"&lsvalor=4";


var peticion=$.ajax(
		{
		 url:'TraerdatosDNI.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
		 data:valores,
         beforeSend: function(){
        								
							    },
		    success:function (respuesta) {
				
                                      if(respuesta==3)
									  {
									  document.getElementById('msj3').innerHTML="El DNI no existe.";
									  ocultardiv();
									  

                                      document.getElementById("txtapenom").value="";
                                      document.getElementById("txtestcont").value="";
                                      document.getElementById("txtDNI").focus();
									  
									  }
									  else
									  {
									     if(respuesta==2)
									     {
										 document.getElementById('msj3').innerHTML="Usted no tiene un contrato asociado.";
										 ocultardiv();

                                      document.getElementById("txtapenom").value="";
                                      document.getElementById("txtestcont").value="";
                                      document.getElementById("txtDNI").focus();
										 }
										 else
										 {
										   TraerApellNom();
										 }
									  }
											   
                                        } ,
            error:function (e){alert('Se a producido un Error 1'); 
			 $('#resp').html(e.responseText); 
      }
    }
  );
}

	
	
	
function TraerApellNom(){

 var txtDNI=$("#txtDNI").val();
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var obj=document.getElementById('txtDNI');
 
 if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
  
 
   if (document.frmMiForm.txtDNI.value.length <8)
   {
	 alert("El DNI debe de tener 8 digitos")
	 document.getElementById("txtDNI").focus();
	 return false

   }
      
   ajax=http_request();


var valores="txtDNI="+txtDNI+"&lsperiodo="+escape(lsperiodo)+"&lsvalor=1";


var peticion=$.ajax(
		{
		 url:'TraerdatosDNI.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
		 data:valores,
         beforeSend: function(){
        								
							    },
		    success:function (respuesta) {
		       

											   
											   var Datos = new Array();             
                                               var Dat=respuesta;
                                               Datos=Dat.split(",");
                                               
                                               
                                               $("#txtapenom").val(Datos[0]);
                                               $("#txtestcont").val(Datos[1]); 
											   $("#txtactivoc").val(Datos[2]); 
											   $("#txtFlagPagoCom").val(Datos[3]); 
                                               
												
										if(document.frmMiForm.txtactivoc.value=='4')
										{

										}
										if(document.frmMiForm.txtactivoc.value=='2')
										{

										}

										
										     if( document.frmMiForm.txtFlagPagoCom.value=='0')
										     {
											  document.getElementById('msj3').innerHTML="";
										     
											 mostrardiv();
											 VerificarApellNom();
                                                
											 }
											 else
											 {
											  document.getElementById('msj3').innerHTML="No tiene pago pendiente";
									          
											  ocultardiv();
												 
											 }
			
                                        } ,
            error:function (){alert('Se a producido un Error 2'); 
			 $("#txtapenom").html("");
      }
    }
  );
}



function VerificarApellNom(){

 var txtDNI=$("#txtDNI").val();
 var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
 var obj=document.getElementById('txtDNI');
 var flagver;
 
 if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
  
 
   if (document.frmMiForm.txtDNI.value.length <8)
   {
	 alert("El DNI debe de tener 8 digitos")
	 document.getElementById("txtDNI").focus();
	 return false

   }
      
   ajax=http_request();


var valores="txtDNI="+txtDNI+"&lsperiodo="+escape(lsperiodo)+"&lsvalor=1";


var peticion=$.ajax(
		{
		 url:'pd_VerificarApellNom.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
		 data:valores,
         beforeSend: function(){
        								
							    },
		    success:function (respuesta) {
				
				            if(respuesta==2)
							{
								document.getElementById('msj3').innerHTML="El dni ya se encuentra incluido en el periodo seleccionado.";
								ocultardiv();
							}
							else
							{
                                 if(respuesta==1)
								 {
								      if(document.frmMiForm.txtactivoc.value=='4')
										{
									
										}
										if(document.frmMiForm.txtactivoc.value=='2')
										{
										}

										     if( document.frmMiForm.txtFlagPagoCom.value=='0')
										     {
											  document.getElementById('msj3').innerHTML="";
											  mostrardiv();
											 }
											 else
											 { 
											  document.getElementById('msj3').innerHTML="No tiene pago pendiente";
											  ocultardiv();
											 } 
								 
								 }
								
							}
			
                                        } ,
            error:function (){alert('Se a producido un Error'); 
			 $("#txtapenom").html("");
      }
    }
  );
}

function mostrardiv() {

div = document.getElementById('VerAdicionar');

div.style.display = '';

}

function ocultardiv() {

div = document.getElementById('VerAdicionar');

div.style.display='none';

}



////Proceso Masivo Conformidad//

function GrabarAperturaConfDet(){
   
  
  var lsperiodo=document.getElementById("cmboPerPlanilla").value;
  var lsfuente=document.getElementById("cmboFuente").value;  
  var lsrolusu = document.frmMiForm.txtRol.value;
  var txtDesPeriodo = document.frmMiForm.txtDesPeriodo.value.toUpperCase();
  var txtusuario = document.frmMiForm.txtusuario.value;
  var txtipusuario = document.frmMiForm.txtipusuario.value;

   if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
	if ( lsfuente=='0')
     {
                  alert ("Seleccionar la Fuente de Financiamiento")
                  document.getElementById("cmboFuente").focus();
                  return false
     } 
	  
   if (txtDesPeriodo=='')
   {
	 alert("Ingrese descripcion del periodo")
	 document.getElementById("txtDesPeriodo").focus();
	 return false
   }




var i

for (i=0;i<document.frmMiForm.nivelRRHH.length;i++)
                               {
                                               if (document.frmMiForm.nivelRRHH[i].checked == true)
                                               { lsnivel=document.frmMiForm.nivelRRHH[i].value;
                                               }

                               }

                
 
ajax=http_request();
        
 var valores= "lsperiodo=" + escape(lsperiodo)+"&txtDesPeriodo="+escape(txtDesPeriodo)+"&lsnivel="+escape(lsnivel)+"&lsrolusu="+lsrolusu+"&txtusuario="+txtusuario+"&txtipusuario="+txtipusuario+"&lsval=1&lsfuente="+lsfuente;
  
	var peticion=$.ajax(
		{
		
		 url:'pd_ProcesarAperturaConf.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
			$('#resp').html=respuesta;
	
            if (respuesta==3) 
			{								  

			alert('No se puede procesar, el periodo se encuentra con Pre Conformidad Aperturada.') ;
			
		    } 
            else
			{
		
		        if (respuesta==1) 
				   {								  
					CalcularDesc();
		           } 
			  
			     else
			     {     if(respuesta==2) 
			         {

				       alert('Se ha procesado anteriormente la apertura de pre conformidad.');
				      

			          }

			      }
			}

			 		 			  	          
      } ,
      error:function (e){alert('Se ha producido un error al Generar Planilla'); 
	  $('#resp').html(e.responseText); 
	}
  }
  );
  

}



function GrabarAperturaDNI(){
   
  
  var lsperiodo=document.getElementById("cmboPerPlanilla").value;
  var lsfuente=document.getElementById("cmboFuente").value;  
  var lsrolusu = document.frmMiForm.txtRol.value;
  var txtDesPeriodo = document.frmMiForm.txtDesPeriodo.value.toUpperCase();
  var txtusuario = document.frmMiForm.txtusuario.value;
  var txtipusuario = document.frmMiForm.txtipusuario.value;
  var txtDNI=$("#txtDNI").val();

   if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
	if ( lsfuente=='0')
     {
                  alert ("Seleccionar la Fuente de Financiamiento")
                  document.getElementById("cmboFuente").focus();
                  return false
     } 
	 
   if (txtDesPeriodo=='')
   {
	 alert("Ingrese descripcion del periodo")
	 document.getElementById("txtDesPeriodo").focus();
	 return false
   }
   
   if (document.frmMiForm.txtDNI.value.length <8)
   {
	 alert("El DNI debe de tener 8 digitos")
	 document.getElementById("txtDNI").focus();
	 return false

   }
                

 
ajax=http_request();
        
 var valores= "lsperiodo=" + escape(lsperiodo)+"&txtDesPeriodo="+escape(txtDesPeriodo)+"&lsrolusu="+lsrolusu+"&txtusuario="+txtusuario+"&txtipusuario="+txtipusuario+"&txtDNI="+txtDNI+"&lsval=2&lsfuente="+lsfuente;

	var peticion=$.ajax(
		{
		
		 url:'pd_ProcesarAperturaConf.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
			$("#resp").val(respuesta);

	
     if (respuesta==3) 
			{								  

			alert('No se puede procesar, el periodo se encuentra con Pre Conformidad Aperturada.') ;

		   } 
     else
           {
		
		          if (respuesta==1) 
				   {								  

				   alert('Se adicionó correctamente el registro.') ;
								   ocultardiv();
                   document.getElementById("txtDNI").value="";
                   document.getElementById("txtapenom").value="";
                   document.getElementById("txtestcont").value="";
                   document.getElementById("txtDNI").focus();

				   
		          } 
			  
			     else
			      {   if(respuesta==2) 
			         {

    				       alert('El registro fue adicionado anteriormente.');


			          }

			       }
            }

			 		 			  	          
      } ,
      error:function (){alert('Se ha producido un ErrorDDSFASDFAS'); 
		 
      }
  }
  );
  

}


function TraerDescEstado()
{
   var lsperiodo=document.getElementById("cmboPerPlanilla").value; 

	ajax=http_request();

	 var valores="lsperiodo="+escape(lsperiodo)+"&lsvalor=2"; 

	
var peticion=$.ajax(
		{
		 url:'TraerdatosDNI.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
		 data:valores,
         beforeSend: function(){
        								
							    },
		    success:function (respuesta) {
		       

                                               var Datos = new Array();             
                                               var Dat=respuesta;
                                               Datos=Dat.split(",");
                                               
                                               
                                               $("#txtDesPeriodo").val(Datos[0]);
												validarPlanillas();
			
                                        } ,
            error:function (){alert('Se a producido un Error'); 
			 $("#txtDesPeriodo").html("");
      }
    }
  );
}


function validarPlanillas () {
	var lsperiodo=document.getElementById("cmboPerPlanilla").value; 

	ajax=http_request();

	 var valores="lsperiodo="+escape(lsperiodo)+"&lsvalor=5"; 

	
var peticion=$.ajax(
		{
		 url:'TraerdatosDNI.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
		 data:valores,
         beforeSend: function(){
        								
							    },
		    success:function (respuesta) {
 				var aestado = respuesta;
				var lestado=aestado.split("*");
				var maxPlanilla=lestado[0];
				var numPlanilla=lestado[1];

					if (lsperiodo==maxPlanilla && numPlanilla>1){
						$('#btnLimpiar').attr('disabled', true);
				  		$('#btnCerrar').attr('disabled', true);
						alert("Primero cierre la planilla Aperturada para modificar la ultima Planilla Generada");
					} else if (lsperiodo!=maxPlanilla && numPlanilla>1){
						$('#btnLimpiar').attr('disabled', true);
				  		$('#btnCerrar').attr('disabled', false);
					} else {
						$('#btnLimpiar').attr('disabled', false);
				  		$('#btnCerrar').attr('disabled', false);
						}
            } ,
            error:function (){alert('Se a producido un Error'); 
			 $("#txtDesPeriodo").html("");
      }
    }
  );
	
}



function EliminarConfDetalle()
{
   var lsperiodo=document.getElementById("cmboPerPlanilla").value; 


	if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
	 
 ajax=http_request();



var valores="lsperiodo="+escape(lsperiodo)+"&lsval=6";

	
var peticion=$.ajax(
		{
		 url:'pd_ProcesarAperturaConf.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
		 data:valores,
         beforeSend: function(){
        								
							    },
		    success:function (respuesta) {

				                 
								 if (respuesta==3) 
				                    {								  
                               
				                     alert('No se puede eliminar, el periodo se encuentra con Pre Conformidad Aperturada.') ;

		                           } 
								else
								{
									
									if (respuesta==1) 
				                    {								  

									 ReprocesarConfDetalle();
		                           } 
									
									
								 else
			                       { if(respuesta==2) 
			                          {

				                       alert('Los registros fueron eliminados anteriormente.');

			                          }

			                        }
								}


                              } ,
            error:function (){alert('Se a producido un Error'); 

      }
    }
  );
//}
}


function ReprocesarConfDetalle()
{
   var lsperiodo=document.getElementById("cmboPerPlanilla").value; 


	if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
	 
 ajax=http_request();

if (confirm('¿Está seguro de eliminar los registros.?')==true )
 
	{ 

var valores="lsperiodo="+escape(lsperiodo)+"&lsval=3";

	
var peticion=$.ajax(
		{
		 url:'pd_ProcesarAperturaConf.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
		 data:valores,
         beforeSend: function(){
        								
							    },
		    success:function (respuesta) {

									if (respuesta==1) 
				                    {								  

				                     alert('Se eliminaron los registros correctamente.') ;
				                     SeleccionarAperturaConf(1);
									 
		                            } 

                                        } ,
            error:function (){alert('Se a producido un Error'); 

      }
    }
  );
}
}



function VerifCerrarAperturaEstado()
{
   var lsperiodo=document.getElementById("cmboPerPlanilla").value; 

	if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
	
	
	ajax=http_request();


	 var valores="lsperiodo="+escape(lsperiodo)+"&lsval=5"; 

	
var peticion=$.ajax(
		{
		 url:'pd_ProcesarAperturaConf.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
		 data:valores,
         beforeSend: function(){
        								
							    },
		    success:function (respuesta) {

				
				                  if (respuesta==2) 
				                    {								  

				                     alert('Se cerró la apertura anteriormente.') ;

		                            } 

                                else
                                {								
								  if (respuesta==1) 
				                    {								  

									 CerrarAperturaEstado();
		                            } 
                                }
			
                                        } ,
            error:function (){alert('Se a producido un Error'); 

      }
    }
  );

}

function CerrarAperturaEstado()
{
   var lsperiodo=document.getElementById("cmboPerPlanilla").value; 

	if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
	
	
	ajax=http_request();

if (confirm('¿Está seguro de cerrar la apertura.? \n Una vez cerrada no podrá adicionar personas a la pre conformidad.')==true )
 
	{ 
	 var valores="lsperiodo="+escape(lsperiodo)+"&lsval=4"; 

	
var peticion=$.ajax(
		{
		 url:'pd_ProcesarAperturaConf.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
		 data:valores,
         beforeSend: function(){
        								
							    },
		    success:function (respuesta) {
		       
							
								  if (respuesta==1) 
				                    {								  

				                     alert('Se cerró la apertura correctamente.\n Para aprobar la pre conformidad ir a Aprob. de Pre Conformidad. ') ;
									 ActualizarComboEstado();

		                            } 

			
                                        } ,
            error:function (){alert('Se a producido un Error'); 

      }
    }
  );
}
}


function ActualizarComboEstado(){
     
	ajax=http_request();

    var valores="lsvalor=3"; 

	url="TraerdatosDNI.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("regPerPla").innerHTML ="Cargando......";
                // document.getElementById("regFuente").innerHTML ="Cargando......";
				
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("regPerPla").innerHTML =ajax.responseText;
			//		document.getElementById("regFuente").innerHTML =ajax.responseText;
					
            }
            else if(ajax.status==404){
                     document.getElementById("regPerPla").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
               //      document.getElementById("regFuente").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
					
            }
            else{

                     document.getElementById("regPerPla").innerHTML = ajax.responseText;
               //      document.getElementById("regFuente").innerHTML = ajax.responseText;		
					 			 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function EliminarReg(periodoPla,id_Presupuesto,ID_PER,id_Contratos)
{

   var lsperiodo=document.getElementById("cmboPerPlanilla").value; 

	if ( lsperiodo=='0')
     {
                  alert ("Seleccionar el periodo")
                  document.getElementById("cmboPerPlanilla").focus();
                  return false
     }
	
	
	ajax=http_request();
  

	 var valores="lsperiodo="+escape(lsperiodo)+"&periodoPla="+periodoPla+"&id_Presupuesto="+id_Presupuesto+"&ID_PER="+ID_PER+"&id_Contratos="+id_Contratos+"&lsval=7"; 

	var peticion=$.ajax(
		{
		
	     url:"pd_ProcesarAperturaConf.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){

							  },
		success:function (respuesta) {
                               if (respuesta==2) 
				                    {								  

				                     alert('No se puede eliminar el registro,\n el periodo no se encuentra con estado activo. ') ;
									 ActualizarComboEstado();

									 return false;

		                            } 

                                else
                                {	
									if (respuesta==1) 
									   {
									     alert('Se eliminó el registro correctamente')
										 SeleccionarAperturaConf(1);
									   }
								}
									
									 } ,
		error:function (){
			  alert('Se a producido un Error'); 
			 $("#divResultado").html("");
						}
		}
		);


}


function guardarPeriodo(id_per,id_contratos,periodo,valor,num,usuario){

	ajax=http_request();
	var valores;	
	valores= "id_per=" + escape(id_per)+"&id_contratos=" + escape(id_contratos)+"&periodo=" + escape(periodo)+"&valor=" + escape(valor)+"&num=" + escape(num)+"&usuario=" + escape(usuario)+"&lsTipo=98";  // parametros a enviar al servidor	
		
		url="m_ingreso.asp"; 
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 if (num==4)
                 document.getElementById('idP'+id_contratos).innerHTML ="Cargando......";
			else if(num==5)
				document.getElementById('idI'+id_contratos).innerHTML ="Cargando......";	
			else 	
				document.getElementById('idF'+id_contratos).innerHTML ="Cargando......";		 												
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
				
			if (num==4)
                 document.getElementById('idP'+id_contratos).innerHTML =ajax.responseText;
			else if(num==5)
				document.getElementById('idI'+id_contratos).innerHTML =ajax.responseText;
			else 	
				document.getElementById('idF'+id_contratos).innerHTML =ajax.responseText;	

            }
            else if(ajax.status==404){
				
			if (num==4)
                 document.getElementById('idP'+id_contratos).innerHTML == "La direccion buscada no existe o no esta disponible temporalmente";
			else if(num==5)
				document.getElementById('idI'+id_contratos).innerHTML == "La direccion buscada no existe o no esta disponible temporalmente";
			else 	
				document.getElementById('idF'+id_contratos).innerHTML == "La direccion buscada no existe o no esta disponible temporalmente";

            }
            else{
             if (num==4)
                 document.getElementById('idP'+id_contratos).innerHTML =ajax.responseText;
			else if(num==5)
				document.getElementById('idI'+id_contratos).innerHTML =ajax.responseText;	
			else 	
				document.getElementById('idF'+id_contratos).innerHTML =ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function CalcularDesc(){
  var lsperiodo=document.getElementById("cmboPerPlanilla").value; 
  var txtusuario = document.frmMiForm.txtusuario.value;
  var txtipusuario = document.frmMiForm.txtipusuario.value;

   if ( lsperiodo=='0') {
		alert ("Seleccionar el periodo")
		document.getElementById("cmboPerPlanilla").focus();
		return false;
     }
	 
	 ajax=http_request();
        
 var valores= "lsperiodo=" + escape(lsperiodo)+"&txtusuario="+txtusuario+"&txtipusuario="+txtipusuario+"&lsval=8";
  
	var peticion=$.ajax(
		{
		
		 url:'pd_ProcesarAperturaConf.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
			
            if (respuesta==1) 
			{								  
			alert('Se procesaron correctamente los registros.') ;	
			SeleccionarAperturaConf(1);	
		    } 
            else
			{
				$('#resp').html=respuesta;
			}

			 		 			  	          
      } ,
      error:function (e){alert('Se ha producido un error al Generar Planilla'); 
	  $('#resp').html(e.responseText); 
	}
  }
  );
	 
	
}

function enviarcard(dni)
{		
	 			
 pagina = "afiliacion_datos.asp?lsdni=" + dni ;
	win = window.open(pagina,'','width=700,height=400,toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');

}

</script>
    </head>
    <body onLoad="ActualizarComboEstado();">
        <div id="top">
           <!--#include file="cabecera.html"-->
	       <!--#include file="pd_menu.asp"-->
       </div>
       <div id="divNavegacion" align="center"><span class="subtitulo"><%=Session("cmeta")&"-"&Session("nmeta")%> </span></div>
<div id="divNavegacion" align="center"><span class="subtitulo">Pago :Apertura de Pre Conformidad</span></div>
        <div id="lateral">
                 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_ActualizarPlanilla.asp">
            
            <table width='100%' border='1'   align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
          
          <tr><th colspan=2 ></th></tr>         
		  <tr><th colspan=2 class="aplicacion" bgcolor="#DAE8F3">Proceso Masivo</th></tr>
          <tr>
            
		    <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios<span class="criterio">

		    <input name="cboReporte" type="hidden" id="cboReporte" value="4" />
		    <input name="txtRol" type="hidden" id="txtRol" value="<%=lsRol%>" />
			
	       <INPUT type="hidden" id=txtipusuario name=txtipusuario value="<%=ipVisitante%>">
           <INPUT type="hidden" id=txtusuario name=txtusuario value="<%=id_usuario%>">
           <INPUT type="hidden" id="lsubiprov"  name="lsubiprov" value="<%=lsUbigeoapli%>" >
           <INPUT type="hidden" id="lsubiDist" name="lsubiDist" value="<%=lsUbigeoDist%>">
           <INPUT type="hidden" id="lsubiDist" name="lsubiDist" value="<%=id_proyecto%>">
			
		    </span></td>
		  </tr>
		  <tr border="1">
                <td width="31%" height="5%"  align=right bgcolor="#F7F8F9"><p><span class="criterio" >Per&iacute;odo/F.Fto.:</span></p></td>

                
                <td bgcolor="#F7F8F9" class='criterio'id="regPerPla"> 
                <select class='e_combo' name="cmboPerPlanilla" id="cmboPerPlanilla"  style="width:200px">
					<option id="cmboPerPlanilla"  title="Todos" value="0" > Seleccione... </option>
                </select>
                <select class='e_combo' name="cmboFuente" id="cmboFuente"  style="width:200px">
					<option id="cmboFuente"  title="Todos" value="0" > Seleccione... </option>
                </select>
                </td>
                
                 
                
               
                
				
          </tr>

       <tr>
        <td colspan="4" height="5%"  align="left" bgcolor="#F7F8F9" style=" font-family:Arial;height:30px;border:1;">
		  <fieldset style=" font-family:Arial;height:45px;border:1;width:100;">
          <legend class="criterio" style=" font-family:Arial;height:20px;">&nbsp;&nbsp;Nivel de RRHH :</legend>
          
		  <table>

		  <tr  bgcolor="#F7F8F9" style=" font-family:Arial;height:5px;border:1;">
		    <td  colspan="4">
		    <input type="radio" name="nivelRRHH" id="TODOS" value="9" checked="checked"/>
            <label for="4" class="etiqueta" ><strong>TODOS</strong></label>&nbsp;&nbsp;&nbsp;
		    <input type="radio" name="nivelRRHH" id="AD" value="3"  />
            <label for="3" class="etiqueta" >RTA</label>&nbsp;&nbsp;&nbsp;
            <input type="radio" name="nivelRRHH" id="RA" value="1"  />
            <label for="1" class="etiqueta">RAO</label>&nbsp;&nbsp;&nbsp;
            <input type="radio" name="nivelRRHH" id="RO" value="2" />
            <label for="2" class="etiqueta" >RO</label>
			</td>
		  </tr>
		  </table>
          </fieldset><br>
		</td>
       </tr>		  
              
               
              <tr>
              <td class="etiqueta" width="30%" align="right"><span class="criterio">Descripci&oacute;n del Periodo:<font class="alerta5">(*)</font></span></td>
              <td><input type="text" name="txtDesPeriodo" id="txtDesPeriodo" class="e_texto" />  
              <% if lsRol<>18 then %>	
              <INPUT name='button1' type='button' class="boton" id='button1' onClick="javascript:GrabarAperturaConfDet(); " value='Procesar'>     
			  <%end if%>  
              </td>
              </tr>
       

              <tr>
                <td colspan="2" id="resp" >&nbsp;</td>
              </tr>
              <tr><th colspan=2 class="aplicacion" bgcolor="#DAE8F3">Proceso por Persona</th></tr>
              <tr> <td colspan="2"  align="left" bgcolor="#F7F8F9" class="alerta5">(*)Campos Obigatorios<span class="criterio"></span></td> </tr>
			  <tr>
                
                <td  class="etiqueta" width="30%" align="right"><p><span class="criterio" >DNI:<font class="alerta5">(*)</font></span></p></td>
                <td>	
         
      <table>
        <tr>
          <td>
          <input type="text" name="txtDNI" id="txtDNI" class="e_texto" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" maxlength="8" />
          </td>

          <td>
           <img src="images/lupa.jpg" width="30" height="30" title="Buscar" onclick="ValidaExisteDNIFicha()" />
          </td>
          <td>&nbsp;   </td>
           <td>
             
                 <div id="VerAdicionar" style="display:none;border:1; width:10px;">
      	     <img src="images/add.png" width="25"  title="Adicionar" height="25" name="buttonProc" id="buttonProc" onClick="javascript: GrabarAperturaDNI();              "/>    
      </div> 
          </td>
        </tr>
      </table>

             
			   </td>
                
              </tr>
              <tr>
              <td class="etiqueta" width="30%" align="right"><p><span class="criterio" >Apell. y Nomb.:</span></p></td>
                <td><input type="text" name="txtapenom" id="txtapenom" class="e_textoLargo" style="border:0"  /></td>
              </tr>
              <tr>
              <td class="etiqueta" width="30%" align="right"><p><span class="criterio" >Est. de Cont.:</span></p></td>
                <td><input type="text" name="txtestcont" id="txtestcont" class="e_textoLargoMinus"  style="border:0"/></td>
              </tr>
               <tr>
     <td colspan="3" class='etiqueta' style="font-size:10px;color:#900" ><br><div align="center" id="msj3"></div>&nbsp;</td>
 </tr>

                <input type="hidden" name="txtactivoc" id="txtactivoc" class="e_input_text" />


                <input type="hidden" name="txtFlagPagoCom" id="txtFlagPagoCom" class="e_input_text" />

              
              
              <tr>
              <td colspan="3" class="aplicacion" bgcolor="#DAE8F3" >C&aacute;lculo de Descuentos Sistema de Pensiones</td>
              </tr>
              
              <tr>
              <td colspan="3" class='etiqueta' style="font-size:10px;color:#900"  align="center"><input name='btnLimpiar2' type='button' class="botonCerrar" id='btnLimpiar2' onclick="javascript:CalcularDesc()" value='Calcular.' />
</td>
              </tr>
              
               <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">

     
                </td>
              </tr>
			  
              <tr><th colspan=2 class="aplicacion" bgcolor="#DAE8F3">Cierre y Eliminaci&oacute;n de Pre Conformidad</th></tr>
			  <tr><td height="4" colspan="4" align=center  bgcolor="#F7F8F9" class="alerta5">&nbsp;</td></tr>
              <tr>
                <td height="4" colspan="4" align=center  bgcolor="#F7F8F9" class="alerta5">Se procesarán y eliminarán todos los registros para el periodo seleccionado.</td>
              </tr>
<% if lsRol<>18 then %>
			  <tr>
                <td height="4" colspan="4" align=center bgcolor="#F7F8F9">
                <INPUT name='btnLimpiar' type='button' class="botonCerrar" id='btnLimpiar' onClick="javascript:EliminarConfDetalle()" value='Limpiar'>&nbsp;
                <INPUT name='btnCerrar' type='button' class="botonCerrar" id='btnCerrar' onClick="javascript:VerifCerrarAperturaEstado()" value='Cerrar  Apertura' >
                </td>
              </tr>
			 	<%end if%>		  
               <tr height=22>
	            <td colspan="2" align="center" bgcolor="#F7F8F9"></td>
              </tr>
              <tr height=22>
              </tr>	     
            </table>
          </form>
        </div>
        
        <div id="content" style="border:9;">
           
            <a id="toggler"></a>
            <div id="busqueda" >

             <table width="92%" border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0" bordercolor="#DAE8F3" >
                <tr ><th colspan=10 class="aplicacion" bgcolor="#DAE8F3">Buscar por Ubigeo</th></tr>
                
                 <tr border="1">
                <td width="10%"  align=right valign="middle" bgcolor="#F7F8F9" class="etiqueta"><span class="criterio" id="nomdpto" >
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  Departamento:&nbsp;</span></td>
                <% IF (lsRol ="7" OR lsRol="1" OR lsRol="6")  THEN %>  
				<td width="10%" align=rigth valign="middle" bgcolor="#F7F8F9" id="dep"  nowrap="nowrap"><%generaDpto()%>
                  <span class="criterio">
                  <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
                </span>
				</td>
				<%ELSE %>
				<td width="10%" align=rigth valign="middle" bgcolor="#F7F8F9" id="dep"  nowrap="nowrap"><%generaDptoSelec()%>
                  <span class="criterio">
                  <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
                </span>
				
				<%END IF %>
                </td>
                
                <td  align="right" valign="middle" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Provincia:</span></td>
                <td valign="middle" bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                    <% IF (lsRol ="7" OR lsRol="1" OR lsRol="6")  THEN %> 
					<option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
					<%ELSE %>
					<option id="txtProv1" 	title="Todos" value="9999" > Seleccione... </option>
					<%END IF %>
					
                </select></td>
                
                <td  align="right" valign="middle" bgcolor="#F7F8F9"><span class="criterio">Distrito:</span></td>
                <td valign="middle" bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                    <% IF (lsRol ="7" OR lsRol="1" OR lsRol="6" )  THEN %> 
					<option id="txtDist1" 	title="Todos" value="999998" >Todos </option>
					<%ELSE %>
					<option id="txtDist1" 	title="Todos" value="999998" > Seleccione... </option>
					<%END IF %>
					
                </select></td>
                
                <td height="4"  colspan="4" align=center bgcolor="#F7F8F9"><INPUT name='button1' type='button' class="boton" align="middle" id='button1' onClick="SeleccionarAperturaConf(1);" value='Aceptar'><br><br></td>

                 </tr>
              </table>
            </div>
         <div id="render">
             <div id="divResultado" align="center"  style=" font-family:Arial;font-size:10px;height:80%;" >
             
             
           </div>
		  <div id="mensaje" ></div>
		  

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
