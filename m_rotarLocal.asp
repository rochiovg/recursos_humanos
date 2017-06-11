<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
	Server.ScriptTimeout = 230400  
	Response.Expires = 0
	Response.Buffer = True 
	Response.ContentType = "text/html; charset=iso-8859-1"
	
	id_aula=session("aulas") 
	id_proyecto=session("id_proyecto") 

	aula = request("lsDIST")	'150101LIMA
	local= request("lsPROV")
	lsRol=Request.Form("lsRol")
	usuario=Session("id_usuario")
	
		
	SQL1 = "exec dbo.pa_ficha_listarCapacitacion '" & aula & "', '" & id_proyecto & "' "	
	
	Set RSCuad = Server.CreateObject("ADODB.Recordset")

	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3

	
	If Not RSCuad.BOF And Not RSCuad.EOF Then
	
	
	
	
%>
	<link href="Styles/inei.css" rel="stylesheet" type="text/css" />
	
	<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3">
		<tr>
			<td colspan="15" >
				<span class="titulo">PERSONAL CAPACITACION : <%=vartitt%>
					<span class="e_td_string1">
						<input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
					</span>
				</span></td>
		</tr>
        
		<tr style="font-size:9px;">
			<th width="2%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Nro</th>
			<th width="30%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Nombre</th>             		
			<th width="7%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">DNI</th>
			<th width="15%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">CARGO</th>
			<th width="5%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">NUEVA AULA</th>
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
			<td width="2%" class="alerta4" style="font-size:9px;"><%response.Write(cont)%></td>
			<td width="30%" class="alerta4" style="font-size:9px;" align="left"><%=RSCuad.Fields("nombre")%></td>              
			<td width="7%" class="alerta4" style="font-size:9px;">&nbsp;<%=RSCuad.Fields("dni")%></td>
			<td width="15%" class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("cargo")%></td>		
               <td  width="5%" align="center" class='e_td_string1' id="Ad<%=RSCuad.Fields("dni")%>"> 
               <%
			   valor = Request.Form("datos")

aulasCapa = Request.Form("Aulas")

	Response.ContentType="text/html; charset=iso-8859-1"
	
	Set Rs = Server.CreateObject("ADODB.Recordset")
	
	lsql=" exec dbo.sp_getAulasCapa '"&local&"' ,'"&id_aula&"' "
	
    
                 Rs.CursorLocation=3
                Rs.Open lsql, Micone,3,3

	response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDist1"" name=""txtDist1"" onChange=""guardarNuevoLocal('"&RSCuad.Fields("dni")&"', '"&id_proyecto&"', this.value);"" >"
	Response.Write " <option id=""valor_defecto"" value=""9999"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" & Server.HtmlEncode(Rs(1)) & "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
	

	Rs.Close
	Set Rs = Nothing
			   
			   %>
               </td>
     
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



