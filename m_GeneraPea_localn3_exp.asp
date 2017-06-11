<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=reporte_locales.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.Flush 



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
'varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
'nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
'varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
'nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
'varccdi = Mid(varccdiTot,5,2)

'cargo = Mid(plsCargo,2)

	'SQLContCapac = "EXEC dbo.usp_count_capacita '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"' " 
	
	


	'Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	'wRsDataCapc.cursorlocation=3
	'wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	'If wRsDataCapc.RecordCount > 0 Then 
	'	contadorPre	=wRsDataCapc(0)
'	else
'		contadorPre	="0"
'	End if



'		consulta1 = "EXEC dbo.pa_ficha_capacita'" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"'" 
		
	
	
	 usuario=Session("id_usuario")
 
	varccddTot = Request("lsDPTO")
	varccppTot = Request("lsPROV")

	
	varccdiTot = Request("lsDIST")
	plsCargo = Request("lsCargo")
	nivelrrhh=Request("nivelrrhh")
	lsConvocaroria=Request("lsConvocaroria")
	capacitacion=Request("capacitacion")
	idProyecto=Session("id_proyecto")
	id_usuario=  Session("id_usuario")
	
	
	  habilitado=""
	
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
	
	
	consulta1 = "EXEC dbo.pa_ficha_pea_locales_n3 '" & lsCargo & "', '" & varccdd & "', '" & varccppTot & "', '" & varccdiTot & "', '" & tipocargo & "', '" & idProyecto & "' , '" & capacitacion & "' " 

		
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
	     
	If  Not RsP.BOF And Not RsP.EOF Then  
	AULA=RsP.Fields("Aula")
	LOCAL=RsP.Fields("LOCAL_A")
	
	%>
    
    	
    
    
    
                <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
               
                <tr>
                
<td colspan="21" ><DIV>LOCAL: <%=LOCAL%> </DIV><div align="right" >
<input  type="hidden"  class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true"></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>
                 <th  bordercolor="#DAE8F3" class="dato3"  bgcolor="#DAE8F3"  >Cargo</th>
                <th bgcolor="#DAE8F3" class="dato3" >NOMBRE</th>
               


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
		
        if RsP.Fields("Activo")="1" then
	   varvisualiza="disabled=""disabled"""
	  	ELSE 
	    
			if id_rol<>31  then
				if RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
					varvisualiza="disabled=""disabled"""
				end if
			end if
		
       END IF

	    %>

		        <td height="34" class='e_td_string1'><%response.Write(cont)%> </td>
                
		        <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
                <td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
		        
               
				
                
       


               
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

