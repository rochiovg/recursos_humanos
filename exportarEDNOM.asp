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


		SQL1 = "exec dbo.pa_reporte_procesos_ednom '"&varCargo&"', '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' , '"&varReporte&"', '"&vartiCargo&"', '"&idProyecto&"', '"&lsconvocatoria&"' , '"&valor&"' , '"&lsnivel&"', '"&txtSedeop&"', '"&sede&"' , '"&txtProvSed&"', '"&txtDistSed&"' "


		response.write(SQL1)
		
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3



 If Not RSCuad.BOF And Not RSCuad.EOF Then 
 
 if reporte=4 then
 %>
 
 	
    <table table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
    
    <tr>
    <td colspan="20" align="center">Anexo 04<br>FORMATO PARA APLICADORES</td>
    </tr>
      <tr  style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5">
        <td rowspan="3" width="44">NRO.</td>
        <td rowspan="3" width="80">REGI&Oacute;N</td>
        <td rowspan="3" width="123">SEDE ASIGNADA</td>
        <td rowspan="3" width="140">LOCAL DE APLICACI&Oacute;N    ASIGNADO</td>
        <td colspan="6" width="542" align="center">DATOS PERSONALES </td>
        <td colspan="6" width="720"  align="center">FORMACI&Oacute;N Y EXPERIENCIA LABORAL</td>
        <td colspan="4" width="542"  align="center">RESULTADO DE LA PRUEBA Y CAPACITACI&Oacute;N</td>
      </tr>
      <tr bgcolor="#E5E5E5" style="font-size:11px; font-weight:bold">
        <td rowspan="2">APELLIDOS</td>
        <td rowspan="2">NOMBRES</td>
        <td rowspan="2">DNI</td>
        <td rowspan="2" width="128">LUGAR DE RESIDENCIA</td>
        <td rowspan="2" width="80">TEL&Eacute;FONO    CASA</td>
        <td rowspan="2" width="80">TEL&Eacute;FONO CELULAR</td>
        <td rowspan="2" width="80">PROFESI&Oacute;N</td>
        <td rowspan="2" width="99">GRADO ACAD&Eacute;MICO (*)</td>
        <td rowspan="2" width="143">&Uacute;LTIMA    EXPERIENCIA DE AULA O PROYECTOS DE FORMACI&Oacute;N</td>
        <td rowspan="2" width="107">NOMBRE DE LA    INSTITUCI&Oacute;N O EMPRESA</td>
        <td rowspan="2" width="122">TIEMPO    DE DURACI&Oacute;N (EN MESES)</td>
        <td rowspan="2" width="169">NOMBRE DE LA &Uacute;LTIMA    EXPERIENCIA EN OPERATIVO DE APLICACI&Oacute;N DE INSTRUMENTOS EN CAMPO</td>
        <td rowspan="2" width="121">PUNTAJE DE LA PRUEBA    ESCRITA</td>
        <td rowspan="2" width="142">RESULTADO    DE LA PRUEBA ESCRITA (APROBADO, DESAPROBADO O NO RINDI&Oacute; LA PRUEBA)</td>
        <td rowspan="2" width="123">PUNTAJE DE LA    CAPACITACI&Oacute;N</td>
        <td rowspan="2" width="156">RESULTADO    DE LA CAPACITACI&Oacute;N (APROBADO, DESAPROBADO O NO RINDI&Oacute; LA PRUEBA)</td>
      </tr>
      
      <tr>
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
        <td><%=RSCuad.Fields("ccdd")%></td>
        <%if idProyecto=45 then
			SEDE=RSCuad.Fields("sede") 
		ELSEIF idProyecto=47 THEN
			SEDE=RSCuad.Fields("sede_operativa")
		END IF%>
        <td><%=RSCuad.Fields("sede")%></td>
        <td><%=RSCuad.Fields("local_asig")%></td>
        <td><%=RSCuad.Fields("apellidos")%></td>
        <td><%=RSCuad.Fields("nombre")%></td>
        <td class="t"><%=RSCuad.Fields("dni")%></td>
        <td><%=RSCuad.Fields("DPTO_res")%></td>
        <td class="t"><%=RSCuad.Fields("telefono")%></td>
        <td class="t"><%=RSCuad.Fields("celular")%></td>
        <td><%=RSCuad.Fields("profesion")%></td>
        <td><%=RSCuad.Fields("grado")%></td>
        <td><%=RSCuad.Fields("ExpFormacion")%></td>
        <td><%=RSCuad.Fields("NombreFormacion")%></td>
        <td><%=RSCuad.Fields("TiempoFormacion")%></td>
        <td><%=RSCuad.Fields("ExpAplicacion")%></td>
        <td><%=RSCuad.Fields("pruebaEscrita")%></td>
        <td><%=RSCuad.Fields("estado_pruebaEscrita")%></td>
        <td><%=RSCuad.Fields("notacap")%></td>
        <td><%=RSCuad.Fields("capacita")%></td>
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
<% elseif reporte=2 then %>

<table table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
 <tr>
    <td colspan="18" align="center">Anexo 02<br>Formato para Coordinadores de Sede y de Local</td>
  </tr>
  <tr style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5" align="center">
    <td rowspan="3">Nro.</td>
    <td rowspan="3">REGI&Oacute;N</td>
    <td rowspan="3">SEDE ASIGNADA</td>
    <td colspan="6" rowspan="2">DATOS PERSONALES</td>
    <td colspan="9">FORMACI&Oacute;N Y EXPERIENCIA PROFESIONAL</td>
  </tr>
  <tr style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5" align="center">
    <td rowspan="2">Profesi&oacute;n</td>
    <td rowspan="2">Grado Acad&eacute;mico</td>
    <td colspan="6">&Uacute;LTIMOS DOS CARGOS DESEMPEÑADOS</td>
    <td rowspan="2">Nombre de la &Uacute;ltima Experiencia en operativo de Aplicaci&oacute;n de Instrumentos de Campo</td>
  </tr>
  <tr style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5" align="center">
    <td>APELLIDOS</td>
    <td>NOMBRES</td>
    <td>DNI</td>
    <td>Lugar de Residencia</td>
    <td>Tel&eacute;fono de casa</td>
    <td>Tel&eacute;fono Celular</td>
    <td>Cargo Desempe&ntilde;ado (1)</td>
    <td>Nombre de la Instituci&oacute;n o Empresa</td>
    <td>Tiempo de Duraci&oacute;n (en meses)</td>
    <td>Cargo Desempe&ntilde;ado (2)</td>
    <td>Nombre de la Instituci&oacute;n o Empresa</td>
    <td>Tiempo de Duraci&oacute;n (en meses)</td>
    <td>Cargo</td>
    <td>Estado Contrato</td>
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
    <td><%=RSCuad.Fields("ccdd")%></td>
    <%if idProyecto=45 then
			SEDE=RSCuad.Fields("sede") 
		ELSEIF idProyecto=47 THEN
			SEDE=RSCuad.Fields("sede_operativa")
		END IF%>
    <td><%=RSCuad.Fields("sede")%></td>
    <td><%=RSCuad.Fields("apellidos")%></td>
    <td><%=RSCuad.Fields("nombre")%></td>
    <td class="t"><%=RSCuad.Fields("dni")%></td>
    <td><%=RSCuad.Fields("DPTO_res")%></td>
    <td class="t"><%=RSCuad.Fields("telefono")%></td>
    <td class="t"><%=RSCuad.Fields("celular")%></td>
    <td><%=RSCuad.Fields("profesion")%></td>
    <td><%=RSCuad.Fields("grado")%></td>
    <td><%=RSCuad.Fields("cargo1")%></td>
    <td><%=RSCuad.Fields("empcargo1")%></td>
    <td><%=RSCuad.Fields("tiempocargo1")%></td>
    <td><%=RSCuad.Fields("cargo2")%></td>
    <td><%=RSCuad.Fields("empcargo2")%></td>
    <td><%=RSCuad.Fields("tiempocargo2")%></td>
    <td><%=RSCuad.Fields("ExpAplicacion")%></td>
    <td><%=RSCuad.Fields("desc_cargofuncional")%></td>
    <td><%=RSCuad.Fields("estado_c")%></td>
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

<% elseif reporte=3 then %>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5" align="center">
    <td rowspan="2">Nro</td>
    <td rowspan="2">REGI&Oacute;N</td>
    <td rowspan="2">SEDE ASIGNADA</td>
    <td rowspan="2">LOCAL APLICACI&Oacute;N ASIGNADO</td>
    <td rowspan="2">TIPO DE CANDIDATO (*)</td>
    <td colspan="6">DATOS PERSONALES</td>
    <td colspan="8">FORMACI&Oacute;N Y EXPERIENCIA LABORAL</td>
    <td colspan="4">RESULTADO DE LA PRUEBA Y CAPACITACI&Oacute;N</td>
  </tr>
  <tr style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5" align="center">
    <td>APELLIDOS</td>
    <td>NOMBRES</td>
    <td>DNI</td>
    <td>Lugar de Residencia</td>
    <td>Tel&eacute;fono Casa</td>
    <td>Tel&eacute;fono Celular</td>
    <td>Profesi&oacute;n</td>
    <td>Grado Acad&eacute;mico (**)</td>
    <td>&Uacute;ltimo Cargo Desempe&ntilde;ado</td>
    <td>Nombre de la Instituci&oacute;n o Empresa</td>
    <td>Tiempo de duraci&oacute;n (en meses)</td>
    <td>&Uacute;ltima Capacitaci&oacute;n Realizada</td>
    <td>Nombre de la Instituci&oacute;n o Empresa</td>
    <td>Nombre de la &Uacute;ltima Experiencia en Operativo de Aplicaci&oacute;n de Instrumentos en Campo</td>
    <td>Puntaje de la Prueba Escrita</td>
    <td>Resultado de las Prueba Escrita (aprobado, desaprobado o no rindi&oacute; la prueba)</td>
    <td>Puntaje de la Capacitaci&oacute;n</td>
    <td>Resultado de la Capacitaci&oacute;n (aprobado, desaprobado o no rindi&oacute; la prueba)</td>
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
    <td><%=RSCuad.Fields("ccdd")%></td>
    <%if idProyecto=45 then
			SEDE=RSCuad.Fields("sede") 
		ELSEIF idProyecto=47 THEN
			SEDE=RSCuad.Fields("sede_operativa")
		END IF%>
    <td><%=RSCuad.Fields("sede")%></td>
    <td><%=RSCuad.Fields("local_asig")%></td>
    <td><%=RSCuad.Fields("desc_cargofuncional")%></td>
    <td><%=RSCuad.Fields("apellidos")%></td>
    <td><%=RSCuad.Fields("nombre")%></td>
    <td  class="t"><%=RSCuad.Fields("dni")%></td>
    <td><%=RSCuad.Fields("DPTO_res")%></td>
    <td class="t"><%=RSCuad.Fields("telefono")%></td>
    <td class="t"><%=RSCuad.Fields("celular")%></td>
    <td><%=RSCuad.Fields("profesion")%></td>
    <td><%=RSCuad.Fields("grado")%></td>
    <td><%=RSCuad.Fields("cargo1")%></td>
    <td><%=RSCuad.Fields("empcargo1")%></td>
    <td><%=RSCuad.Fields("tiempocargo1")%></td>
    <td><%=RSCuad.Fields("cursoCapacitacion")%></td>
    <td><%=RSCuad.Fields("lugar_capacitacion")%></td>
    <td><%=RSCuad.Fields("ExpAplicacion")%></td>
    <td><%=RSCuad.Fields("pruebaEscrita")%></td>
    <td><%=RSCuad.Fields("estado_pruebaEscrita")%></td>
    <td><%=RSCuad.Fields("notacap")%></td>
    <td><%=RSCuad.Fields("capacita")%></td>
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

<% elseif reporte=5 then %>

<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <tr style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5" align="center">
    <td rowspan="2">Nro</td>
    <td rowspan="2">TIPO CANDIDATO (*)</td>
    <td rowspan="2">SEDE</td>
    <td colspan="3">DATOS PERSONALES</td>
    <td colspan="3">CRITERIO DE EVALUACION</td>
    <td colspan="5">RESULTADO</td>
  </tr>
  <tr style="font-size:11px; font-weight:bold" bgcolor="#E5E5E5" align="center">
    <td>APELLIDOS</td>
    <td>NOMBRES</td>
    <td>DNI</td>
    <td>Criterio 1 <br />
    Manejo de los procedimientos de aplicacion (de 0 a 8 puntos)</td>
    <td>Criterio 2 <br />
    Desempe&ntilde;o durante las simulaciones (de 0 a 12 puntos)</td>
    <td>Criterio 3 <br />
    Resultado Prueba escrita (de 0 a 20 puntos)</td>
    <td>Sumatoria (Criterio1+ <br />
      Criterio2+<br />
    Criterio3)</td>
    <td>Actitud durante la capacitacion(**)</td>
    <td>Observaci&oacute;n</td>
    <td>SELECCI&Oacute;N</td>
    <td></td>
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
    <td><%=RSCuad.Fields("desc_cargofuncional")%></td>
    <%if idProyecto=45 then
			SEDE=RSCuad.Fields("sede") 
		ELSEIF idProyecto=47 THEN
			SEDE=RSCuad.Fields("sede_operativa")
		END IF%>
    <td><%=RSCuad.Fields("sede")%></td>
    <td><%=RSCuad.Fields("apellidos")%></td>
    <td><%=RSCuad.Fields("nombre")%></td>
    <td class="t"><%=RSCuad.Fields("dni")%></td>
    <td><%=RSCuad.Fields("p1")%></td>
    <td><%=RSCuad.Fields("p2")%></td>
    <td><%=RSCuad.Fields("p3")%></td>
    <td><%=RSCuad.Fields("total_p")%></td>
    <td><%=RSCuad.Fields("ObsEntrevista")%></td>
    <td><%=RSCuad.Fields("CV_OBSERVACION")%></td>
    <td><%=RSCuad.Fields("estado")%></td>
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



<% end if
else%>
<table width='95%' align='center'>
	<tr>
		<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
	</tr>
</table>
    <p>
          <%end if%>
          

    <p>