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


fin = request("fin")

lsperiodo = request("lsperiodo")
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lsnivel = Request.Form("lsnivel")
'lsUsuario=Request.Form("lsUsuario")

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



	SQL1 = "EXEC dbo.uspGet_PlanillaConf_Det '"&lsperiodo&"','" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsnivel& "', '" & id_proyecto& "'" 


		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
		
	
    if RSCuad.RecordCount>0 then	
	estado_Pla=RSCuad("estado_Pla")
	periodoPla=RSCuad("periodoPla")

    else
	estado_Pla=""
	periodoPla=""
    end if	
	
			
END IF

IF VALOR=2 THEN
lsperiodo = request("lsperiodo")
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lsnivel = Request.Form("lsnivel")



SQL1 = "EXEC dbo.uspGet_PlanillaConf_Det '"&lsperiodo&"','99', '99', '98', '9','" & id_proyecto& "' " 

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
		
	
    if RSCuad.RecordCount>0 then	
	estado_Pla=RSCuad("estado_Pla")
	periodoPla=RSCuad("periodoPla")

    else
	estado_Pla=""
	periodoPla=""
    end if	


END IF 


IF VALOR=3 THEN
lsperiodo = request("lsperiodo")
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lsnivel = Request.Form("lsnivel")



SQL1 = "EXEC dbo.uspGet_PlanillaConf_Det '"&lsperiodo&"','99', '99', '98','" & lsnivel& "', '" & id_proyecto& "'"


		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
		
	
    if RSCuad.RecordCount>0 then	
	estado_Pla=RSCuad("estado_Pla")
	periodoPla=RSCuad("periodoPla")

    else
	estado_Pla=""
	periodoPla=""
    end if	


END IF 


IF VALOR=4 THEN


fin = request("fin")

lsperiodo = request("lsperiodo")
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
'lsnivel = Request.Form("lsnivel")
'lsUsuario=Request.Form("lsUsuario")

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



	SQL1 = "EXEC dbo.uspGet_PlanillaConf_Det '"&lsperiodo&"','" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '9', '" & id_proyecto& "' " 

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
		
	
    if RSCuad.RecordCount>0 then	
	estado_Pla=RSCuad("estado_Pla")
	periodoPla=RSCuad("periodoPla")

    else
	estado_Pla=""
	periodoPla=""
    end if	
	
			
END IF

	%> 

	<%

	If Not RSCuad.BOF And Not RSCuad.EOF Then   
					total=0
										
	%>
	

		
<body  >	
<form name="frmMiForm1" id="frmMiForm1" METHOD="POST" ACTION="pd_dtActualizarPlanilla.asp">

<table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
      <tr style="border:0;">
        <td height="61" colspan="15" align="center" style="font-size:15px;border:0;"><BR><strong>APERTURA DE LA PRE CONFORMIDAD</strong>&nbsp;&nbsp;<img src="images/excell1.gif" title="(Exportar Excel)" onClick="VerExcelConsultarPreConf()" style="CURSOR:HAND;font-family: verdana, arial, sans-serif;font-size:4px;"></img>
		<strong><BR>PERIODO: <%=trim(RSCuad.Fields("periodo"))%></strong> 
		<br>(Estado: <%=trim(RSCuad.Fields("Desc_estadoPla"))%>)</span><br><br></td> 
      </tr>

      <tr style="font-size:12px;border:0;"  border="0">
        <th colspan="12" border="0"><div  id="detalle_regMonto"  align="LEFT"  style="HEIGHT:100%;width:100%;border:0;">
		</div></th>
      </tr>
      <tr style="font-size:9px;"  >
	  <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>	  
      <th width="20%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ODEI / OZEI</th>
	  <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">UBIGEO</th>
      <th width="30%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">APELLIDOS Y NOMBRES</th>
      <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
	  <th width="20%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO <br>FUNCIONAL</th>
      <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SUELDO</th>
	  <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>N&deg; ARMADA</strong></th>
	  <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>DIAS DE PAGO</strong></th>
	  
	  <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>MONTO DE LA  <br />ARMADA</strong></th>
      <th width="17%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">AFECTO</th>
      <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Tipo Pensi&oacute;n</th>
      <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Aporte AFP</th>
      <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Comisi&oacute;n AFP</th>
      <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Seguro AFP</th>
      <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Descuento Total</th>
       <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Neto Recibido</th>
              <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SIAF</th>
              
              <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DOC. CCP</th>
	  <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ACTUA<br>LIZAR</th>
	  <th width="17%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">OBSERVACIONES</th>

	  <th width="17%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">TIPO DE INGRESO</th>
	  <th width="17%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ESTADO CONTRATO</th>
	  <th width="15%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO <br>CONTRATACION</th>
	  
        <th width="15%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">NRO CCP</th>
        
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
			
			IF RSCuad("flagSN")="1" THEN
		       nomflagSN="SI"
		       ELSE
		       nomflagSN="NO"
		       END IF					
			
		if RSCuad.Fields("anulacion")=1 then 
			color="bgcolor=""#FFFFCE"""
		else
			color=""
		end if 
			
			

	if RSCuad.Fields("PERIODO")="TOTAL" then %>
   
  <% else%>
<tr <%=color%>>
        <td width="10%" height="34" class='e_td_string1'><%response.Write(registro)%></td>
		<td width="20%"class='e_td_string1'><span class="t4"><%=RSCuad.Fields("detadepen")%></span></td>
		<td  width="10%" class='e_td_string1'><span class="t4"><%=RSCuad.Fields("ccdd_i")%><%=RSCuad.Fields("ccpp_i")%><%=RSCuad.Fields("ccdi_i")%></span></td>      
        <td width="30%" class='e_td_string1'><%=Ucase(trim(RSCuad.Fields("Ape_Nom")))%></td>
        <td width="10%" bordercolor="#DAE8F3" class='e_td_string1'><%=trim(RSCuad.Fields("DNI"))%></td>
        <td width="20%"bordercolor="#DAE8F3" class='e_td_string1'> <%=RSCuad.Fields("funcional")%></td>      
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=FormatNumber(RSCuad.Fields("Sueldo"),2)%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=RSCuad.Fields("narmada")%></strong></font></td>
        
        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=RSCuad.Fields("DiasPago")%></strong></font></td>

        
        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=FormatNumber(RSCuad.Fields("MontoPago"),2)%></strong></font></td>
         <td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t13"><%=RSCuad.Fields("AFECTO")%></span></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=RSCuad.Fields("id_comision")%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=RSCuad.Fields("aporte_afp")%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=RSCuad.Fields("COMISION_AFP")%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=RSCuad.Fields("SEGURO_AFP")%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=RSCuad.Fields("DSC_TOTAL")%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=FormatNumber(RSCuad.Fields("neto_recibir"),2)%></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=RSCuad.Fields("SIAF")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' ><%=RSCuad.Fields("documento_ccp")%></td>
        
        
        
		<td bordercolor="#DAE8F3" class='e_td_string1' align="center"><%=nomflagSN%></font></td>					
		<td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t1">&nbsp;<%=RSCuad.Fields("Observ")%></span></td>
  		
        <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad.Fields("DescTipo_Ofc")%></font></td>

        <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad.Fields("Desc_ActivoC")%></font></td>
		<td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t1"><%=RSCuad.Fields("contratacion")%></span></td>
        <td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t1"><%=RSCuad.Fields("documento_ccp")%></span></td>
        
         
		
      </tr>
      

      
      <%	 end if 
	  
			registro = registro + 1
			periodo=""

			RSCuad.MoveNext
			Loop	
	
	 	RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
			

			

 %>
	 <tr><td height="34" class='e_td_string1' colspan=15>&nbsp;</td></tr>
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