<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
<%


Server.ScriptTimeout = 230400  
Response.Expires = 0
Response.Buffer = True 
Response.ContentType="text/html; charset=iso-8859-1"

lsDNI=request.Form("lsDNI")
lsFecNac=request.Form("lsFecNac")
lsFec = Request.Form("lsFec")

id_usuario=  Session("id_usuario")
id_Proyecto=Session("id_proyecto")

sub generaTipoPension()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_pension_listar ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtTipoPension""  name=""txtTipoPension"" onchange=""validarPension(this.value)"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if RSCuad.Fields("id_tipoPension")=wRsDptoapli(0) then 
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ selected>"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaTipoPension1()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_pension_listar ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtTipoPension_nu""  name=""txtTipoPension_nu"" onchange=""validarPension(this.value)"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"

	wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaAFP()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_AFP_listar ")

    if 	RSCuad.Fields("id_tipoPension")= "19990" then
	Response.Write "<select disabled class=""e_combo"" style=""width:200px"" id=""txtAFP""  name=""txtAFP"" >"
	else 
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtAFP""  name=""txtAFP"" >"
	end if
	
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if RSCuad.Fields("id_afp")=wRsDptoapli(0) then 
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ selected>"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaComision()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_comision_AFP_listar ")
	
	if 	RSCuad.Fields("id_tipoPension")= "19990" then
	Response.Write "<select disabled class=""e_combo"" style=""width:200px"" id=""txtComision""  name=""txtComision"" >"
	else 
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtComision""  name=""txtComision"" >"
	end if
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if RSCuad.Fields("id_comision")=wRsDptoapli(0) then 
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ selected>"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaTipoCuenta()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_TIPO_CUENTA_listar ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtTipoCuenta""  name=""txtTipoCuenta"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if RSCuad.Fields("id_tipocuenta")=wRsDptoapli(0) then 
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ selected>"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaBanco()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_BANCO_listar ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtBanco""  name=""txtBanco"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if RSCuad.Fields("id_banco")=wRsDptoapli(0) then 
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ selected>"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


SQL1 = "exec dbo.pa_ficha_buscarActualizar '"& lsDNI &"', '"& lsFecNac &"', '"& lsFec &"' , '"& id_Proyecto &"' "	

Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
%> 
	
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then
	
	if RSCuad.Fields("flag")=1 then %>
    <table width='95%' align='center'>
     <tr>
       <td class='subtitulo' colspan='4'>La fecha de Nacimiento no corresponde al DNI ingresado </td>
     </tr>
    </table>
	<% response.End()
	elseif RSCuad.Fields("flag")=2 then %>
    <table width='95%' align='center'>
     <tr>
       <td class='subtitulo' colspan='4'>La fecha de nacimiento del padre o madre no coincide con lo registrado en su inscripci&oacute;n</td>
     </tr>
    </table>
    <%response.End()
	else	
	if 	RSCuad.Fields("id_tipoPension")= "19990" then
	tx="disabled"
	else tx=""
	end if %>
    
        <%
	if RSCuad.Fields("flag")=3 then

	 %>
    <table width='95%' align='center'>
     <tr>
       <td class='subtitulo' colspan='4'>Usted no est&aacute; afecto al descuento de AFP, pero puede actualizar esta informaci&oacute;n</td>
     </tr>
    </table>
    <%end if%>

	<table width='72%' border="1" align='center' cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
        <tr  bordercolor="#DAE8F3">
          <th width="18%" bgcolor="#DAE8F3" class="dato" ><input type="hidden" name="txtIDPER" id="txtIDPER" value="<%=RSCuad.Fields("id_per")%>" />
          DNI</th>
          <th width="18%" bgcolor="#DAE8F3" class="dato" >Apellido Paterno</th>
          <th width="27%" bgcolor="#DAE8F3" class="dato" >Apellido Materno</th>
          <th width="24%" bgcolor="#DAE8F3" class="dato" >Nombre</th>
          <th width="21%" bgcolor="#DAE8F3" class="dato">Cargo</th>
        </tr>

        <tr height="10"  >
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("dni")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("ape_paterno")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("ape_materno")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="left" ><%=RSCuad.Fields("nombre")%></td>
          <td bgcolor="<%=color%>" class='etiqueta' align="center"><%=RSCuad.Fields("cargo")%></td>
        </tr>        
    </table>
      <br>

    <table  id="t_Afiliado" border="1" align="center" cellpadding="2" cellspacing="2"  bordercolor="#DAE8F3">
        <tr  class='etiqueta' >
          <td colspan="4" align="center" bgcolor="#DAE8F3" ><strong>
<input type="hidden" name="txtTipoPension_nu" id="txtTipoPension_nu"  value=""/>
AFILIACI&Oacute;N</strong></td>
          </tr>
          
          <tr  class='etiqueta' >
          <td colspan="4" align="center"  >Si Usted est&aacute; afiliado a una AFP, puede consultar la fecha de afiliaci&oacute;n y el n&uacute;mero de CUSSP en el sigueinte enlace:<br> <a href="http://www.sbs.gob.pe/app/spp/Afiliados/afil_existe.asp" title="SBS" target="_blank">http://www.sbs.gob.pe/app/spp/Afiliados/afil_existe.asp</a></td>
          </tr>
            <tr  class='etiqueta' >
           	  <td>Tipo de Pensi&oacute;n
              </td>
              <td colspan="3"><%generaTipoPension()%> (*)</td>
            </tr>

            <tr  class='etiqueta' >
           	  <td>Nombre de la AFP :
              </td>
              <td><%generaAFP()%></td>
              <td>C&oacute;digo de Afiliado (N&uacute;mero de CUSSP)</td>
              <td><input <%=tx%> class='e_texto' name="txtFCUSSP" id="txtFCUSSP" type="text" value="<%=RSCuad.Fields("num_CUSSP")%>" validchars="0123456789/-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" onkeypress="return TextUtil.allowChars(this, event)" /></td>
            </tr>
              
            <tr  class='etiqueta' >
           	  <td>Fecha de Afiliaci&oacute;n : </td>
              <%if RSCuad.Fields("fec_AfiliaAFP")="01/01/1900" then 
					fec=""
			  	else
					fec=RSCuad.Fields("fec_AfiliaAFP")
				end if
			  %>
              <td><input type="text" <%=tx%> class='e_texto' id="txtFecAfiliacion" name="txtFecAfiliacion" value="<%=fec%>" maxlength="10" validchars="0123456789/" onkeypress="return TextUtil.allowChars(this, event)" onkeyup="this.value=formateafecha(this.value);" /></td>
              <td>Tipo de Comisi&oacute;n :
              </td>
              <td><%generaComision()%></td>
            </tr>
        </table>
      
       
    <input name=button2 type="button" align="center" class="boton" onClick="javascript:Actualizar()"   value="Actualizar"><br><br>
    <table width="70%" align="center">
    <tr>
      <td class='etiqueta' > Si no esta afiliado a ning&uacute;n sistema de pensiones lo puede hacer acercandose a las oficinas de la ONP o AFP HABITAT<br>Le recomendamos visitar las siguientes p&aacute;ginas web donde puede realizar su inscripci&oacute;n de forma virtual:
    <br>
          ONP:<a href="http://www.onp.gob.pe/inicio.do" title="Comisiones" target="_blank"> http://www.onp.gob.pe/inicio.do</a><br>
          AFP Habitat: <a href=" https://www.afphabitat.com.pe/afiliacion-independiente" title="Comisiones" target="_blank">https://www.afphabitat.com.pe/afiliacion-independiente</a><br><br>
          Para Verificar Comisiones: <a href=" http://www.sbs.gob.pe/0/modulos/JER/JER_Interna.aspx?PFL=1&JER=277" title="Comisiones" target="_blank"> http://www.sbs.gob.pe/0/modulos/JER/JER_Interna.aspx?PFL=1&JER=277 </a><br>
         Manual de Afiliaci&oacute;n a la ONP: <a href=" pdf/manualONP.pdf" title="manual de Afiliaci&oacute;n ONP" target="_blank">Manual de Afiliaci&oacute;n </a>
          <br><br><div align="justify">
          <font class="mensaje1" style="text-align:justify">Recuerde que la fecha l&iacute;mite de registro de esta informaci&oacute;n es el d&iacute;a lunes 18/08/2014.Cabe precisar que los datos consignados en esta actualizaci&oacute;n deben ser ver&iacute;dicos de lo contrario estar&aacute;n sujetos a observaci&oacute;n por parte del INEI.<br><br>
De igual forma si no se encuentra afiliado a un sistema de pensiones ONP o AFP, no se efectuara el pago de su remuneraci&oacute;n correspondiente.
</font></div>
    	</td>
    </tr>
    </table>
<% end if
else%>
    <table width='95%' align='center'>
     <tr>
       <td class='subtitulo' colspan='4'>La persona no tiene contrato activo o el DNI no est&aacute; registrado en este Proyecto </td>
     </tr>
    </table>
      <%end if%>

	