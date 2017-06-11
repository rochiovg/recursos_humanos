<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
Response.Buffer = False


id_proyecto=Session("id_proyecto")

lsRol = Session("txtTipoUsuarioValido")

varccdd= Request.Form("lsDPTO")
varccpp = Request.Form("lsPROV")
varccdi = Request.Form("lsDIST")
cargo = Request.Form("lscargo") 
nivel = Request.Form("lsnivel")
valor = Request.Form("tipo")


varccpp = Mid(varccpp,4,2)
varccdi = Mid(varccdi,6,2)



		consulta2 = "exec dbo.pa_verificar_rutas_ece  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "' , '" & nivel & "'"
		
			
	Set RsP2 = Server.CreateObject("ADODB.Recordset")
			RsP2.cursorlocation=3
			RsP2.Open consulta2, MiCone, 3,3

			  if Not RsP2.BOF And Not RsP2.EOF Then 
			  total_asi=RsP2.Fields("total_asig")
			  else 
			  total_asi=0
			  end if 
			  
		RsP2.close 
		Set RsP2 = Nothing


if valor=1 then

		consulta1 = "exec dbo.pa_listar_asignacion_ece  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '" & id_proyecto & "', '" & nivel & "'"
							
	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
	
else 

		if total_asi=0 then 
		'------------COMENTADO
			'if cargo=1616 then 
			'SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' ,'S', '"&cargo&"' , '0' "
			'else 
			'SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria_EIB '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' ,'S', '"&cargo&"' , '0' "
			'end if
			
			'---------------------procesa solo lo faltante
			if cargo=1616 then 
			SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' ,'S', '"&cargo&"' , '1' "
			else 
			SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria_EIB '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' ,'S', '"&cargo&"' , '1' "
			end if
			
			
		else
		
		if cargo=1616 then 
			SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' ,'S', '"&cargo&"' , '1' "
			else 
			SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria_EIB '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' ,'S', '"&cargo&"' , '1' "
			end if
		end if


	Set RSCuad = Server.CreateObject("ADODB.Recordset")
	MiCone.commandtimeout = 10000
	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3


		'RSCuad.close 
		'Set RSCuad = Nothing
		
		
consulta1 = "exec dbo.pa_listar_asignacion_ece  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '" & id_proyecto & "', '" & nivel & "'"
	
	
	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3	
			
			
end if


		
	  If  Not RsP.BOF And Not RsP.EOF Then 
            
        If lscargo<>"0"    then  %>
<style type="text/css">
.titulo {
	text-align: right;
}
</style>

                <table width='100%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
               
                    
                <tr>
                
                <td colspan="13" align="left"><span class="titulo">RRHH Seleccionado : 
                  
                </span></td>
                <td align="left"><span class="titulo">
                  <input  name='button1' type='button' class="boton" id='button1' onclick="javascript:Validacons_asigna_ece()" value='Asignar Ruta' />
                <span class="titulo"></span></span></td>
                </tr>
    <tr style="font-size:11px">
    <th width="4%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">N&deg;</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Sede Regional</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Sede Provincial</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Sede Distrital</th>
    <th width="12%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">COD. MODULAR</th>
    <th width="12%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">IE</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Tipo Cargo</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DNI</th>
    <th width="19%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Nombre </th>
    <th width="19%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Nota Cap. </th>
    <th width="6%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Tipo Operativo</th>
   <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Ruta</th>

 <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Asignaci&oacute;n</th>
 <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Eliminar<br>Asignaci&oacute;n</th>
    
    <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">COD. APLICADOR</th>
    <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">COD. A. SUP.</th>
    <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Pasajes</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Movilidad</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Gastos Op.</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Bonificaci&oacute;n</th>
    </tr>
  <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 	%>
  <tr class='<%=clase%>'>
    <td height="34" class='e_td_string1'><%response.Write(cont)%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("sede_region")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("sede_provincia")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("sededistrital")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("cod_modular")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("nom_ie")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("desc_cargo")%>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("dni")%>&nbsp;</td>
    <td class='e_td_string1' align="left"><%=RsP.Fields("nombres")%>&nbsp;</td>
    <td class='e_td_string1' align="left"><%=RsP.Fields("notacap")%>&nbsp;</td>
    <td class='e_td_string1' align="left"><%=RsP.Fields("tipo_operativo")%></td>
    <td align="center" class='e_td_string1'>
    
     <%
	  Set wRsLocal = Server.CreateObject("ADODB.Recordset")

                        consultaLugar = " exec pa_listar_rutas_ece '"&varccdd&"', '"&varccpp&"', '"&varccdi&"', '"&cargo&"', '"&nivel&"'" 
						
			
                        wRsLocal.CursorLocation=3
                        wRsLocal.Open consultaLugar,Micone,3,3
						
	
if  RsP.Fields("asignado")=1  then
ds="disabled"
ds2=""
else
'ds="disabled"
ds=""
ds2="disabled"
end if					
						
					
						
ima="<div id=""gua"&RsP.Fields("id_per")&""" style=""display:block""><img src=""images/ok.gif"" width=""16"" height=""16"" "&ds&" onclick=""modificarRuta_ece('"&RsP.Fields("id_per")&"','1')""  /></div><div style=""display:none"" id=""gua2"&RsP.Fields("id_per")&"""><img src=""images/ok2.gif"" width=""16"" height=""16""  /></div>"
eli="<img src=""images/Eliminar.gif"" "&ds2&" onclick=""modificarRuta_ece('"&RsP.Fields("id_per")&"','2')""  />"

	
	  Response.Write "<select class=""e_combo"" style=""width:180px""  id=""r"&RsP.Fields("id_per")&""" "&ds&" name=""r"&RsP.Fields("id_per")&""" "&ds&"  >"
    
				 
     			if ds="disabled" then 
					Response.Write " <option  value="""&RsP.Fields("idreg")&""" title="""&RsP.Fields("nom_ie")&" "&RsP.Fields("codigo_cargo")&" - S/. "&RsP.Fields("gasto_operativo_1")&"""> "&RsP.Fields("nom_ie")&" "&RsP.Fields("codigo_cargo")&" - S/. "&RsP.Fields("gasto_operativo_1")&"</option>"
						else 
						Response.Write "<option  value=""0"">Seleccione...</option>"
						end if 
						 
					If not wRsLocal.BOF And not wRsLocal.EOF Then
	 
                        wRsLocal.MoveFirst	

				      Do While not wRsLocal.EOF
					  
					 Response.Write "<option value='"&wRsLocal("idreg")&"' title='" &wRsLocal("ruta")&" - S/. " &wRsLocal("total")& "'> "&wRsLocal("nom_ie")&" "&wRsLocal("ruta")&" - S/. "&wRsLocal("total")&"</option>"    

                            wRsLocal.MoveNext
                        loop
						else 
						Response.Write " <option  value=""0"">Sin ruta disponible"&ds&"</option>"
						end if
                        Response.Write "</select>"
                    
                        Set wRsLocal = Nothing
	%>
    
    
   </td>
  <td align="center" class='e_td_string1'><%=ima%>&nbsp;</td>
  <td align="center" class='e_td_string1'><%=eli%>&nbsp;</td>
   <td align="center" class='e_td_string1'><%=RsP.Fields("codigo_cargo")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("codigo_cargo_A")%>&nbsp;</td>
    
    <td align="center" class='e_td_string1'><%=RsP.Fields("pasaje_1")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("movilidad_1")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("gasto_operativo_1")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("bonificacion_1")%></td>    
    <% 
		registro = registro + 1
		RsP.MoveNext
		Loop	
		RsP.close 
		Set RsP = Nothing
		%>
  </tr>
            </table>
<%end if
		 
else %>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles.</td>
                  </tr>
                </table>
                
		<% end If %>
          

