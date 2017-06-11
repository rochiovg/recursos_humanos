<%@ Language=VBScript 
%>
<!-- #include file="Conexion.asp"  --> 

<%
Response.ContentType="text/html; charset=iso-8859-1"

varSede = Request.Form("lsDPTO")
varRol = Request.Form("lsRol")
id_proyecto=Session("id_proyecto") 
codigoMeta=Session("codigoProyecto")


if 	varRol="" or isnull(varRol) then 
	varCargo="0"
	vartiCargo="0"
	varCCargo="0"
else
varRol=split(varRol, "*")
vartiCargo=varRol(0)
varCargo=varRol(1)
varCCargo=varRol(2)
end if

if id_proyecto=103  then  


consulta1 = "EXEC dbo.PA_FICHA_ESTADISTICAS_WELCOME_ECE_DEMO '99','99','" & varCargo & "','" & vartiCargo & "','" & id_Proyecto & "', '"&varCCargo&"', '"& codigoMeta &"' "  

end if

if id_proyecto = 139 then

consulta1 = "EXEC dbo.PA_FICHA_ESTADISTICAS_WELCOME_EDNOM_DEMO '99','99','" & varCargo & "','" & vartiCargo & "','" & id_Proyecto & "', '"&varCCargo&"', '"& codigoMeta &"' "  
end if



			
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
			
		
	  If  Not RsP.BOF And Not RsP.EOF Then  
%>



<table id="Exportar_a_Excel" align="left" style="font-family:Arial;  font-size:10px">
          
           
            <tr  height="10px">
              <th colspan="18"  bgcolor="#F2F3F4"  ><span class="aplicacion" style="height:30px">COBERTURA  POR SEDE REGIONAL</span></th>
            </tr>
            <tr>
              <th width="19" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">Nro</th>
              <th width="118"  rowspan="2" bgcolor="#F2F3F4" style="font-size:11px; width:120px !important">SEDE REGIONAL</th>
              
              <th width="60" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">META PRESELECCI&Oacute;N</th>
              <th width="60" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">META CAPACITACI&Oacute;N</th>
              <th width="60" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">META SELECCI&Oacute;N</th>
              
               <th width="57" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">INSCRITOS</th>
              
           <th bgcolor="#0285B7" colspan="2" style="font-size:11px;">Preselecci&oacute;n Autom&aacute;tica</th>  
                                                  <th bgcolor="#339966" colspan="4" style="font-size:11px;">Evaluaci&oacute;n de CVs</th>
                <th colspan="2" bgcolor="#EA95FF" style="font-size:11px;" >Preselecci&oacute;n</th> 
                                    <th colspan="2" bgcolor="#FF9933" style="font-size:11px;" >Capacitaci&oacute;n</th>
                                    <th colspan="2" bgcolor="#7691FA"   style="font-size:11px;">Selecci&oacute;n</th>
            </tr>
            <tr>
             <th width="53"   bgcolor="#B7DBFF"    style="font-size:10px;">Aprobados</th>
 <th width="53"   bgcolor="#B7DBFF"   style="font-size:10px;">% Aprobados</th>

 <th width="53"   bgcolor="#D5F0E2"    style="font-size:10px;">Fisicos</th>
 <th width="53"   bgcolor="#D5F0E2"    style="font-size:10px;">Pend Eval</th> 
 <th width="53"   bgcolor="#D5F0E2"    style="font-size:10px;">Aprobados</th>
 <th width="53"   bgcolor="#D5F0E2"    style="font-size:10px;">% Aprobados</th>
                                    <th width="53"    bgcolor="#F7D7FF"    style="font-size:10px;">Aprobados</th>
                                    <th width="53"    bgcolor="#F7D7FF"   style="font-size:10px;">% Aprobados</th>
                                    <th width="53" bgcolor="#FFD5AA"    style="font-size:10px;">Aprobados</th>
                                    <th width="53" bgcolor="#FFD5AA"    style="font-size:10px;">% Aprobados</th>
                                    
                                    <th width="73" bgcolor="#D8DFFE"   style="font-size:10px;">Seleccionados</th>
                                    <th width="102" bgcolor="#D8DFFE"   style="font-size:10px;">%Seleccionados </th>
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
            <tr class='<%=clase%>' height="10px" >
              <td   style="font-size:9px;"><%response.Write(cont)%>
                &nbsp;</td>
              <td style="font-size:9px; width:120px !important"  ><%=RsP.Fields("nombre")%></td>
              <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("metapre")%></span></td>
              <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("metacapa")%></span></td>
              <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("metaCon")%></span></td>
              <td  style="font-size:9px; color:#005279; font-style:normal;"><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
              
                                                  <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("aproboAuto")%> </span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metacapa"),RsP.Fields("aproboAuto"))%>%</span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("nro_cvs")%></span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("cv_faltante")%></span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("aproboCV")%></span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metacapa"),RsP.Fields("aproboCV"))%>%</span></td>
                                    
                                    <td  style="font-size:9px; color:#005279; font-style:normal; " ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("totaLpresel")%></span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metacapa"),RsP.Fields("totaLpresel"))%>%</td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("totaLCapa")%></span></td>
                                   
                                    <td  style="font-size:9px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("totaLCapa"))%>%</span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("SeleccionadosT")%></span></td>
                                    <td  style="font-size:9px;color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("SeleccionadosT"))%>%</td>
              <% 
					'tmeta= tmeta + CInt(RsP.Fields("meta"))
					'tmetacapa=tmetacapa + CInt(RsP.Fields("meta_capa"))
					tmetacon=tmetacon + CInt(RsP.Fields("metacon"))
					tmetacapa=tmetacapa + CInt(RsP.Fields("metacapa"))
					tmetapre=tmetapre + CInt(RsP.Fields("metapre"))
					'tprog= tprog + CInt(RsP.Fields("prog"))
					'tApt= tApt + CInt(RsP.Fields("aprob"))
					tIns= tIns + CInt(RsP.Fields("insc"))
					tAprCV= tAprCV + CInt(RsP.Fields("aproboCV"))
					txrev= txrev + CDbl(RsP.Fields("cv_faltante"))
					tnro_cvs= tnro_cvs + CDbl(RsP.Fields("nro_cvs"))
					tAprPresel= tAprPresel + CInt(RsP.Fields("totaLpresel"))
					tAprCapac= tAprCapac + CInt(RsP.Fields("totaLCapa"))
					tPsico= tPsico + CInt(RsP.Fields("totaLFinPSi"))
					tEntrev= tEntrev + CInt(RsP.Fields("totalEntr"))
					tSelecc = tSelecc + CInt(RsP.Fields("SeleccionadosT"))
					tAprAuto= tAprAuto + CInt(RsP.Fields("aproboAuto"))


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
            <tr  height="10px" >
              <td colspan="2" bgcolor="#D7F2FF"  style="font-size:9px;"><div class="proyecto">TOTAL </div></td>
              <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tmetapre%></span></td>
              <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tmetacapa%></span></td>
              <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tmetacon%></span></td>
               <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tIns%></span></td>
              
                                     <td bgcolor="#D7F2FF"   ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprAuto%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacapa,tAprAuto)%>%</span></td>
                                    
                                    
                                     <td bgcolor="#D7F2FF"   ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tnro_cvs%></span></td>
                                     <td bgcolor="#D7F2FF"   ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=txrev%></span></td>
                                     
                                     <td bgcolor="#D7F2FF"   ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprCV%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacapa,tAprCV)%>%</span></td>
                                    
                                    
                                    <td bgcolor="#D7F2FF"    ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprPresel%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacapa,tAprPresel)%>%</span></td>
                                    <td   bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprCapac%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacon,tAprCapac)%>%</span></td>
                                    <td bgcolor="#D7F2FF"  > <span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tSelecc%></span></td>
                                    <td bgcolor="#D7F2FF" ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;">&nbsp;<%=porcentaje(tmetacon,tSelecc)%>%</span></td>
            </tr>
        <tr  >
                                    <td  colspan="17" bgcolor="#D7F2FF" ><span class="alerta5" >(*) La cobertura de las tres primeras etapas de selecci&oacute;n est&aacute;n calculados en base a la meta de capacitaci&oacute;n y la cantidad de Aprobados por proceso.<br>
                                    (**) Los Porcentajes obtenidos en los procesos de selecci&oacute;n est&aacute;n calculados en base a la meta de selecci&oacute;n y los aprobados en cada proceso.</span></td>
                                  </tr>
          </table>
         
<%
end if


else 

			consulta1 = "EXEC dbo.PA_FICHA_ESTADISTICAS_WELCOME '99','99','" & varCargo & "','" & vartiCargo & "','" & id_Proyecto & "', '"&varCCargo&"', '"& codigoMeta &"' "  
		
			
			Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
			
		
	  If  Not RsP.BOF And Not RsP.EOF Then  
if varSede<>"99" then 
		  %>

<table width='100%' align="center" id="Exportar_a_Excel"  bordercolor="#DAE8F3" style="font-family:Arial; font-size:10px"  >
                                                   <tr bgcolor="#F3F3F3">
 
                                    <th colspan="10" >COBERTURA EN DEPARTAMENTO : <%=nomccdd%></th>
                                  </tr>
                                  <tr>
                                    <th height="22" colspan="10" align="right" > <div style="font-size:9px;"><%=NOW()%></div> </th>
                                  </tr>
                                  <tr>
                                    <th width="3%" bgcolor="#F2F3F4"  >Nro</th>
                                    <th width="26%"  bgcolor="#F2F3F4"   >PROVINCIA</th>
                                    <th width="23%" bgcolor="#F2F3F4"  >DISTRITO</th>
                                    <th width="14%" bgcolor="#F2F3F4"  >META INSCRIPCION</th>
                                    <th width="13%" bgcolor="#F2F3F4"  >INSCRITOS</th>
                                    <th width="13%" bgcolor="#F2F3F4"  >APROBAR CV</th>
                                    <th width="13%" bgcolor="#F2F3F4"  >PRESELECCION</th>
                                    <th width="13%" bgcolor="#F2F3F4"  >CAPACITACION</th>
                                    <th width="15%" bgcolor="#F2F3F4"   >SELECCION</th>
                                    <th width="6%" bgcolor="#F2F3F4"   >% COBERTURA<br />
                                    <span class="alerta5"> META SELECCION</span></th>
                                  </tr>
                                  <% 	registro = 0					
                            Do While Not RsP.EOF
                            
                            
                                If registro Mod 2 = 0 Then
                                    clase = "e_tr_even"
                                Else
                                    clase = "e_tr_odd"
                                End If	
                                cont = registro+1 
                                prese=CInt(RsP.Fields("insc"))
                                met=CInt(RsP.Fields("meta"))
								prog=CInt(RsP.Fields("prog"))
								con=CInt(RsP.Fields("meta_con"))
                            
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
                            if (RsP.Fields("prov") <> "0000000") then	
                                %>
                                  <tr class='<%=clase%>'>
                                    <td style="font-size:09px; color:#005279; font-style:normal;" ><%response.Write(cont)%>
                                      &nbsp;</td>
                                    <td style="font-size:09px; color:#005279; font-style:normal;"><%=RsP.Fields("prov")%></td>
                                    <td  style="font-size:09px; color:#005279; font-style:normal;"><%=RsP.Fields("dist")%>
                                    </td>
                                    <td  style="font-size:09px; color:#005279; font-style:normal;"><%=RsP.Fields("meta")%></td>
                                    <td style="font-size:09px; color:#005279; font-style:normal;" ><%=RsP.Fields("insc")%></td>
                                    <td style="font-size:09px; color:#005279; font-style:normal;" ><%=RsP.Fields("insc")%></td>
                                    <td style="font-size:09px; color:#005279; font-style:normal;" ><%=RsP.Fields("insc")%></td>
                                    <td style="font-size:09px; color:#005279; font-style:normal;" ><%=RsP.Fields("insc")%></td>
                                    <td style="font-size:09px; color:#005279; font-style:normal;" ><%=RsP.Fields("seleccionado")%></td>
                                    <td style="font-size:09px; color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("meta_con"),RsP.Fields("seleccionado"))%>%</td>
                                    <% 
                                    tmeta= tmeta + CInt(RsP.Fields("meta"))
									tmetacapa=tmetacapa + CInt(RsP.Fields("meta_capa"))
									tmetacon=tmetacon + CInt(RsP.Fields("meta_con"))
					tprog= tprog + CInt(RsP.Fields("prog"))
					tApt= tApt + CInt(RsP.Fields("aprob"))
					tIns= tIns + CInt(RsP.Fields("insc"))
					tPrese= tPrese + CInt(RsP.Fields("prese"))
					tSele= tSele + CInt(RsP.Fields("seleccionado"))
					trece = trece + CInt(RsP.Fields("llego"))

					if tmeta = 0 then
					 cober =0 
					 else 
					 cober = cint((tSele/tmetacon)*100) 
					 end if
					
					if tprog = 0 then 
					cober2 =0 
					else 
					cober2 = cint((tIns/tprog)*100) 
					end if
					
                            registro = registro + 1
							end if
                            RsP.MoveNext
                            Loop	
                            RsP.close %>
                                  </tr>
                                  <tr  >
                                    <td colspan="3" bgcolor="#D7F2FF" ><div class="proyecto">TOTAL </div></td>
                                    <td bgcolor="#D7F2FF"  ><strong><%=tmeta%></strong></td>
                                    <td bgcolor="#D7F2FF"  ><strong><%=tIns%></strong></td>
                                    <td bgcolor="#D7F2FF"  ><span style="font-size:09px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span style="font-size:09px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span style="font-size:09px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
                                    <td bgcolor="#D7F2FF"  ><strong><%=tSele%></strong></td>
                                    <td bgcolor="#D7F2FF"  ><strong><%=cober%>%</strong></td>
                                  </tr>
                                  <tr  >
                                    <td  colspan="10" bgcolor="#D7F2FF" ><span class="alerta5" >(*) La Cobertura es sobre los  Total de Inscritos y Meta </span>a Reclutar</td>
                                  </tr>
                                </table>
     
     
          
          
            
          
<% 
		else 
		
		if codigoMeta<>"0051" AND codigoMeta<>"0053" then
		%>
		
		
		 <table  width='100%' align="left"  id="Exportar_a_Excel"  style="font-family:Arial; font-size:10px"  >
          
           
            <tr height="10px">
              <th colspan="18"  bgcolor="#F2F3F4"  ><span class="aplicacion" style="height:30px">COBERTURA  POR DEPARTAMENTO</span></th>
            </tr>
            <tr>
              <th width="4%" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">Nro</th>
              <th colspan="2" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">DEPARTAMENTO</th>
              <th width="50" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">META SELECCI&Oacute;N</th>
              <th width="50" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">INSCRITOS</th>
                                                  <th width="76" bgcolor="#339966" colspan="2" style="font-size:11px;">Evaluaci&oacute;n de CVs</th>
                                    <th colspan="2" bgcolor="#FF9933" style="font-size:11px;" >Conocimientos y competencias</th>
                                    <th colspan="2" bgcolor="#EA95FF" style="font-size:11px;" >Entrevista Personal</th> <th colspan="2" bgcolor="#7691FA"   style="font-size:11px;">Selecci&oacute;n</th>
            </tr>
            <tr>
 <th   bgcolor="#D5F0E2"    style="font-size:10px;">Aprobados</th>
 <th   bgcolor="#D5F0E2"    style="font-size:10px;">% Aprobados</th>
                                    <th width="70" bgcolor="#FFD5AA"    style="font-size:10px;">Aprobados</th>
                                    <th width="69" bgcolor="#FFD5AA"    style="font-size:10px;">% Aprobados</th>
                                    <th width="52"    bgcolor="#F7D7FF"    style="font-size:10px;">Aprobados</th>
                                    <th width="89"    bgcolor="#F7D7FF"   style="font-size:10px;">% Aprobados</th>
                                    <th width="63" bgcolor="#D8DFFE"   style="font-size:10px;">Seleccionados</th>
                                    <th widthwhere ccdd_i=''="89" bgcolor="#D8DFFE"   style="font-size:10px;">%Seleccioandos </th>
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
            <tr class='<%=clase%>' height="10px" >
              <td   style="font-size:9px;"><%response.Write(cont)%>
                &nbsp;</td>
              <td colspan="2"   style="font-size:9px;"><%=RsP.Fields("nombre")%></td>
              <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("metaCon")%></span></td>
              <td  style="font-size:9px; color:#005279; font-style:normal;"><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("aproboCV")%></span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("aproboCV"))%>%</span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("totaLFinPSi")%></span></td>
                                   
                                    <td  style="font-size:9px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("totaLFinPSi"))%>%</span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal; " ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("totalEntr")%></span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("totalEntr"))%>%</td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("SeleccionadosT")%></span></td>
                                    <td  style="font-size:9px;color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("SeleccionadosT"))%>%</td>
              <% 
					 'tmeta= tmeta + CInt(RsP.Fields("meta"))
					tmetacapa=tmetacapa + CInt(RsP.Fields("meta_capa"))
					tmetacon=tmetacon + CInt(RsP.Fields("metacon"))
					'tprog= tprog + CInt(RsP.Fields("prog"))
					'tApt= tApt + CInt(RsP.Fields("aprob"))
					tIns= tIns + CInt(RsP.Fields("insc"))
					tAprCV= tAprCV + CInt(RsP.Fields("aproboCV"))
					tPsico= tPsico + CInt(RsP.Fields("totaLFinPSi"))
					tEntrev= tEntrev + CInt(RsP.Fields("totalEntr"))
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
            <tr  height="10px" >
              <td colspan="3" bgcolor="#D7F2FF"  style="font-size:9px;"><div class="proyecto">TOTAL </div></td>
              <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tmetacon%></span></td>
              <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tIns%></span></td>
                                     <td bgcolor="#D7F2FF"   ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprCV%></span></td>
                                    <td   bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacon,tAprCV)%> %</span></td>

                                    <td   bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tPsico%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacon,tPsico)%>%</span></td>
                                    <td bgcolor="#D7F2FF"    ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tEntrev%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacon,tEntrev)%>%</span></td>
                                    <td bgcolor="#D7F2FF"  > <span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tSelecc%></span></td>
                                    <td bgcolor="#D7F2FF" ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;">&nbsp;<%=porcentaje(tmetacon,tSelecc)%>%</span></td>
            </tr>
        <tr  >
                                    <td height="16"  colspan="13" bgcolor="#D7F2FF" ><span class="alerta5" >(*) Los Porcentajes obtenidos en cada proceso estan calculados sobre los Totales de las metas de Selecci&oacute;n</span></td>
                                  </tr>
          </table><br>
		
        
        <% else%>
        
        
         <table id="Exportar_a_Excel" align="left" style="font-family:Arial;  font-size:10px">
          
           
            <tr  height="10px">
              <th colspan="18"  bgcolor="#F2F3F4"  ><span class="aplicacion" style="height:30px">COBERTURA  POR SEDE OPERATIVA</span></th>
            </tr>
            <tr>
              <th width="19" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">Nro</th>
              <th width="118"  rowspan="2" bgcolor="#F2F3F4" style="font-size:11px; width:120px !important">SEDE OPERATIVA</th>
              <th width="60" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">META CAPACITACI&Oacute;N</th>
              <th width="60" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">META SELECCI&Oacute;N</th>
              
               <th width="57" rowspan="2" bgcolor="#F2F3F4" style="font-size:11px;">INSCRITOS</th>
              
           <th bgcolor="#0285B7" colspan="2" style="font-size:11px;">Preselecci&oacute;n Autom&aacute;tica</th>  
                                                  <th bgcolor="#339966" colspan="2" style="font-size:11px;">Evaluaci&oacute;n de CVs</th>
                <th colspan="2" bgcolor="#EA95FF" style="font-size:11px;" >Preselecci&oacute;n</th> 
                                    <th colspan="2" bgcolor="#FF9933" style="font-size:11px;" >Capacitaci&oacute;n</th>
                                    <th colspan="2" bgcolor="#7691FA"   style="font-size:11px;">Selecci&oacute;n</th>
            </tr>
            <tr>
             <th width="53"   bgcolor="#B7DBFF"    style="font-size:10px;">Aprobados</th>
 <th width="53"   bgcolor="#B7DBFF"   style="font-size:10px;">% Aprobados</th>
 
 <th width="53"   bgcolor="#D5F0E2"    style="font-size:10px;">Aprobados</th>
 <th width="53"   bgcolor="#D5F0E2"    style="font-size:10px;">% Aprobados</th>
                                    <th width="53"    bgcolor="#F7D7FF"    style="font-size:10px;">Aprobados</th>
                                    <th width="53"    bgcolor="#F7D7FF"   style="font-size:10px;">% Aprobados</th>
                                    <th width="53" bgcolor="#FFD5AA"    style="font-size:10px;">Aprobados</th>
                                    <th width="53" bgcolor="#FFD5AA"    style="font-size:10px;">% Aprobados</th>
                                    
                                    <th width="73" bgcolor="#D8DFFE"   style="font-size:10px;">Seleccionados</th>
                                    <th width="102" bgcolor="#D8DFFE"   style="font-size:10px;">%Seleccionados </th>
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
            <tr class='<%=clase%>' height="10px" >
              <td   style="font-size:9px;"><%response.Write(cont)%>
                &nbsp;</td>
              <td style="font-size:9px; width:120px !important"  ><%=RsP.Fields("nombre")%></td>
              <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("metacapa")%></span></td>
              <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("metaCon")%></span></td>
              <td  style="font-size:9px; color:#005279; font-style:normal;"><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("insc")%></span></td>
              
                                                  <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("aproboAuto")%> </span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metacapa"),RsP.Fields("aproboAuto"))%>%</span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("aproboCV")%></span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metacapa"),RsP.Fields("aproboCV"))%>%</span></td>
                                    
                                    <td  style="font-size:9px; color:#005279; font-style:normal; " ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("totaLpresel")%></span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metacapa"),RsP.Fields("totaLpresel"))%>%</td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;  " ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("totaLCapa")%></span></td>
                                   
                                    <td  style="font-size:9px; color:#005279; font-style:normal;  " ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("totaLCapa"))%>%</span></td>
                                    <td  style="font-size:9px; color:#005279; font-style:normal;" ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=RsP.Fields("SeleccionadosT")%></span></td>
                                    <td  style="font-size:9px;color:#005279; font-style:normal;" ><%=porcentaje(RsP.Fields("metaCon"),RsP.Fields("SeleccionadosT"))%>%</td>
              <% 
					'tmeta= tmeta + CInt(RsP.Fields("meta"))
					'tmetacapa=tmetacapa + CInt(RsP.Fields("meta_capa"))
					tmetacon=tmetacon + CInt(RsP.Fields("metacon"))
					tmetacapa=tmetacapa + CInt(RsP.Fields("metacapa"))
					'tprog= tprog + CInt(RsP.Fields("prog"))
					'tApt= tApt + CInt(RsP.Fields("aprob"))
					tIns= tIns + CInt(RsP.Fields("insc"))
					tAprCV= tAprCV + CInt(RsP.Fields("aproboCV"))
					tAprPresel= tAprPresel + CInt(RsP.Fields("totaLpresel"))
					tAprCapac= tAprCapac + CInt(RsP.Fields("totaLCapa"))
					tPsico= tPsico + CInt(RsP.Fields("totaLFinPSi"))
					tEntrev= tEntrev + CInt(RsP.Fields("totalEntr"))
					tSelecc = tSelecc + CInt(RsP.Fields("SeleccionadosT"))
					tAprAuto= tAprAuto + CInt(RsP.Fields("aproboAuto"))


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
            <tr  height="10px" >
              <td colspan="2" bgcolor="#D7F2FF"  style="font-size:9px;"><div class="proyecto">TOTAL </div></td>
              <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tmetacapa%></span></td>
              <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tmetacon%></span></td>
               <td bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tIns%></span></td>
              
                                     <td bgcolor="#D7F2FF"   ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprAuto%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacapa,tAprAuto)%>%</span></td>
                                    
                                    
                                     <td bgcolor="#D7F2FF"   ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprCV%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacapa,tAprCV)%>%</span></td>
                                    
                                    
                                    <td bgcolor="#D7F2FF"    ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprPresel%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacapa,tAprPresel)%>%</span></td>
                                    <td   bgcolor="#D7F2FF"  ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tAprCapac%></span></td>
                                    <td bgcolor="#D7F2FF"  ><span class="e_td_string" style="font-size:9px; color:#005279; font-style:normal;"><%=porcentaje(tmetacon,tAprCapac)%>%</span></td>
                                    <td bgcolor="#D7F2FF"  > <span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;"><%=tSelecc%></span></td>
                                    <td bgcolor="#D7F2FF" ><span class="e_td_string1" style="font-size:9px; color:#005279; font-style:normal;">&nbsp;<%=porcentaje(tmetacon,tSelecc)%>%</span></td>
            </tr>
        <tr  >
                                    <td  colspan="17" bgcolor="#D7F2FF" ><span class="alerta5" >(*) La cobertura de las tres primeras etapas de selecci&oacute;n est&aacute;n calculados en base a la meta de capacitaci&oacute;n y la cantidad de Aprobados por proceso.<br>
                                    (**) Los Porcentajes obtenidos en los procesos de selecci&oacute;n est&aacute;n calculados en base a la meta de selecci&oacute;n y los aprobados en cada proceso.</span></td>
                                  </tr>
          </table>

		
<p>
  <% 	 end if

end if 
	else 
		response.Write("No hay registros")
 end If
		  
		  
end if		  
		  
		  
		  
		  
		  
		  
		  
function porcentaje(meta,avance)

	IF (isnull(avance) or avance=0) then
		porcentaje= 0
	ELSE
	
	if (isnull(meta) or meta=0) then
		porcentaje= 0
	else
		porcentaje=CINT(100*avance/meta)
	end if
	
	END IF
end function%>
           

