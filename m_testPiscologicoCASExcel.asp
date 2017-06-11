<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_F2.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 

	lsProceso=Request("lsProceso")
	id_proyecto=1
	
		
	SQL1 = "exec dbo.pa_resp_cuestionario2_CAS '" & lsProceso & "', '1' "	
	

	Set RSCuad = Server.CreateObject("ADODB.Recordset")

	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3
	
	
	If Not RSCuad.BOF And Not RSCuad.EOF Then
	
	
	
	
%>

	
	<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3">
		<tr>
			<td colspan="16" >
				<span class="titulo">EVALUACI&Oacute;N DE TEST PSICOL&Oacute;GICO - CONTRATACI&Oacute;N CAS<span class="e_td_string1">
						<input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
					</span>
				</span></td>
		</tr>
        		<tr>

			<td align="right" colspan="16" >&nbsp;</td>
		</tr>

        
		<tr style="font-size:9px;">
			<th width="4%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Nro</th>
        	<th width="39%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Nombre</th>             		
			<th width="9%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">DNI</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Proceso</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Cargo</th>
            <th width="7%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Estado</th>
		</tr>
		<%
			registro = 0
			contadorSeleccion = 0
			
			Do While Not RSCuad.EOF
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro + 1
		%>
		<tr class='<%=clase%>'>
			<td class="alerta4" style="font-size:9px;"><%response.Write(cont)%></td>
			<td class="alerta4" style="font-size:9px;" align="left"><%=RSCuad.Fields("nombre")%></td>              
			<td class="alerta4" style="font-size:9px;">&nbsp;<%=RSCuad.Fields("dni")%></td>
            <td class="alerta4" style="font-size:9px;">&nbsp;<%=RSCuad.Fields("proceso")%></td>
            <td class="alerta4" style="font-size:9px;">&nbsp;<%=RSCuad.Fields("desc_puesto")%></td>
			<td class="alerta4" style="font-size:9px;">&nbsp;<% if RSCuad.Fields("competencia")=9 then 
			response.write("Sin evalauci&oacute;n")
			elseif RSCuad.Fields("competencia")=1 then
			response.write("Aprobado")
			else 
			response.write("Desaprobado")
			end if
			 %>			</td>
            <%
				registro = registro + 1
				RSCuad.MoveNext 
			Loop	
			RSCuad.close
			set RSCuad = nothing 
			MiCone.close 
			set MiCone = nothing
		%>
		</tr>
		<tr>
			<td><input type="hidden" id="hdnContadorSeleccion" value="<%=contadorSeleccion%>" /></td>
		</tr>
	</table>
		
<%
	else
%>
	<table width='95%' align='center'>
		<tr>
			<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
		</tr>
	</table>
<%
	end if
%>



