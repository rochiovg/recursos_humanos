<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
Response.Buffer = False


idProyecto=Session("id_proyecto")

lsRol = Session("txtTipoUsuarioValido")

varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lscargo = Request.Form("lscargo") 
lsUsuario = Request.Form("lsUsuario")
valor=request("valor")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)


cantvarCargoTot=len(lscargo)
nomcargo = Mid(lscargo,3,cantvarCargoTot-2)
cargo = Mid(lscargo,2)



				

	SQLContCapac = "EXEC dbo.usp_verificaAsigRutas '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & Cargo & "'" 




	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	

	If wRsDataCapc(0) = 0 Then 
		contit	="0"
		
	else
		contit	=1
	End if

	varv=""
if contit = 1 then
	varv = "disabled=""disabled"""
else
	varv= " "
end if

response.write("valor")
response.write(valor)

if valor=1 then

		consulta1 = "exec dbo.uspGet_Asignacion  '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' , '"&cargo&"', '"&idProyecto&"'"	
		
	response.write(consulta1)
	
	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
else 

	SQL1 = "exec dbo.usp_asignacionRutas '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' , '"&cargo&"' , '"&lsUsuario&"', '"&idProyecto&"' "	

	response.write(SQL1)
	

	
	Set RSCuad = Server.CreateObject("ADODB.Recordset")

	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3



	consulta1 = "exec dbo.uspGet_Asignacion  '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' , '"&cargo&"', '"&idProyecto&"'"	


	
	
	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3	
			
			
end if


		
	  If  Not RsP.BOF And Not RsP.EOF Then 
            response.write("lkjlkjlkjlkjljk")
        If lscargo<>"0"    then 
		
		response.write("lkjlkjlkjlkjljkcccccccccccccccccccccc")
		
		 %>
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
                  <input  name='button1' type='button' class="boton" id='button1' onclick="javascript:Validacons_asigna('2','2')" value='Asignar Ruta' />
                <span class="titulo"></span></span></td>
                </tr>
                
    <tr style="font-size:11px">
    <th width="4%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">N&deg;</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DNI</th>
    <th width="19%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Nombre </th>
    <th width="19%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Tipo contrato </th>
    <th width="6%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Nota Cap. </th>
   <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Ruta</th>

 <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Asignaci&oacute;n</th>
 <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Eliminar<br>Asignaci&oacute;n</th>
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Nro. de Brigada</th>
    <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Nro. de <span class="e_td_string1">Ruta</span></th>
    <th width="12%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Area</th>
    <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total Primer Envio</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total Segundo Envio</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total Tercer Envio</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total Cuarto Envio</th>
    <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Total</th>
     <% if lsUsuario=1 or lsusuario=707 then %>
     <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Retiro Primer<br>Desembolso</th>
     <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Retiro Segundo<br>Desembolso</th>
     <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Retiro Tercer<br>Desembolso</th>
     <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Retiro Cuarto<br>Desembolso</th>
    <%end if%>
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
    <td class='e_td_string1'><%=RsP.Fields("dni")%>&nbsp;</td>
    <td class='e_td_string1' align="left"><%=RsP.Fields("nombre")%>&nbsp;</td>
    <td class='e_td_string1' align="left"><%=RsP.Fields("tipo_contrato")%>&nbsp;</td>
    <td class='e_td_string1' align="left"><%=RsP.Fields("notacap")%></td>
    <td align="center" class='e_td_string1'>
    <%
	  Set wRsLocal = Server.CreateObject("ADODB.Recordset")

                        consultaLugar = " exec uspGet_Ruta '"&varccdd&"', '"&varccpp&"', '"&varccdi&"', '"&cargo&"'" 
						
						

                        wRsLocal.CursorLocation=3
                        wRsLocal.Open consultaLugar,Micone,3,3
						
	
if  RsP.Fields("asignado")=1 or RsP.Fields("asignado")=2 or RsP.Fields("asignado")=3  then
ds="disabled"
else
'ds="disabled"
ds=""
end if					
						
						
ima="<div id=""gua"&RsP.Fields("id_per")&""" style=""display:block""><img src=""images/ok.gif"" width=""16"" height=""16"" "&ds&" onclick=""guardarRuta('"&RsP.Fields("ccdd_i")&"','"&RsP.Fields("ccpp_i")&"','"&RsP.Fields("ccdi_i")&"','"&RsP.Fields("id_per")&"','"&RsP.Fields("cargo")&"','"&lsUsuario&"','"&RsP.Fields("id_contratos")&"')""  /></div><div style=""display:none"" id=""gua2"&RsP.Fields("id_per")&"""><img src=""images/ok2.gif"" width=""16"" height=""16""  /></div>"
eli="<img src=""images/Eliminar.gif"" onclick=""eliminar_ruta('"&RsP.Fields("id_asignacion")&"', '"&RsP.Fields("id_per")&"')""  />"

	
	  Response.Write "<select class=""e_combo"" style=""width:180px""  id=""r"&RsP.Fields("id_per")&""" "&ds&" name=""r"&RsP.Fields("id_per")&""" "&ds&"  >"
       response.write(cargo)           
				 
     			if ds="disabled" then 
					Response.Write " <option  value=""0"" title="""&RsP.Fields("ruta")&" - S/. "&RsP.Fields("total")&"""> "&RsP.Fields("ruta")&" - S/. "&RsP.Fields("total")&"</option>"
						else 
						Response.Write "<option  value=""0"">Seleccione...</option>"
						end if 
						 
					If not wRsLocal.BOF And not wRsLocal.EOF Then
	 
                        wRsLocal.MoveFirst	

				      Do While not wRsLocal.EOF
					  
					 Response.Write "<option value='" & wRsLocal("ruta")&"' title='" &wRsLocal("ruta1")&" - S/. " &wRsLocal("total")& "'> "&wRsLocal("ruta1")&" - S/. "&wRsLocal("total")&"</option>"    

                            wRsLocal.MoveNext
                        loop
						else 
						Response.Write " <option  value=""0"">Sin ruta disponible"&ds&"</option>"
						end if
                        Response.Write "</select>"
                    
                        Set wRsLocal = Nothing
	%></td>
  <td align="center" class='e_td_string1'><%=ima%>&nbsp;</td>
  <td align="center" class='e_td_string1'><%=eli%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("brigada")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("empadronador")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("tipo")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("pe_total")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("se_total")%>&nbsp;</td>
    <td align="center" class='e_td_string1'><%=RsP.Fields("te_total")%>&nbsp;</td>
    <td align="center" class='e_td_string1'>&nbsp;<%=RsP.Fields("ce_total")%></td>
    <td align="center" class='e_td_string1'>&nbsp;<%=RsP.Fields("total")%></td>
    
      <% if lsUsuario=1 or lsUsuario=707 then
   
   
   	  if RsP.Fields("SE_ASIGNADO")=3 then
   		varvis="disabled"
	  else
	   varvis="enabled"
	  end if	
   
   %>
    
    
    <td align="center" class='e_td_string1'>&nbsp;<input name="<%=RsP.Fields("id_segm")%>"  type="checkbox" id="<%=RsP.Fields("id_segm")%>" value="2" <% if RsP.Fields("asignado") ="2" then response.Write("checked=""checked""") end if %> onclick="bloqueo_ruta(this.id,this.value)" /><div style="display:none" id="<%="divR"&RsP.Fields("id_segm")%>"></div></td>
 
    <td align="center" class='e_td_string1' ><input name="<%="S"&RsP.Fields("id_segm")%>" type="checkbox" id="<%="S"&RsP.Fields("id_segm")%>" value="2" <% if RsP.Fields("SE_ASIGNADO") ="2" then response.Write("checked=""checked""") end if %> onclick="bloqueo_rutaSE(this.id,this.value)" /><div style="display:block" id="<%="divRS"&RsP.Fields("id_segm") %>"></div></td>
    
    <td align="center" class='e_td_string1' ><input name="<%="S"&RsP.Fields("id_segm")%>" type="checkbox" id="<%="S"&RsP.Fields("id_segm")%>" value="2" <% if RsP.Fields("TE_ASIGNADO") ="2" then response.Write("checked=""checked""") end if %> onclick="bloqueo_rutaTE(this.id,this.value)" /><div style="display:block" id="<%="divRS"&RsP.Fields("id_segm") %>"></div></td>
    
    <td align="center" class='e_td_string1' ><input name="<%="S"&RsP.Fields("id_segm")%>" type="checkbox" id="<%="S"&RsP.Fields("id_segm")%>" value="2" <% if RsP.Fields("CE_ASIGNADO") ="2" then response.Write("checked=""checked""") end if %> onclick="bloqueo_rutaCE(this.id,this.value)" /><div style="display:block" id="<%="divRS"&RsP.Fields("id_segm") %>"></div></td>
    <% end if
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
          

