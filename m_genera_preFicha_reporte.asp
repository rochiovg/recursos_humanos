<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

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


Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_INSCRIPCION.xls" 
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
	

'if varReporte=7 then
'var="block"
'else
var=""
'end if

if vartiCargo="9" then
 vartiCargo="1,2,3"
end if 
			

	SQLContCapac = "EXEC dbo.pa_datos_ficha_cc '" & lsconvocatoria & "' " 

	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		exp1=wRsDataCapc(0)
		exp2=wRsDataCapc(1)
		exp3=wRsDataCapc(2)
	else
		exp1=""
		exp2=""
		exp3=""
	End if


	if exp1="" or isnull(exp1) then
		exp1="A&Ntilde;OS O MESES DE EXPERIENCIA EN TRABAJOS DE CAMPO (CENSO Y/O ENCUESTAS)"
	end if
	
	if exp2="" or isnull(exp2) then
		exp2="A&Ntilde;OS O MESES DE EXPERIENCIA EN MANEJO DE GRUPOS"
	end if
	
	if exp3="" or isnull(exp3) then
		exp3="A&Ntilde;OS O MESES DE EXPERIENCIA EN ACTIVIDADES EN GENERAL"
	end if


		consulta1 = "EXEC dbo.pa_ficha_datos_reporte_ed '"&varCargo&"', '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' , '"&varReporte&"', '"&vartiCargo&"', '"&idProyecto&"', '"&lsconvocatoria&"' , '"&valor&"' , '"&lsnivel&"', '"&txtSedeop&"', '"&sede&"' , '"&txtProvSed&"', '"&txtDistSed&"' " 
		
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta1, MiCone, 3,3

	     
	If  Not RsP.BOF And Not RsP.EOF Then  %>
    
    
    
     <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3">
                 <tr>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >Nro.</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >SEDE OPERATIVA</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >DPTO</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >PROV</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >DIST</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >DNI</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >NOMBRE</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >CARGO</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >EDAD</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >NIVEL EDUCATIVO</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >GRADO</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >PERIODO ALCANZADO</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >PROFESION</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >UNIVERSIDAD</td>
                   <td colspan="2" bgcolor="#DAE8F3" align="center" class="dato3" ><%=exp1%></td>
                   <td colspan="2" bgcolor="#DAE8F3" align="center" class="dato3" ><%=exp2%></td>
                   <td colspan="2" bgcolor="#DAE8F3" align="center" class="dato3" ><%=exp3%></td>
                   
                   <td colspan="4" align="center" bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA INEI</td>
                   
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >NOMBRE DE LA &Uacute;LTIMA EXPERIENCIA EN OPERATIVO DE APLICACI&Oacute;N  DE INSTRUMENTOS EN CAMPO</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >&Uacute;LTIMA EXPERIENCIA EN COORDINACI&Oacute;N O SUPERVISI&Oacute;N DE OPERATIVOS DE  APLICACI&Oacute;N DE INSTRUMENTOS DE CAMPO</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >&Uacute;LTIMA EXPERIENCIA DE AULA O PROYECTOS DE FORMACI&Oacute;N</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" ><p>BUEN  NIVEL DE LECTURA COMPRENSIVA, RAZONAMIENTO L&Oacute;GICO Y ADECUADA DICCI&Oacute;N</p></td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >HABILIDADES PARA EL MANEJO DE EQUIPOS INTERDISCIPLINARIOS</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >DISPOSICI&Oacute;N EXCLUSIVA Y A TIEMPO COMPLETO, DURANTE TODAS LAS FASES DEL OPERATIVO</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >OBLIGATORIEDAD DE ASISTIR A LAS SESIONES DE CAPACITACI&Oacute;N</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >RESIDENTE  EN LA SEDE QUE LE CORRESPONDA</p></td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >ES DOCENTE CON AULA A CARGO EN IE ESTATALES</p></td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >PRESELECCI&Oacute;N AUTOM&Aacute;TICA</p></td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >EVALUACI&Oacute;N DE CV</td>
                   <td rowspan="2" bgcolor="#DAE8F3" align="center" class="dato3" >FECHA REGISTRO</td>
                 </tr>
                 <tr>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >REGISTRO</td>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >EN MESES</td>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >REGISTRO</td>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >EN MESES</td>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >REGISTRO</td>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >MESES</td>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >&iquest;Ha participado en el INEI?</td>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >A&Ntilde;O</td>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >PROYECTO</td>
                   <td bgcolor="#DAE8F3" align="center" class="dato3" >CARGO</td>
                 </tr>
 
		      <% 	registro = 0					
		Do While Not RsP.EOF
		response.Flush()
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 %>
		      <tr  class='<%=clase%>' style="font-size:9px;">
		        <td height="34" class='e_td_string1'><%response.Write(cont)%>
		          </td>
                <td class='e_td_string1'><%=RsP.Fields("sedeOperativa")%></td>
                <td class='e_td_string1'><%=RsP.Fields("dpto")%></td>
                <td class='e_td_string1'><%=RsP.Fields("prov")%></td>
                <td class='e_td_string1'><%=RsP.Fields("dist")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("edad")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nivel")%></td>
		        <td class='e_td_string1'>&nbsp;<%=RsP.Fields("grado")%></td>
		        <td class='e_td_string1'>&nbsp;<%=RsP.Fields("periodo")%></td>
                <td class='e_td_string1'>&nbsp;<%=RsP.Fields("profesion")%></td>
			<td class='e_td_string1'>&nbsp;<%=RsP.Fields("universidad")%> / <%=RsP.Fields("lug_estudio")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("expCampo_anio")%> A&ntilde;os - <%=RsP.Fields("expCampo_meses")%> meses</td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("expCampo")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("expGrupo_anio")%> A&ntilde;os - <%=RsP.Fields("expGrupo_meses")%> meses</td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("expGrupo")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("expgen_anio")%> A&ntilde;os - <%=RsP.Fields("expgen_meses")%> meses</td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("expgen")%></td>

            
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("inei_Proc")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("PROYECTO")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("inei_anio")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("CARGOINEI")%></td>
            
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("exp_apli")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("exp_proc")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("exp_for")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("p9")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("p5")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("p11")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("p12")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("p13")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("p10")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("aprobo_automatico")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("bandaprob")%></td>
            <td class='e_td_string1'>&nbsp;<%=RsP.Fields("fecha_reg")%></td>
            


               
        <% lsNivel= RsP.Fields("nivel")
		registro = registro + 1
		RsP.MoveNext
		Loop	
		RsP.close %>
	          </tr>
		    
            </table>
  <% else %>
               <table width='95%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      No hay registros disponibles</td>
                  </tr>
                </table>
		<% end If %>

