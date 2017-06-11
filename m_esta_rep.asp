<%@ Language=VBScript%>
<!-- #include file="Conexion.asp"  --> 

<%
Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.ContentType="text/html; charset=iso-8859-1"

lsRol = CStr(Session("txtTipoUsuarioValido"))
varSede = Request("lsDPTO")
varRol = Request("lsRol")
vartipo= Request("tipo")
id_proyecto=Session("id_proyecto") 
codigoMeta=Session("codigoProyecto")

if varRol="" or isnull(varRol) then 
  varCargo="0"
  vartiCargo="0"
  varCCargo="0"
else
  varRol=split(varRol, "*")
  vartiCargo=varRol(0)
  varCargo=varRol(1)
  varCCargo=varRol(2)
end if



'response.Write(id_proyecto)
'response.write(lsRol &"/"& varSede &"/"& varRol &"/"& vartipo &"/"& id_proyecto &"/"& codigoMeta)
'response.End()

if id_proyecto=103 OR id_proyecto = 139 OR id_proyecto = 156 OR id_proyecto = 155  then
  consulta1 = "EXEC dbo.PA_FICHA_ESTADISTICAS_WELCOME_ECE_DEMO '99','99','" & varCargo & "','" & vartiCargo & "','" & id_Proyecto & "', '"&varCCargo&"', '"& codigoMeta &"' "  
  
  if vartipo = 2  then
    consulta1 = "EXEC dbo.PA_FICHA_ESTADISTICAS_WELCOME_ECE_DISTRITO_DEMO '99','99','" & varCargo & "','" & vartiCargo & "','" & id_Proyecto & "', '"&varCCargo&"', '"& codigoMeta &"' "  
  end if
  
  if id_proyecto = 139 OR  id_proyecto = 156  then
    consulta1 = "EXEC dbo.PA_FICHA_ESTADISTICAS_WELCOME_EDNOM_DEMO '99','99','" & varCargo & "','" & vartiCargo & "','" & id_Proyecto & "', '"&varCCargo&"', '"& codigoMeta &"' "  
  end if
  
  Set RsP = Server.CreateObject("ADODB.Recordset")
  RsP.cursorlocation=3
  RsP.Open consulta1, MiCone, 3,3
  
  If Not RsP.BOF And Not RsP.EOF Then  
%>

<%
  end if
  
else 
  consulta1 = "EXEC dbo.PA_FICHA_ESTADISTICAS_WELCOME '99','99','" & varCargo & "','" & vartiCargo & "','" & id_Proyecto & "', '"&varCCargo&"', '"& codigoMeta &"' "  
  
  Set RsP = Server.CreateObject("ADODB.Recordset")
  RsP.cursorlocation=3
  RsP.Open consulta1, MiCone, 3,3

  response.write(varSede)
  response.write("/")
  response.write(vartipo)
  		
  If Not RsP.BOF And Not RsP.EOF Then  
    if varSede<>"99" then 
%>
          
<% 
	else 
	
	if codigoMeta<>"0051" AND codigoMeta<>"0053" then%>
    
	<table  width='89%' align="left"  id="Exportar_a_Excel"  style="font-family:Arial; font-size:10px"  >
      <tr height="10px">
        <th colspan="18"  bgcolor="#F2F3F4"  ><span class="aplicacion" style="height:30px">COBERTURA POR DEPARTAMENTO</span></th>
      </tr>
      <tr>
        <th width="36" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">Nro</th>
        <th colspan="2" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">DEPARTAMENTO</th>
        <th width="60" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">META SELECCI&Oacute;N</th>
        <th width="57" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">INxCRITOS</th>
        <th bgcolor="#339966"colspan="5"  style="font-size:11px;">Evaluaci&oacute;n de CVs</th>
        <th colspan="2" bgcolor="#FF9933" style="font-size:11px;" >Conocimientos y competencias</th>
        <th colspan="2" bgcolor="#EA95FF" style="font-size:11px;" >Entrevista Personal</th> <th colspan="2" bgcolor="#7691FA" style="font-size:11px;">Selecci&oacute;n</th>
      </tr>
      <tr>
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
        <%registro = 0					
          Do While Not RsP.EOF
            If registro Mod 2 = 0 Then
              clase = "e_tr_even"
            Else
              clase = "e_tr_odd"
            End If
			
            cont = registro+1 
                            
			if met = 0 then 
			  cobertura = 0 
			else 
			  cobertura= CINT((prese/met)*100) 
			end if
		%>
        <tr class='<%=clase%>' height="10px" >
          <td style="font-size:9px;"><%response.Write(cont)%> &nbsp;</td>
          <td colspan="2"   style="font-size:9px;"><%=RsP.Fields("nombre")%></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("metaCon")%></span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;"><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;" ALIGN=right><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("nro_cvs")%></span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;" ALIGN=right><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("cv_faltante")%></span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;" ALIGN=right><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("aproboCV")%></span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;" ALIGN=right><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("desaproCv")%></span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;" ALIGN=right><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("aproboCV"))%>%</span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("totaLFinPSi")%></span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("totaLFinPSi"))%>%</span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal; " ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("totalEntr")%></span></td>
          <td  style="font-size:9px; color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("totalEntr"))%>%</td>
          <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("SeleccionadosT")%></span></td>
          <td  style="font-size:9px;color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("SeleccionadosT"))%>%</td>
          <% 
			tmetacapa=tmetacapa + CInt(RsP.Fields("meta_capa"))
			tmetacon=tmetacon + CInt(RsP.Fields("metacon"))
			tIns= tIns + CInt(RsP.Fields("insc"))
			tAprCV= tAprCV + CInt(RsP.Fields("aproboCV"))
			tPsico= tPsico + CInt(RsP.Fields("totaLFinPSi"))
			tEntrev= tEntrev + CInt(RsP.Fields("totalEntr"))
			tSelecc = tSelecc + CInt(RsP.Fields("SeleccionadosT"))
			tnro_cvs= tnro_cvs + CDbl(RsP.Fields("nro_cvs"))
			tDesaCV= tDesaCV + CInt(RsP.Fields("desaproCv"))
			txrev= txrev + CDbl(RsP.Fields("cv_faltante"))

			if tmeta = 0 then
			 cober =0 
			 else 
			 cober = cint((tSelecc/tmetacon)*100) 
			 end if
			
			if tprog = 0 then 
			cober2 =0 
			else 
			cober2 = cint((tIns/tprog)*100) 
			end if
			
            registro = registro + 1
            RsP.MoveNext
          Loop
		  
          RsP.close %>
        </tr>
        <tr  height="10px" >
          <td colspan="3" bgcolor="#D7F2FF"  style="font-size:9px;"><div class="proyecto">TOTAL </div></td>
          <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tmetacon%></span></td>
          <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tIns%></span></td>
          <td bgcolor="#D7F2FF"   ALIGN=right><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tnro_cvs%></span></td>
          <td bgcolor="#D7F2FF"   ALIGN=right><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=txrev%></span></td>
          <td bgcolor="#D7F2FF"  ALIGN=right ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprCV%></span></td>
          <td bgcolor="#D7F2FF"  ALIGN=right><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=tDesaCV%></span></td>
          <td   bgcolor="#D7F2FF"   ALIGN=right><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;" ><%=porcentaje(tmetacon,tAprCV)%> %</span></td>
<td   bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tPsico%></span></td>
          <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacon,tPsico)%>%</span></td>
          <td bgcolor="#D7F2FF"    ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tEntrev%></span></td>
          <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacon,tEntrev)%>%</span></td>
          <td bgcolor="#D7F2FF"  > <span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tSelecc%></span></td>
          <td bgcolor="#D7F2FF" ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;">&nbsp;<%=porcentaje(tmetacon,tSelecc)%>%</span></td>
        </tr>
        <tr >
          <td height="16"  colspan="13" bgcolor="#D7F2FF" ><span class="alerta5" >(*) Los Porcentajes obtenidos en cada proceso estan calculados sobre los Totales de las metas de Selecci&oacute;n</span></td>
        </tr>
    </table><br>
    
     <%else%>
    
     <%end if
    end if 
  else 
    response.Write("No hay registros")
  end If
  
end if		  

	  
function porcentaje(meta,avance)

  IF (isnull(avance) or avance=0) then
    porcentaje= 0
  ELSE
	if (isnull(meta) or meta=0) then
	  porcentaje= 0
	else
	  porcentaje=CINT(100*avance/meta)
	end if
  END IF
  
end function%>
