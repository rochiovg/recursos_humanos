<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
</style>
<%
Response.Addheader "Content-Disposition", "attachment; filename=NotasCapacitacion.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 


 usuario=Session("id_usuario")
 
varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
plsCargo = Request("lsCargo")

lsConvocaroria=Request("lsConvocaroria")

idProyecto=Session("id_proyecto")



varccdd = Mid(varccddTot,1,2)



varccpp = Mid(varccppTot,3,2)



varccdi = Mid(varccdiTot,5,2)



lsCargo = Mid(plscargo,2)
tipocargo = Mid(plscargo,1,1)

      consulta1 = "EXEC dbo.uspGet_DatosSeleccionado'" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & tipocargo & "', '" & idProyecto & "'" 
    
	
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
			
		
	  If  Not RsP.BOF And Not RsP.EOF Then  

		 %>
            <table width="100%">
              
              <tr>
                 <th colspan="10"><span  style="height:30px; font-size:20px;">ENCUESTA PROVINCIAL A HOGARES RURALES </span></th>
              </tr>
              <tr>
                 <th colspan="10"  ><span  style="height:30px; font-size:18px;">CURSO  DE CAPACITACION PILOTO: DIRIGIDO A SUPERVISORES LOCALES Y ENCUESTADORES</spa></th>
              </tr>
                                    <tr>
                                    <th colspan="10" ><span style="height:18px; font-size:28px;">ACTAS DE NOTAS GENERAL </span></th>
                                  </tr>
                                    <tr>
                                    <th colspan="10" align="left" ><span  style="height:15px;">SEDE DE CAPACITACION </span></th>
                                  </tr>

                                  <tr bgcolor="#deedf7">
                                    <th  colspan="10" align="right"><div style="font-size:11px;"><%=NOW()%></div></th>
                                  </tr>


            </table>

                 
              <table  id="Exportar_a_Excel"  border="1" align="center" cellpadding="2" cellspacing="2"  style="font-family:Arial; font-size:10px"  >
                                  
                                  <tr>
                                    <th  bgcolor="#deedf7" rowspan="2" class='dato3'>AULA Nro</th>
                                    <th    bgcolor="#deedf7" rowspan="2" class='dato3' >PART Nro</th>
                                    <th   bgcolor="#deedf7"  rowspan="2"class="dato3">PROVINCIA</th>
                                    <th   bgcolor="#deedf7" class='dato3' rowspan="2">APELLIDOS Y NOMBRES</th>
                                    <th  bgcolor="#deedf7"  class='dato3' rowspan="2" >CARGO</th>
                                    <th  bgcolor="#deedf7"  class='dato3' colspan="4" >CRITERIOS DE EVALUACION</th>
                                    <th bgcolor="#deedf7"  class='dato3' rowspan="2"   >PROMEDIO FINAL</th>
                                 
                                  </tr>
                                  <tr>
                                    <th   bgcolor="#deedf7" class='dato3'>EXAMEN ESCRITO</th>
                                    <th bgcolor="#deedf7"  class='dato3'>PRACTICA CALIFICADA</th>
                                    <th  bgcolor="#deedf7"  class='dato3'>PRACTICA DE CAMPO</th>
                                    <th   bgcolor="#deedf7"  class='dato3'>ASISTENCIA Y PUNTUALIDAD</th>

                                  </tr>
                                  <% 	registro = 0					
                            Do While Not RsP.EOF
                            
                            
                                If registro Mod 2 = 0 Then
                                    clase = "e_tr_even"
                                Else
                                    clase = "e_tr_odd"
                                End If	
                                cont = registro+1 
                             
 
                              %>
                                  <tr class='<%=clase%>'>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" >&nbsp;
                                      </td>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;">&nbsp;</td>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;"><%=RsP.Fields("PROVINCIA")%></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;"><span class="e_td_string" style="font-size:12px; color:#000000; font-style:normal;"><%=RsP.Fields("nombre")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("cargo")%></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;  " ><span class="e_td_string1" style="font-size:12px; color:#000000; font-style:normal;"><%=RsP.Fields("p1")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;  " ><span class="e_td_string" style="font-size:12px; color:#000000; font-style:normal;"><%=RsP.Fields("p2")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#000000; font-style:normal;"><%=RsP.Fields("p3")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#000000; font-style:normal;"><%=RsP.Fields("p4")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;  " ><span class="e_td_string1" style="font-size:12px; color:#000000; font-style:normal;"><%=RsP.Fields("notacap")%></span></td>
 
                                    <% 
                                   
                            registro = registro + 1
                            RsP.MoveNext
                            Loop	
                            RsP.close %>
                                  </tr>
                                  
                                </table>
           <% end if 
     
   
                    		   function porcentaje(meta,avance)
                    		if (isnull(meta) or meta=0) then
                    			porcentaje= 0
                    		else
                    			porcentaje=CINT(100*avance/meta)
                    		end if
                    end function


			   
%>