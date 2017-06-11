<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

id_Proyecto=Session("id_proyecto")

var1Cargo=request("lsCargo") '7

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

		SQL1 = "exec dbo.uspGet_DatosSeleccionado_RA '"&varCargo&"', '"&varDpto&"', '"&varProv&"', '"&varDist&"','"&vartiCargo&"', '"&id_proyecto&"' "
		
		
		
		
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
	%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>
	
	 
	
		<table width='99%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
				<tr>
					<th width="7%"   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro</th>
					<th width="9%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Provincia</th>
					<th width="8%"   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Distrito</th>
					<th width="15%"   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Cargo</th>
					<th width="10%"   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
					<th width="24%"   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nombre</th>             		
					<th width="13%"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">RPM</th>
					<th width="14%"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">IMEI</th>
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
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("prov")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dist")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("cargo")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("dni")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("nombre")%></td>              
		     <td class='e_td_string1' align="center" id="t<%=RSCuad.Fields("dni")%>" >
             <input name="txt<%=RSCuad.Fields("dni")%>" type="text" class="etiqueta" id="txt<%=RSCuad.Fields("dni")%>"  onblur="javascript:grabar_rpm('<%=RSCuad.Fields("dni")%>',this.value)" onKeyPress="return TextUtil.allowChars(this, event)" value="<%=RSCuad.Fields("rpm")%>" size="12" maxlength="12" validchars="0123456789 #" /></td>
		     <td class='e_td_string1' align="center" id="i<%=RSCuad.Fields("dni")%>" ><input name="txti<%=RSCuad.Fields("dni")%>" type="text" class="etiqueta" id="txti<%=RSCuad.Fields("dni")%>"  onblur="javascript:grabar_imei('<%=RSCuad.Fields("dni")%>',this.value)" onKeyPress="return TextUtil.allowChars(this, event)" value="<%=RSCuad.Fields("imei")%>" size="15" maxlength="15" validchars="0123456789 #" /></td>
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
	<%end if

	%>



