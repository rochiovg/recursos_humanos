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
nivelrrhh= Request("nivelrrhh")
lsConvocaroria=Request("lsConvocaroria")

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

varccdd = Mid(varccddTot,1,2)
varccpp = Mid(varccppTot,3,2)
varccdi = Mid(varccdiTot,5,2)
lsCargo = Mid(plscargo,2)
tipocargo = Mid(plscargo,1,1)

END IF
        consulta1 = "EXEC dbo.sp_GetDatosCapacitacion '" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & tipocargo & "', '" & idProyecto & "'" 

       
    
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
			
		
	  If  Not RsP.BOF And Not RsP.EOF Then  

		 %>
            <table width="100%">
              
              <tr>
                 <th colspan="13"><span  style="height:30px; font-size:20px;">ENCUESTA PROVINCIAL A HOGARES RURALES </span></th>
              </tr>
              <tr>
                 <th colspan="13"  ><span  style="height:30px; font-size:18px;">"CURSO  DE CAPACITACION DE NIVEL "1" DIRIGIDO A: INSTRUCTORES  </spa></th>
              </tr>
                                    <tr>
                                    <th colspan="13" ><span style="height:18px; font-size:28px;">ACTAS DE NOTAS GENERAL </span></th>
                                  </tr>
                                    <tr>
                                    <th colspan="13" align="left" ><span  style="height:15px;">SEDE DE CAPACITACI&Oacute;N:  SALA TERESA PAREJA</span></th>
                                  </tr>

                                 


            </table>

                 
              <table  id="Exportar_a_Excel"  border="1" align="center" cellpadding="2" cellspacing="2"  style="font-family:Arial; font-size:10px"  >

                      <tr>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">n</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">APELLIDOS y NOMBRES </td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">CARGO</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" colspan="6">Control de Lectura</td>                       
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">PARTICIPACI&Oacute;N DIARIA </td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">PRACTICA CALIFICADA</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">ASISTENCIA Y PUNTUALIDAD</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">PROM FINAL</td>
                      </tr>
                      <tr>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 1</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 2</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 3</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 4</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 5</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;">Promedio</td>

                      </tr>


                                  <% 	registro = 0					
                            Do While Not RsP.EOF
                            
                            
                                If registro Mod 2 = 0 Then
                                    clase =  "e_tr_odd"
                                Else
                                    clase = "bgcolor=#EFEFEF"
                                End If	
                                cont = registro+1 
                             
 
                              %>
          <tr <%=clase%> >
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=cont%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("nombre")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("cargo")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l1")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l2")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l3")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l4")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l5")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p1")%></td>

    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p5")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p2")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p4")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("notacap")%></td>
  </tr>
                                  <% 
                                   
                            registro = registro + 1
                            RsP.MoveNext
                            Loop	
                            RsP.close %>
                                  </tr>
                                  <tr >
                                    <th  colspan="13" align="right"><div style="font-size:11px;">Fuente:Sistema RRHH</div></th>
                                  </tr>

                                 <tr >
                                    <th  colspan="13" align="right"><div style="font-size:11px;"><%=NOW()%></div></th>
                                  </tr>  
                                </table>
           <% end if 
     
   
                    		   


			   
%>