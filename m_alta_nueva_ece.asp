<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"


varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lsUsuario = Request.Form("lsUsuario")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)



id_proyecto=session("id_proyecto")



		consulta1="dbo.uspGet_mostra_alta_ece  '"&varccdd&"', '"&varccpp&"', '"&varccdi&"', '"&id_proyecto&"' "

		
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
            <table width='98%' class="tabla2">
</table>
                <table width='98%' border="1" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3" >
    <tr style="font-size:11px">
      <th width="5%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">N&deg;</th>
      <th width="9%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">DNI</th>
      <th width="28%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Cargo</th>
    <th width="24%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Nombre</th>
    <th width="14%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >fecha Inicio</th>
    <th width="11%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato" >Fecha fin</th>
    <th width="9%" bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato">Ingresar Alta</th>
    </tr>
  <% 	registro = 0	
			  dato = 0	
			  dato2=0			 	
		Do While Not RsP.EOF
			If registro Mod 2 = 0 Then
				clase = "e_tr_even"
			Else
				clase = "e_tr_odd"
			End If	
			cont = registro+1 	%>
  <tr class='<%=clase%>'>
    <td height="34" class='e_td_string1'><%response.Write(cont)%>    &nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("dni")%>
    <%If registro = 0 Then
 			dnist = RsP.Fields("id_Per_sale")&","
		Else
   		    dnist = dnist & RsP.Fields("id_Per_sale")&","
		End If
		%></td>
    <td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
    <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
    <td class='e_td_string1'><%=RsP.Fields("fechaIni")%></td>
    <td class='e_td_string1'><%=RsP.Fields("fechaFin")%></td>
    <td align="center" class='e_td_string1' id="T<%=RsP.Fields("id_Per_sale")%>"><img src="images/edita.gif" width="15" height="14" onclick="ingresar_Alta('<%=RsP.Fields("cod")%>')"/></td>
    <% dato = dato+1
		  lsRptaO1=0
			lsRptaO2=0		
				 %>		
    <% 
		registro = registro + 1
		dato2 = dato2+1 %>
    <%		RsP.MoveNext
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
          

