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
Response.Addheader "Content-Disposition", "attachment; filename=CONFORMIDAD.xls" 
Response.ContentType = "application/save"
Response.Expires = 0'
Response.Buffer = True 
Response.Flush 
	
fin = request("fin")
	
fechayhora= Now()
varfin=request("lsfin") '7
id_proyecto=session("id_proyecto")

	SQL1 = "exec dbo.uspGet_PlanillaConf_Directorio '"&fin&"','"&id_proyecto&"'"	

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3

	If Not RSCuad.BOF And Not RSCuad.EOF Then   
		total=0
	%>

<table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px" cellspacing="0">
      <tr>
        <td height="61" colspan="11" align="center" style="font-size:16px;"><strong>PRE CONFORMIDAD DE LOCACI&Oacute;N DE SERVICIOS &minus; PROYECTO SISFOH 4ta. ETAPA</strong></td>
      </tr>
      <tr align="center" >
        <td valign="middle">N&deg;</td>
        <td valign="middle">ODEI / OZEI</td>
        <td valign="middle">APELLIDOS Y NOMBRE</td>
        <td valign="middle">DNI</td>
        <td>PERIODO</td>
        <td>CARGO <br />
        FUNCIONAL</td>
        <td>CARGO<br />CONTRATACION</td>
        <td>SUELDO</td>
        <td>N&deg; ARMADA</td>
        <td>MONTO 
        DE LA <br />
        ARMADA</td>
        <td>OBSERVACIONES</td>
      </tr>
       <%
			'periodo=""
			SIAF = 	RSCuad.Fields("SIAF")
			registro = 0		
			WFlagSN = TRIM(RSCuad.Fields("FlagSN")) 
			Tot_TotMontoPagado	= 0 
			Tot_MontoPagado	= 0 
			Do While Not RSCuad.EOF
			response.Flush()
			
	            If  WFlagSN <> trim(RSCuad.Fields("FlagSN"))  or registro = 0 Then  %> 
			<tr class='e_td_string1' style="font-size:13px">  
				<td height="25"  colspan=3 bgcolor="#ECF5FF">
				<strong>&nbsp;&nbsp;<%=RSCuad.Fields("estadoFlagSN")%></strong></td>
			</tr>  

				<% 
				WFlagSN = TRIM(RSCuad.Fields("FlagSN")) 
				Tot_MontoPagado	= 0 
				end If 

				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	

				'ARM = ARM + cDbl(RSCuad.Fields("MontoPago"))
				%>
      <tr>

		<%
				registro = registro + 1

				Tot_TotMontoPagado	= Tot_TotMontoPagado + CDBL(RSCuad("MontoPago")) 
				Tot_MontoPagado	= Tot_MontoPagado + CDBL(RSCuad("MontoPago")) 
		%>
      
        <td><%response.Write(registro)%></td>
        <td ><span class="t4"><%=RSCuad.Fields("detadepen")%></span></td>
        <td align="left"><%=Ucase(trim(RSCuad.Fields("Ape_Nom")))%></td>
        <td align="center" class="t"><%=trim(RSCuad.Fields("DNI"))%></td>
        <td align="center" class="t"><%=Ucase(trim(RSCuad.Fields("periodo")))%></td>
        <td class="t" align="center"> <%=RSCuad.Fields("funcional")%></td>
        <td class="t" align="center" ><span class="t1"><%=RSCuad.Fields("contratacion")%></span></td>
        <td class="t" align="right" ><%=FormatNumber(RSCuad.Fields("Sueldo"),2)%></td>
        <td class="t" align="center"><%=RSCuad.Fields("narmada")%></td>
        <td class="t" align="right"  ><%=FormatNumber(RSCuad.Fields("MontoPago"),2)%></td>
          <td class="t" align="center"><%=RSCuad.Fields("Observ")%></td>
      </tr>
      <%
	  
			'registro = registro + 1
			'periodo=""

			RSCuad.MoveNext

            Sw=0
            If  Not RSCuad.EOF Then 
   	            If  WFlagSN <> trim(RSCuad.Fields("FlagSN"))  Then  
					Sw=1
				End If
			Else
					Sw=1
			End If%>
           
				<%if Sw=1 Then  %>
			
		<tr style="font-size:13px" >
         <td  bgcolor="#F2F2F2" colspan="9" align="right" height="20"><strong>TOTAL&nbsp;:&nbsp;&nbsp;</strong></td>
         <td bgcolor="#F2F2F2" align="right" ><strong><%=FormatNumber(Tot_MontoPagado,2)%></strong></td>
         <td bgcolor="#F2F2F2" align="left">&nbsp;</td>
		</tr> 
		
				<%End If%>

			<%Loop	
	
	 		RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
 %>
		<tr style="font-size:13px" >
         <td  bgcolor="#F2F2F2" colspan="9" align="right" height="20"><strong> DOC CCP:  <%=RSCuad.Fields("documento_ccp")%>----------<% if Trim(SIAF)<>"" then %> SIAF : <%=SIAF%>  -----  <%end if%> TOTAL GENERAL &nbsp;:&nbsp;&nbsp;</strong></td>
         <td bgcolor="#F2F2F2" align="right" ><strong><%=FormatNumber(Tot_TotMontoPagado,2)%></strong></td>
         <td bgcolor="#F2F2F2" align="left">&nbsp;</td>
		</tr> 

 <tr>
        <td colspan="11" align="right">Fecha y hora de impresion:<%=fechayhora%></td>
      </tr>
    </table>
<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if%>