<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
Response.ContentType="text/html; charset=iso-8859-1"	
Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_CAPACITACION.xls"

Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.Flush 
 	 
id_proyecto=session("id_proyecto") 
varccddTot = Request("lsDPTO")
varccppTot = Request("lsPROV")
varccdiTot = Request("lsDIST")
plsCargo = Request("lsCargo")
lsUsuario=Request("lsUsuario")
lsConvCar=Request("lsConvCar")
VALOR=Request("VALOR")

id_rol=Session("txtTipoUsuarioValido")


cantvarccddTot=len(varccddTot)
'nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
'nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
'nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

cargo = Mid(plsCargo,2)

	SQLContCapac = "EXEC dbo.usp_count_capacita '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"'" 
	
	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorPre	=wRsDataCapc(0)
	else
		contadorPre	="0"
	End if

		consulta1 = "EXEC dbo.pa_ficha_capacita'" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"'" 
'response.Write(consulta1)		
	
		
	
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
                  <td colspan="20" align="left" ><span class="titulo">NOTA DE EX&Aacute;MEN : <%=vartitt%></span></td>
                </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NRO. DE CONVOCATORIA</th> 
                <th  bordercolor="#DAE8F3" class="dato3"  bgcolor="#DAE8F3"  >Tipo de Candidato</th>
                <th   bordercolor="#DAE8F3"   bgcolor="#DAE8F3" class="dato3"  >Sede</th>     
                <th bgcolor="#DAE8F3" class="dato3" >NOMBRE</th>
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 1</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 2</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 3</th>
                   <%IF lsConvCar=1831 OR lsConvCar=1832 OR lsConvCar=1841 or plsCargo=2971 or lsConvCar=2697 or lsConvCar=2698   or plsCargo=6446 or plsCargo=13229  THEN %>
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 4</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 5</th> 
                     <%END IF%>
                <th  bgcolor="#DAE8F3" class="dato3" >NOTA FINAL</th>               
<%if id_proyecto="156" then%>
				<th  bgcolor="#DAE8F3" class="dato3" >Aptitud durante la sesiones de aprendizaje</th>
<% end if %>                  
                <th  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
<%if id_proyecto="156" then%>
				<th  bgcolor="#DAE8F3" class="dato3" >OBSERVACIONES</th>
<% end if %>                
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
                
		        <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
                <td class='e_td_string1'><%=RsP.Fields("num_convocatoria")%></td>
                <td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
                <td class='e_td_string1'><%=RsP.Fields("sedeOperativa")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
                 <td align="center" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("p1")%>
            </span></td>
            <td width="202" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("p2")%>
            </span></td>
            <td width="207" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("p3")%>
            </span></td>
            
            <%IF lsConvCar=1831 OR lsConvCar=1832 OR lsConvCar=1841 or plsCargo=2971 or lsConvCar=2697 or lsConvCar=2698 or lsConvCar=2394 or plsCargo=13229  THEN %>
              <td width="207" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("p4")%>
            </span></td>
            <td width="207" class='e_td_string1'><span class="etiqueta"><%=RsP.Fields("p5")%>
            </span></td>
             <%END IF%>
            
                <td width="357" class='e_td_string1'><div id="txtprom<%=RsP.Fields("id_per")%>"><%=RsP.Fields("notacap")%></div></td>
                
<%if id_proyecto="156" then%>	
                <td width="357" class='e_td_string1'><div id="txtprom<%=RsP.Fields("id_per")%>"><%=RsP.Fields("ActitudCapac")%></div></td>
<% end if %> 				
                <td class='e_td_string1'><div id="txtaprob<%=RsP.Fields("id_per")%>"><%=RsP.Fields("estado")%></div></td>
                
<%if id_proyecto="156" then%>	
                <td width="357" class='e_td_string1'><div id="txtprom<%=RsP.Fields("id_per")%>"><%=RsP.Fields("ObsCapac")%></div></td>             
<% end if %> 
                
                <%  varvisualiza="enabled"
		
       if RsP.Fields("Activo")="1" or RsP.Fields("Activo")="2" or RsP.Fields("cenviocontra")="1"  or RsP.Fields("cenviocontra")="2" TheN
	     		varvisualiza="disabled"
       end if%>
       

               
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

