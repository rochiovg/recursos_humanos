<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
H1.SaltoDePagina { PAGE-BREAK-AFTER: always} 
</style> 

 

<%

Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_AsistenciaCapacitacion.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 

			
id_aula=request("id_aula") '7

		SQL2 = "exec dbo.uspget_localAD '"&id_aula&"' "

		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
		localN=RSCuad2("localN")
		aula=RSCuad2("aula")
		fecha=RSCuad2("fecha")
		hora=RSCuad2("hora")

 
		SQL1 = "exec dbo.uspget_PEAAULA  '"&id_aula&"' "

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		valor=0
		pag=1
			%> 
<head>

</head>
<body>
    <table width="93%" cellpadding="0" cellspacing="0">
    <tr > 
      
        <td width="12%" colspan="2" align="center"  ><span style="font-size:36px; color: #006"><strong>INEI</strong></span><br />
       <span style="font-size:11px;"> <strong>Instituto Nacional de Estadisticas e Inform&aacute;tica</strong></span></td>
          <td width="88%" align="center" valign="middle" style="font-size:15px" colspan="6"><strong >EMPADRONAMIENTO DISTRITAL DE POBLACI&Oacute;N Y VIVIENDA 2013</strong><br>
          "CURSO  DE CAPACITACION PARA EMPADORNADORES, JEFES DE BRIGADA Y REVISORES"</td>
      </tr>
      <tr bordercolor="#FFFFFF">
        <td colspan="8" align="center"  style="font-size:18px;" >&nbsp;</td>
  </tr>
   </tr>
    <tr bordercolor="#FFFFFF">
        <td colspan="4" align="left"  style="font-size:14px;" ><strong>Local:</strong> <strong><%=localN%></strong></td>
        <td colspan="2"   align="left"  style="font-size:14px;" ><strong>Aula:</strong> <strong><%=aula%></strong></td>
        <td   colspan="2"  align="right"  style="font-size:14px;" ><strong>&nbsp;Horario:<%=horario%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fecha: <%=fecha%></strong></td>
      </tr>
    </table>
     
     
     
<table width="95%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
      <tr>
        <td width="18" rowspan="2" align="center" bgcolor="#CCCCCC" style="font-size:10px;">Nro.</td>
        <td width="62" rowspan="2"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">Distrito</td>
        <td width="57" rowspan="2"  align="center" bgcolor="#CCCCCC"  style="font-size:10px;">APELLIDOS Y NOMBRES  </td>
        <td width="19" rowspan="2"  align="center" bgcolor="#CCCCCC"  style="font-size:10px;">&nbsp;&nbsp;&nbsp;&nbsp;DNI&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td width="46" rowspan="2"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">CARGO</td>
        <td width="27" rowspan="2"  align="center" bgcolor="#CCCCCC"  style="font-size:10px;">N&deg; DE D&Iacute;AS</td>
        <td height="18" colspan="4"  align="center" bgcolor="#CCCCCC" style="font-size:10px;width:600px">Firma</td>
        
      </tr>
      <tr>
        <td height="17" align="center" bgcolor="#CCCCCC" style="font-size:10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hora&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="center" bgcolor="#CCCCCC" style="font-size:10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ma&ntilde;ana&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td width="37"  align="center" bgcolor="#CCCCCC" style="font-size:10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hora&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td width="38"  align="center" bgcolor="#CCCCCC" style="font-size:10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tarde&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      </tr>
   

<%   
If Not RSCuad.BOF And Not RSCuad.EOF Then
	   registro = 0	
	   
			Do While Not RSCuad.EOF
			response.Flush()

			if registro>0 and registro mod 20=0 then
				ttmov=0
				ttgast=0
				ttgen=0
				valor=valor+1
			end if
				cont = registro+1 
				registro = registro + 1
			if cont mod 20 = 0 then
				pag=pag + 1
			end if
				%>
<tr height="36px" style="font-size:12px">
        <td><%response.Write(cont)%></td>
        <td width="400"><%=RSCuad.Fields("distrito")%>&nbsp;</td>
        <td class="t"><%=RSCuad.Fields("nombres")%>&nbsp;</td>
        <td class="t"><span ><%=RSCuad.Fields("dni")%></span>&nbsp;</td>
        <td class="t"><span ><%=RSCuad.Fields("cargo")%></span>&nbsp;</td>
        <td>&nbsp;</td>
        <td width="38">&nbsp;</td>
        <td width="37">&nbsp;</td>
        <td width="37">&nbsp;</td>
        <td width="38">&nbsp;</td>
</tr>
<%			

			RSCuad.MoveNext
		
			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing%>
</table>
<%else%>

<table width='95%' align='center'>
<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>

	<%end if%>
                </body>
