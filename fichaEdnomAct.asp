<%@ Language=VBScript %>
 <%session.lcid=2057%>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 

 
<%Response.ContentType="text/html; charset=iso-8859-1"

lsRol = CStr(Session("txtTipoUsuarioValido"))


id=request("id")
p=request("p")
dni=request("dni")

	Response.ContentType="text/html; charset=iso-8859-1"			
	SQLContCapac = "EXEC dbo.pa_CargoConvocatoria_ficha '"&id&"' ,'1' " 

	set wRsDptoapli = Micone.execute(SQLContCapac)
	
	

id_cargo=wRsDptoapli.fields("tipo")&"*"&wRsDptoapli.fields("id_Presupuesto")&"*"&wRsDptoapli.fields("id_ConvocatoriaCargo")
id_tipo=wRsDptoapli.fields("tipo")
id_caroQ=wRsDptoapli.fields("id_Presupuesto")
meta=wRsDptoapli.fields("meta")
id_proyecto=wRsDptoapli.fields("id_proyecto")
experiencia_1=wRsDptoapli.fields("experiencia_1")
experiencia_2=wRsDptoapli.fields("experiencia_2")
experiencia_3=wRsDptoapli.fields("experiencia_3")
testP=wRsDptoapli.fields("Test_psicologico")
testC=wRsDptoapli.fields("Test_conocimientos")
MomentoC=wRsDptoapli.fields("Momento_Test")
MomentoP=wRsDptoapli.fields("Momento_psico")
sexo_ficha=wRsDptoapli.fields("sexo_ficha")
quechua=wRsDptoapli.fields("quechua")
Datos_adicionales=wRsDptoapli.fields("Datos_adicionales")
Adjuntar_cv=wRsDptoapli.fields("Adjuntar_cv")

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing


sub generaCargo()
			
	SQLContCapac = "EXEC dbo.uspget_CargoConvocatoria_uno '"&id&"' ,'1' " 
		set wRsDptoapli = Micone.execute(SQLContCapac)

		Response.ContentType="text/html; charset=iso-8859-1"
		response.write wRsDptoapli("desc_cargoFuncional")

		wRsDptoapli.Close
		Set wRsDptoapli = Nothing
	
End sub

sub generaSedeOp(id)

	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_sedeop_listar '"&id&"' ")
	
	Response.Write "<select DISABLED class=""e_combo"" style=""width:200px"" id=""txtSedeop""  name=""txtSedeop"" onChange=""validaUbigeo(this.value); validadepaEd() "">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		if lsDptoI&lsProvI&lsDistI = wRsDptoapli(4)then 
		
		Response.Write "<option selected value=""" & wRsDptoapli(0)&"*"&wRsDptoapli(1)&"*"& wRsDptoapli(2)&""">"& Server.HtmlEncode(wRsDptoapli(3)) & "</option>"
		wRsDptoapli.MoveNext
		
		else
		Response.Write "<option value=""" & wRsDptoapli(0)&"*"&wRsDptoapli(1)&"*"& wRsDptoapli(2)&""">"& Server.HtmlEncode(wRsDptoapli(3)) & "</option>"
		wRsDptoapli.MoveNext
		
		end if
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

end sub


sub generaNivel ()

	set Rs = Micone.execute(" exec dbo.getNivelFicha '"&id&"' ")

	response.Write "<select DISABLED class=""e_combo"" style=""width:170px"" id=""cmbNivelInstr"" name=""cmbNivelInstr"" onChange=""valida_nivel3(this.value); genera_grado(this.value);""  >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione..</option> "
	While Not Rs.EOF
	
	if lsNivInst=Rs(0) then 
	
		response.Write "<option selected value=""" & Rs(0) & """>" &Rs(1)& "</option>"
		else 
		response.Write "<option value=""" & Rs(0) & """>" &Rs(1)& "</option>"
		end if
		
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing

end sub


sub generaGrado ()

	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec dbo.getGradoFicha '"&id&"' ")

	
	response.Write "<select class=""e_combo"" style=""width:170px"" id=""cmbGrado"" name=""cmbGrado""  >"
	Response.Write " <option id=""valor_defecto"" value=""0"">Seleccione..</option> "
	While Not Rs.EOF
		response.Write "<option value=""" & Rs(0) & """>" &Rs(1)& "</option>"
		Rs.MoveNext
	Wend
	response.Write "</select>"
		response.Write "<span class=""alerta5"">(*)</span>"

	Rs.Close
	Set Rs = Nothing

end sub


sub generaDpto()'LUG 
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_CCDD_CONVO_recluta")


	Response.Write "<select class=""e_combo""  style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option id=""valor_defecto"" value="&lsDptoI&lsNomDptoI&">"&lsDptoI&"&nbsp;"&lsNomDptoI&"</option>"

	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 



sub generaProyectos()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_ProyectosExp ")

	Response.Write "<select disabled class=""e_combo"" style=""width:250px"" id=""txtProyecto""  name=""txtProyecto"" >"
	Response.Write " <option  id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option title='"&wRsDptoapli(1) &"' value=""" & wRsDptoapli(0) & """>"& wRsDptoapli(1)& "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write " <option id=""valor_defecto"" value=""Otros"">Otros</option>"
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 




sub generaPAIS()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getpais ")

	
	Response.Write "<select disabled=""Disabled"" class=""e_combo"" style=""width:200px"" id=""cmbpais"" name=""cmbpais"" onChange=""validanac(this.value);"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if wRsDptoapli(1) = lspais then 
			Response.Write "<option value=""" & wRsDptoapli(1) & """ selected>" &wRsDptoapli(2) & "</option>"
	else 
		Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaIdioma()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_LISTAR_IDIOMASC ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbIdiomaC"" name=""cmbIdiomaC"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaZona()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getZONA ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" disabled id=""cmbZona"" name=""cmbZona"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if  wRsDptoapli(1) = lsTipoZona then 
		Response.Write "<option value=""" & wRsDptoapli(1) & """ selected>" &wRsDptoapli(2) & "</option>"
		else 
	Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
	end if 
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaFuncional()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getcargo1 ")

	
	Response.Write "<select class=""e_combo"" disabled style=""width:200px"" id=""txtCargoInei"" name=""txtCargoInei"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaVIA()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getvia ")

	
	Response.Write "<select disabled class=""e_combo"" style=""width:150px"" id=""cmbTipovia"" name=""cmbTipovia""  >"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if wRsDptoapli(0)=cint(lsTipoVia) then 
		Response.Write "<option value=""" & wRsDptoapli(1) & """ SELECTED>" &wRsDptoapli(2) & "</option>"
	else 
		Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
	end if 
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaDpto3()'NAC
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCCDD2 ")

	
	Response.Write "<select disabled=""Disabled"" class=""e_combo"" style=""width:200px"" id=""txtDpto3"" name=""txtDpto3""  onChange=""generaprov3();"" >"
	Response.Write " <option id=""0"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	IF wRsDptoapli(1) = lsDptoN&" "&lsNDptoN  THEN 
		Response.Write "<option value=""" & wRsDptoapli(0) & """ SELECTED >" &wRsDptoapli(1) & "</option>"
	ELSE 
			Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
	END IF
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub



sub generaprofesion()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getProfesion ")

	
	Response.Write "<select disabled class=""e_combo"" style=""width:300px"" id=""cmbProfesion"" name=""cmbProfesion""  >"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	if wRsDptoapli(1) = lsprofesion  then 
		Response.Write "<option value=""" & wRsDptoapli(1) & """ selected>" &wRsDptoapli(2) & "</option>"
	else 
			Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub




sub generaUniversidad()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getUniversidad ")

 if lsNivInst = "3" then 
	Response.Write "<select disabled class=""e_combo"" style=""width:300px"" disabled id=""cmbUniversidad""  name=""cmbUniversidad""  >"
else 
	Response.Write "<select class=""e_combo"" style=""width:300px"" id=""cmbUniversidad""  name=""cmbUniversidad""  >"
	
	 end if
		Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	if wRsDptoapli(1) = lsUniv  then 
		Response.Write "<option value=""" & wRsDptoapli(1) & """ selected>" &wRsDptoapli(2) & "</option>"
	else 
		Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
	end if 
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaDpto2()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_dpto_cerresidencia   ")



	Response.Write "<select class=""e_combo""  disabled style=""width:200px"" id=""txtDpto2"" name=""txtDpto2""   onChange=""generaprov2(), validadepa(); "" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	 	
	if lsDptoRc =wRsDptoapli("ccdd") then
		Response.Write "<option selected value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
	else
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub


sub generaTipoPension()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_pension_listar ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtTipoPension""  name=""txtTipoPension"" onchange=""validarPension(this.value)"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if id_tipoPension=wRsDptoapli(0) then 
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ selected>"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub 

sub generaTipoPension1()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_pension_listar ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtPo_TipoPension""  name=""txtPo_TipoPension"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaAFP()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_AFP_listar ")

	Response.Write "<select disabled class=""e_combo"" style=""width:200px"" id=""txtAFP""  name=""txtAFP"" >"
	
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaAFP()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_AFP_listar ")

    if 	id_tipoPension= "19990" then
	Response.Write "<select disabled class=""e_combo"" style=""width:200px"" id=""txtAFP""  name=""txtAFP"" >"
	else 
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtAFP""  name=""txtAFP"" >"
	end if
	
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if id_afp=wRsDptoapli(0) then 
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ selected>"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaComision()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_comision_AFP_listar ")
	
	if 	id_tipoPension="19990" then
	Response.Write "<select disabled class=""e_combo"" style=""width:200px"" id=""txtComision""  name=""txtComision"" >"
	else 
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtComision""  name=""txtComision"" >"
	end if
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if id_comision=wRsDptoapli(0) then 
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ selected>"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 
sub generaTipoCuenta()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_TIPO_CUENTA_listar ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtTipoCuenta""  name=""txtTipoCuenta"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
		Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaBanco()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_BANCO_listar ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtBanco""  name=""txtBanco"" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


Response.Expires = 0

lsSQL = "EXEC dbo.pa_ficha_datos_InscripcionActED '"&id&"','"&p&"','"& dni&"' "

Call getRS(RS, lsSQL)
		
	If Not RS.BOF And Not RS.EOF Then	

	lsid_per= Rs.Fields("id_per")
	lsDptoI = Rs.Fields("ccdd_i")'15lima
	lsNomDptoI = Rs.Fields("DPTO")
	lsProvI = Rs.Fields("ccpp_i")'1501lima
	lsNomProvI = Rs.Fields("prov")
	lsDistI= Rs.Fields("ccdi_i")
	lsNomDistI = Rs.Fields("dist")
	lsCargo = Rs.Fields("tipo")&Rs.Fields("id_presupuesto")
	lscargocombo=Rs.Fields("cargocombo")
	lsNCargo = Rs.Fields("cargo")
	lsFuncional = Rs.Fields("funcional")
	lsCSIGA = Rs.Fields("cargosiga")
	lsApePaterno = Rs.Fields("ape_paterno")
	lsApeMaterno = Rs.fields("ape_materno")
	lsNombre = Rs.Fields("nombre")
	lsNombre2 = Rs.Fields("nombre2")
	lsPEA= Rs.Fields("ape_paterno")&" "&Rs.fields("ape_materno")&" "&Rs.Fields("nombre")&" "&Rs.Fields("nombre2")
	lsSexo = Rs.Fields("sexo")	
	lsAnio = MID(RS.FIELDS("FEC_NAC"),7,4)
	lsMes = MID(Rs.Fields("FEC_NAC"),4,2)
	lsDia = MID(RS.FIELDS("FEC_NAC"),1,2)
	lspais = Rs.Fields("PAIS")
	lsDptoN = Rs.Fields("ccdd_n")
	lsProvN = Rs.Fields("ccpp_n")
	lsDistN = Rs.Fields("ccdi_n")	
	lsNDptoN = Rs.Fields("NDPTO")
	lsNProvN = Rs.Fields("NPROV")
	lsNDistN = Rs.Fields("NDIST")	

	lsDNI = Rs.Fields("DNI")
	lsRUC = Rs.Fields("RUC")
	lsECivil = Rs.Fields("id_estadocivil")
	lsCmbLen = 	Rs.Fields("id_leng")
	lsTelefono = Rs.Fields("telefono")
	lsCelular = Rs.Fields("celular")
	lsOperCel =	Rs.Fields("Opercel")
	lsEmail = Rs.Fields("correo")
	lsTipoVia = Rs.Fields("CodTipoVia")
	lsNomVia = Rs.Fields("DireccionNombreVia")
	lsNumPuerta = Rs.Fields("DireccionPuerta")
	lsNumKilometro = Rs.Fields("DireccionKm")
	lsNumManzana = Rs.Fields("DireccionManzana")
	lsNumInterior = Rs.Fields("DireccionInterior")
    lsDepa = Rs.Fields("Direcciondepa")
	lsNumPiso = Rs.Fields("DireccionPiso")
	lsNumLote = Rs.Fields("DireccionLote")
	lsTipoZona = Rs.Fields("CodTipoZon")
	lsNomZona = Rs.Fields("NomZona")
	lsDptoRc = Rs.Fields("Direccionccdd")
	lsNomDptoR = Rs.Fields("RDPTO")
	lsProvRc = Rs.Fields("Direccionccpp")
	lsNomProvR=Rs.Fields("RPROV")
	lsDistRc = Rs.Fields("Direccionccdi")	
	lsNomDistR =Rs.Fields("RDIST")
	lsNivInst = Rs.Fields("id_nivel")
	lsTipEst = Rs.Fields("tipo_estudio")
	lsGrado = Rs.Fields("grado")
	lsAnio2 = MID(Rs.Fields("fec_exp"),7,4)
	lsMes2 = MID(Rs.Fields("fec_exp"),4,2)
	lsDia2 = MID(Rs.Fields("fec_exp"),1,2)
	
	lsperioAlc = Rs.Fields("perio_alc")
	lsTiPerAlc = Rs.Fields("tipo_perio")
	
	lsprofesion = Rs.Fields("profesion")
		
	lsUniv = Rs.Fields("universidad")
	lsLugEst = Rs.Fields("LugEstudio")
	lsExpGen_anio = Rs.Fields("expgen_anio")
	lsExpGen_meses = Rs.Fields("expgen_meses")
	lsExpCampoanio = Rs.Fields("expCampo_anio")
	lsExpCampomeses = Rs.Fields("expCampo_meses")
	lsExpGrupoanio = Rs.Fields("expGrupo_anio")
	lsExpGrupomeses = Rs.Fields("expGrupo_meses")	
	lsIneiProc = trim(Rs.Fields("inei_proc"))
	lsProyecto = UCase(Rs.Fields("proyecto"))
	lsIneiAnio = trim(Rs.Fields("inei_anio"))
	lsCargoInei = Rs.Fields("cargoinei")
	lsdisponi = Rs.fieldS("disponi")
	lsvaraci = Rs.fieldS("verac_datos")
	lsexpCapaAnio = trim(Rs.Fields("expCapaAnio"))
	lsexpDocAnio = Rs.Fields("expDocAnio")
	lsactivo =  Rs.Fields("activo")
	lenguaMaterna =  Rs.Fields("lenguaMaterna")
	jefeCasa =  Rs.Fields("jefeCasa")
	hijoUnico =  Rs.Fields("hijoUnico")
	lengua= Rs.Fields("lengua")
	CursoCapacitacion=Rs.Fields("CursoCapacitacion")
	fechaInicioCap=Rs.Fields("fechaInicioCap")
	capAnio = MID(Rs.Fields("fechaInicioCap"),7,4)
	capMes = MID(Rs.Fields("fechaInicioCap"),4,2)
	capDia = MID(Rs.Fields("fechaInicioCap"),1,2)
	
	fechafincap=Rs.Fields("fechafincap")
	FcapAnio = MID(Rs.Fields("fechafincap"),7,4)
	FcapMes = MID(Rs.Fields("fechafincap"),4,2)
	FcapDia = MID(Rs.Fields("fechafincap"),1,2)
	
	HorasLectivas=Rs.Fields("HorasLectivas")
	cargoINEI=Rs.Fields("cargoINEIDesc")
	ls_descGrado=Rs.Fields("ls_descGrado")
	fec_reg=Rs.Fields("fec_reg")
	num_conv=Rs.Fields("num_conv")
	
	Num_reg_grado=Rs.Fields("Num_reg_grado")
	lugar_capacitacion=Rs.Fields("lugar_capacitacion")
	idiomaExtr=Rs.Fields("idioma_req")
	nivelIdiomaExt=Rs.Fields("nivelIdiomaExt")
	dominioIdiomaExt=Rs.Fields("dominioIdiomaExt")
	
	id_tipoPension=Rs.Fields("id_tipoPension")
	id_afp=Rs.Fields("id_afp")
	fec_AfiliaAFP=Rs.Fields("fec_AfiliaAFP")
	if fec_AfiliaAFP="01/01/1900" then 
	fec_AfiliaAFP=""
	end if
	num_CUSSP=Rs.Fields("num_CUSSP")
	id_comision=Rs.Fields("id_comision")
	po_id_TipoPension=Rs.Fields("po_id_TipoPension")
    siDescuento=Rs.Fields("siDescuento")


	ExpFormacion=Rs.Fields("ExpFormacion")
	ExpAplicacion=Rs.Fields("ExpAplicacion")
	NombreFormacion=Rs.Fields("NombreFormacion")
	NombreAplicacion=Rs.Fields("NombreAplicacion")
	TiempoFormacion=Rs.Fields("TiempoFormacion")
	TiempoAplicacion=Rs.Fields("TiempoAplicacion")
	Cargo1=Rs.Fields("Cargo1")
	Cargo2=Rs.Fields("Cargo2")
	EmpCargo1=Rs.Fields("EmpCargo1")
	EmpCargo2=Rs.Fields("EmpCargo2")

	tiempoCargo1=Rs.Fields("tiempoCargo1")
	tiempoCargo2=Rs.Fields("tiempoCargo2")

	especialidad_ednom=Rs.Fields("especialidad_ednom")
	mod_edu_1=Rs.Fields("mod_edu_1")
	mod_edu_2=Rs.Fields("mod_edu_2")
	mod_edu_3=Rs.Fields("mod_edu_3")
	mod_edu_4=Rs.Fields("mod_edu_4")
	mod_edu_5=Rs.Fields("mod_edu_5")
	mod_edu_6=Rs.Fields("mod_edu_6")
	mod_cod_1=Rs.Fields("mod_cod_1")
	mod_cod_2=Rs.Fields("mod_cod_2")
	mod_cod_3=Rs.Fields("mod_cod_3")
	mod_cod_4=Rs.Fields("mod_cod_4")
	mod_cod_desc=Rs.Fields("mod_cod_desc")
	disp_varios=Rs.Fields("disp_varios")
	RESPONSE.Write(disp_varios)
	
	
	otro_inst=Rs.Fields("otro_inst")
	especialidad_ednom=Rs.Fields("especialidad_ednom")
	prof_ednom=Rs.Fields("prof_ednom")
	
	preg1=Rs.Fields("preg1")
	preg2=Rs.Fields("preg2")
	preg3=Rs.Fields("preg3")
	preg4=Rs.Fields("preg4")
	preg5=Rs.Fields("preg5")
	preg6=Rs.Fields("preg6")
	preg7=Rs.Fields("preg7")
	preg8=Rs.Fields("preg8")
	preg9=Rs.Fields("preg9")
	preg10=Rs.Fields("preg10")
	preg11=Rs.Fields("preg11")
	preg12=Rs.Fields("preg12")
	preg13=Rs.Fields("preg13")
	
	TiempoOf=Rs.Fields("TiempoOf")
	TiempoHL=Rs.Fields("TiempoHL")
	HorasLectivasOf=Rs.Fields("HorasLectivasOf")
	FecFinCursoOf=Rs.Fields("FecFinCursoOf")
	FecIniCursoOf=Rs.Fields("FecIniCursoOf")
	
	OfIniAni = MID(Rs.Fields("FecIniCursoOf"),7,4)
	OfIniMes = MID(Rs.Fields("FecIniCursoOf"),4,2)
	OfIniDia = MID(Rs.Fields("FecIniCursoOf"),1,2)
	
	OfFinAni = MID(Rs.Fields("FecFinCursoOf"),7,4)
	OfFinMes = MID(Rs.Fields("FecFinCursoOf"),4,2)
	OfFinDia = MID(Rs.Fields("FecFinCursoOf"),1,2)
	
	lugar_capacitacionOf=Rs.Fields("lugar_capacitacionOf")
	CursoOf=Rs.Fields("CursoOf")
	TiempoFor=Rs.Fields("TiempoFor")
	CargoProc=Rs.Fields("CargoProc")
	TiempoApli=Rs.Fields("TiempoApli")
	TiempoProcesos=Rs.Fields("TiempoProcesos")
	CargoFormacion=Rs.Fields("CargoFormacion")
	CargoProcesos=Rs.Fields("CargoProcesos")
	NombreProcesos=Rs.Fields("NombreProcesos")
	CargoAplicacion=Rs.Fields("CargoAplicacion")
	ExpProcesos=Rs.Fields("ExpProcesos")
	ExpGenFec=Rs.Fields("ExpGenFec")
	ExpGenInst=Rs.Fields("ExpGenInst")
	ExpGrupoFec=Rs.Fields("ExpGrupoFec")
	ExpGrupoInst=Rs.Fields("ExpGrupoInst")
	ExpCampoFef=Rs.Fields("ExpCampoFef")
	ExpCampoInst=Rs.Fields("ExpCampoInst")
	
end if




%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=es-iso-8859-1" />

   <title>..:: SISTEMA DE CONSECUCI&Oacute;N DE RECURSOS HUMANOS ::..</title>

   <link rel="stylesheet" type="text/css" href="Styles/inei.css">
   <link rel="stylesheet" href="Styles/reveal.css">	

<script language="JavaScript1.1" src="js/cliente.js"></script>
<script language="JavaScript1.1" src="js/comun.js"></script>	
<script language="JavaScript1.1" src="js/valida.js"></script>	
<script language=JavaScript1.1 src="js/jquery.js"></script>
<script type="text/javascript" src="js/libreriaexp.js"></script>
<script>

function http_request() {
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (E) {
			xmlhttp = false;
		}
	}
	if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}


$('a[data-reveal-id]').live('click', function(e) {
		e.preventDefault();
		var modalLocation = $(this).attr('data-reveal-id');
		$('#'+modalLocation).reveal($(this).data());
	});

function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
	var codig=varDpto.substring(0,2);
	var id_cc=document.getElementById("id_cc").value;
	
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varDpto)+"&id_cc="+escape(id_cc);  // parametros a enviar al servidor	
	
	url="m6_Provincia.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov").innerHTML =ajax.responseText;
					
					
					verdis();
            }
            else if(ajax.status==404){
                     document.getElementById("prov").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov").innerHTML = ajax.responseText;	
					 
								 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}

function generaprov3(){
     
    var varDpto =document.getElementById("txtDpto3").options[document.getElementById("txtDpto3").selectedIndex].value;

    
	ajax=http_request();
	var valores;	
	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	

	
	url="m6_Provincia3.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov3").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov3").innerHTML =ajax.responseText;
					verdis4();
            }
            else if(ajax.status==404){
                     document.getElementById("prov3").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov3").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

	
function generaprov2(){
     
    var varDpto =document.getElementById("txtDpto2").options[document.getElementById("txtDpto2").selectedIndex].value;
    
	ajax=http_request();
	var valores;	
	
	valores= "datos=" + escape(varDpto);  // parametros a enviar al servidor	

	
	url="m6_Provincia2.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("prov2").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("prov2").innerHTML =ajax.responseText;
					verdis2();
            }
            else if(ajax.status==404){
                     document.getElementById("prov2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("prov2").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}
function verdis3(){

    
    var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m6_Distrito3.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("distcon").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("distcon").innerHTML =ajax.responseText;//}
					
            }
            else if(ajax.status==404){
                     document.getElementById("distcon").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("distcon").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}





function verdis4(){

    
    var varProv =document.getElementById("txtProv3").options[document.getElementById("txtProv3").selectedIndex].value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m6_Distrito4.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("dist4").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("dist4").innerHTML =ajax.responseText;//}
            }
            else if(ajax.status==404){
                     document.getElementById("dist4").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist4").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	

}





function verdis(){

  
    var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m16_Distrito.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
			 document.getElementById("dist").innerHTML ="<span class=etiqueta>Cargando......</span>"; //}
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
						document.getElementById("dist").innerHTML =ajax.responseText;//}
						verdis3();
						
						
            }
            else if(ajax.status==404){
                     document.getElementById("dist").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function vercargos(){
	return false;
    
     var varProv =document.getElementById("txtProv1").options[document.getElementById("txtProv1").selectedIndex].value;
    var varDpto =document.getElementById("txtDpto1").options[document.getElementById("txtDpto1").selectedIndex].value;
    var varDist =document.getElementById("txtDist1").options[document.getElementById("txtDist1").selectedIndex].value;

	ajax=http_request();
	var valores;	
	valores= "varDpto=" + escape(varDpto)+"&varProv="+escape(varProv)+"&varDist="+escape(varDist);  // parametros a enviar al servidor
	
	url="m61_cargos.asp";  
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("carg").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("carg").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("carg").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("carg").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function verdis2(){
    
    var varProv =document.getElementById("txtProv2").options[document.getElementById("txtProv2").selectedIndex].value;
    
 
	ajax=http_request();
	var valores;	
	valores= "datos=" + escape(varProv);  // parametros a enviar al servidor	
	
	url="m6_Distrito2.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("dist2").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("dist2").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("dist2").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("dist2").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}


function verNivel(){

	nivel=escape(document.getElementById("id_cc").value);
	ajax=http_request();
	var valores;	
	valores= "nivel=" + escape(nivel);  // parametros a enviar al servidor	
	
	url="m_Nivel.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("idNivel").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("idNivel").innerHTML =ajax.responseText;
					verGrado(anivel);
            }
            else if(ajax.status==404){
                     document.getElementById("idNivel").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("idNivel").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function verGrado() {
	
	nivel=escape(document.getElementById("id_cc").value);
	
	ajax=http_request();
	var valores;	
	valores= "nivel=" + escape(nivel);  // parametros a enviar al servidor	
	
	url="m_Grado.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("idGrado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("idGrado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("idGrado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("idGrado").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
	
}

</script>
<script>
var enProceso = false; // lo usamos para ver si hay un proceso activo
var http = getHTTPObject(); // Creamos el objeto XMLHttpRequest
function handleHttpResponse() {
    if (http.readyState == 4) {	
       if (http.status == 200) {	   	
          if (http.responseText.indexOf('invalid') == -1) {
             results = http.responseText.split(",");
			  if( results[0] ==  "1" ){
			   document.getElementById('msj').style.display='block';
			   document.getElementById("msj").innerHTML ="Usted esta descalficado para este proceso!!";
			   setTimeout("document.getElementById('txtDNI').focus();",1);
               document.getElementById("button1").disabled=true;
			   enProceso = false;
			  }else if( results[0] ==  "2"){
			  
			document.getElementById('msj').style.display='block';
			   document.getElementById("msj").innerHTML ="El DNI ya fue registrado!!";
			   setTimeout("document.getElementById('txtDNI').focus();",1);
               document.getElementById("button1").disabled=true;
               enProceso = false;
			  }
			  else{
			  document.getElementById('msj').style.display='none';
			   document.getElementById("button1").disabled=false;
			   enProceso = false;
			  }
          }
       }
    }
}

function Validar() {

   var obj = document.getElementById('txtDNI');   
   if(obj.value.length < 8 ){	
	setTimeout("document.getElementById('txtDNI').focus();",1);
	document.getElementById('msj2').style.display='block';
	alert("N\xfamero ingresado incorrecto");
	}
	else{

	document.getElementById('msj2').style.display='none';	
		if (!enProceso && http) {			
		   var valor = escape(document.getElementById("txtDNI").value);		   
		   var url = "verificar.asp?dni="+ valor;	
		   http.open("GET", url, true);
		   http.onreadystatechange = handleHttpResponse;
		   enProceso = true;
		   http.send(null);
		}
	}    
}

function verificadist()
{
	   var dist1 = document.getElementById('txtDist1').value;   
   var dist2 = document.getElementById('txtDist3').value;   

	if(dist1 != '0'){
	if(dist2 != dist1 )
	{
	   alert("Los Distritos no coinciden no coniciden");	
	   	  document.getElementById("button1").disabled=true;
   
    }   
	else
	{ document.getElementById('txtDist1').disabled=false;
		  document.getElementById("button1").disabled=false;
	}
  }

	
	}





function ValidarDNIC() {
   var dni1 = document.getElementById('txtDNI').value;   
   var dni2 = document.getElementById('txtDNI2').value;   

	if(dni2 != ''){
	if(dni1 != dni2 )
	{
	   alert("Los DNIs no coniciden");	  
	   	  document.getElementById("button1").disabled=true;
 
    }   
	else
	{ document.getElementById('txtDNI').disabled=false;
		  document.getElementById("button1").disabled=false;

	}
  }
}


function ValidarRUC() {
   lngruc=document.frmMiForm.txtRUC.value.length;
	if(lngruc <11 && lngruc>0)
	{
	   alert("El n\xfamero de RUC debe de ser de 11 d\xedgitos");	
	   	  document.getElementById("button1").disabled=true;
 
    }   
	else
	{ document.getElementById('txtRUC').disabled=false;
		  document.getElementById("button1").disabled=false;

	}

}


function ValidarRUC2() {
   var dni1 = document.getElementById('txtRUC').value;   
   var dni2 = document.getElementById('txtRUC2').value;   

	if(dni2 != ''){
	if(dni1 != dni2 )
	{
	   alert("Los RUCs no coniciden");	  
	   	  document.getElementById("button1").disabled=true;
 
    }   
	else
	{ document.getElementById('txtRUC2').disabled=false;
		  document.getElementById("button1").disabled=false;

	}
  }
}



function getHTTPObject() {
    var xmlhttp;
    if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
       try {
          xmlhttp = new XMLHttpRequest();
       } catch (e) { xmlhttp = false; }
    }
    return xmlhttp;
} 


function fs_numeros(e) {
	
        tecla = (document.all) ? e.keyCode : e.which; 

		if (tecla < 48 || tecla > 57) {
			return false;
			
		}
        if (tecla==8 || tecla!=13) return true;
}

function fs_SoloLetras(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 
			
			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209  && tecla != 45)
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}

function fs_alfanumerico(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 
			
			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209 && tecla != 49 && tecla != 50 && tecla != 51 && tecla != 52 && tecla != 53 && tecla != 54 && tecla != 55 && tecla != 56 && tecla != 57 && tecla != 48 && tecla != 95 && tecla != 45)
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}


function fs_alfanumericoE(e) { 

            tecla = (document.all) ? e.keyCode : e.which; 
			if ((tecla < 65 ||  tecla > 90) && (tecla < 97  ||  tecla > 122)){
				if ( tecla!=32 &&  tecla != 193 && tecla != 201 && tecla != 205 && tecla != 211 && tecla != 218 && tecla != 220 && tecla != 225 && tecla != 233 && tecla != 237 && tecla != 243 && tecla != 250 && tecla != 252 && tecla != 241 && tecla != 209 && tecla != 49 && tecla != 50 && tecla != 51 && tecla != 52 && tecla != 53 && tecla != 54 && tecla != 55 && tecla != 56 && tecla != 57 && tecla != 48 && tecla != 64  && tecla != 95 && tecla != 45 && tecla != 46)
			return false;
			
			}
            if (tecla==8 || tecla!=13) return true;
			
}

function  valida_quechua (){
	
	
	var varDpto =document.getElementById("txtDpto1").value;
	var id_proyecto =document.getElementById("id_proyecto").value;
	var id_caroQ =document.getElementById("id_caroQ").value;
	
	if (id_caroQ==354 || id_caroQ==2){
	if (id_proyecto==2 && (varDpto=='02' || varDpto=='03' ||varDpto=='08' || varDpto=='09' || varDpto=='05'|| varDpto=='10')){
		
		document.getElementById("cmbIdiomaQ").style.display="";
		document.getElementById("idiomaQ").style.display="";
		document.getElementById("idiomaQ1").style.display="none";
	
	} else if (id_proyecto==2 &&  varDpto=='21'){
		document.getElementById("cmbIdiomaQ").style.display="";
		document.getElementById("idiomaQ1").style.display="";
		document.getElementById("idiomaQ").style.display="none";
	} else {
		document.getElementById("cmbIdiomaQ").style.display="none";
		document.getElementById("idiomaQ1").style.display="none";
		document.getElementById("idiomaQ").style.display="none";
	}
	
	}
	
		if (id_caroQ==355 || id_caroQ==3){
	if (id_proyecto==2 && (varDpto=='02' || varDpto=='05' || varDpto=='10'|| varDpto=='09')){
		
		document.getElementById("cmbIdiomaQ").style.display="";
		document.getElementById("idiomaQ").style.display="";
		document.getElementById("idiomaQ1").style.display="none";
	}  else if (id_proyecto==2 &&  varDpto=='21'){
		document.getElementById("cmbIdiomaQ").style.display="";
		document.getElementById("idiomaQ1").style.display="";
		document.getElementById("idiomaQ").style.display="none";
	}  else {
		document.getElementById("cmbIdiomaQ").style.display="none";
		document.getElementById("idiomaQ1").style.display="none";
		document.getElementById("idiomaQ").style.display="none";
	}
	
	}
}


function  validaQ (valor){
	
	var id_caroQ =document.getElementById("id_caroQ").value;
	
	if (id_caroQ==2){
		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito el dominio fluido del idioma quechua');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	
	}
}

function  validaDJ(valor){
	

		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito que los datos consigandos correspondan a la verdad');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	

}

function  validaHorario(valor){

		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito tener compromiso de trabajo en horarios de los informantes');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	

}

function  validadom(valor){
	
		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito tener disponibilidad de trabajo los s\xe1bados, domingos y feriados');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	
}

function  validaDis(valor){
	
		if (valor==0 || valor==2 ){
			alert('Usted est\xe1 descalificada para este proceso, es requisito contar con disponibilidad a tiempo completo');
			document.getElementById("button1").disabled=true;
			return false;		
		}
		else {
			document.getElementById("button1").disabled=false;
			}	

}


function validarEmail( email ) {
	
	if (email!=""){
	
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ( !expr.test(email) ){
        alert(" La direcci\xf3n de correo '" + email + "' es incorrecta.");
		document.getElementById("txtEmail").focus();
		return false;
	}
	}
}


function genera_grado(valor){
	id_cc=escape(document.getElementById("id_cc").value);
	
	ajax=http_request();
	var valores;	
	valores= "nivel=" + escape(valor)+"&id_cc="+escape(id_cc);  // parametros a enviar al servidor	
	
	url="m_Grado.asp";  
	
	ajax.open ('POST', url, true);
    ajax.onreadystatechange = function() {
         if (ajax.readyState==1) {
                 document.getElementById("idGrado").innerHTML ="<span class=etiqueta>Cargando......</span>";
         }
         else if (ajax.readyState==4){
            if(ajax.status==200){
            										
					document.getElementById("idGrado").innerHTML =ajax.responseText;
            }
            else if(ajax.status==404){
                     document.getElementById("idGrado").innerHTML = "La direccion buscada no existe o no esta disponible temporalmente";
            }
            else{

                     document.getElementById("idGrado").innerHTML = ajax.responseText;					 
            }
        }
    }
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(valores);
   return;	
}

function validaProf(valor){
	if (valor==0) {
		alert ("Debe seleccionar una opci&oacute;n");
		document.getElementById("especialidad_ednom").disabled=true;
		document.getElementById("cmbProfesion").disabled=true;
		document.getElementById("cmbProfesion").value="0";
		
		}
	if (valor==1) {
		document.getElementById("especialidad_ednom").disabled=false;
		document.getElementById("cmbProfesion").disabled=true;
		document.getElementById("cmbProfesion").value="0";
	}
	if (valor==2) {
		document.getElementById("especialidad_ednom").disabled=true;
		document.getElementById("cmbProfesion").disabled=true;
		document.getElementById("cmbProfesion").value="0";
	}
	if (valor==3) {
		document.getElementById("especialidad_ednom").disabled=true;
		document.getElementById("cmbProfesion").disabled=false;
	}

}


function validaProf(valor){
	if (valor==0) {
		alert ("Debe seleccionar una opci&oacute;n");
		document.getElementById("especialidad_ednom").disabled=true;
		document.getElementById("cmbProfesion").disabled=true;
		document.getElementById("cmbProfesion").value="0";
		
		}
	if (valor==1) {
		document.getElementById("especialidad_ednom").disabled=false;
		document.getElementById("cmbProfesion").disabled=true;
		document.getElementById("cmbProfesion").value="0";
	}
	if (valor==2) {
		document.getElementById("especialidad_ednom").disabled=true;
		document.getElementById("cmbProfesion").disabled=true;
		document.getElementById("cmbProfesion").value="0";
	}
	if (valor==3) {
		document.getElementById("especialidad_ednom").disabled=true;
		document.getElementById("cmbProfesion").disabled=false;
	}

}

function validaTP(valor) {
	
	if (valor==0) {
		alert('Seleccione si esta afiliado a un tipo de pensi&oacute;n');
		document.getElementById("tr_afp4").style.display="none";
		document.getElementById("tr_afp5").style.display="none";
		document.getElementById("tr_afp7").style.display="none";
		document.getElementById("tr_afp6").style.display="none";
		
		document.getElementById("txtTipoPension").value="";
		document.getElementById("txtAFP").value="";
		document.getElementById("txtFCUSSP").value="";
		document.getElementById("txtPo_TipoPension").value="";
		document.getElementById("txtFecAfiliacion").value="";
		document.getElementById("txtComision").value="";
	}
	
	else if (valor==1){
		
		document.getElementById("txtTipoPension").disabled=false;
		document.getElementById("txtPo_TipoPension").value="";
		
		document.getElementById("tr_afp4").style.display="";
		document.getElementById("tr_afp5").style.display="";
		document.getElementById("tr_afp6").style.display="";
		document.getElementById("tr_afp7").style.display="none";

		}
	else {
		document.getElementById("tr_afp4").style.display="none";
		document.getElementById("tr_afp5").style.display="none";
		document.getElementById("tr_afp6").style.display="none";
		document.getElementById("tr_afp7").style.display="";
		
		document.getElementById("txtPo_TipoPension").disabled=false;
		document.getElementById("txtTipoPension").value="";
		document.getElementById("txtAFP").value="";
		document.getElementById("txtFCUSSP").value="";
		document.getElementById("txtFecAfiliacion").value="";
		document.getElementById("txtComision").value="";
		} 
	}

function validaPension(valor) {
	
	if (valor=="") {
		alert('Seleccione tipo de pensi&oacute;n');
		document.getElementById("txtAFP").disabled=true;
		document.getElementById("txtAFP").disabled=true;
		document.getElementById("txtAFP").value="";
		document.getElementById("txtFCUSSP").value="";
	}
	
	else if (valor=="19990"){
		document.getElementById("txtAFP").value="";
		document.getElementById("txtAFP").disabled=true;
		
	 	document.getElementById("txtFecAfiliacion").value="";
		document.getElementById("txtFecAfiliacion").disabled=true;
		
		document.getElementById("txtFCUSSP").value="";
		document.getElementById("txtFCUSSP").disabled=true;
		
		document.getElementById("txtComision").value="";
		document.getElementById("txtComision").disabled=true;
		}
	else {
		document.getElementById("txtAFP").disabled=false;
		document.getElementById("txtFecAfiliacion").disabled=false;
		document.getElementById("txtFCUSSP").disabled=false;
		document.getElementById("txtComision").disabled=false;
		} 
	}
	
function validaComision (valor){
	
	if (valor==0) {
		document.getElementById("tr_afp1").style.display="";
		
		document.getElementById("tr_afp2").style.display="none";
		document.getElementById("tr_afp3").style.display="none";
		document.getElementById("tr_afp4").style.display="none";
		document.getElementById("tr_afp5").style.display="none";
		document.getElementById("tr_afp7").style.display="none";
		document.getElementById("txtSiDescuento").value="0";
		}
	else {
		document.getElementById("tr_afp2").style.display="";
		document.getElementById("tr_afp3").style.display="";
		
		document.getElementById("tr_afp1").style.display="none";
		document.getElementById("txtSiDescuento").value="1";
				
		}
	

	}	

function verSP(valor){
	if (valor=="0" || valor=="2"){
		document.getElementById("tr_afp2").style.display="none";
		document.getElementById("tr_afp3").style.display="none";
		}
	else {
		document.getElementById("tr_afp2").style.display="";
		document.getElementById("tr_afp3").style.display="";
		}
	
	
	}
	
function verDeclaracion()	{
	
	var id=document.getElementById("id_cc").value;
	var p=document.getElementById("id_proyecto").value;
	var dni=document.getElementById("txtDNI").value;
	
	 pagina = "m_declaracionEd.asp?id=" + id+"&p="+p+"&dni="+dni;
		win = window.open(pagina,'','toolbar=no,statusbar=no,titlebar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes');
	
	}
	
	
function validaUbigeo(valor){
var valor1 = valor.split("*");	
document.getElementById("txtDpto1").value=valor1[0];
document.getElementById("txtProv1").value=valor1[1];
document.getElementById("txtDist1").value=valor1[2];
document.getElementById("txtDist3").value=valor1[2];
}	
</script>
<style type="text/css">
<!--
.Estilo8 {color: #000099}
-->
</style>
</head>
<body  >
<!--#include file="cabecera.html"--> 
<!--#include file="pd_menu.asp"-->

	<div id="divContenido">
<form ENCTYPE="multipart/form-data" name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="recibir_archivo.asp">
    <table width=100%  cellpadding=0 cellspacing=0 border=0 >
<tr height=2>
		<td></td>
	</tr>
  <tr>
		<td valign=top align=center>
 			<table width="98%" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
    
 			<tr height=22>
 				<td colspan=3>
     
				  <table cellpadding="0" cellspacing="0" align="center" width="100%">
					<tr height=3>
						<td colspan=6 align=center></td>
					</tr>
          <tr height=3>
					<td colspan=6 align=left>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" >
                      <tr>
                        <td><span  ><FONT style="color:#036; font:arial; font-size:10px;"  >(*) Datos Obligatorios. &nbsp;Escriba correctamente sus datos, seg&uacute;n aparecen en su DNI, cualquier problema posterior, es exclusivamente de su responsabilidad.</font></span></td>
                      </tr>
                      <tr>
                        <td><span ><FONT  style="color:#036; font:arial; font-size:10px;" >(**) Llenar obligatoriamente uno de ellos.</font></span></td>
                      </tr>
                      <tr>
                        <td><span ><FONT  style="color:#036; font:arial; font-size:10px;" >(***) El N&uacute;mero de RUC es obligatorio presentar en el momento de la contrataci&oacute;n.</font></span></td>
                      </tr>
                    </table>
									
					<table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">							
							<tr>
							  <td height="62" colspan=7  background="images/1.jpg"  ><p><span class="mensaje2">1. Cargo y Distrito al que postula</span>  
							    <input type="hidden" id="txtFrm" name="txtFrm" value="">                                
                                <input type="hidden" id="cmbCargo" name="cmbCargo" value="<%=id_cargo%>">
                                <input type="hidden" id="meta" name="meta" value="<%=meta%>">
                                <input type="hidden" id="id_proyecto" name="id_proyecto" value="<%=id_proyecto%>">
                                <input type="hidden" id="id_caroQ" name="id_caroQ" value="<%=id_caroQ%>">
                                <input type="hidden" id="id_tipo" name="id_tipo" value="<%=id_tipo%>">
                                <input type="hidden" id="a1" name="a1" value="0">
                                <input type="hidden" id="a2" name="a2" value="0">
                                <input type="hidden" id="a3" name="a3" value="0">
                                <input type="hidden" name="finalizado" id="finalizado" value="0">
                                <input type="hidden" name="id_cc" id="id_cc" value="<%=id%>">
                                <input type="hidden" name="testP" id="testP" value="<%=testP%>">
                                <input type="hidden" name="testC" id="testC" value="<%=testC%>">
                                <input type="hidden" name="MomentoP" id="MomentoP" value="<%=MomentoP%>">
                                <input type="hidden" name="MomentoC" id="MomentoC" value="<%=MomentoC%>">
						      <span class="mensajer" ></span> 
						      <input type="hidden" name="sexo_ficha" id="sexo_ficha" value="<%=sexo_ficha%>">
						      <input type="hidden" name="quechua" id="quechua" value="<%=quechua%>">
							  <input type="hidden" name="Datos_adicionales" id="Datos_adicionales" value="<%=Datos_adicionales%>">
							  <input type="hidden" name="Adjuntar_cv" id="Adjuntar_cv" value="<%=Adjuntar_cv%>">
							  </p></td>
					  </tr>
                              <tr style="display:none">
					            <td  height="33" colspan="7"  align="center"    class="mensaje6" style="border-bottom:1px solid; "><STRONG>Primero Registre los datos solicitados en la ficha, despu&eacute;s adjunte los archivos solicitados en la parte inferior del cuestionario para que su inscripci&oacute;n sea exitosa.</STRONG></td>
      </tr>
							<tr height=18>
                             <td colspan="4"  class="cabecera2"><font class="etiqueta"><strong>Cargo al que postula</strong></font></td>
						    </tr>
							<tr height=22 >
                             <td height="28" colspan="4" align="left" nowrap id="carg" ><span class="etiqueta"><font class='titulo' >USTED EST&Aacute; POSTULANDO AL CARGO DE <%generaCargo()%>
                             </font></span></td>
						    </tr>	
                            <tr height=18>
                             <td width="24%"  class="cabecera2"><font class="etiqueta"><strong>DEPARATMENTO</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>&nbsp;</strong></font><font class="etiqueta"><strong>&nbsp;PROVINCIA</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>DISTRITO</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>CONFIRME DISTRITO</strong></font></td>
						    </tr>

                            <tr height=22 >
                             <td height="28" align="left" nowrap id="carg" ><span class="etiqueta"><font class='alerta5'>
                             <%generaDpto()%>
                             (*)</font></span></td>
							  <td width="24%" align="left"  nowrap id="prov"><select disabled name="txtProv1" id="txtProv1"  class='e_combo' style="width:200px;" >
 				              <option id="txtProv1_99" title="Todos" value="<%=lsDptoI&lsProvI&lsNomProvI%>" ><%=lsProvI%>&nbsp;<%=lsNomProvI%></option>
			              </select></td>
							  <td width="26%" align="left"  nowrap id="dist"><select name="txtDist1" id="txtDist1"  class='e_combo' style="width:150px;" disabled="disabled">
 				           <option id="txtDist1_99" title="Todos" value="<%=lsDptoI&lsProvI&lsDistI&lsNomDistI%>"><%=lsDistI%>&nbsp;<%=lsNomDistI%></option>
			              </select> </td>
							  <td width="26%" align="left"  nowrap id="distcon"><select name="txtDist3" id="txtDist3"  class='e_combo' style="width:200px;" disabled="disabled">
							    <option id="txtDist1_" title="Todos" value="<%=lsDptoI&lsProvI&lsDistI&lsNomDistI%>"><%=lsDistI%>&nbsp;<%=lsNomDistI%></option>
						      </select></td>
						    </tr>	

                    </table>
			  <br>
			  <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">							
							<tr>
							  <td colspan=6 background="images/1.jpg" ><span class="mensaje2">2. Datos del Postulante</span> <span ><FONT style="color:#036; font:arial; font-size:10px;">(Escriba sus datos  tal como figuran en su DNI)	</font></span></span></td>
							</tr>
							
							<tr>
							  <td  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Apellido Paterno (DNI)</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Apellido Materno(DNI)</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>Nombres (DNI)</strong></font><font class="etiqueta"><strong></strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong></strong></font><font class="etiqueta"><strong></strong></font></td>
							  <td width="19%"  class="cabecera2"><font class="etiqueta"><strong><font class="etiqueta"><strong><font class="etiqueta"><strong><font class="etiqueta"><strong><font class="etiqueta"><strong><font class="etiqueta"><strong>Sexo</strong></font></strong></font></strong></font></strong></font></strong></font></strong></font></td>
					  </tr>
							<tr >
							  <td nowrap  ><span class="etiqueta"><font class='alerta5' >
 </font><font class='cascade4' color=crimson><font class='alerta5' >
 <input 
								  		type="text" 
								  		class='e_texto' 
										id="txtApePaterno" 
										name="txtApePaterno" 
										value="<%=lsApePaterno%>" maxlength="50" 
										style="width:220" 
                                        onKeyPress="return fs_SoloLetras(event)"
										onKeyUp="validarLetras(this.value)" 
										onBlur='fu_ValidarApePat(this)';>
 </font></font><font class='alerta5' >(*)</font></span></td>
							  <td nowrap ><span class="etiqueta"><font class='alerta5' >
						      <input  
								  		type="text" 
										class='e_texto' 
										id="txtApeMaterno" 
										name="txtApeMaterno" 
										value="<%=lsApeMaterno%>" 
										maxlength="50" 
										style="width:220" 
										 onKeyPress="return fs_SoloLetras(event)"
										onBlur='fu_ValidarApeMat(this);'>
(*)</font></span></td>
							  <td nowrap  ><span class="etiqueta"><font class='alerta5' ><font class='cascade4' color=crimson>
						      <input 
										type="text" 
										class='e_texto' 
										id="txtNombre1" 
										name="txtNombre1" 
										value="<%=lsNombre%>" 
										maxlength="50" 
										style="width:220" 
										 onKeyPress="return fs_SoloLetras(event)"
										>
                              </font>(*)</font></span></td>
							  <td nowrap  ><font class='alerta5' ><font class='cascade4' color=crimson><input name="txtNombre2" id="txtNombre2" type="hidden" value="">
							  
							  </font></font></td>
							  <td nowrap  ><span class="etiqueta"><font class='cascade4' color=crimson>
							    <select  disabled="disabled" id="cmbSexo" name="cmbSexo" class='e_combo2'>
							      <option selected="selected" value="">Seleccione...</option>
							      <option value='F'  <%if lsSexo = "F" Then response.Write("selected") End If %>>FEMENINO</option>
							      <option value='M'  <%if lsSexo = "M" Then response.Write("selected") End If %>>MASCULINO</option>
						      </select>
						      <font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='alerta5' >(*)</font></font></font></font></font></span></td>
					  </tr>
							<tr>
							  <td  class="cabecera2"><font class="etiqueta"><strong>Fecha Nacimiento </strong>(dd/mm/aaaa)-(DNI) </font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>Pais de Nacimiento</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>Departamento nacimiento</strong></font></td>
							  <td width="20%"  class="cabecera2"><font class="etiqueta"><strong>Provincia de Nacimiento</strong></font></td>
							  <td  class="cabecera2"><font class="etiqueta"><strong>Distrito de Nacimiento</strong> </font></td>
					  </tr>
							<tr nowrap>
							  <td><span class="cascade5"><font color=crimson>&nbsp;</font></span> <font class='cascade4' color=crimson>
                              <input type="text" class='e_texto' id="txtDia" disabled   name="txtDia" value="<%=lsDia%>" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)" onBlur="ValidaDia(); ValidaAnio();">
                              </font><span class="cascade5"><font class="alerta5">&nbsp;/&nbsp;</font></span><font class='cascade4' color=crimson>
                              <input type="text" class='e_texto' id="txtMes"   name="txtMes" value="<%=lsMes%>" disabled maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)" onBlur="ValidaMes();ValidaAnio();">
&nbsp;</font><span class="cascade5"><font class="alerta5">/</font></span><font class='cascade4' color=crimson>&nbsp;
<input type="text" class='e_texto' id="txtAnio" name="txtAnio" value="<%=lsAnio %>"  disabled maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio();">
</font><span class="cascade5"><font class="alerta5">(*) </font></span><font class='cascade4' color=crimson></td>
							  <td nowrap ><%generaPAIS()%>
						      <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							  <td nowrap ><%generaDpto3()%></td>
							  <td nowrap id="prov3"><select  disabled="disabled" name="txtProv3" id="txtProv3" class='e_combo' style="width:200px;" >
						        <option  value="<%=lsDptoN&lsProvN&lsNProvN%>"><%=lsNProvN%></option>
					          </select></td>
							  <td nowrap id="dist4"><select name="txtDist4" id="txtDist4" disabled="disabled" class='e_combo' style="width:150px;" >
 				            <option   value="<%=lsDptoN&lsProvN&lsDistN&lsNDistN%>"  ><%=lsNDistN%></option>
			              </select></td>
					  </tr>
							<tr> 
							<td width="22%"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;DNI</strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></td>
							<td width="22%"  class="cabecera2"><font class="etiqueta"><strong>Confirme DNI </strong></font></td>												
							 <td width="17%"  class="cabecera2"><font class="etiqueta"><strong>RUC </strong></font></td>
							 <td colspan="2"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>Confirme Ruc </strong></font></strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></td>
						    </tr>
							
							<tr>
							 <td height="32" align="left">
						     <input readonly
									type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtDNI" 
									name="txtDNI" 
									value="<%=dni%>" 
									maxlength="8" 
									onKeyPress="return fs_numeros(event)" >
							  <font class='alerta5' >(*) </font></td>
							 <td align="left"><input  readonly="true"
							  		type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtDNI2" 
									name="txtDNI2" 
									value="<%=dni%>" 
									maxlength="8" 
									onKeyPress="return fs_numeros(event)"
									onBlur="ValidarDNIC()">
                              <font class='alerta5' >(*)</font></td>		
							  <td align="left">
							  	<input 
							  		type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtRUC" 
									name="txtRUC" 
									value="<%=lsRUC%>" 
									maxlength="11" 
									onKeyPress="return fs_numeros(event)"
									onBlur="ValidarRUC()">
							  	<span class="alerta5">(***)</span></td>
							  <td colspan="2" align="left"><input 
							  		type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtRUC2" 
									name="txtRUC2" 
									value="<%=lsRUC%>" 
									maxlength="11" 
									onKeyPress="return fs_numeros(event)"
									onBlur="ValidarRUC2()">
                              <span class="alerta5">(***)</span></td>
					    </tr>
                        <tr>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>Estado Civil (DNI) </strong></font></strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong>Es Usted hijo &uacute;nico</strong></font></td>
							 <td align="left" class="cabecera2"><font class="etiqueta"><strong>Es jefe y/o responsable de su hogar</strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong><font class="etiqueta"><strong>Lengua materna que aprendi&oacute; en su ni&ntilde;ez</strong></font>&nbsp;</strong></font></td>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>Lengua originaria que actualmente domina</strong></font></td>
					  </tr>
							<tr>
							  <td height="32" align="left"><select id="txtECivil" disabled name="txtECivil" class='e_combo2'>
 				            <option value='0' selected="selected">Seleccione...</option>
 				            <option value='1' <% if lsECivil = "1" Then response.Write("selected") End If %>>Soltero(a)</option>
 				            <option value='2' <%if lsECivil = "2" Then response.Write("selected") End If %>>Casado(a)</option>
 				            <option value='3' <%if lsECivil = "3" Then response.Write("selected") End If %>>Viudo(a)</option>
 				            <option value='4' <%if lsECivil = "4" Then response.Write("selected") End If %>>Divorciado(a)</option>
 				            <option value='5' <%if lsECivil = "5" Then response.Write("selected") End If %>>Conviviente</option>
 				            </select>
                              <span class="etiqueta"><span class="cascade5"><font class="alerta5">(*)</font></span></span></td>
                              <td align="left"><font class='cascade4' color=crimson>
							    <select id="cmbHijoUnico" name="cmbHijoUnico" disabled class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option <%if hijoUnico = "Si"  or hijoUnico = "SI" Then response.Write("selected") End If %> value="1">Si</option>
							      <option  <%if hijoUnico = "No" or hijoUnico = "NO" Then response.Write("selected") End If %> value="2">No</option>
						      </select> 
						      <font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='alerta5'>(*)</font></font></font></font></font></td>
                              <td align="left"><font class='cascade4' color=crimson>
							   <select id="cmbJefeHogar" name="cmbJefeHogar" disabled class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option value="1" <%if jefeCasa = "Si" or jefeCasa = "SI" Then response.Write("selected") End If %>>Si</option>
							      <option value="2" <%if jefeCasa = "No" or jefeCasa = "NO" Then response.Write("selected") End If %>>No</option>
						      </select>
						     <font class='alerta5'>(*)</font></td>
							  <td align="left"><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							     <select id="cmbLengMat" name="cmbLengMat" disabled class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
                                  <option value="9" <%if lenguaMaterna = "CASTELLANO" Then response.Write("selected") End If %>>CASTELLANO</option>
							      <option value="1" <%if lenguaMaterna = "AWAJUN" Then response.Write("selected") End If %>>AWAJUN</option>
							      <option value="2" <%if lenguaMaterna = "QUECHUA" Then response.Write("selected") End If %>>QUECHUA</option>
							      <option value="3" <%if lenguaMaterna = "AYMARA" Then response.Write("selected") End If %>>AYMARA</option>
							      <option value="4" <%if lenguaMaterna = "SHIPIBO" Then response.Write("selected") End If %>>SHIPIBO</option>
                                  <option disabled value="5" <%if lenguaMaterna = "OTRA LENGUA NATIVA" Then response.Write("selected") End If %>>OTRA LENGUA NATIVA</option>
                                  <option value="6" <%if lenguaMaterna = "LENGUA EXTRANJERA" Then response.Write("selected") End If %>>LENGUA EXTRANJERA</option>
						      </select>
							  </font><font class='alerta5'>(*)</font></font></font></font></font></td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <select id="cmbLeng" name="cmbLeng" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option value="9" <%if lenguaMaterna = "CASTELLANO" Then response.Write("selected") End If %>>CASTELLANO</option>
							      <option value="1" <%if lenguaMaterna = "AWAJUN" Then response.Write("selected") End If %>>AWAJUN</option>
							      <option value="2" <%if lenguaMaterna = "QUECHUA" Then response.Write("selected") End If %>>QUECHUA</option>
							      <option value="3" <%if lenguaMaterna = "AYMARA" Then response.Write("selected") End If %>>AYMARA</option>
							      <option value="4" <%if lenguaMaterna = "SHIPIBO" Then response.Write("selected") End If %>>SHIPIBO</option>
                                  <option value="5" <%if lenguaMaterna = "OTRA LENGUA NATIVA" Then response.Write("selected") End If %>>OTRA LENGUA NATIVA</option>
                                  <option value="6" <%if lenguaMaterna = "LENGUA EXTRANJERA" Then response.Write("selected") End If %>>LENGUA EXTRANJERA</option>
						        </select>
						     <font class='alerta5'>(*)</font></td>
					  </tr>
                      
                      <tr>
                      <td align="left" class="cabecera2"><font class="etiqueta"><strong>Otros Idiomas que domina</strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong>Nivel</strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong>Dominio</strong></font></td>
							 <td align="left" class="cabecera2"><%if quechua=1 then%>
                        <font class="etiqueta" id="idiomaQ" ><strong>Dominio fluido del idioma quechua</strong></font><font class="etiqueta" id="idiomaQ1" style="display:none"><strong>Dominio fluido del idioma quechua y/o aymara</strong></font> <%end if%></td>
                              
                              <td align="left" class="cabecera2">&nbsp;</td>
                      </tr>
							<tr>
							  <td height="32" align="left"><%Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_LISTAR_IDIOMASC ")

	
	Response.Write "<select disabled class=""e_combo"" style=""width:200px"" id=""cmbIdiomaC"" name=""cmbIdiomaC"" >"
	 
	
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
		if idiomaExtr=wRsDptoapli(1) then
		Response.Write "<option selected  value=""" & wRsDptoapli(0) & """   >" &wRsDptoapli(1) & "</option>"
		else
		Response.Write "<option value=""" & wRsDptoapli(0) & """   >" &wRsDptoapli(1) & "</option>"
		end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing%></td>
                              <td align="left"><font class='cascade4' color=crimson>
							     <select id="cmbNivelIdioma" disabled name="cmbNivelIdioma" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option value="E" <%if nivelIdiomaExt = "E" Then response.Write("selected") End If %>>B&aacute;sico</option>
							      <option value="L" <%if nivelIdiomaExt = "L" Then response.Write("selected") End If %>>Regular</option>
                                  <option value="A" <%if nivelIdiomaExt = "A" Then response.Write("selected") End If %>>Avanzado</option>
						      </select>
                              </font></td>
                              <td align="left"><font class='cascade4' color=crimson><select disabled id="cmbDomIdioma" name="cmbDomIdioma" class='e_combo' style="width:100px">
                                  <option selected value="">Seleccione...</option>
                                  <option value="1" <%if dominioIdiomaExt = "1" Then response.Write("selected") End If %>>Solo lee</option>
                                  <option value="2" <%if dominioIdiomaExt = "2" Then response.Write("selected") End If %>>Solo escribe</option>
                                  <option value="3" <%if dominioIdiomaExt = "3" Then response.Write("selected") End If %>>Lee y escribe</option>
                                  <option value="4" <%if dominioIdiomaExt = "4" Then response.Write("selected") End If %>>Traduce</option>
                                </select>
                                
                              </font></td>
                                <td align="left">
                               <%if quechua="1" then%>                       
							    <select   id="cmbIdiomaQ" name="cmbIdiomaQ" style="width:110px;" class='e_combo' onChange="validaQ(this.value)">
							      <option selected value="0">Seleccione...</option>
							      <option value="1">Si</option>
							      <option value="2">No</option>
						      </select>
                              <%else%>
                              <input type=hidden id="cmbIdiomaQ" name="cmbIdiomaQ" value="0">
                              <%end if%>
							  </td>
							  
							  <td align="left">&nbsp;</td>
					  </tr>
							
							<tr>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Tel&eacute;fono </strong>(Use gui&oacute;n para los anexos Ej.5555555-5555)</font></td>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Celular Personal</strong></font></td>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>Oper. Celular</strong></font></td>
							  <td colspan="2" align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Correo Electr&oacute;nico</strong></font></td>
					  </tr>
							<tr>
							  <td align="left" nowrap><span class="etiqueta"><font class='cascade4' color=crimson>
							    <input 
									type="text" 
									class='e_texto' 
									style="width:100" 
									id="txtTelefono" 
									name="txtTelefono" 
                                    disabled
									value="<%=lsTelefono%>" 
									maxlength="12" 
									onKeyPress="return fs_numeros(event)"
									onBlur='validarNumeroTel(this);'>
							  </font><font class="alerta5">(**)</font></span></td>
							  <td align="left" nowrap><font class='cascade4' color=crimson>
							    <input 
                                disabled
									type="text" 
									class='e_texto' 
									id="txtCelular" 
									name="txtCelular" 
									value="<%=lsCelular%>" 
									maxlength="12" 
									 onKeyPress="return fs_numeros(event)">
						      <span class="etiqueta"><font class='cascade4' color=crimson> </font><font class="alerta5">(**)</font></span></font></td>
							  <td align="left" nowrap><font class='cascade4' color=crimson>
							     <select id="cmbOperTel" name="cmbOperTel" class='e_combo2' disabled>
 				              <option selected="selected" value="">Seleccione...</option>
 				              <option value="MOVISTAR" <% if lsOperCel = "MOVISTAR" then response.Write("selected") end if%>>MOVISTAR</option>
 				              <option value="CLARO" <% if lsOperCel = "CLARO" then response.Write("selected") end if%>>CLARO</option>
 				              <option value="RPM MOVISTAR" <% if lsOperCel = "RPM MOVISTAR" then response.Write("selected") end if%> >RPM MOVISTAR</option>
 				              <option value="RPM CLARO" <% if lsOperCel = "RPM CLARO" then response.Write("selected") end if%>>RPM CLARO</option>
 				              <option value="NEXTEL" <% if lsOperCel = "NEXTEL" then response.Write("selected") end if%>>NEXTEL</option>
			              </select>
						      <span class="alerta5">(*)</span></font></td>
							  <td colspan="2" align="left" nowrap><font class='cascade4' color=crimson>
							    <input 
										type="text" 
                                        disabled
										class='e_texto'
                                        value="<%=lsEmail%>"  
										id="txtEmail"  
										style="width:220" 
										name="txtEmail"  
										maxlength="80"  onKeyPress="return fs_alfanumericoE(event)" onBlur="validarEmail(this.value)">
</font></td>
					  </tr>		
																			
              </table>
			  <br>		
			  <span id="msj" style="display:none;" class="mensaje1" >Este DNI ya se encuentra registrado.</span>
              <span id="msj2" style="display:none;" class="mensaje1">El DNI tiene como m&iacute;nimo 8 n&uacute;meros..</span>	  
                            
              <table  cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">							
							<tr>
           <td colspan=9  background="images/1.jpg"><span class="mensaje2">3. Afiliaci&oacute;n a Sistema de Pensi&oacute;n</span></td>
           
							</tr>
                            <tr id="tr_afp1"  height=22 style="display:none" >
							  <td height="29" colspan="5" align="left" nowrap><font class="mensaje2">Usted tiene mas de 40 a&ntilde;os, no es necesario registrar esta informci&oacute;n, pero en caso de ser seleccionado puede elegir la opci&oacute;n de que se realice el descuento de la Afilaici&oacute;n a un sistema de pensiones.<br>
							    Desea se le descuente AFP? : 
                              
                              </font>
						        <select id="txtSiDescuento" name="txtSiDescuento" style="width:110px" class='e_combo' onChange="verSP(this.value)">
						          <option value='0' selected>Seleccione...</option>
						          <option value='1'>Si</option>
						          <option value='2'>No</option>
					            </select></td>
					  </tr> 
							<tr style="display:none"  id="tr_afp2" height=22   >
							  <td width="15%" height="43" class="cabecera2"><span ><font class="etiqueta"><strong>Est&aacute; afiliado a un Sistema de Pensiones?
							    
							  </strong></font></span></td>
							  <td height="43" colspan="4" class="cabecera2"><input type="hidden" name="txtPo_TipoPension" id="txtPo_TipoPension" value="1"></td>
					  </tr>
							<tr  id="tr_afp3" height=22 style="display:none" >
							  <td height="29" nowrap align="left"><select id="txtSIPension" name="txtSIPension" style="width:110px" class='e_combo' onChange="validaTP(this.value)">
							    <option value='0' selected>Seleccione...</option>
							    <option value='1'>Si</option>
							    <option value='2'>No</option>
						      </select>							    <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							  <td height="29" colspan="4" align="left" nowrap>&nbsp;</td>
					  </tr> 
                      <tr  id="tr_afp4"   >
                      <td width="15%" height="43" class="cabecera2"><span ><font class="etiqueta"><strong>Sistema de Pensiones</strong></font></span></td>
							  <td width="18%" height="43" class="cabecera2"><font class="etiqueta"><strong>Si esta afiliado a una AFP, a cual?</strong></font></td>
							  <td width="22%" height="43" class="cabecera2"><font class="etiqueta"><strong>N&uacute;mero de CUSSP (C&oacute;digo de Afiliado AFP)</strong></font></td>
							  <td width="13%" class="cabecera2"><font class="etiqueta"><strong>Fecha de Afiliaci&oacute;n : </strong></font></td>
							  <td width="32%" class="cabecera2"><font class="etiqueta"><strong>Tipo de Comisi&oacute;n : </strong></font></td>
							 
			          </tr>
							<tr height=22  id="tr_afp5"   >
							  <td height="26" nowrap align="left"><span class="etiqueta">
							    <%generaTipoPension()%>
							  </span><span class="etiqueta"><font class='alerta5'>(*) </font></span></td>
							  <td height="26" nowrap align="left"><%generaAFP()%></td>
							  <td height="26" align="left"><input class='e_texto' name="txtFCUSSP" maxlength="15" style="width:120" id="txtFCUSSP" type="text" value="<%=num_CUSSP%>" onKeyPress="return fs_alfanumerico(event)" /></td>
							  <td height="26" align="left"><input class='e_texto' name="txtFecAfiliacion" maxlength="15" style="width:120" id="txtFecAfiliacion" type="text" value="<%=fec_AfiliaAFP%>" onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha(this.value);" onBlur="verificaFechaT(this.value, this.id)" /></td>
							  <td align="left"><%generaComision()%></td>
                      </tr>
                      <tr height=22  id="tr_afp6"  style="display:none" >
							  <td height="29" colspan="5" align="left" nowrap><span class="mensaje2">Si Usted est&aacute; afiliado a una AFP, puede consultar  el n&uacute;mero de CUSSP (C&oacute;digo de Afiliado) en el sigueinte enlace:<br> <a href="http://www.sbs.gob.pe/app/spp/Afiliados/afil_existe.asp" title="SBS" target="_blank">http://www.sbs.gob.pe/app/spp/Afiliados/afil_existe.asp</a></span></td>
					  </tr>
                      <tr height=22  id="tr_afp7"  style="display:none" >
							  <td height="29" colspan="5" align="left" nowrap><span class="mensaje6">En caso tenga menos de 40 a&ntilde;os, recuerde que si es seleccionado, tiene que estar afiliado a un Sistema de Pensiones antes de ser contratado, caso contrario no podr&aacute; iniciar vinculo laboral con nuestra instituci&oacute;n</span><br><span class="mensaje2">Si no esta afiliado a ning&uacute;n sistema de pensiones lo puede hacer acercandose a las oficinas de la ONP o AFP HABITAT<br>
						      Le recomendamos visitar las siguientes p&aacute;ginas web donde puede realizar su inscripci&oacute;n de forma virtual.
    <br>
          ONP:<a href="http://www.onp.gob.pe/inicio.do" title="Comisiones" target="_blank"> http://www.onp.gob.pe/inicio.do</a><br>
          AFP Habitat: <a href=" https://www.afphabitat.com.pe/afiliacion-independiente" title="Comisiones" target="_blank">https://www.afphabitat.com.pe/afiliacion-independiente</a></span>
                              </td>
					  </tr>
                      </table>  
                      <BR>
                              
			  <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">							
							<tr>
							  <td colspan=8  background="images/1.jpg"><span class="mensaje2">4. Domicilio del Postulante</span></td>
							</tr>
							<tr height=22 >
							  <td height="29" class="cabecera2"><span ><font class="etiqueta"><strong>Tipo de V&iacute;a </strong></font></span></td>
							  <td height="29" class="cabecera2"><font class="etiqueta"><strong>Nombre de V&iacute;a (Direcci&oacute;n) </strong></font></td>
							  <td width="10%" height="29" class="cabecera2"><font class="etiqueta"><strong>&nbsp;N&ordm;</strong></font></td>
							  <td width="11%" class="cabecera2"><font class="etiqueta"><strong>&nbsp;KM</strong></font></td>
							  <td width="14%" class="cabecera2"><font class="etiqueta"><strong>&nbsp;MZ</strong></font></td>
							  <td width="13%" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Interior</strong></font></td>
							  <td width="15%" class="cabecera2"><font class="etiqueta"><strong>&nbsp;DPTO</strong></font></td>
			          </tr>
							<tr height=22 >
							  <td height="29" nowrap align="left"><%generaVIA()%>
                              <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							  <td height="29" nowrap align="left"><span class="etiqueta"><font class='cascade4' color=crimson>
							    <input 
								  		type="text" 
										class='e_texto' 
										id="txtNomVia" 
										name="txtNomVia" 
										value="<%=trim(lsNomVia)%>" 
										maxlength="80" 
                                        disabled
										style="width:220" 
										onKeyPress="return fs_alfanumerico(event)"
										>
							  </font><font class='alerta5'>(*)</font></span></td>
							  <td height="29" align="left"><font class='cascade4' color=crimson>
							    <input type="text" class='e_texto' style="width:100" id="txtNumPuerta" disabled name="txtNumPuerta" value="<%=lsNumPuerta%>" maxlength="8" onKeyPress="return fs_numeros(event)">
							  </font></td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input type="text" class='e_texto' style="width:100" id="txtNumKilometro" disabled name="txtNumKilometro" value="<%=lsNumKilometro%>" maxlength="8" onKeyPress="return fs_numeros(event)" >
							  </font></td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input disabled type="text" class='e_texto' id="txtNumManzana" name="txtNumManzana" value="<%=lsNumManzana%>" maxlength="8" onKeyPress="return fs_alfanumerico(event)" >
							  </font></td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input disabled type="text" class='e_texto' style="width:100" id="txtNumInterior" name="txtNumInterior" value="<%=lsNumInterior%>" maxlength="8" onKeyPress="return fs_alfanumerico(event)">
							  </font></td>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input disabled type="text" class='e_texto' style="width:100" id="txtdepa" name="txtdepa" value="<%=lsdepa%>" maxlength="8" onKeyPress="return fs_numeros(event)">
							  </font></td>
			          </tr>	
							<tr >						
							 <td width="17%"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Lote</strong></font></td>
							 <td width="20%"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Piso</strong></font></td>
							 <td colspan="3"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Tipo de Zona</strong></font><font class="etiqueta"><strong></strong></font></td>
							 <td colspan="2"  class="cabecera2"><font class="etiqueta"><strong>&nbsp;Nombre Zona</strong></font><font class="etiqueta"><strong></strong></font></td>
						    </tr>
							<tr>
							  <td align="left"><font class='cascade4' color=crimson>
							    <input disabled type="text" class='e_texto' id="txtNumLote" name="txtNumLote" value="<%=lsNumLote%>" maxlength="8" onKeyPress="return fs_alfanumerico(event)">
							  </font></td>
					          <td align="left"><font class='cascade4' color=crimson>
					            <input disabled type="text" class='e_texto' style="width:100" id="txtNumPiso" name="txtNumPiso" value="<%=lsNumPiso%>" maxlength="8" onKeyPress="return fs_numeros(event)" >
					          </font></td>
					          <td colspan="3" align="left"  nowrap><%generaZONA()%>
				              <font class='alerta5' >(*)</font></td>
					          <td colspan="2" align="left"><font class='cascade4' color=crimson>
					            <input 
										type="text" 
										class='e_texto' 
										id="txtNomZona"  
										style="width:220" 
										name="txtNomZona"
                                        disabled 
										maxlength="80" onKeyPress="return fs_alfanumerico(event)"
                                        value="<%=trim(lsNomZona)%>" 
										>
					          </font><font class='alerta5' >(*)</font></td>
				        </tr>		
						<tr height=22 bgcolor=#C7EAFB>
							   <td colspan="2" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Departamento Residencia</strong></font></td>
							   <td colspan="3" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Provincia Residencia</strong></font></td>
							   <td  colspan="2" class="cabecera2"><font class="etiqueta"><strong>&nbsp;Distrito Residencia</strong></font></td>
						</tr>
							<tr height=22 >
								<td height="28" colspan="2" align="left"><font class='alerta5'><%generaDpto2()%>
								</font><span class="etiqueta" nowrap><font class='alerta5'>(*)</font></span></td>
                              <td height="28" colspan="3" align="left" id="prov2"><select name="txtProv2" id="txtProv2"   class='e_combo' disabled style="width:200px;" >
 				              <option id="txtProv2_99" title="Todos" value=""  >Seleccione... </option>
                              <option selected  value="<%=lsDptoRc&lsProvRc&lsNomProvR%>"> <%=lsDptoRc&lsProvRc%> &nbsp;<%=lsNomProvR%></option>

			              </select>
							    <span class="etiqueta"><font class='alerta5' >(*)</font></span></td>
							  <td align="left" colspan="2" id="dist2" nowrap>
                              <select name="txtDist2" id="txtDist2" disabled  class='e_combo' style="width:200px;">
                                  <option selected   value="<%=lsDptoRc&lsProvRc&lsDistRc%>"  ><%= lsDptoRc&lsProvRc&lsDistRc%> &nbsp;<%=lsNomDistR%></option>
                                </select>
					          <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
							</tr>											
              </table>
			  <br>
			  <table cellpadding="0" cellspacing="0" border="0"  width="100%" class="tabla3" style="BORDER-TOP: #0F83E1 1px solid; BORDER-LEFT: #0F83E1 1px solid;BORDER-RIGHT: #0F83E1 1px solid" >							
							<tr>
							  <td colspan=11 background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><span class="mensaje2">5. Perfil del Postulante</span> <span ><FONT style="color:#036; font:arial; font-size:10px;"><strong>(Si Ud. es seleccionado, se le solicitar&aacute; que los datos que consigne a continuaci&oacute;n sean respaldados con alg&uacute;n documento. Si no presenta los documentos ser&aacute; descalificado autom&aacute;ticamente.) </strong></font> </span><strong></span></strong></td>
							</tr>
					  <tr bgcolor=#C7EAFB>
						  <td height="20" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><font class="etiqueta"><strong>Nivel de Instrucci&oacute;n</strong></font></td>
                          <td width="16%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="cabecera2" ><font class="etiqueta"><strong>Grado Alcanzado</strong></font></span></td>
							  <td width="18%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Fecha de Expedici&oacute;n Grado </strong>(dd/mm/aaaa) </font></td>
                              <td height="20" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;"> <font class="etiqueta"><strong> Registro de expdici&oacute;n de grado</strong></font></td>
                              <td width="15%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Per&iacute;odo Alcanzado (en n&uacute;meros)</strong></font></td>
							  <td width="17%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Tipo de Per&iacute;odo</strong></font></td>
				      </tr>
							<tr height=22 >
							  <td id="idNivel" height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><%generaNivel()%><span style="border-bottom:1px solid; border-bottom-color:#0F83E1">
						    <input type="hidden" name="cmbTipoEstudios" id="cmbTipoEstudios" value="0"></span></td>
                            <td id="idGrado" align="left" style=" border-left:1px solid; border-left-color:#0F83E1; ">&nbsp;<font class='cascade4' color=crimson>
							    <select disabled id="cmbGrado" name="cmbGrado" class='e_combo' style="width:150">
							      <option value="0" selected>Seleccione...</option>
                                  <option <%IF lsGrado ="1" THEN RESPONSE.WRITE "SELECTED" END IF%> value="1" >PREGRADO (ESTUDIANTE)</option>
                                  <option <%IF lsGrado ="2" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="2" >EGRESADO</option>
                                  <option <%IF lsGrado ="3" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="3" >BACHILLER</option>
                                  <option <%IF lsGrado ="4" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="4" >TITULADO</option>
                                  <option <%IF lsGrado ="5" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="5" >MAGISTER</option>
                                  <option <%IF lsGrado ="6" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="6" >DOCTORADO</option>
                                  <option <%IF lsGrado ="7" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="7" >ESTUDIOS DE MAESTRIA</option>
                                  <option <%IF lsGrado ="8" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="8" >ESTUDIOS DE DOCTORADO</option>
						      </select> 
							  </font></td>
							  <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="cascade5"><font color=crimson>&nbsp;</font></span> <font class='cascade4' color=crimson>
                              <input type="text" class='e_texto' id="txtDia2" disabled   name="txtDia2" value="<%=lsDia2%>" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)">
                              </font><span class="cascade5"><font class="alerta5">&nbsp;/&nbsp;</font></span><font class='cascade4' color=crimson>
                              <input type="text" class='e_texto' id="txtMes2" disabled   name="txtMes2" value="<%=lsMes2%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">
&nbsp;</font><span class="cascade5"><font class="alerta5">/</font></span><font class='cascade4' color=crimson>&nbsp;
<input type="text" class='e_texto' id="txtAnio2" name="txtAnio2" value="<%=lsAnio2%>" maxlength="4" disabled style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2();">
</font></td>
                              <td id="idNivel" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class='alerta5' ><font class='cascade4' color=crimson>
                                <input  disabled
										type="text" 
										class='e_texto' 
										id="txtNum_reg_grado" 
										name="txtNum_reg_grado" 
										value="<%=Num_reg_grado%>" 
										maxlength="50" 
										style="width:100" 
										onKeyPress="" 
										>
                              </font></font></td>
                              <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='cascade4' color=crimson>
							    <input disabled name="txtperioalc" type="text" class='e_texto' id="txtperioalc" style="width:20" onKeyPress="return fs_numeros(event)" value="<%=lsperioAlc%>" size="2" maxlength="2" >
							  </font></td>
							  <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='cascade4' color=crimson>

							    <select disabled id="cmbPeriodo" name="cmbPeriodo" class='e_combo' style="width:150">
							      <option value="0">Seleccione...</option>
							      <option  <% if lsTiPerAlc="1" then response.Write("SELECTED") ELSE RESPONSE.Write("") END IF%> value="01">CICLO</option>
							      <option <% if lsTiPerAlc="2" then response.Write("SELECTED") ELSE RESPONSE.Write("") END IF%> value="02">MES</option>
							      <option <% if lsTiPerAlc="3" then response.Write("SELECTED") ELSE RESPONSE.Write("") END IF%>  value="03">A&Ntilde;O</option>
							      <option <% if lsTiPerAlc="4" then response.Write("SELECTED") ELSE RESPONSE.Write("") END IF%>  value="04">TRIMESTRE</option>
							      <option <% if lsTiPerAlc="5" then response.Write("SELECTED") ELSE RESPONSE.Write("") END IF%>  value="05">SEMESTRE</option>
							      <option <% if lsTiPerAlc="6" then response.Write("SELECTED") ELSE RESPONSE.Write("") END IF%>  value="06">CUATRIMESTRE</option>
							      <option <% if lsTiPerAlc="7" then response.Write("SELECTED") ELSE RESPONSE.Write("") END IF%>  value="07">MODULO</option>
							      <option <% if lsTiPerAlc="8" then response.Write("SELECTED") ELSE RESPONSE.Write("") END IF%>  value="08">NIVEL</option>
                              </select>
							  </font></td>
	                  </tr>
                       <% if id_caroQ =412 or id_caroQ =413  THEN %> 
                     <tr>
                     <td height="28" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Carrera o profesi&oacute;n</strong></font></td>
							  <td height="28" colspan="2" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Otro cupaci&oacute;n y/o Profesi&oacute;n</strong></font></td>
							  <td  height="28" align="left"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class="etiqueta"><strong>En caso de ser educador, especifique su especialidad</strong></font></td>
							  <td colspan="2" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class="etiqueta"><strong>Universidad
                                    <input type="hidden" name="txtLugEst" id="txtLugEst" value="">
                              </strong></font></td>
					  </tr>
							<tr height=22 >
							  <td height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"> <select id="prof_ednom" disabled name="prof_ednom" class='e_combo' style="width:120" onChange="validaProf(this.value)">
							      <option value="0" selected>Seleccione...</option>
							      <option value="1">EDUCACI&Oacute;N</option>
							      <option value="2">PSICOLO&Iacute;A</option>
                                  <option value="3">OTRO</option>
						      </select></td>
							  <td height="28" colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="etiqueta" style="display:block">
							    <%generaprofesion()%>
						      <font class='alerta5' >(*)</font></span></td>
							  <td  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='alerta5' ><font class='cascade4' color=crimson>
							    <input  disabled
										type="text" 
										class='e_texto' 
										id="especialidad_ednom" 
										name="especialidad_ednom" 
										value="" 
										maxlength="50" 
										style="width:150" 
										onKeyPress="return fs_SoloLetras(event)" 
										>
							  </font></font></td>
							  <td colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta">
							    <%generaUniversidad()%>
                              <span class="etiqueta" nowrap><font class='alerta5'>(**)</font></span></span></td></tr>
                              <%else%>
                          <tr height=22 >
						    <td height="28" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Ocupaci&oacute;n y/o Profesi&oacute;n</strong></font></td>
						    <td height="28" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>En caso de ser educador, especifique su especialidad</strong></font></td>
						    <td  height="28" colspan="2" align="left"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="cabecera2" ><font class="etiqueta"><strong>Universidad</strong></font></span></td>
						    <td colspan="2" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class="etiqueta"><strong>Centro de estudios</strong></font></td>
					  </tr>
							<tr height=22 >
							  <td height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="etiqueta" style="display:block">
							    <%generaprofesion()%>
						      <font class='alerta5' > (*)</font></span></td>
							  <td height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class='alerta5' ><font class='cascade4' color=crimson>
							    <input  disa
										type="text" 
										class='e_texto' 
										id="especialidad_ednom" 
										name="especialidad_ednom" 
										value="" 
										maxlength="50" 
										style="width:150" 
										onKeyPress="return fs_SoloLetras(event)" 
										>
							  </font></font></td>
							  <td  height="28" colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta">
							    <%generaUniversidad()%>
						      <span class="etiqueta" nowrap><font class='alerta5'>(**)</font></span></span></td>
							  <td colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='alerta5' ><font class='cascade4' color=crimson>
							    <input 
                                <% if lsNivInst = "4" then response.Write("disabled") end if%> 
										type="text" 
                                        disabled
										class='e_texto' 
										id="txtLugEst" 
										name="txtLugEst" 
										 value="<%=lsLugEst%>"  
										maxlength="50" 
										style="width:220" 
										onKeyPress="return fs_alfanumerico(event)" 
										>
							  </font></font> <span class="etiqueta" nowrap><font class='alerta5'>(**)</font></span></td>
						    </tr>
                            <%end if %>
                            
					  </table>
						<table width="100%" class="tabla4">
							<tr>
							  <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3" >
							    <tr>
							      <td width="448"    class="cabecera2" ><font class="etiqueta"><strong>Experiencia </strong></font></td>
							      <td width="204"    class="cabecera2" ><font class="etiqueta"><strong>Nombre Instituci&oacute;n (Registre solo el &uacute;ltimo)</strong></font></td>
							      <td width="204"    class="cabecera2" ><font class="etiqueta"><strong>Fecha &Uacute;ltimo d&iacute;a de labores</strong></font></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><span class="cabecera2" ><font class="etiqueta"><strong>A&ntilde;os</strong><br>
						          Ejm. 3 a&ntilde;o(s)</font></span></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>&nbsp;Meses</strong><br>6 mes(es)</font></td>
						        </tr>
                                
                                  <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"> <% if experiencia_1="" or isnull(experiencia_1) then %>
                                  A&ntilde;os o meses  de experiencia en trabajos de Campo (Censo y/o Encuestas)
								  <%else%>
                                  <span class="etiqueta">
<%=experiencia_1%>
                                  </span><%end if%></td>
							      <td  height="29"  align="center" class="etiqueta" ><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtExpCampoInst" name="txtExpCampoInst" value="<%=ExpCampoInst%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td  height="29"  align="center" class="etiqueta" ><input class='e_texto' name="txtExpCampoFef" maxlength="10" style="width:120" id="txtExpCampoFef" type="text" value="<%=ExpCampoFef%>" onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha(this.value);"   onBlur="verificaFechaT(this.value, this.id)" /></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpCampoAnio" name="txtExpCampoAnio" value="<%=lsExpGen_anio%>" maxlength="2" onKeyPress="return fs_numeros(event)" >
                                  <font class="etiqueta">a&ntilde;o(s)</font></font></span></td>
							      <td height="29"  align="center" id="proy" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpCampoMeses" name="txtExpCampoMeses" value="<%=lsExpGen_meses%>" maxlength="2" onBlur="valor_mes(this.value,this.id)" onKeyPress="return fs_numeros(event)" >
							        <font class="etiqueta">mes(es)</font>
							        <input name="txtCapaAnio" type="hidden" id="txtCapaAnio" value="0">
                                    <input type="hidden" name="txtCapaMeses" id="txtCapaMeses" value="0">
							      </font></span></td>
						        </tr>
                                
                               							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><% if experiencia_2="" or isnull(experiencia_2) then %>A&ntilde;os o meses  de experiencia en manejo de grupos:<%else%><%=experiencia_2%><%end if%></td>
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtExpGrupoInst" name="txtExpGrupoInst" value="<%=ExpGrupoInst%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><input class='e_texto' name="txtExpGrupoFec" maxlength="10" style="width:120" id="txtExpGrupoFec" type="text" value="<%=ExpGrupoFec%>" onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha(this.value);"  onBlur="verificaFechaT(this.value, this.id)" /></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGrupoAnio" name="txtExpGrupoAnio" value="<%=lsExpCampoanio%>" maxlength="2" onKeyPress="return fs_numeros(event)" >
                                  <font class="etiqueta">a&ntilde;o(s)</font></font></span></td>
							      <td align="left" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGrupoMeses" name="txtExpGrupoMeses" value="<%=lsExpCampomeses%>" maxlength="2" onBlur="valor_mes(this.value,this.id)" onKeyPress="return fs_numeros(event)" >
							       <font class="etiqueta">mes(es)</font>
							        <input name="txtDocAnio2" type="hidden" id="txtDocAnio" value="0">
                                    <input type="hidden" name="txtCapaAnio2" id="txtCapaAnio2 " value="0">
							      </font></span></td>
						        </tr>
                               							    <tr >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid">
						<% if experiencia_3="" or isnull(experiencia_3) then %>
                        <span class="etiqueta" >A&ntilde;os o meses de experiencia en actividades en general:</span>
                                    <%else%>
									<span class="etiqueta" ><%=experiencia_3%></span>
									<%end if%>
							      </td>
							      <td  height="29"  align="center" class="etiqueta"    style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtExpGenInst" name="txtExpGenInst" value="<%=ExpGenInst%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td  height="29"  align="center" class="etiqueta"    style="border-bottom:1px solid"><input class='e_texto' name="txtExpGenFec" maxlength="10" style="width:120" id="txtExpGenFec" type="text" value="<%=ExpGenFec%>" onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha(this.value);"  onBlur="verificaFechaT(this.value, this.id)" /></td>
							      <td width="122"  height="30"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span ><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGenAnio" name="txtExpGenAnio" value="<%=lsExpGrupoanio%>" onBlur="valor_ano(this.value,this.id)" maxlength="2" onKeyPress="return fs_numeros(event)" >
                                  <font class="etiqueta">a&ntilde;o(s)</font></font></span></td>
							      <td width="134"   align="left" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGenMeses" name="txtExpGenMeses" value="<%=lsExpGrupomeses%>" onBlur="valor_mes(this.value,this.id)" maxlength="2" onKeyPress="return fs_numeros(event)" >
							        <font class="etiqueta">mes(es)</font></font></span></td>
						        </tr>
							    </table><br>
							    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3" >
							    <tr>
							      <td width="506"   class="cabecera2" ><font class="etiqueta"><strong>Experiencia Adicional</strong></font></td>
							      <td align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Descripci&oacute;n</strong></font></td>
							      <td width="253"  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Nombre de la Instituci&oacute;n
							       
							      </strong></font></td>
							      <td width="126"  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Cargo</strong></font></td>
							      <td width="127"  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Tiempo de Duraci&oacute;n </strong></font></td>
						        </tr>
							    
							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid">Nombre de la &uacute;ltima Experiencia en operativo de Aplicaci&oacute;n de Instrumentos en campo</td>
							      <td  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtExpAplicacion" name="txtExpAplicacion" value="<%=ExpAplicacion%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
						          </font></font></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta" style="border-bottom:1px solid">
							        <input type="text" class='e_texto'  style="width:300" id="txtNombreAplicacion" name="txtNombreAplicacion" value="<%=NombreAplicacion%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" ></span></td>
							      <td align="left" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
						          <input type="text" class='e_texto'  style="width:100" id="txtCargoAplicacion" name="txtCargoAplicacion" value="<%=CargoAplicacion%>" maxlength="100" onKeyPress="return fs_alfanumerico(event)" >
							      </font></span></td>
							      <td align="left" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtTiempoAplicacion" name="txtTiempoAplicacion" value="<%=TiempoAplicacion%>" maxlength="3" onKeyPress="return fs_numeros(event)" >
                                    <span class="etiqueta" style="border-bottom:1px solid">
                                    <select name="txtTiempoApli" id="txtTiempoApli" class="e_combo" style="width:80"  >
                                      <option <% if isnull(TiempoApli) or TiempoApli=0 or TiempoApli="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                      <option <% if TiempoApli=1 then response.Write("Selected") end if%> value="1">Horas</option>
                                      <option <% if TiempoApli=2 then response.Write("Selected") end if%>value="2">Dias</option>
                                      <option <% if TiempoApli=3 then response.Write("Selected") end if%>value="3">Meses</option>
                                      <option <% if TiempoApli=4 then response.Write("Selected") end if%>value="4">A&ntilde;os</option>
                                    </select>
                                    </span>
<input name="txtDocAnio" type="hidden" id="txtDocAnio2" value="0">
                                    <input type="hidden" name="txtCapaAnio2 " id="txtCapaAnio2 2" value="0">
                                  </font></td>
						        </tr>
                                <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid">&Uacute;ltima experiencia en procesos de operaciones de aplicaci&oacute;n de instrumentos en campo</td>
							      <td  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtExpProcesos" name="txtExpProcesos" value="<%=ExpProcesos%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
						          </font></font></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtNombreProcesos" name="txtNombreProcesos" value="<%=NombreProcesos%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td height="29"  align="center" class="etiqueta" id="proy" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:100" id="txtCargoProcesos" name="txtCargoProcesos" value="<%=CargoProcesos%>" maxlength="100" onKeyPress="return fs_alfanumerico(event)" >
							      </font></td>
							      <td height="29"  align="center" class="etiqueta" id="proy" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtTiempoProcesos" name="txtTiempoProcesos" value="<%=TiempoProcesos%>" maxlength="3"  onKeyPress="return fs_numeros(event)" >
                                     <span class="etiqueta" style="border-bottom:1px solid">
                                     <select name="txtCargoProc" id="txtCargoProc" class="e_combo" style="width:80"  >
                                       <option <% if isnull(CargoProc) or CargoProc=0 or CargoProc="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                       <option <% if CargoProc=1 then response.Write("Selected") end if%> value="1">Horas</option>
                                       <option <% if CargoProc=2 then response.Write("Selected") end if%> value="2">Dias</option>
                                       <option <% if CargoProc=3 then response.Write("Selected") end if%> value="3">Meses</option>
                                       <option <% if CargoProc=4 then response.Write("Selected") end if%> value="4">A&ntilde;os</option>
                                     </select>
                                     </span>
                                     <input name="txtCapaAnio3" type="hidden" id="txtCapaAnio2" value="0">
                                    <input type="hidden" name="txtCapaMeses2" id="txtCapaMeses2" value="0">
                                  </font></td>
						        </tr>
                                
                                <tr>
                                
                                <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid">&Uacute;ltima experiencia de aula o proyectos de Formaci&oacute;n </td>
							      <td  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtExpFormacion" name="txtExpFormacion" value="<%=ExpFormacion%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
						          </font></font></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtNombreFormacion" name="txtNombreFormacion" value="<%=NombreFormacion%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td height="29"  align="center" class="etiqueta" id="proy" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:100" id="txtCargoFormacion" name="txtCargoFormacion" value="<%=CargoFormacion%>" maxlength="100" onKeyPress="return fs_alfanumerico(event)" >
							      </font></td>
							      <td height="29"  align="center" class="etiqueta" id="proy" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtTiempoFormacion" name="txtTiempoFormacion" value="<%=TiempoFormacion%>" maxlength="3"  onKeyPress="return fs_numeros(event)" >
                                     <span class="etiqueta" style="border-bottom:1px solid">
                                     <select name="txtTiempoFor" id="txtTiempoFor" class="e_combo" style="width:80"  >
                                       <option <% if isnull(TiempoFor) or TiempoFor=0 or TiempoFor="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                       <option <% if TiempoFor=1 then response.Write("Selected") end if%> value="1">Horas</option>
                                       <option <% if TiempoFor=2 then response.Write("Selected") end if%> value="2">Dias</option>
                                       <option <% if TiempoFor=3 then response.Write("Selected") end if%> value="3">Meses</option>
                                       <option <% if TiempoFor=4 then response.Write("Selected") end if%> value="4">A&ntilde;os</option>
                                     </select>
                                     </span>
                                     <input name="txtCapaAnio4" type="hidden" id="txtCapaAnio3" value="0">
                                    <input type="hidden" name="txtCapaMeses3" id="txtCapaMeses3" value="0">
                                  </font></td>
                                </tr>
                                
                                
							    </table>
							    <br>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3">
                                <tr>
                                  <td colspan="5"   class="cabecera2"><font class="etiqueta"><strong>&nbsp;Proyectos en el INEI</strong></font></td>
                                  </tr>
                                   <tr  >
                                   
							      <td width="256"  height="30"  align="center" class="etiqueta" >&iquest;Ha participado en el INEI?</td>
                                  
                                  
							      <td width="199" height="29"  align="center"  class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><font class='cascade4' color=crimson>
							        <select disabled id="txtIneiProc" name="txtIneiProc" class="e_combo" style="width:60"  onChange="javascript:cambiarText('2',this.value,'txtProyecto');">
							          <option value="" >...</option>
							          <option value="1"  <%if lsIneiProc ="1" then response.Write("selected") END IF%>>Si</option>
							          <option value="2"  <%if lsIneiProc ="2" then response.Write("selected") END IF%>>No</option>
						          </select>
							      </font></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta" >&iquest;&Uacute;ltimo proyecto que particip&oacute; en INEI?</span></td>
                                  
							      <td width="325" height="33" colspan="2"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"> <select disabled id="txtProyecto" name="txtProyecto"  class='e_combo' >
							          <option value="" selected="selected">Seleccione...</option>
							          <option value="ECE"  <%if lsProyecto ="ECE" then response.Write("selected") END IF%> >ECE</option>
							          <option value="CENAGRO" <%if lsProyecto ="CENAGRO" then response.Write("selected") END IF%> >CENAGRO</option>
							          <option value="CENSO 1993"  <%if lsProyecto ="CENSO 1993" then response.Write("selected") END IF%> >CENSO 1993</option>
							          <option value="CENSO 2005"  <%if lsProyecto ="CENSO 2005" then response.Write("selected") END IF%>>CENSO 2005</option>
							          <option value="CENSO 2007"  <%if lsProyecto ="CENSO 2007" then response.Write("selected") END IF%> >CENSO 2007</option>
							          <option value="PRECENSO 1999-2000"  <%if lsProyecto ="PRECENSO 1999-2000" then response.Write("selected") END IF%>>PRECENSO 1999-2000</option>
							          <option value="CENEC"  <%if lsProyecto ="CENEC" then response.Write("selected") END IF%>>CENEC</option>
							          <option value="CENSO UNIVERSITARIO"  <%if lsProyecto ="CENSO UNIVERSITARIO" then response.Write("selected") END IF%>>CENSO UNIVERSITARIO</option>
							          <option value="ENAHO"  <%if lsProyecto ="ENAHO" then response.Write("selected") END IF%>>ENAHO</option>
							          <option value="ENDES"  <%if lsProyecto ="ENDES" then response.Write("selected") END IF%>>ENDES</option>
							          <option value="EDNOM"  <%if lsProyecto ="EDNOM" then response.Write("selected") END IF%>>EDNOM</option>
							          <option value="ENNSA"  <%if lsProyecto ="ENNSA" then response.Write("selected") END IF%> >ENNSA</option>
							          <option value="JUNTOS"  <%if lsProyecto ="JUNTOS" then response.Write("selected") END IF%>>JUNTOS</option>
							          <option value="MANUFACTURA"  <%if lsProyecto ="MANUFACTURA" then response.Write("selected") END IF%>>MANUFACTURA</option>
							          <option value="PROPOLI"  <%if lsProyecto ="PROPOLI" then response.Write("selected") END IF%>>PROPOLI</option>
							          <option value="RENAMU"  <%if lsProyecto ="RENAMU" then response.Write("selected") END IF%>>RENAMU</option>
							          <option value="CENSO DE DAMNIFICADOS"  <%if lsProyecto ="CENSO DE DAMNIFICADOS" then response.Write("selected") END IF%>>CENSO DE DAMNIFICADOS</option>
							          <option value="REGISTRO DE VIVIENDAS Y ESTABLECIMIENTOS"  <%if lsProyecto ="REGISTRO DE VIVIENDAS Y ESTABLECIMIENTOS" then response.Write("selected") END IF%>>REGISTRO DE VIVIENDAS Y ESTABLECIMIENTOS</option>
							          <option value="MINCETUR"  <%if lsProyecto ="MINCETUR" then response.Write("selected") END IF%>>MINCETUR</option>
							          <option value="CONVENIO PODER JUDICIAL"  <%if lsProyecto ="CONVENIO PODER JUDICIAL" then response.Write("selected") END IF%>>CONVENIO PODER JUDICIAL</option>
							          <option value="ENAPROM"  <%if lsProyecto ="ENAPROM" then response.Write("selected") END IF%>>ENAPROM</option>
							          <option value="SISFOH"  <%if lsProyecto ="SISFOH" then response.Write("selected") END IF%>>SISFOH </option>
							          <option value="ENAPRES" <%if lsProyecto ="ENAPRES" then response.Write("selected") END IF%>>ENAPRES</option>
							          <option value="OTROS"  <%if lsProyecto ="OTROS" then response.Write("selected") END IF%>>OTROS</option>
						            </select></td></tr>
                                  <tr>
                                  <td width="256"  height="30"  align="center" class="etiqueta" >&iquest;&Uacute;ltimo a&ntilde;o que particip&oacute; en INEI?</td>
                                  
                                  
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><font color="crimson"><span class="etiqueta">
							        <input type="text" class='e_texto' id="txtIneiAnio" disabled name="txtIneiAnio" maxlength="4" value="<%=lsIneiAnio%>" style="width:40" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" /> <%if id=773 or id=774 then%>
						          <input type="hidden" name="txtCargo1" id="txtCargo1" value="" >
						          <input type="hidden" name="txtlugar_capacitacion" id="txtlugar_capacitacion" value="">
						          <input type="hidden" name="DIcurso" id="DIcurso" value="">
						          <input type="hidden" name="MIcurso" id="MIcurso" value="">
						          <input type="hidden" name="AIcurso" id="AIcurso" value="">
						          <input type="hidden" name="DFcurso" id="DFcurso" value="">
                                  <input type="hidden" name="MFcurso" id="MFcurso" value="">
                                  <input type="hidden" name="AFcurso" id="AFcurso" value="">
                                  <input type="hidden" name="txtHorasLectivas" id="txtHorasLectivas" value="">
                                  <%END IF%>
							      </span></font></td>
                                  
							      <td width="332"  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid">&iquest;&Uacute;ltimo cargo que particip&oacute; en INEI?</td>
							      <td width="325" height="33" colspan="2"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><%Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getcargo1 ")

	
	Response.Write "<select disabled class=""e_combo"" style=""width:200px"" id=""txtCargoInei"" name=""txtCargoInei"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	if wRsDptoapli(0) = CINT(lsCargoInei) then 
			Response.Write "<option value=""" & wRsDptoapli(0) & """ selected >"&wRsDptoapli(1) & "</option>"
	else
		Response.Write "<option value=""" &wRsDptoapli(0)  & """>"&wRsDptoapli(1)& "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing%>
							      </td>
                                  </tr>
                                  
                                </table>
                                  <br>
          
                                  
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3">
							      <tr>
                                  <td colspan="3"   class="cabecera2"><font class="etiqueta"><strong>&Uacute;LTIMOS DOS CARGOS DESEMPE&Ntilde;ADOS </strong></font></td>
                                  <td colspan="2"   class="cabecera2"><font class="etiqueta"><strong>Nombre de la Empresa</strong></font></td>
                                  <td width="253"   class="cabecera2"><font class="etiqueta"><strong>Tiempo de Duraci&oacute;n en meses</strong></font></td>
                                  </tr>
                                  
                                  
                                  <TR>
                                  <td  height="30" colspan="3"  align="center" class="etiqueta"  style="border-bottom:1px solid">Cargo Desempe&ntilde;ado (1) :<font class='cascade4' color=crimson><font class='cascade4' color=crimson>
                                    <input type="text" class='e_texto'  style="width:300" id="txtCargo1" name="txtCargo1" value="<%=Cargo1%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
                                  </font></font></td>
                                  <td height="30" colspan="2"  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
                                    <input type="text" class='e_texto'  style="width:300" id="txtEmpCargo1" name="txtEmpCargo1" value="<%=EmpCargo1%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
                                  </font></td>
                                  <td width="253"   align="left" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txttiempoCargo1" name="txttiempoCargo1" value="<%=tiempoCargo1%>" maxlength="2" onKeyPress="return fs_numeros(event)" >
							      </font><font class="etiqueta">Meses</font></td>
                                  </TR>
                                  <tr>
                                  <td  height="30" colspan="3"  align="center" class="etiqueta"  style="border-bottom:1px solid">Cargo Desempe&ntilde;ado (2) :<span class="cabecera2"><font class="etiqueta"><strong><span class="etiqueta" style="border-bottom:1px solid"><input type="text" class='e_texto'  style="width:300" id="txtCargo2" name="txtCargo2" value="<%=Cargo1%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" ></span></strong></font></span></td>
                                  <td height="30" colspan="2"  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
                                    <input type="text" class='e_texto'  style="width:300" id="txtEmpCargo2" name="txtEmpCargo2" value="<%=EmpCargo2%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
                                  </font></td>
                                  <td width="253"   align="left" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txttiempoCargo2" name="txttiempoCargo2" value="<%=tiempoCargo2%>" maxlength="2" onKeyPress="return fs_numeros(event)" >
							      </font><font class="etiqueta">Meses</font></td>
                                  </tr>
                                </table>
                                  <br>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3">
						        <tr >
							        <td  height="33" colspan="6" background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><font class="etiqueta"><strong>6. Capacitaci&oacute;n</strong></font></td></tr>
                                     
                               <tr >
                                
                                <td width="345"   class="cabecera2"><font class="etiqueta"><strong>&Uacute;ltima capacitaci&oacute;n Profesional</strong></font></td>
							      <td width="403"   class="cabecera2"><font class="etiqueta"><strong>Nombre de la Instituci&oacute;n o Empresa</strong></font></td>
							      <td width="247" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Inicio</strong><br>(dd/mm/aaaa)</font></td>
							      <td width="234" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Fin</strong><br>(dd/mm/aaaa)</font></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>&nbsp;Tiempo</strong></font></td>
				                </tr>
                                
                                <tr  >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><span class="etiqueta" style="border-bottom:1px solid"><font class='cascade4' color=crimson><span class="etiqueta" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtCurso" name="txtCurso" value="<%=CursoCapacitacion%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></span></font></span></td>
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtlugar_capacitacion" name="txtlugar_capacitacion" value="<%=lugar_capacitacion%>" maxlength="300" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td  align="center" style="border-bottom:1px solid"> <font class='cascade4' color=crimson>
                                  <input type="text" class='e_texto' id="DIcurso"  name="DIcurso" value="<%=capDia%>" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)"><font class="alerta5">&nbsp;/&nbsp;</font>
                                  </font><font class='cascade4' color=crimson><input type="text" class='e_texto' id="MIcurso"   name="MIcurso" value="<%=capMes%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">&nbsp;</font><font class="alerta5">/</font>&nbsp;<font class='cascade4' color=crimson><input type="text" class='e_texto' id="AIcurso" name="AIcurso" value="<%=capAnio%>" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2E(2);">
</font></span></td>
							      <td height="30"  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson><input type="text" class='e_texto' id="DFcurso"   name="DFcurso" value="<%=FcapDia%>" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)"> </font><font class="alerta5">&nbsp;/&nbsp;</font><font class='cascade4' color=crimson><input type="text" class='e_texto' id="MFcurso" name="MFcurso" value="<%=FcapMes%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">
						          </font><font class="alerta5">&nbsp;/&nbsp;</font><font class='cascade4' color=crimson>
						          <input type="text" class='e_texto' id="AFcurso" name="AFcurso" value="<%=FcapAnio%>" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2E(3);">
</font></span></td>
							      <td width="166"   align="left" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtHorasLectivas" name="txtHorasLectivas" value="<%=HorasLectivas%>" maxlength="4" onKeyPress="return fs_numeros(event)" >
							        <span class="etiqueta" style="border-bottom:1px solid">
							        <select name="txtTiempoHL" id="txtTiempoHL" class="e_combo" style="width:80"  >
							          <option <% if isnull(TiempoHL) or TiempoHL=0 or TiempoHL="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                       <option <% if TiempoHL=1 then response.Write("Selected") end if%> value="1">Horas</option>
                                       <option <% if TiempoHL=2 then response.Write("Selected") end if%> value="2">Dias</option>
                                       <option <% if TiempoHL=3 then response.Write("Selected") end if%> value="3">Meses</option>
                                       <option <% if TiempoHL=4 then response.Write("Selected") end if%> value="4">A&ntilde;os</option>
						            </select>
							        </span></font></td>
                                  <tr>
<tr >
                                
                                <td width="345"   class="cabecera2"><font class="etiqueta"><strong>Capacitaci&oacute;n en Microsoft Office 2007</strong></font></td>
							      <td width="403"   class="cabecera2"><font class="etiqueta"><strong>Nombre de la Instituci&oacute;n o Empresa</strong></font></td>
							      <td align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Inicio</strong><br>(dd/mm/aaaa)</font></td>
							      <td align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Fin</strong><br>(dd/mm/aaaa)</font></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Tiempo</strong></font></td>
				                </tr>
                                
                                <tr  >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><span class="etiqueta" style="border-bottom:1px solid"><font class='cascade4' color=crimson><span class="etiqueta" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtCursoOf" name="txtCursoOf" value="<%=CursoOf%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></span></font></span></td>
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtlugar_capacitacionOf" name="txtlugar_capacitacionOf" value="<%=lugar_capacitacionOf%>" maxlength="300" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td  align="center" style="border-bottom:1px solid"> <font class='cascade4' color=crimson>
                                  <input type="text" class='e_texto' id="DIcursoOf"  name="DIcursoOf" value="<%=OfIniDia%>" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)"><font class="alerta5">&nbsp;/&nbsp;</font>
                                  </font><font class='cascade4' color=crimson><input type="text" class='e_texto' id="MIcursoOf"   name="MIcursoOf" value="<%=OfIniMes%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">&nbsp;</font><font class="alerta5">/</font>&nbsp;<font class='cascade4' color=crimson><input type="text" class='e_texto' id="AIcursoOf" name="AIcursoOf" value="<%=OfIniAni%>" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2E(4);">
</font></span></td>
							      <td height="30"  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson><input type="text" class='e_texto' id="DFcursoOf"   name="DFcursoOf" value="<%=OfFinDia%>" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)"> </font><font class="alerta5">&nbsp;/&nbsp;</font><font class='cascade4' color=crimson><input type="text" class='e_texto' id="MFcursoOf" name="MFcursoOf" value="<%=OfFinMes%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">
						          </font><font class="alerta5">&nbsp;/&nbsp;</font><font class='cascade4' color=crimson>
						          <input type="text" class='e_texto' id="AFcursoOf" name="AFcursoOf" value="<%=OfFinAni%>" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2E(5);">
</font></span></td>
							      <td width="166"   align="left" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtHorasLectivasOf" name="txtHorasLectivasOf" value="<%=HorasLectivasOf%>" maxlength="4" onKeyPress="return fs_numeros(event)" >
						          <span class="etiqueta" style="border-bottom:1px solid">
							        <select name="txtTiempoOf" id="txtTiempoOf" class="e_combo" style="width:80"  >
							          <option <% if isnull(TiempoOf) or TiempoOf=0 or TiempoOf="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                       <option <% if TiempoOf=1 then response.Write("Selected") end if%> value="1">Horas</option>
                                       <option <% if TiempoOf=2 then response.Write("Selected") end if%> value="2">Dias</option>
                                       <option <% if TiempoOf=3 then response.Write("Selected") end if%> value="3">Meses</option>
                                       <option <% if TiempoOf=4 then response.Write("Selected") end if%> value="4">A&ntilde;os</option>
						          </select>
						          </span></font></td>
                                  <tr>
                                
                                </tr>
                                  <tr style="display:none">
                                <td colspan="6"   class="cabecera2"><font class="etiqueta"><strong>Dato Complementario: Este dato ser&aacute; usado por Usted en los siguientes procesos de selecci&oacute;n. Es de uso exclusivo y debe mantenerlo en reserva.</strong></font></td>
						        </tr>
                                
                                <tr style="display:none" >
							      <td  height="30" colspan="6"  align="center" class="etiqueta"  style="border-bottom:1px solid">Fecha de nacimiento de su Padre o madre:<font class='cascade4' >
							        <input type="text" class='e_texto' id="DiaComp"  name="DiaComp" value="" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)">
							    /							      <input type="text" class='e_texto' id="MesComp"   name="MesComp" value="" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">
							      /
							      <input type="text" class='e_texto' id="AnioComp" name="AnioComp" value="" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio5();">						      </font></td>
						        </tr>
                                
                                
                                    
                                     <tr>
							        <td  height="33" colspan="6"  class="cabecera2"><font class="etiqueta"><strong>Otros Aspectos</strong></font></td></tr>
						        <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Disposici&oacute;n para trabajar: 
                                        <% if id_caroQ =412 or id_caroQ =413  THEN %> 
                             <select name="disp_varios" id="disp_varios" class="e_combo" style="width:120" >
							              <option value="0">Seleccione....</option>
							              <option value="1">Solo Turno ma&ntilde;ana</option>
							              <option value="2">Solo turno tarde</option>
                                           <option value="3">Turno Ma&ntilde;ana o tarde </option>
						              </select>
                             <input type="hidden" name="cmbdisposicion" id="cmbdisposicion" value="1">
<%else%>         
							            <select name="cmbdisposicion" id="cmbdisposicion" class="e_combo" style="width:120" onChange="validaDis(this.value)" >
							              <option value="0"<% if disp_varios = 0 then response.Write("selected") end if%>>Seleccione....</option>
 				            <option value="1" <% if lsdisponi = "1" then response.Write("selected") end if%>>S&Iacute;</option>
 				            <option value="2"  <% if lsdisponi = "2" then response.Write("selected") end if%>>NO</option>
						              </select> 
                                      
                                        <input type="hidden" name="disp_varios" id="disp_varios" value="0">
                                        <%end if%>
						           <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Tiene IMPEDIMENTO PARA ser  CONTRATADO CON EL ESTADO:
<select name="preg1" id="preg1" class="e_combo" style="width:120"  >

<option value="0" <% if preg1="0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg1="SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2" <% if preg1="NO" then response.Write("selected") end if%>>NO</option>

						              </select>
							          </span>
							            <input type="hidden" name="disp_varios" id="disp_varios" value="0">
 
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">TIENE ANTECEDENTES SOBRE SANCI&Oacute;N POR FALTA ADMINISTRATIVA, DISCIPLINARIA, ANTECEDENTES JUDICIALES, PENALES O DE PROCESOS DE DETERMINACI&Oacute;N DE RESPONSABILIDADES:
							            <select name="preg2" id="preg2" class="e_combo" style="width:120"  >
							              <option value="0" <% if preg2 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg2 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg2 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
						           <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">TIENE EN LA INSTITUCI&Oacute;N, FAMILIARES HASTA EL 4&deg; GRADO DE CONSANGUINIDAD, 2&deg; DE AFINIDAD O POR RAZ&Oacute;N DE MATRIMONIO, CON LA FACULTAD DE DESIGNAR, NOMBRAR, CONTRATAR<br>O INFLUENCIAR DE MANERA DIRECTA O INDIRECTA EN EL INGRESO A LABORAR AL INEI:
 
							            <select name="preg3" id="preg3" class="e_combo" style="width:120"  >
							              <option value="0" <% if preg3 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg3 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg3 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
						           <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">ACEPTA SOLO POSTULAR EN ESTA CONVOCATORIA, DE LO CONTRARIO SE ELIMINAR&Aacute; SU POSTULACI&Oacute;N DE FORMA AUTOM&Aacute;TICA:

 
							            <select name="preg4" id="preg4" class="e_combo" style="width:120"  >
							              <option value="0"<% if preg4 = "" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg4 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg4 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select> 
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Tiene habilidades para el manejo de equipos interdisciplinarios:
 
							            <select name="preg5" id="preg5" class="e_combo" style="width:120"  >
							              <option value="0"<% if preg5 = "" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg5 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg5 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta" style="border-bottom:1px solid">Tiene h</span>abilidades comunicativas y para la resoluci&oacute;n de problemas:
 
							            <select name="preg6" id="preg6" class="e_combo" style="width:120"  >
							              <option value="0"<% if preg6 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg6 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg6 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Tiene capacidad para trabajar bajo presi&oacute;n:
 
							            <select name="preg7" id="preg7" class="e_combo" style="width:120"  >
							              <option value="0"<% if preg7 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg7 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg7 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta" style="border-bottom:1px solid">Tiene c</span>apacidad para coordinar con autoridades de distintas instituciones p&uacute;blicas y privadas:
 
							            <select name="preg8" id="preg8" class="e_combo" style="width:120"  >
							              <option value="0"<% if preg8 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg8 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg8 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta" style="border-bottom:1px solid">Tiene bu</span>en nivel de lectura comprensiva y adecuada dicci&oacute;n:
 
							            <select name="preg9" id="preg9" class="e_combo" style="width:120"  >
							              <option value="0"<% if preg9 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg9 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg9 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>	              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Es docente con aula a cargo en IE estatales:
 
							            <select name="preg10" id="preg10" class="e_combo" style="width:120"  >
							              <option value="0"<% if preg10 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg10 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg10 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Disposici&oacute;n exclusiva y a tiempo completo, durante todas las fases del Operativo:
 
							            <select name="preg11" id="preg11" class="e_combo" style="width:120"  >
							              <option value="0"<% if preg11 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg11 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg11 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Acepta la obligatoriedad de asistir a las sesiones de capacitaci&oacute;n:
                                        <select name="preg12" id="preg12" class="e_combo" style="width:120"  >
<option value="0"<% if preg12 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg12 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg12 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr>
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Es residente en la sede que le corresponda:
 
							            <select name="preg13" id="preg13" class="e_combo" style="width:120"  >
							              <option value="0"<% if preg13 = "" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg13 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg13 = "NO" then response.Write("selected") end if%>>NO</option>
						              </select>
					              <font class='alerta5'>(*)</font></td>
					            </tr>
                                <input type="hidden" name="cmbdispoSabDom" id="cmbdispoSabDom" VALUE="0">
								            <input type="hidden" name="cmbdCompromiso" id="cmbdCompromiso" value="0">
				              </table></td>
						  </tr>
                  </table> 				
                  
                  </td>
 			</tr>
            
            
            
          <tr height=3>
            <td colspan=6 align=left>
            <DIV class="CLS">
              <input type=hidden id="txtOper" name="txtOper" value="">
              <input type="hidden" name="otra_inst" id="otra_inst" value="0">
            </DIV>
            <table cellpadding="0" cellspacing="0" border="0"  width="100%" class="tablam" style="BORDER-TOP: #0F83E1 1px solid; BORDER-LEFT: #0F83E1 1px solid;BORDER-RIGHT: #0F83E1 1px solid" >
              <tr>
                <td colspan=8 background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><span class="mensaje2">7. Declaraci&oacute;n de Veracidad de Datos</span></td>
              </tr>
              <tr height=22 >
                <td width="79%"  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="etiqueta">Declaro bajo juramento que los datos consignados en la presente ficha de inscripci&oacute;n, corresponden a la verdad; los mismos que podr&aacute;n ser verificados con los documentos sustentatorios de mi Curriculum Vitae, conforme presente a la instituci&oacute;n.<br><strong>NOTA: Los datos consignados se contrastar&aacute;n con sus documentos adjuntos</strong><font class='cascade4' color=crimson></font></span></td>
                <td width="21%"  height="28" colspan="2" align="left"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta"><font class='alerta5' >
                  <select id="cmbVeracidad" name="cmbVeracidad" class="e_combo" style="width:120" onChange="validaDJ(this.value)"  >
                   <option  value="0">Seleccione...</option>
 				                    <option value="1" <% if lsvaraci = 1 then response.Write("selected") end if%> >SI</option>
 				                    <option value="2" <% if lsvaraci= 2 then response.Write("selected") end if%> >NO</option>
                  </select>
                  (*)</font></span></td>
              </tr>
            </table></td>
          </tr>
      <tr><td colspan="3" height="2"></td></tr>
			<tr>
				<td colspan=3>
					<table border="0" width="100%" align=center cellspacing=0 cellpadding=0>
					<tr height=6>
						<td colspan=4></td></tr>
	                   
					</table>				</td>
			</tr>
      <tr><td colspan="3" height="2"></td></tr> 
			</table>	</td>
	</tr>

     <tr><td height="21" colspan=4 align=center><input type="button" value="Actualizar" onClick="javascript:enviarFichaActualiza('2')" id="button2" name="button2"  class="boton">&nbsp;&nbsp;&nbsp;<input type="button" value="Ver Ficha" onClick="javascript:verDeclaracion()" id="button1" name="button1"  class="boton">	

			 </td></tr>
	</table>
</form>

</div>
	<div id="divDerechoAutor"></div>
</body>
</html>

