<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

idProyecto=Session("id_proyecto")

var1Cargo=request("lsCargo") '7
varReporte=request("lsReporte") '7

	varNomDpto=request("lsDPTO")	'15LIMA
	varNomProv=request("lsPROV")	'1501LIMA
	varNomDist=request("lsDIST")	'150101LIMA
	
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
	
	if varReporte="6" then
		REPORTE=" INSCRITOS APROBADOS"
	end if
	if varReporte="2" then
		REPORTE=" PRESELECCIONADOS"
	end if
	if varReporte="3" then
		REPORTE=" PERSONAL QUE ASISTIO A CAPACITACION"
	end if
	if varReporte="4" then
		REPORTE=" TODOS LOS SELECCIONADOS"
	end if
	if varReporte="5" then
		REPORTE=" SELECCIONADOS TITULARES"
	end if
	if varReporte="12" then
		REPORTE=" TODOS LOS SELECCIONADOS SIN RUC"
	end if
	if varReporte="8" then
		REPORTE=" PERSONAL QUE NO ENTREGO CV"
	end if
	if varReporte="9" then
		REPORTE=" PERSONAL QUE ENTREGO CV"
	end if
	if varReporte="13" then
		REPORTE=" PERSONAL QUE APROBO CV"
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

		SQL1 = "exec dbo.uspGet_Datos_Reporte '"&varCargo&"', '"&varDpto&"', '"&varProv&"', '"&varDist&"' , '"&varReporte&"', '"&vartiCargo&"', '"&idProyecto&"'"	
	
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
	%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>
	
<meta http-equiv="pragma" content="no-cache" />

 
	
		<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
        <tr>
                  <td colspan="17" align="center"><span class="titulo">REPORTE DE <%= REPORTE %></span></td>
          </tr>

				<tr>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro</th>
                     <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro. de Convocatoria</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Tiempo de Contrataci&oacute;n</th>
                    					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Depatamento</th>
					<th bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Provincia</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Distrito</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Cargo</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nombre</th>             		
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">RUC</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Telefono</th>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Celular</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Correo</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">RPM</th>	
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nivel</th>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Fecha Inscripci&oacute;n</th>
                    
               
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado</th>
          </tr>
		  <%registro = 0					
				
			Do While Not RSCuad.EOF
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 %>
		<tr class='<%=clase%>'>
				  <td class='e_td_string1'><%response.Write(cont)%></td>
                                   
<td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("num_convocatoria")%></td>	
                
                  
<td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nPeriodo_CCP")%><%=RSCuad.Fields("TipoP")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dpto")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("prov")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dist")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("cargo")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("nombre")%></td>             
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dni")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("ruc")%></td>
			     <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("telefono")%></td>				
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("celular")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("correo")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("RPM")%></td>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nivel")%></td>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("fec_reg")%></td>	
                  <td class='e_td_string1'><%=RSCuad.Fields("estado")%></td>                  	
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
 
 <tr> <td colspan="17" align="right"><p>FECHA Y HORA: <%= Now() %>&nbsp;&nbsp;</p></td> </tr>
		</table>
		
	<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if%>



