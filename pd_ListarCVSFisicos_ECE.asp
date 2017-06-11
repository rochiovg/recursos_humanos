<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!-- #include file="Conexion.asp"       --> 

<%


 ltotal = 0 
 
  
  
 lsUsuario =  Session("txtNombreValido")
 txtDpto1=Request("txtDpto1") 
 txtProv1=Request("txtProv1") 
 txtDist1=Request("txtDist1") 
 txtConvocartoria=Request("txtConvocartoria") 
 cmbCargo=Request("cmbCargo")
 txtnumcvs=Request("txtnumcvs")
 txtdni=Request("txtdni")
 txtFOLIO=Request("txtFOLIO")
 txtNROREG=Request("txtNROREG")
 
  id_proyecto=  Session("id_proyecto")
  
  id_rol=Session("txtTipoUsuarioValido")
  
  
  sql= " Exec dbo.ListaCVSFisicos_DNI	 '"&txtDpto1&"','"&txtProv1&"','"&txtDist1&"',"&txtConvocartoria&",'"&txtdni&"',"&id_proyecto&", '"&lsUsuario&"';" 
 
' response.write(sql)

 
Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(sql)
	
	'response.Write(" exec dbo.uspGet_ListarCVFisicos '"&id_proy&"', "&txtConvocartoria&", "&txtDpto1&","&txtProv1&","&txtDist1)
	'response.end()
	
	
	
	 
response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
response.Write " <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
response.Write " <td width=""10%"">NRO REG</td>"
response.Write " <td width=""10%"">DNI</td>"
response.Write " <td width=""10%"">PERSONA</td>"
response.Write " <td width=""13%"">ESTADO</td>"
response.Write " <td width=""5%"">FOLIO</td>"
response.Write " <td width=""5%"">USU. RECEP</td>"
response.Write " <td width=""10%"">FEC. RECEP</td>"
'response.Write " <td width=""5%""></td>"
response.Write " </tr> </table>"

	

if  wRsDptoapli.EOF then


response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
 response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
 response.Write" <tr class=""dato3"">"
 response.Write "<td width=""10%"">" & "" & "</td>"
 response.Write "<td width=""10%"">" & ""& "</td>"
 response.Write "<td width=""10%"" align=""center"">" & ""& "</td>"
 response.Write "<td width=""13%"" align=""center"">" & "NO EXISTE LA PERSONA REGISTRADA EN ESTA CONV." & " </td>"
 response.Write "<td width=""5%"" align=""center"">" & "" & "</td>"
 response.Write "<td width=""5%"" align=""center"">" & "" & "</td>"
 response.Write "<td width=""10%"" align=""center"">" & "" & "</td>"
Response.Write "  </table>"
 
 
else


While not wRsDptoapli.EOF
 response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
 response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
 response.Write" <tr class=""dato3"">"
 response.Write "<td width=""10%"" align=""center"">" &  wRsDptoapli("NRO_REG_RECEP") & "</td>"
 response.Write "<td width=""10%"" align=""center"">" & txtdni & "</td>"
 response.Write "<td width=""10%"" align=""center"">" & wRsDptoapli("des_persona")    & "</td>"
 response.Write "<td width=""13%"" align=""center"">" & wRsDptoapli("ESTADO")    
if id_rol = 31 then
response.write  "<img src='images/eliminar.png' style=CURSOR:HAND alt='Eliminar' onClick='EliminarReg("&wRsDptoapli("id_per")&","&id_proyecto&","&wRsDptoapli("id_convocatoriacargo")&")'></img>"
end if
 
 response.write " </td>"
 response.Write "<td width=""5%"" align=""center"">" &wRsDptoapli("folio_recep") & "</td>"
 response.Write "<td width=""5%"" align=""center"">" & wRsDptoapli("US_RECEP")& "</td>"
 response.Write "<td width=""10%"" align=""center"">" &  wRsDptoapli("fec_recep")  & "</td>"
 
 
 
 
   
 
'  response.Write "<td width=""5%"" align=""center""> </td>"
' response.Write "<td width=""5%"" align=""center""> </td>"
' response.Write "<td width=""5%"" align=""center""> </td>"
 
 
  

'Response.Write "<td width=""5%"" align=""center"" class=""alt1""  ><img src=""images/eliminar.png"" style=""CURSOR:HAND"" alt=""Eliminar"" onclick=""EliminarReg('"&wRsDptoapli("id")&"')"" ></img></td>"



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
	
end if	

%>

<script>




function EliminarReg(id_per, id_proyecto, id_convocatoriacargo)
{


  if (confirm('¿Esta Seguro de Anular la recepción?')==true )
 
	{ 
	

    var valores="id_per="+id_per+"&id_proyecto="+id_proyecto+"&id_convocatoriacargo="+id_convocatoriacargo;


		
	var peticion=$.ajax(
		{
		
	     url:"pd_EliminarCVFisicos_dni.asp",
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


