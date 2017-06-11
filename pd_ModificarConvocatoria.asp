<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 

<% 
Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires=0

num_Convocatoria= Request("num_Convocatoria")
Desc_Convocatoria= Request("Desc_Convocatoria")
Desc_Convocatoria= Request("Desc_Convocatoria")
fechaInicio= Request("fechaInicio")
fechaFin= Request("fechaFin")


%>

 <link rel="shortcut icon" href="images/favicon.ico" />

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
    <script type="text/javascript" src="js/modal.js"></script>

<script>


function ActualizarConvocatoria2()
{ 
     var num_Convocatoria=$("#txtNumConvocat").val();
	 var txtDesConvocat=$("#txtDesConvocat").val().toUpperCase();
	 var txtfeIniConv=$("#txtfeIniConv").val();			
	 var txtfeFinConv=$("#txtfeFinConv").val();	
	 
 
if(txtDesConvocat=="")
{
	   alert('Debe ingresar la descripción de la convocatoria');
	   return false;	
}

if(txtfeIniConv=="")
{
	   alert('Debe ingresar la fecha de inicio de la convocatoria');
	   return false;	
}

if(txtfeFinConv=="")
{
	   alert('Debe ingresar la fecha de fin de la convocatoria');
	   return false;	
}


if(txtfeIniConv>txtfeFinConv)
{
	   alert('La fecha Inicio no puede ser mayor que la fecha fin de convocatoria');
	   return false;	
}


	 
if (confirm('¿Está seguro de actualizar la información?')==true )
 
	{ 
	    
	  	var valores="num_Convocatoria="+num_Convocatoria+"&txtDesConvocat="+escape(txtDesConvocat)+"&txtfeIniConv="+txtfeIniConv+"&txtfeFinConv="+txtfeFinConv+"&lsTipoReg=3";

		
	 
	var peticion=$.ajax(
		{
		
	     url:'pd_EliminarConvocatoria.asp?nocache=' + Math.random(),
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								
							  },
		success:function (respuesta) {
		
						    $("#dialog-form").html("");  

     								  if (respuesta==1)
							           {
							 
							          alert('Se actualizó el registro correctamente.');
									  window.close();
									 // MostrarConvocatoria();
                                      document.frmMiForm.MostrarConvocatoria();

								       }
								 	   else
								       {
									   return true;
								       }
 
							 
		} ,
		error:function (){
			  alert('Se a producido un Error'); 
			  $("#dialog-form").html("");
						}
      
	 }
	);
 
   }
		

 }
 
 
 function Cancelar()
{

 window.close();

}
 
</script>	
	

<BODY  onLoad="MostrarConvocatoria();" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" link=blue vLink=blue alink=blue>


<div id="ficha" align="center"></div>
<div id="dialog-form" title="Actualizar Convocatoria">
	<p class="validateTips" class='etiqueta'><span class="alerta5">(*) Datos Obligatorios</span>
	  <input type="hidden" name="txtid" id="txtid">
	</p>
    <form>
	<fieldset>
		<table> 
	   <tr>
	     <td width="50%">Número de Convocatoria</td>
	     <td width="50%"><input name="txtNumConvocat" type="text" class="text ui-widget-content ui-corner-all" id="txtNumConvocat" 
				onKeyPress="return TextUtil.allowChars(this, event)" 	style="width: 40px;border:1;font-color:#0000FF;text-align:left;font-weight:bold ;" value="<%=num_Convocatoria%>"	validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ / -0123456789" disabled="true" /></td>
	   </tr>
	   
	   <tr>
	     <td width="50%" class='etiqueta'>Descripción de Convocatoria</td>
	      <td width="50%" class='etiqueta'><font class='alerta5'><input name="txtDesConvocat" type="text" id="txtDesConvocat" size="30" maxlength="100"
				onKeyPress="return TextUtil.allowChars(this, event)" style=" text-transform: uppercase;"	value="<%=Desc_Convocatoria%>"	/>(*) </font></td>
	   </tr>
	   
	   <tr>
	     <td width="50%">Fecha Inicio</td>
	      <td width="174" align=left  ><span class="e_td_string">
   
          </span><font class='alerta5'> <input type='text' class='e_input' id='txtfeIniConv' value="<%=fechaInicio%>" onKeyUp="this.value=formateafecha(this.value);" name='txtfeIniConv'  maxlength='10'>
			<input type='button' id='cbfeIniConv' value='..'>
                
          <script type="text/javascript"> 
	      Calendar.setup({ 
          inputField : "txtfeIniConv",     // id del campo de texto 
          ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
          button     : "cbfeIniConv"     // el id del botón que lanzará el calendario 
	     });
         </script>	
		 (*) </font>
		 </td>
	   </tr>
	   
	   <tr>
	     <td width="50%">Fecha Fin</td>
	      <td width="174" align=left  ><span class="e_td_string">
   
          </span> <font class='alerta5'><input type='text' class='e_input' id='txtfeFinConv' value="<%=fechaFin%>" onKeyUp="this.value=formateafecha(this.value);" name='txtfeFinConv'  maxlength='10'>
				<input type='button' id='cbfeFinConv' value='..'>
                
          <script type="text/javascript"> 
	      Calendar.setup({ 
          inputField : "txtfeFinConv",     // id del campo de texto 
          ifFormat   : "%d/%m/%Y",     // formato de la fecha que se escriba en el campo de texto 
          button     : "cbfeFinConv"     // el id del botón que lanzará el calendario 
	     });
         </script>	
		 (*) </font>
		 </td>
	   </tr>
	   
	   <tr>
	     <td width="50%">Estado</td>
	      <td width="174" align=left  ><span class="e_td_string">
   
          <SELECT id="txtestado" name="txtestado" class="e_combo" style="width:100px" disabled="true"  >				
					<OPTION value="0">Inactivo</OPTION>
					<OPTION value="1">Activo</OPTION>
					<OPTION value="2">Cerrado</OPTION>
			</SELECT>
				
		 </td>
	   </tr>
	   
        
 
	     <tr>
                <td colspan="4" align="center" >
                <input name="button" type="button" class="boton" id="button" value="Grabar" onClick="ActualizarConvocatoria2();">
                <input name="button" type="button" class="boton" id="button" value="Salir" onclick="Cancelar();">

                </td>
 	     </tr>

	   
	   
	
	</table>
				
	</fieldset>
	
	</form>
</div> 
</body>