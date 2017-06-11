<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"       --> 

<%
 id_usuario=  Session("id_usuario")
 id_proy=Session("id_proyecto")
 id_rolUsuario=Session("txtTipoUsuarioValido")
 id_ccp=Request.Form("id_ccp") 
 ipVisitante = Request.ServerVariables("REMOTE_ADDR")

 

 ipVisitante = Request.ServerVariables("REMOTE_ADDR")



 sub generaTipoOfc()
			
	set wRsDptoapli = Micone.execute(" exec PA_abreviatura_oficios_LISTAR")
	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""cmbTipoOfcR1"" name=""cmbTipoOfcR1""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title=""" & wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

 sub generaTipoOfc2()
			
	set wRsDptoapli = Micone.execute(" exec PA_abreviatura_oficios_LISTAR_2")
	Response.Write "<select class=""e_combo"" style=""width:100px"" id=""cmbTipoOfcR2"" name=""cmbTipoOfcR2""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title=""" & wRsDptoapli(1) & """ value=""" & wRsDptoapli(0) & """>"&wRsDptoapli(1)&"</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


SQL2 = "exec dbo.PA_CCPRESUPUESTARIO_DETALLE '"& id_ccp &"' , '"& id_proy &"' "


	
		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
		If Not RSCuad2.BOF And Not RSCuad2.EOF Then	
		
		ID_CCP=RSCuad2(0)
		docSolicita_CCP=RSCuad2(1)
		fecha_docSolicitaCCP=RSCuad2(2)
		documento_CCP=RSCuad2(3)
		fecha_DocCCP=RSCuad2(4)
		cargo=RSCuad2(5)
		estado=RSCuad2(6)
		pea=RSCuad2(7)
		pea_cont=RSCuad2(8)
		totalArmadas=RSCuad2(9)
		nPeriodo_CCP=RSCuad2(10)
		tperiodo=RSCuad2(11)
		MontoUnitario=RSCuad2(12)
		total=RSCuad2(13)
		MontoPagado=RSCuad2(14)
		bajas_eje=RSCuad2(15)
		DOC_SOLICITA_REBAJA=RSCuad2(16)
		FECHA_DOC_SOLICITA=RSCuad2(17)
		DOC_REBAJA=RSCuad2(18)
		FECHA_REBAJA=RSCuad2(19)
		PEA_REBAJA=RSCuad2(20)
		PEA_PA_REBAJA = pea-pea_cont+bajas_eje-PEA_REBAJA
		A_PAGAR=RSCuad2(21)
		MONTO_FALTANTE=A_PAGAR - MontoPagado
		PAGO=RSCuad2(22)
		ID_PRESUPUESTO=RSCuad2(23)
		PEA_REBAJA=RSCuad2(24)
		MONTO_REBAJA=RSCuad2(25)
		DOC_SOLICITA_REBAJA=RSCuad2(26)
		FECHA_DOC_SOLICITA=RSCuad2(27)
		DOC_REBAJA=RSCuad2(28)
		FECHA_REBAJA=RSCuad2(29)
		else
		
		ID_CCPresupuestario=""
		docSolicita_CCP=""
		fecha_docSolicitaCCP=""
		documento_CCP=""
		fecha_DocCCP=""
		cargo=""
		estado=""
		pea=""
		pea_cont=""
		totalArmadas=""
		nPeriodo_CCP=""
		tperiodo=""
		MontoUnitario=""
		total=""
		MontoPagado=""
		bajas_eje=""
		DOC_SOLICITA_REBAJA=""
		FECHA_DOC_SOLICITA=""
		DOC_REBAJA=""
		FECHA_REBAJA=""
		PEA_REBAJA=""
		PEA_PA_REBAJA=""
		A_PAGAR=""
		MONTO_FALTANTE=""
		PAGO=""
		ID_PRESUPUESTO=""
		PEA_REBAJA=""
		MONTO_REBAJA=""
		DOC_SOLICITA_REBAJA=""
		FECHA_DOC_SOLICITA=""
		DOC_REBAJA=""
		FECHA_REBAJA=""
		end if
		'RSCuad2.Close
		set RSCuad2=Nothing	

ANIO_A=Year(Date)
ANIO_AN=Year(Date)-1
 

 %>
 
           <% if ESTADO="0"  then %>
   
      <table cellpadding="1" cellspacing="1" border="0" width="99%">
       <tr><th  bgcolor="#DAE8F3"  colspan="4" align="center" class="aplicacion"><strong>Regresar <img src="images/retro.png" alt="Regresar" width="18" height="16" style="CURSOR:HAND" onClick="MostrarCCPresupuestario()" > </strong></th></tr>
      <tr height=22>
        <td colspan=4 align=center><FONT CLASS='cascade3' color=MediumBlue>El registro de la Certificaci&oacute;n de Cr&eacute;dito Presupuestario <br>
          no ha sido activado
          <br><br>
           Por favor verifique...!!!</FONT>
        </td></tr>
	</table>
    
<% else %>
 		<%if id_rolUsuario=1 or id_rolUsuario=7 or id_rolUsuario=6 then%>
        <table align="center" width="90%" border="1" bordercolor="#DAE8F3" cellpadding="1" cellspacing="1" >
          <tr><th  bgcolor="#DAE8F3"  colspan="5" align="center" class="aplicacion"><strong>Regresar <img src="images/retro.png" alt="Regresar" width="18" height="16" style="CURSOR:HAND" onClick="MostrarCCPresupuestario()" > </strong></th></tr>
          <tr>
            <th  bgcolor="#DAE8F3"  colspan="5" align="justify" class="aplicacion"><strong style="text-align:center">DETALLE DE CERTIFICACI&Oacute;N DE CR&Eacute;DITO PRESUPUESTAL</strong><br><br>
            CARGO: <%=cargo%> 
</th></tr>
<tr>
  <td bgcolor="#FFFFE6" align="center" width="25%"><label for="email">N&deg; DE SOLICITUD</label></td>
  <td bgcolor="#FFFFE6" align="center" width="25%">FECHA DE LA SOLICITUD</td>
  <td bgcolor="#FFFFE6" align="center" width="25%"><label for="name">N&deg; DE OFICIO DEL CCP</label></td>
  <td bgcolor="#FFFFE6" align="center" width="25%">FECHA DEL OFICIO CCP</td>
  <td align="center" bgcolor="#FFFFE6" style="display:none" >PEA POR UBIGEO</td> 
  </tr>
<tr>
  <td align="center" id="td_1" width="15%"><%=docSolicita_CCP%> &nbsp;<img src="images/edita.jpg" width="15" height="15" onclick="editar_ccp('1', <%=pea%>)"><br><br>
  <div id="div_1" style="display:none;background:#FFF9F9">
  <input name="txtdiv_1" type="text" class="" id="txtdiv_1" style="width:250px" value="<%=docSolicita_CCP%>" onKeyPress="return TextUtil.allowChars(this, event)" validchars="ABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ/-0123456789" /><br>Guardar&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="guardar_editar('<%=ID_CCP%>','<%=id_usuario%>','<%=ipVisitante%>','1')" ></div></td>
  
  <td align="center" id="td_2"><%=fecha_docSolicitaCCP%> &nbsp;<img src="images/edita.jpg" width="15" height="15" onclick="editar_ccp('2', <%=pea%>)"><br><br>
  <div id="div_2" style="display:none; background:#FFF9F9"><input type="text" name="txtdiv_2" onKeyUp="this.value=formateafecha(this.value);" id="txtdiv_2" value="<%=fecha_docSolicitaCCP%>" class="" width="50px" /> <br>Guardar&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="guardar_editar('<%=ID_CCP%>','<%=id_usuario%>','<%=ipVisitante%>', '2')" ></div></td>
  
  <td align="center" id="td_3"><%=documento_CCP%> &nbsp;<img src="images/edita.jpg" width="15" height="15" onclick="editar_ccp('3', <%=pea%>)"><br><br>
  <div id="div_3" style="display:none;background:#FFF9F9"><input name="txtdiv_3" type="text" class="" style="width:250px" id="txtdiv_3" value="<%=documento_CCP%>" onKeyPress="return TextUtil.allowChars(this, event)" validchars="ABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ-0123456789" /><br>Guardar&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="guardar_editar('<%=ID_CCP%>','<%=id_usuario%>','<%=ipVisitante%>', '3')" ></div></td>
  
  <td align="center" id="td_4"><%=fecha_DocCCP%> &nbsp;<img src="images/edita.jpg" width="15" height="15" onclick="editar_ccp('4', <%=pea%>)"><br><br>
  <div id="div_4" style="display:none;background:#FFF9F9"><input type="text" name="txtdiv_4" onKeyUp="this.value=formateafecha(this.value);" id="txtdiv_4" value="<%=fecha_DocCCP%>" class="" width="50px" /> <br>Guardar&nbsp;<img src="images/ok.gif" title="Habilitar ubigeo" style="CURSOR:HAND"  onclick="guardar_editar('<%=ID_CCP%>','<%=id_usuario%>','<%=ipVisitante%>', '4')" ></div></td>
  <td align="center" id="td_5" style="display:none" >&nbsp;<img src="images/peru.png" width="15" height="15" onclick="editar_ccp('5', <%=pea%>)"><br><br>
     </td>
  </tr>
</table>
<%end if
if id_rolUsuario=1 or id_rolUsuario=7 or id_rolUsuario=6 then %>
  <table align="center" width="90%" border="1" bordercolor="#DAE8F3" cellpadding="1" cellspacing="1" >
          <tr><th  bgcolor="#DAE8F3"  colspan="11" align="center" class="aplicacion"><strong>Regresar <img src="images/retro.png" alt="Regresar" width="18" height="16" style="CURSOR:HAND" onClick="MostrarCCPresupuestario()" > </strong></th></tr>
          <tr>
            <th bgcolor="#F5FBFE"  colspan="11" align="justify" class="CabeGrilla"><p><strong style="text-align:center">DETALLE DE PEA Y MONTOS DE CERTIFICACI&Oacute;N POR CARGO</strong><br>
              <br>
              <SPAN class="ETIQUETA">CARGO: <%=cargo%> </SPAN><BR><br>
              <SPAN class="ETIQUETA">Oficio Solicitud &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=docSolicita_CCP%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fecha: <%=fecha_docSolicitaCCP%></SPAN><BR>
              <span class="ETIQUETA">Oficio Certificaci&oacute;n : <%=documento_CCP%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fecha: <%=fecha_DocCCP%></span></th></tr>
<tr>
  <td bgcolor="#FFFFE6" align="center" width="10%">PERIODO</td>
  <td bgcolor="#FFFFE6" align="center" width="10%">TOTAL ARMADAS</td>
  <td bgcolor="#FFFFE6" align="center" width="10%">SUELDO</td>
  <td align="center" bgcolor="#FFFFE6" width="10%">MONTO TOTAL</td>
  <td align="center" bgcolor="#FFFFE6" width="10%">MONTO PAGADO</td>
  <td align="center" bgcolor="#FFFFE6" width="5%">MONTO PENDIENTE PAGO</td> 
  <td bgcolor="#FFFFE6" align="center" width="5%">PEA CERTIFICADA</td>
  <td bgcolor="#FFFFE6" align="center" width="5%">PEA CONTRATADA</td>
  <td bgcolor="#FFFFE6" align="center" width="5%">PEA DE BAJA SIN PAGO</td>
  <td bgcolor="#FFFFE6" align="center" width="5%">PEA REBAJADA</td>
  <td bgcolor="#FFFFE6" align="center" width="5%">PEA DE POSIBLE REBAJA</td>

  </tr>
<tr>
  <td align="center" id="td_3"><%=nPeriodo_CCP%>&nbsp;&nbsp;<%=tperiodo%></td>
  <td align="center" id="td_3"><%=totalArmadas%></td>
  <td align="center" id="td_4"><%=FormatNumber(MontoUnitario,2)%></td>
  <td align="center" id="td_5"><%=FormatNumber(total,2)%></td>
  <td align="center" id="td_6"><%=FormatNumber(MontoPagado,2)%></td>
  <td align="center" id="td_6"><% if isnull(MONTO_FALTANTE) OR MONTO_FALTANTE="" THEN 
  RESPONSE.WRITE (MONTO_FALTANTE)
  ELSE
  RESPONSE.WRITE(FormatNumber(MONTO_FALTANTE,2))
  END IF%></td>
  <td align="center" id="td_1"><%=pea%></td>
  <td align="center" id="td_2"><%=pea_cont%></td>
  <td align="center" id="td_3"><%=bajas_eje%></td>
  <td align="center" id="td_3"><%=PEA_REBAJA%></td>
  <td align="center" id="td_3"><%=PEA_PA_REBAJA%></td>
  </tr>
</table><br>

<% IF PEA_PA_REBAJA> 0 THEN %>
  <table align="center" width="70%" border="1" bordercolor="#DAE8F3" cellpadding="1" cellspacing="1">
    <tr>
      <td colspan="4" align="center"  bgcolor="#F5FBFE" class="CabeGrilla"><strong>REGISTRO DE REBAJA DE CERTIFICACI&Oacute;N</strong></td>
    </tr>
    <tr>
      <td  width="15%">Cantidad de PEA:      </td>
      <td  width="35%"><input name="PEA_REBAJA" type="text" class="" id="PEA_REBAJA" style="width:60px" maxlength="5" onKeyPress="return fs_numeros(event)" onblur="verificarPeaReb(this.value, <%=PEA_PA_REBAJA%>, <%=pago%>)" /></td>
      <td  width="15%">Monto:</td>
      <td  width="35%"><STRONG><font id="monto_rebaja"> </font> </STRONG><input type="hidden" name="hmonto_rebaja" id="hmonto_rebaja" /></td>
    </tr>
    <tr>
      <td>Oficio de Solicitud:</td>
      <td><input name="solicitudR" type="text" class="" id="solicitudR" style="width:60px" maxlength="5" onKeyPress="return fs_numeros(event)" /> - <select name="cmbperiodoSR" style="width:60px"  id="cmbperiodoSR"  onChange="validaPeriodo(this.value);"  on >
 	          <option selected value="<%=ANIO_A%>"><%=ANIO_A%></option>
 	          <option value="<%=ANIO_AN%>"><%=ANIO_AN%></option>
 	          </select>
	 - <%generaTipoOfc()%></td>
      <td>Oficio Aprobaci&oacute;n: </td>
      <td><input name="oficioR" type="text" class="" style="width:60px" id="oficioR" value="" 
onKeyPress="return fs_numeros(event)" />
-
  <select name="cmbperiodoR" style="width:60px"  id="cmbperiodoR"  onchange="validaPeriodo(this.value);" >
    <option selected="selected" value="<%=ANIO_A%>"><%=ANIO_A%></option>
    <option value="<%=ANIO_AN%>"><%=ANIO_AN%></option>
  </select>
-
<%generaTipoOfc2()%></td>
    </tr>
    <tr>
      <td>Fecha</td>
      <td><input type="text" name="fsolicitudSR" onkeyup="this.value=formateafecha(this.value);" id="fsolicitudSR" value="" class="" style="width:100px" /></td>
      <td>Fecha</td>
      <td><input type="text" name="fechaRebaja" onkeyup="this.value=formateafecha(this.value);" id="fechaRebaja" value=""class="" style="width:100px" /></td>
    </tr>
    <tr>
      <td colspan="4" align="center"><input name="button" type="button" class="boton" id="button" value="Grabar" onClick="GUARDAR_REBAJA('<%=ID_CCP%>','<%=id_usuario%>','<%=ipVisitante%>','<%=ID_PRESUPUESTO%>')"></td>
    </tr>
  </table>
<%ELSE 
	if PEA_REBAJA="" or isnull(PEA_REBAJA) then 
	
	else
%>
  <table align="center" width="70%" border="1" bordercolor="#DAE8F3" cellpadding="1" cellspacing="1">
    <tr>
      <td colspan="4" align="center"  bgcolor="#F5FBFE" class="CabeGrilla"><strong>DETALLE DE REBAJA DE CERTIFICACI&Oacute;N</strong></td>
    </tr>
    <tr>
      <td  width="15%">Cantidad de PEA:      </td>
      <td  width="35%"><%=PEA_REBAJA%></td>
      <td  width="15%">Monto:</td>
      <td  width="35%"><%=MONTO_REBAJA%></td>
    </tr>
    <tr>
      <td>Oficio de Solicitud:</td>
      <td><%=DOC_SOLICITA_REBAJA%></td>
      <td>Oficio Aprobaci&oacute;n: </td>
      <td><%=DOC_REBAJA%></td>
    </tr>
    <tr>
      <td>Fecha</td>
      <td><%=FECHA_DOC_SOLICITA%></td>
      <td>Fecha</td>
      <td><%=FECHA_REBAJA%></td>
    </tr>

  </table>

<%		END IF
	end if 
end if%>

<% end if %>
        



