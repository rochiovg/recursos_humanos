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
VALOR=Request.Form("VALOR") 

id_proyecto=session("id_proyecto")

IF VALOR=1 THEN	
	'---       cuando    se  invoca desde  la  opcion  de  consulta   de  aprobacion   CON filtros  de  ubigeo  
	fin = request("fin")

	lsperiodo = request("lsperiodo")
	varccddTot = Request.Form("lsDPTO")
	varccppTot = Request.Form("lsPROV")
	varccdiTot = Request.Form("lsDIST")
	lsnivel = Request.Form("lsnivel")

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
	varfin=request("lsfin") '7


	SQL1 = "EXEC dbo.uspGet_PlanillaConf_Det_Resumen1 '1','"&lsperiodo&"','" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsnivel& "', '" & id_proyecto& "'" 
	SQL0 = "EXEC dbo.uspGet_PlanillaConf_Det_Resumen1 '0','"&lsperiodo&"','" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsnivel& "', '" & id_proyecto& "'" 
END IF

IF VALOR=2 THEN
	'---       cuando    se  invoca desde  la  opcion  de  consulta   sin  filtros  de  ubigeo  
	lsperiodo = request("lsperiodo")
	varccddTot = Request.Form("lsDPTO")
	varccppTot = Request.Form("lsPROV")
	varccdiTot = Request.Form("lsDIST")
	lsnivel = Request.Form("lsnivel")

	SQL1 = "EXEC dbo.uspGet_PlanillaConf_Det_Resumen1 '1','"&lsperiodo&"','99', '99', '98', '9', '" & id_proyecto& "'" 
	SQL0 = "EXEC dbo.uspGet_PlanillaConf_Det_Resumen1 '0','"&lsperiodo&"','99', '99', '98', '9', '" & id_proyecto& "'" 
END IF

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3 
		
	    if RSCuad.RecordCount>0 then	
			periodoPla=RSCuad("periodoPla")
		else
			periodoPla=""
		end if	


		Set RSCuad0	= Server.CreateObject("ADODB.Recordset") 
		RSCuad0.cursorlocation=3
		RSCuad0.Open SQL0, MiCone, 3,3 
		
	    if RSCuad0.RecordCount>0 then	
		else
		end if	


	If Not RSCuad.BOF And Not RSCuad.EOF Then   
	%>
		
	
<form name="frmMiForm1" id="frmMiForm1" METHOD="POST" ACTION="pd_dtActualizarPlanilla.asp">

<table border="1" width="97%" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
      <tr style="border:0;">
        <td height="61" colspan="13" align="center" style="font-size:15px;border:0;"><BR><strong>CONSULTA RESUMEN DE LA PRE CONFORMIDAD, SEGUN ODEI Y CARGO</strong>
		<strong><BR>PERIODO:  <%=trim(RSCuad.Fields("periodoPla"))%>&nbsp;<%=trim(RSCuad.Fields("desc_Pla"))%></strong> 
		<br>(Estado: <%=trim(RSCuad.Fields("Desc_estadoPla"))%>)</span><br><br></td> 
      </tr>
	  
      <tr style="font-size:9px" > 
	  <th width="02%" rowspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px" valign=middle>Nº</th> 
	  <th width="25%" rowspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px" valign=middle>CARGO FUNCIONAL</th>
      <th width="02%" rowspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px" valign=middle>TIPO<BR>RED</th>
	  <th width="25%" rowspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px" valign=middle>CARGO DE CONTRATACION</th>

	  <th width="05%" colspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>TOTAL</strong></th>
	  <th width="05%" colspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>CON PAGO</strong></th>
	  <th width="05%" colspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>SIN PAGO</strong></th>
      <th width="05%" colspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>Anulado</strong></th>
      </tr>
      <tr style="font-size:9px" > 
	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px"><strong>TOTAL<BR>PEA</strong></th>
	  <th width="10" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px"><strong>TOTAL<BR>MONTO</strong></th>

	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>TOTAL<BR>PEA</strong></th>
	  <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>TOTAL<BR>MONTO</strong></th>

	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px"><strong>TOTAL<BR>PEA</strong></th>
	  <th width="10%" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px"><strong>TOTAL<BR>MONTO</strong></th>
      
      <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>TOTAL<BR>PEA</strong></th>
	  <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>TOTAL<BR>MONTO</strong></th>
      </tr>
      
      
		<%' --- Para el Total General ---
		Do While Not RSCuad0.EOF%> 
      <tr>
		<td class='e_td_string1'  colspan=4  align=right valign=middle><strong>TOTAL  GENERAL:&nbsp;</strong></td> 

        <td bordercolor="#DAE8F3" class='e_td_string1' valign=middle><strong><%=RSCuad0.Fields("TotPEA")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right valign=middle><strong><%=FormatNumber(RSCuad0.Fields("MontoPago"),2)%></strong></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' bgcolor="#ECF5FF" valign=middle><strong><%=RSCuad0.Fields("TotPEA1")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' bgcolor="#ECF5FF" align=right valign=middle><strong><%=FormatNumber(RSCuad0.Fields("MontoPago1"),2)%></strong></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' valign=middle><strong><%=RSCuad0.Fields("TotPEA0")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right valign=middle><strong><%=FormatNumber(RSCuad0.Fields("MontoPago0"),2)%></strong></font></td>	
        <td bordercolor="#DAE8F3" class='e_td_string1' bgcolor="#ECF5FF" valign=middle><strong><%=RSCuad0.Fields("TotalAnulado0")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' bgcolor="#ECF5FF" align=right valign=middle><strong><%=FormatNumber(RSCuad0.Fields("MontoPagoAnulado0"),2)%></strong></font></td>		
      </tr>
		<%	
			RSCuad0.MoveNext
			Loop	
	 		RSCuad0.close
			set RSCuad0=nothing 

			registro = 0		
			WOdei		= TRIM(RSCuad.Fields("CODI_SEDE_SED")) 
			WOdeiDesc	= TRIM(RSCuad.Fields("detadepen")) 
			
			Tot_TotPEA		= 0 
			Tot_MontoPago	= 0 
			Tot_TotPEA1		= 0 
			Tot_MontoPago1	= 0 
			Tot_TotPEA0		= 0 
			Tot_MontoPago0	= 0 
			Tot_TotPEAAnul0		= 0 
			Tot_MontoPagoAnul0	= 0 
			Do While Not RSCuad.EOF
			response.Flush()

	            If  (WOdei <> trim(RSCuad.Fields("CODI_SEDE_SED")) or  WOdeiDesc <> TRIM(RSCuad.Fields("detadepen")) ) or registro = 0 Then  %> 
			<tr class='e_td_string1' style=" font-size:10px"  align=left valign=middle>  
				<td height="25"  colspan=12 bgcolor="#ECF5FF">
				<strong>ODEI/ OZEI:&nbsp;&nbsp;&nbsp;<%=RSCuad.Fields("detadepen")%></strong></td>
			</tr>  
				<% 
				WOdei		= TRIM(RSCuad.Fields("CODI_SEDE_SED")) 
				WOdeiDesc	= TRIM(RSCuad.Fields("detadepen")) 

				Tot_TotPEA		= 0 
				Tot_MontoPago	= 0 
				Tot_TotPEA1		= 0 
				Tot_MontoPago1	= 0 
				Tot_TotPEA0		= 0 
				Tot_MontoPago0	= 0 
				Tot_TotPEAAnul0		= 0 
				Tot_MontoPagoAnul0	= 0 
				end If 

				registro = registro + 1
				If registro Mod 2 = 0 Then
					clase = "e_tr_even" 
				Else
					clase = "e_tr_odd"
				End If	
				
				Tot_TotPEA		= Tot_TotPEA + CDBL(RSCuad("TotPEA")) 
				Tot_MontoPago	= Tot_MontoPago + CDBL(RSCuad("MontoPago")) 

				Tot_TotPEA1		= Tot_TotPEA1 + CDBL(RSCuad("TotPEA1")) 
				Tot_MontoPago1	= Tot_MontoPago1 + CDBL(RSCuad("MontoPago1")) 

				Tot_TotPEA0		= Tot_TotPEA0 + CDBL(RSCuad("TotPEA0")) 
				Tot_MontoPago0	= Tot_MontoPago0 + CDBL(RSCuad("MontoPago0")) 
				
				Tot_TotPEAAnul0		= Tot_TotPEAAnul0 + CDBL(RSCuad("TotalAnulado1")) 
				Tot_MontoPagoAnul0	= Tot_MontoPagoAnul0 + CDBL(RSCuad("MontoPagoAnulado1")) 
		%> 
      <tr>
        <td height="34" class='e_td_string1'><%response.Write(registro)%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=left> <%=RSCuad.Fields("desc_cargoFuncional")%></td>      
		<td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t1"><%=RSCuad.Fields("tipoDesc")%></span></td>
		<td bordercolor="#DAE8F3" class='e_td_string1' align=left ><span class="t1"><%=RSCuad.Fields("desc_carg")%></span></td>

        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=RSCuad.Fields("TotPEA")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=FormatNumber(RSCuad.Fields("MontoPago"),2)%></strong></font></td>		

        <td bordercolor="#DAE8F3" class='e_td_string1' bgcolor="#ECF5FF"><strong><%=RSCuad.Fields("TotPEA1")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' bgcolor="#ECF5FF" align=right><strong><%=FormatNumber(RSCuad.Fields("MontoPago1"),2)%></strong></font></td>		

        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=RSCuad.Fields("TotPEA0")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=FormatNumber(RSCuad.Fields("MontoPago0"),2)%></strong></font></td>		
		 <!--<td class='e_td_string1'><span class="t4"><%'=RSCuad.Fields("ccdd_i")%><%'=RSCuad.Fields("ccpp_i")%><%'=RSCuad.Fields("ccdi_i")%></span></td>-->
         
         <td bordercolor="#DAE8F3" class='e_td_string1' bgcolor="#ECF5FF"><strong><%=RSCuad.Fields("TotalAnulado1")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' bgcolor="#ECF5FF" align=right><strong><%=FormatNumber(RSCuad.Fields("MontoPagoAnulado1"),2)%></strong></font></td>
      </tr>
			<%	
			RSCuad.MoveNext
			
            Sw=0
            If  Not RSCuad.EOF Then 
	            If  (WOdei <> trim(RSCuad.Fields("CODI_SEDE_SED")) or  WOdeiDesc <> TRIM(RSCuad.Fields("detadepen")) )  Then  
					Sw=1
				End If
			Else
					Sw=1
			End If
           
				if Sw=1 Then  %>
			<tr style=" font-size:11px"  >  
				<td class='e_td_string1'  colspan=4  align=right><strong>Total:&nbsp;</strong></td> 
				<td class='e_td_string1' ><strong><%=Tot_TotPEA%></strong></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Tot_MontoPago,2)%></strong></td>

				<td class='e_td_string1' bgcolor="#ECF5FF"><strong><%=Tot_TotPEA1%></strong></td>
				<td class='e_td_string1' bgcolor="#ECF5FF"align=right><strong><%=FormatNumber(Tot_MontoPago1,2)%></strong></td>

				<td class='e_td_string1' ><strong><%=Tot_TotPEA0%></strong></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Tot_MontoPago0,2)%></strong></td>
                
                <td class='e_td_string1' bgcolor="#ECF5FF"><strong><%=Tot_TotPEAAnul0%></strong></td>
				<td class='e_td_string1' bgcolor="#ECF5FF"align=right><strong><%=FormatNumber(Tot_MontoPagoAnul0,2)%></strong></td>
			</tr>
			
				<%End If
			Loop	
	
	 		RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing

			%>
      <tr>
        <td height="34" class='e_td_string1' colspan=10>&nbsp;</td>
       
      </tr>
	  <tr>
        <td height="34" class='e_td_string1' colspan=10>&nbsp;</td>
       
      </tr>


    </table>
<%else%>
		<table width='97%' align='center'>
			<tr><td class='subtitulo' colspan='4'>No hay registros disponibles</td></tr>
		</table>
<%end if%>
	
</form>
	
	
	
	
	
	
