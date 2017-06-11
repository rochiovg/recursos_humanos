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

Server.ScriptTimeout = 1800 
	 	 
id_proyecto=session("id_proyecto") 
id_usuario=session("id_usuario") 
id_rol=Session("txtTipoUsuarioValido")


lsDPTO1=Request.Form("lsDPTO")
local=Request.Form("lsPROV")
aula=Request.Form("lsDIST")
preseleccion=Request.Form("capacitacion")

lsDPTO = Mid(lsDPTO1,1,2)


		contadorPre	="0"


		consulta1 = "EXEC dbo.uspGet_DatosPreseleccionCampo '" & lsDPTO & "', '" & local & "', '" & aula & "', '" & preseleccion & "', '" & id_proyecto & "' " 	
		

		
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open consulta1, MiCone, 3,3

	     
	If  Not RsP.BOF And Not RsP.EOF Then  
	AULA=RsP.Fields("Aula")
	LOCAL=RsP.Fields("LOCAL_A")%>
                <table width='100%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
                
               <tr>
                  <td colspan="13" align="left" ><span class="titulo">NOTA DE EX&Aacute;MEN DE PRESELECCI&Oacute;N&nbsp;&nbsp;<img src="images/excell1.gif" onclick="verReporte_pres(1)"  width="32" height="29" /></span></td>
                </tr>
                <tr>
                
<td colspan="12" ><DIV>LOCAL: <%=LOCAL%> - AULA: <%=AULA%> </DIV><div align="right" >
  <input type="hidden" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true"></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOMBRE</th>
        <th  bgcolor="#DAE8F3" class="dato3" >CARGO</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >SEDE</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >NIVEL EDUCATIVO</th>
		        
                <th  bgcolor="#DAE8F3" class="dato3" >NOTA CV</th>
                <th  bgcolor="#DAE8F3" class="dato3" >NOTA PRE</th>
                <th  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
               <%if id_rol=31  then %>
                <th width="13%"  bgcolor="#DAE8F3" class="dato3" >EVALUAR</th>
          <%end if%>
          

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
	   else
	   ' if id_rol="11"  or id_rol="34" then
			if RsP.Fields("cenviocontra")="2" or RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
	     		varvisualiza="disabled=""disabled"""
		'	end if
        end if

	   end if

       %>
       
		        <td height="34" class='e_td_string1'><%response.Write(cont)%>
		          </td>
                
                   
		        <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
                <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
    <td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("sede")%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nivel")%></td>
		        
                <td class='e_td_string1'>&nbsp;<%=RsP.Fields("nota_cv")%></td>
                <td class='e_td_string1'>&nbsp;<span class="etiqueta">
                  <input  <%=varvisualiza%> name="NotaPre<%=RsP.Fields("id_per")%>"validchars="0123456789" class="etiqueta"  type="text" onKeyPress="return fs_numeros_dec(event)" id="NotaPre<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("NotaPreCap")%>"  onblur="guardarPRECAP('<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="4" />
                </span></td>
                <td class='e_td_string1'>&nbsp;<div id="tr<%=RsP.Fields("ID_PER")%>" ><%=RsP.Fields("estado_pre")%></div></td>
				
                 <%  'varvisualiza="enabled"
					'if id_rol<>31  then 
						'if  RsP.Fields("cenviocontra")="2" or RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
							'varvisualiza="disabled=""disabled"""
						'end if
					'end if
					%>
                    
                	<%if id_rol=31  then %>
                <td  class='e_td_string1' align="center" id="t<%=RsP.Fields("ID_PER")%>"><select <%=varvisualiza%>  style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onfocus="valorinicial(this.value,this.id)" onchange="f_contador_pre1(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
                  <option value="9" <%if(RsP.Fields("preseleccionado")="9") then response.write("selected")end if%>>Seleccione...</option>
                  <option value="1" <%if(RsP.Fields("preseleccionado")="1") then response.write("selected")end if%> >Aprobado</option>
                  <option value="2" <%if(RsP.Fields("preseleccionado")="2") then response.write("selected")end if%>>Desaprobado</option>
                  <option value="3" <%if(RsP.Fields("preseleccionado")="3") then response.write("selected")end if%>>Aprobado No Seleccionado</option>
                  <option value="4" <%if(RsP.Fields("preseleccionado")="4") then response.write("selected")end if%>>No rindi&oacute; la prueba</option>
                </select></td>
                <%end if%>

        <% lsNivel= RsP.Fields("nivel")
		registro = registro + 1
		RsP.MoveNext
		Loop	
		RsP.close
		
		%>
        
        
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

