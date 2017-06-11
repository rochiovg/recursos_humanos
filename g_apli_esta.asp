<%@ Language=VBScript 
%>
 <%session.lcid=2057%>
<!-- #include file="Conexion.asp"  --> 
<%
Response.ContentType="text/html; charset=iso-8859-1"
varSede = Request.Form("lsDPTO")
varProv = Request.Form("lsprov")

varRol = Request.Form("lsRol")
varCargo = 7
varSsede = Mid(varSede,1,2)
cantSedeTot=len(varSede)
nomccdd = Mid(varSede,3,cantSedeTot-2)

varPprov = Mid(varProv,3,2)
cantProvTot=len(varProv)
nomccpp = Mid(varProv,5,cantProvTot-4)

	vartiCargo=mid(varRol,1,1)		'15
	lsVarCodCargo = len(varRol) '6
	varCargo=mid(varRol,2,lsVarCodCargo-1)	'LIMA

id_Proyecto=Session("id_proyecto")


		var1="block"
		var="none"
		num=17
			
			if vartiCargo="1" or vartiCargo="3" TheN
	     		var1="none"
				var="block"
				num=10
       		end if 

			consulta1 = "EXEC dbo.PA_FICHA_ESTADISTICAS '" & varSsede & "','" & varPprov & "','" & varCargo & "','" & vartiCargo & "','" & id_Proyecto & "' "  

		
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
			
		
	  If  Not RsP.BOF And Not RsP.EOF Then  

		   if varSsede<>"98" and  varSsede<>"99" then %>
<link href="Styles/inei.css" rel="stylesheet" type="text/css" />

                  <table  id="Exportar_a_Excel"  border="1" align="center" cellpadding="2" cellspacing="2"  bordercolor="#DAE8F3" style="font-family:Arial; font-size:10px"  >
                                  <tr>
                                    <th colspan="17" bgcolor="#F2F3F4"  class='dato3'><span class="aplicacion" style="height:30px">COBERTURA EN DEPARTAMENTO : <%=nomccdd%> / <%=nomccpp%></span></th>
                                  </tr>
                                  <tr bgcolor="#FFFFFF">
                                    <th colspan="17"  class='dato3' align="right"><div style="font-size:11px;"><%=NOW()%></div></th>
                                  </tr>
                                  <tr>
                                    <th width="23" rowspan="2" bgcolor="#F2F3F4"  class='dato3'> Nro</th>
                                    <th width="60" rowspan="2"  bgcolor="#F2F3F4"  class='dato3' >PROVINCIA</th>
                                    <th width="50" rowspan="2" bgcolor="#F2F3F4"  class="dato3">DISTRITO</th>
                                    <th width="50" rowspan="2" bgcolor="#F2F3F4"  class="dato3">INSCRITOS</th>
                                    <th colspan="3"  bgcolor="#CCEAE9" class='dato3'>Calificaci&oacute;n Autom&aacute;tica</th>
                                    <th width="76" bgcolor="#339966" colspan="3" class='dato3'  >Evaluaci&oacute;n de CVs</th>
                                    <th colspan="2" bgcolor="#FF9933"  class='dato3' >Entrevista y Evaluaci&oacute;nd e Competencias</th>
                                    <th colspan="3" bgcolor="#EA95FF"  class='dato3'   >RESULTADO PROMEDIOS</th> <th colspan="3" bgcolor="#7691FA" class='dato3'   >SELECCI&Oacute;N</th>                                </tr>
                                  <tr>
                                    <th width="25"  bgcolor="#E1F2F2" class='dato3'>Desaprobados</th>
                                    <th width="44" bgcolor="#E1F2F2"  class='dato3'>Aprobados</th>
                                    <th width="55" bgcolor="#E1F2F2"  class='dato3'>% Aprobados</th>
                                    <th   bgcolor="#D5F0E2"  class='dato3'>Desaprobados</th>
 <th   bgcolor="#D5F0E2"  class='dato3'>Aprobados</th>
 <th   bgcolor="#D5F0E2"  class='dato3'>% Aprobados</th>
                                    <th width="70" bgcolor="#FFD5AA"  class='dato3'>Entrevistados</th>
                                    <th width="69" bgcolor="#FFD5AA"  class='dato3'>Evaluaci&oacute;n de Competencias</th>
                                    <th width="28"    bgcolor="#F7D7FF"  class='dato3'>Descalificados</th>
                                 
                                    <th width="52"    bgcolor="#F7D7FF"  class='dato3'>Aptos</th>
                                    <th width="89"    bgcolor="#F7D7FF"  class='dato3'>%Aptos</th>
                                    <th width="63" bgcolor="#D8DFFE"  class='dato3'>Seleccionados</th>
                                    <th width="63" bgcolor="#D8DFFE"  class='dato3'>META DE CONTRATACI&Oacute;N</th>
                                    <th width="89" bgcolor="#D8DFFE"  class='dato3'>%Seleccioandos (Respecto a al Meta)</th>
                                    
                                  </tr>
                                  <% 	registro = 0					
                            Do While Not RsP.EOF
                            
                            
                                If registro Mod 2 = 0 Then
                                    clase = "e_tr_even"
                                Else
                                    clase = "e_tr_odd"
                                End If	
                                cont = registro+1 
                           
                            if met = 0 then 
                            cobertura = 0 
                            else 
                            cobertura= CINT((prese/met)*100) 
                            end if
                            			



							if prog = 0 then 
                            cobertura2 = 0 
                            else 
                            cobertura2= CINT((prese/prog)*100) 
                            end if

                             '  if RsP.Fields("ccdd")<>"15" then %>
                                  <tr class='<%=clase%>'>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%response.Write(cont)%>
                                      &nbsp;</td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("prov")%></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("dist")%>
                                    </td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;"><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%=RsP.Fields("desaproboAuto")%></td>
                                     <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%=RsP.Fields("aproboAuto")%></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("insc"),RsP.Fields("aproboAuto"))%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("desaproboCV")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("aproboCV")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("aproboAuto"),RsP.Fields("aproboCV"))%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("totalEntr")%></span></td>
                                   
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("totaLFinPSi")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("descalificados")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal; " ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("Aptos")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("totaLFinPSi"),RsP.Fields("aptos"))%>%</td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("SeleccionadosT")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("metaCon")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px;color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("SeleccionadosT"))%>%</td>
                                    <% 
                    'tmeta= tmeta + CInt(RsP.Fields("meta"))
					'tmetacapa=tmetacapa + CInt(RsP.Fields("meta_capa"))
					tmetacon=tmetacon + CInt(RsP.Fields("metacon"))
					'tprog= tprog + CInt(RsP.Fields("prog"))
					'tApt= tApt + CInt(RsP.Fields("aprob"))
					tIns= tIns + CInt(RsP.Fields("insc"))
					tDesAuto= tDesAuto + CInt(RsP.Fields("desaproboAuto"))
					tAprAuto= tAprAuto + CInt(RsP.Fields("aproboAuto"))
					tDesCV= tDesCV + CInt(RsP.Fields("desaproboCV"))
					tAprCV= tAprCV + CInt(RsP.Fields("aproboCV"))
					tEntrev= tEntrev + CInt(RsP.Fields("totalEntr"))
					tPsico= tPsico + CInt(RsP.Fields("totaLFinPSi"))
					tDescal= tDescal + CInt(RsP.Fields("descalificados"))
					tAptos = tAptos + CInt(RsP.Fields("aptos"))
					tSelecc = tSelecc + CInt(RsP.Fields("SeleccionadosT"))

					if tmeta = 0 then
					 cober =0 
					 else 
					 cober = cint((tSelecc/tmetacon)*100) 
					 end if
					
					if tprog = 0 then 
					cober2 =0 
					else 
					cober2 = cint((tSele/tprog)*100) 
					end if
                            registro = registro + 1
                            RsP.MoveNext
                            Loop	
                            RsP.close %>
                                  </tr>
<% %>
                                  <tr  >
                                    <td colspan="3" bgcolor="#D7F2FF" ><div class="proyecto">TOTAL </div></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' ><strong><%=tIns%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=tDesAuto%></strong></td>
                                    <td  
                                   bgcolor="#D7F2FF" class='e_td_string1'  ><%=tAprAuto%></td>
                                    <td  
                                   bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=porcentaje(tIns,tAprAuto)%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=tDesCV%></strong></td>
                                     <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=tAprCV%></strong></td>
                                    <td   bgcolor="#D7F2FF" class='e_td_string1' ><%=porcentaje(tAprAuto,tAprCV)%> %</td>

                                    <td   bgcolor="#D7F2FF" class='e_td_string1' ><strong><%=tEntrev%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' ><%=tPsico%></td>
                                    <td     bgcolor="#D7F2FF" class='e_td_string1' >&nbsp;<strong><%=tDescal%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'   ><%=tAptos%></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' ><%=porcentaje(tPsico,tAptos)%>%</td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' >&nbsp;<strong><%=tSelecc%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' >&nbsp;<strong><%=tmetacon%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong>&nbsp;<%=porcentaje(tmetacon,tSelecc)%>%</strong></td>
                                  </tr>

                                  
                                  
                                  
                                </table>
           <% end if %>
     
          <% if varSsede="98"  then  %>
          	
<table width='90%'  id="Exportar_a_Excel"  border="1" align="center" cellpadding="2" cellspacing="2"  bordercolor="#DAE8F3" style="font-family:Arial; font-size:10px" >
               
                
                  <tr>
                    <th colspan="18" bgcolor="#F2F3F4"  class='dato3'><span class="aplicacion" style="height:30px">COBERTURA  POR PROVINCIAS</span></th>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <th colspan="18"  class='dato3' align="right" > <div style="font-size:11px;"><%=NOW()%></div></th>
                  </tr>
                  <tr>
                    <th width="4%" rowspan="2" bgcolor="#F2F3F4"  class='dato3'> Nro</th>
                    <th width="10%" rowspan="2"  bgcolor="#F2F3F4"  class='dato3'>DEPARTAMENTO</th>
                    <th colspan="2" rowspan="2"  bgcolor="#F2F3F4"  class='dato3'>PROVINCIA</th>
                    <th width="50" rowspan="2" bgcolor="#F2F3F4"  class="dato3">INSCRITOS</th>
                    <th colspan="3"  bgcolor="#CCEAE9" class='dato3'>Calificaci&oacute;n Autom&aacute;tica</th>
                                    <th width="76" bgcolor="#339966" colspan="3" class='dato3'  >Evaluaci&oacute;n de CVs</th>
                                    <th colspan="2" bgcolor="#FF9933"  class='dato3' >Entrevista y Evaluaci&oacute;nd e Competencias</th>
                                    <th colspan="3" bgcolor="#EA95FF"  class='dato3'   >RESULTADO PROMEDIOS</th> <th colspan="3" bgcolor="#7691FA" class='dato3'   >SELECCI&Oacute;N</th>
                  </tr>
                  <tr>
                    <th width="25"  bgcolor="#E1F2F2" class='dato3'>Desaprobados</th>
                                    <th width="44" bgcolor="#E1F2F2"  class='dato3'>Aprobados</th>
                                    <th width="55" bgcolor="#E1F2F2"  class='dato3'>% Aprobados</th>
                                    <th   bgcolor="#D5F0E2"  class='dato3'>Desaprobados</th>
 <th   bgcolor="#D5F0E2"  class='dato3'>Aprobados</th>
 <th   bgcolor="#D5F0E2"  class='dato3'>% Aprobados</th>
                                    <th width="70" bgcolor="#FFD5AA"  class='dato3'>Entrevistados</th>
                                    <th width="69" bgcolor="#FFD5AA"  class='dato3'>Evaluaci&oacute;n de Competencias</th>
                                    <th width="28"    bgcolor="#F7D7FF"  class='dato3'>Descalificados</th>
                                 
                                    <th width="52"    bgcolor="#F7D7FF"  class='dato3'>Aptos</th>
                                    <th width="89"    bgcolor="#F7D7FF"  class='dato3'>%Aptos</th>
                                    <th width="63" bgcolor="#D8DFFE"  class='dato3'>Seleccionados</th>
                                    <th width="63" bgcolor="#D8DFFE"  class='dato3'>META DE CONTRATACI&Oacute;N</th>
                                    <th width="89" bgcolor="#D8DFFE"  class='dato3'>%Seleccioandos (Respecto a al Meta)</th>
                  </tr>
                  <% 	registro = 0					
            Do While Not RsP.EOF
			
			
                If registro Mod 2 = 0 Then
                    clase = "e_tr_even"
                Else
                    clase = "e_tr_odd"
                End If	
                cont = registro+1 
				'prese=CInt(RsP.Fields("totals"))
				'met=RsP.Fields("meta")
								
                            
                            if met = 0 then 
                            cobertura = 0 
                            else 
                            cobertura= (prese/met)*100
                            end if



							if prog = 0 then 
                            cobertura2 = 0 
                            else 
                            cobertura2= (prese/prog)*100
                            end if
                            			
				
			'	if RsP.Fields("ccdd")<>"15" then
				%>
                  <tr class='<%=clase%>'>
                    <td class='e_td_string1'><%response.Write(cont)%>
                      &nbsp;</td>
                    <td class='e_td_string1'><%=RsP.Fields("depa")%></td>
                    <td colspan="2" class='e_td_string1'><%=RsP.Fields("nombre")%>
                    </td>
                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;"><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%=RsP.Fields("desaproboAuto")%></td>
                                     <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%=RsP.Fields("aproboAuto")%></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("insc"),RsP.Fields("aproboAuto"))%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("desaproboCV")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("aproboCV")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("aproboAuto"),RsP.Fields("aproboCV"))%>%</span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("totalEntr")%></span></td>
                                   
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("totaLFinPSi")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("descalificados")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal; " ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("Aptos")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("totaLFinPSi"),RsP.Fields("aptos"))%>%</td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("SeleccionadosT")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("metaCon")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px;color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("SeleccionadosT"))%>%</td>
                    <% 
					 'tmeta= tmeta + CInt(RsP.Fields("meta"))
					'tmetacapa=tmetacapa + CInt(RsP.Fields("meta_capa"))
					tmetacon=tmetacon + CInt(RsP.Fields("metacon"))
					'tprog= tprog + CInt(RsP.Fields("prog"))
					'tApt= tApt + CInt(RsP.Fields("aprob"))
					tIns= tIns + CInt(RsP.Fields("insc"))
					tDesAuto= tDesAuto + CInt(RsP.Fields("desaproboAuto"))
					tAprAuto= tAprAuto + CInt(RsP.Fields("aproboAuto"))
					tDesCV= tDesCV + CInt(RsP.Fields("desaproboCV"))
					tAprCV= tAprCV + CInt(RsP.Fields("aproboCV"))
					tEntrev= tEntrev + CInt(RsP.Fields("totalEntr"))
					tPsico= tPsico + CInt(RsP.Fields("totaLFinPSi"))
					tDescal= tDescal + CInt(RsP.Fields("descalificados"))
					tAptos = tAptos + CInt(RsP.Fields("aptos"))
					tSelecc = tSelecc + CInt(RsP.Fields("SeleccionadosT"))

					if tmeta = 0 then
					 cober =0 
					 else 
					 cober = cint((tSelecc/tmetacon)*100) 
					 end if
					
					if tprog = 0 then 
					cober2 =0 
					else 
					cober2 = cint((tIns/tprog)*100) 
					end if
					
            registro = registro + 1
			'end if
			
            RsP.MoveNext
            Loop	
            RsP.close %>
                  </tr>
                  
                  <tr  >
                    <td colspan="4" bgcolor="#D7F2FF" ><div class="proyecto">TOTAL </div></td>
                    <td bgcolor="#D7F2FF" class='e_td_string1' ><strong><%=tIns%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=tDesAuto%></strong></td>
                                    <td  
                                   bgcolor="#D7F2FF" class='e_td_string1'  ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=tAprAuto%></span></td>
                                    <td  
                                   bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=porcentaje(tIns,tAprAuto)%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=tDesCV%></strong></td>
                                     <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=tAprCV%></strong></td>
                                    <td   bgcolor="#D7F2FF" class='e_td_string1' ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(tAprAuto,tAprCV)%> %</span></td>

                                    <td   bgcolor="#D7F2FF" class='e_td_string1' ><strong><%=tEntrev%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=tPsico%></span></td>
                                    <td     bgcolor="#D7F2FF" class='e_td_string1' >&nbsp;<strong><%=tDescal%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'   ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=tAptos%></span></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(tPsico,tAptos)%>%</span></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' >&nbsp;<strong><%=tSelecc%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' >&nbsp;<strong><%=tmetacon%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong>&nbsp;<%=porcentaje(tmetacon,tSelecc)%>%</strong></td>
                  </tr>
                 
</table>
            <% end if %>
  
                 <% if varSsede="99"  then  %>
     
          <table width='90%' border="1" align="center" cellpadding="2" cellspacing="2"  bordercolor="#DAE8F3"  id="Exportar_a_Excel2" style="font-family:Arial; font-size:10px" >
          
           
            <tr>
              <th colspan="18"  bgcolor="#F2F3F4"  class='dato3'><span class="aplicacion" style="height:30px">COBERTURA  POR DEPARTAMENTO</span></th>
            </tr>
            <tr>
              <th colspan="18"  bgcolor="#FFFFFF"  class='dato3' align="right" > <div style="font-size:11px;"><%=NOW()%></div></th>
            </tr>
            <tr>
              <th width="4%" rowspan="2" bgcolor="#F2F3F4"  class='dato3'>Nro</th>
              <th colspan="2" rowspan="2" bgcolor="#F2F3F4"  class='dato3'>DEPARTAMENTO</th>
              <th width="50" rowspan="2" bgcolor="#F2F3F4"  class="dato3">INSCRITOS</th>
              <th colspan="3"  bgcolor="#CCEAE9" class='dato3'>Calificaci&oacute;n Autom&aacute;tica</th>
                                    <th width="76" bgcolor="#339966" colspan="3" class='dato3'  >Evaluaci&oacute;n de CVs</th>
                                    <th colspan="2" bgcolor="#FF9933"  class='dato3' >Entrevista y Evaluaci&oacute;nd e Competencias</th>
                                    <th colspan="3" bgcolor="#EA95FF"  class='dato3'   >RESULTADO PROMEDIOS</th> <th colspan="3" bgcolor="#7691FA" class='dato3'   >SELECCI&Oacute;N</th>
            </tr>
            <tr>
              <th width="25"  bgcolor="#E1F2F2" class='dato3'>Desaprobados</th>
                                    <th width="44" bgcolor="#E1F2F2"  class='dato3'>Aprobados</th>
                                    <th width="55" bgcolor="#E1F2F2"  class='dato3'>% Aprobados</th>
                                    <th   bgcolor="#D5F0E2"  class='dato3'>Desaprobados</th>
 <th   bgcolor="#D5F0E2"  class='dato3'>Aprobados</th>
 <th   bgcolor="#D5F0E2"  class='dato3'>% Aprobados</th>
                                    <th width="70" bgcolor="#FFD5AA"  class='dato3'>Entrevistados</th>
                                    <th width="69" bgcolor="#FFD5AA"  class='dato3'>Evaluaci&oacute;n de Competencias</th>
                                    <th width="28"    bgcolor="#F7D7FF"  class='dato3'>Descalificados</th>
                                 
                                    <th width="52"    bgcolor="#F7D7FF"  class='dato3'>Aptos</th>
                                    <th width="89"    bgcolor="#F7D7FF"  class='dato3'>%Aptos</th>
                                    <th width="63" bgcolor="#D8DFFE"  class='dato3'>Seleccionados</th>
                                    <th width="63" bgcolor="#D8DFFE"  class='dato3'>META DE CONTRATACI&Oacute;N</th>
                                    <th width="89" bgcolor="#D8DFFE"  class='dato3'>%Seleccioandos (Respecto a al Meta)</th>
            </tr>
            <% 	registro = 0					
            Do While Not RsP.EOF
			
			
                If registro Mod 2 = 0 Then
                    clase = "e_tr_even"
                Else
                    clase = "e_tr_odd"
                End If	
                cont = registro+1 
				'prese=CInt(RsP.Fields("totals"))
				'met=CInt(RsP.Fields("meta"))
								
                            
                            if met = 0 then 
                            cobertura = 0 
                            else 
                            cobertura= CINT((prese/met)*100) 
                            end if
		'	if RsP.Fields("ccdd")<>"15" then	%>
            <tr class='<%=clase%>'>
              <td class='e_td_string1'><%response.Write(cont)%>
                &nbsp;</td>
              <td colspan="2" class='e_td_string1'><%=RsP.Fields("nombre")%></td>
              <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;"><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%=RsP.Fields("desaproboAuto")%></td>
                                     <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%=RsP.Fields("aproboAuto")%></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("insc"),RsP.Fields("aproboAuto"))%>%</span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("desaproboCV")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("aproboCV")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("aproboAuto"),RsP.Fields("aproboCV"))%>%</span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("totalEntr")%></span></td>
                                   
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("totaLFinPSi")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("descalificados")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal; " ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("Aptos")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("totaLFinPSi"),RsP.Fields("aptos"))%>%</td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("SeleccionadosT")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=RsP.Fields("metaCon")%></span></td>
                                    <td class='e_td_string1' style="font-size:12px;color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("SeleccionadosT"))%>%</td>
              <% 
					 'tmeta= tmeta + CInt(RsP.Fields("meta"))
					'tmetacapa=tmetacapa + CInt(RsP.Fields("meta_capa"))
					tmetacon=tmetacon + CInt(RsP.Fields("metacon"))
					'tprog= tprog + CInt(RsP.Fields("prog"))
					'tApt= tApt + CInt(RsP.Fields("aprob"))
					tIns= tIns + CInt(RsP.Fields("insc"))
					tDesAuto= tDesAuto + CInt(RsP.Fields("desaproboAuto"))
					tAprAuto= tAprAuto + CInt(RsP.Fields("aproboAuto"))
					tDesCV= tDesCV + CInt(RsP.Fields("desaproboCV"))
					tAprCV= tAprCV + CInt(RsP.Fields("aproboCV"))
					tEntrev= tEntrev + CInt(RsP.Fields("totalEntr"))
					tPsico= tPsico + CInt(RsP.Fields("totaLFinPSi"))
					tDescal= tDescal + CInt(RsP.Fields("descalificados"))
					tAptos = tAptos + CInt(RsP.Fields("aptos"))
					tSelecc = tSelecc + CInt(RsP.Fields("SeleccionadosT"))

					if tmeta = 0 then
					 cober =0 
					 else 
					 cober = cint((tSelecc/tmetacon)*100) 
					 end if
					
					if tprog = 0 then 
					cober2 =0 
					else 
					cober2 = cint((tIns/tprog)*100) 
					end if
				'	end if 
            registro = registro + 1
            RsP.MoveNext
            Loop	
            RsP.close %>
            </tr>
            <tr >
              <td colspan="3" bgcolor="#D7F2FF" ><div class="proyecto">TOTAL </div></td>
              <td bgcolor="#D7F2FF" class='e_td_string1' ><strong><%=tIns%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=tDesAuto%></strong></td>
                                    <td  
                                   bgcolor="#D7F2FF" class='e_td_string1'  ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=tAprAuto%></span></td>
                                    <td  
                                   bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=porcentaje(tIns,tAprAuto)%>%</strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=tDesCV%></strong></td>
                                     <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong><%=tAprCV%></strong></td>
                                    <td   bgcolor="#D7F2FF" class='e_td_string1' ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(tAprAuto,tAprCV)%> %</span></td>

                                    <td   bgcolor="#D7F2FF" class='e_td_string1' ><strong><%=tEntrev%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=tPsico%></span></td>
                                    <td     bgcolor="#D7F2FF" class='e_td_string1' >&nbsp;<strong><%=tDescal%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'   ><span class="e_td_string1" style="font-size:12px; color:#005279; font-style:normal;"><%=tAptos%></span></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' ><span class="e_td_string" style="font-size:12px; color:#005279; font-style:normal;"><%=porcentaje(tPsico,tAptos)%>%</span></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' >&nbsp;<strong><%=tSelecc%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1' >&nbsp;<strong><%=tmetacon%></strong></td>
                                    <td bgcolor="#D7F2FF" class='e_td_string1'  ><strong>&nbsp;<%=porcentaje(tmetacon,tSelecc)%>%</strong></td>
            </tr>
        
          </table>
                  
               <% end if 
		  
		  
		   function porcentaje(meta,avance)
		if (isnull(meta) or meta=0) then
			porcentaje= 0
		else
			porcentaje=CINT(100*avance/meta)
		end if
end function


			   
	end If%>