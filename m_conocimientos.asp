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
nivelrrhh=Request.Form("nivelrrhh")

lsConvocaroria=Request.Form("lsConvocaroria")

idProyecto=Session("id_proyecto")
id_usuario=  Session("id_usuario")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

lsCargo = Mid(plscargo,2)
tipocargo = Mid(plscargo,1,1)
		
		consulta1 = "EXEC dbo.uspGet_DatosConocimientos'" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & tipocargo & "', '" & idProyecto & "','"&lsConvocaroria&"'" 

			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3


		
	  If  Not RsP.BOF And Not RsP.EOF Then  
	  
	  
	  %>
     
  
      

                <table width='100%' border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
                <tr>
                  <td colspan="20" align="center"><span class="titulo"><span class="e_td_string1">Registro de Nota de la Eval. de Conocimientos
                        <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=usuario%>" />
                  </span></span></td>
                </tr>
    <tr style="font-size:9px">
      <th width="4%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>
      <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
     <th width="15%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato3">NRO. DE CONVOCATORIA</span></th>
 <th width="13%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato3">TIENPO DE CONTRATACI&Oacute;N</span></th>
  <th width="23%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px">NOMBRE</span></th>
    <th width="6%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">RUC</th>
    
     <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Nota Evaluaci&oacute;n</th> 
     <th width="8%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">No asisti&oacute;</th> 
    <th width="10%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Prome. 
      
      Final</th>
    
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
    <td height="34" class='e_td_string1'><%response.Write(cont)%>    &nbsp;</td>
    <td class='e_td_string1'>&nbsp;<%=RsP.Fields("dni")%></td>	
    <td class='e_td_string1'>&nbsp;<%=RsP.Fields("num_convocatoria")%></td> 

    <td class='e_td_string1'><%=RsP.Fields("nPeriodo_CCP")%><%=RsP.Fields("TipoP")%></td> 
     <td bordercolor="#DAE8F3" id="t<%=RsP.Fields("id_per")%>" class='e_td_string1'><%=RsP.Fields("nombre")%></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'>&nbsp;<%=RsP.Fields("ruc")%></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'>
      <div align="center"><span class="etiqueta" id="txtp7<%=RsP.Fields("id_per")%>">
        <input name="txtp7<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtp<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("nota_testInfo")%>"  onblur="guardarNota('<%=RsP.Fields("id_per")%>',this.value, '1')" size="5" maxlength="5" />
          </span>
      </div></td>
<td bordercolor="#DAE8F3" class='e_td_string1'><div id="chek" style="display:none"></div><input  type="checkbox" value="1" class="cab" <% if RsP.Fields("aprobo_test")="3" then response.Write("checked=""checked""")  end if %> name="Al<%=RsP.Fields("id_per")%>"  onclick="alerta_NoAsistio('<%=RsP.Fields("id_per")%>',this,'<%=RsP.Fields("AproboTest")%>' )" id="Al<%=RsP.Fields("id_per")%>" />  &nbsp;</td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><div id="tr<%=RsP.Fields("id_per")%>">
      <div align="center"><%=RsP.Fields("AproboTest")%></div>
    </div></td>
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
		<% end If	 %>