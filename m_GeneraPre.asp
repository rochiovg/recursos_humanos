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
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

cargo = Mid(plsCargo,2)



	'------------------------------CONTADOR  APROBADOS ------------------------------------
	SQLContCapac = "EXEC dbo.usp_count_Preseleccionados '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '" & lsConvCar & "', '"&id_proyecto&"'" 
	
	'response.write(SQLContCapac)
	Set wRsDataCapc	= Server.CreateObject("ADODB.Recordset") 
	wRsDataCapc.cursorlocation=3
	wRsDataCapc.Open SQLContCapac, MiCone, 3,3
	
	contadorPre	="0"
	If wRsDataCapc.RecordCount > 0 Then 
		contadorPre	=wRsDataCapc(0)
	End if
	
	set wRsDataCapc=nothing 
	
	
	SQLCon = "EXEC dbo.usp_count_pea_meta_preseleccion '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & cargo & "', '" & lsConvCar & "', '"&id_proyecto&"'" 
	
	

	Set wRsData	= Server.CreateObject("ADODB.Recordset") 
	wRsData.cursorlocation=3
	wRsData.Open SQLCon, MiCone, 3,3
	If wRsData.RecordCount > 0 Then 
		total	=wRsData(0)
	else
		total	="0"
	End if
	
	set wRsData=nothing 
	

	'--------------------LISTA PRESELECCION---------------------------------
		consulta1 = "EXEC dbo.uspGet_DatosPreseleccion1_cc '" & cargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '"&id_proyecto&"', '" & lsConvCar & "' "
		
response.Write(consulta1)
	
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

		 
	If  Not RsP.BOF And Not RsP.EOF  Then   %>
    
    
    
                <table width='151%' border="1" cellpadding="2" style="vertical-align:top;" cellspacing="2" bordercolor="#DAE8F3" >
                
               <tr>
                  <td colspan="12" align="left" ><span class="titulo">NOTA DE EX&Aacute;MEN : <%=vartitt%></span></td>
                  <td colspan="4" align="left" ><div align="right" ><span><span class="titulo"><img src="images/excell1.gif" onclick="reporte_preseleccion()"  width="32" height="29" /></td>
                  
                </tr>
                <tr>
                
<td colspan="16" ><div align="right" ><span><strong>Meta: <%=total%>&nbsp;&nbsp;&nbsp;&nbsp; Aprobados</strong></span>
    <input type="text" class='e_texto' id='txtCapacitacion' name='txtCapacitacion' maxlength="5" value="<%=contadorPre%>" style="width:50" disabled="true"></div></td>
              </tr>
		      <tr style="font-size:9px" >
		        <th  bgcolor="#DAE8F3" class="dato3" >N&deg;</th>
                
<%if id_proyecto="156" then%>                
                <th  bgcolor="#DAE8F3" class="dato3" >TIPO DE CANDIDATO</th>
                <th  bgcolor="#DAE8F3" class="dato3" >SEDE OPERATIVA</th>
<% end if %>
                
                <th  bgcolor="#DAE8F3" class="dato3" >DNI</th>
                
<%if id_proyecto<>"156" then%>          
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NRO. DE CONVOCATORIA</th>
        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">TIENPO DE CONTRATACI&Oacute;N</th>       
<% end if %>              
                <th bgcolor="#DAE8F3" class="dato3" >NOMBRE</th>
<%if id_proyecto<>"156" then%>                 
		        <th  bgcolor="#DAE8F3" class="dato3" >RUC</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >EDAD</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >NIVEL EDUCATIVO</th>
		        <th bgcolor="#DAE8F3" class="dato3" >TRABAJO EN GENERAL</th>
		        <th  bgcolor="#DAE8F3" class="dato3" ><strong>COORD. O SUP. DE OPERATIVOS DE APLICACION</strong></th>
		        <th bgcolor="#DAE8F3" class="dato3" ><strong>MANEJO DE GRUPOS</strong></th>
		        <th  bgcolor="#DAE8F3" class="dato3" >TRABAJO<BR>INEI</th>
		        <th  bgcolor="#DAE8F3" class="dato3" >PROYECTO</th>               
                <th  bgcolor="#DAE8F3" class="dato3" >NOTA CV</th>
<% end if %>                  
                <th  bgcolor="#DAE8F3" class="dato3" >NOTA PRE</th>
                <th  bgcolor="#DAE8F3" class="dato3" >ESTADO</th>
               <%if id_rol=31 then%>
                <th width="13%"  bgcolor="#DAE8F3" class="dato3" >EVALUAR</th>
<%if id_proyecto="156" then%>
                <th width="13%"  bgcolor="#DAE8F3" class="dato3" >OBSERVACIONES</th>
<% end if %>                  
                
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
			if  RsP.Fields("cenviocontra")="2" or RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
	     		varvisualiza="disabled=""disabled"""
		'	end if
        end if

	   end if

       %>
		        <td height="34" class='e_td_string1'><%response.Write(cont)%>
		          </td>
                
                
                 <% ' varvisualiza="enabled"
					'if id_rol<>31  then 
						'if  RsP.Fields("cenviocontra")="2" or RsP.Fields("cenviocontra")="3" or RsP.Fields("cenviocontra")="4" Then
						'	varvisualiza="disabled=""disabled"""
					'	end if
					'end if%>

<%if id_proyecto="156" then%>
				<td class='e_td_string1'><%=RsP.Fields("cargo")%></td>
				<td class='e_td_string1'><%=RsP.Fields("ccdd_i")%> <%=RsP.Fields("ccpp_i")%><%=RsP.Fields("ccdi_i")%></td>
                <td class='e_td_string1'><%=RsP.Fields("dni")%></td>
<% end if %>                    
                    
		        
<%if id_proyecto<>"156" then%>                 
                <td class='e_td_string1'>&nbsp;</td>
    <td class='e_td_string1'><%=RsP.Fields("nPeriodo_CCP")%><%=RsP.Fields("TipoP")%></td>
<% end if %>       
		        <td class='e_td_string1'><%=RsP.Fields("nombre")%></td>
<%if id_proyecto<>"156" then%>                     
		        <td class='e_td_string1'><%=RsP.Fields("ruc")%></td>
		        <td class='e_td_string1'><%=CalcularEdad(RsP.Fields("fec_nac"))%></td>
		        <td class='e_td_string1'><%=RsP.Fields("nivel")%></td>
		        <td class='e_td_string1'><%="A&ntilde;o:"&RsP.Fields("expgen_anio")&" Meses:"&RsP.Fields("expgen_meses")%></td>
		        <td class='e_td_string1'><%="A&ntilde;o:"&RsP.Fields("expCampo_anio")&" Meses:"&RsP.Fields("expCampo_meses")%></td>
		        <td class='e_td_string1'><%="A&ntilde;o:"&RsP.Fields("expGrupo_anio")&" Meses:"&RsP.Fields("expGrupo_meses")%></td>
		        <td class='e_td_string1'>&nbsp;<%=RsP.Fields("inei")%></td>
		        <td class='e_td_string1'>&nbsp;<%=RsP.Fields("proyecto")%></td>                 
                <td class='e_td_string1'>&nbsp;<%=RsP.Fields("nota_cv")%></td>
<% end if %>                  
                <td class='e_td_string1'>&nbsp;<span class="etiqueta">
                  <input <%=varvisualiza%> name="NotaPre<%=RsP.Fields("id_per")%>"validchars="0123456789" class="etiqueta"  type="text" onKeyPress="return fs_numeros_dec(event)" id="NotaPre<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("NotaPreCap")%>"  onblur="guardarPRECAP('NotaPre','<%=RsP.Fields("id_per")%>',this.value)" size="5" maxlength="4" />
                </span></td>
                <td class='e_td_string1'>&nbsp;<div id="tr<%=RsP.Fields("ID_PER")%>" ><%=RsP.Fields("estado_pre")%></div></td>
				

                <%if id_rol=31 then%>
				
				
                <td  class='e_td_string1' align="center" id="t<%=RsP.Fields("ID_PER")%>"> <select <%=varvisualiza%>  style="font-size:10px"  name="<%=RsP.Fields("ID_PER")%>" id="<%=RsP.Fields("ID_PER")%>" onfocus="valorinicial(this.value,this.id)" onchange="f_contador_pre1(this.id,'<%=RsP.Fields("nombre")%>','<%=RsP.Fields("ID_PER")%>',this.value,'<%=lsUsuario%>')">
                  <option value="9" <%if(RsP.Fields("preseleccionado")="9") then response.write("selected")end if%>>Seleccione...</option>
                  <option value="1" <%if(RsP.Fields("preseleccionado")="1") then response.write("selected")end if%> >Aprobado</option>
                  <option value="2" <%if(RsP.Fields("preseleccionado")="2") then response.write("selected")end if%>>Desaprobado</option>
                  <option value="3" <%if(RsP.Fields("preseleccionado")="3") then response.write("selected")end if%>>Aprobado No Seleccionado</option>
                   <option value="4" <%if(RsP.Fields("preseleccionado")="4") then response.write("selected")end if%>>No rindi&oacute; la prueba</option>
                    <option value="5" <%if(RsP.Fields("preseleccionado")="5") then response.write("selected")end if%>>Desaprobado - Observado por MINEDU</option>
                </select></td>

<%if id_proyecto="156" then%>				

				<td class='e_td_string1'>&nbsp;<span class="etiqueta">
                  <input <%=varvisualiza%> name="ObsPresel<%=RsP.Fields("id_per")%>" class="etiqueta"  type="text"  id="ObsPresel<%=RsP.Fields("id_per")%>" value="<%=RsP.Fields("ObsPreseleccion")%>"  onblur="guardarPRECAP('OBSERVACION','<%=RsP.Fields("id_per")%>',this.value)" size="30" maxlength="800" />
                </span></td>

                
<% end if %>                
                
<% end if %>


               
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

