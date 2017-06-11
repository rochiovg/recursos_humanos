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

idProyecto=Session("id_proyecto")

SQL4 = "exec dbo.getNombreProy '" & idProyecto& "'  "	
	
		Set RSCuad4	= Server.CreateObject("ADODB.Recordset") 
		RSCuad4.cursorlocation=3
		RSCuad4.Open SQL4, MiCone, 3,3
		
		

SQL2 = "exec dbo.uspget_localAD '"&id_aula&"' "

		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
		localN=RSCuad2("localN")
		aula=RSCuad2("aula")
		fecha=RSCuad2("fecha")
		hora=RSCuad2("hora")


 
		SQL1 = "exec dbo.uspget_PEAAULA  '"&id_aula&"','"&idProyecto&"'  "

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		valor=0
		pag=1
			%> 
<head>

</head>
<body onLoad="imprimir()">
    <table width="93%" cellpadding="0" cellspacing="0">
    <tr > 
      
        <td width="23%" align="center" colspan="2"  ><span style="font-size:36px; color: #006"><strong>INEI</strong></span><br />
       <span style="font-size:11px;"> <strong>Instituto Nacional de Estadisticas e Inform&aacute;tica</strong></span></td>
          <td align="center" valign="middle" style="font-size:15px" colspan="3"><%=RSCuad4.Fields("nombre")%><br>"CURSO DE CAPACITACI&Oacute;N"<BR>
          DIRIGIDO A SUPERVISORES LOCALES Y ENCUESTADORES<br>ACTA DE NOTAS GENERAL</td>
      </tr>
      <tr bordercolor="#FFFFFF">
        <td colspan="3" align="left"  style="font-size:14px;" ><strong>Local:</strong> <strong><%=localN%></strong></td>
        <td  align="left"  style="font-size:14px;" ><strong>Aula:</strong> <strong><%=aula%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
        <td   width="21%" align="right"  style="font-size:14px;" ><strong>Fecha: <%=fecha%></strong></td>
      </tr>
    </table>
     
     
     
<table width="95%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
      <tr>
        <td width="19" height="17" rowspan="2" align="center" bgcolor="#CCCCCC" style="font-size:10px;">Nro.</td>
        <td width="84" rowspan="2"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">Provincia</td>
        <td width="369" rowspan="2"  align="center" bgcolor="#CCCCCC"  style="font-size:10px;">APELLIDOS Y NOMBRES  </td>
        <td width="69" rowspan="2"  align="center" bgcolor="#CCCCCC"  style="font-size:10px;">&nbsp;&nbsp;&nbsp;&nbsp;DNI&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td width="60" rowspan="2"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">CARGO</td>
        <td colspan="4"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">CRITERIOS DE EVALUACI&Oacute;N</td>
        
        <td width="60" rowspan="2"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">PROMEDIO FINAL</td>
  </tr>
      <tr>
        <td width="60"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">Examen Escrito (25%)</td>
        <td width="60"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">PRACTICA CALIFICADA (30%)</td>
        <td width="60"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">PRACTICA DE CAMPO        (35%)</td>
        <td width="60"  align="center" bgcolor="#CCCCCC" style="font-size:10px;">ASISTENCIA Y PUNTUALIDAD (10%)</td>
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
        <td width="84"><%=RSCuad.Fields("distrito")%>&nbsp;</td>
        <td class="t"><%=RSCuad.Fields("nombres")%>&nbsp;</td>
        <td class="t"><span ><%=RSCuad.Fields("dni")%></span>&nbsp;</td>
        <td class="t"><span ><%=RSCuad.Fields("cargo")%></span>&nbsp;</td>
         <td class="t"><%=RSCuad.Fields("p1")%></td>
         <td class="t"><%=RSCuad.Fields("p2")%></td>
         <td class="t"><%=RSCuad.Fields("p3")%></td>
         <td class="t"><%=RSCuad.Fields("p4")%></td>
         <td class="t"><%=RSCuad.Fields("notacap")%></td>
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
