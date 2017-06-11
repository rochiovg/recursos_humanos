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
capacitacion=Request.Form("capacitacion")

idProyecto=Session("id_proyecto")
id_usuario=  Session("id_usuario")


  habilitado=""

if (nivelrrhh = 8 ) then

	nomccdd = ""
	varccdd = "99"
	nomccpp = ""
	varccpp = "99"
	nomccdi = ""
	varccdi = "99"
lsCargo = 00
tipocargo = 8
else

	varccdd=len(varccddTot)
  varccdd = Mid(varccddTot,1,2)

	
	
	lsCargo = "00"
tipocargo = nivelrrhh

END IF 





	
		consulta1 = "EXEC dbo.pa_ficha_capacitacion_listar_pea '" & lsCargo & "', '" & varccdd & "', '" & varccppTot & "', '" & varccdiTot & "', '" & tipocargo & "', '" & idProyecto & "' , '" & capacitacion & "' " 
		
		
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3


		
	  If  Not RsP.BOF And Not RsP.EOF Then  
	  
	  
	  %>
     
  
      

                <table width='98%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
                <tr>
                  <td colspan="14" align="left"><span class="titulo">Capacitaci&oacute;n Nivel 2 :<%=vartitt%> <span class="e_td_string1">
                    <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=usuario%>" />
                  <input type="hidden" name="divProm" id="divProm"  value=""/>
                  </span></span></td>
                </tr>
                <tr>
                
                <td colspan="10" align="left"><p>
                  <input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onclick="javascript:exportarExcelCapa()" 
                        value='Exp. Excel' />&nbsp;&nbsp;&nbsp;&nbsp;<input 
                        name='button2'  type='button' class="boton" 				
                        id='button2' 
                        onclick="javascript:exportarExcelCapa_total()" 
                        value='Exp. Total' />
                </p></td>
                <td colspan="4" align="left"><p><img src="images/retro.png" width="8" height="13" onclick="capacitacionCampo(<%=idproyecto%>)" /> Atr&aacute;s</p></td>
                </tr>
    <tr style="font-size:9px">
      <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>
      <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
     <th width="17%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">NOMBRE<span class="titulo"><span class="e_td_string1">
       <input type="hidden"   name="hiddenField" id="txtp1<%=RsP.Fields("id_per")%>" />
     </span></span></th>
  <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Eval. 1.</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px">Eval. 2.</span></th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px">Eval. 3.</span></th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px">Eval. 4.</span></th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px">Eval. 5.</span></th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><span class="dato" style="font-size:10px">Eval. 6.</span></th>
     <th width="2%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato" style="font-size:10px">Prom. Eval.</th>
     <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Ex&aacute;men Final</th>
     <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Pract. Calificada</th>
     <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Pract Campo</th>
     <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Exposici&oacute;n</th> 
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Prome. Final</th>
    
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
    <td class='e_td_string1'><%=RsP.Fields("nombre")%></td> 
     <td bordercolor="#DAE8F3" id="t<%=RsP.Fields("id_per")%>" class='e_td_string1'>
        <span class="etiqueta">
          <input name="txteva1<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txteva1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("eva1")%>"  onblur="guardarCAPAED('eva1','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
        </span>
    </td>
    <td bordercolor="#DAE8F3" class='e_td_string1'>
      <span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
        <input <%=habilitado%>  name="txteva2<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txteva2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("eva2")%>"  onblur="guardarCAPAED('eva2','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
      </span>
    </td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
      <input <%=habilitado%>  name="txteva3<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txteva3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("eva3")%>"  onblur="guardarCAPAED('eva3','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
    </span></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
      <input <%=habilitado%>  name="txteva4<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txteva4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("eva4")%>"  onblur="guardarCAPAED('eva4','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
    </span></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
      <input <%=habilitado%>  name="txteva5<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txteva5<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("eva5")%>"  onblur="guardarCAPAED('eva5','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
    </span></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
      <input <%=habilitado%>  name="txteva5<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txteva6<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("eva6")%>"  onblur="guardarCAPAED('eva6','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
    </span></td>
 	  <td bordercolor="#DAE8F3" class='e_td_string1'>
 			 <div id="txtprom<%=RsP.Fields("id_per")%>"><%=RsP.Fields("p8")%></div> 
    </td>
    <td bordercolor="#DAE8F3" class='e_td_string1'>
    <span class="etiqueta" id="txtl6<%=RsP.Fields("id_per")%>">
      <input name="txtp6<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtp6<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p6")%>"  onblur="guardarCAPAED('p6','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
    </span>
    </td>
    <td bordercolor="#DAE8F3" class='e_td_string1'>
    <span class="etiqueta" id="txtp2<%=RsP.Fields("id_per")%>">
      <input <%=habilitado%>  name="txtp2<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtp2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p2")%>"  onblur="guardarCAPAED('p2','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
    </span>
    </td>


     <td bordercolor="#DAE8F3" class='e_td_string1'>
    <span class="etiqueta" id="txtp3<%=RsP.Fields("id_per")%>">
      <input <%=habilitado%>  name="txtp3<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtp3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p3")%>"  onblur="guardarCAPAED('p3','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
    </span>
    </td>

    <td bordercolor="#DAE8F3" class='e_td_string1'>
    <span class="etiqueta" id="txtp7<%=RsP.Fields("id_per")%>">
      <input name="txtp7<%=RsP.Fields("id_per")%>"validchars="0123456789." onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtp7<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p7")%>"  onblur="guardarCAPAED('p7','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value,'0')" size="5" maxlength="5" />
    </span>
    </td>


    <td bordercolor="#DAE8F3" class='e_td_string1'><div id="txtaprob<%=RsP.Fields("id_per")%>"><%=RsP.Fields("notacap")%></div></td>
	<% 
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
		<% end If




		 %>
          

