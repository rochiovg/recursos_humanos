<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"       --> 


<!--#include file="Include/pd_Funcion.asp"-->
<!--#include file="cabecera.html"-->
<!--#include file="pd_menu.asp"-->
          
<%
 id_usuario=  Session("id_usuario")
 idProyecto=Session("id_proyecto")

Response.ContentType="text/html; charset=iso-8859-1"
	
	registro=1
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_ConvocatoriaDirectorio '"&idProyecto&"', '' ")

 	response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
	response.Write " <td width=""3%"">Nº</td>"
    response.Write " <td >Número de <br>Convocatoria</td>"
    response.Write "    <td>Convocatoria</td>"
	response.Write "    <td>Cargo Funcional</td>"
	response.Write "    <td>Periodo</td>"
	response.Write "    <td>Sueldo</td>"
    response.Write "    <td >Fecha Inicio</td>"
	response.Write "    <td >Fecha Fin</td>"
	response.Write "    <td width=""3%"">Fecha Fin <br>Proceso Selección</td>"
	response.Write "    <td>Estado</td>"
	response.Write "    <td>Editar</td>"
	response.Write "    <td>Datos<br>Ficha</td>"
	response.Write "    <td>Ver TDR</td>"
	response.Write "    <td>Activar<br>Test</td>"
	response.Write "    <td>Eliminar</td>"
    response.Write "  </tr>"


	
While not wRsDptoapli.EOF

 response.Write" <tr class=""dato3"">"

 response.Write "<td align=""center"">" & registro & "</td>"
 Response.Write "<input type=""hidden"" name=""ubigeo"" value="& wRsDptoapli("Id_ConvocatoriaCargo") &">" 
 response.Write "<td align=""center"">" & wRsDptoapli("num_Convocatoria") & "</td>"
 response.Write "<td>" & wRsDptoapli("Desc_Convocatoria") & "</td>"
 response.Write "<td>" & wRsDptoapli("desc_CargoFuncional") & "</td>"
 response.Write "<td>" & wRsDptoapli("PerTotal") & "</td>"
 response.Write "<td>" & wRsDptoapli("SUEL_CARG") & "</td>"
 response.Write "<td align=""center"">" & wRsDptoapli("fechaInicio") & "</td>"
 response.Write "<td align=""center"">" & wRsDptoapli("fechaFin") & "</td>"
 response.Write "<td align=""center"">" & wRsDptoapli("fechaFinProcesoSel") & "</td>"
 response.Write "<td>" & wRsDptoapli("estadodes") & "</td>"
 
 
 'Editar
 if wRsDptoapli("estado")="2" then
Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/cierre.png"" ></img></td>"
 
else
Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/edita.PNG"" style=""CURSOR:HAND"" alt=""Editar"" onclick=""window.open('pd_EditarConvocatoria.asp?lsIdConvocatoriaCargo="&wRsDptoapli("Id_ConvocatoriaCargo")&"')"" ></img></td>"
end if  

 'Datos Ficha
 if wRsDptoapli("estado")="2" then
Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/cierre.png"" ></img></td>"
 
else
Response.Write "<td align=""center"" class=""alt1""  ><img  src=""images/resultados1.png"" height=""18px"" width=""16px"" style=""CURSOR:HAND"" alt=""Editar"" onclick=""window.open('pd_EditarConvocatoria.asp?lsIdConvocatoriaCargo="&wRsDptoapli("Id_ConvocatoriaCargo")&"')"" , ""_blank"" ></img></td>"
end if  

' ver

Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/edita.PNG"" style=""CURSOR:HAND"" alt=""Ver"" onclick=""window.open('ver_tdr.asp?id="&wRsDptoapli("Id_ConvocatoriaCargo")&"')"" ></img></td>"  
  
 
  
  ' Modificar Ubigeo
if wRsDptoapli("ProcesoActual")="3"  then
	
	if wRsDptoapli("Momento_Test")="2" or wRsDptoapli("Momento_psico")="2"  then

  
	  	if wRsDptoapli("activar_competencias")="0" and  wRsDptoapli("activar_conocimientos")="0" then 
		
	  	Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/resultados1.png"" style=""CURSOR:HAND"" width=""16"" height=""18"" alt=""Editar Ubigeo"" onclick=""ActivarTest('"&wRsDptoapli("Id_ConvocatoriaCargo")&"', '1')"" ></img> </td>"
	
		elseif wRsDptoapli("activar_competencias")="1" or wRsDptoapli("activar_conocimientos")="1" then 
		
		Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/resultados.png"" style=""CURSOR:HAND"" width=""16"" height=""18"" alt=""Editar Ubigeo"" onclick=""ActivarTest('"&wRsDptoapli("Id_ConvocatoriaCargo")&"', '2')"" ></img> </td>"
		else 
			Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/cierre.png""  ></img> </td>"
		end if 
 	end if 
else
	Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/cierre.png""  ></img> </td>"
end if  

  
  ' Eliminar
if ((wRsDptoapli("estado")="1") OR (wRsDptoapli("estado")="2")) then
Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/cierre.png"" ></img></td>"
 
else
Response.Write "<td align=""center"" class=""alt1""  ><img src=""images/eliminar.png"" style=""CURSOR:HAND"" alt=""Eliminar"" onclick=""EliminarRegConvCargo('"&wRsDptoapli("Id_ConvocatoriaCargo")&"')"" ></img></td>"
end if 
 
response.Write "</tr>"
wRsDptoapli.MoveNext
registro=registro+1

	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing



%>


<script>

function ActivarTest(id_cc, flag){
	
	if (flag==1) 
		mensaje="Esta seguro de Activar los test?"
	else 
		mensaje="Esta seguro de desactivar los test?"

	if (confirm(mensaje)) {
	var valores="id_cc="+id_cc+"&flag="+flag+"&lsTipo=108";
	var peticion=$.ajax(
		{
		
	     url:"m_ingreso.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#divDetalle2").html("Cargando...");
							  },
		success:function (respuesta) {
								
								$("#divDetalle2").html("");
								if (flag==1)
									alert("Se activaron los test correctamente")						
								else 
									alert("Se desactivaron los test correctamente")
								MostrarConvocatoriaCargo();				
									 } ,
		error:function (){
			  alert('Se a producido un Error'); 
			  $("#divDetalle2").html("");
						}
		}
		);
	}
	else
	return false;
}

function EliminarRegConvCargo(Id_ConvocatoriaCargo)
{
  if (confirm('¿Esta Seguro de Eliminar el Registro?')==true )
	{ 
	var valores="Id_ConvocatoriaCargo="+Id_ConvocatoriaCargo+"&lsTipoReg=2";
	var peticion=$.ajax(
		{
		
	     url:"pd_EliminarConvocatoria.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#divDetalle2").html("Eliminando...");
							  },
		success:function (respuesta) {
								
								$("#divDetalle2").html("");
								
                                MostrarConvocatoriaCargo();								
									
											
									 } ,
		error:function (){
			  alert('Se a producido un Error'); 
			  $("#divDetalle2").html("");
						}
		}
		);
   }
}


function publicarResultados(Id_ConvocatoriaCargo, valor)
{
	
  if (confirm('¿Esta Seguro de Publicar / Ocultar los Resultados?')==true )
	{ 
	var valores="Id_ConvocatoriaCargo="+Id_ConvocatoriaCargo+"&valor="+valor+"&lsTipo=77";
	var peticion=$.ajax(
		{
		
	     url:"m_ingreso.asp",
		 timeout:7000,
		 type:'POST',
		 contentType: "application/x-www-form-urlencoded",
         data:valores,
         beforeSend: function(){
								$("#divDetalle2").html("Procesando...");
							  },
		success:function (respuesta) {
								
								$("#divDetalle2").html("");
								
                                MostrarConvocatoriaCargo();								
									
											
									 } ,
		error:function (){
			  alert('Se a producido un Error'); 
			  $("#divDetalle2").html("");
						}
		}
		);
   }
}


</script>

