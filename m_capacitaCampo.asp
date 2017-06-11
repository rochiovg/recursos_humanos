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

END IF 



If idProyecto <> "" Then

	SQLContCapac = "EXEC dbo.usp_count_SELECCION '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsCargo & "', '" & tipocargo & "', '" & idProyecto & "'" 


	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorsel	=wRsDataCapc(0)
	else
		contadorsel	="0"
	End if
Else
Response.Redirect("default.asp")
End If

	

sql2="EXEC   uspGet_meta_cargo  '" & varccdd & "', '" & varccpp & "', '" & varccdi & "' ,'" & lsCargo & "', '"&lsConvocaroria&"'"
	Set RS3	= Server.CreateObject("ADODB.Recordset") 
	RS3.cursorlocation=3
	RS3.Open sql2, MiCone, 3,3
	If RS3.RecordCount > 0 Then 
		lsmetaR	=RS3(1)
	else
		lsmetaR	="0"
	End if	
	

	
		consulta1 = "EXEC dbo.sp_GetDatosCapacitacion '" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & tipocargo & "', '" & idProyecto & "'" 
		

Err.Clear
On Error Resume Next

			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3


If Err.Number <> 0 Then
  
  Response.Write (Err.Description& "<br><br>")

  Response.End
  
End If
On Error GoTo 0





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
                  <td colspan="20" align="left"><span class="titulo">PERSONAL SELECCIONADO :<%=vartitt%> <span class="e_td_string1">
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
 
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Lectura 1</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Lectura 2</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Lectura 3</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Lectura 4</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Lectura 5</th>
    <th width="2%" bordercolor="#DAE8F3" bgcolor="#DAE8F3" class="dato" style="font-size:10px">Prom. Lectura</th>

    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Prom Particip.</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Pract. Calificada</th>
    <th width="2%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Asist. y Punt.</th>
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

    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="tl1<%=RsP.Fields("id_per")%>">
      <input name="txt11<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt11<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("l1")%>"  onblur="guardarCAPA('l1','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="tl2<%=RsP.Fields("id_per")%>">
      <input name="txt12<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txt12<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("l2")%>"  onblur="guardarCAPA('l2','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="tl3<%=RsP.Fields("id_per")%>">
      <input name="txtl3<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtl3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("l3")%>"  onblur="guardarCAPA('l3','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span></td>
    <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="tl4<%=RsP.Fields("id_per")%>">
      <input name="txtl4<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtl4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("l4")%>"  onblur="guardarCAPA('l4','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span></td>

     <td bordercolor="#DAE8F3" class='e_td_string1'><span class="etiqueta" id="td1<%=RsP.Fields("id_per")%>">
      <input name="txtl5<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtl5<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("l5")%>"  onblur="guardarCAPA('l5','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
    </span></td>

 	<td bordercolor="#DAE8F3" class='e_td_string1'>
 		
			 <div id="txtp1<%=RsP.Fields("id_per")%>"><%=RsP.Fields("p1")%></div>
      
    </td>


   <td bordercolor="#DAE8F3" id="t<%=RsP.Fields("id_per")%>" class='e_td_string1'>
        <span class="etiqueta">
          <input name="txt5<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtp5<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p5")%>"  onblur="guardarCAPA('p5','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
        </span>
    </td>

    <td bordercolor="#DAE8F3" class='e_td_string1'>
    	<span class="etiqueta"><%=RsP.Fields("p2")%></span>
    </td>
    <td bordercolor="#DAE8F3" id="t<%=RsP.Fields("id_per")%>" class='e_td_string1'>
        <span class="etiqueta">
          <input name="txt4<%=RsP.Fields("id_per")%>"validchars="0123456789." onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="txtp4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p4")%>"  onblur="guardarCAPA('p4','<%=RsP.Fields("id_per")%>','<%=RsP.Fields("id_capa")%>',this.value)" size="5" maxlength="5" />
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
          

