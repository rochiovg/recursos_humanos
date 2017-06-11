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

Response.Addheader "Content-Disposition", "attachment; filename=ANEXO_"&reporte&".xls" 
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

 function porcentaje(meta,avance)
		if (isnull(meta) or meta=0) then
			porcentaje= 0
		else
			porcentaje=CINT(100*avance/meta)
		end if
end function		


		SQL1 = "exec dbo.PA_COBERTURA_LISTAR '"&varCargo&"', '"&lsconvocatoria&"', '"&idProyecto&"' "
		

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3



 If Not RSCuad.BOF And Not RSCuad.EOF Then  %>
 
 	
    <table table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
    
    <tr>
    <td colspan="15" align="center">COBERTURA</td>
    </tr>
      <tr  style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5">
        <td rowspan="2" width="10">NRO.</td>
        <td rowspan="2" width="200">SEDE OPERATIVA</td>
        <td rowspan="2" width="200">SEDE PROVINCIAL</td>
        <td rowspan="2" width="200">SEDE DISTRITAL</td>
        <td width="64" rowspan="2" align="center">META PRESELECCI&Oacute;N </td>
        <td width="64" rowspan="2" align="center">META CAPACITACI&Oacute;N </td>
        <td width="64" rowspan="2" align="center">META A CONTRATAR</td>
        <td colspan="2" align="center">INSCRITOS</td>
        <td colspan="2" align="center">PRESELECCI&Oacute;N AUTOM&Aacute;TICA</td>
        <td colspan="2" align="center">EVALUACION CURRICULAR</td>
        <td colspan="2" align="center">PRESEELCCI&Oacute;N</td>
        <td colspan="2" align="center">CAPACITACION</td>
        <td colspan="2" align="center">SELECCIONADOS</td>
      </tr>
      <tr bgcolor="#E5E5E5" style="font-size:11px; font-weight:bold">
        <td width="90" align="center">INSCRITOS</td>
        <td width="90" align="center">COBERTURA</td>
        <td width="90">APROBADOS</td>
        <td width="90">COBERTURA</td>
        <td width="90">APROBADOS</td>
        <td width="90">COBERTURA</td>
        <td width="90">APROBADOS</td>
        <td width="90">COBERTURA</td>
        <td width="90">APROBADOS</td>
        <td width="90">COBERTURA</td>
        <td width="90">APROBADOS</td>
        <td width="90">COBERTURA</td>
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
      <tr>
        <td><%response.Write(cont)%></td>
        <td><%=RSCuad.Fields("sede_operativa")%></td>
        <td><%=RSCuad.Fields("sedeprov")%></td>
        <td><%=RSCuad.Fields("sede_distrital")%></td>
        <td><%=RSCuad.Fields("pea_preseleccion")%></td>
        <td><%=RSCuad.Fields("pea_capacitacion")%></td>
        <td><%=RSCuad.Fields("pea")%></td>
        
        <td><%=RSCuad.Fields("Total_Inscritos")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea_capacitacion"),RSCuad.Fields("Total_Inscritos"))%>%</td>
        
        
        <td><%=RSCuad.Fields("total_auto")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea_capacitacion"),RSCuad.Fields("total_auto"))%>%</td>
        
        <td><%=RSCuad.Fields("total_cv")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea_capacitacion"),RSCuad.Fields("total_cv"))%>%</td>
        
        <td><%=RSCuad.Fields("total_preseleccion")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea_capacitacion"),RSCuad.Fields("total_preseleccion"))%>%</td>
        
        <td><%=RSCuad.Fields("total_capacita")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea"),RSCuad.Fields("total_capacita"))%>%</td>
        <td><%=RSCuad.Fields("total_seleccion")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea"),RSCuad.Fields("total_seleccion"))%>%</td>
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

<% else%>
<table width='95%' align='center'>
	<tr>
		<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
	</tr>
</table>
 <%end if%>
          

