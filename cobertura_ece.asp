<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%

idProyecto=Session("id_proyecto")

var1Cargo=request("lsCargo") '7
lsconvocatoria=Request("lsconvocatoria")
tipo=Request("tipo")



Response.Addheader "Content-Disposition", "attachment; filename=ANEXO_"&reporte&".xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 
			

	
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

		if (isnull(meta) or meta=0 or meta="")  then
			porcentaje= 0
		else
			porcentaje=CINT(100*avance/meta)
		end if
end function		


		SQL1 = "exec dbo.pa_COBERTURA_ECE2015 '"&tipo&"', '"&varCargo&"', '"&lsconvocatoria&"' "
		

		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3



 If Not RSCuad.BOF And Not RSCuad.EOF Then  %>
 
 	
    <table table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
    
    <tr>
    <td colspan="27" align="center">COBERTURA</td>
    </tr>
      <tr  style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5">
        <td rowspan="2" width="10">NRO.</td>
        <td rowspan="2" width="200">SEDE OPERATIVA</td>
        <% if tipo="2" or tipo="3" then  %>
        <td rowspan="2" width="200">SEDE PROVINCIAL</td> <% end if%>
        <% if tipo="3" then  %>
        <td rowspan="2" width="200">SEDE DISTRITAL</td> <% end if%>
        <td width="64" rowspan="2" align="center">META PRESELECCI&Oacute;N </td>
        <td width="64" rowspan="2" align="center">META CAPACITACI&Oacute;N </td>
        <td width="64" rowspan="2" align="center">META A CONTRATAR</td>
        <td colspan="3" align="center">INSCRITOS</td>
        <td colspan="2" align="center">PRESELECCI&Oacute;N AUTOM&Aacute;TICA</td>
        <td colspan="9" align="center">EVALUACION CURRICULAR</td>
        <td colspan="2" align="center">PRESEELCCI&Oacute;N</td>
        <td colspan="2" align="center">CAPACITACION</td>
        <td colspan="2" align="center">SELECCIONADOS</td>
      </tr>
      <tr bgcolor="#E5E5E5" style="font-size:11px; font-weight:bold">
        <td width="90" align="center">INSCRITOS</td>
        <td width="90" align="center">COBERTURA<BR>M. PRESEL.</td>
        <td width="90" align="center">COBERTURA<BR>M. CAPA.</td>
        <td width="90">APROBADOS</td>
        <td width="90">COBERTURA</td>
        
        <td width="90">CV RECEP. FI&Iacute;SICO</td>
        <td width="90" align="center">COBERTURA<BR>M. PRESEL.</td>
        <td width="90" align="center">COBERTURA<BR>M. CAPA.</td>
        <td width="90">CV PENDIENTE<BR>EVALUACI&Oacute;N</td>
        <td width="90">% PENDIENTES<BR>RECEPCIONADOS</td>
        <td width="90">DESAPROBADOS</td>
        
        
        <td width="90">APROBADOS</td>
        <td width="90" align="center">COBERTURA<BR>M. PRESEL.</td>
        <td width="90" align="center">COBERTURA<BR>M. CAPA.</td>
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
        <td><%=RSCuad.Fields("Sede_region")%></td>
<% if tipo="2" or tipo="3" then  %> <td><%=RSCuad.Fields("Sede_provincia")%></td> <% end if%>
<% if tipo="3" then  %> <td><%=RSCuad.Fields("sede_distrito")%></td> <% end if%>
        <td><%=RSCuad.Fields("pea_preseleccion")%></td>
        <td><%=RSCuad.Fields("pea_cap")%></td>
        <td><%=RSCuad.Fields("pea")%></td>
        
        <td><%=RSCuad.Fields("inscritos")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea_preseleccion"),RSCuad.Fields("inscritos"))%>%</td>
        <td><%=porcentaje(RSCuad.Fields("pea_cap"),RSCuad.Fields("inscritos"))%>%</td>
        
        
        <td><%=RSCuad.Fields("total_auto")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea_cap"),RSCuad.Fields("total_auto"))%>%</td>
        
        <td><%=RSCuad.Fields("CV_RECEPCIONADOS")%></td>
        <td><%=porcentaje(cint(RSCuad.Fields("pea_preseleccion")),cint(RSCuad.Fields("CV_RECEPCIONADOS")))%>%</td>
        <td><%=porcentaje(cint(RSCuad.Fields("pea_cap")),cint(RSCuad.Fields("CV_RECEPCIONADOS")))%>%</td>
        
        <td><%=RSCuad.Fields("cv_faltante")%> </td>
        <td><%=porcentaje(cint(RSCuad.Fields("CV_RECEPCIONADOS")),cint(RSCuad.Fields("cv_faltante")))%>%</td>
        <td><%=RSCuad.Fields("desaproCv")%></td>
        
        <td><%=RSCuad.Fields("aproCv")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea_cap"),RSCuad.Fields("aproCv"))%>%</td>
        <td><%=porcentaje(RSCuad.Fields("pea_preseleccion"),RSCuad.Fields("aproCv"))%>%</td>
        
        <td><%=RSCuad.Fields("preseleccion")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea_cap"),RSCuad.Fields("preseleccion"))%>%</td>
        
        <td><%=RSCuad.Fields("capacitacion")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea"),RSCuad.Fields("capacitacion"))%>%</td>
        <td><%=RSCuad.Fields("seleccionado")%></td>
        <td><%=porcentaje(RSCuad.Fields("pea"),RSCuad.Fields("seleccionado"))%>%</td>
      </tr>
    
     <%
	 
	 tot_preseleccion=tot_preseleccion+RSCuad.Fields("pea_preseleccion")
     tot_cap=tot_cap+CINT(RSCuad.Fields("pea_cap"))
	 tot_pea=tot_pea+RSCuad.Fields("pea")	 
	 tot_ins=tot_ins+RSCuad.Fields("inscritos")
	 tot_total_auto=tot_total_auto+RSCuad.Fields("total_auto")
	 tot_cv_recepcionados=tot_cv_recepcionados+CINT(RSCuad.Fields("CV_RECEPCIONADOS"))
	 tot_cv_faltante=tot_cv_faltante+CINT(RSCuad.Fields("cv_faltante"))
	 tot_desaprovocv=tot_desaprovocv+RSCuad.Fields("desaproCv")
	 tot_aprobo_cv=tot_aprobo_cv+RSCuad.Fields("aproCv")
	 tot_preseleccion=tot_preseleccion+ RSCuad.Fields("preseleccion")
	 tot_capacitacion=tot_capacitacion+RSCuad.Fields("capacitacion")
	 tot_seleccionado=tot_seleccionado+RSCuad.Fields("seleccionado")
			registro = registro + 1
			RSCuad.MoveNext
			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
 	%>
    
      <tr bgcolor="#9ED8E9">
      <% if tipo="1" then  %> 
        <td colspan="2"> Total</td>
        <%elseif tipo="2" then  %>
       <td colspan="3"> Total</td>
       <%else%>
		<td colspan="4"> Total</td>
		 <% end if%>
        <td><%=tot_preseleccion%></td>
        <td><%=tot_cap%></td>
        <td><%=tot_pea%></td>
        <td><%=tot_ins%></td>
        <td><%=porcentaje(tot_preseleccion,tot_ins)%>%</td>
        <td><%=porcentaje(tot_cap,tot_ins)%>%</td>
        <td><%=tot_total_auto%></td>
        <td><%=porcentaje(tot_cap,tot_total_auto)%>%</td>
        
        <td><%=tot_cv_recepcionados%></td>
        <td><%=porcentaje(tot_preseleccion,tot_cv_recepcionados)%>%</td>
        <td><%=porcentaje(tot_cap,tot_cv_recepcionados)%>%</td>
        
        <td><%=tot_cv_faltante%> </td>
        <td><%=porcentaje(tot_cv_recepcionados,tot_cv_faltante)%>%</td>
        <td><%=tot_desaprovocv%></td>
        
        <td><%=tot_aprobo_cv%></td>
        <td><%=porcentaje(tot_cap,tot_aprobo_cv)%>%</td>
        <td><%=porcentaje(tot_preseleccion,tot_aprobo_cv)%>%</td>
        
        <td><%=tot_preseleccion%></td>
        <td><%=porcentaje(tot_cap,tot_preseleccion)%>%</td>
        
        <td><%=tot_capacitacion%></td>
        <td><%=porcentaje(tot_pea,tot_capacitacion)%>%</td>
        <td><%=tot_seleccionado%></td>
        <td><%=porcentaje(tot_pea,tot_seleccionado)%>%</td>
      </tr>
    </table>

<% else%>
<table width='95%' align='center'>
	<tr>
		<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
	</tr>
</table>
 <%end if%>
          

