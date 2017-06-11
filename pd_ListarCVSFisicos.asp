<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!-- #include file="Conexion.asp"       --> 

<%

 id_usuario=  Session("id_usuario")
 id_proy=  request.form("id_proy")
 
 txtDpto1=Request("txtDpto1") 
 txtProv1=Request("txtProv1") 
 txtDist1=Request("txtDist1") 
 ltotal = 0 
 
 
 txtConvocartoria=Request("txtConvocartoria") 
 
Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_ListarCVFisicos '"&id_proy&"', "&txtConvocartoria&", '"&txtDpto1&"','"&txtProv1&"','"&txtDist1&"'")
	
	'response.Write(" exec dbo.uspGet_ListarCVFisicos '"&id_proy&"', "&txtConvocartoria&", "&txtDpto1&","&txtProv1&","&txtDist1)
	'response.end()
	
	
response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
response.Write " <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
response.Write " <td width=""10%"">Sede Regional</td>"
response.Write " <td width=""10%"">Sede Provincial</td>"
response.Write " <td width=""10%"">Sede Distrital</td>"
response.Write " <td width=""13%"">Cargo</td>"
response.Write " <td width=""5%"">Convocatoria</td>"
response.Write " <td width=""5%"">Nro CVS</td>"
response.Write " <td width=""10%"">Fec.Reg.</td>"
response.Write " <td width=""5%""></td>"
response.Write " </tr> </table>"

	


While not wRsDptoapli.EOF
 response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
 response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
 response.Write" <tr class=""dato3"">"
 response.Write "<td width=""10%"">" & wRsDptoapli("Sede_region") & "</td>"
 response.Write "<td width=""10%"">" & wRsDptoapli("Sede_provincia") & "</td>"
 response.Write "<td width=""10%"" align=""center"">" & wRsDptoapli("SedeDistrital2") & "</td>"
 response.Write "<td width=""13%"" align=""center"">" & wRsDptoapli("cargo") & " </td>"
 response.Write "<td width=""5%"" align=""center"">" & wRsDptoapli("id_convocatoriacargo") & "</td>"
 response.Write "<td width=""5%"" align=""center"">" & wRsDptoapli("nro_cvs") & "</td>"
 response.Write "<td width=""10%"" align=""center"">" & wRsDptoapli("fec_reg") & "</td>"
   ltotal =  cint(ltotal ) +  CInt(wRsDptoapli("nro_cvs"))
   
 
'  response.Write "<td width=""5%"" align=""center""> </td>"
' response.Write "<td width=""5%"" align=""center""> </td>"
' response.Write "<td width=""5%"" align=""center""> </td>"
 
 
  

Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/eliminar.png"" style=""CURSOR:HAND"" alt=""Eliminar"" onclick=""EliminarReg('"&wRsDptoapli("id")&"')"" ></img></td>"


'Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/ampliar.jpg"" width=""16"" height=""16""  style=""CURSOR:HAND"" alt=""Ampliar"" onclick=""ampliarConvocatoria('"&wRsDptoapli("num_Convocatoria")&"','"&id_usuario&"')"" > </img></td>"
'Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/resultados1.png"" width=""16"" height=""16""  style=""CURSOR:HAND"" alt=""Publicar comunicado"" onclick=""publicarComunicado('"&wRsDptoapli("num_Convocatoria")&"')"" > </img></td>"


response.Write "</tr>"
wRsDptoapli.MoveNext
	Wend
	
	if ltotal>0 then
	
	 response.Write" <tr class=""dato3"">"
 response.Write "<td width=""10%""> </td>"
 response.Write "<td width=""10%""> </td>"
 response.Write "<td width=""10%""> </td>"
 response.Write "<td width=""13%""> </td>"
 response.Write "<td width=""5%""> </td>"
 response.Write "<td width=""5%"" align=""center"">"&ltotal& "</td>"
 response.Write "<td width=""10%""> </td>"

 response.Write "</tr>"
 	end if
 
 
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

%>

<script>




function EliminarReg(id)
{



  if (confirm('¿Esta Seguro de Eliminar el Registro?')==true )
 
	{ 
	

    var valores="id="+id;


		
	var peticion=$.ajax(
		{
		
	     url:"pd_EliminarCVFisicos.asp",
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
			  alert('No se puede eliminar el registro.'); 

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


