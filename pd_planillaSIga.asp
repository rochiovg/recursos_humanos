<%@ Language=VBScript %>
<%session.lcid=2057%>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 .t1 {mso-number-format:"\@";}
 </style>
<%


Server.ScriptTimeout = 230400  

Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0'
Response.Buffer = True 
Response.Flush 
	

lsperiodo2=Request.Form("lsperiodo2")
id_proyecto=session("id_proyecto")

SQL1 = "EXEC dbo.GET_PLANILLASIGA '"&lsperiodo2&"','"&id_proyecto&"' " 

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		



	If Not RSCuad.BOF And Not RSCuad.EOF Then   
														
	%>
	

		
<body  >	
<form name="frmMiForm1" id="frmMiForm1" METHOD="POST" ACTION="pd_conformidad.asp">

<table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
      <tr style="border:0;">
        <td height="61" colspan="15" align="center" style="font-size:15px;border:0;"><strong>PLANILLA SIGA</strong>&nbsp;&nbsp;</td> 
      </tr>
      <tr style="font-size:12px;border:0;"  border="1">
        <th colspan="12" border="0"><div  id="detalle_regMontoAprobar"  align="LEFT"  style="HEIGHT:100%;width:100%;border:0;">
		</div></th>
      </tr>
      <tr style="font-size:9px;"  >
	  <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>	  
      <th width="20%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
      <th width="40%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">APELLIDOS Y NOMBRES</th>
      <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SERIE</th>
	  <th width="20%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">NUMERACION</th>
      <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA EMISION</th>
      <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">MONTO PAGO</th>
	  <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>N&deg; ARMADA</strong></th>
	  <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>FECHA INICIO</strong></th>
	  
	  <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA FIN</th>
	  <th width="40%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">OBSERVACION</th> 
      </tr>
       <%
	 	   
	   registro = 1					
			Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	

%>
<tr <%=color%>>
        <td width="10%" height="34" class='e_td_string1'><%response.Write(registro)%></td>
		<td width="20%"class='e_td_string1'><span class="t4"><%=RSCuad.Fields("CODI_EMPL_PER")%></span></td>
		<td  width="40%" class='e_td_string1'><span class="t4"><%=RSCuad.Fields("NOMB_CORT_PER")%></span></td>
        <td  width="10%" class='e_td_string1'><span class="t4"><%=RSCuad.Fields("NUME_SERI_MET")%></span></td>
        <td width="20%" class='e_td_string1'><%=Ucase(trim(RSCuad.Fields("NUME_CORR_MET")))%></td>
        <td width="10%"  class='e_td_string1'><%=trim(RSCuad.Fields("FECH_EMIS_MET"))%></td>
        <td width="10%" class='e_td_string1'> <%=RSCuad.Fields("SUEL_CARG_TCA")%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=RSCuad.Fields("ARMADA_PAGO")%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=RSCuad.Fields("FECH_INIC_CNT")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=RSCuad.Fields("FECH_FINA_CNT")%></strong></font></td>
        <td width="40%" bordercolor="#DAE8F3" class='e_td_string1'><strong><%=RSCuad.Fields("OBSER_REMU_PER")%></strong></font></td>	
	
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
	 <tr><td height="34" class='e_td_string1' colspan=13>&nbsp;</td></tr>
 </table>
<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if%>
	
</form>
</body >	