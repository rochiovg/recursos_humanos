<%@ Language=VBScript %>
<!-- #include file="Conexion.asp"  --> 
 <style> 
 .t {mso-number-format:"\@";}
 .t1 {mso-number-format:"\@";}
 </style>
<%
Response.Addheader "Content-Disposition", "attachment; filename=Bajas_X_Ejecutar.xls" 
Response.ContentType = "application/save"
Response.Expires = 0
Response.Buffer = True 
Response.Flush 
			

id_proyecto=session("id_proyecto")

lsfecha=request("lsfecha")	'15LIMA	
	
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
	vartitt=vartit1 & vartit2 & vartit3	
  
						SQL1 = "exec dbo.usp_Altas_Bajas_exe_periodo '"&lsfecha&"', '"&id_proyecto&"' "	
						


		Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
		RSCuad.cursorlocation=3
		RSCuad.Open SQL1, MiCone, 3,3
	%> 
	

	<%If Not RSCuad.BOF And Not RSCuad.EOF Then%>

<table border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
  <tr>
    <td colspan="38" align="center" style="color:#004080; font-size:24px; font-weight:bold;" ><table border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
      <tr>
        <td colspan="38" align="center" style="color:#004080; font-size:24px; font-weight:bold;" >ANEXO 2A - Resumen de Altas y Bajas Ejecutadas el d&iacute;a <%=lsfecha%></td>
      </tr>
      <tr>
        <td width="40" bgcolor="#DBDBDB">N&deg;</td>
        <td bgcolor="#DBDBDB">FECHA DE REGISTRO</td>
        <td width="136" bgcolor="#DBDBDB">CARGO</td>
        <td width="136" bgcolor="#DBDBDB">STATUS</td>
        <td width="136" bgcolor="#DBDBDB">DEPARTAMENTO</td>
        <td width="136" bgcolor="#DBDBDB">PROVINCIA</td>
        <td width="136" bgcolor="#DBDBDB">DISTRITO</td>
        <td width="136" bgcolor="#DBDBDB">APE PATERNO</td>
        <td width="136" bgcolor="#DBDBDB">APE MATERNO</td>
        <td width="151" bgcolor="#DBDBDB">NOMBRES</td>
        <td width="82" bgcolor="#DBDBDB">DNI</td>
        <td width="102" bgcolor="#DBDBDB"><p>ESTADO<br />
          CIVIL </p></td>
        <td width="102" bgcolor="#DBDBDB"> SEXO</td>
        <td width="102" bgcolor="#DBDBDB">FECH NAC</td>
        <td width="119" bgcolor="#DBDBDB">COD DEP DOM</td>
        <td width="129" bgcolor="#DBDBDB">COD PRO DOM</td>
        <td width="129" bgcolor="#DBDBDB">COD DIS DOM</td>
        <td width="100" bgcolor="#DBDBDB">TIPO VIA</td>
        <td width="246" bgcolor="#DBDBDB">NOMBRE VIA</td>
        <td width="56" bgcolor="#DBDBDB">Nro.</td>
        <td width="56" bgcolor="#DBDBDB">Km.</td>
        <td width="56" bgcolor="#DBDBDB">Mz.</td>
        <td width="56" bgcolor="#DBDBDB">Int.</td>
        <td width="56" bgcolor="#DBDBDB">Dpto.</td>
        <td width="56" bgcolor="#DBDBDB">Lote</td>
        <td width="56" bgcolor="#DBDBDB">Piso</td>
        <td width="100" bgcolor="#DBDBDB">TIPO ZONA</td>
        <td width="246" bgcolor="#DBDBDB">NOMBRE ZONA</td>
        <td width="124" bgcolor="#DBDBDB">N&deg; TELEFONO</td>
        <td width="124" bgcolor="#DBDBDB">N&deg; CELULAR</td>
        <td width="91" bgcolor="#DBDBDB">GRADO INSTRUCCI&Oacute;N</td>
        <td width="99" bgcolor="#DBDBDB">PROFESION</td>
        <td bgcolor="#DBDBDB">UNIVERSIDAD /CENTRO DE    ESTUDIOS</td>
        <td bgcolor="#DBDBDB">FEC_INI </td>
        <td bgcolor="#DBDBDB">FEC_FIN</td>
        <td bgcolor="#DBDBDB">DIAS TRABAJO</td>
        <td bgcolor="#DBDBDB">PLANILLA</td>
        <td bgcolor="#DBDBDB">JUSTIFICACION</td>
        <td bgcolor="#DBDBDB">PROCESO</td>
        <td bgcolor="#DBDBDB">BAJA YA REPORTADA</td>
      </tr>
      <%registro = 0
	  totalAltas=0					
				
			Do While Not RSCuad.EOF
				If registro Mod 2 = 0 Then
					clase = "e_tr_even"
				Else
					clase = "e_tr_odd"
				End If	
				cont = registro+1 
				
				if  RSCuad.Fields("num")=2 then
				ab="bgcolor=""#FFFF80"""
				end if
				%>
      <tr>
        <td rowspan="2" <%=ab%> ><%response.Write(cont)%></td>
        <td rowspan="2" <%=ab%> ><%=RSCuad.Fields("fec_reg")%></td>
        <td rowspan="2" <%=ab%> ><%=RSCuad.Fields("cargo")%></td>
        <td bgcolor="#996600">SALE</td>
        <td><%=RSCuad.Fields("dpto")%></td>
        <td><%=RSCuad.Fields("prov")%></td>
        <td><%=RSCuad.Fields("dist")%></td>
        <td><%=RSCuad.Fields("ape_paterno")%></td>
        <td><%=RSCuad.Fields("ape_materno")%></td>
        <td><%=trim(RSCuad.Fields("nombre"))%></td>
        <td class="t1"><%=RSCuad.Fields("dni")%></td>
        <td><span class="t1"><%=RSCuad.Fields("civil")%></span></td>
        <td><%=RSCuad.Fields("sexo")%></td>
        <td><%=RSCuad.Fields("fec_nac")%></td>
        <td class="t1"><%=RSCuad.Fields("RDPTO")%></td>
        <td  class="t1"><%=RSCuad.Fields("RPROV")%></td>
        <td class="t1" ><%=RSCuad.Fields("RDIST")%></td>
        <td class="t1"><%=RSCuad.Fields("via")%>&nbsp;</td>
        <td><%=TRIM(UCASE(RSCuad.Fields("DireccionNombreVia")))%></td>
        <td><%=RSCuad.Fields("DireccionPuerta")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionKm")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionManzana")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionInterior")%>&nbsp;</td>
        <td><%=RSCuad.Fields("Direcciondepa")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionLote")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionPiso")%>&nbsp;</td>
        <td class="t1"><%=RSCuad.Fields("zona")%>&nbsp;</td>
        <td><%=Ucase(trim(RSCuad.Fields("NOMZONA")))%>&nbsp;</td>
        <td class="t1"><%=RSCuad.Fields("telefono")%>&nbsp;</td>
        <td><%=RSCuad.Fields("celular")%>&nbsp;</td>
        <td><%=RSCuad.Fields("nivelS")%></td>
        <td class="t1"><%=RSCuad.Fields("PROFESIONS")%></td>
        <td class="t1"><%if RSCuad.Fields("UNIVERSIDADS")= "" then response.Write(" ") else response.Write(RSCuad.Fields("UNIVERSIDADS")) end if %>
          &nbsp; <%=Ucase(trim(RSCuad.Fields("LugEstudio")))%></td>
        <td class="t1"><span class="t12"><%=RSCuad.Fields("fec_iniT")%></span></td>
        <td class="t1"><span class="t14"><%=RSCuad.Fields("fec_finT")%></span></td>
        <td class="t1"><span class="t14"><%=RSCuad.Fields("diasT")%></span></td>  
        <td class="t1"><span class="t14"><%=RSCuad.Fields("planSale")%></span></td> 
        
        <td rowspan="2" class="t1"><span class="t131"><%=RSCuad.Fields("justi")%></span></td>
        <td rowspan="2" class="t1"><span class="t132"><%=RSCuad.Fields("proceso")%></span></td>
        <td rowspan="2" class="t1"><span class="t132"><%=RSCuad.Fields("proceso")%></span></td>
      </tr>
      <tr>
        <td bgcolor="#99CC66">ENTRA</td>
        <td><%=RSCuad.Fields("dptoI")%></td>
        <td><%=RSCuad.Fields("provI")%></td>
        <td><%=RSCuad.Fields("distI")%></td>
        <td><%=RSCuad.Fields("ape_paternoI")%></td>
        <td><%=RSCuad.Fields("ape_maternoI")%></td>
        <td><%=trim(RSCuad.Fields("nombreI"))%></td>
        <td class="t1"><span class="t2"><%=RSCuad.Fields("dniI")%></span></td>
        <td><span class="t11"><%=RSCuad.Fields("civilI")%></span></td>
        <td><%=RSCuad.Fields("sexoI")%></td>
        <td><%=RSCuad.Fields("fec_nacI")%></td>
        <td class="t1"><span class="t3"><%=RSCuad.Fields("RDPTOI")%></span></td>
        <td  class="t1"><span class="t4"><%=RSCuad.Fields("RPROVI")%></span></td>
        <td class="t1" ><span class="t5"><%=RSCuad.Fields("RDISTI")%></span></td>
        <td class="t1"><span class="t6"><%=RSCuad.Fields("viaI")%></span></td>
        <td><%=TRIM(UCASE(RSCuad.Fields("DireccionNombreViaI")))%></td>
        <td><%=RSCuad.Fields("DireccionPuertaI")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionKmI")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionManzanaI")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionInteriorI")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DirecciondepaI")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionLoteI")%>&nbsp;</td>
        <td><%=RSCuad.Fields("DireccionPisoI")%>&nbsp;</td>
        <td class="t1"><span class="t7"><%=RSCuad.Fields("zonaI")%></span></td>
        <td><%=Ucase(trim(RSCuad.Fields("NOMZONAI")))%></td>
        <td class="t1"><span class="t8"><%=RSCuad.Fields("telefonoI")%></span>&nbsp;</td>
        <td><%=RSCuad.Fields("celularI")%>&nbsp;</td>
        <td><%=RSCuad.Fields("nivelI")%></td>
        <td class="t1"><span class="t9"><%=RSCuad.Fields("PROFESIONI")%></span></td>
        <td class="t1"><span class="t10">
          <%if RSCuad.Fields("UNIVERSIDADI")= "" then response.Write(" ") else response.Write(RSCuad.Fields("UNIVERSIDADI")) end if %>
          &nbsp; <%=Ucase(trim(RSCuad.Fields("LugEstudioI")))%></span></td>
        <td class="t1"><span class="t13"><%=RSCuad.Fields("fec_iniR")%></span></td>
        <td class="t1"><span class="t14"><%=RSCuad.Fields("fec_finR")%></span></td>
        <td class="t1"><span class="t14"><%=RSCuad.Fields("diasR")%></span></td>
        <td class="t1">&nbsp;</td>
        <td class="t1">&nbsp;</td>
      </tr>
      <%
	  
	  if RSCuad.Fields("id_per_ing")<>0 then
				totalAltas=totalAltas+1
		end if
			registro = registro + 1
			RSCuad.MoveNext
			Loop	
			RSCuad.close
			set RSCuad=nothing 
			MiCone.close 
			set MiCone=nothing
 %>
    </table></td>
  </tr>
</table>

</table>

<table>
<tr><td> Total Altas : <%=totalAltas%></td></tr>
 </table>
<%else%>
				<table width='95%' align='center'>
				<tr>
				<td class='subtitulo' colspan='4'>No hay registros disponibles</td>
				</tr>
				</table>
	<%end if%>