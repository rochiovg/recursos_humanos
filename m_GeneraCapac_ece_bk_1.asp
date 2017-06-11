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

id_rol=Session("txtTipoUsuarioValido")



cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,3)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,4,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,6,2)

cargo = Mid(plsCargo,2)

	SQLContCapac = "EXEC dbo.usp_count_capacita_ece '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '"&id_proyecto&"', '"&lsConvCar&"' " 
	
	


	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	If wRsDataCapc.RecordCount > 0 Then 
		contadorPre	=wRsDataCapc(0)
	else
		contadorPre	="0"
	End if



		consulta1 = "EXEC dbo.pa_ficha_capacita_ece'" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '"&lsConvCar&"'" 
	
	
		
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
                  <td colspan="21" align="left" ><span class="titulo">NOTA DE EX&Aacute;MEN : <%=vartitt%> &nbsp;&nbsp;&nbsp;<img src="images/excell1.gif" onclick="verReporte_cap(1)"  width="32" height="29" /></span></td>
                </tr>
                <tr>
                
<td colspan="21" ><div align="right" ><span>Aprobados</span>
<input type="text" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true"></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>
                 <th  bordercolor="#DAE8F3" class="dato3"  bgcolor="#DAE8F3"  >Tipo de Candidato</th>
                <th   bordercolor="#DAE8F3"   bgcolor="#DAE8F3" class="dato3"  >Sede</th>     
                <th bgcolor="#DAE8F3" class="dato3" >NOMBRE</th>
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 1</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 2</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 3</th> 
                <%IF lsConvCar=1831 OR lsConvCar=1832 OR lsConvCar=1841 or plsCargo=2971 or lsConvCar=2697 or lsConvCar=2698 THEN %>
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 4</th> 
                <th  bgcolor="#DAE8F3" class="dato3" >CRITERIO 5</th> 
                <%END IF%>
                <th  bgcolor="#DAE8F3" class="dato3" >NOTA FINAL</th>               
                <th  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
                <%if id_rol=34 then 
				
				else%>
                <th  bgcolor="#DAE8F3" class="dato3" >EVALUAR</th>
          <%END IF%>

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
	    
			if RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
	     		varvisualiza="disabled=""disabled"""
			end if
       END IF

	    %>

		        <td height="34" class='e_td_string1'><%response.Write(cont)%> </td>
                
		        <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
                <td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
                <td class='e_td_string1'><%=RsP.Fields("sedeOperativa")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
		        
                 <td align="center" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%>  name="txtp1<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtp1<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p1")%>"  onblur="guardarCAPA('p1','<%=RsP.Fields("id_per")%>',this.value, '1', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            <td width="202" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%> name="txtp2<%=RsP.Fields("id_per")%>" onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtp2<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p2")%>"  onblur="guardarCAPA('p2','<%=RsP.Fields("id_per")%>',this.value, '2', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            <% if RsP.Fields("id_convocatoriacargo")=1831 or RsP.Fields("id_convocatoriacargo")=1832 or RsP.Fields("id_convocatoriacargo")=1841  then
			tam=2
			else
			tam=5
			end if
			 %>
            <td width="207" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%> name="txtp3<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros_dec(event)" class="etiqueta"  type="text" id="txtp3<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p3")%>"  onblur="guardarCAPA('p3','<%=RsP.Fields("id_per")%>',this.value, '3', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="<%=tam%>" />
            </span></td>
            <%IF lsConvCar=1831 OR lsConvCar=1832 OR lsConvCar=1841 or plsCargo=2971 or lsConvCar=2697 or lsConvCar=2698 THEN %>
              <td width="207" class='e_td_string1'><span class="etiqueta">
              <input  <%=varvisualiza%>  name="txtp4<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtp4<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p4")%>"  onblur="guardarCAPA('p4','<%=RsP.Fields("id_per")%>',this.value, '4', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            <td width="207" class='e_td_string1'><span class="etiqueta">
              <input <%=varvisualiza%> name="txtp5<%=RsP.Fields("id_per")%>"onKeyPress="return fs_numeros(event)" class="etiqueta"  type="text" id="txtp5<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("p5")%>"  onblur="guardarCAPA('p5','<%=RsP.Fields("id_per")%>',this.value, '5', <%=RsP.Fields("id_convocatoriacargo")%>)" size="5" maxlength="2" />
            </span></td>
            <%END IF%>
                <td width="357" class='e_td_string1'><div id="txtprom<%=RsP.Fields("id_per")%>"><%=RsP.Fields("notacap")%></div></td>
				
                <td class='e_td_string1'><div id="txtaprob<%=RsP.Fields("id_per")%>"><%=RsP.Fields("estado")%></div></td>
                
       <%if id_rol=34 then 
				
				else%>
                
                <td  class='e_td_string1' align="center" id="t<%=RsP.Fields("ID_PER")%>"><select <%=varvisualiza%>  style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onfocus="valorinicial(this.value,this.id)" onchange="f_contador_pre1(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
                  <option value="9" <%if(RsP.Fields("capacita")="9") then response.write("selected")end if%>>Elija Opci&oacute;n...</option>
                  <option value="1" <%if(RsP.Fields("capacita")="1") then response.write("selected")end if%> >Aprobado</option>
                  <option value="2" <%if(RsP.Fields("capacita")="2") then response.write("selected")end if%>>Desaprobado</option>
                  <option value="3" <%if(RsP.Fields("capacita")="3") then response.write("selected")end if%>>No rindi&oacute; la prueba</option>
                </select></td>
<% END IF %>


               
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

