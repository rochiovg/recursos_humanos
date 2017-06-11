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
capacitacion=Request("capacitacion")
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

SQL4 = "exec dbo.getNombreProy '" & idProyecto& "'  "	
	
		Set RSCuad4	= Server.CreateObject("ADODB.Recordset") 
		RSCuad4.cursorlocation=3
		RSCuad4.Open SQL4, MiCone, 3,3
		
		If  Not RSCuad4.BOF And Not RSCuad4.EOF Then 
		Nom_proy=RSCuad4.Fields("nombre")
		else 
		Nom_proy=""
		end if 
		
		set RSCuad4=nothing 
		 

  
    consulta1 = "EXEC dbo.sp_GetDatosCapacitacion_total '" & lsCargo & "', '" & varccdd & "', '" & varccppTot & "', '" & varccdiTot & "', '" & tipocargo & "', '" & idProyecto & "', '" & capacitacion & "' " 
       
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
			
		
	  If  Not RsP.BOF And Not RsP.EOF Then  

		 %>
           
   
            <table width="100%">
              
              <tr>
                 <th colspan="17"><span  style="height:30px; font-size:20px;"><%=Nom_proy%></span></th>
              </tr>
              <tr>
                 <th colspan="17"  >
                 <span  style="height:30px; font-size:18px;">"Curso de Capacitaci&oacute;n"  </spa>
                 </th>
              </tr>

              <tr>
                 <th colspan="17"  >
                 <span  style="height:30px; font-size:18px;">Dirigido a personal de Operaci&oacute;n de campo</th>
              </tr>
              <tr>
                <th colspan="17" ><span style="height:18px; font-size:28px;">ACTAS DE NOTAS GENERAL </span></th>
              </tr>
              <tr>
              <th colspan="4" align="left" ><span  style="height:15px;">SEDE DE CAPACITACI&Oacute;N:<%=RsP.Fields("local")%> </span></th>
                <th colspan="13" align="left" ><span  style="height:15px;">Aula:<%=RsP.Fields("aula")%></span></th>
            </tr>

                                 


            </table>

                 
              <table  id="Exportar_a_Excel"  border="1" align="center" cellpadding="2" cellspacing="2"  style="font-family:Arial; font-size:10px"  >

                      <tr>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">N&deg; </td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">ODEI </td>
                         <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">APELLIDOS y NOMBRES </td>
                         <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">DNI</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">CARGO</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">ASISTENCIA</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">PARTICIPACI&Oacute;N DIARIA</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" colspan="8">CONTROL DE LECTURA</td>                        <td bgcolor="#deedf7"  style="font-size:12px;" colspan="7">EVALUACIONES</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">Examen Final </td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">PRACTICA CALIFICADA</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">PRACTICA DE CAMPO</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">EXPOSICI&Oacute;N</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" rowspan="2">PROM FINAL</td>
                      </tr>
                      <tr>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 1</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 2</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 3</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 4</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;">Lectura N 5</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 6</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;" >Lectura N 7</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;">Promedio</td>
                        
                        <td bgcolor="#deedf7"  style="font-size:12px;">EVAL. 1</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;">EVAL. 2</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;">EVAL. 3</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;">EVAL. 4</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;">EVAL. 5</td>
                        <td bgcolor="#deedf7"  style="font-size:12px;">EVAL. 6</td>
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
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("odei")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("nombre")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("dni")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("cargo")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p4")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p5")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l1")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l2")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l3")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l4")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l5")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l6")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("l7")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p1")%></td>
    
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("eva1")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("eva2")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("eva3")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("eva4")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("eva5")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("eva6")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p8")%></td>
    
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p6")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p2")%></td>
    <td class='e_td_string1' style="font-size:12px; color:#000000; font-style:normal;" ><%=RsP.Fields("p3")%></td>
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
                                    <th  colspan="17" align="right"><div style="font-size:11px;">Fuente: Sistema RRHH</div></th>
                                  </tr>

                                 <tr >
                                    <th  colspan="17" align="right"><div style="font-size:11px;"><%=NOW()%></div></th>
                                  </tr>  
                                </table>
           <% end if 
     
Else
Response.write "Loguese porfavor..... Gracias!!!"
End If%>
