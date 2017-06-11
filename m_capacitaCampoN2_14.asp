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



If idProyecto <> "" Then

	
		consulta1 = "EXEC dbo.sp_GetDatosCapacitacion '" & lsCargo & "', '" & varccdd & "', '" & varccppTot & "', '" & varccdiTot & "', '" & tipocargo & "', '" & idProyecto & "'" 
		

	
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3


		
	  If  Not RsP.BOF And Not RsP.EOF Then  
	  
	  
	  %>
      
      

                <table width='98%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
                <tr>
                  <td colspan="20" align="left"><span class="titulo">Capacitaci&oacute;n Nivel 2 :<%=vartitt%> <span class="e_td_string1">
                    <input name="txtUsuario" type="hidden" id="txtUsuario" value="<%=usuario%>" />
                  </span></span></td>
                </tr>
                <tr>
                
                <td colspan="20" align="left"><p>
                  <input 
                        name='button1'  type='button' class="boton" 				
                        id='button1' 
                        onclick="javascript:exportarExcelCapa()" 
                        value='Exp. Excel' />
                </p></td>
              </tr>
    <tr style="font-size:9px">
      <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>
      <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
     <th width="17%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">NOMBRE</th>
 <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Asist. y Punt.</th>

    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Lectura 1</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Lectura 2</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Lectura 3</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Lectura 4</th>
     <th width="2%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato" style="font-size:10px">Prom. Lectura</th>
     <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Ex&aacute;men Final</th>
     <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Pract. Calificada</th>
     
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
          <input name="txt4<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtp4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p4")%>"  onblur="guardarCAPA('p4','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
        </span>
    </td> 

    <td bordercolor="#DAE8F3" class='e_td_string1'>
      <span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
        <input name="txt11<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt11<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("l1")%>"  onblur="guardarCAPA('l1','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
      </span>
    </td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
      <input name="txt12<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt12<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("l2")%>"  onblur="guardarCAPA('l2','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
      <input name="txtl3<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtl3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("l3")%>"  onblur="guardarCAPA('l3','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
      <input name="txtl4<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtl4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("l4")%>"  onblur="guardarCAPA('l4','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span></td>
   
 	  <td bordercolor="#DAE8F3" class='e_td_string1'>
 			 <div id="txtp1<%=RsP.Fields("id_per")%>"><%=RsP.Fields("p1")%></div> 
    </td>
    <td bordercolor="#DAE8F3" class='e_td_string1'>
    <span class="etiqueta" id="txtl6<%=RsP.Fields("id_per")%>">
      <input name="txtp6<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtp6<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p6")%>"  onblur="guardarCAPA('p6','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span>
    </td>
    <td bordercolor="#DAE8F3" class='e_td_string1'>
    <span class="etiqueta" id="txtp2<%=RsP.Fields("id_per")%>">
      <input name="txtp2<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtp2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p2")%>"  onblur="guardarCAPA('p2','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span>
    </td>


    <td bordercolor="#DAE8F3" class='e_td_string1'><div id="tr<%=RsP.Fields("id_per")%>"><%=RsP.Fields("notacap")%></div></td>
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
		<% end If




		 %>
       <%Else
Response.Redirect("default.asp")
End If%>
   

