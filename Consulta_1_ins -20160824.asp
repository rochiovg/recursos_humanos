<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.ContentType="text/html; charset=iso-8859-1"


idProyecto=Session("id_proyecto")
codigoMeta=Session("codigoProyecto")

var1Cargo=request("lsCargo") '7
varReporte=request("lsReporte") '7

	varNomDpto=request("lsDPTO")	'15LIMA
	varNomProv=request("lsPROV")	'1501LIMA
	varNomDist=request("lsDIST")	'150101LIMA
	varlsconv=request("lsConvocaroria")
	valor=request("valor")	
	lsnivel=Request("lsnivel")
	txtSedeop=Request("txtSedeop")
	sede=Request("sede")
	txtProvSed=Request("txtProvSed")
	txtDistSed=Request("txtDistSed")
	txtfecha=Request("txtfecha")
	txtTrabI=Request("txtTrabI")

	' valores de las sedes
	if txtProvSed="9999" then
	txtProvSed="9999"
	else
	txtProvSed=mid(txtProvSed,4)		
	end if
	txtDistSed=mid(txtDistSed,1,6)	
	
	varDpto=mid(varNomDpto,1,2)		'15
	varProv=mid(varNomProv,3,2)		'01	
	varDist=mid(varNomDist,5,2)		'01
	'							
	lsvarNomDpto = len(varNomDpto) '6
	nombredpto=mid(varNomDpto,3,lsvarNomDpto-2)	'LIMA
	lsvarNomProv = len(varNomProv) '6
	nombreprov=mid(varNomProv,5,lsvarNomProv-4)	'LIMA
	lsvarNomDist = len(varNomDist) '6
	nombredist=mid(varNomDist,7,lsvarNomDist-6)	'LIMA
	
	
	
	
	vartiCargo=mid(var1Cargo,1,1)		'15
	lsVarCodCargo = len(var1Cargo) '6
	varCargo=mid(var1Cargo,2,lsVarCodCargo-1)	'LIMA
	
if varReporte="1" then
		REPORTE=" INSCRITOS TOTALES"
	end if
	if varReporte="28" then
		REPORTE=" Preselecci&oacute;n Ficha"
	end if
	if varReporte="21" then
		REPORTE=" Calificaci&oacute;n Autom&aacute;tica"
	end if
	if varReporte="23" then
		REPORTE=" Evaluaci&oacute;n Curricular"
	end if
	if varReporte="25" then
		REPORTE=" Evaluaci&oacute;n de Conocimientos y/o de Competencias"
	end if
	if varReporte="26" then
		REPORTE=" Aptos Entrevista"
	end if
	if varReporte="24" then
		REPORTE=" Entrevista Personal"
	end if
	if varReporte="4" then
		REPORTE=" SELECCIONADOS TITULARES Y RESERVA"
	end if
	if varReporte="5" then
		REPORTE=" SELECCIONADOS TITULARES"
	end if
	if varReporte="27" then
		REPORTE=" CONTRATADOS"
	end if	
	
	
	
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
                          	'					7				15				01				01

	if vartiCargo = "9" then
		vartiCargo = "1,2,3"
	end if

	'---------------------------REPORTE POR NIVELES ( IMPORTANTE : CONFIGURAR POR CADA PROYECTO )

		SQL1 = "exec dbo.pa_reporte_procesos_nivel '"&varCargo&"', '"&varDpto&"', '"&varProv&"', '"&varDist&"' , '"&varReporte&"', '"&vartiCargo&"', '"&idProyecto&"', '"&varlsconv&"', '"&valor&"', '"&lsnivel&"', '"&txtSedeop&"', '"&sede&"' , '"&txtProvSed&"', '"&txtDistSed&"', '"&txtfecha&"', '"&txtTrabI&"' "
		
		response.write(SQL1)
		
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
If Not RSCuad.BOF And Not RSCuad.EOF Then


	%>
	
	
	
		<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
       <tr>
                  <td colspan="16" align="center"><span class="titulo">REPORTE DE <%= REPORTE %><img src="images/excell1.gif" onclick="enviar_consultaReporte()"  width="32" height="29" /></span></td>
          </tr>
				<tr><span style="text-align:justify"> </span>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro</th>
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro. de Convocatoria</th>   
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Tiempo de Contrataci&oacute;n</th>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Sede</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Depatamento</th>
					<th bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Provincia</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Distrito</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Tambo</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Cen.Pob</th>                                
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Cargo</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nombre</th>             		
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">RUC</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Telefono</th>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Celular</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Correo</th>	
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nivel</th>
                    <%if varReporte=21 then%>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nota Autom&aacute;tica</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado Evaluaci&oacute;n<br>Autom&aacute;tica</th>
                    <%end if%>
                    <%if varReporte=28 then%>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado Evaluaci&oacute;n<br>Autom&aacute;tica</th>
                    <%end if%>
                    
                    <%if varReporte=23 then%>
                    <%if idProyecto <> 139 THEN%>
                    
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >FORMACION ACAD&Eacute;MICA</th>   
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA LABORAL</th>
		        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA EN AULA</th>
		        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >TIEMPO DE EXPERIENCIA</th>
                
                <%else%>
                
                
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><%if varCargo=2605 then%>CUMPLIMIENTO REQ.<%ELSE%>NOTA 1<%END IF%> </th>   
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><%if varCargo=2605 then%>EXP. EN APLIC<%ELSE%>NOTA 2<%END IF%></th>
		        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><%if varCargo=2605 then%>FORM. ACAD.<%ELSE%>NOTA 3<%END IF%> </th>
		        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><%if varCargo=2605 then%><%else%>NOTA 4<%end if%> </th>
                
                <%end if%>
                
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >NOTA CV</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado Evaluaci&oacute;n CV</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Observaci&oacute;n</th>
                    <%end if%>
                    
                    <%if varReporte=25 then%>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nota Test</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado</th>
                     <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Eval. COmpetencias</th>
                    <%end if%>
                    <%if varReporte=24 then%>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nota Entrevista</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nota Final</th>
 <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Resultado</th>
                    <%end if%>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Fecha Inscripci&oacute;n</th>
                
                
                 <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3"><% if varReporte=28 then %>ESTADO INSCRIPCI&Oacute;N <%else%>Estado <%end if%></th>
                 <% IF codigoMeta="0053"  THEN%>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Trabajador INEI</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Tipo Contrato INEI</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">OFICINA DEPARTAMENTAL</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DIRECCI&Oacute;N T&Eacute;CNICA</th>
           <%end if%>
           <%IF varReporte=2 THEN %>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOTA PRESELECCI&Oacute;N </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">ESTADO PRESELECCI&Oacute;N</th>
           <%END IF%>
           
           <%IF varReporte=3 THEN %>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 1 </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 2 </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 3  </th>
           <%if varlsconv= 5100 or varlsconv = 5103 then%>
			<%else%>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 4  </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 5  </th>
           <%end if%>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOTA CAPACITACI&Oacute;N </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">ESTADO CAPACITACI</th>
           <%END IF%>
           
           
          </tr>
		  <%registro = 0					
							
			Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 %>
		<tr class='<%=clase%>'>
				  <td height="47" class='e_td_string1'><%response.Write(cont)%></td>
       <td class='e_td_string1'><%=RSCuad.Fields("num_convocatoria")%></td>           
<td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nPeriodo_CCP")%><%=RSCuad.Fields("TipoP")%></td>
<%	if id_proyecto=45 then
		SEDE=RSCuad.Fields("sede") 
	ELSEIF ID_PROEYCTO=47 THEN
		SEDE=RSCuad.Fields("sede_operativa")
	ELSE
		SEDE=RSCuad.Fields("ozei")
	END IF
%>

				  <td class='e_td_string1'>&nbsp;<%=SEDE%></td>
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dpto")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("prov")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dist")%></td>
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("des_tambo")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("des_cp")%></td>
                  
				  <td class='e_td_string1'><%=RSCuad.Fields("cargo")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("nombre")%></td>              
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dni")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("ruc")%></td>
			     <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("telefono")%></td>				
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("celular")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("correo")%></td>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nivel")%></td>	
                  <% if varReporte=21 then%>	
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nota_testInfo")%></td>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("aprobo_au")%></td>
                  <%end if %>
                  <% if varReporte=28 then%>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("aprobo_au")%> <a href="declaracion.asp?id=<%=RSCuad.Fields("id_convocatoriacargo")%>&p=<%=idProyecto%>&dni=<%=RSCuad.Fields("dni")%>"  target="_blank"> (Ver Ficha) </a></td>
                  <%end if %>
                  <% if varReporte=23 then%>
                  <td class='e_td_string1'><%if varCargo=2605 then%> <%IF RSCuad.Fields("p_formacionAct") = "1" THEN  RESPONSE.WRITE("SI")  ELSE IF RSCuad.Fields("p_formacionAct") = "2" THEN  RESPONSE.WRITE("NO")  ELSE RESPONSE.WRITE("") END IF END IF%><%ELSE%><%=RSCuad.Fields("p_formacionAct")%><%END IF%></td>
                 <td class='e_td_string1'><%=RSCuad.Fields("p_expLaboral")%></td>
		         <td class='e_td_string1'><%=RSCuad.Fields("p_expAula")%></td>
		         <td class='e_td_string1'><%=RSCuad.Fields("p_experiencia")%></td>
		         <td class='e_td_string1'><%=RSCuad.Fields("p_total")%></td>	
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("estado_cv")%></td>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("cv_observacion")%></td>
                  <%end if %>
                   <% if varReporte=25 then%>	
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nota_testinfo")%></td>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("aprobo_test")%></td>
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("competencia")%></td>
                  <%end if %>
                  
                   <% if varReporte=24 then%>	
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("promedioEntevista")%></td>		
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("totalEntrevista")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("aptototalEntrevista")%></td>
                  <%end if %>
                  
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("fec_reg")%></td>		               		                 
	
<td class='e_td_string1'><% IF varReporte=28 THEN 
RESPONSE.WRITE (RSCuad.Fields("a1"))
ELSE

if varReporte = 27 then
RESPONSE.WRITE (RSCuad.Fields("estadoC"))
else
RESPONSE.WRITE (RSCuad.Fields("estado")) END IF END IF%></td>
<% IF codigoMeta="0053"  THEN%>	
<td class='e_td_string1'><%=RSCuad.Fields("t")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("tc")%></td>
<td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("DEPEN_FISICA")%></td>
<td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("DEPEN_PRESUP")%></td>
<%end if%>		

<%IF varReporte=2 THEN %>
           <td  class='e_td_string1'><%=RSCuad.Fields("notaprecap")%></th>
           <td  class='e_td_string1'><%=RSCuad.Fields("DESC_PRESELEC")%></th>
           <%END IF%>
           
           <%IF varReporte=3 THEN %>
           <td  class='e_td_string1'><%=RSCuad.Fields("p1")%></th>
<td  class='e_td_string1'><%=RSCuad.Fields("p2")%></th>
<td  class='e_td_string1'><%=RSCuad.Fields("p3")%></th>

<%if varlsconv= 5100 or varlsconv = 5103 then%>
<%else%>
<td  class='e_td_string1'><%=RSCuad.Fields("p4")%></th>
<td  class='e_td_string1'><%=RSCuad.Fields("l1")%></th>
<%end if%>
           <td  class='e_td_string1'><%=RSCuad.Fields("notacap")%></th>
           <td  class='e_td_string1'><% 
		   if RSCuad.Fields("capacita")=1 then response.write("Apronado") end if 
		   if RSCuad.Fields("capacita")=2 then  response.Write("desaprobado")end if
		    %></th>
           <%END IF%>
                            
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
 
          <tr>
                
                <td colspan="16" align="right"><p>FECHA Y HORA: <%= Now() %>&nbsp;</p></td>
                </tr>
                
		</table>
		
<%else%>
<span class="titulo"><%= REPORTE %></span>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if %>



