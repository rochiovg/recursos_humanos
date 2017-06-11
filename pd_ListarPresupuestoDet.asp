<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"       --> 

<%
 id_usuario=  Session("id_usuario")
 id_proy=Session("id_proyecto")
 id_presupuesto=Request.Form("id_presupuesto")
 id_rolUsuario=Session("txtTipoUsuarioValido")
  
 ipVisitante = Request.ServerVariables("REMOTE_ADDR")

Response.ContentType="text/html; charset=iso-8859-1"

sub generaFuncional()
			
	set wRsDptoapli = Micone.execute(" exec  getTodoFuncional ")
	Response.Write "<select class=""e_combo"" style=""width:260px"" id=""txtdiv_1"" name=""txtdiv_1""  >"
	Response.Write " <option value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title ="""&wRsDptoapli("desc_CargoFuncional") & """ value=""" & wRsDptoapli("id_Cargofuncional") & """>"&wRsDptoapli("desc_CargoFuncional") & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaCargo()

	set wRsDptoapli = Micone.execute(" exec getCargoSiga")
	Response.Write "<select class=""e_combo"" style=""width:260px"" id=""txtdiv_2"" name=""txtdiv_2""  >"
	Response.Write " <option value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title="""&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" &""" value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&" ("&wRsDptoapli(2)&")" & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaActividad()

	set wRsDptoapli = Micone.execute(" exec uspGet_ActividadPresupuestal")
	Response.Write "<select class=""e_combo"" style=""width:220px"" id=""txtdiv_3"" name=""txtdiv_3""  >"
	Response.Write " <option value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title ="""&wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaFuenteFTO()

	set wRsDptoapli = Micone.execute(" exec pa_fuentefto_listar")
	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""txtdiv_4"" name=""txtdiv_4""  >"
	Response.Write " <option value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title ="""&wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(2) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub

SQL2 = "exec dbo.PA_PRESUPUESTO_DETALLE  '"&id_presupuesto&"'"


		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
		cargo=RSCuad2(0)
		actividad=RSCuad2(1)
		nivel=RSCuad2(2)
		sueldo=RSCuad2(3)
		sueldo_t=RSCuad2(4)
		desc_CargoFuncional=RSCuad2(5)
		cargo_siga=RSCuad2(6)
		fte_fto=RSCuad2(7)	
		'RSCuad2.Close
		set RSCuad2=Nothing	

if id_rolUsuario=1 or id_rolUsuario=7 or id_rolUsuario=6 then

 %>
        <table align="center" width="90%" border="1" bordercolor="#DAE8F3" cellpadding="1" cellspacing="1" >
          <tr><th  bgcolor="#DAE8F3"  colspan="6" align="center" class="aplicacion"><strong>Regresar <img src="images/retro.png" alt="Regresar" width="18" height="16" style="CURSOR:HAND" onClick="MostrarPresupuestos()" > </strong></th></tr>
          <tr><th  bgcolor="#DAE8F3"  colspan="6" align="center" class="aplicacion"><strong>Detalle de Cargo Presupuestado</strong></th></tr>
<tr>
  <td bgcolor="#FFFFE6" align="center" width="25%">Cargo Funcional</td>
  <td bgcolor="#FFFFE6" align="center" width="25%">Cargo SIGA</td>
  <td bgcolor="#FFFFE6" align="center" width="15%">Actividad</td>
  <td bgcolor="#FFFFE6" align="center" width="8%">Fuente Fto.</td>
  <td bgcolor="#FFFFE6" align="center" width="10%">Nivel del RRHH</td> 
  <td align="center" bgcolor="#FFFFE6" width="10%">Sueldo</td>
  </tr>
<tr>
  <td align="center" id="td_1"><%=desc_CargoFuncional%> &nbsp;<img src="images/edita.jpg" width="15" height="15" onclick="editar_presupuesto('1')"><br><br>
  <div id="div_1" style="display:none;background:#FFF9F9"><%generaFuncional()%><br>Guardar&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="guardar_editar('<%=id_presupuesto%>','<%=id_usuario%>','<%=ipVisitante%>','1')" ></div></td>
  
  <td align="center" id="td_2"><%=cargo_siga%> &nbsp;<img src="images/edita.jpg" width="15" height="15" onclick="editar_presupuesto('2')"><br><br>
  <div id="div_2" style="display:none; background:#FFF9F9"><%generaCargo()%><br>Guardar&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="guardar_editar('<%=id_presupuesto%>','<%=id_usuario%>','<%=ipVisitante%>', '2')" ></div></td>
  
  <td align="center" id="td_3"><%=actividad%> &nbsp;<img src="images/edita.jpg" width="15" height="15" onclick="editar_presupuesto('3')"><br><br>
  <div id="div_3" style="display:none;background:#FFF9F9"><%generaActividad()%><br>Guardar&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="guardar_editar('<%=id_presupuesto%>','<%=id_usuario%>','<%=ipVisitante%>', '3')" ></div></td>
  
  <td align="center" id="td_4"><%=fte_fto%> &nbsp;<img src="images/edita.jpg" width="15" height="15" onclick="editar_presupuesto('4')"><br><br>
  <div id="div_4" style="display:none;background:#FFF9F9"><%generaFuenteFTO()%><br>Guardar&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="guardar_editar('<%=id_presupuesto%>','<%=id_usuario%>','<%=ipVisitante%>', '4')" ></div></td>
  
  <td align="center" id="td_5"><%=nivel%>&nbsp;<img src="images/edita.jpg" width="15" height="15" onclick="editar_presupuesto('5')"><br><br>
  <div id="div_5" style="display:none;background:#FFF9F9">
  <select name="txtdiv_5" class="e_combo" id="txtdiv_5">
 	             <option value="">Seleccione</option>
 	             <option title="Red T&eacute;cnica Administrativa" value="3">RTA</option>
 	             <option title="Red Administrativa Operativa" value="1">RAO</option>
 	             <option title="Red Operativa" value="2">RO</option>
 	             </select><br>Guardar&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="guardar_editar('<%=id_presupuesto%>','<%=id_usuario%>','<%=ipVisitante%>', '5')" ></div></td>
  
  <td align="center"><%=sueldo_t%> &nbsp;</td>
  </tr>
</table><br>
<%
end if

SQL5 = "exec dbo.PA_PRESUPUESTODET_LISTAR '"&id_presupuesto&"' "	

		Set RSCuad5	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad5.cursorlocation=3
		RSCuad5.Open SQL5, MiCone, 3,3
		
If Not RSCuad5.BOF And Not RSCuad5.EOF Then

%>
 <table align="center" width="60%" border="1" bordercolor="#DAE8F3" cellpadding="1" cellspacing="1" >
 <%if id_rolUsuario=1 or id_rolUsuario=7  or id_rolUsuario=6 then
 else
 %>
 <tr class="aplicacion">
        <td colspan="5"  bgcolor="#DAE8F3" align="center" ><div align="center"><strong>Regresar <img src="images/retro.png" alt="Regresar" width="18" height="16" style="CURSOR:HAND" onClick="MostrarPresupuestos()" > </strong></td>
   </tr>
   
   <%end if%>
          <tr class="aplicacion">
        <td  bgcolor="#DAE8F3" class="etiqueta2" ><div align="center">NRO.</td>
        <td  bgcolor="#DAE8F3" class="etiqueta2" >PERIODO</td>
		<td  bgcolor="#DAE8F3" class="etiqueta2" >ARMADAS</td>
        <td  bgcolor="#DAE8F3" class="etiqueta2" >CANTIDAD PEA</td>
        <td  bgcolor="#DAE8F3" class="etiqueta2" >TOTAL PRESUPUESTO</td>
		<td  bgcolor="#DAE8F3" class="etiqueta2" >TDR</td>
   </tr>
      
       <%  		registro = 0	
	   			cont = registro+1 
							
			Do While Not RSCuad5.EOF 
            
            if RSCuad5.Fields("periodo")="--" then %>
            <tr height="20px" bgcolor="#FFFFE6">
        <td colspan="3" align="center">TOTAL</td>
        
        <td  align="center" ><%=RSCuad5.Fields("totalpea_pdetalle")%></td>
        <td align="center" ><%=RSCuad5.Fields("monto_pdet")%></td>
        <td align="center" >
        
        
        
        </td>
        
        
   </tr>
   <%else%>
      <tr class='<%=clase%>'>
        <td class='etiqueta'>&nbsp;<%=cont%></td>



        <td class='etiqueta' id="nperiodo_pdet<%=RSCuad5.Fields("id")%>" > <%= Response.write("<a href=""#"" onclick=""javascript:mod_pres('" & RSCuad5.Fields("id")& "','" & RSCuad5.Fields("nperiodo_pdet") & "','nperiodo_pdet', '"&RSCuad5.Fields("id_presupuesto")&"')"">" & RSCuad5.Fields("nperiodo_pdet") & "</a>")%>&nbsp;&nbsp;<%=RSCuad5.Fields("periodo")%></td>
        
           <td class='etiqueta' id="armadas<%=RSCuad5.Fields("id")%>"><% Response.write("<a href=""#"" onclick=""javascript:mod_pres('" & RSCuad5.Fields("id")& "','" & RSCuad5.Fields("armadas") & "','armadas', '"&RSCuad5.Fields("id_presupuesto")&"')"">" & RSCuad5.Fields("armadas") &"</a>")%></td>
           
        
        <td class='etiqueta' id="totalpea_pdetalle<%=RSCuad5.Fields("id")%>"><% Response.write("<a href=""#"" onclick=""javascript:mod_pres('" & RSCuad5.Fields("id")& "','" & RSCuad5.Fields("totalpea_pdetalle") & "','totalpea_pdetalle', '"&RSCuad5.Fields("id_presupuesto")&"')"">" & RSCuad5.Fields("totalpea_pdetalle") &"</a>")%></td>
        <td class='etiqueta'>&nbsp;<%=RSCuad5.Fields("monto_pdet")%></td>
        <td align="center" >  
        
        <img src="images/edita.PNG" style="CURSOR:HAND" alt="Editar" onclick="window.open('pd_EditarTDR.asp?lsIdConvocatoriaCargo=<%=id_presupuesto%>&id_presupuestodet=<%=RSCuad5.Fields("id")%>','','scrollbars=yes,resizable=yes')" ></img>
        </td>
        
      </tr>
                 <%end if
				 registro = registro + 1
			RSCuad5.MoveNext
			Loop	
			RSCuad5.close
			set RSCuad5=nothing 
 %>
 
<%if id_rolUsuario=1 or id_rolUsuario=7 then%>
     <tr class='<%=clase%>'>
        <td class='etiqueta'><%=registro%></td>
        <td class='etiqueta' id="distcon"><input name="txtnperiodoDET" type="text" class="e_td_number" id="txtnperiodoDET" onkeypress="return TextUtil.allowChars(this, event)" size="5" maxlength="5" validchars="1234567890." />
          <select name="cmbperiodoDet" class="e_combo" id="cmbperiodoDet">
            <option value="">Seleccione</option>
            <option value="1">D&iacute;a</option>
            <option value="2">Mes</option>
          </select>
        <font class='alerta5'>(*)</font></td>
        
          <td class='etiqueta' id="prov2"><input name="txtArmadas" type="text" class="e_td_number" id="txtArmadas" onkeypress="return TextUtil.allowChars(this, event)" size="5" maxlength="5" validchars="1234567890."/>
        <font class='alerta5'>(*)</font></td>
        
        
        <td class='etiqueta' id="prov2"><input name="txtcantDET" type="text" class="e_td_number" id="txtcantDET" onkeypress="return TextUtil.allowChars(this, event)" size="5" maxlength="5" validchars="1234567890"/>
        <font class='alerta5'>(*)</font></td>
        <td id="divTotal" class='etiqueta'>
        <a onclick="agregar_presDet('<%=id_presupuesto%>', '<%=sueldo%>')">Guardar</a>&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="agregar_presDet('<%=id_presupuesto%>', '<%=sueldo%>')" ></img></td>
   </tr> 
   <%end if%>
   
</table>

    <%end if %>
        



