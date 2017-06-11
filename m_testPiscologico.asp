<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
	Server.ScriptTimeout = 230400  
	Response.Expires = 0
	Response.Buffer = True 
	Response.ContentType = "text/html; charset=iso-8859-1"
	
	

	var1Cargo = request("lsCargo") '7
	varReporte = request("lsReporte") '7
	
	varNomDpto = request("lsDPTO")	'15LIMA
	varNomProv = request("lsPROV")	'1501LIMA
	varNomDist = request("lsDIST")	'150101LIMA
	lsRol=Request.Form("lsRol")
	lsConvCar=Request.Form("lsConvCar")
	
	VALOR=request("VALOR")
	usuario=Session("id_usuario")
	id_proyecto=session("id_proyecto")
	
	varDpto = mid(varNomDpto, 1, 2)		'15
	varProv = mid(varNomProv, 3, 2)		'01	
	varDist = mid(varNomDist, 5, 2)		'01
	'							
	lsvarNomDpto = len(varNomDpto) '6
	nombredpto = mid(varNomDpto, 3, lsvarNomDpto - 2)	'LIMA
	lsvarNomProv = len(varNomProv) '6
	nombreprov = mid(varNomProv, 5, lsvarNomProv - 4)	'LIMA
	lsvarNomDist = len(varNomDist) '6
	nombredist = mid(varNomDist, 7, lsvarNomDist - 6)	'LIMA
	
	cantvarlsCargoTot = len(var1Cargo)
	
	if cantvarlsCargoTot <> 0 then
		cargo = Mid(var1Cargo, 2)
		tipocargo = Mid(var1Cargo, 1, 1)
	end if


	

		
	SQL1 = "exec dbo.pa_resp_cuestionario2_listar '" & cargo & "', '" & varDpto & "', '" & varProv & "', '" & varDist & "', '" & tipocargo & "' , '" & id_proyecto & "', '" & lsConvCar & "'"	
	

	Set RSCuad = Server.CreateObject("ADODB.Recordset")

	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3
	
	
	If Not RSCuad.BOF And Not RSCuad.EOF Then
	
	
	
	
%>
	<link href="Styles/inei.css" rel="stylesheet" type="text/css" />
	
	<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3">
		<tr>
			<td colspan="15" >
				<span class="titulo">PERSONAL PARA EVALUACI&Oacute;N DE TEST PSICOL&Oacute;GICO <span class="e_td_string1">
						<input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=lsUsuario%>" />
					</span>
				</span></td>
		</tr>
        		<tr>

			<td align="right" colspan="15" >&nbsp;</td>
		</tr>

        
		<tr style="font-size:9px;">
			<th width="4%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Nro</th>
        <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Depatamento</th>
			<th width="39%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Nombre</th>             		
			<th width="9%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">DNI</th>
			<th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">Nota Test Conocimientos</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> E</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">E %</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">ESTADO E</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> N</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> N %</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> ESTADO N</th>
           <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> P</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> P %</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> ESTADO P</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> L</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> L %</th>
            <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3"> ESTADO L</th>
			<th width="7%"  bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato3">ASISTENCIA</th>
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
			<td class="alerta4" style="font-size:9px;">&nbsp;<%=RSCuad.Fields("DPTO")%></td>
			<td class="alerta4" style="font-size:9px;" align="left"><%=RSCuad.Fields("nombre")%></td>              
			<td class="alerta4" style="font-size:9px;">&nbsp;<%=RSCuad.Fields("dni")%></td>
			<td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("nota_testInfo")%></td>
            
            
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("CE")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("PCE")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("RCE")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("CN")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("PCN")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("RCN")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("CP")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("PCP")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("RCP")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("CL")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("PCL")%></td>
            <td class="alerta4" style="font-size:9px;"><%=RSCuad.Fields("RCL")%></td>

			<td  class='e_td_string1'>
				<select   class="<%
				if (RSCuad.Fields("competencia")="1") then
				 response.write("apto") 
				elseIF (RSCuad.Fields("competencia")="2") THEN
				 response.write("NO APTO") 
				ELSE
				response.write("Seleccione... ") 
				end if%>" style="font-size:10px" name="c<%=RSCuad.Fields("ID_PER")%>" id="c<%=RSCuad.Fields("ID_PER")%>" onchange="Flagear(this.id,'<%=RSCuad.Fields("ID_PER")%>',this.value,'<%=id_proyecto%>')">
				    <option value="9" <%if isnULL(RSCuad.Fields("competencia")) then response.write("selected")end if%>>Seleccione...</option>
				    <option value="1" <%if(RSCuad.Fields("competencia")="1") then response.write("selected")end if%>>Apto</option>
				    <option value="2" <%if(RSCuad.Fields("competencia")="2") then response.write("selected")end if%>>No Apto</option>
				</select><div id="muestra<%=RSCuad.Fields("ID_PER")%>"></div>
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



