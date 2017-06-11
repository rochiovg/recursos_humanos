<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
		 	 
Response.Addheader "Content-Disposition", "attachment; filename=Reporte.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 


varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
plsCargo = Request("lsCargo")
lsUsuario=Request("lsUsuario")
valor=Request("valor")

id_proyecto=session("id_proyecto") 

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

lscargo=Mid(plsCargo,2)



		consulta1 = "EXEC dbo.pa_ficha_resultadoFinal '" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "' , '" & id_proyecto & "' , '" & valor & "' " 

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
                  <td colspan="12" align="left" ><span class="titulo">NOTA DE EX&Aacute;MEN : <%=vartitt%></span></td>
                </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th  bgcolor="#DAE8F3" class="dato3" >ODEI</th>
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOMBRES</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >EDAD</th>
                <th  bgcolor="#DAE8F3" class="dato3" ><p>NOTA AUTOMÁTICA (I)</p></th>
		        <th  bgcolor="#DAE8F3" class="dato3" >ENTREVISTA (J)</th>
		        <th bgcolor="#DAE8F3" class="dato3" >EVALUACI&Oacute;N COMPETENCIAS (K)</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >PROMEDIO  P=(J+K)</th>
		        <th bgcolor="#DAE8F3" class="dato3" >RESULTADO p</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >NOTA FINAL (I+P)/2</th>
                <th  bgcolor="#DAE8F3" class="dato3" >RESULTADO</th>
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
		      <tr <%=a%> style="font-size:9px;">
		        <td height="34" class='e_td_string1'><%response.Write(cont)%> </td>
                <td  ><%=RsP.Fields("oDEI")%></td>
                 <td  ><%=RsP.Fields("dni")%></td>
		        <td ><%=RsP.Fields("nombre")%></td>
		        <td ><%=RsP.Fields("edad")%></td>
                <td ><%=RsP.Fields("nota_automatica")%></td>
		        <td ><%=RsP.Fields("promedioEntevista")%></td>
		        <td ><%=RsP.Fields("Evaluacion_competencia")%></td>
		        <td ><%=RsP.Fields("totalentrevista")%></td>
		        <td >&nbsp;<%=RsP.Fields("RESULTADO_ENTREVISTA")%></td>
		        <td >&nbsp;<%=RsP.Fields("resultadofinal")%></td>
                <td >&nbsp;<%=RsP.Fields("SW_TITU")%></td>
				
                <%  varvisualiza="enabled"


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

