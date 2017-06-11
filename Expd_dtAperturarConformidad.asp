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
Response.Addheader "Content-Disposition", "attachment; filename=CONFORMIDADPLANILLA.xls" 
Response.ContentType = "application/save"
Response.Expires = 0'
Response.Buffer = True 
Response.Flush 

id_proyecto=session("id_proyecto")

lsperiodo = request("lsperiodo")
varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
lsnivel = Request("lsnivel")



cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
if cantvarccdiTot <> 0 then
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)
end if


fechayhora= Now()

SQL4 = "exec dbo.getNombreProy   '"&id_proyecto&"' "	
	
		Set RSCuad4	= Server.CreateObject("ADODB.Recordset") 
		RSCuad4.cursorlocation=3
		RSCuad4.Open SQL4, MiCone, 3,3


	SQL1 = "EXEC dbo.uspGet_PlanillaConf_Det_Excel '"&lsperiodo&"','" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsnivel& "', '" & id_proyecto& "' " 

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
	
    if RSCuad.RecordCount>0 then	
	estado_Pla=RSCuad("estado_Pla")
	periodoPla=RSCuad("periodoPla")
	flagSN=RSCuad("flagSN")

    else
	estado_Pla=""
	periodoPla=""
	flagSN=""
    end if	
	
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	
	SQL2 = "EXEC dbo.uspGet_PlanillaAprobDesa '"&lsperiodo&"','" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsnivel& "', '" & id_proyecto& "'" 
	


		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
			
	%> 
	

	<%

	If Not RSCuad.BOF And Not RSCuad.EOF Then   
					total=0
										
	%>
		
	
<form name="frmMiForm2" id="frmMiForm2" border="0" METHOD="POST" ACTION="pd_dtActualizarPlanilla.asp">

<table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0" width="100%">

      <tr style="border:0;">
        <td height="61" colspan="13" align="center" style="font-size:15px;border:0;"><BR>
        <strong>PROYECTO <%=RSCuad4.Fields("nombre")%>&nbsp;&nbsp;-&nbsp;&nbsp;APERTURA DE LA PRE CONFORMIDAD</strong>
		<strong><BR>PERIODO: <%=trim(RSCuad.Fields("periodo"))%></strong>
		<br>(Estado: <%=trim(RSCuad.Fields("Desc_estadoPla"))%>)</span><br><br></td> 
      </tr>

		
		
	   <tr style="font-size:11px;border:0;">
	    <td width="8%" colspan="4" align="left" style="font-size:12px;border:0;"><span class="criterio">&nbsp;</td>
		<td width="8%" colspan="2" align="left" style="font-size:12px;border:0;"><span class="criterio">&nbsp;</td>
        <td width="8%" colspan="3" align="left" style="font-size:12px;border:0;"><span class="criterio">&nbsp;</td>
		<td width="8%" colspan="3" align="left" style="font-size:12px;border:0;"><span class="criterio">&nbsp;</td>
      
	  
	  </tr>
      
  <tr  align="right"  border="0">
		<td width="50%" align=right colspan="6" style="font-size:12px;border:0;"><span class="e_td_string1">PEA Total:&nbsp;&nbsp;<Strong><%=Ucase(trim(RSCuad2.Fields("TotPEA")))%></Strong></span></td>
		<td  width="50%" align="right" colspan="5" style="font-size:12px;border:0;"><span class="e_td_string1">Monto Total:&nbsp;&nbsp;<Strong> <%=FormatNumber(RSCuad2.Fields("MontoPago"),2)%></Strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr  align="left"  border="0">	  
		<td width="50%" align="right" colspan="6" style="font-size:12px;border:0;"><span class="e_td_string1">PEA Aprobada con Pago:&nbsp;&nbsp;<Strong><%=Ucase(trim(RSCuad2.Fields("TotalAprob")))%></Strong></span></td>
		<td width="50%" align="right" colspan="5" style="font-size:12px;border:0;"><span class="e_td_string1">Monto:&nbsp;&nbsp;<Strong> <%=FormatNumber(RSCuad2.Fields("MontoPagoAprob"),2)%></Strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr  align="left" border="0">
		<td width="50%" align="right" colspan="6" style="font-size:12px;border:0;"><span class="e_td_string1">PEA Desaprobada sin Pago:&nbsp;&nbsp;<Strong> <%=Ucase(trim(RSCuad2.Fields("TotalDesaprob")))%></Strong></span></td>
		<td width="50%" align="right" colspan="5" style="font-size:12px;border:0;"><span class="e_td_string1">Monto:&nbsp;&nbsp;<Strong> <%=FormatNumber(RSCuad2.Fields("MontoPagoDes"),2)%></Strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  
   <tr  align="left" border="0">
		<td width="50%" align="right" colspan="6" style="font-size:12px;border:0;"><span class="e_td_string1">PEA con Pago Anulado:&nbsp;&nbsp;<Strong> <%=Ucase(trim(RSCuad2.Fields("TotalAnulado")))%></Strong></span></td>
		<td width="50%" align="right" colspan="5" style="font-size:12px;border:0;"><span class="e_td_string1">Monto:&nbsp;&nbsp;<Strong> <%=FormatNumber(RSCuad2.Fields("MontoPagoAnulado"),2)%></Strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>

      <tr style="font-size:9px" >
	  <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>	  
      <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ODEI / OZEI</th>
	  <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">UBIGEO</th>
      <th width="17%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">APELLIDOS Y NOMBRE</th>
      <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
	  <th width="15%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO <br>FUNCIONAL</th>
      <th width="4%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SUELDO</th>
	  <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>N&deg; ARMADA</strong></th>
      <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>DIAS DE <br>PAGO</strong></th>
	  <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>MONTO DE LA  <br />ARMADA</strong></th>
     <th width="17%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">VALIDADO</th>
      <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Neto Recibido</th>
      <th width="17%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">TIPO DE <br>INGRESO</th>
      <th width="10%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato" style="font-size:10px">ESTADO DE <br> CONTRATO</th>
	  <th width="15%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO <br>CONTRATACION</th>
      <th width="15%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DISTRITO</th>
      <th width="15%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA NACIMIENTO</th>
      <th width="05%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Nº CONVOCATORIA</th>
	  
      </tr>
       <%registro = 1					
				periodo=""
			Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
			


					ARM = ARM + cDbl(RSCuad.Fields("MontoPago"))
				
               
		
					

	if RSCuad.Fields("PERIODO")="TOTAL" then 
				%>
   
      
  <% else
  
  
   %>
      <tr>
        <td height="34" class='e_td_string1'><%response.Write(registro)%></td>
		<td   class='e_td_string1'><span class="t4"><%=RSCuad.Fields("detadepen")%></span></td>
		<td class='e_td_string1'><span class="t4"><%=RSCuad.Fields("ccdd_i")%><%=RSCuad.Fields("ccpp_i")%><%=RSCuad.Fields("ccdi_i")%></span></td>       
        <td class='e_td_string1'><%=Ucase(trim(RSCuad.Fields("Ape_Nom")))%></td>
        <td bordercolor="#DAE8F3" class='t'><%=trim(RSCuad.Fields("DNI"))%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1'> <%=RSCuad.Fields("funcional")%></td>      
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=FormatNumber(RSCuad.Fields("Sueldo"),2)%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1'align="center"><strong>&nbsp;<%=RSCuad.Fields("narmada")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1'align="center"><strong>&nbsp;<%=RSCuad.Fields("DiasPago")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=FormatNumber(RSCuad.Fields("MontoPago"),2)%></strong></font></td>		


<td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t13"><%=RSCuad.Fields("validado")%></span></td>

        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=FormatNumber(RSCuad.Fields("neto_recibir"),2)%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t1"><%=RSCuad.Fields("DescTipo_Ofc")%></span></td>
        <td  bordercolor="#DAE8F3"  ><span class="t1"><%=RSCuad.Fields("Desc_ActivoC")%></span></td>
		<td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t1"><%=RSCuad.Fields("contratacion")%></span></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t1"><%=RSCuad.Fields("Distrito")%></span></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t1"><%=RSCuad.Fields("fec_nac")%></span></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t1"><%=RSCuad.Fields("num_convocatoria")%></span></td>

      </tr>

      
      <%	 end if 
	  
			registro = registro + 1
			periodo=""

			RSCuad.MoveNext
			Loop	
	
	 	RSCuad.close
			set RSCuad=nothing 
			set RSCuad2=nothing 
			MiCone.close 
			set MiCone=nothing

 %>
 <tr>

      </tr>
    </table>
<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if%>
	
</form>
	