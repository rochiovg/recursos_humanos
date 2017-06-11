<%@ Language=VBScript 
   %>
<!-- #include file="Conexion.asp"  --> 
<%
   Response.ContentType="text/html; charset=iso-8859-1"
   
  id_cc = Request.Form("id_cc")
  ccdd = Request.Form("ccdd")
  ccpp = Request.Form("ccpp")
  ccdi = Request.Form("ccdi")
  dpto = Request.Form("dpto")
  prov = Request.Form("prov")
  dist = Request.Form("dist")
  
	consulta1 = "EXEC dbo.PA_COBERTURA_ZONA '"&id_cc&"', '"&ccdd&"', '"&ccpp&"', '"&ccdi&"' "  

		Set RsP = Server.CreateObject("ADODB.Recordset")
   		RsP.cursorlocation=3
   		RsP.Open consulta1, MiCone, 3,3

		If  Not RsP.BOF And Not RsP.EOF Then   %>
  <table height="20" width="20" id="Exportar_a_Excel" style="font-family:Arial; font-size:9px" border="0" bordercolor="#DFDFDF">
    <tr height="20px">
      <td align="center" valign="middle">
        <form action="reporte.asp" method="post" target="_blank" id="FormularioExportacion_">
          <img src="images/excell1.gif" style="cursor:pointer" title="EXPORTAR A EXCEL" onclick="javascript:exporta_esta_zon('<%=ccdd%>','<%=ccpp%>','<%=ccdi%>','<%=dpto+"*"+prov+"*"+dist%>')"/>
          <input type="hidden" id="datos_a_enviar" name="datos_a_enviar" />
        </form>
     </td>
    </tr>
  </table>

	<table width='80%' align="left" id="Exportar_a_Excel" style="font-family:Arial; font-size:9px"  border="1" cellpadding="2" cellspacing="2" bordercolor="#DFDFDF">
   <tr height="20px">
      <th colspan="23"  bgcolor="#F2F3F4"><span class="aplicacion">COBERTURA: DEPARTAMENTO <%=dpto%> - PROVINCIA <%=prov%> - DISTRITO <%=dist%></span></th>
   </tr>
   <tr height="20px">
      <th colspan="23"  bgcolor="#F2F3F4"><span class="aplicacion"><a href="#" onclick="verDistritos ('<%=id_cc%>', '<%=ccdd%>', '<%=ccpp%>', '<%=dpto%>', '<%=prov%>')" title="Ver Reporte a nivel distrital">Retroceder</a></span></th>
   </tr>
   <tr>
      <td width="30"  align="center" rowspan="2" bgcolor="#E4E4E4" style="font-size:9px;"><strong>Nro</strong></td>
      <td width="100" align="center" rowspan="2" bgcolor="#E4E4E4" style="font-size:9px;"><strong>Z O N A</strong></td>
      <td width="70"  align="center" rowspan="2" bgcolor="#E4E4E4" style="font-size:9px;"><strong>PERSONAL PARA CAMPO</strong></td>
      <td width="90"  align="center" rowspan="2" bgcolor="#E4E4E4" style="font-size:9px;"><strong>PERSONAL PARA CAPACITACION</strong></td>
      <td width="120" align="center" colspan="2" bgcolor="#CCFFCC" style="font-size:9px;"><strong>TOTAL DE POSTULANTES INSCRITOS</strong></td>
      <td width="240" align="center" colspan="3" bgcolor="#33CCCC" style="font-size:9px;"><strong>EVALUACI&Oacute;N CURRICULAR DEL PERSONAL</strong></td>
      <td width="180" align="center" colspan="2" bgcolor="#FFD5AA" style="font-size:9px;"><strong>PERSONAL SELECCIONADO PARA ASISTIR AL CURSO DE CAPACITACI&Oacute;N</strong></td>
      <td width="270" align="center" colspan="3" bgcolor="#D5F0E2" style="font-size:9px;"><strong>ENTREVISTA PERSONAL<br>(SOLO DEBE GENERARSE PARA EL CARGO DE INSTRUCTOR NACIONAL)</strong></td>
      <td width="380" align="center" colspan="6" bgcolor="#FF9933" style="font-size:9px;"><strong>RESULTADOS DE CAPACITACI&Oacute;N</strong></td>
      <td width="200" align="center" colspan="3" bgcolor="#7691FA" style="font-size:9px;"><strong>PERSONAL SELECCIONADO PARA CAMPO</strong> </td>
   </tr> 
   <tr>
   	  <td width="60" align="center" bgcolor="#CCFFCC" style="font-size:9px;"><strong>ABS</strong></td>
      <td width="60" align="center" bgcolor="#CCFFCC" style="font-size:9px;"> <strong>%</strong></td>
      
      <td width="100" align="center" bgcolor="#33CCCC" style="font-size:9px;"><strong>PRESELECCIONADO</strong></td>
      <td width="60" align="center" bgcolor="#33CCCC" style="font-size:9px;"> <strong>%</strong></td>
      <td width="80" align="center" bgcolor="#33CCCC" style="font-size:9px;"><strong>NO SELECCIONADO</strong></td>
      
      <td width="90" align="center" bgcolor="#FFD5AA" style="font-size:9px;"><strong>TITULAR</strong></td>
      <td width="90" align="center" bgcolor="#FFD5AA" style="font-size:9px;"><strong>RESERVA</strong></td>
      
      <td width="90" align="center" bgcolor="#D5F0E2" style="font-size:9px;"><strong>TITULAR</strong></td>
      <td width="90" align="center" bgcolor="#D5F0E2" style="font-size:9px;"><strong>RESERVA</strong></td>
      <td width="90" align="center" bgcolor="#D5F0E2" style="font-size:9px;"><strong>NO APTO</strong></td>
      
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:9px;"><strong>TITULARES</strong></td>
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:9px;"> <strong>%</strong></td>
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:9px;"><strong>RESERVA</strong></td>
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:9px;"> <strong>%</strong></td>
      <td width="80" align="center" bgcolor="#FF9933" style="font-size:9px;"><strong>NO SELECCIONADO</strong></td>
      <td width="60" align="center" bgcolor="#FF9933" style="font-size:9px;"> <strong>%</strong></td>
      
      <td width="80" align="center" bgcolor="#7691FA" style="font-size:9px;"><strong>SELECCIONADOS</strong></td>
      <td width="60" align="center" bgcolor="#7691FA" style="font-size:9px;"> <strong>%</strong></td>
      <td width="60" align="center" bgcolor="#7691FA" style="font-size:9px;"><strong>RESERVA</strong></td>
   </tr>
   <% 	registro = 0					
      Do While Not RsP.EOF
          If registro Mod 2 = 0 Then
              clase = "e_tr_even"
          Else
              clase = "e_tr_odd"
          End If	
          cont = registro+1 

		if RsP.Fields("det")="TOTAL" THEN
			col = " bgcolor=""#FFFFBF"" "
		else 
			if RsP.Fields("meta_contrato")="0" then
				col = " bgcolor=""#DFDFDF"" " 
			else
				col=" bgcolor=""#D9ECFF"" "
			end if
		end if
		
      %>
   <tr <%=col%> height="16px" >
      <td><%response.Write(cont)%></td>     
      <% if RsP.Fields("det")="TOTAL" or RsP.Fields("meta_contrato")="0" THEN %> 
      <td><%=RsP.Fields("det")%> </td>
      <% else %>
      <td><a href="#" onclick="verSeccion('<%=id_cc%>', '<%=RsP.Fields("ccdd")%>', '<%=RsP.Fields("ccpp")%>', '<%=RsP.Fields("ccdi")%>', '<%=RsP.Fields("det")%>','<%=dpto%>' ,'<%=prov%>','<%=dist%>' )" title="Ver Secci&oacute;n"><%=RsP.Fields("det")%></a>
	  </td>
      <% end if %>
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
      </tr>
      
      <% 
               registro = registro + 1
               RsP.MoveNext
               Loop	
               RsP.close %>
   
   <tr  >
      <td height="10" colspan="23" bgcolor="#D7F2FF" ><span class="alerta5" >(*) Los Porcentajes obtenidos en cada proceso estan calculados sobre los Totales de las metas de Selecci&oacute;n</td>
   </tr>
</table>

<%		else 
      		response.Write("No hay registros")
        end If
%>
