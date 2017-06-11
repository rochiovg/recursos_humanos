<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 

 <%
 
 id_usuario=  Session("id_usuario")
 ipVisitante = Request.ServerVariables("REMOTE_ADDR")
 lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
idProyecto=Session("id_proyecto")
 
sub generaProceso(id)
	id_f=id
	if id>=9  then
	id_f=11
	end if 

	
	set wRsDptoapli = Micone.execute(" exec pa_proceso_convocatoria_listar '0' ")
	Response.Write "<select  style=""width:200px"" class=""e_combo"" id=""cmbproceso"&id&""" name=""cmbproceso"&id&""" onChange=""verDetalleProc(this.value,'"&id&"' )"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if id_f=wRsDptoapli(0) then
		Response.Write "<option selected title=""" & wRsDptoapli(1) & """ value="""&wRsDptoapli(0)&"*"&wRsDptoapli(2)& """>"&wRsDptoapli(1)&"</option>"
	else
		Response.Write "<option title=""" & wRsDptoapli(1) & """ value=""" &wRsDptoapli(0)&"*"&wRsDptoapli(2)&  """>"&wRsDptoapli(1)&"</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub verValor(id)

	id_f=id
	if id>=9  then
	id_f=11
	end if 
	
	set wRsDptoapli = Micone.execute(" exec pa_proceso_convocatoria_listar '0' ")
	While not wRsDptoapli.EOF
		if id_f=wRsDptoapli(0) then
			cad = replace(wRsDptoapli(2),"<br>",vbCrLf)
			Response.Write (cad)
		else
			Response.Write ("")
		end if
		wRsDptoapli.MoveNext
	Wend
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub


sub generaNivel()
	
	set wRsDptoapli = Micone.execute(" exec dbo.getNivel ")
		
	While not wRsDptoapli.EOF
		Response.Write "<input class=""checkbox1"" type=""checkbox"" name="""& wRsDptoapli(0) &""" id=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "<br/>"
		wRsDptoapli.MoveNext
	Wend
		
	Response.Write "</select>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub



sub generaGrado()
	
	set wRsDptoapli = Micone.execute(" exec dbo.getGrado ")
		
	While not wRsDptoapli.EOF
		Response.Write "<input type=""checkbox""  class=""checkbox2""  name="""& wRsDptoapli(0) &""" id=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "<br/>"
		wRsDptoapli.MoveNext
	Wend
		
	Response.Write "</select>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub




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
		Response.Write "<option title="""&wRsDptoapli(2)&" ("&wRsDptoapli(3)&") Carg:"&wRsDptoapli(8)& " - PEA:"&wRsDptoapli(9) &" Periodo:("&wRsDptoapli(6)&") CCP:("&wRsDptoapli(7)&")" & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(2)&" ("&wRsDptoapli(3)&")" & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaConvocatoria()
			
	set wRsDptoapli = Micone.execute(" exec getConvocatorias '"&idProyecto&"'")
	Response.Write "<select class=""e_combo"" style=""width:400px;font-size:10px;"" id=""cmbConvocatoria"" name=""cmbConvocatoria""   onchange=""verFechaInicioConv();"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(0)&" ("&wRsDptoapli(1)&")" & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(0)&" ("&wRsDptoapli(1)&")" &"</option>"

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
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
	<link rel="stylesheet" href="css/demos.css">
    <link rel="stylesheet" type="text/css" href="Styles/inei.css">
	
	
    <link rel="stylesheet" type="text/css" href="Styles/calendar-blue.css">
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calendar-setup.js"></script>
	<script type="text/javascript" src="js/calendar-es.js"></script>
	<script type="text/javascript" src="js/sorttable.js"></script>

	
	
	
	

	<style>
			input.text { margin-bottom:12px; width:95%; padding: .4em; }

		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
	</style>


  <script>
 

function verDetalleProc (valor, id){
	var Datos = new Array();             
    Datos=valor.split("*");
	var datos_ver=''
	if (Datos[1]!='' ) {
		datos_ver=Datos[1];
	}
	$("#txtDetalleProc"+id).val(datos_ver);
}
 
function verificarFechas (id){
	var fec_ini=$("#txtIniProc"+id).val();
	var fec_fin=$("#txtFinProc"+id).val();	
 
	if (fec_fin!=''){
		var fecFin = new Array();
		fecFin=fec_fin.split("/");
		var fecFin_t=fecFin[2]+fecFin[1]+fecFin[0];
		
		if (fec_ini!=''){
			var fecIni = new Array();
			fecIni=fec_ini.split("/");
			var fecIni_t=fecIni[2]+fecIni[1]+fecIni[0];
			if (fecIni_t>fecFin_t){
				alert ('Fecha de inicio mayor a fecha final, corregir');
				$("#txtIniProc"+id).val('');
				$("#txtFinProc"+id).val('');
				$("#txtIniProc"+id).focus();
				return false;
			}

		} else {
			alert ('Registre fecha de inicio del proceso');
			$("#txtIniProc"+id).focus();
			return false;
		}
		
	} else {
		return false;
		}
}


function verBotones(id, tipo){
	var n_id=0;
	var botones=''
	if (tipo==1){
		n_id=parseInt(id)+1;
		document.getElementById("tr_p_"+n_id).style.display="";
	} else {
		n_id=parseInt(id)-1;	
		document.getElementById("tr_p_"+id).style.display="none";
	}

		botones=' <img src="images/mas.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:verBotones(\''+n_id+'\', \'1\')" /> / <img src="images/menos.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:verBotones(\''+n_id+'\', \'2\')" /> '
		document.getElementById("td_bot"+n_id).innerHTML =botones;
		document.getElementById("td_bot"+id).innerHTML ="";
		$("#total_procs").val(n_id);

}


  
function verFechaInicioConv()
{

    var num_Convocatoria=$("#cmbConvocatoria").val();
    
   
    
    var valores="num_Convocatoria="+num_Convocatoria;


	var peticion=$.ajax(
		{
	     url:"pd_FechaConvocatoria.asp",
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

		$("#txNumConvoc").val(Datos[0]); 
		$("#txtDescConvoc").val(Datos[1]); 
        $("#txtFechIniConv").val(Datos[2]);
        $("#txtFechFinConv").val(Datos[3]); 
		$("#txtestado").val(Datos[4]);
			var fecini=Datos[2];
			var fecfin=Datos[3];
		document.getElementById("fecInic").innerHTML=fecini; 
		document.getElementById("fecFin").innerHTML=fecfin; 

      } ,
      error:function (){alert('Se ha producido un Error'); 
			 $("#prov").html("");
      }
  }
  );
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






var miPopup 
function abrepopup(){ 
miPopup=window.open("pd_activarUbigeo.asp","miwin","width=900,height=600") 
miPopup.focus() 
} 
	
	
	
	function llamar()
	{
			$( "#dialog-form" ).dialog( "open" );

	}
	
	$(function() {
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
		var name = $( "#NivelInst" ),
			email = $( "#Grado" ),
			allFields = $( [] ).add( name ).add( email ),
			tips = $( ".validateTips" );
			
		function updateTips( t ) {
			tips
				.text( t )
				.addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}

	
		
		$( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 450,
			width: 450,
			modal: true,
			buttons: {
				"Grabar": function() {
				
					var nivel='';
					var grado='';
					
					$('.checkbox1').each(function(){ 
					var checkbox1 = $(this); 
					//alert('El checkbox ' + checkbox1.attr('name') + ' está checkeado? ' + checkbox1.is(':checked') ); 
					if (checkbox1.is(':checked')==true)
						nivel=nivel+checkbox1.attr('name')+',';
					});
					
					$('.checkbox2').each(function(){ 
					var checkbox2 = $(this); 
					//alert('El checkbox ' + checkbox1.attr('name') + ' está checkeado? ' + checkbox1.is(':checked') ); 
					if (checkbox2.is(':checked')==true)
						grado=grado+checkbox2.attr('name')+',';
					});

					allFields.removeClass( "ui-state-error" );


		if (nivel==''){
		alert('Seleccione Nivel Académico');
		return false;
		}
		
		if (grado==''){
			alert('Seleccione Grado Académico');
			return false;
		}

					GuardarAcademico(nivel, grado)

					
						$( this ).dialog( "close" );
			
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
	
	function GuardarAcademico(ArrayNivel, ArrayGrado){
	
    
	var cantNivel = ArrayNivel.length;
	var Nivel1 = ArrayNivel.substring(0,(cantNivel-1)); 
			
	var cantGrado= ArrayGrado.length;
	var Grado1 = ArrayGrado.substring(0,(cantGrado-1)); 
	
	document.getElementById("txtNivel").value=Nivel1;
	document.getElementById("txtGrado").value=Grado1;
	
}


function GrabarDatosConvCargo()
{    
var cmbConvocatoria=$("#cmbConvocatoria").val();
var cmbCargo=$("#cmbCargo").val();
var txNumConvoc=$("#txNumConvoc").val();
var txtIdPresupuestario=$("#txtIdPresupuestario").val();
var txtIdPresupuesto=$("#txtIdPresupuesto").val();
var txtFechIniConv=$("#txtFechIniConv").val();
var txtFechFinConv=$("#txtFechFinConv").val();
var txtDescConvoc=$("#txtDescConvoc").val();
var txtfechFinProceso=$("#txtfechFinProceso").val();
var txtestado=$("#txtestado").val();
var txtusuario=$("#txtusuario").val();
var txtipusuario=$("#txtipusuario").val();



if(cmbConvocatoria==0)
{
	   alert('Debe seleccionar convocatoria');
	   return false;	
}
if(cmbCargo==0)
{
	   alert('Debe seleccionar cargo');
	   return false;	
}

if(txtfechFinProceso=="")
{
	   alert('Debe seleccionar fecha fin del proceso de selección');
	   return false;	
}  


var txtObjetivo=$("#txtObjetivo").val();
if(txtObjetivo=="")
{
	   alert('Debe Ingresar los Objetivos de la Convocatoria');
	   return false;	
} else {
	txtObjetivo=txtObjetivo.replace(new RegExp("\\n","g"),'<br>');
	}

var txtPerfil=$("#txtPerfil").val();
if(txtPerfil=="")
{
	   alert('Debe Ingresar el perfil del cargo a Convocar');
	   return false;	
} else {
	txtPerfil=txtPerfil.replace(new RegExp("\\n","g"),'<br>');
	}


var txtDatosComp =$("#txtDatosComp ").val();
if(txtDatosComp =="")
{
	   alert('Debe Ingresar datos complementario');
	   return false;	
} else {
	txtDatosComp =txtDatosComp .replace(new RegExp("\\n","g"),'<br>');
	}


var txtCaracteristicas =$("#txtCaracteristicas ").val();
if(txtCaracteristicas =="")
{
	   alert('Debe Ingresar lasCaracterísticas del Cargo');
	   return false;	
} else {
	txtCaracteristicas =txtCaracteristicas .replace(new RegExp("\\n","g"),'<br>');
	}



var proc_id=0;
var detalle='';
var fec_i='';
var fec_f='';


var total_procs=$("#total_procs").val();

	for (var j=1; j<=total_procs; j++){
		
			proc_id=$("#cmbproceso"+j).val();
			var Datos = new Array();             
			Datos=proc_id.split("*");
			proc_id=Datos[0];

			detalle=$("#txtDetalleProc"+j).val();
			fec_i=$("#txtIniProc"+j).val();
			fec_f=$("#txtFinProc"+j).val();
			
			if ( parseInt(proc_id) == 0 ){
				alert ('Seleccione el tipo de proceso en el cronograma, no puede dejar en seleccione');
				$("#dialog2").dialog("open");
				$("#cmbproceso"+j).focus();
				return false;
			} 
			if (detalle==''){
				alert ('Registre la descripcion del proceso en el cronograma, no puede dejar en blanco');
				$("#dialog2").dialog("open");
				$("#txtDetalleProc"+j).focus();
				return false;
			} 
			
			if (fec_f!=''){
				var fecFin = new Array();
				fecFin=fec_f.split("/");
				var fecFin_t=fecFin[2]+fecFin[1]+fecFin[0];
				
				if (fec_i!=''){
					var fecIni = new Array();
					fecIni=fec_i.split("/");
					var fecIni_t=fecIni[2]+fecIni[1]+fecIni[0];
					if (fecIni_t>fecFin_t){
						alert ('Fecha de inicio mayor a fecha final, corregir');
						$("#dialog2").dialog("open");
						$("#txtIniProc"+j).val('');
						$("#txtFinProc"+j).val('');
						$("#txtIniProc"+j).focus();
						return false;
					}
		
				} else {
					alert ('Registre fecha de inicio del proceso');
					$("#dialog2").dialog("open");
					$("#txtIniProc"+j).focus();
					return false;
				}
			
			} /*else {
				if (fec_i!=''){
					alert ('Registre fecha de inicio del proceso');
					$("#dialog2").dialog("open");
					$("#txtIniProc"+j).focus();
					return false;
				}
			} */
	}

	var cronograma='';
	var cronograma_a = new Array();

	for (var p=1; p<= parseInt(total_procs); p++) {
		
		var proc_id=$("#cmbproceso"+p).val();
		var Datos = new Array();             
		Datos=proc_id.split("*");
		var proceso=Datos[0];
		var det=$("#txtDetalleProc"+p).val().replace(new RegExp("\\n","g"),'<br>');
		det=det.replace(new RegExp(",","g"),'.:.');

		cronograma = (proceso).toString()+"*"+(det).toString()+"!"+($("#txtIniProc"+p).val()).toString()+'*'+($("#txtFinProc"+p).val()).toString() ;
		cronograma_a.push(cronograma);
	}


	
var txtModalidad=$("#txtModalidad").val();
if(txtModalidad=="")
{
	   alert('Debe Ingresar la Modaldiad de Contratacion del Cargo');
	   return false;	
} else {
	txtModalidad=txtModalidad.replace(new RegExp("\\n","g"),'<br>');
	}	

var txtVigencia=$("#txtVigencia").val();
if(txtVigencia=="")
{
	   alert('Debe Ingresar la Vigencia de la Contratacion');
	   return false;	
} 
 else {
	txtVigencia=txtVigencia.replace(new RegExp("\\n","g"),'<br>');
	}


var cmbComptencias=$("#cmbComptencias").val();
var cmbMomentoComp=$("#cmbMomentoComp").val();
if(cmbComptencias=="")
{
	   alert('Debe elegir una opcion en el test de Competencias');
	   return false;	
} else if (cmbComptencias!="0"){
	if(cmbMomentoComp=="" )
{
	   alert('Debe elegir en que momento se dara el test de Competencias ');
	   return false;	
} 
	
}


var Activar_competencia=0
if (cmbMomentoComp==1)
Activar_competencia=1;

var cmbConocimientos=$("#cmbConocimientos").val();
var cmbMomentoCono=$("#cmbMomentoCono").val();
if(cmbConocimientos=="")
{
	   alert('Debe elegir una opcion en el test de Conocimientos');
	   return false;	
} else if (cmbConocimientos!="0"){
	if(cmbMomentoCono=="" )
{
	   alert('Debe elegir en que momento se dara el test de conocimientos ');
	   return false;	
} 
	
}


var Activar_conocimiento=0
if (cmbMomentoCono==1)
Activar_conocimiento=1;

var txtpea=$("#txtPEA").val();
if(txtpea=="")
{
	   alert('Debe ingresar la cantidad de PEA a convocar');
	   return false;	
} 


var txtUbigeos=$("#txtUbigeosTot").val();
if(txtUbigeos=="")
{
	   alert('Debe seleccionar el Ubigeo de la Convocatoria');
	   return false;	
} 

var txtNivel=$("#txtNivel").val();
if(txtNivel=="")
{
	   alert('Debe seleccionar Nivel Academico');
	   return false;	
} 


var txtGrado=$("#txtGrado").val();
if(txtGrado=="")
{
	   alert('Debe seleccionar el Nivel y Grado Academico');
	   return false;	
}


var txtExperiencia1=$("#txtExperiencia1").val();
if(txtExperiencia1=="")
{
	   alert('Debe ingresar Experiencia solicitada por la convocatoria');
	   return false;	
} else {
	txtExperiencia1=txtExperiencia1.replace(new RegExp("\\n","g"),'<br>');
	}
	
var txtBonificacion =$("#txtBonificacion ").val();	
if(txtBonificacion !="")
{
	txtBonificacion =txtBonificacion .replace(new RegExp("\\n","g"),'<br>');
	}
	


var txtExperiencia2=$("#txtExperiencia2").val();
if(txtExperiencia2=="")
{
	   alert('Debe ingresar Experiencia solicitada por la convocatoria');
	   return false;	
} else {
	txtExperiencia2=txtExperiencia2.replace(new RegExp("\\n","g"),'<br>');
	}
	

	var txtExperiencia3=$("#txtExperiencia3").val();
	var txtExperiencia4=$("#txtExperiencia4").val();
	var txtExperiencia5=$("#txtExperiencia5").val();

	txtExperiencia3=txtExperiencia3.replace(new RegExp("\\n","g"),'<br>');
	txtExperiencia4=txtExperiencia4.replace(new RegExp("\\n","g"),'<br>');
	txtExperiencia5=txtExperiencia5.replace(new RegExp("\\n","g"),'<br>');


	var valores="cmbConvocatoria="+cmbConvocatoria+"&cmbCargo="+cmbCargo+"&txtIdPresupuestario="+txtIdPresupuestario+"&txtIdPresupuesto="+txtIdPresupuesto+"&txtFechIniConv="+txtFechIniConv+"&txtFechFinConv="+txtFechFinConv+"&txtestado="+txtestado+"&txNumConvoc="+txNumConvoc+"&txtDescConvoc="+escape(txtDescConvoc)+"&txtfechFinProceso="+txtfechFinProceso+"&txtusuario="+txtusuario+"&txtipusuario="+txtipusuario+"&txtObjetivo="+escape(txtObjetivo)+"&txtPerfil="+escape(txtPerfil)+"&txtModalidad="+escape(txtModalidad)+"&txtVigencia="+escape(txtVigencia)+"&txtNivel="+escape(txtNivel)+"&txtGrado="+escape(txtGrado)+"&txtpea="+escape(txtpea)+"&txtBonificacion="+escape(txtBonificacion)+"&txtCaracteristicas="+escape(txtCaracteristicas)+"&txtDatosComp="+escape(txtDatosComp) +"&txtExperiencia1="+escape(txtExperiencia1)+"&txtExperiencia2="+escape(txtExperiencia2) +"&cmbComptencias="+escape(cmbComptencias)+"&cmbConocimientos="+escape(cmbConocimientos)+"&cmbMomentoComp="+escape(cmbMomentoComp)+"&cmbMomentoCono="+escape(cmbMomentoCono)+"&Activar_competencia="+escape(Activar_competencia)+"&Activar_conocimiento="+escape(Activar_conocimiento)+"&cronograma_a="+escape(cronograma_a)+"&txtExperiencia3="+escape(txtExperiencia3)+"&txtExperiencia4="+escape(txtExperiencia4)+"&txtExperiencia5="+escape(txtExperiencia5);

	
	var peticion=$.ajax(
		{
		
		 url:'pd_InsertarConvoCargo.asp?nocache=' + Math.random(),

		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
		 
							  },
		success:function (respuesta) {
		
		      if (respuesta==1) 
				{								  

				alert('El cargo presupuestario ya ha sido insertado para la convocatoria seleccionada');

		       } 
			 else
		       {	
			   		$('input[class=checkbox1]').attr('checked', false);
    				$('input[class=checkbox2]').attr('checked', false);
					document.getElementById("fecInic").innerHTML=''; 
					document.getElementById("fecFin").innerHTML=''; 
					
					 var id = respuesta;			 
					 registroUbigeo(txtUbigeos,id,txtIdPresupuesto);
			   }
			 		 			  	          
      } ,
      error:function (){alert('Se ha producido un ErrorDDSFASDFAS'); 

			 $("#formulario2").html("");			 
      }
  }
  );
}


function registroUbigeo(txtUbigeos,id,txtIdPresupuesto)
{	
var valores="txtUbigeos="+escape(txtUbigeos)+"&id="+escape(id)+"&txtIdPresupuesto="+escape(txtIdPresupuesto)+"&lsTipo=72";

	var peticion=$.ajax(
		{
	     url:'m_ingreso.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#divCriterio").html("Cargando...");
								
							  },
		success:function (respuesta) {
			
	          		 MostrarConvocatoriaCargo();
					 alert("Se insertó el registro correctamente");
                    document.frmMiForm.reset();
	          
      } ,
      error:function (){alert('Se a producido un Error'); 
			 $("#divCriterio").html("");
			 
      }
  }
  );
}	



function MostrarConvocatoriaCargo()
{	

	var valores="";


	var peticion=$.ajax(
		{
	     url:'pd_ListarConvocatoriaCargo.asp?nocache=' + Math.random(),
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

function verFechaInicioConv2()
{

    var num_Convocatoria=$("#cmbConvocatoria").val();
    
   
    
    var valores="num_Convocatoria="+num_Convocatoria;


	var peticion=$.ajax(
		{
	     url:"pd_FechaConvocatoria.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
         
								
								 $('#detalle_FechaConv').html("Cargando...");
							  },
		success:function (respuesta) {
			

		 $('#detalle_FechaConv').html(respuesta);
			

			 	          
      } ,
      error:function (){alert('Se ha producido un Erroreeeee'); 
			 $("#detalle_FechaConv").html("");
      }
  }
  );
}	
	


$(function () {
	$("#dialog2").dialog({
		width: 900, 
		height: 600,
		autoOpen: false,
		modal: true,
		buttons: {
			"Cerrar": function () {
				$(this).dialog("close");
			}
		}
	});
});

function mostrarCronograma(){
		$("#dialog2").dialog("open");	

}

	</script>
</HEAD>
<BODY onLoad="MostrarConvocatoriaCargo();verFechaInicioConv2();" 
  topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"-->
	<!--#include file="pd_menu.asp"-->
	<INPUT type="hidden" id=txtIdPresupuestario name=txtIdPresupuestario  >
	<INPUT type="hidden" id=txtIdPresupuesto name=txtIdPresupuesto  >
	<INPUT type="hidden" id=txtipusuario name=txtipusuario value="<%=ipVisitante%>">
	<INPUT type="hidden" id=txtusuario name=txtusuario value="<%=id_usuario%>">
	<INPUT type="hidden" id=txtNivel name=txtNivel value="">
	<INPUT type="hidden" id=txtGrado name=txtGrado value="">
	<INPUT type="hidden" id=txNumConvoc name=txNumConvoc value="">
	<INPUT type="hidden" id=txtDescConvoc name=txtDescConvoc value="">
	<INPUT type="hidden" id=txtFechIniConv name=txtFechIniConv value="">
	<INPUT type="hidden" id=txtFechFinConv name=txtFechFinConv value="">
	<INPUT type="hidden" id=txtUbigeosTot name=txtUbigeosTot value="">
	<INPUT type="hidden" id=txtestado name=txtestado value="">
	<div id="formulario">
		<div id="divNavegacion" align="center"><span class="subtitulo">Registro: Convocatoria por Cargo </span></div>
    	<form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
				<div id="formulario" style="display:block">
   				<table width="100%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
						<tr>
 	      			<th colspan=7 class="aplicacion" bgcolor="#DAE8F3">
 	        			<span class="dato"><%=Session("cmeta")&"-"&Session("nmeta")%> -<%=Session("actividad")%>
            		<input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>">
            		</span>
              </th>
 	          <tr>
 	        		<td colspan="4"  class='etiqueta'> <span class="alerta5">(*) Datos Obligatorios<span class="aplicacion"></span></span></td>
        		</tr>
 	    			<tr>
              <td width="20%"  class='etiqueta'>Convocatoria</td>
              <td width="35%" class='etiqueta' ><%generaConvocatoria()%><font class='alerta5'>(*) </font></td>
 	        		<input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=Session("id_Usuario")%>">
 	        		</font>
              </td>
 	       			<td width="10%" class='etiqueta'>Cargo CCP</td>
 	       			<td class='etiqueta'><%generaCargoPresupuesto()%><font class='alerta5'>(*) </font></td>
        		</tr>
 	  	  		<tr>
			  			<td  style="HEIGHT:50px;width:25%;" align="left" class="etiqueta">Fecha Inicio: <font id="fecInic"></font></td>
              <td  style="HEIGHT:50px;width:25%;" align="left" class="etiqueta">Fecha Fin:<font id="fecFin"></font></td>
              <td width="10%" border="0" align="left" class="etiqueta">Fecha Fin Proceso de Selección</td>
 	      			<td width="174" align=left  ><span class="e_td_string"></span> 
              <input type='text' class='e_input' id='txtfechFinProceso' name='txtfechFinProceso' value='' maxlength='10'>
							<input type='button' id='cbFechFinPro' value='..'>
                
<script type="text/javascript"> 
	Calendar.setup({ 
	inputField : "txtfechFinProceso",     // id del campo de texto 
	ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
	button     : "cbFechFinPro"     // el id del botón que lanzará el calendario 
	});
</script>
            	<font class='alerta5'>(*) </font></td>
        		</tr>
      		</table>
					<table width="100%" id="users2" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
            <tr class="etiqueta">
              <td width="11%">Objetivo:</td>
              <td colspan="3"><textarea name="txtObjetivo" style="width:350; height:50" class="e_input" id="txtObjetivo"></textarea></td>
              <td width="10%">Perfil del Servicio:</td>
              <td colspan="3"><textarea name="txtPerfil" style="width:350; height:50" class="e_input" id="txtPerfil"></textarea></td>
          	</tr>
        		<tr class="etiqueta">
              <td width="11%">Datos Complementarios:</td>
              <td colspan="3"><textarea name="txtDatosComp" style="width:350; height:50" class="e_input" id="txtDatosComp"></textarea>
              </td>
              <td width="10%">Caracter&iacute;sticas del trabajo:</td>
              <td colspan="3">
              	<textarea name="txtCaracteristicas" style="width:350; height:50" class="e_input" id="txtCaracteristicas"></textarea>
              </td>
            </tr>
            <tr class="etiqueta">
              <td>Proceso:</td>
              <td colspan="3"><span class="etiqueta" style="HEIGHT:50px;width:25%;">
              	<img src="images/nivel.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" 
                	onClick="javascript:mostrarCronograma()" /><br></span>
              </td>
              <td>Bonificaci&oacute;n:</td>
              <td colspan="3"><span class="etiqueta" style="HEIGHT:50px;width:25%;">
                <textarea name="txtBonificacion" style="width:350; height:50" class="e_input" id="txtBonificacion"></textarea>
              </span></td>
            </tr>
            <tr class="etiqueta">
              <td>Modalidad:</td>
              <td colspan="3"><textarea name="txtModalidad" style="width:350; height:50" class="e_input" id="txtModalidad"></textarea>
              </td>
              <td>Vigencia:</td>
              <td colspan="3"><span class="alerta4">
                <textarea name="txtVigencia" style="width:350; height:50" class="e_input" id="txtVigencia"></textarea></span>
              </td>
            </tr>
            <tr class="etiqueta">
              <td>Seleccionar Test Competencias:</td>
              <td><font class='cascade4' color=crimson>
                <select id="cmbComptencias" name="cmbComptencias" class='e_combo' style="width:100px">
                  <option selected value="">Seleccione...</option>
                  <option value="0">Sin test</option>
                  <option value="1">De 185 preguntas</option>
                  <option value="2">De 24 preguntas</option>
                </select>
              </font></td>
              <td>Momento:</td>
              <td><font class='cascade4' color=crimson>
                <select id="cmbMomentoComp" name="cmbMomentoComp" class='e_combo' style="width:100px">
                  <option selected value="">Seleccione...</option>
                  <option value="1">En Inscripci&oacute;n</option>
                  <option value="2">En fecha Establecida</option>
                </select>
              </font></td>
              <td>Seleccionar Test Conocimientos:</td>
              <td width="11%"><font class='cascade4' color=crimson>
                <select id="cmbConocimientos" name="cmbConocimientos" class='e_combo' style="width:100px">
                  <option selected value="">Seleccione...</option>
                  <option value="0">Sin test</option>
                  <option value="1">Ofimática</option>
                  <option value="2">Otros</option>
                </select>
              </font></td>
              <td width="18%">Momento:</td>
              <td width="12%"><font class='cascade4' color=crimson>
                <select id="cmbMomentoCono" name="cmbMomentoCono" class='e_combo' style="width:100px">
                  <option selected value="">Seleccione...</option>
                  <option value="1">En Inscripci&oacute;n</option>
                  <option value="2">En fecha Establecida</option>
                </select>
              </font></td>
            </tr>
            <tr class="etiqueta">
              <td>Seleccione Ubigeo: </td>
              <td><img src="images/peru.png" width="21" height="21" alt="" border="0" style="CURSOR: hand" 
              	onClick="javascript:abrepopup()" />
              </td>
              <td>Cantidad de PEA:</td>
              <td><input type='text' class='e_input' id='txtPEA' name='txtPEA' value='' maxlength='10'></td>
              <td colspan="2">Seleccionar Nivel y grado Acad&eacute;mico:</td>
              <td><img src="images/nivel.png" width="17" height="18" alt="" border="0" style="CURSOR: hand" 
                onClick="javascript:llamar()" />
              </td>
              <td>&nbsp;</td>
            </tr>
            <tr class="etiqueta">
              <td width="11%">Experiencia 1x</td>
              <td colspan="3"><textarea name="txtExperiencia1" style="width:350; height:50" class="e_input" id="txtExperiencia1">
              	</textarea></td>
              <td width="10%">Experiencia 2:</td>
              <td colspan="3"><textarea name="txtExperiencia2" style="width:350; height:50" class="e_input" id="txtExperiencia2">
              </textarea></td>
            </tr>
            <tr class="etiqueta">
              <td width="11%">Experiencia 3</td>
              <td colspan="3"><textarea name="txtExperiencia3" style="width:350; height:50" class="e_input" id="txtExperiencia3">
              </textarea></td>
              <td width="10%">Experiencia 4:</td>
              <td colspan="3"><textarea name="txtExperiencia4" style="width:350; height:50" class="e_input" id="txtExperiencia4">
              </textarea></td>
            </tr>
            <tr class="etiqueta">
              <td width="11%">Experiencia 5</td>
              <td colspan="3"><textarea name="txtExperiencia5" style="width:350; height:50" class="e_input" id="txtExperiencia5">
              </textarea></td>
              <td width="10%">&nbsp;</td>
              <td colspan="3">&nbsp;</td>
            </tr>
            <tr class="etiqueta">
              <td  align="center" colspan="8"><span class="alerta4">
                <input name="button" type="button" class="boton" id="button" value="Grabar" 
                onClick="GrabarDatosConvCargo()">Detalle</span> 
                <font class='alerta5'>
                <img src="images/ventana.png" alt="" border="0" style="CURSOR: hand" 
                  onClick="window.open('pd_conAdministrativaDetalle.asp?lstipoReport=3&amp;wwwHora=<%=time()%>','','top=10,left=25,scrollbars=yes,width=880,height=700,resizable=1')" />
                </font>
              </td>
            </tr>
          </table>
 				</div>	
      	<div id="divCriterio" align="center">
				</div>
			</form>
      <div id="dialog-form" title="Seleccionar Grado">
        <p class="validateTips" align="center">Selecci&oacute;n de grado</p>
        <form id="nuevo">
        <fieldset><label for="email">Nivel de Instruccion</label><br><%generaNivel()%><br>&nbsp;<br>
        <label for="name">Grado Academico&nbsp;&nbsp;&nbsp;&nbsp;</label><br><%generaGrado()%><br>&nbsp;</fieldset>
        </form>
      </div>
    </div>
      
    <div id="dialog2" title="PROCESOS DE LA CONVOCATORIA" align="center" >
      <table border="1"  cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
        <tr>
          <td class="etiqueta" align="center">Nro.</td>
          <td class="etiqueta" align="center">PROCESO</td>
          <td class="etiqueta" align="center"><input type="hidden" id="total_procs" name="total_procs" value="8">DETALLE</td>
          <td class="etiqueta" align="center">FECHA INICIO</td>
          <td class="etiqueta" align="center">FECHA FIN</td>
          <td class="etiqueta" align="center">Agregar</td>
        </tr>
        <tr id="tr_p_1">
          <td class="etiqueta" id="td1">1</td>
          <td class="etiqueta" id="td1"><% generaProceso(1) %></td>
          <td class="etiqueta">
            <textarea name="txtDetalleProc1" style="width:250; height:40" class="e_input" id="txtDetalleProc1">
            <%verValor(1)%></textarea>
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc1' name='txtIniProc1' value='' maxlength='10' 
            onKeyUp="this.value=formateafecha(this.value);" >
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc1' name='txtFinProc1' value='' maxlength='10' 
              onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('1')" >
          </td>
          <td class="etiqueta" id="td_bot1">&nbsp;</td>
        </tr>
        <tr id="tr_p_2">
          <td class="etiqueta" id="td2">2</td>
          <td class="etiqueta" id="td2"><% generaProceso(2) %></td>
          <td class="etiqueta">
            <textarea name="txtDetalleProc2" style="width:250; height:40" class="e_input" id="txtDetalleProc2">
            <% verValor(2)%></textarea>
           </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc2' name='txtIniProc2' value='' maxlength='10' 
            onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc2' name='txtFinProc2' value='' maxlength='10' 
            onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('2')">
          </td>
          <td class="etiqueta" id="td_bot2">&nbsp;</td>
        </tr>
        <tr id="tr_p_3">
          <td class="etiqueta" id="td3">3</td>
          <td class="etiqueta" id="td3"><% generaProceso(3) %></td>
          <td class="etiqueta">
            <textarea name="txtDetalleProc3" style="width:250; height:40" class="e_input" id="txtDetalleProc3">
              <% verValor(3)%></textarea>
          </td>
          <td class="etiqueta">
          <input type='text' class='e_input' id='txtIniProc3' name='txtIniProc3' value='' maxlength='10' 
            onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc3' name='txtFinProc3' value='' maxlength='10' 
            onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('3')">
          </td>
          <td class="etiqueta" id="td_bot3">&nbsp;</td>
        </tr>
        <tr id="tr_p_4">
          <td class="etiqueta" id="td4">4</td>
          <td class="etiqueta" id="td4"><% generaProceso(4) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc4" style="width:250; height:40" class="e_input" id="txtDetalleProc4">
          <% verValor(4)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc4' name='txtIniProc4' value='' maxlength='10' 
            onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc4' name='txtFinProc4' value='' maxlength='10' 
            onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('4')">
          </td>
          <td class="etiqueta" id="td_bot4">&nbsp;</td>
        </tr>
        <tr id="tr_p_5">
          <td class="etiqueta" id="td5">5</td>
          <td class="etiqueta" id="td5"><% generaProceso(5) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc5" style="width:250; height:40" class="e_input" id="txtDetalleProc5"><% verValor(5)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc5' name='txtIniProc5' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc5' name='txtFinProc5' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('5')">
          </td>
          <td class="etiqueta" id="td_bot5">&nbsp;</td>
        </tr>
        <tr id="tr_p_6">
          <td class="etiqueta" id="td6">6</td>
          <td class="etiqueta" id="td6"><% generaProceso(6) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc6" style="width:250; height:40" class="e_input" id="txtDetalleProc6"><% verValor(6)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc6' name='txtIniProc6' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
        </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc6' name='txtFinProc6' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('6')">
          </td>
          <td class="etiqueta" id="td_bot6">&nbsp;</td>
        </tr>
        <tr id="tr_p_7">
          <td class="etiqueta" id="td7">7</td>
          <td class="etiqueta" id="td7"><% generaProceso(7) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc7" style="width:250; height:40" class="e_input" id="txtDetalleProc7"><% verValor(7)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc7' name='txtIniProc7' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
        </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc7' name='txtFinProc7' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('7')">
          </td>
          <td class="etiqueta" id="td_bot7">&nbsp;</td>
        </tr>
        <tr id="tr_p_8">
          <td class="etiqueta" id="td8">8</td>
          <td class="etiqueta" id="td8"><% generaProceso(8) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc8" style="width:250; height:40" class="e_input" id="txtDetalleProc8"><% verValor(8)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc8' name='txtIniProc8' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
        </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc8' name='txtFinProc8' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('8')">
          </td>
          <td class="etiqueta" id="td_bot8"><img src="images/mas.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:verBotones('8', '1')" /> / <img src="images/menos.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:verBotones('8', '2')" /></td>
        </tr>
        <tr style="display:none" id="tr_p_9">
          <td class="etiqueta" id="td9">9</td>
          <td class="etiqueta" id="td9"><% generaProceso(9) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc9" style="width:250; height:40" class="e_input" id="txtDetalleProc9"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc9' name='txtIniProc9' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc9' name='txtFinProc9' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('9')">
          </td>
          <td class="etiqueta" id="td_bot9">&nbsp;</td>
        </tr>
        
        <tr style="display:none" id="tr_p_10">
          <td class="etiqueta" id="td10">10</td>
          <td class="etiqueta" id="td10"><% generaProceso(10) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc10" style="width:250; height:40" class="e_input" id="txtDetalleProc10"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc10' name='txtIniProc10' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc10' name='txtFinProc10' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('10')">
          </td>
          <td class="etiqueta" id="td_bot10">&nbsp;</td>
        </tr>
        
        <tr style="display:none" id="tr_p_11">
          <td class="etiqueta" id="td11">11</td>
          <td class="etiqueta" id="td11"><% generaProceso(11) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc11" style="width:250; height:40" class="e_input" id="txtDetalleProc11"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc11' name='txtIniProc11' value='' maxlength='11' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc11' name='txtFinProc11' value='' maxlength='11' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('11')">
          </td>
          <td class="etiqueta" id="td_bot11">&nbsp;</td>
        </tr>
        
        <tr style="display:none" id="tr_p_12">
          <td class="etiqueta" id="td12">12</td>
          <td class="etiqueta" id="td12"><% generaProceso(12) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc12" style="width:250; height:40" class="e_input" id="txtDetalleProc12"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc12' name='txtIniProc12' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc12' name='txtFinProc12' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('12')">
          </td>
          <td class="etiqueta" id="td_bot12">&nbsp;</td>
        </tr>
        <tr style="display:none" id="tr_p_13">
          <td class="etiqueta" id="td13">13</td>
          <td class="etiqueta" id="td13"><% generaProceso(13) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc13" style="width:250; height:40" class="e_input" id="txtDetalleProc13"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc13' name='txtIniProc13' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
        </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc13' name='txtFinProc13' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('13')">
          </td>
          <td class="etiqueta" id="td_bot13">&nbsp;</td>
        </tr>
        
        <tr style="display:none" id="tr_p_14">
          <td class="etiqueta" id="td14">14</td>
          <td class="etiqueta" id="td14"><% generaProceso(14) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc14" style="width:250; height:40" class="e_input" id="txtDetalleProc14"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc14' name='txtIniProc14' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
        </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc14' name='txtFinProc14' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('14')">
          </td>
          <td class="etiqueta" id="td_bot14">&nbsp;</td>
        </tr>
        
        
        <tr style="display:none" id="tr_p_15">
          <td class="etiqueta" id="td15">15</td>
          <td class="etiqueta" id="td15"><% generaProceso(15) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc15" style="width:250; height:40" class="e_input" id="txtDetalleProc15"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc15' name='txtIniProc15' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc15' name='txtFinProc15' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('15')">
          </td>
          <td class="etiqueta" id="td_bot15">&nbsp;</td>
        </tr>
        <tr style="display:none" id="tr_p_16">
          <td class="etiqueta" id="td16">16</td>
          <td class="etiqueta" id="td16"><% generaProceso(16) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc16" style="width:250; height:40" class="e_input" id="txtDetalleProc16"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc16' name='txtIniProc16' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc16' name='txtFinProc16' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('16')">
          </td>
          <td class="etiqueta" id="td_bot16">&nbsp;</td>
        </tr>
        <tr style="display:none" id="tr_p_17">
          <td class="etiqueta" id="td17">17</td>
          <td class="etiqueta" id="td17"><% generaProceso(17) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc17" style="width:250; height:40" class="e_input" id="txtDetalleProc17"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc17' name='txtIniProc17' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc17' name='txtFinProc17' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('17')">
          </td>
          <td class="etiqueta" id="td_bot17">&nbsp;</td>
        </tr>
        <tr style="display:none" id="tr_p_18">
          <td class="etiqueta" id="td18">18</td>
          <td class="etiqueta" id="td18"><% generaProceso(18) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc18" style="width:250; height:40" class="e_input" id="txtDetalleProc18"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc18' name='txtIniProc18' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc18' name='txtFinProc18' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('18')">
          </td>
          <td class="etiqueta" id="td_bot18">&nbsp;</td>
        </tr>
        
        <tr style="display:none" id="tr_p_19">
          <td class="etiqueta" id="td19">19</td>
          <td class="etiqueta" id="td19"><% generaProceso(19) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc19" style="width:250; height:40" class="e_input" id="txtDetalleProc19"><% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc19' name='txtIniProc19' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc19' name='txtFinProc19' value='' maxlength='10' onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('19')">
          </td>
          <td class="etiqueta" id="td_bot19">&nbsp;</td>
        </tr>
        <tr style="display:none" id="tr_p_20">
          <td class="etiqueta" id="td20">20</td>
          <td class="etiqueta" id="td20"><% generaProceso(20) %></td>
          <td class="etiqueta"><textarea name="txtDetalleProc20" style="width:250; height:40" class="e_input" id="txtDetalleProc20">
          <% verValor(11)%></textarea></td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtIniProc20' name='txtIniProc20' value='' maxlength='10' 
            onKeyUp="this.value=formateafecha(this.value);">
          </td>
          <td class="etiqueta">
            <input type='text' class='e_input' id='txtFinProc20' name='txtFinProc20' value='' maxlength='10' 
            onKeyUp="this.value=formateafecha(this.value);" onBlur="verificarFechas('20')">
          </td>
          <td class="etiqueta" id="td_bot20">&nbsp;</td>
        </tr>
      </table>
    </div>
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
