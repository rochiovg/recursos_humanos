<%@ Language=VBScript %>
<%session.lcid=2057%>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 .t1 {mso-number-format:"\@";}
 .t11 {mso-number-format:"\@";}
 .t12 {mso-number-format:"\@";}
 .t13 {mso-number-format:"\@";}
 .t14 {mso-number-format:"\@";}
 .t15 {mso-number-format:"\@";}
 .t16 {mso-number-format:"\@";}
 </style>
<%


Server.ScriptTimeout = 230400  

Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0'
Response.Buffer = True 
Response.Flush 
	
fin = request("fin")


lsperiodo = request("lsperiodo")
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lsnivel = Request.Form("lsnivel")
'lsUsuario=Request.Form("lsUsuario")
lsUsuario=Session("id_usuario")
id_proyecto=session("id_proyecto")

lsRol = CStr(Session("txtTipoUsuarioValido"))

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
VALOR=Request.Form("VALOR")



IF VALOR=1 THEN

	if lsRol=18 then 
		SQL1 = "EXEC dbo.uspGet_PlanillaConf_Det_Mon '"&lsperiodo&"','" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsnivel& "', '" & id_proyecto& "', '"&lsUsuario&"' " 
	else

	SQL1 = "EXEC dbo.uspGet_PlanillaConf_Det '"&lsperiodo&"','" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsnivel& "', '" & id_proyecto& "' " 

end if
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
	

		
<body >	
<form name="frmMiForm1" id="frmMiForm1" METHOD="POST" ACTION="pd_dtActualizarPlanilla.asp">

<table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
      <tr style="border:0;">
        <td height="61" colspan="13" align="center" style="font-size:15px;border:0;"><BR><strong>APROBACION DE LA PRE CONFORMIDAD</strong>&nbsp;&nbsp;<img src="images/excell1.gif" title="(Exportar Excel)" onClick="VerExcel()" style="CURSOR:HAND;font-family: verdana, arial, sans-serif;font-size:4px;"></img>
		<strong><BR>PERIODO: <%=trim(RSCuad.Fields("periodo"))%></strong> 
		<br>(Estado: <%=trim(RSCuad.Fields("Desc_estadoPla"))%>)</span><br><br></td> 
      </tr>
      <tr style="font-size:12px;border:0;"  border="0">
        <th colspan="12" border="0"><div  id="detalle_regMonto"  align="LEFT"  style="HEIGHT:100%;width:100%;border:0;">
		</div></th>
      </tr>
      <tr style="font-size:9px;"  >
	  <th width="10%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>	  
      <th width="20%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ODEI / OZEI</th>
	  <th width="10%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">UBIGEO</th>
      <th width="30%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">APELLIDOS Y NOMBRES</th>
      <th width="10%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
	  <th width="20%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO <br>FUNCIONAL</th>
      <th width="100%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SUELDO</th>
	  <th width="100%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>N&deg; ARMADA</strong></th>
	  <th width="100%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>DIAS DE PAGO</strong></th>
	  
	  <th width="100%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>MONTO DE LA  <br />ARMADA</strong></th>
      
       <th width="100%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Neto Recibido</th>
      <th width="100%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ACTUA<br>LIZAR</th>
	  <th width="17%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">OBSERVACIONES</th>
	  <th width="17%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">TIPO DE INGRESO</th>
	  <th width="17%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ESTADO CONTRATO</th>
      <th width="17%" COLspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&Uacute;MERO RECIBO</th>
        <th width="17%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA<BR>EMISI&Oacute;N</th>
	  <th width="17%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA INICIO</th>
	  <th width="17%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA FIN</th>
	  <th width="15%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO <br>CONTRATACION</th>
      <th width="15%" rowspan="2" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Anular</th>
	  
      </tr>
      <tr style="font-size:9px;"  >
        <th bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SERIE</th>
        <th bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">NUMERACI&Oacute;N</th>
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
			
		if RSCuad.Fields("anulacion")=1 then 
			color="bgcolor=""#FFFFCE"""
		else
			color=""
		end if 

	if RSCuad.Fields("PERIODO")="TOTAL" then 
	else

  %>
<tr <% =color%>>
        <td width="10%" height="34"  class='e_td_string1'><%response.Write(registro)%></td>
		<td width="20%"class='e_td_string1'><span class="t4"><%=RSCuad.Fields("detadepen")%></span></td>
		<td  width="10%" class='e_td_string1'><span class="t4"><%=RSCuad.Fields("ccdd_i")%><%=RSCuad.Fields("ccpp_i")%><%=RSCuad.Fields("ccdi_i")%></span></td>      
        <td width="30%" class='e_td_string1'><%=Ucase(trim(RSCuad.Fields("Ape_Nom")))%></td>
        <td width="10%" bordercolor="#DAE8F3" class='e_td_string1'><%=trim(RSCuad.Fields("DNI"))%>
        		<img title="Consulta de Pagos y seguimiento de Reemplazos, por DNI" border="0" height=16 width=16 src="images/PEA1.ico" style="CURSOR: hand" onClick="window.open('pd_dtConsultaPlanillaPago_PEA.asp?lsDNI=<%=trim(RSCuad.Fields("DNI"))%>&amp;wwwHora=<%=time()%>','','top=10,left=10,scrollbars=yes,width=850,height=550,resizable=1')" > 
        </td>
        <td width="20%"bordercolor="#DAE8F3" class='e_td_string1'> <%=RSCuad.Fields("funcional")%></td>      
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=FormatNumber(RSCuad.Fields("Sueldo"),2)%></td>
         <td bordercolor="#DAE8F3" class='e_td_string1' align="center"><strong><%=RSCuad.Fields("narmada")%></strong></font></td>
        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=RSCuad.Fields("DiasPago")%></strong></font></td>
        
        <td bordercolor="#DAE8F3" class='e_td_string1'><strong><%=FormatNumber(RSCuad.Fields("MontoPago"),2)%></strong></font></td>	
       
        <td bordercolor="#DAE8F3" class='e_td_string1' ><%=FormatNumber(RSCuad.Fields("neto_recibir"),2)%></td>
        	
        <% if  estado_Pla =3 or estado_Pla =4 or RSCuad.Fields("anulacion")=1 then %>
	    <td  class="alerta4" style="font-size:9px;"><input name="<%=RSCuad.Fields("id_per")%>"  type="checkbox" id="<%=RSCuad.Fields("id_per")%>" value="1" <% if RSCuad.Fields("FlagSN") ="1" then response.Write("checked=""checked""") end if %> onClick="ActflagSN(this.id,'<%=RSCuad.Fields("periodoPla")%>','<%=RSCuad.Fields("id_Contratos")%>','<%=RSCuad.Fields("estado_Pla")%>',this.value)" disabled /><div style="display:none" id="<%="divR"&RSCuad.Fields("id_per")%>"></div> </td>
		<td bordercolor="#DAE8F3" class='e_td_string1'>
		<div id="id2<%=RSCuad.Fields("id_per")%>" style="display:none"></div>
		<textarea name="txt<%=RSCuad.Fields("id_per")%>" id="txt<%=RSCuad.Fields("id_per")%>"  cols="13" rows="2" class="e_texto"   onblur="ActObs('<%=RSCuad.Fields("id_per")%>','<%=RSCuad.Fields("periodoPla")%>','<%=RSCuad.Fields("id_Contratos")%>',this.value)" validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml;@_.0123456789 "   onKeyUp="return maximaLongitud(this,60)"  style="width:200;text-transform: uppercase;" disabled><%=trim(RSCuad.Fields("Observ"))%></textarea></td>
		
		<%else %>
	    <td  class="alerta4" style="font-size:9px;"><input name="<%=RSCuad.Fields("id_per")%>"  type="checkbox" id="<%=RSCuad.Fields("id_per")%>" value="1" <% if RSCuad.Fields("FlagSN") ="1" then response.Write("checked=""checked""") end if %> onClick="ActflagSN(this.id,'<%=RSCuad.Fields("periodoPla")%>','<%=RSCuad.Fields("id_Contratos")%>',this.value)" /><div style="display:none" id="<%="divR"&RSCuad.Fields("id_per")%>"></div></td>
		<td bordercolor="#DAE8F3" class='e_td_string1'>
		<div id="id2<%=RSCuad.Fields("id_per")%>" style="display:none"></div>		
		<textarea name="txt<%=RSCuad.Fields("id_per")%>" id="txt<%=RSCuad.Fields("id_per")%>" cols="13" rows="2" class="e_texto"   onblur="ActObs('<%=RSCuad.Fields("id_per")%>','<%=RSCuad.Fields("periodoPla")%>','<%=RSCuad.Fields("id_Contratos")%>',this.value)" validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml;@_.0123456789 " onKeyUp="return maximaLongitud(this,60)"  style="width:200;text-transform: uppercase; width:200" ><%=trim(RSCuad.Fields("Observ"))%></textarea></td>
  
        <%end if%>  

        <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad.Fields("DescTipo_Ofc")%></font></td>
      <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad.Fields("Desc_ActivoC")%></td>

        <td bordercolor="#DAE8F3" class='e_td_string1' id="ids<%=RSCuad.Fields("id_contratos")%>"><input name="txt<%=RSCuad.Fields("id_contratos")%>"validchars="0123456789Ee-" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt<%=RSCuad.Fields("id_contratos")%>" value="<%=RSCuad.Fields("SERIE")%>"  onblur="guardarRecibo('<%=RSCuad.Fields("ID_PER")%>','<%=RSCuad.Fields("ID_CONTRATOS")%>','<%=RSCuad.Fields("PERIODOPLA")%>',this.value,1,'<%=lsUsuario%>',<%=id_proyecto%>)" size="5" maxlength="5" /></td>
        
<% IF isnull(RSCuad.Fields("NUMERACION"))  then         
valor="00000"  
else
valor= RSCuad.Fields("NUMERACION")  
end if%>
        <td bordercolor="#DAE8F3" class='e_td_string1' id="idn<%=RSCuad.Fields("id_contratos")%>" ><input name="txt1<%=RSCuad.Fields("id_contratos")%>" value="<%=valor%>"validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt1<%=RSCuad.Fields("id_contratos")%>" 
 
onblur="guardarRecibo('<%=RSCuad.Fields("ID_PER")%>','<%=RSCuad.Fields("ID_CONTRATOS")%>','<%=RSCuad.Fields("PERIODOPLA")%>',this.value,2,'<%=lsUsuario%>',<%=id_proyecto%>)" size="10" maxlength="7" /></td>


<td bordercolor="#DAE8F3" class='e_td_string1' id="idf<%=RSCuad.Fields("id_contratos")%>" ><input name="txtF<%=RSCuad.Fields("id_contratos")%>" value="<%=RSCuad.Fields("fecha_emision")%>"validchars="0123456789/" onKeyPress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtF<%=RSCuad.Fields("id_contratos")%>" onKeyUp="this.value=formateafecha(this.value);"  
onblur="guardarRecibo('<%=RSCuad.Fields("ID_PER")%>','<%=RSCuad.Fields("ID_CONTRATOS")%>','<%=RSCuad.Fields("PERIODOPLA")%>',this.value,3,'<%=lsUsuario%>',<%=id_proyecto%>)" size="10" maxlength="10" /></td>

        <td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t14"><%=RSCuad.Fields("fechaInicio")%></span></td>
		<td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t15"><%=RSCuad.Fields("fechaFin")%></span></td>
		<td bordercolor="#DAE8F3" class='e_td_string1' ><span class="t16"><%=RSCuad.Fields("contratacion")%></span></td>
		
        <td  class="alerta4" style="font-size:9px;"><input name="<%=RSCuad.Fields("id_Contratos")&"A"%>"  type="checkbox" id="<%=RSCuad.Fields("id_Contratos")&"A"%>" value="0" <% if RSCuad.Fields("anulacion") ="1" then response.Write("checked=""checked""  disabled ") end if %> onClick="Anular_pago('<%=RSCuad.Fields("periodoPla")%>','<%=RSCuad.Fields("id_Contratos")%>',this.value,<%=id_proyecto%>)" /><div style="display:none" id="<%="divRA"&RSCuad.Fields("id_Contratos")%>"></div></td>
        
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
	 <tr><td height="34" class='e_td_string1' colspan=12>&nbsp;</td></tr>
	 <tr><td height="34" class='e_td_string1' colspan=12>&nbsp;</td></tr>
	 <tr><td height="34" class='e_td_string1' colspan=12>&nbsp;</td></tr>
 
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