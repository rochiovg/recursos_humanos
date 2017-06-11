<%@ Language=VBScript %>
<%session.lcid=2057%>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 .t1 {mso-number-format:"\@";}
 </style>
<%

id_proyecto=session("id_proyecto")
Server.ScriptTimeout = 230400  

Response.ContentType="text/html; charset=iso-8859-1"
Response.Expires = 0'
Response.Buffer = True 
Response.Flush 
	
fin = request("fin")
fechayhora= Now()
varfin=request("lsfin") '7


	lsDNI = request("lsDNI")

	SQL0 = "EXEC dbo.uspGet_Planilla_PorPEADNI '0','"&lsDNI&"','','"&id_proyecto&"'" 
	
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL0, MiCone, 3,3

%>

	
<body  >	
<form name="frmMiForm1" id="frmMiForm1" METHOD="POST" ACTION="">

<table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
      <tr style="border:0;">
        <td height="61" colspan="15" align="center" style="font-size:15px;border:0;"><strong>SEGUIMIENTO DE PAGOS  Y  REEMPLAZOS DE LA PEA</strong>&nbsp;
		<br></td> 
      </tr>
	<%If Not RSCuad.BOF And Not RSCuad.EOF Then %>
       
      <tr >
        <td height="30" colspan="14" style="font-size:14px;border:0; color: #0202EE" align=center   valign=BOTT>
		<strong>&nbsp;DNI:&nbsp;</strong> <%=trim(RSCuad.Fields("DNI"))%> &nbsp;&nbsp;<strong>NOMBRE:</strong> <%=Ucase(trim(RSCuad.Fields("Ape_Nom")))%><br><br>
		</td> 
      </tr>
      
		<%	registro = 1					
			Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
		%>			
		<span style="font:Arial;font-size:9px; color: #ffffff"> 
            <tr >
                <td height="30" colspan="13" style="font-size:12px;border:0; color: #0202EE" align=LEFT   valign=BOTT><br>
		        <strong>CARGO FUNCIONAL:</strong>&nbsp;&nbsp; <%=Ucase(trim(RSCuad.Fields("funcional")))%> &nbsp;&nbsp;&nbsp;&nbsp;<br>
		        <strong>DOCUMENTO CCPP:&nbsp;</strong> <%=trim(RSCuad.Fields("Documento_CCP"))%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>TOTAL ARMADAS CCPP:&nbsp;</strong> <%=trim(RSCuad.Fields("TotArmadas"))%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>TOTAL MONTO CCPP:&nbsp;</strong> <%=trim(RSCuad.Fields("SumArmadas"))%><br>
                * Los pagos marcados de amarillo indica que fueron anulados
		        </td> 
            </tr>
		
	<tr><td>
        <table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
            <tr style="border:0;">
                <td height="30" colspan="14" align="LEFT" style="font-size:12px;border:0;"><strong>I. PLANILLA DE HONORARIOS: CONSULTA DE PAGOS REALIZADOS</strong>&nbsp;</td> 
            </tr>
            

            <!----------/--------------------------------------------- -->
	        <%SQL1 = "EXEC dbo.uspGet_Planilla_PorPEADNI '1','','"&RSCuad.Fields("Id_Contratos")&"','"&id_proyecto&"'" 
        
        
		    Set RSCuad1	= Server.CreateObject("ADODB.Recordset") 
		    RSCuad1.cursorlocation=3
		    RSCuad1.Open SQL1, MiCone, 3,3
            %> 

           
	        <%If Not RSCuad1.BOF And Not RSCuad1.EOF Then %>

            <tr style="font-size:9px;"  >
            <th HEIGHT=17 width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" colspan=15>DATOS DE LAS PLANILLAS GENERADAS</th>
            </tr>

            <tr style="font-size:10px;"  >
	        <th width="02%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>	  
            <th width="19%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">PERIODO</th>
            <!--<th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ESTADO DE PLANILLA</th>
            <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ODEI / OZEI</th>-->
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">UBIGEO</th>
	        <!--
            <th width="30%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">APELLIDOS Y NOMBRES</th>
            <th width="10%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
            -->
	        <th width="11%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO <br>FUNCIONAL</th>
            <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SUELDO</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>N&deg; ARMADA</strong></th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>DIAS DE PAGO</strong></th>
	        <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>MONTO DE LA <br />ARMADA</strong></th>
	        <th width="11%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">TIPO DE INGRESO</th>
	        <th width="14%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ESTADO CONTRATO</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA INICIO</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA FIN</th>
	        <th width="03%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ID CONT.</th>
	        <th width="03%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ID CONT. PAGO</th>
            <th width="03%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Anulado</th>
            <th width="03%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Observaci&oacute;n</th>
            </tr>
		        <%	registro = 1					
			        ARM = 0
			        Do While Not RSCuad1.EOF
			        response.Flush()
				        If registro Mod 2 = 0 Then
					        clase = "e_tr_even"
				        Else
					        clase = "e_tr_odd"
				        End If	
			            ARM = ARM + cDbl(RSCuad1.Fields("MontoPago"))
						
						
						if RSCuad1.Fields("anulacion")=1 then 
							color="bgcolor=""#FFFFCE"""
						else
							color=""
						end if 
	    		%>			
	        <tr <%=color%>>
                <td height="15" class='e_td_string1' align=center style="te" ><%response.Write(registro)%></td>
		        <td class='e_td_string1'><span class="t4"><%=trim(RSCuad1.Fields("periodo"))%>&nbsp;(Apertura: <%=RSCuad1.Fields("Fecha_Registro")%>&nbsp; Cierre: <%=RSCuad1.Fields("Fecha_Cierre")%>)</span></td> 
		        <!--<td class='e_td_string1'><span class="t4"><%=trim(RSCuad1.Fields("Desc_estadoPla"))%></span></td>
		        <td class='e_td_string1'><span class="t4"><%=RSCuad1.Fields("detadepen")%></span></td>-->
		        <td class='e_td_string1'><span class="t4"><%=RSCuad1.Fields("ccdd_i")%><%=RSCuad1.Fields("ccpp_i")%><%=RSCuad1.Fields("ccdi_i")%></span></td>      
                <!--
                <td width="30%" class='e_td_string1'><%=Ucase(trim(RSCuad1.Fields("Ape_Nom")))%></td>
                <td width="10%" bordercolor="#DAE8F3" class='e_td_string1'><%=trim(RSCuad1.Fields("DNI"))%></td>
                --> 
                <td bordercolor="#DAE8F3" class='e_td_string1'> <%=RSCuad1.Fields("funcional")%></td>      
                <td bordercolor="#DAE8F3" class='e_td_string1' align=RIGHT><%=FormatNumber(RSCuad1.Fields("Sueldo"),2)%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'  align=center><strong><%=RSCuad1.Fields("narmada")%></strong></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><strong>&nbsp;<%=RSCuad1.Fields("DiasPago")%></strong></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' align=RIGHT ><strong><%=FormatNumber(RSCuad1.Fields("MontoPago"),2)%></strong></font></td>	
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad1.Fields("DescTipo_Ofc")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad1.Fields("Desc_ActivoC")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad1.Fields("fechaInicio")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad1.Fields("fechaFin")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad1.Fields("id_contratos")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad1.Fields("id_contratos_Pago")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad1.Fields("Anulado")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad1.Fields("observacion")%></font></td>
                
            </tr>
		        <%
			        registro = registro + 1
			        RSCuad1.MoveNext
			        Loop	
	
        		 	RSCuad1.close
		        	set RSCuad1=nothing 
		        %>
        </table>
 
        	<%else%>
		        		<table width='95%' align='center'>
				        <tr><td class='subtitulo' colspan='10' align='center'><br>No hay registros de pago  para el Cargo consultado.<br><br></td></tr>
				        </table>
	        <%end if%>
            <!----------/--------------------------------------------- -->
	
	    </td>
     </tr>
      


   <!----------/--------------------------------------------- -->
	<tr><td>
          <table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
            <tr style="border:0;">
                <td height="30" colspan="14" align="LEFT" style="font-size:12px;border:0;"><strong><br>II. PLANILLA DE HONORARIOS: CONSULTA DE SEGUIMIENTO DE PAGOS REALIZADOS ASOCIADOS AL CONTRATO</strong>&nbsp;</td> 
            </tr>
 
	        <%SQL2 = "EXEC dbo.uspGet_Planilla_PorPEADNI '2','','"&RSCuad.Fields("Id_Contratos")&"','"&id_proyecto&"'" 
			
			
		    Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 
		    RSCuad2.cursorlocation=3
		    RSCuad2.Open SQL2, MiCone, 3,3
            %> 

            
	        <%
	        If Not RSCuad2.BOF And Not RSCuad2.EOF Then %>

            <tr style="font-size:9px;"  >
            <th HEIGHT=17 width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" colspan=16>DATOS DE LAS PLANILLAS GENERADAS</th>
            </tr>

            <tr style="font-size:10px;"  >
	        <th width="02%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>	  
            <th width="19%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">PERIODO</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">UBIGEO</th>
	        <th width="11%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO <br>FUNCIONAL</th>
            <th width="03%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
            <th width="20%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">APELLIDOS Y NOMBRES</th>
            <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SUELDO</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>N&deg; ARMADA</strong></th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>DIAS DE PAGO</strong></th>
	        <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>MONTO DE LA  <br />ARMADA</strong></th>
	        <th width="11%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">TIPO DE INGRESO</th>
	        <th width="14%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ESTADO CONTRATO</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA INICIO</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA FIN</th>
	        <th width="03%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">ID CONT.</th>
	        <th width="03%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" >ID CONT. PAGO</th>
	  
            </tr>
		        <%	registro = 1					
			        ARM = 0
			        Do While Not RSCuad2.EOF
			        response.Flush()
				        If registro Mod 2 = 0 Then
					        clase = "e_tr_even"
				        Else
					        clase = "e_tr_odd"
				        End If	
						
						if RSCuad2.Fields("anulacion")=0 then
			            ARM = ARM + cDbl(RSCuad2.Fields("MontoPago"))
						end if
						
						if RSCuad2.Fields("anulacion")=1 then 
							color="bgcolor=""#FFFFCE"""
						else
							color=""
						end if 
	    		%>			
	        <tr <%=color%>>
                <td height="15" class='e_td_string1' align=center ><%response.Write(registro)%></td>
		        <td class='e_td_string1'><span class="t4"><%=trim(RSCuad2.Fields("periodo"))%>&nbsp;(Apertura: <%=RSCuad2.Fields("Fecha_Registro")%>&nbsp; Cierre: <%=RSCuad2.Fields("Fecha_Cierre")%>)</span></td>
		        <td class='e_td_string1'><span class="t4"><%=RSCuad2.Fields("ccdd_i")%><%=RSCuad2.Fields("ccpp_i")%><%=RSCuad2.Fields("ccdi_i")%></span></td>      
                <td bordercolor="#DAE8F3" class='e_td_string1'> <%=RSCuad2.Fields("funcional")%></td>      

                <td width="03%" bordercolor="#DAE8F3" class='e_td_string1'><%=trim(RSCuad2.Fields("DNI"))%></td>
                <td width="20%" class='e_td_string1'><%=Ucase(trim(RSCuad2.Fields("Ape_Nom")))%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' align=RIGHT><%=FormatNumber(RSCuad2.Fields("Sueldo"),2)%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'  align=center><strong><%=RSCuad2.Fields("narmada")%></strong></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' ><strong>&nbsp;<%=RSCuad2.Fields("DiasPago")%></strong></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'  align=RIGHT ><strong><%=FormatNumber(RSCuad2.Fields("MontoPago"),2)%></strong></font></td>	
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad2.Fields("DescTipo_Ofc")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad2.Fields("Desc_ActivoC")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad2.Fields("fechaInicio")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad2.Fields("fechaFin")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad2.Fields("id_contratos")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad2.Fields("id_contratos_Pago")%></font></td>
            </tr>
		        <%
			        registro = registro + 1
			        RSCuad2.MoveNext
			        Loop	
	
        		 	RSCuad2.close
		        	set RSCuad2=nothing 
		        %>
             </tr>
              <td  class='e_td_string1' colspan=9 align=RIGHT><strong> Total</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td bordercolor="#DAE8F3" bgcolor="#E6EFF7"  class='e_td_string1' align=RIGHT><strong><%=FormatNumber(ARM,2)%></strong></td>
              <td  class='e_td_string1' colspan=6 align=left><strong> * No Incluye pagos anulados. </strong></td>
	        <tr>

        </table>
 
 
        	<%else%>
		        		<table width='95%' align='center'>
				        <tr><td class='subtitulo' colspan='10' align='center'><br>No hay registros de pago  para el Cargo consultado.<br><br></td></tr>
				        </table>
	        <%end if%>
	
	    </td>
     </tr>
      <!----------/--------------------------------------------- -->

	<tr><td>
          <table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
            <tr style="border:0;">
                <td height="30" colspan="14" align="LEFT" style="font-size:12px;border:0;"><strong><br>III. GASTOS OPERATIVOS: CONSULTA DE PAGOS REALIZADOS</strong>&nbsp;</td> 
            </tr>
 
	        <%SQL4 = "EXEC dbo.uspGet_Planilla_PorPEADNI '4','','"&RSCuad.Fields("Id_Contratos")&"','"&id_proyecto&"'" 
		    Set RSCuad4	= Server.CreateObject("ADODB.Recordset") 
		    RSCuad4.cursorlocation=3
		    RSCuad4.Open SQL4, MiCone, 3,3
            %> 

            
	        <%
	        TOTAL =  0 
	        If Not RSCuad4.BOF And Not RSCuad4.EOF Then %>

            <tr style="font-size:9px;"  >
            <th HEIGHT=17 width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" colspan=21>DATOS DE LAS PLANILLAS GENERADAS</th>
            </tr>

            <tr style="font-size:10px;"  >
	        <th width="02%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">N&deg;</th>	  
            <th width="11%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DESCRIPCION DEL <BR>PERIODO</th>
	        <th width="05%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">UBIGEO</th>
	        <th width="18%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">CARGO <br>FUNCIONAL</th>
            <th width="03%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">DNI</th>
            <th width="20%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">APELLIDOS Y NOMBRES</th>

	        <th width="05%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>Nº DESEM-<BR>BOLSO</strong></th>
	        <th width="05%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>Nº ENVIO</strong></th>

            <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" colspan=7>CONCEPTOS DE PAGO S/.</th>
            <th width="100%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px" colspan=4>RUTAS</th>


	        <th width="05%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">Nº<BR>PLA.</th>
	        <th width="05%" ROWSPAN=2 bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">FECHA<BR>PROCESO</th>
            </tr>

            <tr style="font-size:10px;"  >
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px"><strong>TOTAL<BR>S/.</strong></th>
            <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">MOVIL.</th>
            <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">OTROS</th>
            <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">PA-<BR>SAJE</th>
            <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">PASA<BR>JE COB.</th>
            <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">INTER<BR>NET</th>
            <th width="07%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">TARJE<BR>TAS</th>

	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">SUB<BR>DIST.</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">COOR.<BR>ZONAL</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">JEFE<BR>BRI<BR>GADA</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#DAE8F3" class="dato" style="font-size:10px">EMPA<BR>DRO<BR>NADOR</th>
            </tr>
		        <%	registro = 1					
			        ARM = 0
			        Do While Not RSCuad4.EOF
			        response.Flush()
				        If registro Mod 2 = 0 Then
					        clase = "e_tr_even"
				        Else
					        clase = "e_tr_odd"
				        End If	
				        
				       TOTAL =  TOTAL + RSCuad4.Fields("Total")
	    		%>			
	        <tr>
                <td height="15" class='e_td_string1' align=center ><%response.Write(registro)%></td>
		        <td class='e_td_string1'><span class="t4"><%=trim(RSCuad4.Fields("DescPeriodo"))%></span></td>
		        <td class='e_td_string1'><span class="t4"><%=RSCuad4.Fields("Ubigeo")%></span></td>      
                <td bordercolor="#DAE8F3" class='e_td_string1'> <%=RSCuad4.Fields("cargoFuncional")%></td>      
                <td width="03%" bordercolor="#DAE8F3" class='e_td_string1'><%=trim(RSCuad4.Fields("DNI"))%></td>
                <td width="20%" class='e_td_string1'><%=Ucase(trim(RSCuad4.Fields("Nombres")))%></td>

                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad4.Fields("Desembolso")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad4.Fields("ENVIO")%></font></td>

                <td bordercolor="#DAE8F3" bgcolor="#E6EFF7" class='e_td_string1' align=RIGHT><%=RSCuad4.Fields("Total")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' align=RIGHT><%=RSCuad4.Fields("mov_local")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' align=RIGHT>&nbsp;<%=RSCuad4.Fields("otros")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' align=RIGHT>&nbsp;<%=RSCuad4.Fields("PASAJES")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' align=RIGHT>&nbsp;<%=RSCuad4.Fields("PASAJES_COBRO")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' align=RIGHT>&nbsp;<%=RSCuad4.Fields("INTERNET")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1' align=RIGHT>&nbsp;<%=RSCuad4.Fields("TARJETAS")%></td>
             
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad4.Fields("Subdistrital")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad4.Fields("Coord_zonal")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad4.Fields("Jefe_brigada")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad4.Fields("empadronador")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad4.Fields("Planilla")%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad4.Fields("Fecha")%></td>
            </tr>
		        <%
			        registro = registro + 1
			        RSCuad4.MoveNext
			        Loop	
	
        		 	RSCuad4.close
		        	set RSCuad4=nothing 
        	
		        	
		        %>
            </tr>
              <td  class='e_td_string1' colspan=8 align=RIGHT><strong> Total</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              <td bordercolor="#DAE8F3" bgcolor="#E6EFF7"  class='e_td_string1' align=RIGHT><strong><%=TOTAL%></strong></td>
	        <tr>

        </table>
 
        	<%else%>
		        		<table width='95%' align='center'>
				        <tr><td class='subtitulo' colspan='10' align='center'><br>No hay registros de pago de Gastos Operativos para el Cargo consultado.<br><br></td></tr>
				        </table>
	        <%end if%>
	
	    </td>
     </tr>
      <!----------/--------------------------------------------- -->





   <!----------/--------------------------------------------- -->
	<tr><td>
          <table border="1" cellpadding="0" style=" font-family:Arial; font-size:10px;" cellspacing="0">
            <tr style="border:0;">
                <td height="30" colspan="14" align="LEFT" style="font-size:12px;border:0;"><strong><br>IV. CONSULTA DE SEGUIMIENTO DE PEA ASOCIADA AL CONTRATO</strong>&nbsp;</td> 
            </tr>
 
	        <%SQL3 = "EXEC dbo.uspGet_Planilla_PorPEADNI '3','','"&RSCuad.Fields("Id_Contratos")&"','"&id_proyecto&"'" 
	
			
		    Set RSCuad3	= Server.CreateObject("ADODB.Recordset") 
		    RSCuad3.cursorlocation=3
		    RSCuad3.Open SQL3, MiCone, 3,3
            %> 

            
	        <%If Not RSCuad3.BOF And Not RSCuad3.EOF Then %>
            <tr style="font-size:9px;"  >
            <th HEIGHT=17 width="100%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px" colspan=16>DATOS DEL CONTRATO</th>
            </tr>
            <tr style="font-size:10px;"  >
	        <th width="02%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">N&deg;</th>	  
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">UBIGEO</th>
	        <th width="18%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">CARGO <br>FUNCIONAL</th>
            <th width="03%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">DNI</th>
            <th width="20%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">APELLIDOS Y NOMBRES</th>
	        <th width="11%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">TIPO DE INGRESO</th>
	        <th width="14%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">ESTADO CONTRATO</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">FECHA INICIO</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">FECHA FIN</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">PAGO COMPL.</th>
	        
	        
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">F.REG.  B/ALTA</th>
	        <th width="05%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">F.EJEC. B/ALTA</th>
	        <th width="03%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">ID PER.</th>
	        
	        <th width="03%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">ID CONT.</th>
	        <th width="03%" bordercolor="#D7D7D7"  bgcolor="#9CC1E0" class="dato" style="font-size:10px">ID CONT. PAGO</th>

 
 
            </tr>
		        <%	registro = 1					
			        Do While Not RSCuad3.EOF
			        response.Flush()
				        If registro Mod 2 = 0 Then
					        clase = "e_tr_even"
				        Else
					        clase = "e_tr_odd"
				        End If	
	    		%>			
	        <tr>
                <td height="15" class='e_td_string1' align=center ><%response.Write(registro)%></td>
		        <td class='e_td_string1'><span class="t4"><%=RSCuad3.Fields("ccdd_i")%><%=RSCuad3.Fields("ccpp_i")%><%=RSCuad3.Fields("ccdi_i")%></span></td>      
                <td bordercolor="#DAE8F3" class='e_td_string1'> <%=RSCuad3.Fields("funcional")%></td>      

                <td width="03%" bordercolor="#DAE8F3" class='e_td_string1'><%=trim(RSCuad3.Fields("DNI"))%></td>
                <td width="20%" class='e_td_string1'><%=Ucase(trim(RSCuad3.Fields("Ape_Nom")))%></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad3.Fields("DescTipo_Ofc")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad3.Fields("Desc_ActivoC")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad3.Fields("fechaInicio")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad3.Fields("fechaFin")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'  align=center ><%=RSCuad3.Fields("DescFlagPagoCom")%></font></td>
                
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad3.Fields("F_Reg_Baja")%><br><%=RSCuad3.Fields("F_Reg_Alta")%><br><%=RSCuad3.Fields("F_Reg_Baja1")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad3.Fields("F_Eje_Baja")%><br><%=RSCuad3.Fields("F_Eje_Alta")%><br><%=RSCuad3.Fields("F_Eje_Baja1")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad3.Fields("id_Per")%></font></td>
                
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad3.Fields("id_contratos")%></font></td>
                <td bordercolor="#DAE8F3" class='e_td_string1'><%=RSCuad3.Fields("id_contratos_Pago")%></font></td>
            </tr>
		        <%
			        registro = registro + 1
			        RSCuad3.MoveNext
			        Loop	
	
        		 	RSCuad3.close
		        	set RSCuad3=nothing 
		        %>
        </table>
 
        	<%else%>
		        		<table width='95%' align='center'>
				        <tr><td class='subtitulo' colspan='10' align='center'><br>No hay registros de Contratos para el Cargo consultado.<br><br></td></tr>
				        </table>
	        <%end if%>
	
	    </td>
     </tr>
      <!----------/--------------------------------------------- -->


      
		<%
		registro = registro + 1
		RSCuad.MoveNext
		Loop	
	
	 	RSCuad.close
		set RSCuad=nothing 
		%>
 </table>
 
	<%else%>
				<table width='95%' align='center'>
				<tr><td class='subtitulo' colspan='4'><br><br>No hay registros de pago  para  el DNI consultado:  <%Response.Write ("--> "&lsDNI)%><br></td></tr>
				</table>
	<%end if%>





		<%
			MiCone.close 
			set MiCone=nothing
		%>




	
</form>
</body >	