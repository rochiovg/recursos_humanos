<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%


'Response.Addheader "Content-Disposition", "attachment; filename=reporte_EvaluacionCVs.xls" 
'Response.ContentType = "application/save"
'Response.Expires = 0
'Response.Buffer = True 
'Response.Flush 


	 	 
id_proyecto=session("id_proyecto") 
varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
plsCargo = Request("lsCargo")
lsUsuario=Request("lsUsuario")
lsConvCar=Request("lsConvCar")
VALOR=Request("VALOR")

'Response.Write "id_proyecto**" 
'Response.Write  id_proyecto & " ** " 
'Response.Write varccddTot
'Response.End

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
                
<td colspan="21" ><div align="right" ><span><span class="titulo">&nbsp;</span>Aprobados</span> <%=contadorPre%></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >DEPARTAMENTO</th> 
                <th width="11%" rowspan="2"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">LOCAL DE APLICACI&Oacute;N ASIGNADA</th>       
                <th colspan="4" bgcolor="#DAE8F3" class="dato3" >&nbsp;</th>
                	 <% if id_proyecto = 155 then %>
                                <th width="8%" colspan="7"  bgcolor="#DAE8F3" class="dato3" >COPIA DE DOCUMENTACI&Oacute;N DEL CV</th>
                                <%end if%>
                                
                <th width="8%" colspan="5"  bgcolor="#DAE8F3" class="dato3" >FORMACION ACAD&Eacute;MICA</th>
                
                <%if id_proyecto = 139 then%>
                <th width="8%" bgcolor="#DAE8F3" class="dato3" >EXP. ACTIVIDADES  DE COORDINACI&Oacute;N Y SUPERVISI&Oacute;N DE INSTRUMENTOS EN CAMPO</th>
                <%else%>
		        <th width="8%" colspan="3" bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA LABORAL</th>
                <%end if%>
                
                <% if id_proyecto=139 then %>
                  <th width="8%"  bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA EN APLICACIONES</th>
                <% elseif id_proyecto=155 then %>
                  <th width="8%" colspan="3" bgcolor="#DAE8F3" class="dato3" >SOLO ASISTENTE SUP NIVEL 3</th>
                <%ELSE%>  
		        <th width="8%"  bgcolor="#DAE8F3" class="dato3" >EXPERIENCIA EN AULA</th>
                <%end if%>
                
                <% if id_proyecto<>139 then %>
                    <% if id_proyecto<>155 then %>
		        <th width="7%" bgcolor="#DAE8F3" class="dato3" >TIEMPO DE EXPERIENCIA</th>
		            <%end if%>
                <%end if%>
                <th width="7%" bgcolor="#DAE8F3" class="dato3" >CUMPLE CON EL PERFIL</th>
		        <th width="7%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >TOTAL</th>
                <th width="13%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
          

		        </tr>
		      <tr style="font-size:9px" >
		        <th width="6%" bgcolor="#DAE8F3" class="dato3" >APELLIDOS Y NOMBRES</th>
		        <th width="11%"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" ><% if id_proyecto = 155 then %>N REGISTRO POSTULANTE<%else%> TELEFONO<%end if%></th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" ><% if id_proyecto = 155 then %>NRO FOLIOS <%else%>CORREO ELECTR&Oacute;NICO<%end if%></th>
                 
				 <% if id_proyecto = 155 then %><!--copia documentacion cv-->
                          <th width="4%"  bgcolor="#DAE8F3" class="dato3" >C1</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >C2</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >C3</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >C4</th>
                		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >C5</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >C6</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >C7</th>        
                                 
                <%end if%>
                
		        <th width="8%"  bgcolor="#DAE8F3" class="dato3" >DESCRIPCION</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >F1</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >F2</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >F3</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >F4</th>
		        <th bgcolor="#DAE8F3" class="dato3" >E1</th>
		        <th bgcolor="#DAE8F3" class="dato3" >E2</th>
		        <th bgcolor="#DAE8F3" class="dato3" >E3</th>		        
		        <th colspan="1" bgcolor="#DAE8F3" class="dato3" >D1</th>
		        <th colspan="2" bgcolor="#DAE8F3" class="dato3" >D2</th>		        
		        <th  bgcolor="#DAE8F3" class="dato3" >D3</th>		       	        
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
		        <td height="34" class='e_td_string1'><%response.Write(cont)%>
		          </td>
                
		        <td class='e_td_string1'><%=RsP.Fields("DPTO")%></td>
    			<td class='e_td_string1'>&nbsp;</td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
                <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
		        <td class='e_td_string1'><% if id_proyecto = 155 then %><%=RsP.Fields("nro_reg_recep")%><%else%> <%=RsP.Fields("telefono")%><%end if%></td>
		        <td class='e_td_string1'><% if id_proyecto = 155 then %><%=RsP.Fields("folio_recep")%><%else%><%=RsP.Fields("correo")%><%end if%></td>
                
                 <% if id_proyecto = 155 then %><!--copia documentacion cv-->
                <td class='e_td_string1'><%=RsP.Fields("C1")%></td>
                <td class='e_td_string1'><%=RsP.Fields("C2")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("C3")%></td>
                     <td class='e_td_string1'><%=RsP.Fields("C4")%></td>
                <td class='e_td_string1'><%=RsP.Fields("C5")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("C6")%></td>
                     <td class='e_td_string1'><%=RsP.Fields("C7")%></td>
                     <%end if%>
                
                
		        <td class='e_td_string1'><%=RsP.Fields("nivel")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("F1")%></td>
                <td class='e_td_string1'><%=RsP.Fields("F2")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("F3")%></td>
                <% if id_proyecto<>139 then %>
		        <td class='e_td_string1'><%=RsP.Fields("F4")%></td>
                <%end if%>
		        <td class='e_td_string1'><%=RsP.Fields("E1")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("E2")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("E3")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("D1")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("D2")%></td>
		        <%if RsP.Fields("D1")<> "7" then %> 
		        <td colspan="1" class='e_td_string1'><%=RsP.Fields("D2_D")%></td>
		        <%ELSE %> 
		        <td colspan="1" class='e_td_string1'><%=RsP.Fields("D2_DES")%></td>
		        <%END IF%> 
		        <td class='e_td_string1'><%=RsP.Fields("D3")%></td>		        
               <td class='e_td_string1'><%=RsP.Fields("p_total")%></td> 
                
                <%  varvisualiza="enabled"		
				if RsP.Fields("Activo")="1" or RsP.Fields("Activo")="2" or RsP.Fields("cenviocontra")="1"  or RsP.Fields("cenviocontra")="2" TheN
				  	varvisualiza="disabled"
				end if%>                

                
                <%if RsP.Fields("bandaprob")="1" then
					 response.write("Aprobado")
				  elseif RsP.Fields("bandaprob")="2"  then 
					 response.write("Desaprobado")
				  else 
				  	 response.write("No evaluado")
				  end if
				%>

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

