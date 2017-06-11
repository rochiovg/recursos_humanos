<%@ Language=VBScript 
   %>
<!-- #include file="Conexion.asp"  --> 
<%
   Response.ContentType="text/html; charset=iso-8859-1"
   
  id_cc = Request.Form("id_cc")
  ccdd = Request.Form("ccdd")
  ccpp = Request.Form("ccpp")
  dpto = Request.Form("dpto")
  prov = Request.Form("prov")
  ambito = Request.Form("ambito")
  
  
	consulta1 = "EXEC dbo.PA_COBERTURA_DIST '"&id_cc&"', '"&ccdd&"', '"&ccpp&"' , '"&ambito&"' "  

		Set RsP = Server.CreateObject("ADODB.Recordset")
   		RsP.cursorlocation=3
   		RsP.Open consulta1, MiCone, 3,3

		If  Not RsP.BOF And Not RsP.EOF Then   %>

<table width='89%' align="left" id="Exportar_a_Excel" style="font-family:Arial; font-size:10px"  border="1" cellpadding="2" cellspacing="2" bordercolor="#DFDFDF">
   <tr height="10px">
      <th colspan="18"  bgcolor="#F2F3F4"  ><span class="aplicacion" style="height:30px">COBERTURA: DEPARTAMENTO <%=dpto%> - PROVINCIA <%=prov%></th>
   </tr>
   <tr>
   <tr height="10px">
      <th colspan="18"  bgcolor="#F2F3F4"  ><span class="aplicacion" style="height:30px"><a href="#" onclick="verProvincias ('<%=id_cc%>', '<%=ccdd%>', '<%=dpto%>')" title="Ver Reporte a nivel provincial">Retroceder</a></th>
   </tr>
   <tr>
      <th width="36" rowspan="2" bgcolor="#E4E4E4" style="font-size:11px;">Nro</th>
      <th rowspan="2" bgcolor="#E4E4E4" style="font-size:11px;">DISTRITO</th>
      <th width="60" rowspan="2" bgcolor="#E4E4E4" style="font-size:11px;">META SELECCI&Oacute;N</th>
      <th width="57" rowspan="2" bgcolor="#E4E4E4" style="font-size:11px;">INSCRITOS</th>
      <th width="57" rowspan="2" bgcolor="#E4E4E4" style="font-size:11px;">COBERTURA INS.</th>
      <th bgcolor="#33CCCC"colspan="2"  style="font-size:11px;">Evaluaci&oacute;n Auto</th>
      <th bgcolor="#339966"colspan="5"  style="font-size:11px;">Evaluaci&oacute;n de CVs</th>
      <th colspan="2" bgcolor="#FF9933" style="font-size:11px;" >Capacitaci&oacute;n</th>
      <th colspan="2" bgcolor="#EA95FF" style="font-size:11px;" >Entrevista Personal</th>
      <th colspan="2" bgcolor="#7691FA"   style="font-size:11px;">Selecci&oacute;n</th>
   </tr>
   <tr>
   	  <th width="43"   bgcolor="#CCFFCC"    style="font-size:10px;">Aprob.</th>
      <th width="43"   bgcolor="#CCFFCC"    style="font-size:10px;">% Aprob.</th>
      <th width="43"   bgcolor="#D5F0E2"    style="font-size:10px;">Fisicos</th>
      <th width="52"   bgcolor="#D5F0E2"    style="font-size:10px;">Pend Eval</th>
      <th width="52"   bgcolor="#D5F0E2"    style="font-size:10px;">Aprob</th>
      <th width="52"   bgcolor="#D5F0E2"    style="font-size:10px;">Desap</th>
      <th width="58"   bgcolor="#D5F0E2"    style="font-size:10px;">% Aprobados</th>
      <th width="55" bgcolor="#FFD5AA"    style="font-size:10px;">Aprob</th>
      <th width="49" bgcolor="#FFD5AA"    style="font-size:10px;">% Ap</th>
      <th width="61"    bgcolor="#F7D7FF"    style="font-size:10px;">Aprob</th>
      <th width="58"    bgcolor="#F7D7FF"   style="font-size:10px;">% Ap</th>
      <th width="52" bgcolor="#D8DFFE"   style="font-size:10px;">Sele</th>
      <th width="55"="89" bgcolor="#D8DFFE"   style="font-size:10px;" widthwhere ccdd_i=''>%Sele </th>
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
			if RsP.Fields("meta_contrato")="0" then
				col = " bgcolor=""#DFDFDF"" " 
			else
				col=" bgcolor=""#D9ECFF"" "
			end if
		end if
		
      %>
   <tr <%=col%> height="10px" >
      <td><%response.Write(cont)%></td>     
      <% if RsP.Fields("dist")="TOTAL" or RsP.Fields("meta_contrato")="0" THEN %> 
      <td><%=RsP.Fields("dist")%> </td>
      <% else %>
      <td><a href="#" onclick="verZonas('<%=id_cc%>', '<%=RsP.Fields("ccdd")%>', '<%=RsP.Fields("ccpp")%>', '<%=RsP.Fields("ccdi")%>','<%=dpto%>' ,'<%=prov%>' , '<%=RsP.Fields("dist")%>')" title="Ver Zonas"><%=RsP.Fields("dist")%></a>
	  </td>
      <% end if %>
      <td align="center" ><%=RsP.Fields("meta_contrato")%></td>
      <td align="center" ><%=RsP.Fields("inscritos")%></td>
      <td align="center" ><%=RsP.Fields("inscritos_por")%> %</td>
      <td align="center"><%=RsP.Fields("aprobo_auto")%></td>
      <td align="center"><%=RsP.Fields("aprobo_auto_por")%></td>
      <td align="center">0</td>
      <td align="center">0</td>
      <td align="center"><%=RsP.Fields("aprobados_cv")%></td>
      <td align="center">0</td>
      <td align="center"><%=RsP.Fields("aprobados_cv_por")%> %</td>
      <td align="center"><%=RsP.Fields("aprobados_capac")%></td>
      <td align="center"><%=RsP.Fields("aprobados_capac_por")%> %</td>
      <td align="center"><%=RsP.Fields("aprobados_entrevista")%></td>
      <td align="center"><%=RsP.Fields("aprobados_entrevista_por")%> %</td>
      <td align="center"><%=RsP.Fields("seleccionado")%></td>
      <td align="center"><%=RsP.Fields("seleccionado_por")%> %</td>
      <% 
               registro = registro + 1
               RsP.MoveNext
               Loop	
               RsP.close %>
   </tr>
   <tr  >
      <td height="16"  colspan="16" bgcolor="#D7F2FF" ><span class="alerta5" >(*) Los Porcentajes obtenidos en cada proceso estan calculados sobre los Totales de las metas de Selecci&oacute;n</td>
   </tr>
</table>
<%		else 
      		response.Write("No hay registros")
        end If
%>
