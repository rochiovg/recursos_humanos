<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 

<%
Response.ContentType="text/html; charset=iso-8859-1"	

Server.ScriptTimeout = 1800 
	 	 
id_proyecto=session("id_proyecto") 
varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsConvCar=Request.Form("lsConvCar")
VALOR=Request.Form("VALOR")

id_rol=Session("txtTipoUsuarioValido")

lszona=request("txtzona")	'1501LIMA
lsseccion=request("txtseccion")	'150101LIMA
	
	
estados=Request.Form("estados")
	
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
	
	

	SQLContCapac = "EXEC dbo.usp_count_aprovo_automatica '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"', '"&lsvarzona&"', '"&lsvarseccion&"' "

	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorPre	=wRsDataCapc(0)
	else
		contadorPre	="0"
	End if

 

		consulta1 = "EXEC dbo.pa_ficha_datos_automatica '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"', '"&lsvarzona&"', '"&lsvarseccion&"', '"&estados&"' "
		
		
		
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
                  <td colspan="15" align="left" ><span class="titulo"> <%=vartitt%></span></td>
                </tr>
                <tr>
                
<td colspan="14" ><div align="right" ><span>Aprobados</span>
<input type="text" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true"></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>     
                <th bgcolor="#DAE8F3" class="dato3" >NOMBRE</th>
                
                <th  bgcolor="#DAE8F3" class="dato3" >ZONA</th>     
                <th bgcolor="#DAE8F3" class="dato3" >SECCION</th>
                
		        <th  bgcolor="#DAE8F3" class="dato3" >RUC</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >EDAD</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >NIVEL EDUCATIVO</th>
		        
		        <!--<th  bgcolor="#DAE8F3" class="dato3" >TRABAJO<BR>INEI</th>-->
		        <!--<th  bgcolor="#DAE8F3" class="dato3" >PROYECTO</th>-->
                <th  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
                <th  bgcolor="#DAE8F3" class="dato3" >VER FICHA</th>
              

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
                
		        <td class='e_td_string1'  align="center" ><%=RsP.Fields("dni")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>

		        <td class='e_td_string1' align="center"><%=RsP.Fields("zona_i")%></td>
				<td class='e_td_string1' align="center"><%=RsP.Fields("seccion_i")%></td>
                                
		        <td class='e_td_string1'  align="center"><%=RsP.Fields("ruc")%></td>
		        <td class='e_td_string1'  align="center"><%=RsP.Fields("edad")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nivel")%></td>
<!--		        <td class='e_td_string1'>&nbsp;<%=RsP.Fields("inei")%></td>-->
<!--		        <td class='e_td_string1'>&nbsp;<%=RsP.Fields("proyecto")%></td>-->
				
                <%  varvisualiza="enabled"
		
       if RsP.Fields("Activo")="1" or RsP.Fields("Activo")="2" or RsP.Fields("cenviocontra")="1"  or RsP.Fields("cenviocontra")="2" TheN
	     		varvisualiza="disabled"
       end if%>
                
                <td  class='e_td_string1' align="center" id="t<%=RsP.Fields("ID_PER")%>"><%if id_proyecto=99  then 
 	if RsP.Fields("Aprobo_automatica")="1"	then
	response.Write("APROBADO")
	else		
	response.Write("DESAPROBADO")
	end if
				else %>
                
                <%if ( id_rol = 31 or id_rol = 7 )    then%> <!------- SOLO PARA ROL ADMINISTRADOR - EDNOM 2016----------------- -->
                	
                <%	if RsP.Fields("Aprobo_automatica")="1"	then
					response.Write("PRESELECCIONADO")
					else		
					response.Write("NO PRESELECCIONADO")
					end if  %>
	

                
                <!-- select  style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onfocus="valorinicial(this.value,this.id)" onchange="f_contador_pre1(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
                  <option value="9" <%if(RsP.Fields("Aprobo_automatica")="9") then response.write("selected")end if%>>Seleccione...</option>
                  <option value="1" <%if(RsP.Fields("Aprobo_automatica")="1") then response.write("selected")end if%> >Aprobado</option>
                  <option value="2" <%if(RsP.Fields("Aprobo_automatica")="2") then response.write("selected")end if%>>Desaprobado</option>
                </select -->
                
                <%else%>
                
                <%
					if RsP.Fields("Aprobo_automatica")="1"	then
					response.Write("APROBADO")
					else		
					response.Write("DESAPROBADO")
					end if
	
				%>
                
                
                <%end if%>
                
                
                <%end if%></td>
			<td class='e_td_string1'><a href="http://desarrollo/RRHH/censo/convoca/declaracion.asp?id=<%=RsP.Fields("id_convocatoriacargo")%>&p=<%=id_proyecto%>&dni=<%=RsP.Fields("dni")%>"  target="_blank"> Ficha </a></td>
          

               
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

