<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%
lsUsuario = Session("id_usuario")
ipVisitante = Request.ServerVariables("REMOTE_ADDR")

Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

	cod=request("cod")	
	
id_proyecto=session("id_proyecto")

	

		SQL1 = "exec dbo.uspGet_mostra_alta_cod '"&cod&"', '"&id_proyecto&"' "	
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
	%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>
	
	
	<form id="form1" name="form1" method="post" action="">
	
		<table width='98%' border="1" cellpadding="2" align="center" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
				<tr  style="font-size:11px; font-family:Verdana, Geneva, sans-serif">
				  <th colspan="6"   bordercolor="#DAE8F3" bgcolor="#EEDDDD" >BAJA</th>
		  </tr>
				<tr style="font-size:11px; font-family:Verdana, Geneva, sans-serif">
					<th width="13%"   bordercolor="#DAE8F3" bgcolor="#EEDDDD" ><span class="e_td_string1">
					  <input type="hidden" name="txtcod" id="txtcod"  value="<%=RSCuad.Fields("cod")%>" />
					</span>DNI<span class="e_td_string1">
					  <input name="txtdni" type="hidden" id="txtdni" value="<%=RSCuad.Fields("id_per_sale")%>" />
					</span></th>
					<th width="23%"   bordercolor="#DAE8F3"  bgcolor="#EEDDDD" ><span class="e_td_string1">
					  <input name="txtUsu" type="hidden" id="txtUsu" value="<%=lsUsuario%>" />
					  <input name="txtip" type="hidden" id="txtip" value="<%=ipVisitante%>" />
				  </span>Nombre yApellidos</th>
					<th width="19%" bordercolor="#DAE8F3"  bgcolor="#EEDDDD" >
				    Cargo				    <span class="e_td_string1">
				    <input name="lsid_puesto" type="hidden" id="lsid_puesto" value="<%=id_puesto%>" />
				    </span></th>
					<th width="14%"  bordercolor="#DAE8F3"  bgcolor="#EEDDDD" >&Uacute;ltimo d&iacute;a de labores<span class="e_td_string1">
                    <input type="hidden" name="txtititu" id="txtititu" value="<%=RSCuad.Fields("fechaIni")%>"/>
                    </span></th>
					<th width="14%"  bordercolor="#DAE8F3"  bgcolor="#EEDDDD" >Fin de labores<span class="e_td_string1">
					  <input type="hidden" name="txtftitu" id="txtftitu" value="<%=RSCuad.Fields("fechaFin")%>"/>
					</span></th>
					<th width="17%"  bordercolor="#DAE8F3"  bgcolor="#EEDDDD" >Esta<span class="e_td_string1">do Contrato</span></th>
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
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields(3)%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nombre")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("cargo")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("fechaIni")%></td>
				  <td class='e_td_string1'>
	      <%=RSCuad.Fields("fechaFin")%>
	      <input name="txtfinFecha" type="hidden" id="txtfinFecha" value="<%=RSCuad.Fields("fechaFincon")%>" /></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("estado")%></td>
		      </tr>
		<tr align="center"  style="font-size:11px; font-family:Verdana, Geneva, sans-serif">
		  <td colspan="6" class='e_td_string1'>&nbsp;</td>
		  </tr>
		<tr align="center"  style="font-size:11px; font-family:Verdana, Geneva, sans-serif">
		  <td colspan="6" bgcolor="#BBDDFF" class='e_td_string1'><strong>
          ALTA</strong>   </td>
		  </tr>
		<tr  align="center"  style="font-size:11px; font-family:Verdana, Geneva, sans-serif">
		  <td  bgcolor="#BBDDFF" class='e_td_string1'><strong>DNI Reemplazante</strong></td>
		  <td bgcolor="#BBDDFF" class='e_td_string1'><strong>Nombres y Apellidos</strong></td>
		  <td bgcolor="#BBDDFF" class='e_td_string1'><strong>Cargo</strong></td>
		  <td colspan="3" bgcolor="#BBDDFF" class='e_td_string1'><strong>Inicio de Labores</strong></td>
		  </tr>
		<tr align="center">
		  <td class='e_td_string1'><strong>
	      <input name="txtdnire" title="DNI DE LA PERSONA QUE LO VA A REEMPLAZAR" type="text" class="e_input" id="txtdnire" onblur="valida_dni('<%=RSCuad.Fields("dni")%>',this.value,'<%=nivel%>',this.id);" size="8" maxlength="8"/>
		  </strong></td>
		  <td class='e_td_string1'id="divdni">&nbsp;</td>
		  <td class='e_td_string1' id="idcargo"><input type='hidden' name='txtccdd_r' id='txtccdd_r' value='' />
		    <input type='hidden' name='txtccpp_r' id='txtccpp_r' value='' />
		    <input type='hidden' name='txtccdi_r' id='txtccdi_r'  value='' />
		    <input type='hidden' name='txtid_puesto_r' id='txtid_puesto_r'  value='' />
          <input type='hidden' name='txtid_per_Ing' id='txtid_per_Ing' value='' /></td>
		  <td colspan="3" class='e_td_string1'><input name="txtirem" type="text" class="e_input" id="txtirem"  v="v" size="10" maxlength="10" onkeyup="this.value=formateafecha(this.value);"  onblur="validar_fecha(this.value,this.id,'2')"/></td>
		  </tr>
		<tr align="center">
		  <td colspan="6" class='e_td_string1'><input type="button" name="button" id="button" value="Grabar"onclick="Ing_Alt('2')" /></td>
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



