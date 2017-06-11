
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


lszona=request("txtzona")	'1501LIMA
lsseccion=request("txtseccion")	'150101LIMA

	
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
	

	'if valor=1 then 
	
	consulta1 = "EXEC dbo.uspGet_DatosCalificacionCV '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & id_proyecto & "', '" & lsConvCar &"', '"&lsvarzona&"', '"&lsvarseccion&"' "

	
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
<style type="text/css">
<!--
.Estilo1 {color: #FFFFFF}
.Estilo2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.Estilo4 {color: #FFFFFF; font-weight: bold; }
-->
</style>

    
                <table width='800px' border="1" cellpadding="0" style="vertical-align:top;" cellspacing="0" bordercolor="#DAE8F3" >
              
		      <tr style="font-size:12px; color:#FFFFFF" >
		        <th width="20px"  bgcolor="#0099FF" class="Estilo1 dato3" ><span class="Estilo2">
	            <input type="hidden" name="fdni" id="fdni" value="" />
	            N&deg;</span></th> 
                <th width="50px"  bgcolor="#0099FF" class="Estilo1 dato3" ><span class="Estilo2">DNI</span></th> 
                <th width="300px" bgcolor="#0099FF" class="Estilo1 dato3" ><span class="Estilo2">NOMBRE</span></th>
		        <th width="50px"  bgcolor="#0099FF" class="Estilo1 dato3" style="display:none" ><span class="Estilo2">EVALUACI&Oacute;N<BR>
  AUTOM&Aacute;TICA</span></th>
		        <th width="50px" bgcolor="#0099FF" class="Estilo1 dato3" style="display:none"><span class="Estilo2">VERIFICAR CV</span></th>
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
		      <tr style="font-size:9px; background:#CCCCCC" id="TR<%=RsP.Fields("dni")%>">
		        <td height="34" class='e_td_string1'><div align="center">
		          <%response.Write(cont)%>
	            </div></td>
               <% if RsP.Fields("maltrabajador")=1 then 
				
				c="bgcolor=""#FF0000"""
				%>
                
		        <td <%=c%> ><a href="#" class="titulo3" onClick="javascript:enviarcardDatos('<%=RsP.Fields("Dni")%>')"><%=RsP.Fields("Dni")%></td>
                <%else
				c=""
				%>
                 <td><div align="center"><%=RsP.Fields("Dni")%>
                 <img src = "images/buscar.jpg"  id = 'btnbuscar' name = 'btnbuscar'  style="cursor:pointer; " onClick="verificar_cv2(<%=RsP.Fields("Dni")%>)"/>	</div></td>
                <%end if%>
                <td <%=c%> ><div align="center" ><%=RsP.Fields("nombre")%></div></td>
		        <td <%=c%> style="display:none" ><div align="center" ><%=RsP.Fields("nota_automatica")%></div></td>
		        <td width="24%" <%=c%> style="display:none" ><img src="images/nivel.png" width="16" height="18" alt="" border="0" style="cursor: hand;" onClick="javascript:verificar_cv('<%=RsP.Fields("dni")%>')" /> <%=RsP.Fields("estado")%></td>
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
               <table width='90%' align='center'>
                  <tr>
                    <td class='subtitulo' colspan='4'><br>
                      <span class="Estilo4">No hay registros disponibles</span></td>
                  </tr>
</table>
		<% end If %>

