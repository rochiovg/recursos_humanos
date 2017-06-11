<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 <%session.lcid=2057%>
 <%
 id_proyecto=  Session("id_proyecto")
 

	set rs = Server.Createobject("ADODB.Recordset")
	sql5=" exec dbo.pa_Convocatoria_continuidad '"&id_proyecto&"'  "

	
   
	rs.CursorLocation=3
	rs.Open sql5, Micone,3,3
	
	if rs.RecordCount>0 then

	cantreg=rs("cantreg")
	else
	cantreg=""
	end if
	
	rs.Close
	
	Set rs=nothing
	
 
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
			
	set wRsDptoapli = Micone.execute(" exec getcargoPresupuestario '"&idProyecto&"' ")
	Response.Write "<select class=""e_combo"" style=""width:340px"" id=""cmbCargo"" name=""cmbCargo""   onchange=""verIdPresupuesto();""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(2)&" ("&wRsDptoapli(3)&") Carg:"&wRsDptoapli(8)& " - PEA:"&wRsDptoapli(9) &" Periodo:("&wRsDptoapli(6)&") CCP:("&wRsDptoapli(7)&")" &" F.Fto :"&wRsDptoapli(10) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(2)&" ("&wRsDptoapli(3)&")" & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtNombreValido")
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
			alert(respuesta);
			
								
								$("#divDetalle2").html(respuesta);
							
                              //  MostrarConvocatoria();
                                //ActualizarNumConvocatoria();							
									
											
									 } ,
		error:function (){
			  alert('Se a producido un Error'); 
			  $("#divDetalle2").html("");
						}
		}
		);
   }
}


	
/* INSERTAR CONVOCATORIAS  */




function GrabarDatos()
{    
var txtNumConv=$("#txtNumConv").val();
var cmbCargo=$("#cmbCargo").val();
var txtIdPresupuestario=$("#txtIdPresupuestario").val();
var txtIdPresupuesto=$("#txtIdPresupuesto").val();
var txtDesConv=$("#txtDesConv").val().toUpperCase();;
var txtfechIniConv=$("#txtfechIniConv").val();
var txtTiempoCont=$("#txtTiempoCont").val();


 
if(txtNumConv=="")
{
	   alert('Debe ingresar número de convocatoria.');
	   return false;	
}

if(cmbCargo=="0")
{
	   alert('Debe de seleccionar un cargo.');
	   return false;	
}  
  
if(txtDesConv=="")
{
	   alert('Debe ingresar descripción de convocatoria.');
	   return false;	
} 

if(txtfechIniConv=="")
{
	   alert('Debe seleccionar fecha de inicio de la convocatoria.');
	   return false;	
} 

if(txtTiempoCont=="")
{
	   alert('Debe Registrar el tiempo de contratacion');
	   return false;	
} 
        


	var valores="txtNumConv="+txtNumConv+"&txtIdPresupuestario="+escape(txtIdPresupuestario)+"&txtIdPresupuesto="+escape(txtIdPresupuesto)+"&txtDesConv="+escape(txtDesConv)+"&txtfechIniConv="+txtfechIniConv+"&txtTiempoCont="+escape(txtTiempoCont);

	
	var peticion=$.ajax(
		{
		
		 url:'pd_InsertarContratacionDirecta.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
				if (respuesta==1){
					alert('Ya se registro el cargo para Continuidad de Contrato')
					return false;
					}else{

			  alert("Se insertó el registro correctamente");

               MostrarConvocatoria();
			   ActualizarNumConvocatoria();
               document.frmMiForm.reset();
					}
      } ,
      error:function (e){alert('Se a producido un Error'); 

			 $("#divCriterio").html(e.responseText);		 
      }
  }
  );
}



function MostrarConvocatoria()
{	

	
	var id_proy=$("#id_proy").val();
	var valores="id_proy="+id_proy;

	var peticion=$.ajax(
		{
	     url:'pd_ListarLinksCenso.asp?nocache=' + Math.random(),
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


function verIdPresupuesto()
{

    var cmbCargo=$("#cmbCargo").val();
    
   
    
    var valores="cmbCargo="+cmbCargo;

	
	var peticion=$.ajax(
		{
	     url:"pd_TraerIdPresupuesto.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								 $('#prov').html("Cargando...");
							  },
		success:function (respuesta) {
			
		var Datos = new Array();             
        var Dat=respuesta;
        Datos=Dat.split(",");

        $("#txtIdPresupuestario").val(Datos[0]);
        $("#txtIdPresupuesto").val(Datos[1]); 
			
		 	          
      } ,
      error:function (){alert('Se ha producido un Error'); 
			 $("#prov").html("");
      }
  }
  );
}

function ActivarContratacion (Id_ConvocatoriaCargo, valor){

if (valor==1)
	mens='Esta Seguro de Desactivar el registro para la contratacion Directa?';
else 
	mens='Esta Seguro de Activar el registro para la contratacion Directa?';
	
  if (confirm(mens)==true )
 
	{ 
	
    var valores="Id_ConvocatoriaCargo="+Id_ConvocatoriaCargo+"&valor="+valor+"&lsTipo=110";


		
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
							 
	 					          alert('Se actualizo el estado de la contratcion directa');
									   MostrarConvocatoria();
                                       
								       }
								 	   else
								       {
									    return true;
								       }


								
									
											
									 } ,
		error:function (){
			  alert('No se puede eliminar el registro, se tiene registrado un cargo asignado a la convocatoria'); 

						}
		}
		);
   }
}



function ActivarContratacionPEA (Id_ConvocatoriaCargo){

    var valores="Id_ConvocatoriaCargo="+Id_ConvocatoriaCargo;

		
	var peticion=$.ajax(
		{
			

	     url:"m_regitroPEA.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){

							  },
		success:function (respuesta) {
				$('#divCriterio').html(respuesta);		

									 } ,
		error:function (){
			  alert('Error'); 

						}
		}
		);
}




function EliminarRegConvCargo(Id_ConvocatoriaCargo)
{



  if (confirm('¿Esta Seguro de Eliminar el Registro?')==true )
 
	{ 
	

    var valores="Id_ConvocatoriaCargo="+Id_ConvocatoriaCargo+"&lsTipo=109";


		
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
									   MostrarConvocatoria();
                                       
								       }
								 	   else
								       {
									    return true;
								       }


								
									
											
									 } ,
		error:function (){
			  alert('No se puede eliminar el registro, se tiene registrado un cargo asignado a la convocatoria'); 

						}
		}
		);
   }
}


</script>	

</HEAD>
<BODY onLoad="MostrarConvocatoria();" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>


	&ccedil;<!--#include file="cabecera.html"--> 

	 <!--#include file="pd_menu.asp"-->

	<div id="formulario">
   		<div id="divNavegacion" align="center"><span class="subtitulo">REGISTRO DE FICHA -  RECLUTAMIENTO VECINAL</span></div>
 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_ContratacionDirecta.asp">
    
    <table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
    <tr>
    	<TD colspan=5 class="aplicacion" bgcolor="#DAE8F3">
        	<span class="dato"><%=Session("actividad")%> <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>">
            </span>
        </TD>
    </tr>
    <tr>
    	<TD colspan="5" class='etiqueta'  ><input name="id_proy" id="id_proy" type="hidden" value="<%=idProyecto%>">
        <input name="txtIdPresupuestario" id="txtIdPresupuestario" type="hidden" value="">
        <input name="txtIdPresupuesto" id="txtIdPresupuesto" type="hidden" value="">
      
        <input name="txtNumConv" id="txtNumConv" type="hidden" value="<%=cantreg%>">
      
        </TD>
    </tr>

 
    
    </table>
    <div align="center" style="vertical-align:top; overflow:auto; height:4%; width:98.5%">
    <%
	response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
	response.Write " <td width=""3%"" align=""center"">Nro.</td>"
	response.Write "    <td width=""30%"" align=""center"">Cargo</td>"
	response.Write "    <td width=""37%"" align=""center"">Link Inscripci&oacute;n</td>"	
    response.Write "  </tr> </table>"
	%>
    </div>
    <div id="divCriterio" align="center" style="vertical-align:top; overflow:auto; height:250px;"></div>
	</form>
</div>
<BR>
        <div id="footer" align="right">
            <span>Usuario: <%=lsUsuario%> </span>
        </div>
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
