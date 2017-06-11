
<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
		 	
id_proyecto=session("id_proyecto") 


Function CalcularEdad(fechaN)
If IsNull(fechaN) then wEdad = 0: Exit Function
wEdad = DateDiff("yyyy", fechaN, Now)
If Date <> DateSerial(Year(Now), Month(fechaN), Day(fechaN)) Then
wEdad = wEdad - 1
End If
wEdad = CInt(wEdad)
Response.Write(wEdad)
End Function


Response.ContentType="text/html; charset=iso-8859-1"

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


	'if valor=1 then 
	
	consulta1 = "EXEC dbo.uspGet_DatosCalificacionCV_ece '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & id_proyecto & "', '" & lsConvCar & "'" 

	
	Set RsP	= Server.CreateObject("ADODB.Recordset") 
	RsP.cursorlocation=3
	RsP.Open consulta1, MiCone, 3,3

'end if 	
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
    
                <table width='60%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
              
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" ><input type="hidden" name="fdni" id="fdni" value="" />
	            N&deg;</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th> 
                <th bgcolor="#DAE8F3" class="dato3" >NOMBRE</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >EVALUACI&Oacute;N<BR>AUTOM&Aacute;TICA</th>
		        <th bgcolor="#DAE8F3" class="dato3" >VERIFICAR CV</th>
		        </tr>
		      <% 	
			  
			  
			  registro = 0					
		Do While Not RsP.EOF
		response.Flush()
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			

			cont = registro+1 %>
		      <tr style=" font-size:9px;" id="TR<%=RsP.Fields("dni")%>">
		        <td height="34" class='e_td_string1'><%response.Write(cont)%>
	            </td>
                <% if RsP.Fields("maltrabajador")=1 then 
				
				c="bgcolor=""#FF0000"""
				%>
		        <td <%=c%> ><a href="#" class="titulo3" onClick="javascript:enviarcardDatos('<%=RsP.Fields("Dni")%>')"><%=RsP.Fields("Dni")%></td>
                <%else
				c=""
				%>
                 <td  ><%=RsP.Fields("Dni")%></td>
                <%end if%>
                <td <%=c%> ><%=RsP.Fields("nombre")%></td>
		        <td <%=c%> ><%=RsP.Fields("nota_automatica")%></td>
		        <td <%=c%> ><img src="images/nivel.png" width="16" height="18" alt="" border="0" style="CURSOR: hand" onClick="javascript:verificar_cv('<%=RsP.Fields("dni")%>')" /> <%=RsP.Fields("estado")%></td>
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

