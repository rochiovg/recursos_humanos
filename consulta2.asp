
<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
lsUsuario =  Session("id_usuario")
lsCargoUsuario= Session("cargoUsuario")
ipVisitante = Request.ServerVariables("REMOTE_ADDR")

idProyecto=Session("id_proyecto")

sub generaJusti()
			
	Set wRsDptoapli = Server.CreateObject("ADODB.Recordset")
	sql1 = " exec dbo.getJustiBaja"
	wRsDptoapli.CursorLocation=3
	wRsDptoapli.Open sql1, Micone,3,3
	
	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""cmbejust"" name=""cmbejust"" >"
	Response.Write " <option  value=""0"">Seleccione</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub
Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

 lscontratos=request("slcontrato")  
	rst=""
	con1="exec dbo.uspGet_DatoPlanilla  '"&lscontratos&"' , '"&idProyecto&"'"
	
	
	Set RSC	= Server.CreateObject("ADODB.Recordset") 
	RSC.cursorlocation=3
	RSC.Open con1, MiCone, 3,3
	
	If RSC.RecordCount>0 then
		if RSC("cod")="1" then
			mensaje="Importante!!! La persona ha sido Incluida en una planilla de pago<br>"&RSC("Descripcion")&"- Estado: "&RSC("estadoPla")&"<br>Si va a registrar la baja Informar antes del cierre de la planilla"
			rst=""
			color="bgcolor=""#FF8888"""	
		elseif RSC("cod")="2" then 
			mensaje="Importante!!! la persona ya no tiene pagos pendientes<br>Ultima Planilla de pago:"&RSC("Descripcion")&"- Estado: "&RSC("estadoPla")&"<br>Si se requiere registrar la baja Coordinar con el Area Administrativa"
			rst="disabled=""disabled"""
			color="bgcolor=""#FF8888"""	
		end if	
	else 
		mensaje=""
		color=""
	end if
	


	consulta1="exec dbo.uspGet_DatosContratadosActivos   '99', '99', '98', '2', '"&lscontratos&"','','','"&idProyecto&"'  "
	
	
	Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
	RSCuad.cursorlocation=3
	RSCuad.Open consulta1, MiCone, 3,3
	%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>
	
	
	<form id="form1" name="form1" method="post" action="">
	
		<table width='98%' border="1" cellpadding="2" align="center" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
				<tr  style="font-size:11px; font-family:Verdana, Geneva, sans-serif">
				  <th colspan="8"   bordercolor="#DAE8F3" bgcolor="#EEDDDD" ><strong>BAJA</strong></th>
		  </tr>
				<tr style="font-size:11px; font-family:Verdana, Geneva, sans-serif">
					<th width="16%"   bordercolor="#DAE8F3" bgcolor="#EEDDDD" ><strong>DNI</strong></th>
					<th width="18%"   bordercolor="#DAE8F3"  bgcolor="#EEDDDD" ><strong>Nombre yApellidos</strong></th>
					<th width="16%" bordercolor="#DAE8F3"  bgcolor="#EEDDDD" ><strong>Cargo</strong> <input name="txt_ruta" type="hidden" id="txt_ruta" value="<%=RSCuad.Fields("id_ruta")%>" /></th>
                    <th width="10%"  bordercolor="#DAE8F3"  bgcolor="#EEDDDD" ><strong>Fecha Suscripci&oacute;n<br>Contrato</strong></th>
					<th width="10%"  bordercolor="#DAE8F3"  bgcolor="#EEDDDD" ><strong>Inicio de Labores</strong></th>
					<th width="15%"  bordercolor="#DAE8F3"  bgcolor="#EEDDDD" ><strong>&Uacute;ltimo d&iacute;a de labores</strong></th>
					<th width="14%"  bgcolor="#EEDDDD" ><strong>Justificaci&oacute;n</strong></th>
					<th width="11%"  bgcolor="#EEDDDD" ><strong>Pago por d&iacute;as de Trabajo</strong></th>
          </tr>
		  <%registro = 0					
				
			Do While Not RSCuad.EOF
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 
				
				

				%>
		<tr align="center">
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dni")%>
			      <input name="txtid_per_sale" type="hidden" id="txtid_per_sale" value="<%=RSCuad.Fields("id_per")%>" /></td>
				  <td class='e_td_string1'><input name="txtip" type="hidden" id="txtip" value="<%=ipVisitante%>" />
	      <input name="txtUsu" type="hidden" id="txtUsu" value="<%=lsUsuario%>" />				    &nbsp;<%=RSCuad.Fields("nombre")%></td>
				  <td class='e_td_string1'><input name="lsid_contrato" type="hidden" id="lsid_contrato" value="<%=RSCuad.Fields("id_contratos")%>" />				    &nbsp;<%=RSCuad.Fields("cargo")%></td>
                  <td class='e_td_string1'><%=RSCuad.Fields("fec_suscripcion")%> <!--input name="txtititu" type="text" class="e_texto" id="txtititu" readonly="readonly" onKeyUp="this.value=formateafecha(this.value);" value="<%'=RSCuad.Fields("fec_suscripcion")%>" size="10" maxlength="10"  /  --></td>
				  <td class='e_td_string1'><!--<%=RSCuad.Fields("fec_inicio")%>--><input name="txtititu" type="text" class="e_texto" id="txtititu" readonly="readonly" onKeyUp="this.value=formateafecha(this.value);" value="<%=RSCuad.Fields("fec_inicio")%>" size="10" maxlength="10"  /  ></td>
				  <td class='e_td_string1'><input name="txtftitu" type="text" class="e_input" id="txtftitu" onKeyUp="this.value=formateafecha(this.value);" size="10" maxlength="10" onblur="validar_fecha(this.value,this.id,'1')" value="<%=RSCuad.Fields("fechaFin")%>"/>
			      <input name="txtfinFecha" type="hidden" id="txtfinFecha" value="<%=RSCuad.Fields("fechaFin")%>" /></td>
				  <td class='e_td_string1'><%generaJusti()%></td>
				  <td class='e_td_string1' align="right">
				    <label for="checkbox"><strong>Si</strong>
			        <input name="rbtppCompleto" type="radio" id="si" value="1" checked="checked" />
			       
                    </label> <br />
			       <label for="checkbox"> <strong>No</strong>
<input type="radio" name="rbtppCompleto" id="no" value="0" />
			      </label></td>
		      </tr>
		<tr align="center">
        <td colspan="7" <%=color%>class='e_td_string1'><p><%=mensaje%><p/></td>
		  <td colspan="7" class='e_td_string1'>&nbsp;</td>
		  </tr>
          <tr align="center">
		  <td colspan="7" class='e_td_string1'>&nbsp;</td>
		  </tr>
          
          
          
		<tr align="center"  style="font-size:11px; font-family:Verdana, Geneva, sans-serif">
		  <td colspan="7" bgcolor="#BBDDFF" class='e_td_string1'><strong>
          ALTA</strong>   </td>
		  </tr>
		<tr  align="center"  style="font-size:11px; font-family:Verdana, Geneva, sans-serif">
		  <td  bgcolor="#BBDDFF" class='e_td_string1'><strong>DNI Reemplazante</strong></td>
		  <td bgcolor="#BBDDFF" class='e_td_string1'><strong>Nombres y Apellidos</strong></td>
		  <td bgcolor="#BBDDFF" class='e_td_string1'><strong>Cargo</strong></td>
		  <td bgcolor="#BBDDFF" class='e_td_string1'><strong>Inicio de Labores</strong></td>
		  <td colspan="3" rowspan="2" class='e_td_string1'>&nbsp;</td>
		  </tr>
		<tr align="center">
		  <td class='e_td_string1'>
		    <strong>
		    <input name="txtdnire" title="DNI DE LA PERSONA QUE LO VA A REEMPLAZAR" type="text" class="e_input" id="txtdnire" onblur="valida_dni('<%=RSCuad.Fields("dni")%>',this.value,'<%=nivel%>',this.id);" size="8" maxlength="8"/>
          </strong></td>
		  <td class='e_td_string1'id="divdni">&nbsp;</td>
		  <td class='e_td_string1' id="idcargo"><input type='hidden' name='txtccdd_r' id='txtccdd_r' value='' /><input type='hidden' name='txtccpp_r' id='txtccpp_r' value='' /><input type='hidden' name='txtccdi_r' id='txtccdi_r'  value='' /><input type='hidden' name='txtid_puesto_r' id='txtid_puesto_r'  value='' />
	      <input type='hidden' name='txtid_per_Ing' id='txtid_per_Ing' value='' /></td>
		  <td class='e_td_string1'><input name="txtirem" type="text" class="e_input" id="txtirem"  v="v" size="10" maxlength="10" onkeyup="this.value=formateafecha(this.value);"  onblur="validar_fecha(this.value,this.id,'2')"/></td>
		  </tr>
		<tr align="center">
		  <td colspan="7" class='e_td_string1'>&nbsp;</td>
		  </tr>
		<tr align="center">
		  <td colspan="7" class='e_td_string1'><input type="button" <%=rst%> name="button" id="button" value="GRABAR" onclick="Ing_Alt_Baj('1')" class="boton"/></td>
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
		
    </form>
<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if%>



