<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  -->
 <style> 
 .t {mso-number-format:"\@";}
 </style> 
<%

Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.ContentType="text/html; charset=iso-8859-1"


lsRol = CStr(Session("txtTipoUsuarioValido"))
idProyecto=Session("id_proyecto")
codigoMeta=Session("codigoProyecto")

var1Cargo=request("lsCargo") '7
varReporte=request("lsReporte") '7
'response.Write(varReporte)
	varNomDpto=request("lsDPTO")	'15LIMA
	varNomProv=request("lsPROV")	'1501LIMA
	varNomDist=request("lsDIST")	'150101LIMA
	varlsconv=request("lsConvocaroria")
	valor=request("valor")	
	lsnivel=Request("lsnivel")
	txtSedeop=Request("txtSedeop")
	sede=Request("sede")
	txtfecha=Request("txtfecha")
	txtTrabI=Request("txtTrabI")
	
		
	
	varDpto=mid(varNomDpto,1,2)		'15
	varProv=mid(varNomProv,3,2)		'01	
	varDist=mid(varNomDist,5,2)		'01
	txtProvSed= Request("txtProvSed")
	txtDistSed= Request("txtDistSed")
	
	lszona=request("txtzona")	'1501LIMA
	lsseccion=request("txtseccion")	'150101LIMA
	
	
	'							
	lsvarNomDpto = len(varNomDpto) '6
	nombredpto=mid(varNomDpto,3,lsvarNomDpto-2)	'LIMA
	lsvarNomProv = len(varNomProv) '6
	nombreprov=mid(varNomProv,5,lsvarNomProv-4)	'LIMA
	lsvarNomDist = len(varNomDist) '6
	nombredist=mid(varNomDist,7,lsvarNomDist-6)	'LIMA
	
	
	lsvarzona=mid(lszona,7,5) '1501LIMA
	lsvarseccion=mid(lsseccion,12,5)	'150101LIMA
	
	
	vartiCargo=mid(var1Cargo,1,1)		'15
	lsVarCodCargo = len(var1Cargo) '6
	varCargo=mid(var1Cargo,2,lsVarCodCargo-1)	'LIMA
	
if varReporte="1" then
		REPORTE=" INSCRITOS TOTALES"
	end if
	if varReporte="21" then
		REPORTE=" Calificaci&oacute;n Autom&aacute;tica"
	end if
	if varReporte="23" then
		REPORTE=" Evaluaci&oacute;n Curricular"
	end if
	if varReporte="25" then
		REPORTE=" Evaluaci&oacute;n de Conocimientos y/o de Competencias"
	end if
	if varReporte="26" then
		REPORTE=" Aptos Entrevista"
	end if
	if varReporte="24" then
		REPORTE=" Entrevista Personal"
	end if
	if varReporte="4" then
		REPORTE=" SELECCIONADOS TITULARES Y RESERVA"
	end if
	if varReporte="5" then
		REPORTE=" SELECCIONADOS TITULARES"
	end if
	if varReporte="27" then
		REPORTE=" CONTRATADOS"
	end if	
	if varReporte="3" then
		REPORTE=" CAPACITACI&Oacute;N"
	end if	
		
	
	
	if varDpto="99" and varProv="99" and varDist="99" then
		vartittn=" A Nivel Nacional"
	end if
	if varDpto<>"99" then
		vartit1= "Departamento : " & nombredpto
	end if
	if varProv<>"99" then
		vartit2= " / Provincia : "& nombreprov
	end if
	if varDist<>"99" then
		vartit3= " / Distrito : "&nombredist
	end if
	vartitt=vartit1 & vartit2 & vartit3	                         	'					7				15				01				01

	if vartiCargo = "9" then
		vartiCargo = "1,2,3"
	end if
	

	
		SQL1 = "exec dbo.pa_reporte_procesos_nivel_censo '"&varCargo&"', '"&varDpto&"', '"&varProv&"', '"&varDist&"' , '"&varReporte&"', '"&vartiCargo&"', '"&idProyecto&"', '"&varlsconv&"', '"&valor&"', '"&lsnivel&"', '"&txtSedeop&"', '"&sede&"' , '"&txtProvSed&"', '"&txtDistSed&"', '"&txtfecha&"' , '"&txtTrabI&"', '"&lsvarzona&"', '"&lsvarseccion&"' "


			
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 	
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
		
If Not RSCuad.BOF And Not RSCuad.EOF Then

	%>	
		<table width='100%' border="1" cellpadding="2" cellspacing="2" id="Exportar_a_Excel"  bordercolor="#DAE8F3"  >
       <tr>
                  <td colspan="16" align="center"><span class="titulo">REPORTE DE <%= REPORTE %></span></td>
          </tr>
				<tr><span style="text-align:justify"> </span>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro</th>
                     <%IF lsRol <> 89 THEN%>
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nro. de Convocatoria</th>   
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Tiempo de Contrataci&oacute;n</th>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Sede</th>
                    <%end if%>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Depatamento</th>
					<th bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Provincia</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Distrito</th>
                    
                    <th bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Zona</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Seccion</th>
                    
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Cargo</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nombre</th>             		
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DNI</th>
                               		
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">EDAD</th>
                     <%IF lsRol <> 89 THEN%>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">RUC</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Telefono</th>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Celular</th>
					<th   bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Correo</th>	
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nivel</th>
                    <%if varReporte=21 then%>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nota Autom&aacute;tica</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado Evaluaci&oacute;n<br>Autom&aacute;tica</th>
                    <%end if%>
                    <%if varReporte=28 then%>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado Evaluaci&oacute;n<br>Autom&aacute;tica</th>
                    <%end if%>
                    <%if varReporte=23 then%>
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><%if varCargo=2605 then%>CUMPLIMIENTO REQ.<%ELSE%>NOTA 1<%END IF%> </th>   
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><%if varCargo=2605 then%>EXP. EN APLIC<%ELSE%>NOTA 2<%END IF%></th>
		        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><%if varCargo=2605 then%>FORM. ACAD.<%ELSE%>NOTA 3<%END IF%></th>
		        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><%if varCargo=2605 then%><%else%>NOTA 4<%end if%></th>
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >NOTA CV</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado Evaluaci&oacute;n CV</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Observaci&oacute;n</th>
                    <%end if%>
                    
                    <%if varReporte=25 then%>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nota Test</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Estado</th>
                     <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Eval. COmpetencias</th>
                    <%end if%>
                    <%if varReporte=24 then%>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nota Entrevista</th>
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Nota Final</th>
 <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Resultado</th>
                    <%end if%>
					<th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Fecha Inscripci&oacute;n</th>
                
                
                 <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">ESTADO</th>
                 <% IF codigoMeta="0053"  THEN%>
                 <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Trabajador INEI</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">Tipo Contrato INEI</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">OFICINA DEPARTAMENTAL</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">DIRECCI&Oacute;N T&Eacute;CNICA</th>
               <%end if%>              
               
               <%IF varReporte=2 or varReporte=3 THEN %>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">ESTADO PRESELECCI&Oacute;N </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">ESTADO CAPACITACI</th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOTA CAPACITACI&Oacute;N </th>
           <%END IF%> 
           <%IF varReporte=3 THEN %>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 5 </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 4 </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 3  </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 1  </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CRITERIO 2  </th>
           <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">NOTA PRESELECCI&Oacute;N </th>


           <%END IF%>
           
           
                <%if   varReporte=2 and  id_proyecto = 156  then%>
                 
                    
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >N1 </th>   
                <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >N2 </th>
		        <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >N3 </th>
                
                <%end if%>

                
<% if varReporte="4" and idProyecto = 156 and (varlsconv=6447 or varlsconv=6446) then%>   
 <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >Convocatoria </th>
 <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><% if varReporte="4" and idProyecto = 156 and (varlsconv=6446) then%>P5<%END IF%><% if varReporte="4" and idProyecto = 156 and (varlsconv=6447) then%>P3<%END IF%>   </th>
  <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><% if varReporte="4" and idProyecto = 156 and (varlsconv=6446) then%>P4<%END IF%><% if varReporte="4" and idProyecto = 156 and (varlsconv=6447) then%>P2<%END IF%>  </th>
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" ><% if varReporte="4" and idProyecto = 156 and (varlsconv=6446) then%>P3<%END IF%><% if varReporte="4" and idProyecto = 156 and (varlsconv=6447) then%>P1<%END IF%>  </th>
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >NotaPreCap </th>
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >C1 </th>

    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >C2 </th>

    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >C3 </th>

<%end if%>               
           
<% if varReporte=2 and idProyecto = 156 then%> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >C1 </th>
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >C2 </th>
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >C3 </th>      
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >LOCAL </th>
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >AULA </th>                
<%end if%>

<% if varReporte=23 and idProyecto = 156 then%> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >C1 </th>
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >C2 </th>
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >C3 </th>      
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >LOCAL </th>
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3" >AULA </th>                
<%end if%>



<% if varReporte=23 and idProyecto = 155 then%> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C1</th> 
  <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C2</th> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C3</th> 
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C4</th> 
  <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C5</th> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C6</th> 
      <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C7</th> 
         <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C8</th> 
      <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C9</th> 
      
 <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">F1</th> 
  <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">F2</th> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">F3</th> 
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">F4</th> 
       <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">F5</th> 
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">F6</th> 
            
 <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">E1</th> 
  <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">E2</th> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">E3</th> 
   
   
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">D1</th> 
  <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">D2</th> 
    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">D2_DES</th> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">D3</th> 
   
      <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">OBSERVACION</th> 
    
               
<%end if%>



<%if (varReporte=3 ) and idProyecto=156 then%>
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C1</th> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C2</th> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">C3</th> 
   <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CARGO</th>    

 <%END IF%> 
 
         <%if (varReporte=3 ) and idProyecto=155 then%>
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP C1</th> 
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP C2</th> 
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP C3</th> 
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP C41</th> 
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP C42</th> 
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP D1</th> 
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP D2</th> 
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP D3</th> 
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP D4</th> 
          <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">CAP OBSERVACION</th> 
                    <th  bordercolor="#DAE8F3"  bgcolor="#DAE8F3" class="dato3">GRUPO APLICA</th>       
		<%END IF%>    
                
                <%end if%>
                <!--termino de rol 42-->
          </tr>
		  <%registro = 0					
							
			Do While Not RSCuad.EOF
			response.Flush()
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 
			
				%>
		<tr class='<%=clase%>'>
				  <td class='e_td_string1'><%response.Write(cont)%></td>
                   <%IF lsRol <> 89 THEN%>
       <td class='e_td_string1'><%=RSCuad.Fields("num_convocatoria")%></td>           
<td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nPeriodo_CCP")%><%=RSCuad.Fields("TipoP")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("sede")%></td>
                  <%end if%>
                  
                  <%IF lsRol <> 89 THEN%>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dpto")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("prov")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("dist")%></td>
                  <%else%>
				<td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("Sede_region")%></td>	
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("Sede_provincia")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("SedeDistrital2")%></td>
                  <%end if%>
                  	  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("zona_i")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("seccion_i")%></td>

				  <td class='e_td_string1'><%=RSCuad.Fields("cargo")%></td>

				  <td class='e_td_string1'><%=RSCuad.Fields("nombre")%></td>              
				  <td class='t'><%=RSCuad.Fields("dni")%></td>
                  
					<td class='t'><%=RSCuad.Fields("EDAD")%></td>
                  
                   <%IF lsRol <> 89 THEN%>
				  <td class='e_td_string1'><%=RSCuad.Fields("ruc")%></td>
			     <td class='t'><%=RSCuad.Fields("telefono")%></td>				
				  <td class='t'><%=RSCuad.Fields("celular")%></td>
				  <td class='e_td_string1'><%=RSCuad.Fields("correo")%></td>		
				  <td class='e_td_string1'><%=RSCuad.Fields("nivel")%></td>	
                  <% if varReporte=21 then%>	
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nota_testInfo")%></td>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("aprobo_au")%></td>
                  <%end if %>
                  <% if varReporte=28 then%>	
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("aprobo_au")%></td>
                  <%end if %>
                  
                  <% if varReporte=23 then%>	

<%if idProyecto = 156 THEN%>                   
                 <td class='e_td_string1'><%=RSCuad.Fields("c1")%></td>
                 <td class='e_td_string1'><%=RSCuad.Fields("c2")%></td>
		         <td class='e_td_string1'><%=RSCuad.Fields("c3")%></td>
                 
<%ELSE%>                 
              
                  <td class='e_td_string1'><%if varCargo=2605 then%> <%IF RSCuad.Fields("p_formacionAct") = "1" THEN  RESPONSE.WRITE("SI")  ELSE IF RSCuad.Fields("p_formacionAct") = "2" THEN  RESPONSE.WRITE("NO")  ELSE RESPONSE.WRITE("") END IF END IF%><%ELSE%><%=RSCuad.Fields("p_formacionAct")%><%END IF%></td>
                 <td class='e_td_string1'><%=RSCuad.Fields("p_expLaboral")%></td>
		         <td class='e_td_string1'><%=RSCuad.Fields("p_expAula")%></td>
<%end if%>                                  
                 
                 
		         <td class='e_td_string1'><%=RSCuad.Fields("p_experiencia")%></td>
		         <td class='e_td_string1'><%=RSCuad.Fields("p_total")%></td>
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("estado_cv")%></td>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("cv_observacion")%></td>
                  <%end if %>
                   <% if varReporte=25 then%>	
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("nota_testinfo")%></td>		
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("aprobo_test")%></td>
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("competencia")%></td>
                  <%end if %>
                  
                   <% if varReporte=24 then%>	
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("promedioEntevista")%></td>		
                  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("totalEntrevista")%></td>
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("aptototalEntrevista")%></td>
                  <%end if %>



                  
				  <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("fec_reg")%></td>		
<td class='e_td_string1'><%
if varReporte = 27 then
RESPONSE.WRITE (RSCuad.Fields("estadoC"))
else
RESPONSE.WRITE (RSCuad.Fields("estado")) END IF%></td>
<% IF codigoMeta="0053"  THEN%>
<td class='e_td_string1'><%=RSCuad.Fields("t")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("tc")%></td>	
<td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("DEPEN_FISICA")%></td>
<td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("DEPEN_PRESUP")%></td>
<%end if%>		
<%IF varReporte=2 or varReporte=3 THEN %>
           <td  class='e_td_string1'><%=RSCuad.Fields("DESC_PRESELEC")%></th>
           <td  class='e_td_string1'><% 
		   if RSCuad.Fields("capacita")=1 then response.write("Aprobado") end if 
		   if RSCuad.Fields("capacita")=2 then  response.Write("desaprobado")end if
		   %></th>
           <%END IF%>   
           
     <%IF varReporte=3 THEN %>
		   <td  class='e_td_string1'><%=RSCuad.Fields("notacap")%></th>
           <td  class='e_td_string1'><%=RSCuad.Fields("l1")%></th>           
           <td  class='e_td_string1'><%=RSCuad.Fields("p4")%></th>
           <td  class='e_td_string1'><%=RSCuad.Fields("p3")%></th>
           <td  class='e_td_string1'><%=RSCuad.Fields("p1")%></th>
           <td  class='e_td_string1'><%=RSCuad.Fields("p2")%></th>
           <td  class='e_td_string1'><%=RSCuad.Fields("notaprecap")%></th>
     <%END IF%>
           
           
           
          <% if varReporte=2  and idProyecto = 156  then%>                    
                 <td class='e_td_string1'><%=RSCuad.Fields("c1")%></td>
                 <td class='e_td_string1'><%=RSCuad.Fields("c2")%></td>
		         <td class='e_td_string1'><%=RSCuad.Fields("c3")%></td>                 
		<%end if%> 
                
		<% if varReporte="4" and idProyecto = 156 and (varlsconv=6713 or varlsconv=6714) then%>                 
        	<td class='e_td_string1'><%=RSCuad.Fields("id_convocatoriacargo_tmp")%></td>
        
        <%end if%>
                
                
                
               
<% if varReporte="4" and idProyecto = 156 and (varlsconv=6446) then%>                
	 <td class='e_td_string1'><%=RSCuad.Fields("id_convocatoriacargo_tmp")%></td>
	 <td class='e_td_string1'><%=RSCuad.Fields("L1")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("p4")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("p3")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("NotaPreCap")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("C1")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("C2")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("C3")%></td>        

<%end if%>   

                
<% if varReporte="4" and idProyecto = 156 and (varlsconv=6447) then%>                
	 <td class='e_td_string1'><%=RSCuad.Fields("id_convocatoriacargo_tmp")%></td>
	 <td class='e_td_string1'><%=RSCuad.Fields("P3")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("p2")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("p1")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("NotaPreCap")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("C1")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("C2")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("C3")%></td>
        
<%end if%> 
           
<%if (varReporte=3 ) and idProyecto=155 then%>
          <td  class='e_td_string1'><%=RSCuad.Fields("cap_c1")%></th>
          <td  class='e_td_string1'><%=RSCuad.Fields("cap_c2")%></th>
          <td  class='e_td_string1'><%=RSCuad.Fields("cap_c3")%></th>
          <td  class='e_td_string1'><%=RSCuad.Fields("cap_c41")%></th>
          <td  class='e_td_string1'><%=RSCuad.Fields("cap_c42")%></th>
          <td  class='e_td_string1'><%=RSCuad.Fields("cap_d1")%></th>
          <td  class='e_td_string1'><%=RSCuad.Fields("cap_d2")%></th>
          <td  class='e_td_string1'><%=RSCuad.Fields("cap_d3")%></th>
          <td  class='e_td_string1'><%=RSCuad.Fields("cap_d4")%></th>
          <td  class='e_td_string1'><%=RSCuad.Fields("CAP_OBSERVACION")%></th>  
                    <td  class='e_td_string1'><%=RSCuad.Fields("grupo_aplica")%></th>  
<%END IF%>           
                  


<%if varReporte=2  AND idProyecto=156 then%>
    <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("LOCAL_1")%></td>
    <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("AULA_1")%></td>
<%end if%>	                  
                   
<%if varReporte=23 AND idProyecto=156 then%>
     <td class='e_td_string1'><%=RSCuad.Fields("C1")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("C2")%></td>
     <td class='e_td_string1'><%=RSCuad.Fields("C3")%></td>
     <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("LOCAL_1")%></td>
     <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("AULA_1")%></td>
<%end if%>	



<%if varReporte=23 AND idProyecto=155 then%>
<td class='e_td_string1'><%=RSCuad.Fields("C1")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("C2")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("C3")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("C4")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("C5")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("C6")%></td>      
<td class='e_td_string1'><%=RSCuad.Fields("C7")%></td>      
<td class='e_td_string1'><%=RSCuad.Fields("C8")%></td>      
<td class='e_td_string1'><%=RSCuad.Fields("C9")%></td>      

      
<td class='e_td_string1'><%=RSCuad.Fields("F1")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("F2")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("F3")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("F4")%></td>            
<td class='e_td_string1'><%=RSCuad.Fields("F5")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("F6")%></td>            

<td class='e_td_string1'><%=RSCuad.Fields("E1")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("E2")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("E3")%></td>
   
   
<td class='e_td_string1'><%=RSCuad.Fields("D1")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("D2")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("D2_DES")%></td>
<td class='e_td_string1'><%=RSCuad.Fields("D3")%></td>
   
   <td class='e_td_string1'><%=RSCuad.Fields("OBSERVACION")%></td>
      
 <%END IF%>     
 
<%if (varReporte=3  ) AND idProyecto=156 then%>
    <td class='e_td_string1'><%=RSCuad.Fields("C1")%></td>
    <td class='e_td_string1'><%=RSCuad.Fields("C2")%></td>
    <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("C3")%></td>
    <td class='e_td_string1'>&nbsp;<%=RSCuad.Fields("id_convocatoriacargo_tmp")%></td>
<%end if%>	                                  
                    
                    
                     <%end if%>
                     <!-- fin de rol 42-->
		  </tr>
     
		<%
			registro = registro + 1
			RSCuad.MoveNext
			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
 %>
 
          <tr>
                
                <td colspan="16" align="right"><p>FECHA Y HORA: <%= Now() %>&nbsp;</p></td>
                </tr>
                
		</table>
		
<%else%>
<span class="titulo"><%=REPORTE%></span>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if %>

