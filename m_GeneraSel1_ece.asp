<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"

 usuario=Session("id_usuario")
 
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
'lsUsuario=Request.Form("lsUsuario")
lsConvocaroria=Request.Form("lsConvCar")

idProyecto=Session("id_proyecto")
id_rol=Session("txtTipoUsuarioValido")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,3)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,4,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,6,2)


'palscargo=len(plscargo)
'nomlscargo= Mid(plscargo,3,palscargo-2)
lsCargo = Mid(plscargo,2)
tipocargo = Mid(plscargo,1,1)



	SQLContCapac = "EXEC dbo.usp_count_SELECCION_ece '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsCargo & "', '" & tipocargo & "', '" & idProyecto & "'" 

	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorsel	=wRsDataCapc(0)
	else
		contadorsel	="0"
	End if


	

sql2="EXEC   uspGet_meta_cargo_ece  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "' ,'" & lsCargo & "', '"&lsConvocaroria&"'"


	Set RS3	= Server.CreateObject("ADODB.Recordset") 
	RS3.cursorlocation=3
	RS3.Open sql2, MiCone, 3,3
	If RS3.RecordCount > 0 Then 
		lsmetaR	=RS3(1)
	else
		lsmetaR	="0"
	End if	
	
	
	
		consulta1 = "EXEC dbo.uspGet_DatosSeleccionado_ece'" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & tipocargo & "', '" & idProyecto & "','"&lsConvocaroria&"'" 




			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3


				if varccdd="99" and varccpp="99" and varccdi="99" then
				   vartittn=" A Nivel Nacional"
				end if
				if varccdd<>"99" then
				   vartit1= "Departamento : " & nomccdd
				end if
				if varccpp<>"99" then
				   vartit2= " / Provincia : "& nomccpp
				end if
				if varccdi<>"99" then
				
				   vartit3= " / Distrito : "&nomccdi
				end if
				strubig=strubig1 & strubig2 & strubig3
				strubigT=strubig1T & strubig2T & strubig3T
				vartitt=vartit1 & vartit2 & vartit3

	

		
	  If  Not RsP.BOF And Not RsP.EOF Then  
	  
	  
	  %>
      
      

                <table width='98%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
                <tr>
                  <td colspan="18" align="left"><span class="titulo">PERSONAL SELECCIONADO  <span class="e_td_string1">
                    <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=usuario%>" />
                  </span></span></td>
                </tr>
                <tr>
                
                <td colspan="18" align="right"><p><span style="color: #0067CE; font-size:11px; border-bottom:1px solid;"><strong>Meta: <%=lsmetaR%></strong></span> <span style="color: #0067CE; font-size:11px; border-bottom:1px solid;">
                  <input type="hidden" id="MetaSeleccion" value="<%=lsmetaR%>" />
                </span><span class="etiqueta">Seleccionados</span>
                    <input type="text" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=cInt(contadorsel)%>" style="width:50" disabled="true">
                  </p></td>
              </tr>
                <tr>
                
<td colspan="18" align="right" >
  
		</td>
              </tr>
    <tr style="font-size:9px">
      <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>
      <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
      <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NRO. DE CONVOCATORIA</th>
        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">TIENPO DE CONTRATACI&Oacute;N</th>
    <th width="17%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">NOMBRE</th>
    <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >RUC</th>
    <th width="9%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">NIVEL EDUCATIVO</th>
    <th width="9%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato" style="font-size:10px">TRABAJO EN GENERAL</th>
    <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">TRABAJO DE CAMPO</th>
    <th width="8%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato" style="font-size:10px">MANEJO DE GRUPOS</th>
    <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">TRABAJO<br />
      INEI</th>
    <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">PROYECTO</th>
    
 <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" >NOTA CONOCIMIENTOS.</th>
      <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" >NOTA ENTREVISTA.</th>
      <th width="9%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">NOTA CAPACITACI&Oacute;N</th>
         <th width="9%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ESTADO POSTULANTE</th>
         
    
    </tr>
  <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 	%>
  <tr class='<%=clase%>'>
  
  <%  varvisualiza=""
		
        if RsP.Fields("Activo")="1" then
	   varvisualiza="disabled=""disabled"""
	   else
	    if id_rol="11"  or id_rol="34" then
			if  RsP.Fields("cenviocontra")="4" Then
	     		varvisualiza="disabled=""disabled"""
			end if
        end if

	   end if %>
  
    <td height="34" class='e_td_string1'><%response.Write(cont)%>    &nbsp;</td>
    <td class='e_td_string1'>&nbsp;<%=RsP.Fields("dni")%></td>	
      <td class='e_td_string1'><%=RsP.Fields("num_convocatoria")%></td>
    <td class='e_td_string1'><%=RsP.Fields("nPeriodo_CCP")%><%=RsP.Fields("TipoP")%></td>
    <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>  
    <td bordercolor="#DAE8F3" class='e_td_string1'>&nbsp;<%=RsP.Fields("ruc")%></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><%=RsP.Fields("nivel")%></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><%="A&ntilde;o:"&RsP.Fields("expgen_anio")&" Meses:"&RsP.Fields("expgen_meses")%></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><%="A&ntilde;o:"&RsP.Fields("expCampo_anio")&" Meses:"&RsP.Fields("expCampo_meses")%></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><%="A&ntilde;o:"&RsP.Fields("expGrupo_anio")&" Meses:"&RsP.Fields("expGrupo_meses")%></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'>&nbsp;<%=RsP.Fields("inei")%></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'>&nbsp;<%=RsP.Fields("proyecto")%></td>
        <td   bordercolor="#DAE8F3" id="t<%=RsP.Fields("id_per")%>" class='e_td_string1'><%=RsP.Fields("nota_testinfo")%>&nbsp;</td>
        <td   bordercolor="#DAE8F3" id="t<%=RsP.Fields("id_per")%>" class='e_td_string1'><%=RsP.Fields("totalEntrevista")%>&nbsp;</td>
        <td   bordercolor="#DAE8F3" id="t<%=RsP.Fields("id_per")%>" class='e_td_string1'><%=RsP.Fields("notacap")%>&nbsp;</td>
 
  
		<td  align="center" class='e_td_string1'>
 
	  <% dato = dato+1 %>
      <select name="est<%=RsP.Fields("id_per")%>" <%=varvisualiza %> id="est<%=RsP.Fields("id_per")%>" style="font-size:10px; width:100px" class='e_combo2' onfocus="valorinicial(this.value,this.id)" 
        onchange="Seleccionar('<%=RsP.Fields("id_per")%>',this.value)" >
        <option value="9" selected="selected">Cambiar...</option>
        <option value="2" <% if RsP.Fields("sw_titu")="2" then response.Write("selected")%> >NO SELECCIONADO</option>
        <option value="1" <% if RsP.Fields("sw_titu")="1" then response.Write("selected")%>>TITULAR</option>
        <option value="0" <% if RsP.Fields("sw_titu")="0" then response.Write("selected")%>>RESERVA</option>
        <option value="3" <% if RsP.Fields("sw_titu")="3" then response.Write("selected")%>>DE BAJA</option>
        <option value="4" <% if RsP.Fields("sw_titu")="4" then response.Write("selected")%>>NO FIRMO CONTRATO</option>
        <option value="5" <% if RsP.Fields("sw_titu")="4" then response.Write("selected")%>>OBSERVADO POR MINEDU</option>
      </select>
    </td>
	<% 
	lsNivel= RsP.Fields("nivel")
		registro = registro + 1
		dato2 = dato2+1 %>
    <%		RsP.MoveNext
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
          

