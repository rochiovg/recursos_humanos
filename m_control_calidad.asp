<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"

 usuario=Session("id_usuario")
 
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
nivelrrhh=Request.Form("nivelrrhh")

lsConvocaroria=Request.Form("lsConvocaroria")

idProyecto=Session("id_proyecto")
id_usuario=  Session("id_usuario")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

lsCargo = Mid(plscargo,2)
tipocargo = Mid(plscargo,1,1)

	
	'consulta1 = "EXEC dbo.uspGet_DatosConocimientos '" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & tipocargo & "', '" & idProyecto & "','"&lsConvocaroria&"'" 

	consulta1 = "EXEC listar_inscripcion_censo '" & plsCargo & "','"&lsConvocaroria&"' "

	
	'consulta1 = "EXEC listar_inscripcion_censo '7954' ,'3948' "
	
	
	
	Set RsP = Server.CreateObject("ADODB.Recordset")
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3


	If  Not RsP.BOF And Not RsP.EOF Then  
	  
	%>
	<form name="elform" id="elform" METHOD="POST" ACTION="pd_continuidad_contrato.asp">
	<table width='100%' border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
	<tr>
                  <td colspan="20" align="center"><span class="titulo"><span class="e_td_string1">Control de Calidad
                        <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=usuario%>" />
                  </span></span></td>
                </tr>
    <tr style="font-size:9px">
      <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>
      <th width="16%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px"><span class="dato" style="font-size:10px"><span class="dato" style="font-size:10px"><span class="dato3">NRO. DE CONVOCATORIA</span></span></span></span></th>
     <th width="21%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO FUNCIONAL </th>
  <th width="14%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px"><span class="dato3"><span class="dato" style="font-size:10px">DNI</span></span></span></th>
    <th width="25%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px"><span class="dato" style="font-size:10px">NOMBRE</span></span></th>
	<th width="25%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px"><span class="dato" style="font-size:10px">VER FICHA</span></span></th>
     <th width="14%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">APROBADO</th>     
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
    <td height="34" class='e_td_string1'><%response.Write(cont)%></td>
    <td class='e_td_string1'></td>	
    <td class='e_td_string1'><%=RsP.Fields("cargo_funcional")%></td> 

     <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
    <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
	<%
'		consulta2 = "EXEC dbo.pa_ficha_datosCV '" & RsP.Fields("dni") & "', '" & id_proyecto & "'" 
'		Set RsP2 = Server.CreateObject("ADODB.Recordset") 
'		RsP2.cursorlocation=3
'		RsP2.Open consulta2, MiCone, 3,3
'		
'		If  Not RsP2.BOF And Not RsP2.EOF Then 					
'    	Do While Not RsP2.EOF
	
	%>
	<td>
		<button type="button" class="btn btn-primary btn-md" onClick="window.open('declaracion.asp?id=<%=lsConvocaroria%>&p=<%=idProyecto%>&dni=<%=RsP.Fields("dni")%>')" target="_blank">Ver Ficha</button>


	</td>
	<%
'			RsP2.MoveNext
'			Loop	
'			RsP2.close 
'		end If 
	%>
	<td bordercolor="#DAE8F3" class='e_td_string1'><div id="chek" style="display:none"></div>

	<input id="ch<%=RsP.Fields("dni")%>" type="checkbox" name="boletin"<%if RsP.Fields("control_calidad")=1 then %> checked="checked" <%end if%>onClick="javascript:grabar_continuidad('<%=RsP.Fields("dni")%>',this.id)">

</td>
	<% 
		registro = registro + 1
		dato2 = dato2+1 %>
    <%		RsP.MoveNext
		Loop	
		RsP.close %>
  </tr>
</table>
           
<% else %>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles</td>
                  </tr>
</table>
</form>
		<% end If	 %>