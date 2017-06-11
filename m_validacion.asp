<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
 
<%
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"

tipo=Request.Form("tipo")
lsReporte=Request.Form("lsReporte")
lsCC=Request.Form("lsCC")

id_Proyecto=Session("id_proyecto")

	
	if varReporte="1" then
		REPORTE=" APROBACI&Oacute;N DE CV"
	end if
		if varReporte="23" then
		REPORTE=" APROBAR PRESELECCI&Oacute;N"
	end if
	if varReporte="2" then
		REPORTE=" APROBAR CAPACITACI&Oacute;N"
	end if
	if varReporte="3" then
		REPORTE=" APROBAR SELECCI&Oacute;N"
	end if	
	
	if varDpto="99" and varProv="99" and varDist="99" then
		vartittn=" A Nivel Nacional"
	end if
	if varDpto<>"99" then
		vartit1= "Departamento : " & nombredpto
	end if
	if varProv<>"99" then
		vartit2= " / Provincia : "& nombreprov
	end if
	if varDist<>"99" then
		vartit3= " / Distrito : "&nombredist
	end if


		SQL1 = "exec dbo.pa_seleccion_general_validar '"&id_proyecto&"' , '"&tipo&"', '"&lsCC&"' "  
		
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
If Not RSCuad.BOF And Not RSCuad.EOF Then
		
		
		proceso=RSCuad.Fields("proceso")
		cargo=RSCuad.Fields("DESC_CARGO")
	%>
	
		<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
        <tr><th colspan="19" bgcolor="#DAE8F3" class="titulo">CARGO: <%=cargo%> - PROCESO: <%=proceso%></th>
		  </tr>
				<tr><span style="text-align:justify"> </span>
				  <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro.</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CCDD</th>
					<th bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CCPP</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CCDI</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">APE_PAT</th>             		
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">APE_MAT</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOMBRE</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#E3CBB3" class="dato3">CCDD</th>
					<th bordercolor="#DAE8F3"  bgcolor="#E3CBB3" class="dato3">CCPP</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#E3CBB3" class="dato3">CCDI</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#E3CBB3" class="dato3">DNI</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#E3CBB3" class="dato3">APE_PAT</th>             		
					<th  bordercolor="#DAE8F3"  bgcolor="#E3CBB3" class="dato3">APE_MAT</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#E3CBB3" class="dato3">NOMBRE</th>
                    
                    
                    <th   bordercolor="#DAE8F3" bgcolor="#CB547D" class="dato3">OBSERVACION</th>
		  </tr>
		  <%	registro = 0
		  				
			Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 
				%>
		<tr class='<%=clase%>'>
      
		<td class='e_td_string1'><%=cont%></td>
        <td class='t'><%=RSCuad.Fields("ccdd_s")%></td>
		<td class='t'><%=RSCuad.Fields("ccpp_s")%></td>
		<td class='t'><%=RSCuad.Fields("ccdi_s")%></td>
		<td class='t'><%=RSCuad.Fields("dni_s")%></td>
		<td class='e_td_string1'><%=RSCuad.Fields("ape_pat_s")%></td>
		<td class='e_td_string1'><%=RSCuad.Fields("ape_mat_s")%></td>
		<td class='e_td_string1'><%=RSCuad.Fields("nombre_s")%></td>
        <td class='t'><%=RSCuad.Fields("ccdd_f")%></td>
		<td class='t'><%=RSCuad.Fields("ccpp_f")%></td>
		<td class='t'><%=RSCuad.Fields("ccdi_f")%></td>
		<td class='t'><%=RSCuad.Fields("DNI_f")%></td>
		<td class='e_td_string1'><%=RSCuad.Fields("ape_pat_f")%></td>
		<td class='e_td_string1'><%=RSCuad.Fields("ape_mat_f")%></td>
		<td class='e_td_string1'><%=RSCuad.Fields("nombres_f")%></td>
        <td class='e_td_string1'><%=RSCuad.Fields("observacion")%></td>
        
		</tr>
     
		<%
		registro = registro + 1
			RSCuad.MoveNext
			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
 %>
		</table>
		
<%else%>
<span class="titulo"><%= REPORTE %></span>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if %>



