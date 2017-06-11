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
cmbCargo1=Request.Form("cmbCargo1")
'response.Write( "plsCargo" )   response.Write( plsCargo )

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

	SQLContCapac = "EXEC dbo.usp_count_capacita '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"' " 
	
'response.Write (SQLContCapac) 
	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorPre	=wRsDataCapc(0)
	else
		contadorPre	="0"
	End if



		consulta1 = "EXEC dbo.pa_ficha_capacita'" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"'" 
		
response.Write(consulta1)	
			
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
                  <td colspan="21" align="left" ><span class="titulo">NOTA DE EX&Aacute;MEN : <%=vartitt%> &nbsp;&nbsp;&nbsp;<img src="images/excell1.gif" onclick="verReporte_cap(1)"  width="32" height="29" /></span></td>
                </tr>
                <tr>
                
<td colspan="21" ><div align="right" ><span>Aprobados</span>
<input type="text" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true"></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>
                 <th  bordercolor="#DAE8F3" class="dato3"  bgcolor="#DAE8F3"  >Tipo de Candidato</th>
                <th   bordercolor="#DAE8F3"   bgcolor="#DAE8F3" class="dato3"  >Sede</th>     
                <th bgcolor="#DAE8F3" class="dato3" >NOMBRE</th>
                <th  bgcolor="#DAE8F3" class="dato3" >C 1</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >C 2</th> 
                
            <!--- solo para algunos cargos ASISTENTE DE SUPERVISOR /  ASISTENTE DE SUPERVISOR  BILINGUE/ ------->
            
            <%if cargo = 3382 or cargo = 3385  then%>
                <th  bgcolor="#DAE8F3" class="dato3" >C 3</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >PE C 4 1</th> 
				<th  bgcolor="#DAE8F3" class="dato3" >PE C 4 2</th> 
				<th  bgcolor="#DAE8F3" class="dato3" >Resultado PE</th> 
                
                <%end if%>
                
                
                  <%if cargo = 3392  then%>
                                  <th  bgcolor="#DAE8F3" class="dato3" >C 3</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >C 4 </th> 
                  <%end if%>
                  
            <!--- solo para algunos cargos ------->
            
            <%if cargo <> 3382 and cargo <> 3385  and cargo <> 3392 then%>
            
                <th  bgcolor="#DAE8F3" class="dato3" >PE 1</th> 

                <th  bgcolor="#DAE8F3" class="dato3" >PE 2</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >PE 3</th> 
                
				<th  bgcolor="#DAE8F3" class="dato3" >RES. FINAL P.E</th> 
                <%end if%>

                <th  bgcolor="#DAE8F3" class="dato3" >PUNTAJE FINAL</th>   
                
                

                                <th  bgcolor="#DAE8F3" class="dato3" >D 1</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >D 2</th> 
                
                	<%if cargo <> 3392 then%>
                             
                <th  bgcolor="#DAE8F3" class="dato3" >D 3</th> 

                <th  bgcolor="#DAE8F3" class="dato3" >D 4</th> 
                
                 <%if cargo <> 3382  and cargo <>  3385 then%>
                 
                <th  bgcolor="#DAE8F3" class="dato3" >D 5</th>
                
                <%end if%>
                
                <%end if%>
                
				<th  bgcolor="#DAE8F3" class="dato3" >OBSERVACIONES</th> 
                 
<%if id_proyecto="156" then%>
				<th  bgcolor="#DAE8F3" class="dato3" >Aptitud durante la sesiones de aprendizaje</th>
<% end if %>                           
                <th  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
                <%if id_rol=31 then %>
                <th  bgcolor="#DAE8F3" class="dato3" >EVALUAR</th>

<%if id_proyecto="156" then%>
				<th  bgcolor="#DAE8F3" class="dato3" >OBSERVACIONES</th>
<% end if %>                  
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
		      <tr  class='<%=clase%>' style="font-size:9px;">
               <%  varvisualiza=""
		
      '  if RsP.Fields("Activo")="1" then
	  ' varvisualiza="disabled=""disabled"""
	  '	ELSE 
	    
			if RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
	     		varvisualiza="disabled=""disabled"""
			end if
       'END IF
	   

	    %>

		        <td height="34" class='e_td_string1'><%response.Write(cont)%> </td>
                
		        <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
                <td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
                <td class='e_td_string1'><%=RsP.Fields("sedeOperativa")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
		        
                 <td align="center" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%>  name="txtc1<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtc1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("c1")%>"  onblur="guardarCAPA('c1','<%=RsP.Fields("id_per")%>',this.value, '1', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="5" />
            </span></td>
            <td width="202" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtc2<%=RsP.Fields("id_per")%>" onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtc2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("c2")%>"  onblur="guardarCAPA('c2','<%=RsP.Fields("id_per")%>',this.value, '2', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="5" />
            </span></td>
            
                        <!--- solo para algunos cargos ASISTENTE DE SUPERVISOR /  ASISTENTE DE SUPERVISOR  BILINGUE/ ------->
            
            
            <%if cargo = 3382 or cargo = 3385  then%>
              <td width="202" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtc3<%=RsP.Fields("id_per")%>" onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtc3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("c3")%>"  onblur="guardarCAPA('c3','<%=RsP.Fields("id_per")%>',this.value, '10', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="5" />
            </span></td>
            
            
            <td width="202" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtc41<%=RsP.Fields("id_per")%>" onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtc41<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("c41")%>"  onblur="guardarCAPA('c41','<%=RsP.Fields("id_per")%>',this.value, '11', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="5" />
            </span></td>
            
            
                        <td width="202" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtc42<%=RsP.Fields("id_per")%>" onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtc42<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("c42")%>"  onblur="guardarCAPA('c42','<%=RsP.Fields("id_per")%>',this.value, '12', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="5" />
            </span></td>
            
            
              
                   
             <td width="357" class='e_td_string1'><div id="txttotalc4<%=RsP.Fields("id_per")%>"><%=RsP.Fields("RC4")%></div></td>
             
				
            
            <%end if%>
            
            
              <%if cargo = 3392  then%>
               <td width="202" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtc3<%=RsP.Fields("id_per")%>" onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtc3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("c3")%>"  onblur="guardarCAPA('c3','<%=RsP.Fields("id_per")%>',this.value, '10', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="5" />
            </span></td>
            
            
            <td width="202" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtc4<%=RsP.Fields("id_per")%>" onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtc4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("c4")%>"  onblur="guardarCAPA('c4','<%=RsP.Fields("id_per")%>',this.value, '11', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="5" />
            </span></td>
            <%end if%>
            
            
            <!--- solo para algunos cargos ------->
            
            
             <%if cargo <> 3382 and  cargo <> 3385  then%>
             
            <% if RsP.Fields("id_convocatoriacargo")=1831 or RsP.Fields("id_convocatoriacargo")=1832 or RsP.Fields("id_convocatoriacargo")=1841  then
			tam=2
			else
			tam=4
			end if
			 %>
            <td width="207" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%> name="txte1<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txte1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("e1")%>"  onblur="guardarCAPA('e1','<%=RsP.Fields("id_per")%>',this.value, '3', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="<%=tam%>" />
            </span></td>
            
            
            
 
              <td width="207" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%>  name="txte2<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txte2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("e2")%>"  onblur="guardarCAPA('e2','<%=RsP.Fields("id_per")%>',this.value, '4', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            <td width="207" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%> name="txte3<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txte3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("e3")%>"  onblur="guardarCAPA('e3','<%=RsP.Fields("id_per")%>',this.value, '5', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            
             <td width="357" class='e_td_string1'><div id="txtrfe<%=RsP.Fields("id_per")%>"><%=RsP.Fields("RFE")%></div></td>
            
            
<%end if%>
                <td width="357" class='e_td_string1'><div id="txtprom<%=RsP.Fields("id_per")%>"><%=RsP.Fields("notacap")%></div></td>
				

<%if id_proyecto="156" then%>
			
 

            <td width="202" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtact<%=RsP.Fields("id_per")%>"  class="etiqueta"  type="text" id="txtact<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("ActitudCapac")%>"  onblur="guardarCAPA('ActitudCapac','<%=RsP.Fields("id_per")%>',this.value, '6', <%=RsP.Fields("id_convocatoriacargo")%>)" size="10" maxlength="300" />
            </span></td>   

            
<% end if %>        




<td width="207" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%>  name="txtd1<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtd1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("d1")%>"  onblur="guardarCAPA('d1','<%=RsP.Fields("id_per")%>',this.value, '6', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            
            
            <td width="207" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%>  name="txtd2<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtd2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("d2")%>"  onblur="guardarCAPA('d2','<%=RsP.Fields("id_per")%>',this.value, '7', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            
            <%if cargo <> 3392 then%>
             
             
               <td width="207" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%>  name="txtd3<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtd3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("d3")%>"  onblur="guardarCAPA('d3','<%=RsP.Fields("id_per")%>',this.value, '8', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            
            <td width="207" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%>  name="txtd4<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtd4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("d4")%>"  onblur="guardarCAPA('d4','<%=RsP.Fields("id_per")%>',this.value, '9', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            
            
           <%if cargo <> 3382  and cargo <> 3385   and cargo <> 3392 then%>
            
            <td width="207" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%>  name="txtd5<%=RsP.Fields("id_per")%>"  class="etiqueta"  type="text" id="txtd5<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("d5")%>"  onblur="guardarCAPA('d5','<%=RsP.Fields("id_per")%>',this.value, '10', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
                     
                 <%end if%>
                 
                 <%end if%>
                     
                     
                             <td width="207" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%>  name="txtOBSERVACION<%=RsP.Fields("id_per")%>" class="etiqueta"  type="text" id="txtOBSERVACION<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("OBSERVACION")%>"  onblur="guardarCAPA('OBSERVACION','<%=RsP.Fields("id_per")%>',this.value, '7', <%=RsP.Fields("id_convocatoriacargo")%>)" size="11" maxlength="300" />
            </span></td>
                     
                     
                     
                <td class='e_td_string1'><div id="txtaprob<%=RsP.Fields("id_per")%>"><%=RsP.Fields("estado")%></div></td>
                
       <%if id_rol=31  then%>
                
                <td  class='e_td_string1' align="center" id="t<%=RsP.Fields("ID_PER")%>"><select <%=varvisualiza%>  style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onfocus="valorinicial(this.value,this.id)" onchange="f_contador_pre1(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
                  <option value="9" <%if(RsP.Fields("capacita")="9") then response.write("selected")end if%>>Elija Opci&oacute;n...</option>
                  <option value="1" <%if(RsP.Fields("capacita")="1") then response.write("selected")end if%> >Aprobado</option>
                  <option value="2" <%if(RsP.Fields("capacita")="2") then response.write("selected")end if%>>Desaprobado</option>
                  <option value="3" <%if(RsP.Fields("capacita")="3") then response.write("selected")end if%>>No rindi&oacute; la prueba</option>
                </select></td>
<% END IF %>

<%if id_proyecto="156" then%>	

            <td width="202" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtact<%=RsP.Fields("id_per")%>"  class="etiqueta"  type="text" id="txtact<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("ObsCapac")%>"  onblur="guardarCAPA('ObsCapac','<%=RsP.Fields("id_per")%>',this.value, '7', <%=RsP.Fields("id_convocatoriacargo")%>)" size="10" maxlength="300" />
            </span></td>   
            
<% end if %> 

               
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

