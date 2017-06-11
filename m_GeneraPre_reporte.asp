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

	SQLContCapac = "EXEC dbo.usp_count_Preseleccionados '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"'" 
	

	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorPre	=wRsDataCapc(0)
	else
		contadorPre	="0"
	End if



		consulta1 = "EXEC dbo.uspGet_DatosPreseleccion1 '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"'" 
		
		
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
                  <td colspan="15" align="left" ><span class="titulo">NOTA DE EX&Aacute;MEN : <%=vartitt%></span></td>
                </tr>
                <tr>
                
<td colspan="14" ><div align="right" ><span>Aprobados</span>
<input type="text" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true"></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NRO. DE CONVOCATORIA</th>
        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">TIENPO DE CONTRATACI&Oacute;N</th>       
                <th bgcolor="#DAE8F3" class="dato3" >NOMBRE</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >RUC</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >EDAD</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >NIVEL EDUCATIVO</th>
		        <th bgcolor="#DAE8F3" class="dato3" >TRABAJO EN GENERAL</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >TRABAJO DE CAMPO</th>
		        <th bgcolor="#DAE8F3" class="dato3" >MANEJO DE GRUPOS</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >TRABAJO<BR>INEI</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >PROYECTO</th>
                <th  bgcolor="#DAE8F3" class="dato3" >Nota</th>
                <th  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
          

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
    <td class='e_td_string1'><%=RsP.Fields("nPeriodo_CCP")%><%=RsP.Fields("TipoP")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("ruc")%></td>
		        <td class='e_td_string1'><%=CalcularEdad(RsP.Fields("fec_nac"))%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nivel")%></td>
		        <td class='e_td_string1'><%="A&ntilde;o:"&RsP.Fields("expgen_anio")&" Meses:"&RsP.Fields("expgen_meses")%></td>
		        <td class='e_td_string1'><%="A&ntilde;o:"&RsP.Fields("expCampo_anio")&" Meses:"&RsP.Fields("expCampo_meses")%></td>
		        <td class='e_td_string1'><%="A&ntilde;o:"&RsP.Fields("expGrupo_anio")&" Meses:"&RsP.Fields("expGrupo_meses")%></td>
		        <td class='e_td_string1'>&nbsp;<%=RsP.Fields("inei")%></td>
		        <td class='e_td_string1'>&nbsp;<%=RsP.Fields("proyecto")%></td>
                <td class='e_td_string1'>&nbsp;<%=RsP.Fields("NotaPreCap")%>
                </td>
				
                <%  varvisualiza="enabled"
		
       if RsP.Fields("Activo")="1" or RsP.Fields("Activo")="2" or RsP.Fields("cenviocontra")="1"  or RsP.Fields("cenviocontra")="2" TheN
	     		varvisualiza="disabled"
       end if%>
                
                <td  class='e_td_string1' align="center" id="t<%=RsP.Fields("ID_PER")%>"><%if(RsP.Fields("preseleccionado")="9") then response.write("selected")end if%>
                 <%if(RsP.Fields("preseleccionado")="1") then response.write("selected")end if%> 
                  <%if(RsP.Fields("preseleccionado")="2") then response.write("selected")end if%>
                  <%if(RsP.Fields("preseleccionado")="3") then response.write("selected")end if%></td>

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

