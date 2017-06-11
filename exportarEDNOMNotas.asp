<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%

idProyecto=Session("id_proyecto")

var1Cargo=request("lsCargo") '7
varReporte=request("lsreporte") '7


varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
valor = Request("valor")
lsconvocatoria=Request("lsconvocatoria")
lsnivel=Request("lsnivel")
reporte=Request("reporte")
txtSedeop=Request("txtSedeop")
sede=Request("sede")
txtProvSed=Request("txtProvSed")
txtDistSed=Request("txtDistSed")

	' valores de las sedes
	if txtProvSed="9999" then
	txtProvSed="9999"
	else
	txtProvSed=mid(txtProvSed,4)		
	end if
	txtDistSed=mid(txtDistSed,1,6)	


Response.Addheader "Content-Disposition", "attachment; filename=ANEXO_NOTAS.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 
			
varccdd = Mid(varccddTot,1,2)

varccpp = Mid(varccppTot,3,2)

varccdi = Mid(varccdiTot,5,2)
	
	
	vartiCargo=mid(var1Cargo,1,1)		'15
	lsVarCodCargo = len(var1Cargo) '6
	varCargo=mid(var1Cargo,2,lsVarCodCargo-1)	'LIMA
	

if varReporte=7 then
var="block"
else
var="none"
end if

if vartiCargo="9" then
 vartiCargo="1,2,3"
end if


		SQL1 = "exec dbo.pa_reporte_procesos_notas '"&varCargo&"', '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' , '"&varReporte&"', '"&vartiCargo&"', '"&idProyecto&"', '"&lsconvocatoria&"' , '"&valor&"' , '"&lsnivel&"', '"&txtSedeop&"', '"&sede&"' , '"&txtProvSed&"', '"&txtDistSed&"' "
		
	

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3



 If Not RSCuad.BOF And Not RSCuad.EOF Then 
 

 %>


<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5" align="center"> 
  <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td >PRESELECCI&Oacute;N AUTOM&Aacute;TICA</td>
    <td colspan="6">EVALUACI&Oacute;N CURRICULAR</td>
    <td colspan="2">PRESELCCI&Oacute;N</td>
    <td colspan="8">CAPACITACI&Oacute;N</td>
  </tr>
  <tr style="font-size:11px; font-weight:bold;" bgcolor="#E5E5E5" align="center">
    <td>Nro.</td>
    <td>CODIGO SEDE</td>
    <td>SEDE OPERATIVA</td>
    <td>CARGO</td>
    <td>DNI</td>
    <td>APELLIDOS Y NOMBRES</td>
    <td>EDAD</td>
    <td>FECHA<BR>NACIMIENTO</td>
    <td>ESTADO</td>
    <td>NOTA AULA</td>
    <td>NOTA LABORAL</td>
    <td>NOTA EXPERIANCIA</td>
    <td>NOTA FORMACION</td>
    <td>NOTA TOTAL</td>
    <td>ESTADO</td>
    <td>NOTA<BR>PRESLECCI&Oacute;N</td>
    <td>ESTADO</td>
    <td>CRITERIO 1</td>
    <td>CRITERIO 2</td>
    <td>CRITERIO 3</td>
    <td>CRITERIO 4</td>
    <td>CRITERIO 5</td>
    <td>NOTA<BR>CAPACITACI&Oacute;N</td>
    <td>ESTADO</td>
    <td>GRUPO<BR>CAPACITACI&Oacute;N</td>
  </tr>
  

  <%registro = 0					
				
			Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 
		%>
  <tr style="font-size:11px; font-weight:bold" >
    <td><%response.Write(cont)%></td>
	<td><%=RSCuad.Fields("cod_sede")%></td>
    <td><%=RSCuad.Fields("sedeOperativa")%></td>
    <td><%=RSCuad.Fields("cargo")%></td>
    <td class="t"><%=RSCuad.Fields("dni")%></td>
    <td><%=RSCuad.Fields("ape_paterno")%>&nbsp;<%=RSCuad.Fields("ape_Materno")%>&nbsp;<%=RSCuad.Fields("nombre")%></td>
    <td><%=RSCuad.Fields("edad")%></td>
    <td><%=RSCuad.Fields("fec_nac")%></td>
    <td><%=RSCuad.Fields("p_automatica")%></td>
    <td><%=RSCuad.Fields("p_expAula")%></td>
    <td><%=RSCuad.Fields("p_expLaboral")%></td>
    <td><%=RSCuad.Fields("p_experiencia")%></td>
    <td><%=RSCuad.Fields("p_formacionAct")%></td>
    <td><%=RSCuad.Fields("p_total")%></td>
    <td><%=RSCuad.Fields("estado_cv")%></td>
    <td><%=RSCuad.Fields("NotaPreCap")%></td>
    <td><%=RSCuad.Fields("estado_pr")%></td>
    <td><%=RSCuad.Fields("p1")%></td>
    <td><%=RSCuad.Fields("p2")%></td>
    <td><%=RSCuad.Fields("p3")%></td>
    <td><%=RSCuad.Fields("p4")%></td>
    <td><%=RSCuad.Fields("p5")%></td>
    <td><%=RSCuad.Fields("notacap")%></td>
    <td><%=RSCuad.Fields("estado_cap")%></td>
    <td><%=RSCuad.Fields("descripcion")%></td>
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



<% 
else%>
<table width='95%' align='center'>
	<tr>
		<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
	</tr>
</table>
    <p>
          <%end if%>
          

