<%@ Language=VBScript%>
<!-- #include file="Conexion.asp"  --> 
<%
	Server.ScriptTimeout = 1800 
	'Response.ContentType="text/html; charset=iso-8859-1"
	Response.ContentType="application/x-msexcel"
	Response.Addheader "Content-Disposition", "attachment; filename=REPORTE.xls"
	Response.ContentType = "application/save"
	Response.Expires = 0
	Response.Buffer = true 
	vccdd = Request("xdpto")
	vccpp = Request("xprov")
	vccdi = Request("xdist")
	vzona = Request("xzona")
	vcargo = Request("xcargo")
	vdesc = Request("xdesc")
	
	if vcargo="" or isnull(vcargo) then 
		varCargo="0"
		vartiCargo="0"
		vidcc="0"
	else
		vcargo=split(vcargo, "*")
		vartiCargo=vcargo(0)
		varCargo=vcargo(1)
		vidcc=vcargo(2)
	end if	

	if vdesc="" or isnull(vdesc) then 
		vdesdpto="S/D"
		vdesprov="S/D"
		vdesdist="S/D"
		vdeszona="S/D"
	else
		vdesc=split(vdesc, "*")
		vdesdpto = vdesc(0)
		vdesprov = vdesc(1)
		vdesdist = vdesc(2)
		vdeszona = vdesc(3)
	end if	
  
	consulta1 = "EXEC dbo.PA_COBERTURA_SECCION '"&vidcc&"', '"&vccdd&"', '"&vccpp&"', '"&vccdi&"', '"&vzona&"' "  
	
	Set RsP = Server.CreateObject("ADODB.Recordset")
  RsP.cursorlocation=3
  RsP.Open consulta1, MiCone, 3,3
	'response.Write(consulta1)
	If Not RsP.BOF And Not RsP.EOF Then
%>
<table width='140%' align="left" id="Exportar_a_Excel" style="font-family:Arial; font-size:10px"  border="1" cellpadding="2" cellspacing="2" bordercolor="#DFDFDF">
   <tr height="20px">
      <th colspan="23"  bgcolor="#F2F3F4"><span class="aplicacion">COBERTURA: DEPARTAMENTO <%=vdesdpto%> - PROVINCIA <%=vdesprov%> - DISTRITO <%=vdesdist%> - ZONA <%=vdeszona%>
      </th>
   </tr>
   <tr>
      <td width="30"  align="center" rowspan="2" bgcolor="#E4E4E4" style="font-size:11px;"><strong>Nro</strong></td>
      <td width="100" align="center" rowspan="2" bgcolor="#E4E4E4" style="font-size:11px;"><strong>SECCI&Oacute;N</strong></td>
      <td width="70"  align="center" rowspan="2" bgcolor="#E4E4E4" style="font-size:11px;"><strong>PERSONAL PARA CAMPO</strong></td>
      <td width="90"  align="center" rowspan="2" bgcolor="#E4E4E4" style="font-size:11px;"><strong>PERSONAL PARA CAPACITACION</strong></td>
      <td width="120" align="center" colspan="2" bgcolor="#CCFFCC" style="font-size:11px;"><strong>TOTAL DE POSTULANTES INSCRITOS</strong></td>
      <td width="240" align="center" colspan="3" bgcolor="#33CCCC" style="font-size:11px;"><strong>EVALUACI&Oacute;N CURRICULAR DEL PERSONAL</strong></td>
      <td width="180" align="center" colspan="2" bgcolor="#FFD5AA" style="font-size:11px;"><strong>PERSONAL SELECCIONADO PARA ASISTIR AL CURSO DE CAPACITACI&Oacute;N</strong></td>
      <td width="270" align="center" colspan="3" bgcolor="#D5F0E2" style="font-size:11px;"><strong>ENTREVISTA PERSONAL<br>(SOLO DEBE GENERARSE PARA EL CARGO DE INSTRUCTOR NACIONAL)</strong></td>
      <td width="380" align="center" colspan="6" bgcolor="#FF9933" style="font-size:11px;"><strong>RESULTADOS DE CAPACITACI&Oacute;N</strong></td>
      <td width="200" align="center" colspan="3" bgcolor="#7691FA" style="font-size:11px;"><strong>PERSONAL SELECCIONADO PARA CAMPO</strong> </td>
   </tr> 
   <tr>
   	  <td width="60" align="center" bgcolor="#CCFFCC" style="font-size:10px;"><strong>ABS</strong></td>
      <td width="60" align="center" bgcolor="#CCFFCC" style="font-size:10px;"> <strong>%</strong></td>
      
      <td width="100" align="center" bgcolor="#33CCCC" style="font-size:10px;"><strong>PRESELECCIONADO</strong></td>
      <td width="60" align="center" bgcolor="#33CCCC" style="font-size:10px;"> <strong>%</strong></td>
      <td width="80" align="center" bgcolor="#33CCCC" style="font-size:10px;"><strong>NO SELECCIONADO</strong></td>
      
      <td width="90" align="center" bgcolor="#FFD5AA" style="font-size:10px;"><strong>TITULAR</strong></td>
      <td width="90" align="center" bgcolor="#FFD5AA" style="font-size:10px;"><strong>RESERVA</strong></td>
      
      <td width="90" align="center" bgcolor="#D5F0E2" style="font-size:10px;"><strong>TITULAR</strong></td>
      <td width="90" align="center" bgcolor="#D5F0E2" style="font-size:10px;"><strong>RESERVA</strong></td>
      <td width="90" align="center" bgcolor="#D5F0E2" style="font-size:10px;"><strong>NO APTO</strong></td>
      
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:10px;"><strong>TITULARES</strong></td>
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:10px;"> <strong>%</strong></td>
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:10px;"><strong>RESERVA</strong></td>
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:10px;"> <strong>%</strong></td>
      <td width="80" align="center" bgcolor="#FF9933" style="font-size:10px;"><strong>NO SELECCIONADO</strong></td>
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:10px;"> <strong>%</strong></td>
      
      <td width="80" align="center" bgcolor="#7691FA" style="font-size:10px;"><strong>SELECCIONADOS</strong></td>
      <td width="60" align="center" bgcolor="#7691FA" style="font-size:10px;"> <strong>%</strong></td>
      <td width="60" align="center" bgcolor="#7691FA" style="font-size:10px;"><strong>RESERVA</strong></td>
   </tr>
   <% 	registro = 0					
      Do While Not RsP.EOF
          If registro Mod 2 = 0 Then
              clase = "e_tr_even"
          Else
              clase = "e_tr_odd"
          End If	
          cont = registro+1 

		if RsP.Fields("dist")="TOTAL" THEN
			col = " bgcolor=""#FFFFBF"" "
		else 
			col=" bgcolor=""#D9ECFF"" "
		end if
		
      %>
   <tr height="10px" >
      <td <%=col%> align="center"><%response.Write(cont)%></td>      
      <td <%=col%> align="left"><%=RsP.Fields("seccion")%> </td>
      <td align="center"><%=RsP.Fields("meta_contrato")%></td>
      <td align="center"><%=RsP.Fields("meta_capacita")%></td>
      <td align="center"><%=RsP.Fields("inscritos")%></td>
      <td align="center"><%=RsP.Fields("inscritos_por")%> %</td>
      <td align="center"><%=RsP.Fields("aprobo_auto")%></td>
      <td align="center"><%=RsP.Fields("aprobo_auto_por")%> %</td>
      <td align="center">0</td>
      <td align="center"><%=RsP.Fields("aprobados_cv")%></td>
      <td align="center">0</td>
      <td align="center"><%=RsP.Fields("aprobados_entrevista")%></td>
      <td align="center">0</td>
      <td align="center">0</td>
      <td align="center"><%=RsP.Fields("aprobados_capac")%></td>
      <td align="center"><%=RsP.Fields("aprobados_capac_por")%> %</td>
      <td align="center">0</td>
      <td align="center">0</td>
      <td align="center">0</td>
      <td align="center">0</td>
      <td align="center"><%=RsP.Fields("seleccionado")%></td>
      <td align="center"><%=RsP.Fields("seleccionado_por")%> %</td>
      <td align="center">0</td>
      <% 
				 registro = registro + 1
				 RsP.MoveNext
			 Loop	
			 RsP.close
			%>
   </tr>
   <tr>
      <td height="16" colspan="18" bgcolor="#D7F2FF" ><span class="alerta5" >(*) Los Porcentajes obtenidos en cada proceso estan calculados sobre los Totales de las metas de Selecci&oacute;n</td>
   </tr>
</table>
<%
	else 
  	response.Write("No hay registros")
  end If
%>
