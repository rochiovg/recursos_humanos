<% 

Function validarUsuario(psUsuario, psClave, ByRef psUbigeo, ByRef id_puesto, ByRef psNombre, ByRef psTipoUsuario, ByRef psUbigeoapli, ByRef psUbigeoDist,ByRef meta,ByRef nmeta,ByRef actividad,ByRef proyecto,ByRef id_usuario,ByRef psCargosEv,ByRef psCargoUsuario,ByRef pscodiProyecto,ByRef pscodiMeta,ByRef psAula,ByRef psCuenta_competencias,ByRef psSedeReg,ByRef psSedeProv,ByRef psSedeDist, ByRef  zona, ByRef seccion_i, ByRef  subccdd , ByRef  subccpp , ByRef  subccdi  ,  ByRef  subzona , ByRef  subseccion )
  Dim lsSQL
  lsvalidacion = ""  
  
  lsSQL = "EXEC dbo.PA_CUENTA_VALIDA '" & psUsuario & "', '" & encriptar(psClave) & "', '" & proyecto & "'"  
  
   
  Call getRS(RS, lsSQL)
   
  If Not RS.BOF And Not RS.EOF Then   
    psNombre = RS.Fields("nombre")
	id_usuario = RS.Fields("id_Cuenta")
    psTipoUsuario = RS.Fields("tipousuario")
    psUbigeo = RS.Fields("ubigeo")
	psUbigeoapli = RS.Fields("ubigeoapli")
	psFlag = RS.Fields("flag")  
	psUbigeoDist = RS.Fields("ubidist")
	meta=RS.Fields("meta")
	nmeta=RS.Fields("nmeta")
	actividad=RS.Fields("actividad")
	proyecto=RS.Fields("id_proyecto")
	psCargosEv=RS.Fields("cargosEvaluar")
	psCargoUsuario=RS.Fields("id_puesto")
	pscodiProyecto=RS.Fields("codi_meta")
	pscodiMeta=RS.Fields("cod_proyecto")
	psAula=RS.Fields("aulas")
	psCuenta_competencias=RS.Fields("CUENTA_COMPETENCIAS")
	psSedeReg=RS.Fields("sedeReg")
	psSedeProv=RS.Fields("sedeProv")
	psSedeDist=RS.Fields("sedeDist")
	
	
	zona =RS.Fields("zona")
	seccion_i =RS.Fields("seccion_i")
	subccdd   =RS.Fields("subccdd")
	subccpp   =RS.Fields("subccpp")
	subccdi    =RS.Fields("subccdi")
	subzona  =RS.Fields("subzona")
	subseccion =RS.Fields("subseccion")
	
	
	
	
	
	
    If psFlag = "1" Then 
			lsvalidacion = "USUARIO_ACTIVO"
	Else
			lsvalidacion = "USUARIO_NO_ACTIVO"
	End If
  Else
     lsvalidacion = "USUARIO_NO_VALIDADO"
  End If
  RS.Close

  validarUsuario = lsvalidacion
End Function

'-----------------------------------------------------

Function encriptar(psClave)
  lsClave = psClave
  encriptar = psClave
End Function

'---------------------------------------------------------
Sub getRS(ByRef RS, psConsulta)
  Set RS = Server.CreateObject("ADODB.Recordset")
  RS.Open psConsulta, cnn
  
End Sub

'----------------------------------------------------------


sub modMetas()
Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_PROYECTO_LISTAR  ")
	
	registro = 0		

	response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
	response.Write " <td> Nro.</td>"
    response.Write " <td>CODIGO<BR>META</td>"
    response.Write " <td >CODIGO<BR>PROYECTO</td>"
	response.Write " <td >DESCRIPCI&Oacute;N</td>"
	response.Write " <td>DEPENDENCIA</td>"
	response.Write " <td>FECHA ACTIVACION</td>"
    response.Write "  </tr>"
While not wRsDptoapli.EOF 

				registro = registro + 1
		
 response.Write" <tr class=""dato3"">"
 response.Write "<td>"&registro&"</td>"
 response.Write "<td>" & wRsDptoapli("codi_Meta") & "</td>"
 response.Write "<td>" & wRsDptoapli("cod_Proyecto") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("desc_Proyecto")&" </td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("DEPENDENCIA") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("fecha_activacion") & "</td>"
 response.Write "</tr>"

 	wRsDptoapli.MoveNext
	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
end Sub 

'-------------------------------------------------------------------

sub mosPresupuesto(id_proy)
Response.ContentType="text/html; charset=iso-8859-1"
registro=0
	set wRsDptoapli = Micone.execute(" exec uspGet_presupuestoPEA '"&id_proy&"' ")

	response.Write " <table align=""center"" width=""90%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write "<tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
    response.Write "<td width=""2%"">N&deg;</td>"
    response.Write "<td width=""35%"">Cargo Funcional</td>"
    response.Write "<td width=""38%"">Cargo de Contrataci&oacute;n</td>"
	response.Write "<td width=""5%"">Sueldo</td>"
	response.Write "<td width=""5%"">Cantidad</td>"
    response.Write " <td width=""7%"">Periodo</td>"
	response.Write " <td width=""10%"">Monto Total</td>"
    response.Write "  </tr>"
 actividad =""
While not wRsDptoapli.EOF
 
IF(ISNULL(wRsDptoapli("total")) )THEN
VALOR =0
ELSE
VALOR =wRsDptoapli("total")
END IF

if (wRsDptoapli("desc_CargoFuncional")="TOTAL") then 
response.Write" <tr class=""dato3"">"
 response.Write "<td align=""right"" colspan=""6"" bgcolor=""#FFFFE6"">" & wRsDptoapli("desc_CargoFuncional") & "</td>"
   response.Write "<td  align=""right"" bgcolor=""#FFFFE6"">&nbsp;" &FormatNumber(VALOR,2) & "</td>"
 response.Write "</tr>"
 
 else 
 if (actividad<>wRsDptoapli("id_Actividad")  ) then 
 response.Write" <tr class=""dato3"">"
 response.Write "<td align=""left"" colspan=""7"" bgcolor=""#DFDFFF"">" & wRsDptoapli("dactividad") & "</td>"
 response.Write "</tr>"
  response.Write" <tr class=""dato3"" >"
 response.Write "<td>" & registro& "</td>"
 response.Write "<td>" & wRsDptoapli("desc_CargoFuncional") & "</td>"
 response.Write "<td>" & wRsDptoapli("DESC_CARG") & "</td>"
  response.Write "<td  align=""center"">&nbsp;" & wRsDptoapli("SUEL_CARG") & "</td>"
 response.Write "<td  align=""center"" id=""totalPEA_P" & wRsDptoapli("id_presupuesto") & """><a href=""#"" onclick=""javascript:mod_pres('" & wRsDptoapli("id_presupuesto") & "','" & wRsDptoapli("totalPEA_P") & "','totalPEA_P')"">" & wRsDptoapli("totalPEA_P") & "</a>&nbsp;</td>"
  response.Write "<td id=""nPeriodo_P" & wRsDptoapli("id_presupuesto") & """><a href=""#"" onclick=""javascript:mod_pres('" & wRsDptoapli("id_presupuesto") & "','" & wRsDptoapli("nPeriodo_P") & "','nPeriodo_P')"">" & wRsDptoapli("nPeriodo_P") & "</a> &nbsp;"& wRsDptoapli("tperiodo") &"</td>"
   response.Write "<td  align=""right"">&nbsp;" & FormatNumber(VALOR,2)  & "</td>"

 response.Write "</tr>"
 else 
 
 response.Write" <tr class=""dato3"" >"
 response.Write "<td>" & registro& "</td>"
 response.Write "<td>" & wRsDptoapli("desc_CargoFuncional") & "</td>"
 response.Write "<td>" & wRsDptoapli("DESC_CARG") & "</td>"
  response.Write "<td  align=""center"">&nbsp;" & wRsDptoapli("SUEL_CARG") & "</td>"
 response.Write "<td  align=""center"" id=""totalPEA_P" & wRsDptoapli("id_presupuesto") & """><a href=""#"" onclick=""javascript:mod_pres('" & wRsDptoapli("id_presupuesto") & "','" & wRsDptoapli("totalPEA_P") & "','totalPEA_P')"">" & wRsDptoapli("totalPEA_P") & "</a>&nbsp;</td>"
  response.Write "<td id=""nPeriodo_P" & wRsDptoapli("id_presupuesto") & """><a href=""#"" onclick=""javascript:mod_pres('" & wRsDptoapli("id_presupuesto") & "','" & wRsDptoapli("nPeriodo_P") & "','nPeriodo_P')"">" & wRsDptoapli("nPeriodo_P") & "</a> &nbsp;"& wRsDptoapli("tperiodo") &"</td>"
   response.Write "<td  align=""right"">&nbsp;" & FormatNumber(VALOR,2)  & "</td>"

 response.Write "</tr>"


 end if 


 end if
   actividad =wRsDptoapli("id_Actividad")

wRsDptoapli.MoveNext
registro = registro + 1

	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
end Sub 


'-----------------------------------------------------------------------
sub modCCargos2(id_proyecto)
Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_Ccargo '','"&id_proyecto&"' ")

	response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
	response.Write " <td>Fuente  <br>Financiamiento</td>"
    response.Write "    <td>Cargo  <br> Funcional</td>"
    response.Write "    <td >Cargo de  <br>Contrataci&oacute;n</td>"
	response.Write "    <td >Dependencia</td>"
	response.Write " <td>Cant. PEA <br> Presupuestada</td>"
	response.Write " <td>Cant PEA CCP</td>"
	response.Write "    <td >Sueldo</td>"
	response.Write " <td >C&oacute;digo de Operaci&oacute;n</td>"
	response.Write " <td ><input name=""button2"" type=""button"" class=""boton"" id=""button2"" value=""Activar"" onClick=""javascript:llamar()""></td>"
    response.Write "  </tr>"
	
While not wRsDptoapli.EOF
oficio=""

if (oficion<>wRsDptoapli("Documento_CCP"))then 

response.Write" <tr  class=""dato3"" bgcolor=""#ECF5FF"">"
  response.Write "<td colspan=""9"">fecha :" & wRsDptoapli("fec_ccp") & " &nbsp;N&deg; " & wRsDptoapli("Documento_CCP") & "</td>"
	  response.Write"</tr>"


response.Write" <tr class=""dato3"">"
  response.Write "<td>&nbsp;" & wRsDptoapli("ftto") & "</td>"
 response.Write "<td>" & wRsDptoapli("funcional") & "</td>"
 response.Write "<td>" & wRsDptoapli("contratacion") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("depen") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("CTP") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("CTCCP") & "</td>"
 response.Write "<td  align=""right"">&nbsp;" & FormatNumber(wRsDptoapli("sueldo"),2)  &"</td>"
   response.Write "<td>&nbsp;" & wRsDptoapli("codigo") & "</td>"

   if wRsDptoapli("estado")="INACTIVO" THEN 
   
	  response.Write" <td> &nbsp; <input name=""checkbox"" type=""checkbox"" id=""checkbox"" value="""& wRsDptoapli("id_CCPresupuestario")&""">	  </td>"

ELSE 
      response.Write "<td>&nbsp;" & wRsDptoapli("estado") & "</td>"
end if
 response.Write "</tr>"


else 
response.Write" <tr class=""dato3"">"
  response.Write "<td>&nbsp;" & wRsDptoapli("ftto") & "</td>"
 response.Write "<td>" & wRsDptoapli("funcional") & "</td>"
 response.Write "<td>" & wRsDptoapli("contratacion") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("depen") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("CTP") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("CTCCP") & "</td>"
 response.Write "<td align=""right"">&nbsp;" & FormatNumber(wRsDptoapli("sueldo"),2)  &  "</td>"
   response.Write "<td>&nbsp;" & wRsDptoapli("codigo") & "</td>"

   if wRsDptoapli("estado")="INACTIVO" THEN 
   
	  response.Write" <td>&nbsp; <input name=""checkbox"" type=""checkbox"" id=""checkbox"" value="""& wRsDptoapli("id_CCPresupuestario")&""">	  </td>"


ELSE 
      response.Write "<td>&nbsp;" & wRsDptoapli("estado") & "</td>"
end if
 response.Write "</tr>"
 
 end if 
 oficion=wRsDptoapli("Documento_CCP")
wRsDptoapli.MoveNext
	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
end Sub 

'-------------------------------------------------------------------------

sub modContratos(id_proyecto)

	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_OfContratacionDirectorio '1', '"&id_proyecto&"','' ")
	
'response.Write(" exec dbo.uspGet_OfContratacionDirectorio '1', '"&id_proyecto&"' ")
		
	registro = 0		

	response.Write " <table width=""95%"" border=""1"" bordercolor=""#DAE8F3"" cellpadding=""1"" cellspacing=""1"">"
    response.Write "  <tr bgcolor=""#DAE8F3"" align=""center"" class=""dato3"">"
	response.Write " <td> Nro </td>"
    response.Write "    <td>CARGO FUNCIONAL</td>"
    response.Write "    <td >CARGO DE CONTRATACION</td>"
	response.Write "    <td >PERIODO</td>"
	response.Write " <td> SUELDO </td>"
	response.Write " <td>Nro. CONV.</td>"
	response.Write "    <td >Cantidad PEA</td>"
	response.Write "    <td >C&Oacute;DIGO DE<BR>ENV&Iacute;O</td>"
	response.Write " <td ><input name=""button2"" type=""button"" class=""boton"" id=""button2"" value=""Activar"" onClick=""javascript:llamar()""></td>"
    response.Write "  </tr>"
While not wRsDptoapli.EOF 
resolucion=""

				registro = registro + 1
                If registro Mod 2 = 0 Then
                    clase = "e_tr_even"
                Else
                    clase = "e_tr_odd"
                End If	

if (resolucion<>wRsDptoapli("resolucion"))then 

response.Write" <tr  class=""dato3"" bgcolor=""#ECF5FF"">"
response.Write "<td colspan=""8""><input name=""txtCenvdatos"" type=""hidden"" id=""txtCenvdatos"" value="&wRsDptoapli("cenvdatos")&"> fecha :" & wRsDptoapli("fecha_Resolucion") & " &nbsp;N&deg; " & wRsDptoapli("resolucion") & "</td>"
response.Write"</tr>"

			
 response.Write" <tr class=""dato3"">"
 response.Write "<td>"&registro&"</td>"
 response.Write "<td>" & wRsDptoapli("desc_CargoFuncional") & "</td>"
 response.Write "<td>" & wRsDptoapli("Desc_Carg") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("nPeriodo_CCP")&"  " & wRsDptoapli("tperiodo")&"</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("MontoUnitario") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("num_Convocatoria") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("totalPEA_OfC") & "</td>"
  response.Write "<td>&nbsp;" & wRsDptoapli("cenvdatos") & "</td>"

   if wRsDptoapli("estadodes")="INACTIVO" THEN 
   
	  response.Write" <td> &nbsp; <input name=""checkbox"" type=""checkbox"" id=""checkbox"" value="""& wRsDptoapli("id_OfContratacion")&""">	  </td>"

ELSE 
      response.Write "<td>&nbsp;" & wRsDptoapli("estadodes") & "</td>"
end if
 response.Write "</tr>"


else 
 response.Write" <tr class=""dato3"">"
 response.Write "<td>"&registro&"</td>"
 response.Write "<td>" & wRsDptoapli("desc_CargoFuncional") & "</td>"
 response.Write "<td>" & wRsDptoapli("Desc_Carg") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("nPeriodo_CCP")&"  " & wRsDptoapli("tperiodo")&"</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("MontoUnitario") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("Num_Conv") & "</td>"
 response.Write "<td>&nbsp;" & wRsDptoapli("totalPEA_OfC") & "</td>"

   if wRsDptoapli("estadodes")="INACTIVO" THEN 
   
	  response.Write" <td>&nbsp; <input name=""checkbox"" type=""checkbox"" id=""checkbox"" value="""& wRsDptoapli("id_OfContratacion")&""">	  </td>"


ELSE 
      response.Write "<td>&nbsp;" & wRsDptoapli("estadodes") & "</td>"
end if
 response.Write "</tr>"
 
 end if 
 oficion=wRsDptoapli("resolucion")
 wRsDptoapli.MoveNext
	Wend
	Response.Write "  </table>"
	
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
end Sub 



sub mosbajas(lsccdd,lsprov,lsdist, id_proyecto)

SQL1 = "exec dbo.usp_Altas_Bajas_exe_ubigeo '"& lsccdd &"', '"& lsprov &"', '"& lsdist &"', '"&id_proyecto&"'"	

Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
 
	
	If Not RSCuad.BOF And Not RSCuad.EOF Then 
	response.Write " <table width=""95%"" border=""1"" align='center' cellpadding=""2"" style=""font-size:10;"" cellspacing=""2"" bordercolor=""#DAE8F3"" >"
	   response.Write "     <tr  bordercolor=""#DAE8F3"" >"
  response.Write "        <th width=""15%"" bgcolor=""#DAE8F3""  colspan=""14""  ><img src=""images/excell1.gif"" width=""32"" height=""32"" onclick=""expAB()"" /> Exportar Altas y Bajas Ejecutadas</th>"
  
 
   response.Write "     </tr>"
   
   response.Write "   <tr>"
     response.Write "     <td width=""40"" bgcolor=""#DBDBDB"">N&deg;</td>"
     response.Write "     <td width=""136"" bgcolor=""#DBDBDB"">Fecha de Registro</td>"
     response.Write "     <td width=""136"" bgcolor=""#DBDBDB"">Cargo</td>"
     response.Write "     <td width=""136"" bgcolor=""#DBDBDB"">Status</td>"
   response.Write "       <td width=""136"" bgcolor=""#DBDBDB"">Paterno</td>"
    response.Write "      <td width=""136"" bgcolor=""#DBDBDB"">Materno</td>"
   response.Write "       <td width=""151"" bgcolor=""#DBDBDB"">Nombre</td>"
   response.Write "       <td width=""82"" bgcolor=""#DBDBDB"">DNI</td>"
    response.Write "      <td bgcolor=""#DBDBDB"">Fecha de Inicio </td>"
    response.Write "      <td bgcolor=""#DBDBDB"">Fecha de T&eacute;rmino</td>"
	response.Write "     <td bgcolor=""#DBDBDB"">Estado Contrato</td>"
	response.Write "      <td bgcolor=""#DBDBDB"">Estado Contrato</td>"
	response.Write "      <td bgcolor=""#DBDBDB"">Justificaci&oacute;n</td>"
    response.Write "     </tr>"
      numobj = (Diferencia+1)*lsNum		 					  		  
          Do While Not RSCuad.EOF		
           response.Flush()
           If registro Mod 2 = 0 Then	
		   		color=""""
		   Else	
		   		color = "#F2F3F4"	
		   End If	  
           registro = registro + 1
           sw=0				
           Fechap=""	   
           If Fechap <> "////" Then   
              For J = 0 To Diferencia Step 1												
    
	response.Write "      <tr> "
	response.Write "  <td rowspan='2' >"&RSCuad.Fields("codi")&"</td>"
    response.Write "     <td rowspan='2'>"&RSCuad.Fields("fec_reg")&"</td>"
    response.Write "     <td rowspan='2'>"&RSCuad.Fields("cargo")&"</td>"
    response.Write "     <td bgcolor='#996600'>SALE</td>"
    response.Write "     <td>"&RSCuad.Fields("ape_paterno")&"</td>"
    response.Write "     <td>"&RSCuad.Fields("ape_materno")&"</td>"
    response.Write "     <td>"&trim(RSCuad.Fields("nombre"))&"</td>"
    response.Write "     <td class='t'>"&RSCuad.Fields("dni")&"</td>"
   response.Write "      <td class='t'>"&RSCuad.Fields("fec_iniT")&"</td>"
   response.Write "      <td class='t'>"&RSCuad.Fields("fec_finT")&"</td>"
   response.Write "      <td class='t'>"&RSCuad.Fields("fec_finT")&"</td>"
   response.Write "      <td   class='t'>"&RSCuad.Fields("desEstado")&"</td>"

	   response.Write "      <td rowspan=""2"" class='t'><span class='t14'>"&RSCuad.Fields("justi")&"</span></td>"

    response.Write "   </tr>"
  response.Write "     <tr>"
    response.Write "      <td bgcolor='#99CC66'>ENTRA</td>"
    response.Write "      <td>"&RSCuad.Fields("ape_paternoI")&"</td>"
    response.Write "      <td>"&RSCuad.Fields("ape_maternoI")&"</td>"
    response.Write "      <td>"&trim(RSCuad.Fields("nombreI"))&"</td>"
  response.Write "        <td class='t'><span class='t2'>"&RSCuad.Fields("dniI")&"</span></td>"
  if RSCuad.Fields("fec_iniR")="01/01/1900" then fec="" else fec= RSCuad.Fields("fec_iniR")
  response.Write " <td class='t'><span class='t'>"&fec &"</span></td>"
 	   response.Write "      <td class='t'><span >"&RSCuad.Fields("fec_iniR")&"</span></td>"
 
    response.Write "      <td class='t'>"&RSCuad.Fields("fec_iniR")&"</td>"
	   response.Write "      <td class='t'><span >"&RSCuad.Fields("desEstadoIng")&"</span></td>"
    response.Write "    </tr> "
	

        
       sw=1
            Next
        End If
        IF sw = 0 Then 
        	End If												
         RSCuad.MoveNext
        Loop		
        If registro <> 0 then 
        End If
   response.Write "    </table>"
else
  response.Write "   <table width='95%' align='center'>"
  response.Write "    <tr>"
      response.Write "  <td class='subtitulo' colspan='4'>No hay registros disponibles</td>"
   response.Write "   </tr>"
  response.Write "   </table>"
end if
	end Sub 
	
sub mosbajas_ece(lsccdd,lsprov,lsdist, id_proyecto)

SQL1 = "exec dbo.usp_Altas_Bajas_exe_ubigeo '"& lsccdd &"', '"& lsprov &"', '"& lsdist &"', '"&id_proyecto&"'"	

Set RSCuad	= Server.CreateObject("ADODB.Recordset") 
RSCuad.cursorlocation=3
RSCuad.Open SQL1, MiCone, 3,3
 
	
	If Not RSCuad.BOF And Not RSCuad.EOF Then 
	response.Write " <table width=""95%"" border=""1"" align='center' cellpadding=""2"" style=""font-size:10;"" cellspacing=""2"" bordercolor=""#DAE8F3"" >"
	   response.Write "     <tr  bordercolor=""#DAE8F3"" >"
  response.Write "        <th width=""15%"" bgcolor=""#DAE8F3""  colspan=""14""  ><img src=""images/excell1.gif"" width=""32"" height=""32"" onclick=""expAB()"" /> Exportar Altas y Bajas Ejecutadas</th>"
  
 
   response.Write "     </tr>"
   
   response.Write "   <tr>"
     response.Write "     <td width=""40"" bgcolor=""#DBDBDB"">N&deg;</td>"
     response.Write "     <td width=""136"" bgcolor=""#DBDBDB"">Fecha de Registro</td>"
     response.Write "     <td width=""136"" bgcolor=""#DBDBDB"">Cargo</td>"
     response.Write "     <td width=""136"" bgcolor=""#DBDBDB"">Status</td>"
   response.Write "       <td width=""136"" bgcolor=""#DBDBDB"">Paterno</td>"
    response.Write "      <td width=""136"" bgcolor=""#DBDBDB"">Materno</td>"
   response.Write "       <td width=""151"" bgcolor=""#DBDBDB"">Nombre</td>"
   response.Write "       <td width=""82"" bgcolor=""#DBDBDB"">DNI</td>"
    response.Write "      <td bgcolor=""#DBDBDB"">Fecha de Inicio </td>"
    response.Write "      <td bgcolor=""#DBDBDB"">Fecha de T&eacute;rmino</td>"
	response.Write "     <td bgcolor=""#DBDBDB"">Estado Contrato</td>"
	response.Write "      <td bgcolor=""#DBDBDB"">Estado Contrato</td>"
	response.Write "      <td bgcolor=""#DBDBDB"">Justificaci&oacute;n</td>"
    response.Write "     </tr>"
      numobj = (Diferencia+1)*lsNum		 					  		  
          Do While Not RSCuad.EOF		
           response.Flush()
           If registro Mod 2 = 0 Then	
		   		color=""""
		   Else	
		   		color = "#F2F3F4"	
		   End If	  
           registro = registro + 1
           sw=0				
           Fechap=""	   
           If Fechap <> "////" Then   
              For J = 0 To Diferencia Step 1												
    
	response.Write "      <tr> "
	response.Write "  <td rowspan='2' >"&RSCuad.Fields("codi")&"</td>"
    response.Write "     <td rowspan='2'>"&RSCuad.Fields("fec_reg")&"</td>"
    response.Write "     <td rowspan='2'>"&RSCuad.Fields("cargo")&"</td>"
    response.Write "     <td bgcolor='#996600'>SALE</td>"
    response.Write "     <td>"&RSCuad.Fields("ape_paterno")&"</td>"
    response.Write "     <td>"&RSCuad.Fields("ape_materno")&"</td>"
    response.Write "     <td>"&trim(RSCuad.Fields("nombre"))&"</td>"
    response.Write "     <td class='t'>"&RSCuad.Fields("dni")&"</td>"
   response.Write "      <td class='t'>"&RSCuad.Fields("fec_iniT")&"</td>"
   response.Write "      <td class='t'>"&RSCuad.Fields("fec_finT")&"</td>"
   response.Write "      <td class='t'>"&RSCuad.Fields("fec_finT")&"</td>"
   response.Write "      <td   class='t'>"&RSCuad.Fields("desEstado")&"</td>"

	   response.Write "      <td rowspan=""2"" class='t'><span class='t14'>"&RSCuad.Fields("justi")&"</span></td>"

    response.Write "   </tr>"
  response.Write "     <tr>"
    response.Write "      <td bgcolor='#99CC66'>ENTRA</td>"
    response.Write "      <td>"&RSCuad.Fields("ape_paternoI")&"</td>"
    response.Write "      <td>"&RSCuad.Fields("ape_maternoI")&"</td>"
    response.Write "      <td>"&trim(RSCuad.Fields("nombreI"))&"</td>"
  response.Write "        <td class='t'><span class='t2'>"&RSCuad.Fields("dniI")&"</span></td>"
  if RSCuad.Fields("fec_iniR")="01/01/1900" then fec="" else fec= RSCuad.Fields("fec_iniR")
  response.Write " <td class='t'><span class='t'>"&fec &"</span></td>"
 	   response.Write "      <td class='t'><span >"&RSCuad.Fields("fec_iniR")&"</span></td>"
 
    response.Write "      <td class='t'>"&RSCuad.Fields("fec_iniR")&"</td>"
	   response.Write "      <td class='t'><span >"&RSCuad.Fields("desEstadoIng")&"</span></td>"
    response.Write "    </tr> "
	

        
       sw=1
            Next
        End If
        IF sw = 0 Then 
        	End If												
         RSCuad.MoveNext
        Loop		
        If registro <> 0 then 
        End If
   response.Write "    </table>"
else
  response.Write "   <table width='95%' align='center'>"
  response.Write "    <tr>"
      response.Write "  <td class='subtitulo' colspan='4'>No hay registros disponibles</td>"
   response.Write "   </tr>"
  response.Write "   </table>"
end if
	end Sub 
		


Function NumFicha()
	Dim lsSQL
	lsSQL = "EXEC dbo.uspEce_UltimaFicha"	
	Call getRS(RS, lsSQL)
	liMaxFicha = 1
	If Not RS.BOF And Not RS.EOF Then 
		liMaxFicha = RS.Fields("id_ficha") + 1
	End If
	If liMaxFicha = null Then liMaxFicha = 1
	NumFicha =liMaxFicha
End Function


function getParam(param)
	Dim lsSQL, lsVal
	lsSQL = "exec dbo.Parametro_obtener '"&param&"' "	
	Call getRS(RS, lsSQL)
	
	If Not RS.BOF And Not RS.EOF Then 
		lsVal = RS.Fields("valor")
	End If
	
	getParam = lsVal
end function

function cadParam(param,valor)
	Dim lsSQL, lsRpta
	lsSQL = "exec dbo.Parametro_cadena '"&param&"','"&valor&"' "	
	Call getRS(RS, lsSQL)
	
	If Not RS.BOF And Not RS.EOF Then 
		lsRpta = RS.Fields("rpta")
	End If
	
	cadParam = lsRpta
end function

%>

