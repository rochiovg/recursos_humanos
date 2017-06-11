<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 

 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%
Response.ContentType="text/html; charset=iso-8859-1"

Response.Flush 
			


	lsfecha=request("lsfecha")	'15LIMA
	lsUsuario=request("usuario")
id_proyecto=session("id_proyecto")  
	
	if varDpto="99" and varProv="99" and varDist="99" then
		vartittn=" A Nivel Nacional"
	end if
	if varDpto<>"99" then
		vartit1= "Departamento : " & nombredpto
	end if
	if varProv<>"99" then
		vartit2= " / Provincia : "& nombreprov
	end if
	if varDist<>"99" then
		vartit3= " / Distrito : "&nombredist
	end if
	vartitt=vartit1 & vartit2 & vartit3	
  
						SQL1 = "exec dbo.usp_Altas_Bajas_Reporte_periodo '"&lsfecha&"', '"&id_proyecto&"' "	
						
							

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
	%> 
	

	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>

<table border="1" cellpadding="1" cellspacing="0" style="font-size:10px" bordercolor="#DAE8F3">
      
      <tr>
        <td width="17" bgcolor="#DBDBDB">N&deg;</td>
        <td width="42" bgcolor="#DBDBDB">STATUS</td>
        <td width="92" bgcolor="#DBDBDB">CARGO</td>
        <td width="130" bgcolor="#DBDBDB">DEPARTAMENTO</td>
        <td width="81" bgcolor="#DBDBDB">PROVINCIA</td>
        <td width="148" bgcolor="#DBDBDB">DISTRITO</td>
        <td width="104" bgcolor="#DBDBDB">APE PATERNO</td>
        <td width="148" bgcolor="#DBDBDB">APE MATERNO</td>
        <td width="111" bgcolor="#DBDBDB">NOMBRES</td>
        <td width="92" bgcolor="#DBDBDB">DNI</td>
        <td width="40" bgcolor="#DBDBDB">FEC_INI </td>
        <td width="52" bgcolor="#DBDBDB">FEC_FIN</td>
        <td width="61" bgcolor="#DBDBDB">DESCARTAR</td>
        <td width="57" bgcolor="#DBDBDB">EJECUTAR</td>
      </tr>
      
       <%registro = 0					
				
			Do While Not RSCuad.EOF
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 %>
      <tr bordercolor="#999999">
        <td rowspan="3" valign="middle"><%response.Write(cont)%></td>
        <td bgcolor="#EEDDDD">SALE</td>
        <td bgcolor="#EEDDDD"><%=RSCuad.Fields("cargo")%></td>
        <td bgcolor="#EEDDDD"><%=RSCuad.Fields("dpto")%></td>
        <td bgcolor="#EEDDDD"><%=RSCuad.Fields("prov")%></td>
        <td bgcolor="#EEDDDD"><%=RSCuad.Fields("dist")%></td>
        <td bgcolor="#EEDDDD"><%=RSCuad.Fields("ape_paterno")%></td>
        <td bgcolor="#EEDDDD"><%=RSCuad.Fields("ape_materno")%></td>
        <td bgcolor="#EEDDDD"><%=trim(RSCuad.Fields("nombre"))%></td>
        <td bgcolor="#EEDDDD" ><%=RSCuad.Fields("dni")%></td>
        <td bgcolor="#EEDDDD"><span class="t12"><%=RSCuad.Fields("fec_iniT")%></span></td>
        <td bgcolor="#EEDDDD"><span class="t14"><%=RSCuad.Fields("fec_finT")%></span></td>
        <td rowspan="3" align="center" valign="middle" ><div id="d<%=RSCuad.Fields("codi")%>"><% IF RSCuad.Fields("proce")="0" then %><img src="images/x.png" width="16" height="16" onclick="baja_procesar('<%=RSCuad.Fields("codi")%>','2','<%=lsUsuario%>')" /><% elseIF RSCuad.Fields("proce")="2" then  %>
          <img src="images/x3.png" width="19" height="19" /><% else %>
        <img src="images/x2.png" width="16" height="16" /><% end if %></div></td>
    <td rowspan="3" align="center" valign="middle" ><div id="e<%=RSCuad.Fields("codi")%>"><%IF RSCuad.Fields("proce")="0" then %><img src="images/ejecutar.png" width="13" height="13" onclick="baja_procesar('<%=RSCuad.Fields("codi")%>','1','<%=lsUsuario%>')"  /><% elseIF RSCuad.Fields("proce")="1" then  %>
          <img src="images/ejecutar3.png" width="16" height="16" /><% else %>
        <img src="images/ejecutar2.png" width="13" height="13" />
<% end if%></div></td>
      </tr>
      <tr  bordercolor="#999999">
        <td bgcolor="#CFF1E0">ENTRA</td>
        <td bgcolor="#CFF1E0"><%=RSCuad.Fields("cargoI")%></td>
        <td bgcolor="#CFF1E0"><%=RSCuad.Fields("dptoI")%></td>
        <td bgcolor="#CFF1E0"><%=RSCuad.Fields("provI")%></td>
        <td bgcolor="#CFF1E0"><%=RSCuad.Fields("distI")%></td>
        <td bgcolor="#CFF1E0"><%=RSCuad.Fields("ape_paternoI")%></td>
        <td bgcolor="#CFF1E0"><%=RSCuad.Fields("ape_maternoI")%></td>
        <td bgcolor="#CFF1E0"><%=trim(RSCuad.Fields("nombreI"))%></td>
        <td bgcolor="#CFF1E0"><span ><%=RSCuad.Fields("dniI")%></span></td>
        <td bgcolor="#CFF1E0"><span ><%=RSCuad.Fields("fec_iniR")%></span></td>
        <td bgcolor="#CFF1E0"><p><span class="t14"><%=RSCuad.Fields("fec_finR")%></span></p></td>
      </tr>
      <tr bgcolor="#DAE8F3"  bordercolor="#999999">
        <td colspan="11"><strong>JUSTIFICACI&Oacute;N</strong> :&nbsp;<%=RSCuad.Fields("justi")%>&nbsp;&nbsp;&nbsp;&nbsp;<strong>USUARIO MONITOR:</strong>&nbsp;<%=RSCuad.Fields("USUARIO")%></td>
      </tr>
      <tr >
        <td colspan="14">&nbsp;</td>
      </tr>
      <%
			registro = registro + 1
			RSCuad.MoveNext
			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
 %>
    </table>
	<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if%>