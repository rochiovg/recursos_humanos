<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!-- #include file="Conexion.asp"       --> 

<%

 id_usuario=  Session("id_usuario")
 id_proy=  request.form("id_proy")
 
Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_ListarConvocatoria '"&id_proy&"'  ")

While not wRsDptoapli.EOF
 response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
 response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
 response.Write" <tr class=""dato3"">"
 response.Write "<td width=""10%"">" & wRsDptoapli("num_Convocatoria") & "</td>"
 response.Write "<td width=""32%"">" & wRsDptoapli("Desc_Convocatoria") & "</td>"
 response.Write "<td width=""10%"" align=""center"">" & wRsDptoapli("fechaInicio") & "</td>"
 response.Write "<td width=""13%"" align=""center"">" & wRsDptoapli("fechaFin") & " - " & wRsDptoapli("hora_fin") & " Horas</td>"
 response.Write "<td width=""5%"" align=""center"">" & wRsDptoapli("estadodes") & "</td>"
 
   if ((wRsDptoapli("estado")="1") OR (wRsDptoapli("estado")="2")) then
Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/cierre.png"" ></img></td>"
 
else
Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/ok.gif"" style=""CURSOR:HAND"" alt=""Publicar"" onclick=""VerificarConvocatoria('"&wRsDptoapli("num_Convocatoria")&"','"&id_usuario&"')"" ></img></td>"
end if 
 
if ((wRsDptoapli("estado")="1") OR (wRsDptoapli("estado")="2")) then
Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/cierre.png"" ></img></td>"
 
else
Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/eliminar.png"" style=""CURSOR:HAND"" alt=""Eliminar"" onclick=""EliminarReg('"&wRsDptoapli("num_Convocatoria")&"')"" ></img></td>"
end if  
Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/ampliar.jpg"" width=""16"" height=""16""  style=""CURSOR:HAND"" alt=""Ampliar"" onclick=""ampliarConvocatoria('"&wRsDptoapli("num_Convocatoria")&"','"&id_usuario&"')"" > </img></td>"
Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/resultados1.png"" width=""16"" height=""16""  style=""CURSOR:HAND"" alt=""Publicar comunicado"" onclick=""publicarComunicado('"&wRsDptoapli("num_Convocatoria")&"')"" > </img></td>"


response.Write "</tr>"
wRsDptoapli.MoveNext
	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

%>

<script>




function EliminarReg(num_Convocatoria)
{



  if (confirm('¿Esta Seguro de Eliminar el Registro?')==true )
 
	{ 
	

    var valores="num_Convocatoria="+num_Convocatoria+"&lsTipoReg=1";


		
	var peticion=$.ajax(
		{
		
	     url:"pd_EliminarConvocatoria.asp",
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
                                       ActualizarNumConvocatoria();


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


function VerificarConvocatoria(Id_ConvocatoriaCargo,usuario)
{
	
	var valores="Id_ConvocatoriaCargo="+escape(Id_ConvocatoriaCargo)+"&lsTipo=71";

	
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
								
								$("#divDetalle2").html("");
							
                               		if(respuesta==0){
									alert("No se puede publicar por que no existen cargos asociados a la convocatoria");		
									return false;
									} 
									else
									
									PublicarConvCargo(Id_ConvocatoriaCargo,usuario);
							
									 } ,
		error:function (){
			  alert('Se a producido un Error'); 
			  $("#divDetalle2").html("");
						}
		}
		);
 
}



</script>


