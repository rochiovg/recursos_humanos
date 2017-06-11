<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
Response.ContentType="text/html; charset=iso-8859-1"	

id_proyecto=session("id_proyecto") 
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsConvCar=Request.Form("lsConvCar")
Server.ScriptTimeout = 1800 

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


sub generaCargoCambio()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_cargoscambio_listar_cam  '"&id_proyecto&"', '"&lsConvCar&"' ")
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo1"" name=""cmbCargo1"" >"
	
	Response.Write " <option value=""0"">Todos</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='TIPO: "&wRsDptoapli(4)&" - NUMERO: "&wRsDptoapli(3)&"'   value=""" &wRsDptoapli(0)&"*"&wRsDptoapli(1)& """>" &wRsDptoapli(2) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub



		consulta1 = "EXEC dbo.PA_CAMBIO_CARGO_LISTAR_ece '" & plsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"' " 
		
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
    <br>
    <br>
                <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
                
               <tr>
                  <td colspan="7" align="left" ><span class="titulo">CARGO A CAMBIAR: <%generaCargoCambio()%></span></td>
                  <td align="left" ><input 
                        name='button2'  type='button' class="boton" 				
                        id='button2' 
                        onclick="javascript:cambiarCargo()" 
                        value='Cambiar'></td>
                  
                </tr>
		      <tr style="font-size:9px" >
		        <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >DEPARTAMENTO</th> 
                <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >PROVINCIA</th> 
                <th width="3%" rowspan="2"  bgcolor="#DAE8F3" class="dato3" >DISTRITO</th> 
        <th width="11%" rowspan="2"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CARGO</th>       
                <th colspan="3" bgcolor="#DAE8F3" class="dato3" >DATOS PERSONALES</th>
               </tr>
		      <tr style="font-size:9px" >
		        <th width="6%" bgcolor="#DAE8F3" class="dato3" >APELLIDOS Y NOMBRES</th>
		        <th width="11%"  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
		        <th width="4%"  bgcolor="#DAE8F3" class="dato3" >CAMBIAR</th>
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
                
		        <td class='e_td_string1'><%=RsP.Fields("DPTO")%></td>
                 <td class='e_td_string1'><%=RsP.Fields("PROV")%></td>
                  <td class='e_td_string1'><%=RsP.Fields("DIST")%></td>
    			<td class='e_td_string1'><%=RsP.Fields("CARGO")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
                <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
		        <td class='e_td_string1'><input  type="checkbox"  class=""  <% if RsP.Fields("p1")="1" then response.Write("checked=""checked""")  end if %> name="p1<%=RsP.Fields("ID_PER")%>"  onclick="alerta_datos('<%=RsP.Fields("ID_PER")%>',this,'<%=lsUsuario%>','1')" id="p1<%=RsP.Fields("ID_PER")%>" /></td>

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

