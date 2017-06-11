<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
Response.ContentType="text/html; charset=iso-8859-1"	

Function CalcularEdad(fechaN)
If IsNull(fechaN) then wEdad = 0: Exit Function
wEdad = DateDiff("yyyy", fechaN, Now)
If Date <> DateSerial(Year(Now), Month(fechaN), Day(fechaN)) Then
wEdad = wEdad - 1
End If
wEdad = CInt(wEdad)
Response.Write(wEdad)
End Function
	 	 
id_proyecto=session("id_proyecto") 
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsConvCar=Request.Form("lsConvCar")
VALOR=Request.Form("VALOR")

id_rol=Session("txtTipoUsuarioValido")



cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

cargo = Mid(plsCargo,2)

	SQLContCapac = "EXEC dbo.usp_count_EVALCV '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"'" 
	

	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorPre	=wRsDataCapc(0)
	else
		contadorPre	="0"
	End if



		consulta1 = "EXEC dbo.uspGet_DatosCalificacionCV '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"' " 
		
		response.write(consulta1)
		
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
	     
	If  Not RsP.BOF And Not RsP.EOF Then  %>
                <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
                
               <tr>
                  <td colspan="16" align="left" ><span class="titulo">NOTA DE EX&Aacute;MEN : <%=vartitt%></span></td>
                  
                  
                   
                   
                   
                 
                  
                  
                </tr>
                <tr>
                
<td colspan="15" ><div align="right" ><span><span class="titulo"><a href="http://economicas.inei.gob.pe/imagenes/CCRRHH/pdf_general/leyendaevcvece16.jpg" target="popup" onClick="window.open(this.href, this.target, 'width=1000,height=300'); return false;">Descripci&oacute;n de Columnas</a><img src="images/excell1.gif" onclick="enviar_consultaCV()"  width="32" height="29" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Aprobados</span>
<input type="text" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true"></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                      
				<% if cargo= 3392 then %> 
                <th colspan="7" bgcolor="#DAE8F3" class="dato3" >&nbsp;</th><!---MODIFICAR AQUI PARA EL CARGO--->
                <th width="8%" colspan="9"  bgcolor="#DAE8F3" class="dato3" >COPIA DE DOCUMENTACI&Oacute;N DEL CV</th><!---MODIFICAR AQUI PARA EL CARGO--->                
                
				
                <th width="8%" colspan="6" bgcolor="#DAE8F3" class="dato3" >FORMACION ACADEMICA</th><!---MODIFICAR AQUI PARA EL CARGO--->                
		        
                 <% else %>

				<th colspan="4" bgcolor="#DAE8F3" class="dato3" >&nbsp;</th><!---MODIFICAR AQUI PARA EL CARGO--->
                <th width="8%" colspan="7"  bgcolor="#DAE8F3" class="dato3" >COPIA DE DOCUMENTACI&Oacute;N DEL CV</th><!---MODIFICAR AQUI PARA EL CARGO--->

                
                <th width="8%" colspan="4" bgcolor="#DAE8F3" class="dato3" >FORMACION ACADEMICA</th><!---MODIFICAR AQUI PARA EL CARGO--->
                                
		        
                
                 
                 <%end if%>
                
                <% if cargo<> 3392 then %> 
                                
		        <th width="8%" colspan="3" bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA LABORAL</th>
		        <th width="7%" colspan="3"  bgcolor="#DAE8F3" class="dato3" >SOLO ASISTENTE SUP NIVEL 3</th>
				 <th width="7%" bgcolor="#DAE8F3" class="dato3" >CUMPLE CON EL PERFIL</th>
                 <%END IF%>
                 
				<th width="13%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >OBSERVACION</th>
                
                <% if cargo<> 3392 then %> 
		        <th width="7%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >TOTAL</th>
                <%END IF%>
                <th width="13%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
          

		        </tr>
		      <tr style="font-size:9px" >
				 <th width="11%"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">SEDE REGIONAL</th>
		        <th width="6%" bgcolor="#DAE8F3" class="dato3" >SEDE PROVINCIAL O DISTRITAL</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >FECHA/HORA REG. CV</th>

		        <th width="11%"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
		        <th width="6%" bgcolor="#DAE8F3" class="dato3" >APELLIDOS Y NOMBRES</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >N REGISTRO POSTULANTE</th>
		        <th width="8%"  bgcolor="#DAE8F3" class="dato3" >NRO FOLIOS</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >C1</th>
		        <th bgcolor="#DAE8F3" class="dato3" >C2</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >C3</th>
		        <th bgcolor="#DAE8F3" class="dato3" >C4</th>
                  <th bgcolor="#DAE8F3" class="dato3" >C5</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >C6</th>
		        <th bgcolor="#DAE8F3" class="dato3" >C7</th>
                <% if cargo= 3392 then %> 
				<th  bgcolor="#DAE8F3" class="dato3" >C8</th>
		        <th bgcolor="#DAE8F3" class="dato3" >C9</th>
                

                <%end if%>
                                
                
                <th width="4%"  bgcolor="#DAE8F3" class="dato3" >F1</th>
		        <th bgcolor="#DAE8F3" class="dato3" >F2</th>
		        <th bgcolor="#DAE8F3" class="dato3" >F3</th>
		        <th bgcolor="#DAE8F3" class="dato3" >F4</th>
                
				<% if cargo= 3392 then %> 
		        <th bgcolor="#DAE8F3" class="dato3" >F5</th>
                <th bgcolor="#DAE8F3" class="dato3" >F6</th>
				<%end if%>
                                                
				
                <% if cargo<> 3392 then %> 
                <th width="4%"  bgcolor="#DAE8F3" class="dato3" >E1</th>
		        <th bgcolor="#DAE8F3" class="dato3" >E2</th>
		        <th bgcolor="#DAE8F3" class="dato3" >E3</th>
                <th colspan="1" width="4%"  bgcolor="#DAE8F3" class="dato3" >D1</th>
		        <th colspan="2" bgcolor="#DAE8F3" class="dato3" >D2</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >D3</th>
                <%END IF%>
                
		        </tr>
		      <% 	registro = 0					
		Do While Not RsP.EOF
		response.Flush()
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 %>
            
            <%  varvisualiza="enabled"
		
       if RsP.Fields("Activo")="1" or RsP.Fields("Activo")="2" or RsP.Fields("cenviocontra")="1"  or RsP.Fields("cenviocontra")="2" TheN
	     		varvisualiza="disabled"
       end if%>
                
                <%if id_rol=31  then
				varvisualiza="enabled"
				else 
				varvisualiza="disabled"
				 end if %>
                 
                 
                 
		      <tr  class='<%=clase%>' style="font-size:9px;">
		        <td height="34" class='e_td_string1'><%response.Write(cont)%>
		          </td> 
                
                
                <% if cargo= 3392 then %> 
		 <td class='e_td_string1'><%=RsP.Fields("sede_region")%></td>
         <td class='e_td_string1'><%=RsP.Fields("sede_provincia")%>/<%=RsP.Fields("sededistrital2")%></td>
         <td class='e_td_string1'> <%=RsP.Fields("fec_recep")%></td>
         <%end if%>
         
                <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>		        <td class='e_td_string1'><%=RsP.Fields("nro_reg_recep")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("folio_recep")%></td>
		        <td class='e_td_string1'><input <%=varvisualiza%> name="C1<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="C1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("C1")%>"  onblur="guardarCV('C1','<%=RsP.Fields("id_per")%>',this.value,'<%=RsP.Fields("id_convocatoriacargo")%>')" size="5" maxlength="1" /></td>
                  
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="C2<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="C2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("C2")%>"  onblur="guardarCV('C2','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="C3<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="C3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("C3")%>"  onblur="guardarCV('C3','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="C4<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="C4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("C4")%>"  onblur="guardarCV('C4','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
                
                
                <td class='e_td_string1'><input <%=varvisualiza%>  name="C5<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="C5<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("C5")%>"  onblur="guardarCV('C5','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="C6<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="C6<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("C6")%>"  onblur="guardarCV('C6','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="C7<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="C7<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("C7")%>"  onblur="guardarCV('C7','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
                
                <% if cargo= 3392 then %> 
                              <td class='e_td_string1'><input <%=varvisualiza%>  name="C8<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="C8<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("C8")%>"  onblur="guardarCV('C8','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                              
                	        <td class='e_td_string1'><input <%=varvisualiza%>  name="C9<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="C9<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("C9")%>"  onblur="guardarCV('C9','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="9" /></td>
                            
                              
                            
                
                 
                
             
                    <%end if%>
                 
                 
                 <td class='e_td_string1'><input <%=varvisualiza%>  name="F1<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="F1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("F1")%>"  onblur="guardarCV('F1','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" /></td>
                  
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="F2<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="F2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("F2")%>"  onblur="guardarCV('F2','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="70" /></td>
                     
                
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="F3<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="F3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("F3")%>"  onblur="guardarCV('F3','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
                  <td class='e_td_string1'><input <%=varvisualiza%>  name="F4<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="F4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("F4")%>"  onblur="guardarCV('F4','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
                 <% if cargo= 3392 then %> 
                                
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="F5<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="F5<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("F5")%>"  onblur="guardarCV('F5','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
                  <td class='e_td_string1'><input <%=varvisualiza%>  name="F6<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="F6<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("F6")%>"  onblur="guardarCV('F6','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                  
                  <%end if%>
                  
                
                <% if cargo<> 3392 then %> 
                <td class='e_td_string1'><input <%=varvisualiza%>  name="E1<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="E1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("E1")%>"  onblur="guardarCV('E1','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                  
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="E2<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="E2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("E2")%>"  onblur="guardarCV('E2','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="E3<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="E3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("E3")%>"  onblur="guardarCV('E3','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
<%if RsP.Fields("cargo") <> "ASISTENTE DE SUPERVISOR(4 EIB L1 Y L2" then %>   
                <td colspan="1" class='e_td_string1'><input <%=varvisualiza%>  name="D1<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="D1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("D1")%>"  onblur="guardarCV('D1','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" disabled="true" /></td>
		        <td colspan="1" class='e_td_string1'><input <%=varvisualiza%>  name="D2<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="D2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("D2")%>"  onblur="guardarCV('D2','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" disabled="true" /></td>
				<td colspan="1" class='e_td_string1'><input <%=varvisualiza%>  name="D2_D<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="D2_D<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("D2_D")%>"  size="5"  maxlength="1" disabled="true" /></td>      
<%ELSE %>                        
                <td colspan="1" class='e_td_string1'><input <%=varvisualiza%>  name="D1<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="D1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("D1")%>"  onblur="guardarCV('D1','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>

		        <td colspan="1" class='e_td_string1'><input <%=varvisualiza%>  name="D2<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="D2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("D2")%>"  onblur="guardarCV('D2','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                  
				<%if RsP.Fields("D1")<> "7" then %>           
				<td colspan="1" class='e_td_string1'><input <%=varvisualiza%>  name="D2_D<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="D2_D<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("D2_D")%>"  size="5"  maxlength="1" /></td>      

				<%ELSE %>      
				           
				<td colspan="1" class='e_td_string1'><input <%=varvisualiza%>  name="D2_DES<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="D2_DES<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("D2_DES")%>"  onblur="guardarCV('D2_DES','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>                                           
				<%END IF%>     
<%END IF%> 
				           
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="D3<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="D3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("D3")%>"  onblur="guardarCV('D3','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="1" /></td>
                
                <%END IF%>
                
                   <td class='e_td_string1'><input <%=varvisualiza%>  name="OBSERVACION<%=RsP.Fields("id_per")%>"  onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="OBSERVACION<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("OBSERVACION")%>"  onblur="guardarCV('OBSERVACION','<%=RsP.Fields("id_per")%>',this.value,<%=RsP.Fields("id_convocatoriacargo")%>)" size="30" maxlength="400" /></td>
                   
                   <% if cargo<> 3392 then %> 
		        <td class='e_td_string1'><div id="tr<%=RsP.Fields("id_per")%>"><%=RsP.Fields("p_total")%></div></td>
                <%END IF%>
			
                

                
                <td  class='e_td_string1' align="center" id="t<%=RsP.Fields("ID_PER")%>"><select <%=varvisualiza%>  style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onfocus="valorinicial(this.value,this.id)" onchange="f_contador_cap(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
                  <option value="" <%if(RsP.Fields("ESTADO_3")="9") then response.write("selected")end if%>>Seleccione...</option>
                  <option value="1" <%if(RsP.Fields("ESTADO_3")="1") then response.write("selected")end if%> >Aprobado</option>
                  <option value="2" <%if(RsP.Fields("ESTADO_3")="2") then response.write("selected")end if%>>Desaprobado</option>
                </select>                
                </td>                
                
                
               
                  

        <% lsNivel= RsP.Fields("nivel")
		registro = registro + 1
		RsP.MoveNext
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

