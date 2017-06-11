<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  -->
 <style> 
 .t {mso-number-format:"\@";}
 </style> 
<%

Response.ContentType="text/html; charset=iso-8859-1"	
			
idProyecto=Session("id_proyecto")
codigoMeta=Session("codigoProyecto")

cod_odei = Request.Form("cod_odei")
fase = Request.Form("fase")
sede_cap = Request.Form("sede_cap")
periodo = Request.Form("periodo")

	
		SQL1 = "exec dbo.pa_fm_reporte_presupuesto_ODEI_total '"&cod_odei&"', '"&fase&"', '"&sede_cap&"', '"&periodo&"' "
			
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
If Not RSCuad.BOF And Not RSCuad.EOF Then

	%>	
		<table width='95%' border="1" cellpadding="2" cellspacing="2" id="tabla_rep"  bordercolor="#DAE8F3" >
      		<tbody>
		  <%registro = 0					
							
			Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 
				
				color=""
				IF registro=0 then
					color="bgcolor=""#FFB08A"""
				end if
				%>					
	 		<tr <%=color%>>
            	<% if registro=0 then%>
                	<td width="4%" colspan="5">TOTAL</td>
                <%else%>
                  <td width="4%"><%=registro%></td>
                  <td width="6%"><%=RSCuad.Fields("cod_sede")%></td>
                  <td width="20%"><%=RSCuad.Fields("sede")%></td>
                  <td width="6%"><%=RSCuad.Fields("departamento_p")%></td>
                  <td width="6%"><%=RSCuad.Fields("sede_provincial")%></td>
                 <% end if%> 
                  <td width="6%"><%=RSCuad.Fields("ubigeo")%></td>
                  <td width="6%"><%=RSCuad.Fields("aulas")%></td>
                  <td width="6%"><%=RSCuad.Fields("total_participantes")%></td>
                  <td width="10%"><%=RSCuad.Fields("gast_operativo")%></td>
                  <td width="10%"><%=RSCuad.Fields("pasajes")%></td>
                  <td width="10%"><%=RSCuad.Fields("mov_local")%></td>
                  <td width="10%"><%=RSCuad.Fields("total")%></td>
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
           </tbody>     
		</table>
		
<%else%>
<span class="titulo"><%=REPORTE%></span>
		<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
                  <%end if %>
		