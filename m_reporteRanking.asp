<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  -->
 <style> 
 .t {mso-number-format:"\@";}
 </style> 
<%

Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_F2.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.Flush 
			
idProyecto=Session("id_proyecto")
codigoMeta=Session("codigoProyecto")
varDpto = Request("lsDPTO")
varProv = Request("lsPROV")
varDist = Request("lsDIST")

	
		SQL1 = "exec dbo.pa_reporte_ranking '"&idProyecto&"', '"&varDpto&"', '"&varProv&"', '"&varDist&"' "
		
			
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
If Not RSCuad.BOF And Not RSCuad.EOF Then

	%>	
		<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
       <tr>
                  <td colspan="16" align="center"><span class="titulo">REPORTE DE CAPACITACI&Oacute;N DE LOS POSTULANTES AL NIVEL III POR RANKING DE NOTAS</span></td>
          </tr>
				<tr><span style="text-align:justify"> </span>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro</th>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Sede</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Cargo</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nombre</th>             		
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
					
  
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 1 </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 2 </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 3  </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 4  </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 5  </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOTA CAPACITACI&Oacute;N </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">ESTADO CAPACITACI</th>
            <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NIVEL</th>
            <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">GRADO</th>
            <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">PUNTAJE NIVEL<BR>ACADEMICO</th>
            <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">TIEMPO EXPERIENCIA EN CAMPO (EN MESES)</th>
            <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">TIEMPO EXPERIENCIA GENERAL (EN MESES)</th>
            <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">EXPERIENCIA EN INEI</th>
            <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">PUNTAJE DE EXP.</th>
            <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOTA DE PRESELCCI&Oacute;N</th>
            <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">RESULTADO<BR>SELECCI&Oacute;N</th>

          </tr>
		  <%registro = 0					
							
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
				  <td class='e_td_string1'><%response.Write(cont)%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("sedeOperativa")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("cargo")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("APE_PATERNO")%>&nbsp;<%=RSCuad.Fields("APE_MATERNO")%>&nbsp;<%=RSCuad.Fields("NOMBRE")%></td>              
				  <td class='t'><%=RSCuad.Fields("dni")%></td>

           <td  class='e_td_string1'><%=RSCuad.Fields("p1")%></th>
<td  class='e_td_string1'><%=RSCuad.Fields("p2")%></th>
<td  class='e_td_string1'><%=RSCuad.Fields("p3")%></th>
<td  class='e_td_string1'><%=RSCuad.Fields("p4")%></th>
<td  class='e_td_string1'><%=RSCuad.Fields("l1")%></th>
           <td  class='e_td_string1'><%=RSCuad.Fields("notacap")%></th>
           <td  class='e_td_string1'><%=RSCuad.Fields("capacita")%></th>
            <td  class='e_td_string1'><%=RSCuad.Fields("nivel")%></th>
            <td  class='e_td_string1'><%=RSCuad.Fields("grado")%></th><td  class='e_td_string1'><%=RSCuad.Fields("puntaje_grado")%></th>
            <td  class='e_td_string1'><%=RSCuad.Fields("campo_meses")%></th>
            <td  class='e_td_string1'><%=RSCuad.Fields("gen_meses")%></th>
            <td  class='e_td_string1'><%=RSCuad.Fields("trabajo_inei")%></th>
            <td  class='e_td_string1'><%=RSCuad.Fields("puntaje_inei")%></th>
            <td  class='e_td_string1'><%=RSCuad.Fields("notaprecap")%></th>
            <td  class='e_td_string1'><%=RSCuad.Fields("estado_seleccion")%></th>
            
      
           
                    
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
 
          <tr>
                
                <td colspan="16" align="right"><p>FECHA Y HORA: <%= Now() %>&nbsp;</p></td>
                </tr>
                
		</table>
		
<%else%>
<span class="titulo"><%=REPORTE%></span>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if %>

