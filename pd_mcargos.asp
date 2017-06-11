<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
 
 <%
 
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




sub generaCargoCCP()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec  uspGet_CcargoActivo ")
	Response.Write "<select class=""e_combo"" style=""width:340px"" id=""cmbCargo"" name=""cmbCargo""  onchange=""javascrip:CcpConvo(this.value)""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli("funcional")&" ("&wRsDptoapli("docSolicita_CCP")&")" & """ value=""" & wRsDptoapli("id_CCPresupuestario") & """>"&wRsDptoapli("funcional")&" ("&wRsDptoapli("docSolicita_CCP")&")" & "</option>"
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

function narmadas(valor)
{
	
	
	nvalor=Math.ceil(valor)
	document.frmMiForm.txtarmadas.value = nvalor ;
periodo=document.frmMiForm.cmbperiodo.value  ;
				if (periodo==2)
				{
						
							$( "#users tbody" ).empty();
						for (i=1;i<=nvalor;i++) { 
							$( "#users tbody" ).append( "<tr>" +
							 "<td  > Armada N&deg;&nbsp;"+i+" </td>" + 
							"<td colspan='3'><input type='text' name='n"+i+"' id='n"+i+"' onkeypress='return TextUtil.allowChars(this, event)'  validchars='1234567890.'></td>" + 
							
							"</tr>" ); 
						}
						
					
				}
				
								if (periodo==1  )
				{ 
				n2valor2=nvalor/30
				n2valor=Math.ceil(n2valor2)
				
							$( "#users tbody" ).empty();
						for (i=1;i<=n2valor;i++) { 
							$( "#users tbody" ).append( "<tr>" +
							 "<td  > Armada N&deg;&nbsp;"+i+" </td>" + 
							"<td colspan='3'><input type='text' name='n"+i+"' id='n"+i+"' onkeypress='return TextUtil.allowChars(this, event)'  validchars='1234567890.'></td>" + 
							
							"</tr>" ); 
						}
						
					
				}
				
				
				
				
				
			
	}
function CcpConvo(valor)
{
/*		document.getElementById("txtCantPea").value='';
	document.getElementById("txtnperiodo").value='';
*/


	$( "#users tbody" ).empty();

		ajax=http_request();
	var valores;	
	valores= "datos=" + escape(valor)+"&lsTipo=55";  // parametros a enviar al servidor	
	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("CcpConvo").innerHTML ="";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
					document.getElementById("CcpConvo").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("CcpConvo").innerHTML = "";
            }
            else{
                     document.getElementById("CcpConvo").innerHTML = ajax.responseText;	
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	

	
	}

function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	var codig=varDpto.substring(0,2);
	
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	
	
	url="m6_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov").innerHTML =ajax.responseText;
					verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("prov").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov").innerHTML = ajax.responseText;	
					 
								 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}


function Activar(oficio,fecha,nsolicitid,fsolicitud,ArrayChek){
    Id_Usuario=document.getElementById("txtUsuario").value
	ajax=http_request();
	var valores;	
	valores= "lsOficio=" + escape(oficio)+"&lsfecha="+escape(fecha)+"&lsIdUsuario="+escape(Id_Usuario)+"&nsolicitid="+escape(nsolicitid)+"&fsolicitud="+escape(fsolicitud)+"&ArrayChek="+escape(ArrayChek)+"&lsTipo=43";  // parametros a enviar al servidor	
	url="m_ingreso.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("divCriterio").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("divCriterio").innerHTML =ajax.responseText;
					
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


function validaPeriodo( valor)
{
	vmax=document.getElementById("txtnPermax").value;
if (vmax!='')
{
	if (parseInt(vmax) < parseInt(valor))
	{
		alert("Error!! Cant. m\xe1xima Periodo  de "+vmax)
		document.getElementById("txtnperiodo").value="";
		$( "#users tbody" ).empty();
		
	}else
	{
		
	
	}
}else 
{alert("Selecciona el Cargo Presupuestado")
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
		$( "#users tbody" ).empty();
		
	}
}else 
{		alert("Selecciona el Cargo Presupuestado")
			document.getElementById("txtCantPea").value="";

	
	}


}
</script>

	<script>
	

	
	
	
	function llamar(valor)
	{
		
        if($("#checkbox").is(':checked')) {  
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
			height: 600,
			width: 350,
			modal: true,
			buttons: {
				"Grabar": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

					bValid = bValid && checkLength( name, "Nro Oficio de Aprobacion  CCP", 3, 60 );
					bValid = bValid && checkLength( email, "Fecha Oficio de Aprobacion de CCP", 0, 10 );
					bValid = bValid && checkLength( nsolicitud, "Nro solicitud CCP", 3, 60 );
					bValid = bValid && checkLength( fsolicitud, "Fecha de solicitud CCP", 0, 10 );

					if ( bValid ) {
				
					var selectedItems = new Array();
					$("input[@name='itemSelect[]']:checked").each(function(){
							selectedItems.push($(this).val());
						});

					Activar(name.val(),email.val(),nsolicitud.val(),fsolicitud.val(),selectedItems)

					
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
	 
	</script>
</HEAD>
<BODY topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>
	<!--#include file="cabecera.html"--> 

	 <!--#include file="pd_menu.asp"-->

	<div id="formulario">
   		<div id="divNavegacion" align="center"><span class="subtitulo">Registro: Oficio de Contrataci&oacute;n</span></div>

    <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
  <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">
   
<table width="95%" id="users" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
  <thead><tr>
 	      <th colspan=5 class="aplicacion" bgcolor="#DAE8F3">
 	        <span class="dato">
 	
            <%=Session("cmeta")&"-"&Session("nmeta")%> -<%=Session("actividad")%>
            <input name="txtactividad" type="hidden" id="txtactividad" value="<%=Session("id_proyecto")%>">
            </span></th>
 	    
          <tr>
 	        <td colspan="2"  class='etiqueta'> <span class="alerta5">(*) Datos Obligatorios<span class="aplicacion"></span></span></td>
 	        </tr>
 	    <tr>
 	      <td width="19%" class='etiqueta'>Cargo Presupuestado<font class="alerta5">&nbsp;</font></td>
 	      <td class='etiqueta'><font class='alerta5'>
 	        <%generaCargoCCP()%>
 	        </font><font class='alerta5'>(*) 
 	          <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=Session("id_Usuario")%>">
 	          </font></td>
 	      </tr>
 	    <tr>
 	      <td colspan="2" class='etiqueta' id="CcpConvo">&nbsp;</td>
 	      </tr>

 	        </thead>
         <tbody>
 	            </tbody>    
                <tfoot>  
			 <td colspan="2" align="center" >&nbsp;</td>
 	      </tr></tfoot>
 	    </table>
 	</div>	
		</td>
	</tr>	
	</table>              				    	    				    <div id="divCriterio" align="center"></div>
	</form>
</div>

<div id="ficha" align="center"></div>
</BODY>
</HTML>
<%Else
Response.Redirect("default.asp")
End If%>
