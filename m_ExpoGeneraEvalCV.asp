<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%


Response.Addheader "Content-Disposition", "attachment; filename=reporte_EvaluacionCVs.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 


	 	 
id_proyecto=session("id_proyecto") 
varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
plsCargo = Request("lsCargo")
lsUsuario=Request("lsUsuario")
lsConvCar=Request("lsConvCar")
VALOR=Request("VALOR")

lszona=request("txtzona")	'1501LIMA
lsseccion=request("txtseccion")	'150101LIMA


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


	lsvarzona=mid(lszona,7,5) '1501LIMA
	lsvarseccion=mid(lsseccion,12,5)	'150101LIMA
	
	

'	SQLContCapac = "EXEC dbo.usp_count_EVALCV '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"'" 
	
	
	 SQLContCapac = "EXEC dbo.usp_count_EVALCV_cc '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"', '"&lsvarzona&"', '"&lsvarseccion&"' " 
	

	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorPre	=wRsDataCapc(0)
	else
		contadorPre	="0"
	End if



		consulta1 = "EXEC dbo.uspGet_DatosCalificacionCV '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"', '"&lsvarzona&"', '"&lsvarseccion&"' " 
		'Response.Write (consulta1)
		
		
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
                  <td colspan="16" align="left" ><span class="titulo">REPORTE CRITERIO DE EVALUACI&Oacute;N : <%=vartitt%></span></td>
                </tr>
                <tr>
                
<td colspan="21" ><div align="right" ><span><span class="titulo">&nbsp;</span>Aprobados</span> <%=contadorPre%></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >DEPARTAMENTO</th> 
          <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >ZONA</th> 
                    <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >SECCION</th> 

                <th colspan="4" bgcolor="#DAE8F3" class="dato3" >&nbsp;</th>
                

			
                
                
                
                <th width="13%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >FORMACION ACADEMICA</th>

                <th width="13%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >NOTA AUT.</th>

               
         
                <th width="13%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
          

		      </tr>
		      <tr style="font-size:9px" >
				 

                              
		        <th width="6%" bgcolor="#DAE8F3" class="dato3" >APELLIDOS Y NOMBRES</th>
		        <th width="11%"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >TELEFONO</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >CORREO ELECTR&Oacute;NICO</th>
                 
				
                
                      
                
		 
				
				
                  	        
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
                <td class='e_td_string1'><%=RsP.Fields("ZONA_I")%></td>
                <td class='e_td_string1'><%=RsP.Fields("SECCION_I")%></td>
                                                
            
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
                <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("telefono")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("correo")%></td>
                
               


                
                
                

                          
                
        
              
                <td class='e_td_string1'><%=RsP.Fields("nivel")%></td>
                
                
                <td class='e_td_string1'><%=RsP.Fields("nota_automatica")%></td>
                
				
       
                <td  class='e_td_string1' align="center" >
                        <%if RsP.Fields("bandaprob")="1" then
					 response.write("Seleccionado")
				  elseif RsP.Fields("bandaprob")="2"  then 
					 response.write("Desaprobado")
				  elseif RsP.Fields("bandaprob")="9"  then 
					 response.write("Reserva")
				   elseif RsP.Fields("bandaprob")="3"  then 
					 response.write("Alta")
				  	elseif RsP.Fields("bandaprob")="4"  then 
					 response.write("Baja")
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

