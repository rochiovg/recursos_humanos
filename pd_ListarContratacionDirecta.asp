<%@ Language=VBScript %>
<!--#include file="Include/pd_funcion.asp"--> 
<!-- #include file="Conexion.asp"       --> 

<%

 id_usuario=  Session("id_usuario")
 id_proy=  request.form("id_proy")
 
Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_listar_ContContratos '"&id_proy&"'  ")

	response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
registro = 0	
While not wRsDptoapli.EOF
cont = registro+1 


 response.Write" <tr class=""dato3"">"
 response.Write "<td width=""3%"" >" &cont& "</td>"
 response.Write "<td width=""30%"" >" & wRsDptoapli("cargo") & "</td>"
 response.Write "<td width=""5%"" >" & wRsDptoapli("PEA_CONVOCATORIA") & "</td>"
 response.Write "<td width=""5%"" >" & wRsDptoapli("PER_CC") & "</td>"
 response.Write "<td width=""8%""  align=""center"">" & wRsDptoapli("fecIns") & "</td>"
 response.Write "<td width=""37%""  align=""center"">http://consecucion.inei.gob.pe/recluta/logueo.asp?id="& wRsDptoapli("id_Convocatoriacargo")&"&p="&wRsDptoapli("id_proyecto")&"</td>"
 response.Write "<td width=""5%""  align=""center""><img alt=""Ver PEA Inscrita"" border=""0"" height=16 width=16 src=""images/PEA1.ico""   onClick=""javascript:ver_PEAInscrita('"&wRsDptoapli("id_Convocatoriacargo")&"')"" >"&"</td>"
 
    if wRsDptoapli("estado")="1" then
Response.Write "<td width=""4%""  align=""center"" class=""alt1""  ><img src=""images/add.png"" style=""CURSOR:HAND"" alt=""Publicar"" onclick=""ActivarContratacion('"&wRsDptoapli("id_Convocatoriacargo")&"', '"&wRsDptoapli("estado")&"')"" ></img></td>"
elseif (wRsDptoapli("estado")="2" or wRsDptoapli("estado")="0") then
Response.Write "<td width=""4%""  align=""center"" class=""alt1""  ><img src=""images/ok.gif""  style=""CURSOR:HAND"" alt=""Publicar"" onclick=""ActivarContratacion('"&wRsDptoapli("id_Convocatoriacargo")&"', '"&wRsDptoapli("estado")&"')"" ></img></td>"
end if 
 
 if ((wRsDptoapli("estado")="1") OR (wRsDptoapli("estado")="2")) then
Response.Write "<td width=""4%""  align=""center"" class=""alt1""  ><img src=""images/cierre.png""  ></img></td>"
 
else
Response.Write "<td width=""4%""  align=""center"" class=""alt1""  ><img src=""images/eliminar.png"" style=""CURSOR:HAND"" alt=""Eliminar"" onclick=""EliminarRegConvCargo('"&wRsDptoapli("Id_ConvocatoriaCargo")&"')"" ></img></td>"
end if  
 
 
 
 if ((wRsDptoapli("estado_convocatoria")="4")) then
Response.Write "<td width=""4%""  align=""center"" class=""alt1""  ><img src=""images/ampliar.jpg"" width=20 height=20 style=""CURSOR:HAND"" alt=""Reasignar Ubigeo"" onclick=""AsignaUbigeo('"&wRsDptoapli("Id_ConvocatoriaCargo")&"')"" ></img></td>"
else
Response.Write "<td width=""4%""  align=""center"" class=""alt1""  ></td>"
end if  
 
 
 
 response.Write "</tr>"

registro = registro + 1
wRsDptoapli.MoveNext
	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

%>

<script>



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



function ver_PEAInscrita(lsIdConvocatoriaCargo){
	
	 pagina = "pd_PEA_Inscrita.asp?lsIdConvocatoriaCargo="+lsIdConvocatoriaCargo;
	win = window.open(pagina,'','scrollbars=yes,resizable=yes');	
	}

</script>


