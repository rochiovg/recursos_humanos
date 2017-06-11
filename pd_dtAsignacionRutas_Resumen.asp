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


fin = request("fin")


lsperiodo = request("lsperiodo")
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lsnivel = Request.Form("lsnivel")


idProyecto=Session("id_proyecto")


'cantvarccddTot=len(varccddTot)
'nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
'varccdd = Mid(varccddTot,1,2)

'cantvarccppTot=len(varccppTot)
'nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
'varccpp = Mid(varccppTot,3,2)

'cantvarccdiTot=len(varccdiTot)
'if cantvarccdiTot <> 0 then
'	nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
'	varccdi = Mid(varccdiTot,5,2)
'end if


fechayhora= Now()
varfin=request("lsfin") '7

varccdd="99"
varccpp="99"
varccdi="98"
lsnivel="9"

	SQL1 = "EXEC dbo.uspGet_AsignacionRutas_Resumen1 '1','99', '99', '98', '9', '"&idProyecto&"' " 
	
	
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3 
		
	    if RSCuad.RecordCount>0 then	
		else
		end if	


	SQL0 = "EXEC dbo.uspGet_AsignacionRutas_Resumen1 '0','99', '99', '98', '9', '"&idProyecto&"'" 
		Set RSCuad0	= Server.CreateObject("ADODB.Recordset") 
		RSCuad0.cursorlocation=3
		RSCuad0.Open SQL0, MiCone, 3,3 
		
	    if RSCuad0.RecordCount>0 then	
		end if	



	If Not RSCuad.BOF And Not RSCuad.EOF Then   
										
	%>
		
	
<form name="frmMiForm1" id="frmMiForm1" METHOD="POST" ACTION="pd_dtActualizarPlanilla.asp">

<table border="1" width="97%" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
      <tr style="border:0;">
        <td height="61" colspan="13" align="center" style="font-size:15px;border:0;"><BR><strong>CONSULTA RESUMEN DE ASIGNACION DE RUTAS Y GASTOS OPERATIVOS, SEGUN ODEI Y CARGO </strong>
		<strong><BR></strong> 
		</span></td> 
      </tr>
      
      <tr  > 
	  <th  bordercolor="#D7D7D7" colspan=15  valign=middle>

	<table border="0" width="100%" align="center">
		<tr style="font-size:11px"><td Class="e_td_string1" BgColor="White"  align=right colspan="10" ><strong>Fecha&nbsp;:</strong>&nbsp;&nbsp;<%=day(date())&"/"&month(date())&"/"&year(date())%>
		&nbsp;&nbsp;&nbsp;&nbsp;<strong>Hora&nbsp;:</strong>&nbsp;&nbsp;<%=time()%>
		</td></tr>
	</table> 
		</th> 
      </tr>
      
	  
      <tr style="font-size:9px" > 
	  <th width="02%" rowspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px" valign=middle>Nº</th> 
	  <th width="25%" rowspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px" valign=middle>CARGO FUNCIONAL</th>
      <th width="02%" rowspan=2 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px" valign=middle>TIPO<BR>RED</th>

	  <th width="20%" colspan=4 bordercolor="#D7D7D7" bgcolor="#ffffff" class="dato" style="font-size:10px"><strong>TOTAL PEA (PRIMER ENVIO)</strong></th>

	  <th width="20%" colspan=4 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>PRIMER ENVIO (1)<br>S/.</strong></th>
	  <th width="05%"			bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>PRIMER ENVIO (2)<br>S/.</strong></th>


	  <th width="20%" colspan=4 bordercolor="#D7D7D7" bgcolor="#ffffff" class="dato" style="font-size:10px"><strong>TOTAL PEA (SEGUNDO ENVIO)</strong></th>

	  <th width="20%" colspan=4 bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>SEGUNDO ENVIO (1)<br>S/.</strong></th> 
	  <th width="05%"			bordercolor="#D7D7D7" bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>SEGUNDO ENVIO (2)<br>S/.</strong></th> 

      </tr> 
      <tr style="font-size:9px" > 
	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px" align="center" valign=middle><strong>TOTAL<br>&nbsp;(1 + 2 +3)</strong></th>
	  <th width="05" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px" align="center"><strong>Depósito<br>con Contraseña<br>&nbsp;(1)</strong></th>
	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px" valign=middle><strong>De Baja<br>(2)</strong></th>
	  <th width="05" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px" align="center"><strong>Giro al Coord. Dist.<br>&nbsp;(3)</strong></th> 

	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"  align="center" valign=middle><strong>TOTAL<br>S/.<br>&nbsp;(1 + 2)</strong></th>
	  <th width="05" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" align="center"><strong>Depósito<br>con Contraseña<br>(1)</strong></th>
	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" align="center" valign=middle><strong>De Baja<br>&nbsp;(2)</strong></th>
	  <th width="05" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" align="center"><strong>Giro al Coord. Dist.<br>&nbsp;(3)</strong></th>
	  
	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px"  align="center" valign=middle><strong>TOTAL<br>S/.</strong></th>

	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px" align="center" valign=middle><strong>TOTAL<br>&nbsp;(1 + 2 +3)</strong></th>
	  <th width="05" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px" align="center"><strong>Depósito<br>con Contraseña<br>&nbsp;(1)</strong></th>
	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px" valign=middle><strong>De Baja<br>(2)</strong></th>
	  <th width="05" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px" align="center"><strong>Giro al Coord. Dist.<br>&nbsp;(3)</strong></th> 

	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"  align="center"valign=middle><strong>TOTAL<br>S/.<br>&nbsp;(1 + 2)</strong></th>
	  <th width="05" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" align="center"><strong>Depósito<br>con Contraseña<br>&nbsp;(1)</strong></th>
	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" align="center" valign=middle><strong>De Baja<br>&nbsp;(2)</strong></th>
	  <th width="05" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" align="center"><strong>Giro al Coord. Dist.<br>&nbsp;(3)</strong></th>

	  <th width="05%" bordercolor="#D7D7D7"  bgcolor="#ffffff" class="dato" style="font-size:10px"  align="center" valign=middle><strong>TOTAL<br>S/.</strong></th>


      </tr>
      
      
		<%' --- Para el Total General ---
		Do While Not RSCuad0.EOF%> 
      <tr>
		<td class='e_td_string1'  colspan=3  align=right><strong>TOTAL  GENERAL:&nbsp;</strong></td> 

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=RSCuad0.Fields("TotPEA")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=RSCuad0.Fields("PEAAsig1")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=RSCuad0.Fields("PEAAsig2")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=RSCuad0.Fields("PEAAsig3")%></strong></font></td>

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><strong><%=FormatNumber(RSCuad0.Fields("TotMon1"),2)%></strong></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><strong><%=FormatNumber(RSCuad0.Fields("Mon1Asig1"),2)%></strong></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><strong><%=FormatNumber(RSCuad0.Fields("Mon1Asig2"),2)%></strong></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><strong><%=FormatNumber(RSCuad0.Fields("Mon1Asig3"),2)%></strong></font></td>		

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><strong><%=FormatNumber(RSCuad0.Fields("TotMon1_1"),2)%></strong></font></td>		

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=RSCuad0.Fields("TotPEA_2")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=RSCuad0.Fields("PEAAsig1_2")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=RSCuad0.Fields("PEAAsig2_2")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=RSCuad0.Fields("PEAAsig3_2")%></strong></font></td>

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=FormatNumber(RSCuad0.Fields("TotMon2"),2)%></strong></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=FormatNumber(RSCuad0.Fields("Mon2Asig1"),2)%></strong></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=FormatNumber(RSCuad0.Fields("Mon2Asig2"),2)%></strong></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><strong><%=FormatNumber(RSCuad0.Fields("Mon2Asig3"),2)%></strong></font></td>		

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><strong><%=FormatNumber(RSCuad0.Fields("TotMon2_1"),2)%></strong></font></td>		


      </tr>
		<%	
			RSCuad0.MoveNext
			Loop	
	 		RSCuad0.close
			set RSCuad0=nothing 


			registro = 0		
			WOdei		= TRIM(RSCuad.Fields("CODdepe")) 
			WOdeiDesc	= TRIM(RSCuad.Fields("detadepen")) 
			

			TotPEA= 0 
			PEAAsig1= 0 
			PEAAsig2= 0 
			PEAAsig3= 0 

			TotMon1= 0 
			Mon1Asig1 = 0  
			Mon1Asig2 = 0 
			Mon1Asig3 = 0 

			TotMon1_1= 0 

			TotPEA_2= 0 
			PEAAsig1_2= 0 
			PEAAsig2_2= 0 
			PEAAsig3_2= 0 

			TotMon2= 0 
			Mon2Asig1 = 0  
			Mon2Asig2 = 0  
			Mon2Asig3 = 0  

			TotMon2_1= 0 
			
			Do While Not RSCuad.EOF
			response.Flush()

	            If  (WOdei <> trim(RSCuad.Fields("CODdepe")) or  WOdeiDesc <> TRIM(RSCuad.Fields("detadepen")) ) or registro = 0 Then  %> 
			<tr class='e_td_string1' style=" font-size:10px"  align=left valign=middle>  
				<td height="25"  colspan=3 bgcolor="#ECF5FF">
				<strong>ODEI/ OZEI:&nbsp;&nbsp;&nbsp;<%=RSCuad.Fields("detadepen")%></strong></td>
			</tr>  
				<% 
				WOdei		= TRIM(RSCuad.Fields("CODdepe")) 
				WOdeiDesc	= TRIM(RSCuad.Fields("detadepen")) 

			TotPEA= 0 
			PEAAsig1= 0 
			PEAAsig2= 0 
			PEAAsig3= 0 

			TotMon1= 0 
			Mon1Asig1 = 0  
			Mon1Asig2 = 0 
			Mon1Asig3 = 0 

			TotMon1_1= 0 

			TotPEA_2= 0 
			PEAAsig1_2= 0 
			PEAAsig2_2= 0 
			PEAAsig3_2= 0 

			TotMon2= 0 
			Mon2Asig1 = 0  
			Mon2Asig2 = 0  
			Mon2Asig3 = 0  

			TotMon2_1= 0 

				end If 

				registro = registro + 1
				If registro Mod 2 = 0 Then
					clase = "e_tr_even" 
				Else
					clase = "e_tr_odd"
				End If	
				

			TotPEA= TotPEA + CDBL(RSCuad("TotPEA")) 
			PEAAsig1= PEAAsig1 + CDBL(RSCuad("PEAAsig1")) 
			PEAAsig2= PEAAsig2 + CDBL(RSCuad("PEAAsig2")) 
			PEAAsig3= PEAAsig3 + CDBL(RSCuad("PEAAsig3")) 

			TotMon1= TotMon1 + CDBL(RSCuad("TotMon1")) 
			Mon1Asig1  = Mon1Asig1 + CDBL(RSCuad("Mon1Asig1")) 
			Mon1Asig2 =  Mon1Asig2 + CDBL(RSCuad("Mon1Asig2")) 
			Mon1Asig3 = Mon1Asig3 + CDBL(RSCuad("Mon1Asig3")) 

			TotMon1_1= TotMon1_1 + CDBL(RSCuad("TotMon1_1")) 


			TotPEA_2= TotPEA_2 + CDBL(RSCuad("TotPEA_2")) 
			PEAAsig1_2= PEAAsig1_2 + CDBL(RSCuad("PEAAsig1_2")) 
			PEAAsig2_2= PEAAsig2_2 + CDBL(RSCuad("PEAAsig2_2")) 
			PEAAsig3_2= PEAAsig3_2 + CDBL(RSCuad("PEAAsig3_2")) 

			TotMon2= TotMon2  + CDBL(RSCuad("TotMon2")) 
			Mon2Asig1 = Mon2Asig1 + CDBL(RSCuad("Mon2Asig1")) 
			Mon2Asig2 = Mon2Asig2 + CDBL(RSCuad("Mon2Asig2")) 
			Mon2Asig3 = Mon2Asig3 + CDBL(RSCuad("Mon2Asig3")) 


			TotMon2_1= TotMon2_1 + CDBL(RSCuad("TotMon2_1")) 
				
		%> 
      <tr>
        <td height="34" class='e_td_string1'><%response.Write(registro)%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=left> <%=RSCuad.Fields("desc_cargoFuncional")%></td>      
		<td bordercolor="#DAE8F3" class='e_td_string1' align=center ><span class="t1"><%=RSCuad.Fields("Desctipo")%></span></td>

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=RSCuad.Fields("TotPEA")%></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=RSCuad.Fields("PEAAsig1")%></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=RSCuad.Fields("PEAAsig2")%></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=RSCuad.Fields("PEAAsig3")%></font></td>

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><%=FormatNumber(RSCuad.Fields("TotMon1"),2)%></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><%=FormatNumber(RSCuad.Fields("Mon1Asig1"),2)%></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><%=FormatNumber(RSCuad.Fields("Mon1Asig2"),2)%></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><%=FormatNumber(RSCuad.Fields("Mon1Asig3"),2)%></font></td>		

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><%=FormatNumber(RSCuad.Fields("TotMon1_1"),2)%></font></td>		


        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=RSCuad.Fields("TotPEA_2")%></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=RSCuad.Fields("PEAAsig1_2")%></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=RSCuad.Fields("PEAAsig2_2")%></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=RSCuad.Fields("PEAAsig3_2")%></font></td>

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=FormatNumber(RSCuad.Fields("TotMon2"),2)%></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=FormatNumber(RSCuad.Fields("Mon2Asig1"),2)%></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=FormatNumber(RSCuad.Fields("Mon2Asig2"),2)%></font></td>		
        <td bordercolor="#DAE8F3" class='e_td_string1' align=right><%=FormatNumber(RSCuad.Fields("Mon2Asig3"),2)%></font></td>		

        <td bordercolor="#DAE8F3" class='e_td_string1' align=right bgcolor="#ECF5FF"><%=FormatNumber(RSCuad.Fields("TotMon2_1"),2)%></font></td>	
      </tr>
			<%	
			RSCuad.MoveNext
			
            Sw=0
            If  Not RSCuad.EOF Then 
	            If  (WOdei <> trim(RSCuad.Fields("CODdepe")) or  WOdeiDesc <> TRIM(RSCuad.Fields("detadepen")) )  Then  
					Sw=1
				End If
			Else
					Sw=1
			End If
           
				if Sw=1 Then  %>
			<tr style=" font-size:11px"  >  
				<td class='e_td_string1'  colspan=3  align=right><strong>TOTAL:&nbsp;</strong></td> 

				<td class='e_td_string1' align=right ><strong><%=TotPEA%></strong></td>
				<td class='e_td_string1' align=right ><strong><%=PEAAsig1%></strong></td>
				<td class='e_td_string1' align=right ><strong><%=PEAAsig2%></strong></td>
				<td class='e_td_string1' align=right><strong><%=PEAAsig3%></strong></td>

				<td class='e_td_string1' align=right><strong><%=FormatNumber(TotMon1,2)%></strong></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Mon1Asig1,2)%></strong></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Mon1Asig2,2)%></strong></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Mon1Asig3,2)%></strong></td>

				<td class='e_td_string1' align=right><strong><%=FormatNumber(TotMon1_1,2)%></strong></td> 

				<td class='e_td_string1' align=right ><strong><%=TotPEA_2%></strong></td>
				<td class='e_td_string1' align=right ><strong><%=PEAAsig1_2%></strong></td>
				<td class='e_td_string1' align=right ><strong><%=PEAAsig2_2%></strong></td>
				<td class='e_td_string1' align=right><strong><%=PEAAsig3_2%></strong></td>

				<td class='e_td_string1' align=right><strong><%=FormatNumber(TotMon2,2)%></strong></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Mon2Asig1,2)%></strong></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Mon2Asig2,2)%></strong></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Mon2Asig3,2)%></strong></td> 

				<td class='e_td_string1' align=right><strong><%=FormatNumber(TotMon2_1,2)%></strong></td> 
			</tr>
			
				<%End If
			Loop	
	
	 		RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing

			%>
      <tr>
        <td height="34" class='e_td_string1' colspan=15>&nbsp;</td>
       
      </tr>


    </table>
<%else%>
		<table width='97%' align='center'>
			<tr><td class='subtitulo' colspan='4'>No hay registros disponibles</td></tr>
		</table>
<%end if%>
	
</form>
	
	
	
	
	
	
