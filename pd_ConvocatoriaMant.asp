<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 <%session.lcid=2057%>
 <%
 
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

function GrabarDatos()
{    
	var txtNumConv=$("#txtNumConv").val();
	var txtDesConv=$("#txtDesConv").val().toUpperCase();
	var txtfechIniConv=$("#txtfechIniConv").val();
	var txtfechFinConv=$("#txtfechFinConv").val();
	var txtestado=$("#txtestado").val();
	var txtHoraInicio=$("#txtHoraInicio").val();
	var txtHoraFin=$("#txtHoraFin").val();

 
	if(txtNumConv=="")
	{
	   alert('Debe ingresar número de convocatoria.');
	   document.frmMiForm.txtNumConv.focus();
	   return false;	
	}  
  
	if(txtDesConv=="")
	{
	   alert('Debe ingresar descripción de convocatoria.');
	   document.frmMiForm.txtDesConv.focus();
	   return false;	
	} 
	
	if(txtfechIniConv=="")
	{
	   alert('Debe seleccionar fecha de inicio de la convocatoria.');
	   document.frmMiForm.txtfechIniConv.focus();
	   return false;	
	} 
	if(txtfechFinConv=="")
	{
	   alert('Debe seleccionar fecha fin de la convocatoria.');
	   document.frmMiForm.txtfechFinConv.focus();
	   return false;	
	}
	
	var lsFechainicio =document.getElementById("txtfechIniConv").value ;
	var lsFechaFin =document.getElementById("txtfechFinConv").value ;
	
	if (Compara_Menor(lsFechainicio,lsFechaFin) != false  )
	{
		alert("Fecha err\xf3nea, fecha fin menor a fecha de inicio");
		document.getElementById("txtfechIniConv").value=''
		document.getElementById("txtfechFinConv").value=''
		document.getElementById("txtfechIniConv").focus();
		return false;				
	}
		  
	  
	var valores="txtNumConv="+txtNumConv+"&txtDesConv="+escape(txtDesConv)+"&txtfechIniConv="+txtfechIniConv+"&txtfechFinConv="+txtfechFinConv+"&txtestado="+txtestado+"&txtHoraInicio="+txtHoraInicio+"&txtHoraFin="+txtHoraFin;

	var peticion=$.ajax(
		{
		 url:'pd_InsertarConvocatoria.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {

			  alert("Se insertó el registro correctamente");

               MostrarConvocatoria();
			   ActualizarNumConvocatoria();
               document.frmMiForm.reset();
			 			  	          
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
	var valores="id_proy="+id_proy;

	var peticion=$.ajax(
		{
	     url:'pd_ListarConvocatoria.asp?nocache=' + Math.random(),
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



</script>	

</HEAD>
<BODY onLoad="MostrarConvocatoria();ActualizarNumConvocatoria();" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>


	<!--#include file="cabecera.html"-->

<!--#include file="pd_menu.asp"-->
<div id="formulario">
  <div id="divNavegacion" align="center"><span class="subtitulo">Registro: Convocatorias </span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_ConvocatoriaMant.asp">
	 <table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    <tr>
    	<TD colspan=7 class="aplicacion" bgcolor="#DAE8F3">
        	<span class="dato"><%=Session("actividad")%> <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>">
            </span>
        </TD>
    </tr>
    <tr>
    	<TD colspan="7" class='etiqueta'  >
        <input name="id_proy" id="id_proy" type="hidden" value="<%=idProyecto%>"><span class="alerta5">(*) Datos Obligatorios</span>
        </TD>
    </tr>
    <tr>
    	<TD  class='etiqueta'>Número de Convocatoria : </TD>
        <TD  class='etiqueta'><font size="1px" >   
	<strong><INPUT type="text" id="txtNumConv" maxlength="10" name="txtNumConv" align="right" style="width: 40px;border:1;font-color:#0000FF;text-align:left;font-weight:bold ;" value='<%=cantreg%>' ReadOnly="true"></strong>
   </font></TD>
        <TD  class='etiqueta'>Fecha Inicio de Convocatoria:</TD>
        <TD  class='etiqueta'><span class="e_td_string">
   
          </span> <input type='text' class='e_input' id='txtfechIniConv'  onKeyUp="this.value=formateafecha(this.value);" name='txtfechIniConv' value='' maxlength='10' onKeyPress=" return validaIngDesConv(event, this.value,txtfechIniConv,txtfechFinConv);">
				<input type='button' id='cbFechIniConv' value='..'>
                
          <script type="text/javascript"> 
	      Calendar.setup({ 
          inputField : "txtfechIniConv",     // id del campo de texto 
          ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
          button     : "cbFechIniConv"     // el id del botón que lanzará el calendario 
	     });
         </script>
		  
		  
		  
		  
        <font class='alerta5'>(*)</font></TD>
        <TD  class='etiqueta'>Hora Inicio:</TD>
        <TD  class='etiqueta'><SELECT id="txtHoraInicio" name="txtHoraInicio" class="e_combo" style="width:50px" >				
					<OPTION value="00">00</OPTION>
<OPTION value="01">01</OPTION>
<OPTION value="02">02</OPTION>
<OPTION value="03">03</OPTION>
<OPTION value="04">04</OPTION>
<OPTION value="05">05</OPTION>
<OPTION value="06">06</OPTION>
<OPTION value="07">07</OPTION>
<OPTION value="08">08</OPTION>
<OPTION value="09">09</OPTION>
<OPTION value="10">10</OPTION>
<OPTION value="11">11</OPTION>
<OPTION value="12">12</OPTION>
<OPTION value="13">13</OPTION>
<OPTION value="14">14</OPTION>
<OPTION value="15">15</OPTION>
<OPTION value="16">16</OPTION>
<OPTION value="17">17</OPTION>
<OPTION value="18">18</OPTION>
<OPTION value="19">19</OPTION>
<OPTION value="20">20</OPTION>
<OPTION value="21">21</OPTION>
<OPTION value="22">22</OPTION>
<OPTION value="23">23</OPTION>
<OPTION value="24">24</OPTION>
        </SELECT> &nbsp;Horas</TD>
    </tr>
    <tr>
    	<TD class='etiqueta'> Descripci&oacute;n Convocatoria : </TD>
        <TD class='etiqueta'><span class="alerta5">
          <input name="txtDesConv" type="text" style=" text-transform: uppercase;"  id="txtDesConv"   size="50" maxlength="100" >
       (*) </span> </TD>
        <TD class='etiqueta'>Fecha Fin de Convocatoria: </TD>
        <TD class='etiqueta'><span class="e_td_string">
   
          </span> <input type='text' class='e_input' id='txtfechFinConv' onKeyUp="this.value=formateafecha(this.value);" name='txtfechFinConv' value='' maxlength='10'>
				<input type='button' id='cbFechFinConv' value='..'>
                
          <script type="text/javascript"> 
	      Calendar.setup({ 
          inputField : "txtfechFinConv",     // id del campo de texto 
          ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
          button     : "cbFechFinConv"     // el id del botón que lanzará el calendario 
	     });
         </script>
		  
		  
            <font class='alerta5'>(*) </font></TD>
            <TD  class='etiqueta'>Hora Cierre:</TD>
            <TD  class='etiqueta'><SELECT id="txtHoraFin" name="txtHoraFin" class="e_combo" style="width:50px" >				
					<OPTION value="00">00</OPTION>
<OPTION value="01">01</OPTION>
<OPTION value="02">02</OPTION>
<OPTION value="03">03</OPTION>
<OPTION value="04">04</OPTION>
<OPTION value="05">05</OPTION>
<OPTION value="06">06</OPTION>
<OPTION value="07">07</OPTION>
<OPTION value="08">08</OPTION>
<OPTION value="09">09</OPTION>
<OPTION value="10">10</OPTION>
<OPTION value="11">11</OPTION>
<OPTION value="12">12</OPTION>
<OPTION value="13">13</OPTION>
<OPTION value="14">14</OPTION>
<OPTION value="15">15</OPTION>
<OPTION value="16">16</OPTION>
<OPTION value="17" selected>17</OPTION>
<OPTION value="18">18</OPTION>
<OPTION value="19">19</OPTION>
<OPTION value="20">20</OPTION>
<OPTION value="21">21</OPTION>
<OPTION value="22">22</OPTION>
<OPTION value="23">23</OPTION>
<OPTION value="24">24</OPTION>
        </SELECT> &nbsp;Horas</TD>
    </tr>
    <tr>
    	<TD class='etiqueta'>&nbsp;</TD>
        <TD class='etiqueta'>&nbsp;</TD>
        <TD class='etiqueta'>Estado:</TD>
        <TD class='etiqueta'> <span class="e_td_string">
          </span> 
		        <SELECT id="txtestado" name="txtestado" class="e_combo" style="width:100px" disabled="true"  >				
					<OPTION value="0">Inactivo</OPTION>
					<OPTION value="1">Activo</OPTION>
					<OPTION value="2">Cerrado</OPTION>
				</SELECT>
 	      <font class='alerta5'>(*) </font></TD>
          <TD colspan=2 class='etiqueta'>&nbsp;</TD>
    </tr>
    <TR>
    	<TD colspan="5" align="center">&nbsp;<input name="button" type="button" class="boton" id="button" value="Grabar" onClick="GrabarDatos()"></TD>
    </TR>
    </table>
     <div id="divC" align="center" style="vertical-align:top; overflow:auto; height:3%; width:98.5%">
     	<%
			response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write " <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
	response.Write " <td width=""10%"">Num. de Convocatoria</td>"
    response.Write " <td width=""32%"">Convocatoria</td>"
    response.Write " <td width=""10%"">Fecha Inicio</td>"
	response.Write " <td width=""13%"">Fecha Fin</td>"
	response.Write " <td width=""5%"">Estado</td>"
	response.Write " <td width=""5%"">Publicar</td>"
	response.Write " <td width=""5%"">Eliminar</td>"
	response.Write " <td width=""5%"">Ampliar</td>"
	response.Write " <td width=""5%"">Comunicado</td>"
    response.Write " </tr> </table>"
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
