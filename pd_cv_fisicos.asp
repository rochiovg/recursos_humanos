<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"-->
 
 <%session.lcid=2057%>
 <%
 
 
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

if id_proyecto = 139 then
sedeReg= Session("Ubigeo") 
sedeProv= Session("Ubigeoapli") 
sedeDist = Session("UbigeoDist") 
end if

response.write( sedeReg ) 
response.write( sedeProv) 
response.write( sedeDist )


  	Response.ContentType="text/html; charset=iso-8859-1"

	set rs = Server.Createobject("ADODB.Recordset")
	sql5=" exec dbo.CantConvocatorias  "

	
   
	rs.CursorLocation=3
	rs.Open sql5, Micone,3,3
	
	if rs.RecordCount>0 then

	cantreg=rs("cantreg")+1
	
	else
	cantreg=""

	
	end if
	
	rs.Close
	
	Set rs=nothing
 
 sub generaSede()
			
	Response.ContentType="text/html; charset=iso-8859-1"
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
sub generaDependencia()
			
	Response.ContentType="text/html; charset=iso-8859-1"
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
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec getcargoPresupuestario")
	Response.Write "<select class=""e_combo"" style=""width:340px"" id=""cmbCargo"" name=""cmbCargo""  onchange=""javascrip:topes(this.value)""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCargoConsultaRO '9','"&id_proyecto&"' ")
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" OnChange=""generaConvocatoria(this.value);"" >"
	
	Response.Write " <option value=""900"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='"&wRsDptoapli(4)&" - Actividad: "&wRsDptoapli(5)&"'   value=""" &wRsDptoapli(2)&wRsDptoapli(0)& """>" &wRsDptoapli(3) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub




sub generaRegion()
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.pa_sede_ece '"&sedeReg&"' "

	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option  value=""99"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
	response.Write "<span class=""alerta5"">(*)</span>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub




%>



<%

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
idProyecto=Session("id_proyecto")
If lsUbigeo <> "" then


	

%>	
    
<HTML>
<HEAD> 
      <title>..::Sistema de Gesti&oacute;n de RRHH ::..</title>
   <link rel="shortcut icon" href="images/favicon.ico" />
 <script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript" src="js/envio_ajax.js"></script>
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
	<link rel="stylesheet" href="css/demos.css">
    <link rel="stylesheet" type="text/css" href="Styles/inei.css">
	
	
    <link rel="stylesheet" type="text/css" href="Styles/calendar-blue.css">
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calendar-setup.js"></script>
	<script type="text/javascript" src="js/calendar-es.js"></script>
	<script type="text/javascript" src="js/sorttable.js"></script>
    <script type="text/javascript" src="js/modal.js"></script>
    <script src="js/valida_fecha.js"></script>
	
	
	
	

	<style>
		input.text { margin-bottom:12px; width:95%; padding: .4em; }

		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
	</style>


  <script>
  
  function justNumbers(e)
        {
        var keynum = window.event ? window.event.keyCode : e.which;
        if ((keynum == 8) || (keynum == 46))
        return true;
         
        return /\d/.test(String.fromCharCode(keynum));
        }
		
  
  function validaNum(n,mini,maxi)
{
n = parseInt(n)
if ( n<mini || n>maxi ) alert("El valor debe ser mayor que 0");
}
  
  
function generaConvocatoria(valor){     
	 var varcargo =valor;   
	ajax=http_request();
	
	var valores;	
	valores= "datos=" + escape(varcargo);  // parametros a enviar al servidor	
	
	url="m_numConvocatoria.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("conv").innerHTML ="Cargando......";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            								
					document.getElementById("conv").innerHTML =ajax.responseText;
					//verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("conv").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("conv").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
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



$(function llamar(Id_ConvocatoriaCargo,usuario) {
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
		var name = $( "#tConvoc" ),
			allFields = $( [] ).add( name ),
			tips = $( ".validateTips" );

		function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}

		$( "#dialog-form" ).dialog( "open" );
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 400,
			width: 350,
			modal: true,
			buttons: {
				"Grabar": function() {
				var convoc='';
					
					$('.check').each(function(){ 
					var check = $(this); 
					if (check.is(':checked')==true)
						convoc=convoc+check.attr('value');
					});
					if (convoc=='21'){
						alert('Seleccione solo un tipo de Convocatoria')
						return false;
					} else if (convoc==''){
						alert('Seleccione el tipo de convocatoria');
						return false;
					} else{
						PublicarConvCargo(Id_ConvocatoriaCargo, usuario, convoc);
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
	

function PublicarConvCargo(Id_ConvocatoriaCargo, usuario)
{
	
  if (confirm('¿Esta Seguro de Publicar el Registro?')==true )
 
	{ 
	var valores="Id_ConvocatoriaCargo="+escape(Id_ConvocatoriaCargo)+"&usuario="+escape(usuario)+"&lsTipo=70";

	var peticion=$.ajax(
		{
		
	     url:"m_ingreso.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#divDetalle2").html("Eliminando...");
							  },
		success:function (respuesta) {
								alert('Se realiz\xf3 la publicación de la convocatoria')
                                MostrarConvocatoria();
                                ActualizarNumConvocatoria();							
									
											
									 } ,
		error:function (){
			  alert('Se a producido un Error'); 
			  $("#divDetalle2").html("");
						}
		}
		);
   }
}

function insertarComunicado(num_convocatoria, id_ConvocatoriaCargo,estado,id_proyecto)
{
	
	var txtNumComunicado=$("#txtNumComunicado").val();
	var txtComunicado=$("#txtComunicado").val();
	if (estado==0){
		alert ('No se puede registrar un comunciado porque la convocatria no ha sido publicada');
		return false;
	}
	
	if (txtNumComunicado==0){
		alert ('Registre número de comunicado');
		$("#txtNumComunicado").focus();
		return false;
	}
		
	if (txtComunicado==0){
		alert ('Registre el comunicado');
		$("#txtComunicado").focus();
		return false;
	}	
	txtComunicado=txtComunicado.replace(new RegExp("\\n","g"),'<br>');
		
  if (confirm('¿Esta Seguro de Registrar el comunicado?')==true )
 
	{ 
	var valores="num_convocatoria="+escape(num_convocatoria)+"&id_ConvocatoriaCargo="+escape(id_ConvocatoriaCargo)+"&id_proyecto="+escape(id_proyecto)+"&txtNumComunicado="+escape(txtNumComunicado)+"&txtComunicado="+escape(txtComunicado)+"&lsTipo=116";

	var peticion=$.ajax(
		{
		
	     url:"m_ingreso.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){},
		 success:function (respuesta) {
			alert('Se registr\xf3 correctamente el comunicado');
			publicarComunicado(num_convocatoria);
            } ,
		error:function (){
			  alert('Se a producido un Error'); 
			  $("#divDetalle2").html("");
						}
		}
		);
   }
}




function  verCVSRecibidos()
{    
	return true;

	var txtDpto1=$("#txtDpto1").val();
	var txtProv1=$("#txtProv1").val();
	var txtDist1=$("#txtDist1").val();
	var txtConvocartoria=$("#txtConvocartoria").val();
	var cmbCargo=$("#cmbCargo").val();
	var txtnumcvs=$("#txtnumcvs").val();
	
	txtnumcvs.replace(" ","");

	if (txtnumcvs!="") 
	{
	if ( txtnumcvs<=0) {alert('Debe de ingresar un valor mayor que 0'); return false;}
	}
 
	 if(txtDpto1=="99")
	{
	   alert('Debe ingresa la región.');
	   return false;	
	}  
  
	
	if(txtProv1=="9999" || txtProv1=="0")
	{
	   alert('Debe ingresar la provincia.');
	   return false;	
	} 
	

	
	if(txtConvocartoria=="0")
	{
	   alert('Debe seleccionar la convocatoria.');
	   return false;	
	} 
	
	
	
	if(cmbCargo=="")
	{
	   alert('Debe seleccionar el cargo.');
	   return false;	
	} 
	
	if(txtnumcvs=="")
	{
	   alert('Debe ingresar el nro de cvs recepcionados.');
	   return false;	
	} 
		  


	/*  
	var valores="txtDpto1="+txtDpto1+"&txtProv1="+txtProv1+"&txtDist1="+txtDist1+"&txtConvocartoria="+txtConvocartoria+"&cmbCargo="+cmbCargo+"&txtnumcvs="+txtnumcvs;
	

	var peticion=$.ajax(
		{
		 url:'pd_VerCVsRecibidos.asp?nocache=' + Math.random(),
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
				if ( txtnumcvs <= respuesta )
				{	
					alert('No puede recepcionar un numero menor al ultimo registrado');
					document.getElementById("txtnumcvs").value = ""
					return "-1";
					}
				else {return "1";}	
					;
					

			 			  	          
      } ,
      error:function (e){alert('Se a producido un Error'); 

			 $("#divCriterio").html(e.responseText);		 
			 	return "-1";
				
      }
  }
  );*/
}





function GrabarDatos()
{    




	var txtDpto1=$("#txtDpto1").val();
	var txtProv1=$("#txtProv1").val();
	var txtDist1=$("#txtDist1").val();
	var txtConvocartoria=$("#txtConvocartoria").val();
	var cmbCargo=$("#cmbCargo").val();
	var txtnumcvs=$("#txtnumcvs").val();

	txtnumcvs.replace(" ","");
	
 	if (txtnumcvs!="") 
	{
	if ( txtnumcvs<=0) {alert('Debe de ingresar un valor mayor que 0'); return false;} 
	} 
		
	 if(txtDpto1=="99")
	{
	   alert('Debe ingresa la región.');
	   return false;	
	}  
  
	
	if(txtProv1=="9999" || txtProv1=="0")
	{
	   alert('Debe ingresar la provincia.');
	   return false;	
	} 
	

	
	if(txtConvocartoria=="0")
	{
	   alert('Debe seleccionar la convocatoria.');
	   return false;	
	} 
	
	
	
	if(cmbCargo=="")
	{
	   alert('Debe seleccionar el cargo.');
	   return false;	
	} 
	
	if(txtnumcvs=="")
	{
	   alert('Debe ingresar el nro de cvs recepcionados.');
	   return false;	
	} 
		  
  
	var valores="txtDpto1="+txtDpto1+"&txtProv1="+txtProv1+"&txtDist1="+txtDist1+"&txtConvocartoria="+txtConvocartoria+"&cmbCargo="+cmbCargo+"&txtnumcvs="+txtnumcvs;
	

	var peticion=$.ajax(
		{
		 url:'pd_InsertarCVFisicos.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {

			  alert("Se insertó el registro correctamente");

               MostrarConvocatoria();

			   // Setea valor en vacio..
			   document.getElementById("txtnumcvs").value = ""
			   
               //document.frmMiForm.reset();
			 			  	          
      } ,
      error:function (e){alert('Se a producido un Error'); 

			 $("#divCriterio").html(e.responseText);		 
      }
  }
  );
}



function MostrarConvocatoria()
{	

	document.getElementById("divC").style.display="";
	var id_proy=$("#id_proy").val();
	var txtConvocartoria=$("#txtConvocartoria").val();
	
	
	var txtDpto1=$("#txtDpto1").val();
	var txtProv1=$("#txtProv1").val();
	var txtDist1=$("#txtDist1").val();
	var txtConvocartoria=$("#txtConvocartoria").val();
	var cmbCargo=$("#cmbCargo").val();

 
	if(txtDpto1=="99")
	{
	   alert('Debe ingresa la región.');
	   return false;	
	}  
  
	
	if(txtProv1=="9999" || txtProv1=="0")
	{
	   alert('Debe ingresar la provincia.');
	   return false;	
	} 
	

	
	if(txtConvocartoria=="0")
	{
	   alert('Debe seleccionar la convocatoria.');
	   return false;	
	} 
	if(cmbCargo=="")
	{
	   alert('Debe seleccionar el cargo.');
	   return false;	
	} 
	
	

	
	
	var valores="id_proy="+id_proy+"&txtConvocartoria="+txtConvocartoria+"&txtDpto1="+txtDpto1+"&txtProv1="+txtProv1+"&txtDist1="+txtDist1;
	

	var peticion=$.ajax(
		{
	     url:'pd_ListarCVSFisicos.asp?nocache=' + Math.random(),
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


function ampliarConvocatoria(num_convocatria, usuario)
{	
	document.getElementById("divC").style.display="none";

	var id_proy=$("#id_proy").val();
	var valores="id_proy="+id_proy+"&num_convocatria="+num_convocatria+"&usuario="+usuario;

	var peticion=$.ajax(
		{
	     url:'pd_ampliarConvocatoria.asp?nocache=' + Math.random(),
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


function publicarComunicado(num_convocatria)
{	
	document.getElementById("divC").style.display="none";

	var id_proy=$("#id_proy").val();
	var valores="id_proy="+id_proy+"&num_convocatria="+num_convocatria;

	var peticion=$.ajax(
		{
	     url:'pd_comunicadoConvocatoria.asp?nocache=' + Math.random(),
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

function ActualizarNumConvocatoria()
{

	
			var valores=""; 
			var peticion=$.ajax(
				{
				 url:'pd_ListarNumeroConv.asp?nocache=' + Math.random(),
				 timeout:7000,
				 type:'POST',
				 contentType: "application/x-www-form-urlencoded",
				 data:valores,
				 beforeSend: function(){
					 $("#detalle_NumConv").html("Cargando...");
									  },
				success:function (respuesta) {
					//document.getElementById("divC").style.display="none";
					 $('#txtNumConv').val(respuesta);
			  } ,
			  error:function (){alert('Se a producido un Error'); 
					 $("#divCriterio").html(e.responseText);
			  }
		  }
		  );	 
}

function modificarEstadoComunicado(valor,id, num_convocatoria)
{
	if(confirm("Esta seguro de realizar el cambio de estado de la convocatoria?"))
		{
		var valores="valor="+valor+"&id="+id+"&lsTipo=117"; 
		var peticion=$.ajax(
			{
			 url:'m_ingreso.asp?nocache=' + Math.random(),
			 timeout:7000,
			 type:'POST',
			 contentType: "application/x-www-form-urlencoded",
			 data:valores,
			 beforeSend: function(){
				// $("#detalle_NumConv").html("Cargando...");
								  },
			success:function (respuesta) {
				 alert('Se realizaron los cambios satisfactoriamente');
				 publicarComunicado(num_convocatoria);
		  } ,
		  error:function (e){alert('Se a producido un Error'); 
				 $("#divCriterio").html(e.responseText);
		  }
	  }
	  );
	}
}

function modificarComunicado(usuario, id)
{
	if(confirm("esta seguro de los cambios a realizar al comunicado?"))
		{
		var num_comunicado=$("#txtNumComunicado"+id).val();
		var comunicado=$("#txtComunicado"+id).val();
		
		comunicado=comunicado.replace(new RegExp("\\n","g"),'<br>');
		
		var valores="num_comunicado="+num_comunicado+"&comunicado="+escape(comunicado)+"&id="+escape(id)+"&usuario="+escape(usuario)+"&lsTipo=118"; 
		var peticion=$.ajax(
			{
			 url:'m_ingreso.asp?nocache=' + Math.random(),
			 timeout:7000,
			 type:'POST',
			 contentType: "application/x-www-form-urlencoded",
			 data:valores,
			 beforeSend: function(){
				// $("#detalle_NumConv").html("Cargando...");
								  },
			success:function (respuesta) {
				 alert('Se realizaron los cambios satisfactoriamente');
		  } ,
		  error:function (e){alert('Se a producido un Error'); 
				 $("#divCriterio").html(e.responseText);
		  }
	  }
	  );
	}
}



function actualizarConvocatoria(num_convocatoria, fecFinI, horaFinI){

	var txtfechFinM =document.getElementById("txtfechFinM").value ;
	var txtHoraFinM =document.getElementById("txtHoraFinM").value ;
	var txtfechFinPS =document.getElementById("txtfechFinPS").value ;
	
	if (txtfechFinM==""){
		alert ('Debe de ingresar la nueva fecha de cierre de la convocatoria');
		document.getElementById("txtfechFinM").focus();
		return false;
	}
	
	if (txtHoraFinM==""){
		alert ('Debe de ingresar la nueva hora de cierre de la convocatoria');	
		document.getElementById("txtHoraFinM").focus();
		return false;
	}
	
	if (txtfechFinPS==""){
		alert ('Debe de ingresar la fecha de cierre fin del proceso de Seleccion');	
		document.getElementById("txtHoraFinM").focus();
		return false;
	}

 	var diaI = fecFinI.substring(0,2);
	var MesI = fecFinI.substring(3,5);
	var AnioI = fecFinI.substring(6);
	
	var diaF = txtfechFinM.substring(0,2);
	var MesF = txtfechFinM.substring(3,5);
	var AnioF = txtfechFinM.substring(6);
	
	var diaPS = txtfechFinPS.substring(0,2);
	var MesPS = txtfechFinPS.substring(3,5);
	var AnioPS = txtfechFinPS.substring(6);
	

	var fecfinI=AnioI+''+MesI+''+diaI;
	var fecfinF=AnioF+''+MesF+''+diaF;
	var fecfinps=AnioPS+''+MesPS+''+diaPS;
	
	if (parseInt(fecfinF) < parseInt(fecfinI)){
		alert ('Fecha de cierre de convocatoria incorrecta, es menor a la fecha de cierre actual');
		document.getElementById("txtfechFinM").value="";
		document.getElementById("txtfechFinM").focus();
		return false;
	} 
	else {
		if ((parseInt(txtHoraFinM) < parseInt(horaFinI)) && (parseInt(fecfinF) == parseInt(fecfinI)) ){
			alert ('Hora de cierre de convocatoria incorrecta, es menor a la hora de cierre actual');
			document.getElementById("txtHoraFinM").value="";
			document.getElementById("txtHoraFinM").focus();
			return false;
		}
		else{
			
			if (parseInt(fecfinps) < parseInt(fecfinF)) {
				alert ('Fecha de fin de proceso de seleccion menor a la fecha de cierre de la convocatoria');
		document.getElementById("txtfechFinPS").value="";
		document.getElementById("txtfechFinPS").focus();
		return false;
			}
			else 			
			if(confirm("Esta seguro de ampliar la convocatoria Nro. "+num_convocatoria+" ?"))
			{
				var valores="num_convocatoria="+escape(num_convocatoria)+"&txtfechFinM="+escape(txtfechFinM)+"&txtHoraFinM="+escape(txtHoraFinM)+"&txtfechFinPS="+escape(txtfechFinPS)+"&lsTipo=115"; 
			
				var peticion=$.ajax(
				{
					url:'m_ingreso.asp?nocache=' + Math.random(),
					timeout:7000,
					type:'POST',
					contentType: "application/x-www-form-urlencoded",
					data:valores,
					beforeSend: function(){
					},
					success:function (respuesta) {
						alert('Se ampli\xf3 la convocatoria satisfactoriamente');	 
						ampliarConvocatoria(num_convocatoria, '1')
						
					} ,
					error:function (){alert('Se a producido un Error'); 
					$("#divCriterio").html("");
					}
				}
				);
			}
		}
	}
	
}



function verificarFechas(){
		var lsFechainicio =document.getElementById("txtfechIniConv").value ;
		var lsFechaFin =document.getElementById("txtfechFinConv").value ;
	
	  if (Compara_Menor(lsFechainicio,lsFechaFin) != false  )
			{
				alert("Fecha err\xf3nea, fecha fin menor a fecha de inicio");
				document.getElementById("txtfechIniConv").value=''
				document.getElementById("txtfechFinConv").value=''
				document.getElementById("txtfechIniConv").focus();
							
			 }
}	


//Validar Descripcion Convocatoria
function validaIngDesConv(e, obj, cval, cpas) {
tecla = (document.all) ? e.keyCode : e.which; 
patron=/^(\w|ñ|Ñ|\s)*$/; //Letras y números con espacio
te = String.fromCharCode(tecla); 

if(tecla == 9) {return false};
if(tecla == 13 ){
		if(obj=="")
        {		
			  alert('Debe ingresar descripción de convocatoria');  
           	  cval.focus(); 
			  return false;   
		}	
		else
	    {			
           	 
			pasarCajas(cval,cpas);	
			return false;                         	
		}        
    }
	return patron.test(te); 
}

var miPopup 
function abrepopup(){ 
miPopup=window.open("pd_subirArchivoPDF.asp","miwin","width=900,height=600") 
miPopup.focus() 
} 



function generaprov(){
     
      var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	ajax=http_request();
	
 var lsubiprov=document.getElementById("lsubiprov").value;

	var valores;	
	valores= "datos=" + escape(varDpto)+"&lsubiprov="+escape(lsubiprov);  // parametros a enviar al servidor	
	
	url="m_Provincia_ece.asp";  
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



function verdis(){

 var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
 var lsUbiDist =document.getElementById("lsubidist").value;
	ajax=http_request();
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv)+"&lsUbiDist="+escape(lsUbiDist);  // parametros a enviar al servidor	
	
	url="m_Distrito_ece.asp";  
	
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


</script>	

</HEAD>

<!--onLoad="MostrarConvocatoria();ActualizarNumConvocatoria();"-->

<BODY  topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>


	<!--#include file="cabecera.html"-->

<!--#include file="pd_menu.asp"-->
<div id="formulario">
  <div id="divNavegacion" align="center"><span class="subtitulo">Recepci&oacute;n de CV Fisicos</span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_ConvocatoriaMant.asp">
	 <table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    <tr>
    	<TD colspan=7 class="aplicacion" bgcolor="#DAE8F3">
        
        
         <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario1%>" />
                  <input name="lsubiprov" type="hidden" id="lsubiprov" value="<%=lsUbigeoapli%>" />
                  <input name="lsubidist" type="hidden" id="lsubidist" value="<%=lsUbigeoDist%>" />
                  <input name="id_ccargo" type="hidden" id="id_ccargo" value="" />
                  <input name="id_proy" type="hidden" id="id_proy" value="<%=id_proyecto%>" />
                   <input name="lsRol" type="hidden" id="lsRol" value="<%=lsRol%>" />
                   
                   
        	<span class="dato"><%=Session("actividad")%> <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>">
            </span>
        </TD>
    </tr>
    <tr>
    	<TD colspan="7" class='etiqueta'  >
        <input name="id_proy" id="id_proy" type="hidden" value="<%=idProyecto%>">
        </TD>
    </tr>
    
    <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio"><%IF id_proyecto= 139 THEN %> Departamento: <%else%>Sede Regional:<%end if%></span></td>
                <td bgcolor="#F7F8F9" class='criterio'><%generaRegion()%></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio"><%IF id_proyecto= 139 THEN %>Provincia: <%else%>Sede Provincial:<%end if%></span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="reg2"><select class='e_combo' name="txtProv1" id="txtProv1"  style="width:200px">
                  <option id="txtProv1" 	title="Todos" value="9999" > Todos </option>
                </select></td>
              </tr>
              <tr>
                <td  align="right" bgcolor="#F7F8F9"><span class="criterio"><%IF id_proyecto= 139 THEN %>Distrito:<%else%>Sede Distrital:<%end if%></span></td>
                <td bgcolor="#F7F8F9" class='criterio'id="dis2"><select class='e_combo' name="txtDist1" id="txtDist1"  style="width:200px;" >
                  <option id="txtDist1" 	title="Todos" value="9999999" >Todos </option>
                </select></td>
              </tr>
              
    <tr>
    	<td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio">Cargo:</span></TD>
        <TD  class='etiqueta'><font size="1px" >   
	<strong><%generaCargo()%></strong>
   </font><span class="alerta5"></TD>
        <TD  class='etiqueta'>Nro CV:</TD>
        <TD  class='etiqueta'><span class="e_td_string">
   
   <input type='text' class='e_input' id='txtnumcvs'  name='txtnumcvs' value='' maxlength='7'   onkeypress="return justNumbers(event);" onChange="validaNum(this.value,1,999999999)" >
   <span class="alerta5">
          </span> <!--<input type='text' class='e_input' id='txtfechIniConv'  onKeyUp="this.value=formateafecha(this.value);" name='txtfechIniConv' value='' maxlength='10' onKeyPress=" return validaIngDesConv(event, this.value,txtfechIniConv,txtfechFinConv);">
          <script type="text/javascript"> 
	      Calendar.setup({ 
          inputField : "txtfechIniConv",     // id del campo de texto 
          ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
          button     : "cbFechIniConv"     // el id del botón que lanzará el calendario 
	     });
         </script>--->
         
		  
		  
		  
		  
        <!--<font class='alerta5'>(*)</font>--></TD>
        <TD  class='etiqueta'>&nbsp;</TD>
        <TD  class='etiqueta'>&nbsp;</TD>
    </tr>
    <tr>
    	<td  align="right" bgcolor="#F7F8F9"id="nomreg2"><span class="criterio"> Convocatoria:</span> </TD>
       <td bgcolor="#F7F8F9" class='criterio' id="conv">
                  <select class='e_combo' name="txtConvocartoria" id="txtConvocartoria"  style="width:200px;" >
                  <option id="txtconv" 	title="Todos" value="0" >Todos </option>
                </select><span class="alerta5"></td>
        <!--<TD class='etiqueta'>Fecha Recep: </TD>-->
       <!-- <TD class='etiqueta'><span class="e_td_string">-->
   
          <!--</span> <input type='text' class='e_input' id='txtfechFinConv' onKeyUp="this.value=formateafecha(this.value);" name='txtfechFinConv' value='' maxlength='10' onBlur="verificarFechas()">
          <script type="text/javascript"> 
	      Calendar.setup({ 
          inputField : "txtfechFinConv",     // id del campo de texto 
          ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
          button     : "cbFechFinConv"     // el id del botón que lanzará el calendario 
	     });
         </script>-->
		  
		  
            <font class='alerta5'>(*) </font></TD>
            <TD  class='etiqueta'>&nbsp;</TD>
            <TD  class='etiqueta'>&nbsp;</TD>
    </tr>
    <tr>
    
       
       
        
          
    </tr>
    
    
    
              
    <TR>
    	<TD colspan="5" align="center"><input name="button2" type="button" class="boton" id="button2" value="Consultar" onClick="MostrarConvocatoria()">
   	    &nbsp;<input name="button" type="button" class="boton" id="button" value="Grabar" onClick="GrabarDatos()"></TD>
    </TR>
    </table>
     <div id="divC" align="center" style="vertical-align:top; overflow:auto; height:3%; width:98.5%">
     	<%
'			response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
'    response.Write " <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
'	response.Write " <td width=""10%"">Sede Regional</td>"
'    response.Write " <td width=""32%"">Sede Provincial</td>"
'    response.Write " <td width=""10%"">Sede Distrital</td>"
'	response.Write " <td width=""13%"">Cargo</td>"
'	response.Write " <td width=""5%"">Convocatoria</td>"
'	response.Write " <td width=""5%"">Nro CVS</td>"
''	response.Write " <td width=""5%"">Eliminar</td>"
''	response.Write " <td width=""5%"">Ampliar</td>"
''	response.Write " <td width=""5%"">--</td>"
'    response.Write " </tr> </table>"
		%>
     </div>
     
     <div id="divCriterio" style="vertical-align:top; overflow:auto; height:350px;" align="center" ></div>
  </form>
</div>

 <div id="dialog-form" title="Seleccionar Tipo de Convocatoria">
	<p class="validateTips" align="center">Selecci&oacute;n de Tipo de Convocaroria</p>
	<form id="nuevo">
	<fieldset>
    	  <label for="email">Tipo de Convocatoria</label>
   	 <br> 
     <input type="checkbox" class="check" name="Interna" id="Interna" value="2" /><label >Convocatoria Interna</label><br>
     <input type="checkbox" class="check" name="Externa" id="Externa" value="1" /><label >Convocatoria Externa</label>

   	  	<br>
    &nbsp;
      <br>

	</fieldset>
	</form>
</div>

</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
