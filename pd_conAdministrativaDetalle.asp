<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
Server.ScriptTimeout = 230400  

Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsUsuario = Request.Form("lsUsuario")
lstipoReport = Request("lstipoReport")
lstipoCons = Request("lstipoCons")
idProyecto=Session("id_proyecto")
ls_fuente = Request("ls_fuente")


'Response.Write("lstipoReport="&lstipoReport)
'Response.Write("lstipoCons="&lstipoCons)
'Response.End 

if lstipoCons = "1" and lstipoReport = "" Then
		lstipoReport= 1 
End If 
'Response.Write("lstipoReport="&lstipoReport)
'Response.Write("ls_fuente="&ls_fuente)
Select case lstipoReport
case 1
	'----- Cargos Presupuestados ----- 
	WTitulo		= "CARGOS PRESUPUESTADOS&nbsp; DE LA PEA " 
	SQL1 = "execute Dbo.uspGet_PresupuestoDirectorio '1','"&idProyecto&"', '" &ls_fuente&"'"
	Set RS3 = Server.CreateObject("ADODB.recordset") 
	RS3.cursorlocation=3 
	RS3.Open SQL1, MiCone, 3,3 

	SQL0 = "execute Dbo.uspGet_PresupuestoDirectorio '0','"&idProyecto&"', '" &ls_fuente&"'"
	Set RSTOT = Server.CreateObject("ADODB.recordset") 
	RSTOT.cursorlocation=3 
	RSTOT.Open SQL0, MiCone, 3,3 
	WTotal = 0 
    Do While Not RSTOT.EOF
		WTotal = RSTOT.Fields("total")

        RSTOT.MoveNext
    Loop	
    RSTOT.close 
    Set RSTOT = Nothing 

case 2
	'----- Solicitudes Presupuestarias CCPP  ----- 

	WTitulo		= "SOLICITUDES DE CERTIFICACION PRESUPUESTARIA&nbsp;" 
	SQL1 = "execute Dbo.uspGet_CcargoDirectorio '"&idProyecto&"', '" &ls_fuente&"'"
	
	Set RS3 = Server.CreateObject("ADODB.recordset") 
	RS3.cursorlocation=3 
	RS3.Open SQL1, MiCone, 3,3 

case 3
	'----- Convocatorias Vs Cargos Convocados ----- 
	WTitulo		= "CONVOCATORIAS VS CARGOS CONVOCADOS" 
	SQL1 = "execute Dbo.uspGet_ConvocatoriaDirectorio '"&idProyecto&"', '" &ls_fuente&"'"
	Set RS3 = Server.CreateObject("ADODB.recordset") 
	RS3.cursorlocation=3 
	RS3.Open SQL1, MiCone, 3,3 

case 4
	'----- Oficios de Contratación ----- 
	WTitulo		= "OFICIOS DE CONTRATACION&nbsp;" 
	SQL1 = "execute Dbo.uspGet_OfContratacionDirectorio '1', '"&idProyecto&"', '" &ls_fuente&"'"
	Set RS3 = Server.CreateObject("ADODB.recordset") 
	RS3.cursorlocation=3 
	RS3.Open SQL1, MiCone, 3,3 



End select 

lsRol = CStr(Session("txtTipoUsuarioValido"))
lsUsuario =  Session("txtUsuarioValido")
lsUbigeo = Session("Ubigeo") 
If lsUbigeo <> "" then


%>
<html>
<head>
<title>Consulta de Cargos Presupuestados / CCP</title> 
<link href="Styles/pro_drop_1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="Styles/inei.css">


</head> 
<body leftmargin="5" topMargin="1"> 





<table width='95%' align=CENTER border="1" cellpadding="1" cellspacing="2" cellspacing="1" bordercolor="#DAE8F3"  >
<tr><td colspan="13" align=CENTER><span class="titulo1" ><strong><%=WTitulo%></strong><BR><BR></span></td></tr>


<%Select case lstipoReport
case 1%> 


	

<%If  Not RS3.BOF And Not RS3.EOF Then %> 

	<tr><td colspan="13"><span class="e_td_string1" style="font-size:11px"><strong>FUENTE DE FINANCIAMIENTO&nbsp; :&nbsp;&nbsp;</strong><%=RS3.Fields("desc_FuenteFto")%><BR>
	<strong>ORGANO RESPONSABLE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;</strong><%=RS3.Fields("NOMBRE")%>
	<span class="e_td_string1"></td></tr>
                
	<tr style="font-size:11px">
	<th width="5%"  bgcolor="#DAE8F3" class="dato3">Nº</th>
	<th width="25%" bgcolor="#DAE8F3" class="dato3">CARGO FUNCIONAL</th>
	<th width="27%" bgcolor="#DAE8F3" class="dato3">CARGO DE CONTRATACION</th>
	<th width="05%" bgcolor="#DAE8F3" class="dato3">TIPO RED</th>
	<th width="05%" bgcolor="#DAE8F3" class="dato3">TOTAL PEA</th>
	<th width="10%" bgcolor="#DAE8F3" class="dato3">PERIODO</th>
	<th width="08%" bgcolor="#DAE8F3" class="dato3">SUELDO</th>
	<th width="10%" bgcolor="#DAE8F3" class="dato3">MONTO TOTAL</th>
	</tr>
	<%If  Not RS3.BOF And Not RS3.EOF Then %> 
			<tr class='dato3' style=" font-size:10px">
				<td height="27" class='e_td_string1'>&nbsp;</td>
				<td class='e_td_string1' colspan=6 align=right><strong>	TOTAL&nbsp;GENERAL :&nbsp;&nbsp;&nbsp;&nbsp; </strong></td> 
			    <td class='e_td_string1' align=right><%=FormatNumber(WTotal,2)%></td>
				</tr>
			<%registro = 0		
			WFFto = RS3.Fields("codi_FuenteFto")
			WActividad = RS3.Fields("id_Actividad")
            Do While Not RS3.EOF
	            If  WActividad <> RS3.Fields("id_Actividad") or registro = 0 Then  %> 

			<tr class='dato3' style=" font-size:10px">
				<td  height="39" class='e_td_string1' colspan=7 bgcolor="#F3F7FC"><strong>	ACTIVIDAD&nbsp; :&nbsp;&nbsp; <%=RS3.Fields("Desc_Actividad")%> </strong></td>
			</tr>
				<%WActividad = RS3.Fields("id_Actividad")
				end If 
				
                If registro Mod 2 = 0 Then
                    clase = "e_tr_even"
                Else
                    clase = "e_tr_odd"
                End If	
		if 	RS3.Fields("nPeriodo_P")=0 then	
		registro = registro + 1
                %>
                <tr style=" font-size:11px" >
	<td height="27" class='e_td_string1' align=center bgcolor="#EEE3A8"><%response.Write(registro)%>&nbsp;</td>
	<td class='e_td_string1' bgcolor="#EEE3A0"><%=RS3.Fields("desc_CargoFuncional")%></td>
	<td class='e_td_string1' bgcolor="#EEE3A0"><%=RS3.Fields("DESC_CARG")%></td>
	<td class='e_td_string1' bgcolor="#EEE3A0" align=letf><%=RS3.Fields("tipo")%></td>
	<td class='e_td_string1' bgcolor="#EEE3A0" align=right><%=RS3.Fields("totalPEA_P")%></td>
	<td class='e_td_string1' bgcolor="#EEE3A0">&nbsp;&nbsp;</td>
	<td class='e_td_string1' bgcolor="#EEE3A0" align=right><%=FormatNumber(RS3.Fields("MontoUnitario"),2)%></td>
	<td class='e_td_string1' bgcolor="#EEE3A0" align=right><%=FormatNumber(RS3.Fields("total"),2)%></td>
	<td align=center width=1%><span style="font:Arial;font-size:9px; color: #ffffff; "> <%=RS3.Fields("id_presupuesto")%></span></td>
	</tr>
	<%else%>
    <tr style=" font-size:11px" >
	<td height="27" class='e_td_string1' align=center >&nbsp;</td>
	<td class='e_td_string1' ><%=RS3.Fields("desc_CargoFuncional")%></td>
	<td class='e_td_string1' ><%=RS3.Fields("DESC_CARG")%></td>
	<td class='e_td_string1' align=letf><%=RS3.Fields("tipo")%></td>
	<td class='e_td_string1' align=right><%=RS3.Fields("totalPEA_P")%></td>
	<td class='e_td_string1' ><%=RS3.Fields("nPeriodo_P")%>&nbsp;&nbsp;<%=RS3.Fields("tperiodo")%></td>
	<td class='e_td_string1' align=right><%=FormatNumber(RS3.Fields("MontoUnitario"),2)%></td>
	<td class='e_td_string1' align=right><%=FormatNumber(RS3.Fields("total"),2)%></td>
	<td align=center width=1%><span style="font:Arial;font-size:9px; color: #ffffff; "> <%=RS3.Fields("id_presupuesto")%></span></td>
	</tr> 
    
    <%end if%>
           
            <%RS3.MoveNext
            Loop	
            RS3.close 
            Set RS3 = Nothing 
            %>

	</table>
	<% else %>
    <table width='85%' align='center'>
         <tr><td class='subtitulo' colspan='4'><br><br>No Existe Información Registrada</td></tr>
    </table>
	<% end If%> 
	<table border="0" width="85%" align="center">
		<tr style="font-size:11px"><td height="27"  Class="e_td_string1" BgColor="White"  align=right colspan="10" ><strong>Fecha&nbsp;:</strong>&nbsp;&nbsp;<%=day(date())&"/"&month(date())&"/"&year(date())%>
		&nbsp;&nbsp;&nbsp;&nbsp;<strong>Hora&nbsp;:</strong>&nbsp;&nbsp;<%=time()%>
		</td></tr>
	</table> 
	<br>


    <%end if%>
	
<%case 2%>


<%If  Not RS3.BOF And Not RS3.EOF Then %> 

	<tr><td colspan="14"><span class="TxtGrilla" style="font-size:11px">
	<strong>ORGANO RESPONSABLE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;</strong><%=RS3.Fields("NOMBRE")%><BR>
	<span class="TxtGrilla"></td></tr>
                
	<tr style="font-size:11px">
	<th width="5%"  bgcolor="#DAE8F3" class="dato3">Nº</th>
	<th width="25%" bgcolor="#DAE8F3" class="dato3">CARGO FUNCIONAL</th>
	<th width="29%" bgcolor="#DAE8F3" class="dato3">CARGO DE CONTRATACION</th>
	<th width="05%" bgcolor="#DAE8F3" class="dato3">TIPO RED</th>
	<th width="05%" bgcolor="#DAE8F3" class="dato3">DEPEN<br>DENCIA</th> 
	<th width="05%" bgcolor="#DAE8F3" class="dato3">CANT. PEA</th>
	<th width="05%"  bgcolor="#DAE8F3" class="dato3" >PERIODO</th>
	<th width="03%"  bgcolor="#DAE8F3" class="dato3" >TOTAL<BR>ARM.</th>
	<th width="08%" bgcolor="#DAE8F3" class="dato3" >SUELDO</th>
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >MONTO TOTAL</th>

	<th width="07%"  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
	<th width="05%"  bgcolor="#DAE8F3" class="dato3" >Nº CONVO<br>CATORIAS</th>
    <th width="10%"  bgcolor="#DAE8F3" class="dato3" >CANT.<br>PEA<br>CONT.</th>
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >CANT.<br>BAJAS<br>EJEC.</th>
    <th width="10%"  bgcolor="#DAE8F3" class="dato3" >CANT.<br>ALTAS<br>EJEC.</th>
	<th width="10%"  bgcolor="#DAE8F3" class="dato3" >MONTO<BR>PAGADO</th>
<!--
	<th width="07%"  bgcolor="#DAE8F3" class="dato3" >PEA<br>CONT.</th>
-->
	</tr>

	<%If  Not RS3.BOF And Not RS3.EOF Then %> 
			<tr class='CabeGrilla' style=" font-size:10px">
			<%registro = 0		
			WDocSolicita = TRIM(RS3.Fields("docSolicita_CCP")) 
			WDocOTPP     = TRIM(RS3.Fields("Documento_CCP")) 
			
			Tot_TotMontoCCP	= 0 
			Tot_TotMontoPagado	= 0 
			Tot_MontoCCP	= 0 
			Tot_MontoPagado	= 0 
            Do While Not RS3.EOF
	            If  (WDocSolicita <> trim(RS3.Fields("docSolicita_CCP")) or  WDocOTPP <> TRIM(RS3.Fields("Documento_CCP")) ) or registro = 0 Then  %> 


			<tr class='e_td_string1' style=" font-size:10px">  
				<td height="30"  colspan=3 bgcolor="#ECF5FF">
				<strong>Doc. Solicitante&nbsp; :</strong>&nbsp;&nbsp;<%=RS3.Fields("docSolicita_CCP")%><br>
				<strong>Doc. Aprobación:</strong>&nbsp;&nbsp;<%=RS3.Fields("Documento_CCP")%>
				</td>
				<td height="30" class='TxtGrilla' colspan=13 bgcolor="#ECF5FF">
				<strong>Fecha&nbsp; :&nbsp;&nbsp;</strong> <%=RS3.Fields("fecha_docSolicitaCCP")%><br>
				<strong>Fecha&nbsp; :&nbsp;&nbsp;</strong> <%=RS3.Fields("fecha_DocCCP")%>
				</td>
			</tr>  

				<% 
				WDocSolicita = TRIM(RS3.Fields("docSolicita_CCP")) 
				WDocOTPP     = TRIM(RS3.Fields("Documento_CCP")) 


				Tot_MontoCCP	= 0 
				Tot_MontoPagado	= 0 

				%>


				<%end If 
            
				registro = registro + 1
                If registro Mod 2 = 0 Then
                    clase = "e_tr_even"
                Else
                    clase = "e_tr_odd"
                End If	

				Tot_TotMontoCCP		= Tot_TotMontoCCP + CDBL(RS3("total")) 
				Tot_TotMontoPagado	= Tot_TotMontoPagado + CDBL(RS3("MontoPagado")) 
				Tot_MontoCCP	= Tot_MontoCCP + CDBL(RS3("total")) 
				Tot_MontoPagado	= Tot_MontoPagado + CDBL(RS3("MontoPagado")) 

		        'If TOT_CT > 0 Then Response.Write( Round((TOT_CT/TOT_CT)*100,1) )	Else   Response.Write("0") End If

                %>

	<tr style=" font-size:11px"  >
	<td height="30" class='e_td_string1' align=center><%response.Write(registro)%>&nbsp;</td>
	<td class='e_td_string1'><%=RS3.Fields("desc_CargoFuncional")%></td> 
	<td class='e_td_string1'><%=RS3.Fields("DESC_CARG")%></td> 
	<td class='e_td_string1' align=letf><%=RS3.Fields("tipo")%></td> 
	<td class='e_td_string1' align=letf><%=MID(RS3.Fields("depen"),1,5)%></td> 

	<td class='e_td_string1' align=right><%=RS3.Fields("totalPEA_CCP")%></td>
	<td class='e_td_string1'><%=RS3.Fields("nPeriodo_CCP")%>&nbsp;&nbsp;<%=RS3.Fields("tperiodo")%></td>
	<td class='e_td_string1' align=right><%=RS3.Fields("totalArmadas")%></td>

	<td class='e_td_string1' align=right><%=FormatNumber(RS3.Fields("MontoUnitario"),2)%></td>
	<td class='e_td_string1' align=right><%=FormatNumber(RS3.Fields("total"),2)%></td>

	<td class='e_td_string1' >
				<span align="left" style="font:Arial, Helvetica, sans-serif; font-size:9px; color: #DF0038; "> 
				<%=RS3.Fields("estadoDes")%></span>
	</td>
	
	<td class='e_td_string1' align=right><%=RS3.Fields("Num_Conv")%></td>
	<td class='e_td_string1' align=right><%=RS3.Fields("totalPEACont")%></td>
    <td class='e_td_string1' align=right><%=RS3.Fields("bajas_eje")%></td>
    <td class='e_td_string1' align=right><%=RS3.Fields("Altas_ejec")%></td>
	<td class='e_td_string1' align=right><%=FormatNumber(RS3.Fields("MontoPagado"),2)%></td>

	<td align=center width=1%><span style="font:Arial;font-size:9px; color: #ffffff"> <%=RS3.Fields("id_CCPresupuestario")%>,<%=RS3.Fields("id_Presupuesto")%></span></td>

	<!--
	<td Class="e_td_string1"  align="middle"> 
		<img alt="Ver PEA Contratada" border="0" height=16 width=16 src="images/PEA1.ico" style="CURSOR: hand" onclick="window.open('pd_conPEAContartadaCCP.asp?valCCP=<%=RS3("id_CCPresupuestario")%>&amp;wwwHora=<%=time()%>','','top=10,left=10,scrollbars=yes,width=850,height=550,resizable=1')" > 
	</td> 
	-->
	</tr>
           
           
            <%RS3.MoveNext%>
           
            <%Sw=0
            If  Not RS3.EOF Then 
	            If  (WDocSolicita <> trim(RS3.Fields("docSolicita_CCP")) or  WDocOTPP <> TRIM(RS3.Fields("Documento_CCP")) )   Then  
					Sw=1
				End If
			Else
					Sw=1
			End If%>
           
				<%if Sw=1 Then  %>
			<tr style=" font-size:11px"  >  
				<td class='e_td_string1'  colspan=9  align=right><strong>Total:</strong></td> 
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Tot_MontoCCP,2)%></strong></td>
				<td class='e_td_string1' colspan=5></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Tot_MontoPagado,2)%></strong></td>
			</tr>
				<%End If%>

            
            <%Loop	
            RS3.close 
            Set RS3 = Nothing 
            %>
            
			<tr style=" font-size:11px"  >  
				<td class='e_td_string1'  colspan=9  align=right><strong>TOTAL GENERAL:</strong></td> 
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Tot_TotMontoCCP,2)%></strong></td>
				<td class='e_td_string1' colspan=5></td>
				<td class='e_td_string1' align=right><strong><%=FormatNumber(Tot_TotMontoPagado,2)%></strong></td>
			</tr>

	</table>
	<% else %>
    <table width='95%' align='center'>
         <tr><td class='subtitulo' colspan='4'><br><br>No Existe Información Registrada</td></tr>
    </table>
	<% end If%>

    <%end if%>

<%case 3%> 
	<tr><td colspan="12"><span class="TxtGrilla" style="font-size:11px">
	<span class="TxtGrilla"></td></tr>
                
	<tr style="font-size:11px">
	<th width="5%"  bgcolor="#DAE8F3" class="dato3">Nº</th>
	<th width="25%" bgcolor="#DAE8F3" class="dato3">CARGO FUNCIONAL</th>
	<th width="29%" bgcolor="#DAE8F3" class="dato3">CARGO DE CONTRATACION</th>
	<th width="05%" bgcolor="#DAE8F3" class="dato3">TIPO RED</th>
	<th width="25%" bgcolor="#DAE8F3" class="dato3">DOC. SOLICITANTE</th>
	<th width="25%" bgcolor="#DAE8F3" class="dato3">FECHA DOC. SOLICITANTE</th>
<!--
	<th width="07%"  bgcolor="#DAE8F3" class="dato3" >PEA<br>CONT.</th>
-->
	</tr>

	<%If  Not RS3.BOF And Not RS3.EOF Then %> 
			<tr class='CabeGrilla' style=" font-size:10px">
			<%registro = 0		
			WnumConv = TRIM(RS3.Fields("num_Convocatoria")) 
			WFechaDoc     = TRIM(RS3.Fields("fechaInicio")) 
			
            Do While Not RS3.EOF
	            If  (WnumConv <> trim(RS3.Fields("num_Convocatoria")) or  WFechaDoc <> TRIM(RS3.Fields("fechaInicio")) ) or registro = 0 Then  %> 

			<tr class='e_td_string1' style=" font-size:10px">  
				<td height="30" class='TxtGrilla' colspan=7 bgcolor="#ECF5FF">
				<strong>Convocatoria&nbsp; :</strong>&nbsp;&nbsp;<%=RS3.Fields("num_Convocatoria")%>&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;<%=RS3.Fields("Desc_Convocatoria")%>&nbsp;&nbsp;&nbsp;<strong>Fecha inicio:</strong>&nbsp;&nbsp;<%=RS3.Fields("fechaInicio")%> &nbsp;&nbsp;
				<strong>Fecha fin:&nbsp;&nbsp;</strong><%=RS3.Fields("fechaFin")%>&nbsp;&nbsp;<strong>Fecha Fin de Proceso:</strong>&nbsp;&nbsp;<%=RS3.Fields("fechaFinProceso")%>
				<strong>Estado:</strong>&nbsp;&nbsp;<strong>
				<span align="left" style="font:Arial, Helvetica, sans-serif; font-size:9px; color: #DF0038; "> 
				<%=RS3.Fields("estadoDes")%></span></strong></td>
				
			</tr>  
				<% 
				WnumConv = TRIM(RS3.Fields("num_Convocatoria")) 
				WFechaDoc     = TRIM(RS3.Fields("fechaInicio")) 

				end If 
            
				registro = registro + 1
                If registro Mod 2 = 0 Then
                    clase = "e_tr_even"
                Else
                    clase = "e_tr_odd"
                End If	
                %>

	<tr style=" font-size:11px"  >
	<td height="30" class='e_td_string1' align=center><%response.Write(registro)%>&nbsp;</td>
	<td class='e_td_string1'><%=RS3.Fields("desc_CargoFuncional")%></td> 
	<td class='e_td_string1'><%=RS3.Fields("DESC_CARG")%></td> 
	<td class='e_td_string1' align=letf><%=RS3.Fields("tipo")%></td> 
	<td class='e_td_string1'><%=RS3.Fields("docSolicita_CCP")%></td> 
	<td class='e_td_string1'><%=RS3.Fields("fecha_docSolicitaCCP")%></td> 
		<td align=center width=2%><span style="font:Arial;font-size:9px; color: #ffffff"> <%=RS3.Fields("id_ConvocatoriaCargo")%>, <%=RS3.Fields("id_CCPresupuestario")%>,<%=RS3.Fields("id_Presupuesto")%></span></td>
	
	</tr>
           
            <%RS3.MoveNext
            Loop	
            RS3.close 
            Set RS3 = Nothing 
            %>


	</table>
	<% else %>
    <table width='95%' align='center'>
         <tr><td class='subtitulo' colspan='4'><br><br>No Existe Información Registrada</td></tr>
    </table>
	<% end If%>

<%case 4
	'----- Oficios de Contratación ----- 
%> 

	<tr><td colspan="13"><span class="TxtGrilla" style="font-size:11px">
	<!--<strong>ORGANO RESPONSABLE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;</strong>DNCE<BR>
	<span class="TxtGrilla">
	-->
	</td></tr>
                
	<tr style="font-size:11px">
	<th width="5%"  bgcolor="#DAE8F3" class="dato3">Nº</th>
	<th width="25%" bgcolor="#DAE8F3" class="dato3">CARGO FUNCIONAL</th>
	<th width="29%" bgcolor="#DAE8F3" class="dato3">CARGO DE CONTRATACION</th>
	<th width="05%"  bgcolor="#DAE8F3" class="dato3" >PERIODO</th> 
	<th width="08%" bgcolor="#DAE8F3" class="dato3" >SUELDO</th>

	<th width="05%" bgcolor="#DAE8F3" class="dato3">Nº CONV.</th>
	<th width="05%" bgcolor="#DAE8F3" class="dato3">FECHA INI. CONT</th> 
	<th width="05%" bgcolor="#DAE8F3" class="dato3">FECHA FIN. CONT</th> 
	<th width="05%" bgcolor="#DAE8F3" class="dato3">FECHA CONT.</th>

	<th width="07%"  bgcolor="#DAE8F3" class="dato3" >ESTADO</th> 
    <th width="07%"  bgcolor="#DAE8F3" class="dato3" >C&Oacute;DIGO DE ENV&Iacute;O</th> 
	<th width="05%" bgcolor="#DAE8F3" class="dato3">CANT. PEA CONT.</th>
	<th width="07%"  bgcolor="#DAE8F3" class="dato3" >PEA<br>CONT.</th>
	</tr> 

	<%If  Not RS3.BOF And Not RS3.EOF Then %> 
			<tr class='CabeGrilla' style=" font-size:10px">
			<%registro = 0		

			WDocContrato = TRIM(RS3.Fields("resolucion")) 
			WDocOTPP     = TRIM(RS3.Fields("Documento_CCP")) 
			
            Do While Not RS3.EOF
	            If  (WDocContrato <> trim(RS3.Fields("resolucion")) or  WDocOTPP <> TRIM(RS3.Fields("Documento_CCP")) ) or registro = 0 Then  %> 

			<tr class='e_td_string1' style=" font-size:10px">  
				<td height="30" class='TxtGrilla' colspan=3 bgcolor="#ECF5FF">
				<strong>Doc. Contrato&nbsp; :</strong>&nbsp;&nbsp;<%=RS3.Fields("resolucion")%><br>
				<strong>Doc. CCP Aprobación:</strong>&nbsp;&nbsp;<%=RS3.Fields("Documento_CCP")%>
				</td>
				<td height="30" class='TxtGrilla' colspan=10 bgcolor="#ECF5FF">
				<strong>Fecha&nbsp; :&nbsp;&nbsp;</strong> <%=RS3.Fields("fecha_Resolucion")%><br>
				<strong>Fecha&nbsp; :&nbsp;&nbsp;</strong> <%=RS3.Fields("fecha_DocCCP")%>
				</td>
			</tr>  
				<% 
				WDocContrato = TRIM(RS3.Fields("resolucion")) 
				WDocOTPP     = TRIM(RS3.Fields("Documento_CCP")) 
				end If 
            
				registro = registro + 1
                If registro Mod 2 = 0 Then
                    clase = "e_tr_even"
                Else
                    clase = "e_tr_odd"
                End If	
                %>
	<tr style=" font-size:11px"  >
	<td height="30" class='e_td_string1' align=center><%response.Write(registro)%>&nbsp;</td>
	<td class='e_td_string1'><%=RS3.Fields("desc_CargoFuncional")%></td> 
	<td class='e_td_string1'><%=RS3.Fields("DESC_CARG")%></td> 
	<td class='e_td_string1'><%=RS3.Fields("nPeriodo_CCP")%>&nbsp;&nbsp;<%=RS3.Fields("tperiodo")%></td>
	<td class='e_td_string1' align=right><%=FormatNumber(RS3.Fields("MontoUnitario"),2)%></td>

	<td class='e_td_string1' align=center><%=RS3.Fields("num_Convocatoria")%></td> 

	<td class='e_td_string1' align=right><%=RS3.Fields("fechaInicio")%></td>
	<td class='e_td_string1' align=right><%=RS3.Fields("fechaFin")%></td>
	<td class='e_td_string1' align=right><%=RS3.Fields("fecha_Contrato")%></td>


	<td class='e_td_string1' ><%=RS3.Fields("estadoDes")%></td>
    <td class='e_td_string1' ><%=RS3.Fields("cenvdatos")%></td>
	<td class='e_td_string1' align=right><%=RS3.Fields("totalPEA_OfC")%></td>
	
	<td Class="e_td_string1"  align="middle"> 
		<img alt="Ver PEA Contratada" border="0" height=16 width=16 src="images/PEA1.ico" style="CURSOR: hand" onClick="window.open('pd_conOfcConttratados.asp?lsidOficio=<%=RS3("id_OfContratacion")%>&amp;lsresolucion=<%=RS3("resolucion")%>&amp;lsfecha_Resolucion=<%=RS3("fecha_Resolucion")%>&amp;lsfechaInicio=<%=RS3("fechaInicio")%>&amp;lsfechaFin=<%=RS3("fechaFin")%>&amp;lscargoF=<%=RS3.Fields("desc_CargoFuncional")%>&amp;wwwHora=<%=time()%>','','top=10,left=10,scrollbars=yes,width=850,height=550,resizable=1')" > 
	</td> 

<td align=center width=2%><span style="font:Arial;font-size:9px; color: #ffffff"> <%=RS3.Fields("id_OfContratacion")%>, <%=RS3.Fields("id_ConvocatoriaCargo")%></span></td>

	</tr>
           
            <%RS3.MoveNext
            Loop	
            RS3.close 
            Set RS3 = Nothing 
            %>

	</table>
	<% else %>
    <table width='95%' align='center'>
         <tr><td class='subtitulo' colspan='4'><br><br>No Existe Información Registrada</td></tr>
    </table>
	<% end If%>

<%End select %> 
 
<%Micone.Close%> 
	<table border="0" width="95%" align="center">
		<tr style="font-size:11px"><td height="27"  Class="TxtGrilla" BgColor="White"  align=right colspan="10" ><strong>Fecha&nbsp;:</strong>&nbsp;&nbsp;<%=day(date())&"/"&month(date())&"/"&year(date())%>
		&nbsp;&nbsp;&nbsp;&nbsp;<strong>Hora&nbsp;:</strong>&nbsp;&nbsp;<%=time()%>
		</td></tr>
	</table> 
	<br>

</form>
</body>
</html>

<%Else
Response.Redirect("default.asp")
End If%>

