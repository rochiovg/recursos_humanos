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

'http://localhost/rrhh/exportarCapacitacionN2Excel.asp?lsDPTO=15LIMA&lsPROV=52&lsDIST=104&lsCargo=1&nivelRRHH=1&lsConvocaroria=00
 usuario=Session("id_usuario")
 
varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
plsCargo = Request("lsCargo")
nivelrrhh=Request("nivelRRHH")

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

  varccdd=len(varccddTot)
  varccdd = Mid(varccddTot,1,2) 
  lsCargo = "00"
tipocargo = nivelrrhh

END IF 



if idProyecto<>"" then

  
    consulta1 = "EXEC dbo.sp_GetDatosCapacitacion '" & lsCargo & "', '" & varccdd & "', '" & varccppTot & "', '" & varccdiTot & "', '" & tipocargo & "', '" & idProyecto & "'" 
    

    
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
			
		
	  If  Not RsP.BOF And Not RsP.EOF Then  

		 %>
            <table width="100%">
              
              <tr>
                 <th colspan="14"><span  style="height:30px; font-size:20px;">CENSO NACIONAL A GOBIERNOS REGIONALES Y LOCALES 2014 </span></th>
              </tr>
              <tr>
                 <th colspan="14"  >
                 <span  style="height:30px; font-size:18px;">"Curso Taller de Nivel 0"  </spa>
                 </th>
              </tr>

              <tr>
                 <th colspan="14"  >
                 <span  style="height:30px; font-size:18px;">CURSO DE CAPACITACI&Oacute;N DIRIGIDO A INSTRUCTORES </spa>
                 </th>
              </tr>
              <tr>
                <th colspan="14" ><span style="height:18px; font-size:28px;">ACTAS DE NOTAS GENERAL </span></th>
              </tr>
              <tr>
              <th colspan="4" align="left" ><span  style="height:15px;">SEDE DE CAPACITACI&Oacute;N:<%'=RsP.Fields("local")%> </span></th>
                <th colspan="10" align="left" ><span  style="height:15px;">Aula:1<%'=RsP.Fields("aula")%></span></th>
            </tr>

                                 


            </table>

                 
              <table  id="Exportar_a_Excel"  border="1" align="center" cellpadding="2" cellspacing="2"  style="font-family:Arial; font-size:10px"  >

                      <tr>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">N&deg; </td>
                         <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">DNI </td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">APELLIDOS y NOMBRES </td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">CARGO</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">ASISTENCIA Y PUNTUALIDAD</td>
                       
                        <td bgcolor="#deedf7"  style="font-size:12px;" colspan="5">CONTROL DE LECTURA</td>                       
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">EXAMEN FINAL </td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">PRACTICA CALIFICADA</td>
                        
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">EXPOSICI&Oacute;N</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">PROM FINAL</td>
                      </tr>
                      <tr>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 1</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 2</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 3</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 4</td>

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
    <td class='t' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("dni")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("nombre")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("cargo")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p4")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l1")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l2")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l3")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l4")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p1")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p6")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p2")%></td>

    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p7")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("notacap")%></td>
  </tr>
                                  <% 
                                   
                            registro = registro + 1
                            RsP.MoveNext
                            Loop	
                            RsP.close %>
                                  </tr>
                                  <tr >
                                    <th  colspan="14" align="right"><div style="font-size:11px;">Fuente: Sistema RRHH</div></th>
                                  </tr>

                                 <tr >
                                    <th  colspan="14" align="right"><div style="font-size:11px;"><%=NOW()%></div></th>
                                  </tr>  
                                </table>
           <% end if 
     
Else
Response.write "Loguese porfavor..... Gracias!!!"
End If%>
