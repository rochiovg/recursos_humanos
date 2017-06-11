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

Server.ScriptTimeout = 1800 
	 	 
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





	
		
		if  id_proyecto = 139 then
		
		
			varccdd = varccddTot
			cantvarccppTot=len(varccppTot)
			varccpp = Mid(varccppTot,3,2)
			cantvarccdiTot=len(varccdiTot)
			varccdi = Mid(varccdiTot,5,2)
			cargo = Mid(plsCargo,2)




				SQLContCapac = "EXEC dbo.usp_count_EVALCV_ece '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"'  " 
				
				Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
				wRsDataCapc.cursorlocation=3
				wRsDataCapc.Open SQLContCapac, MiCone, 3,3
				If wRsDataCapc.RecordCount > 0 Then 
					contadorPre	=wRsDataCapc(0)
				else
					contadorPre	="0"
				End if
	


				consulta1 = "EXEC dbo.uspGet_DatosCalificacionCV_ednom '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"' " 

		else
		
		
			varccdd = varccddTot
			cantvarccppTot=len(varccppTot)
			varccpp = Mid(varccppTot,4,2)
			cantvarccdiTot=len(varccdiTot)
			varccdi = Mid(varccdiTot,6,2)
			cargo = Mid(plsCargo,2)



				SQLContCapac = "EXEC dbo.usp_count_EVALCV_ece '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"'  " 
			
				Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
				wRsDataCapc.cursorlocation=3
				wRsDataCapc.Open SQLContCapac, MiCone, 3,3
				If wRsDataCapc.RecordCount > 0 Then 
					contadorPre	=wRsDataCapc(0)
				else
					contadorPre	="0"
				End if
		
		
		
				consulta1 = "EXEC dbo.uspGet_DatosCalificacionCV_ece '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"' " 
				
		
				
		end if
		
		
		
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta1, MiCone, 3,3
	'if varccdd="99" and varccpp="99" and varccdi="99" then
				'   vartittn=" A Nivel Nacional"
				'end if
				'if varccdd<>"99" then
				'   vartit1= "Departamento : " & nomccdd
				'end if
				'if varccpp<>"99" then
				'   vartit2= " / Provincia : "& nomccpp
				'end if
				'if varccdi<>"99" then
				
				'   vartit3= " / Distrito : "&nomccdi
				'end if
				'strubig=strubig1 & strubig2 & strubig3
				'strubigT=strubig1T & strubig2T & strubig3T
				'vartitt=vartit1 & vartit2 & vartit3
	     
	If  Not RsP.BOF And Not RsP.EOF Then  %>
                <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
                
               <tr>
                  <td colspan="16" align="left" >&nbsp;</td>
                </tr>
                <tr>
                
<td colspan="15" ><div align="right" ><span><span class="titulo"><img src="images/excell1.gif" onclick="enviar_consultaCV_ece()"  width="32" height="29" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Aprobados</span>
    <input type="text" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true"></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >DEPARTAMENTO</th> 
                <th colspan="4" bgcolor="#DAE8F3" class="dato3" >DATOS PERSONALES</th>
                <th width="15%" colspan="1"  bgcolor="#DAE8F3" class="dato3" >FORMACION ACAD&Eacute;MICA</th>
                <% if id_rol=0 then %>
                <th width="8%" colspan="1"  bgcolor="#DAE8F3" class="dato3" >FORMACION ACAD&Eacute;MICA</th>
		        <th width="8%" bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA LABORAL</th>
		        <th width="8%"  bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA EN AULA</th>
		        <th width="7%" bgcolor="#DAE8F3" class="dato3" >TIEMPO DE EXPERIENCIA</th>
		        <th width="7%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >TOTAL</th>
                <% end if%>
                
                 
                
                
                <%if id_rol=0 then 
				
				else%>
                <th width="8%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >EVALUAR</th>
                


			 <%if  id_proyecto <> 139 then%>
                 <% IF cargo<>1615 AND  cargo<>1616 THEN %>
                <th width="8%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >TIPO DE AULA</th>
                <% end if%>
                    <% end if%>
                
                
                



				
                  
                  <th width="7%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" style="display:none" >ESTADO</th>
                  

                  
          <%end if%>
          
                  
                  

		        </tr>
		      <tr style="font-size:9px" >
		        <th width="20%" bgcolor="#DAE8F3" class="dato3" >APELLIDOS Y NOMBRES</th>
		        <th width="11%"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >TELEFONO</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >CORREO ELECTR&Oacute;NICO</th>
		        <th width="15%"  bgcolor="#DAE8F3" class="dato3" >DESCRIPCION</th><% if id_rol=0 then %>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >PUNTOS</th>
		        <th bgcolor="#DAE8F3" class="dato3" >PUNTOS</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >PUNTOS</th>
		        <th bgcolor="#DAE8F3" class="dato3" >PUNTOS</th>
                <%end if %>
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
		      <tr  class='<%=clase%>' style="font-size:9px;">
		        
                <%  varvisualiza=""
		
        if RsP.Fields("Activo")="1" then
	   varvisualiza="disabled=""disabled"""
	   else
			if RsP.Fields("cenviocontra")="1" or RsP.Fields("cenviocontra")="2" or RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
	     		varvisualiza="disabled=""disabled"""
        end if
	   end if

       %>
                <td height="34" class='e_td_string1'><%response.Write(cont)%>
		          </td>
                
		        <td class='e_td_string1'><%=RsP.Fields("DPTO")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
                <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("telefono")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("correo")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nivel")%></td>
		        <% if id_rol=0 then %>
                <td class='e_td_string1'>
                
                
                
		          <input <%=varvisualiza%> name="txt11<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="p_formacionAct<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p_formacionAct")%>"  onblur="guardarCV('p_formacionAct','<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="2" /></td>
                  
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="p_formacionAct<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="p_expLaboral<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p_expLaboral")%>"  onblur="guardarCV('p_expLaboral','<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="2" /></td>
                
		        <td class='e_td_string1'><input <%=varvisualiza%>  name="p_formacionAct<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="p_expAula<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p_expAula")%>"  onblur="guardarCV('p_expAula','<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="2" /></td>
                
		        <td class='e_td_string1'><input <%=varvisualiza%> name="p_formacionAct<%=RsP.Fields("id_per")%>"validchars="0123456789" onkeypress="return TextUtil.allowChars(this, event)" class="etiqueta"  type="text" id="p_experiencia<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p_experiencia")%>"  onblur="guardarCV('p_experiencia','<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="2" /></td>
                
		        <td class='e_td_string1'><div id="tr<%=RsP.Fields("id_per")%>"><%=RsP.Fields("p_total")%></div></td>
               <% end if %>
               
               <!----------------------------------------SOLO APLICADORES ECE----------------->
               
         
               
                <%if id_rol=0 then  %>
				 
				<%	else%>
               <td class='e_td_string1' align="center" id="t<%=RsP.Fields("ID_PER")%>"><div id="seleccion" ><select <%=varvisualiza%>  style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onfocus="valorinicial(this.value,this.id)" onchange="f_contador_cap(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
                  <option value="" <%if(RsP.Fields("bandaprob")="9") then response.write("selected")end if%>>Seleccione...</option>
                  <option value="1" <%if(RsP.Fields("bandaprob")="1") then response.write("selected")end if%> >Aprobado</option>
                  <option value="2" <%if(RsP.Fields("bandaprob")="2") then response.write("selected")end if%>>Desaprobado</option>
                </select></div></td>
                <% 
			 if varvisualiza="" then 
				if RsP.Fields("bandaprob")="1" then 
					varD=""
				else
					varD="disabled=""disabled"""
				end if
			else
				varD="disabled=""disabled"""
			end if 
			
			colorT=""
			if RsP.Fields("bandaprob")="1" and RsP.Fields("eval_apli")="0" then
			colorT="bgColor=""#CD9C9C"""
			end if 
			if RsP.Fields("bandaprob")="1" and RsP.Fields("eval_apli")<>"0" then
			colorT="bgColor=""#7EBA65"""
			end if 
			
			
			
				%>
                 
                 
                  <%if  id_proyecto <> 139 then%>
                  
                  <% IF cargo<>1615 AND  cargo<>1616 THEN %>
                <td class='e_td_string1' align="center" id="ta<%=RsP.Fields("ID_PER")%>" <%=colorT%>><div id="seleccion" ><select <%=varD%>   style="font-size:10px"  name="txtA<%=RsP.Fields("ID_PER")%>" id="txtA<%=RsP.Fields("ID_PER")%>" onfocus="valorinicial(this.value,this.id)" onchange="act_tipo_aula(this.id,'<%=RsP.Fields("ID_PER")%>',this.value)">
                  <option value="" <%if(RsP.Fields("eval_apli")="0") then response.write("selected")end if%>>Seleccione...</option>
                  <option value="1" <%if(RsP.Fields("eval_apli")="1") then response.write("selected")end if%> >Aula ECE</option>
                  <option value="2" <%if(RsP.Fields("eval_apli")="2") then response.write("selected")end if%>>Aula IEB L2</option>
                </select></div></td>
                 <% end if%>
                 
                 <% end if %>
                
               <td  style="display:none" class='e_td_string1' id="tb"><div id="tr1<%=RsP.Fields("id_per")%>"><%=RsP.Fields("estado_cv")%></div></td>
               
               
               
               
               
                  
               
                <%end if%>
                

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

