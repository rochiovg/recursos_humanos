<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 </style>
<%
Server.ScriptTimeout = 1800 
Response.Addheader "Content-Disposition", "attachment; filename=REPORTE_F2.xls"
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = true 
Response.Flush 
			
'idProyecto=Session("id_proyecto")
'codigoMeta=Session("codigoProyecto")
'var1Cargo=request("lsCargo") '7
'varReporte=request("lsreporte") '7
'varccddTot = Request("lsDPTO")
'varccppTot = Request("lsPROV")
'varccdiTot = Request("lsDIST")
'valor = Request("valor")
lsconvocatoria=Request("lsconvocatoria")
'lsnivel=Request("lsnivel")
'tx'tSedeop=Request("txtSedeop")
'sede=Request("sede")
'txtProvSed=Request("txtProvSed")
'txtDistSed=Request("txtDistSed")
'txtfecha=Request("txtfecha")
'txtTrabI=Request("txtTrabI")


	
'	lszona=request("txtzona")	'1501LIMA
'	lsseccion=request("txtseccion")	'150101LIMA
	
	' valores de las sedes
'	if txtProvSed="9999" then
'	txtProvSed="9999"
'	else
'	txtProvSed=mid(txtProvSed,4)		
'	end if
'	txtDistSed=mid(txtDistSed,1,6)	

'varccdd = Mid(varccddTot,1,2)

'varccpp = Mid(varccppTot,3,2)

'varccdi = Mid(varccdiTot,5,2)
	
	
		
'	lsvarzona=mid(lszona,7,5) '1501LIMA
'	lsvarseccion=mid(lsseccion,12,5)	'150101LIMA
	
	
	
'	vartiCargo=mid(var1Cargo,1,1)		'15
'	lsVarCodCargo = len(var1Cargo) '6
'	varCargo=mid(var1Cargo,2,lsVarCodCargo-1)	'LIMA


lsRol = CStr(Session("txtTipoUsuarioValido"))
idProyecto=Session("id_proyecto")
codigoMeta=Session("codigoProyecto")

var1Cargo=request("lsCargo") '7
varReporte=request("lsReporte") '7

	varNomDpto=request("lsDPTO")	'15LIMA
	varNomProv=request("lsPROV")	'1501LIMA
	varNomDist=request("lsDIST")	'150101LIMA
	varlsconv=request("lsConvocaroria")
	valor=request("valor")	
	lsnivel=Request("lsnivel")
	txtSedeop=Request("txtSedeop")
	sede=Request("sede")
	txtProvSed=Request("txtProvSed")
	txtDistSed=Request("txtDistSed")
	txtfecha=Request("txtfecha")
	txtTrabI=Request("txtTrabI")
	
	lszona=request("txtzona")	'1501LIMA
	lsseccion=request("txtseccion")	'150101LIMA

	

	' valores de las sedes
	if txtProvSed="9999" then
	txtProvSed="9999"
	else
	txtProvSed=mid(txtProvSed,4)		
	end if
	txtDistSed=mid(txtDistSed,1,6)	
	
	varDpto=mid(varNomDpto,1,2)		'15
	varProv=mid(varNomProv,3,2)		'01	
	varDist=mid(varNomDist,5,2)		'01
	
	lsvarzona=mid(lszona,7,5) '1501LIMA
	lsvarseccion=mid(lsseccion,12,5)	'150101LIMA
	
	
	'							
	lsvarNomDpto = len(varNomDpto) '6
	nombredpto=mid(varNomDpto,3,lsvarNomDpto-2)	'LIMA
	lsvarNomProv = len(varNomProv) '6
	nombreprov=mid(varNomProv,5,lsvarNomProv-4)	'LIMA
	lsvarNomDist = len(varNomDist) '6
	nombredist=mid(varNomDist,7,lsvarNomDist-6)	'LIMA
	
	

	
	
	
	
	
	vartiCargo=mid(var1Cargo,1,1)		'15
	lsVarCodCargo = len(var1Cargo) '6
	varCargo=mid(var1Cargo,2,lsVarCodCargo-1)	'LIMA
	
	

if varReporte=7 then
var="block"
else
var="none"
end if

if vartiCargo="9" then
 vartiCargo="1,2,3"
end if


titulo=""



		SQL2 = "exec dbo.uspGet_ReporteF2_titulo  '"&lsconvocatoria&"', '"&idProyecto&"'"

'response.write(SQL2)
'		response.end()
		
		
		Set RSCuad2	= Server.CreateObject("ADODB.Recordset") 
		RSCuad2.cursorlocation=3
		RSCuad2.Open SQL2, MiCone, 3,3
		
			if lsconvocatoria<>0 then
				titulo="PROYECTO " &RSCuad2(0)&" <br>PEA DE CONTRATACION PARA (EL)LA " &RSCuad2(1)& "<br>  "&RSCuad2(2)&" OTORGADA CON CREDITO PRESUPUESTARIO CON "&RSCuad2(3)& " "
				
			else 
			
				titulo="PROYECTO " &RSCuad2(0)&" "	
			
			end if

	'	SQL1 = "exec dbo.pa_reporte_procesos_nivel_censo  '"&varCargo&"', '"&varccdd&"', '"&varccpp&"', '"&varccdi&"' , '"&varReporte&"', '"&vartiCargo&"', '"&idProyecto&"', '"&lsconvocatoria&"' , '"&valor&"' , '"&lsnivel&"', '"&txtSedeop&"', '"&sede&"', '"&txtProvSed&"', '"&txtDistSed&"', '"&txtfecha&"', '"&txtTrabI&"' "
		
			SQL1 = "exec dbo.pa_reporte_procesos_nivel_censo '"&varCargo&"', '"&varDpto&"', '"&varProv&"', '"&varDist&"' , '"&varReporte&"', '"&vartiCargo&"', '"&idProyecto&"', '"&varlsconv&"', '"&valor&"', '"&lsnivel&"', '"&txtSedeop&"', '"&sede&"' , '"&txtProvSed&"', '"&txtDistSed&"', '"&txtfecha&"', '"&txtTrabI&"', '"&lsvarzona&"', '"&lsvarseccion&"' "
			
			
			

		'SQL1 = " exec dbo.x_f2_resultados "
		
		
		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
	%> 
	

<%If Not RSCuad.BOF And Not RSCuad.EOF Then 


%>
    
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
<tr style="font-size:20px; font-weight:bold; text-align:center; ">
    <td colspan="22" ><%response.Write(titulo)%></td>
</tr>
  <tr style="font-size:11px; font-weight:bold">
    <td  width="17" rowspan="2"  bgcolor="#DAE8F3">N&deg;</td>
   <% if sede=1 then  %>
    
    <td rowspan="2" align="center"  bgcolor="#FFFF00">ODEI/OZEI</td>
    <%else  %>
    <td rowspan="2" align="center"  bgcolor="#FFFF00">SEDE OPERATIVA</td>
    <%end if%>
    
    <td colspan="8" align="center"  bgcolor="#BE3A5F">DATOS PERSONALES</td>
    <td colspan="6" align="center"  bgcolor="#009966">LUGAR DE RESIDENCIA</td>
    <td colspan="4" align="center" bgcolor="#75BAFF">NIVEL ACADEMICO</td><td colspan="2" align="center" bgcolor="#FF8000">SISTEMA DE PENSIONES</td>
    <td colspan="4" align="center"  bgcolor="#FEDE01" >OPERATIVO</td>
    <% if idProyecto="100" then %>
    <td colspan="3" align="center" bgcolor="#A8A8D5" >ADICIONALES</td>
    <% end if %>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Correo</td>
<td align="center" rowspan="2"   bgcolor="#DAE8F3" >Estado Evaluaci&oacute;n Autom&aacute;tica</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Estado Contrato</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >PEA Oficio</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Nro. de Convocatoria</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Solicitud de Certificaci&oacute;n Presupuestaria</td>
    <% if varReporte=7 then%>
    <td width="60" rowspan="2"  bgcolor="#DAE8F3"  style="display:block">CIERRE CAPAC.</td>
    <% elseif varReporte=5 then%>
    <td width="60" rowspan="2"  bgcolor="#DAE8F3"  style="display:block">CIERRE SELECT.</td>
	<% END IF %>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >ccdd</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >ccpp</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >ccdi</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Zona</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Brigada</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Ruta</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Sub Distrito</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >sede Regional</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Sede Provincial</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Sede Distrital</td>
    <% IF codigoMeta="0051"  THEN%>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Trabajador INEI</td>
    <td align="center" rowspan="2"   bgcolor="#DAE8F3" >Tipo Contrato INEI</td>
    <%end if%>
  </tr>
  
  <tr style="font-size:11px; color:#333; font-weight:bold ">
  
  
    <td  bgcolor="#DAE8F3"  width="53">DNI</td>
    <td  bgcolor="#DAE8F3"  width="53">RUC</td>
    <td  bgcolor="#DAE8F3"  width="53">APELLIDO PATERNO</td>
    <td  bgcolor="#DAE8F3"  width="56">APELLIDO MATERNO</td>
    <td  bgcolor="#DAE8F3"  width="57">NOMBRES</td>
    <td bgcolor="#DAE8F3"  width="33">ESTADO CIVIL</td>
    <td bgcolor="#DAE8F3"  width="33">SEXO (H/M)</td>
    <td bgcolor="#DAE8F3"  width="33">FECH NACIMIENTO</td>
    <td  bgcolor="#DAE8F3">DEPARTAMENTO</td>
    <td  bgcolor="#DAE8F3">PROVINCIA</td>
    <td  bgcolor="#DAE8F3">DISTRITO</td>
    <td  bgcolor="#DAE8F3">DIRECCI&Oacute;N</td>
    <td bgcolor="#DAE8F3"  width="59">N&deg; TELEFONO FIJO</td>
    <td bgcolor="#DAE8F3">N&deg; CELULAR</td>
    <td bgcolor="#DAE8F3">NIVEL INSTRUCCI&Oacute;N</td>
    <td bgcolor="#DAE8F3">GRADO INSTRUCCI&Oacute;N</td>
    <td bgcolor="#DAE8F3"  width="140">PROFESION / CARRERA</td>
    <td bgcolor="#DAE8F3">UNIVERSIDAD/CENTRO DE    ESTUDIOS</td>
    <td bgcolor="#DAE8F3">AFP/ONP</td>
    <td bgcolor="#DAE8F3">&Oacute;DIGO DE AFP</td>
    <td width="80"  bgcolor="#DAE8F3" >FECHA DE CONTRATO</td>
    <td width="80"  bgcolor="#DAE8F3" >FECHA DE PRESTACION DE SERVICIOS</td>
    <td width="80"  bgcolor="#DAE8F3" >FECHA FIN DE CONTRATO</td>
    <td width="180"  bgcolor="#DAE8F3" >CARGO SEGUN TDR</td>
    <% if idProyecto="100" then %>
    <td width="180"  bgcolor="#DAE8F3" >TIPO ZONA</td>
    <td width="180"  bgcolor="#DAE8F3" >CENTRO POBLADO</td>
    <td width="180"  bgcolor="#DAE8F3" >TAMBO</td>
    <% end if%>
  </tr>
    <tr align="center"  style=" font-size:9px">
    
         <td bgcolor="#FFFFE6"><strong>1</strong></td>
         <td bgcolor="#FFFFE6"><strong>2</strong></td>
         <td bgcolor="#FFFFE6"><strong>3</strong></td>
         <td bgcolor="#FFFFE6">&nbsp;</td>
         <td bgcolor="#FFFFE6"><strong>4</strong></td>
         <td bgcolor="#FFFFE6"><strong>5</strong></td>
         <td bgcolor="#FFFFE6"><strong>6</strong></td>
         <td bgcolor="#FFFFE6"><strong>7</strong></td>
         <td bgcolor="#FFFFE6"><strong>8</strong></td>
         <td bgcolor="#FFFFE6"><strong>9</strong></td>
         <td class="t" bgcolor="#FFFFE6"><strong>10</strong></td>
         <td class="t" bgcolor="#FFFFE6"><strong>11</strong></td>
         <td class="t" bgcolor="#FFFFE6"><strong>12</strong></td>
         <td class="t" bgcolor="#FFFFE6"><strong>13</strong></td>
         <td class="t" bgcolor="#FFFFE6"><strong>14</strong></td>
         <td bgcolor="#FFFFE6"><strong>15</strong></td>
         <td bgcolor="#FFFFE6"><strong>16</strong></td>
         <td class="t" bgcolor="#FFFFE6"><strong>17</strong></td>
         <td class="t" bgcolor="#FFFFE6"><strong>18</strong></td>
         <td bgcolor="#FFFFE6"><strong>19</strong></td>
         <td bgcolor="#FFFFE6"><strong>20</strong></td>
         <td bgcolor="#FFFFE6"><strong>21</strong></td>
         <td bgcolor="#FFFFE6"><strong>22</strong></td>
         <td bgcolor="#FFFFE6"><strong>23</strong></td>
         <td bgcolor="#FFFFE6"><strong>24</strong></td>
         <% if varReporte=15 OR varReporte=5 then%>
         <td bgcolor="#FFFFE6"><strong>25</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <% if idProyecto="100" then %>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <%end if%>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td><td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td><td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         <td bgcolor="#FFFFE6"><strong>&nbsp;</strong></td>
         
         <%END IF%>
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
      
      <tr style=" font-size:11px">
        <td height="20"><%response.Write(cont)%></td>
        <% if sede=1 then %>
        <td><%=RSCuad.Fields("ozei")%></td>
        <% elseif sede=2 then
				if idProyecto=45 or idProyecto=50 or idproyecto = 139  then
					SEDEOP=RSCuad.Fields("sede") 
				ELSEIF idProyecto=47 THEN
					SEDEOP=RSCuad.Fields("sede_operativa")
				ELSEIF idProyecto=74 THEN
					SEDEOP=RSCuad.Fields("ozei")
				ELSEIF idProyecto=99 THEN
					SEDEOP=RSCuad.Fields("ozei")
				END IF
		%>
        <td><%=SEDEOP%></td>
        <%end if%>        
        <td class="t"><span><%=RSCuad.Fields("dni")%></span></td>
        <td><%=RSCuad.Fields("ruc")%></td>
        <td><%=RSCuad.Fields("ape_paterno")%></td>
        <td><%=RSCuad.Fields("ape_materno")%></td>
        <td><%=trim(RSCuad.Fields("nombre1"))%></td>
        <td><%=trim(RSCuad.Fields("civil"))%></td>
        <td><%=RSCuad.Fields("sexo")%></td>
        <td><%=RSCuad.Fields("fec_nac")%></td>
        <td ><span ><%=RSCuad.Fields("DptoRes")%></span></td>
        <td ><span class="t14"><%=RSCuad.Fields("ProvRes")%></span></td>
        <td ><span class="t15"><%=RSCuad.Fields("DistRes")%></span></td>
        <td class="t" ><%=RSCuad.Fields("tvia")%> <%=TRIM(UCASE(RSCuad.Fields("DireccionNombreVia")))%> <%=RSCuad.Fields("DireccionPuerta")%></td>
        <td class="t"><%=RSCuad.Fields("telefono")%></td>
        <td class="t"><%=RSCuad.Fields("celular")%></td>
        <td><%=RSCuad.Fields("GRADO")%></td>
        <td class="t"><%=RSCuad.Fields("gradoG")%></td>
        <td class="t"><%=RSCuad.Fields("profesion")%></td>
        <td class="t"><%=response.Write(RSCuad.Fields("UNIVERSIDAD"))%><%=Ucase(trim(RSCuad.Fields("lug_estudio")))%></td>
        <td><%=response.Write(RSCuad.Fields("AFP"))%></td>
        <td><%=response.Write(RSCuad.Fields("COD_AFP"))%></td>
		<%if varReporte=27 then 
		Inicio=RSCuad.Fields("Inic")
		Fin=RSCuad.Fields("Fin")
		Contrato=RSCuad.Fields("Cont")
		estadoC=RSCuad.Fields("estadoC")
		FecReg=RSCuad.Fields("FecReg")
		pea=RSCuad.Fields("pea")
		else
		Inicio=""
		Fin=""
		Contrato=""
		estadoC=""
		FecReg=""
		pea=""
		end if
		%>
        <td><%=Contrato%></td>
        <td><%=Inicio%></td>
        <td><%=Fin%></td>
        <td><%=RSCuad.Fields("csiga")%> (<%=RSCuad.Fields("cargo")%>)</td>
        <% if idProyecto="100" then %>
        <td><%=RSCuad.Fields("tipo_z")%></td>
        <td><%=RSCuad.Fields("des_cp")%></td>
        <td><%=RSCuad.Fields("des_tambo")%></td>
        <% end if %>
        <td><%=RSCuad.Fields("correo")%></td>
        <td><%=RSCuad.Fields("aprobo_au")%></td>
        <td><%=estadoC%></td>
        <td><%=pea%></td>
        <td><%=RSCuad.Fields("num_convocatoria")%></td>
        <td><%=RSCuad.Fields("doc_ccp")%></td>
        <% if varReporte=7 then
			
			IF  RSCuad.Fields("cierre")=1 then 
			Cierre="Primera Etapa"
			elseif RSCuad.Fields("cierre")=2 then
			Cierre="Segunda Etapa"
		   end if
		%>
        <td style="display:block" ><span ><%=Cierre%>,<%response.Write(RSCuad.Fields("cierre"))%></span></td>
       <% end if
		  if varReporte=5 then
				
			IF  RSCuad.Fields("uenvdatos")=1 then 
			CierreS="Primera Etapa"
			elseif RSCuad.Fields("uenvdatos")=2 then
			CierreS="Segunda Etapa"
		   end if
		%>
        <td><span ><%=CierreS%>, <%response.Write(RSCuad.Fields("uenvdatos"))%></span></td>
        
        <%end if%>
        <td><span ><%response.Write(RSCuad.Fields("depN"))%></span></td>
        <td><span ><%response.Write(RSCuad.Fields("provN"))%></span></td>
        <td><span > <%response.Write(RSCuad.Fields("distN"))%></span></td>
        <td><span > <%response.Write(RSCuad.Fields("Zona"))%></span></td>
        <td><span > <%response.Write(RSCuad.Fields("Brigada"))%></span></td>
        <td><span > <%response.Write(RSCuad.Fields("ruta"))%>&nbsp;</span></td>
        <td><span > <%response.Write(RSCuad.Fields("Subdistrito"))%></span></td>
        <td><span > <%response.Write(RSCuad.Fields("sede_region"))%></span></td>
        <td><span > <%response.Write(RSCuad.Fields("sede_provincia"))%></span></td>
        <td><span > <%response.Write(RSCuad.Fields("SedeDistrital2"))%></span></td>
        <% IF codigoMeta="0051"  THEN%>
         <td><span > <%response.Write(RSCuad.Fields("t"))%></span></td>
         <td><span > <%response.Write(RSCuad.Fields("tc"))%></span></td>
         <%end if%>
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
    </table>
<%else%>
<%=RSCuad.Fields("civil")%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
          <%end if%>

