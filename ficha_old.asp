<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<%
id=Request("id_cc")
id_proy=Request("id_proy")
dni=Request("dni")
txtFecEmi=Request("txtFecEmi")

ape_pat=UCase(Request("ape_pat"))
ape_mat=UCase(Request("ape_mat"))
nombres=UCase(Request("nombres"))

SQLContCapac = "EXEC dbo.pa_CargoConvocatoria_ficha '"&id&"' ,'1' " 

	set wRsDptoapli = Micone.execute(SQLContCapac)

		Response.ContentType="text/html; charset=iso-8859-1"

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
validarCap1=wRsDptoapli.fields("validarCap1")
validarCap2=wRsDptoapli.fields("validarCap2")
ValidarExp1=wRsDptoapli.fields("ValidarExp1")
validarExp2=wRsDptoapli.fields("validarExp2")
validarExp3=wRsDptoapli.fields("validarExp3")
validarCargo1=wRsDptoapli.fields("validarCargo1")
ValidarCargo2=wRsDptoapli.fields("ValidarCargo2")
preguntasAdicionales=wRsDptoapli.fields("preguntasAdicionales")
validarQuechua=wRsDptoapli.fields("validarQuechua")

valPreg1=wRsDptoapli.fields("valPreg1")
valPreg2=wRsDptoapli.fields("valPreg2")
valPreg3=wRsDptoapli.fields("valPreg3")
valPreg4=wRsDptoapli.fields("valPreg4")
valPreg5=wRsDptoapli.fields("valPreg5")
valPreg6=wRsDptoapli.fields("valPreg6")
valPreg7=wRsDptoapli.fields("valPreg7")
valPreg8=wRsDptoapli.fields("valPreg8")
valPreg9=wRsDptoapli.fields("valPreg9")
valPreg10=wRsDptoapli.fields("valPreg10")
valPreg11=wRsDptoapli.fields("valPreg11")
valPreg12=wRsDptoapli.fields("valPreg12")
valPreg13=wRsDptoapli.fields("valPreg13")
valAFP=wRsDptoapli.fields("valAFP")
valRuc=wRsDptoapli.fields("valRuc")
valUbigeo=wRsDptoapli.fields("valUbigeo")
valCorreo=wRsDptoapli.fields("valCorreo")
valExpGen1=wRsDptoapli.fields("valExpGen1")
valExpGen2=wRsDptoapli.fields("valExpGen2")
valExpGen3=wRsDptoapli.fields("valExpGen3")


	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
''-------------------------------------------------------------
		
lsSQL = "EXEC dbo.pa_ficha_datos_InscripcionActED '"& id &"','"& id_proy &"','"& dni &"' "
		
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open lsSQL, Micone
	
	
If Not Rs.BOF And Not Rs.EOF Then	

	existe="1"
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
	if Rs.Fields("fec_exp")="1/1/1900" then
		lsAnio2 = ""
		lsMes2 = ""
		lsDia2 = ""
	else
		lsAnio2 = MID(Rs.Fields("fec_exp"),7,4)
		lsMes2 = MID(Rs.Fields("fec_exp"),4,2)
		lsDia2 = MID(Rs.Fields("fec_exp"),1,2)
	end if
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
	if fechaInicioCap="1/1/1900" then 
		anioI = ""
		mesI = ""
		diaI = ""
	else 
		anioI = Mid(fechaInicioCap,7)
		mesI = Mid(fechaInicioCap,4,2)
		diaI = Mid(fechaInicioCap,1,2)
	end if 
	
	fechafincap=Rs.Fields("fechafincap")
	
	if fechafincap="1/1/1900" then 
		anioF = ""
		mesF = ""
		diaF = ""
	else 
		anioF = Mid(fechafincap,7)
		mesF = Mid(fechafincap,4,2)
		diaF = Mid(fechafincap,1,2)
	end if
	
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

	'-------------------------------------------
	
	id_tipoPension=Rs.Fields("id_tipoPension")
	id_afp=Rs.Fields("id_afp")
	fec_AfiliaAFP=Rs.Fields("fec_AfiliaAFP")
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
	
	if Rs.Fields("FecIniCursoOf")="1/1/1900" then 
		OfIniAni = ""
		OfIniMes = ""
		OfIniDia = ""
	else
		OfIniAni = MID(Rs.Fields("FecIniCursoOf"),7,4)
		OfIniMes = MID(Rs.Fields("FecIniCursoOf"),4,2)
		OfIniDia = MID(Rs.Fields("FecIniCursoOf"),1,2)
	end if 
	
	if Rs.Fields("FecFinCursoOf")="1/1/1900" then 
		OfFinAni = ""
		OfFinMes = ""
		OfFinDia = ""	
	else 
		OfFinAni = MID(Rs.Fields("FecFinCursoOf"),7,4)
		OfFinMes = MID(Rs.Fields("FecFinCursoOf"),4,2)
		OfFinDia = MID(Rs.Fields("FecFinCursoOf"),1,2)
	end if
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
	
	else
	existe="0"
	lsid_per= ""
	lsDptoI = ""
	lsNomDptoI = ""
	lsProvI = ""
	lsNomProvI = ""
	lsDistI= ""
	lsNomDistI = ""
	lsCargo = ""
	lscargocombo= ""
	lsNCargo = ""
	lsFuncional = ""
	lsCSIGA = ""
	lsApePaterno = ""
	lsApeMaterno = ""
	lsNombre = ""
	lsNombre2 = ""
	lsPEA= ""
	lsSexo = ""	
	lsAnio = ""
	lsMes = ""
	lsDia = ""
	lspais = ""
	lsDptoN = ""
	lsProvN = ""
	lsDistN = ""
	lsNDptoN = ""
	lsNProvN = ""
	lsNDistN = ""
	lsDNI = ""
	lsRUC = ""
	lsECivil = ""
	lsCmbLen = 	""
	lsTelefono = ""
	lsCelular = ""
	lsOperCel =	""
	lsEmail = ""
	lsTipoVia = ""
	lsNomVia = ""
	lsNumPuerta = ""
	lsNumKilometro = ""
	lsNumManzana = ""
	lsNumInterior = ""
    lsDepa = ""
	lsNumPiso = ""
	lsNumLote = ""
	lsTipoZona = ""
	lsNomZona = ""
	lsDptoRc = ""
	lsNomDptoR = ""
	lsProvRc = ""
	lsNomProvR= ""
	lsDistRc = ""	
	lsNomDistR = ""
	lsNivInst = ""
	lsTipEst = ""
	lsGrado = ""
	
	lsAnio2 = ""
	lsMes2 = ""
	lsDia2 = ""
	lsperioAlc = ""
	lsTiPerAlc = ""
	lsprofesion = ""
	lsUniv = ""
	lsLugEst = ""
	lsExpGen_anio = ""
	lsExpGen_meses = ""
	lsExpCampoanio = ""
	lsExpCampomeses = ""
	lsExpGrupoanio = ""
	lsExpGrupomeses = ""
	lsIneiProc = ""
	lsProyecto = ""
	lsIneiAnio = ""
	lsCargoInei = ""
	lsdisponi = ""
	lsvaraci = ""
	lsexpCapaAnio = ""
	lsexpDocAnio = ""
	lsactivo =  ""
	
	lenguaMaterna = ""
	jefeCasa = ""
	hijoUnico = ""
	lengua = ""
	CursoCapacitacion = ""

	fechaInicioCap = ""
	anioI = ""
	mesI = ""
	diaI = ""
	
	fechafincap = ""
	anioF = ""
	mesF = ""
	diaF = ""
	
	HorasLectivas = ""
	cargoINEI = ""
	ls_descGrado = ""
	fec_reg = ""
	num_conv = ""
	
	Num_reg_grado = ""
	lugar_capacitacion = ""
	idiomaExtr = ""
	nivelIdiomaExt = ""
	dominioIdiomaExt = ""
	
	
	id_tipoPension = ""
	id_afp= ""
	fec_AfiliaAFP= ""
	num_CUSSP= ""
	id_comision= ""
	po_id_TipoPension= ""
    siDescuento= ""

	ExpFormacion= ""
	ExpAplicacion= ""
	NombreFormacion= ""
	NombreAplicacion= ""
	TiempoFormacion= ""
	TiempoAplicacion= ""
	Cargo1= ""
	Cargo2= ""
	EmpCargo1= ""
	EmpCargo2= ""
	tiempoCargo1= ""
	tiempoCargo2= ""

	especialidad_ednom= ""
	mod_edu_1= ""
	mod_edu_2= ""
	mod_edu_3= ""
	mod_edu_4= ""
	mod_edu_5= ""
	mod_edu_6= ""
	mod_cod_1= ""
	mod_cod_2= ""
	mod_cod_3= ""
	mod_cod_4= ""
	mod_cod_desc= ""
	disp_varios= ""
	otro_inst= ""
	especialidad_ednom= ""
	prof_ednom= ""
	
	preg1= ""
	preg2= ""
	preg3= ""
	preg4= ""
	preg5= ""
	preg6= ""
	preg7= ""
	preg8= ""
	preg9= ""
	preg10= ""
	preg11= ""
	preg12= ""
	preg13= ""
	
	TiempoOf= ""
	TiempoHL= ""
	HorasLectivasOf= ""
	FecFinCursoOf= ""
	FecIniCursoOf= ""
	
	OfIniAni = ""
	OfIniMes = ""
	OfIniDia = ""
	
	OfFinAni = ""
	OfFinMes = ""
	OfFinDia = ""
	
	lugar_capacitacionOf= ""
	CursoOf= ""
	TiempoFor= ""
	CargoProc= ""
	TiempoApli= ""
	TiempoProcesos= ""
	CargoFormacion= ""
	CargoProcesos= ""
	NombreProcesos= ""
	CargoAplicacion= ""
	ExpProcesos= ""
	ExpGenFec= ""
	ExpGenInst= ""
	ExpGrupoFec= ""
	ExpGrupoInst= ""
	ExpCampoFef= ""
	ExpCampoInst= ""
	
	end if
	
	Rs.Close
	Set Rs = Nothing
		


sub generaCargo()
			
	SQLContCapac = "EXEC dbo.uspget_CargoConvocatoria_uno '"&id&"' ,'1' "
	
		set wRsDptoapli = Micone.execute(SQLContCapac)

		Response.ContentType="text/html; charset=iso-8859-1"
		response.write wRsDptoapli("desc_cargoFuncional")

		wRsDptoapli.Close
		Set wRsDptoapli = Nothing
	
End sub



sub generaDpto()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_CCDD_CONVO_uno '"&id&"' ")
	

	Response.Write "<select class=""form-control"" id=""txtDpto1""  name=""txtDpto1"" onChange=""generaprov()"">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaSede()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_genera_sede '"&id&"', '" &id_proy& "' ")
	

	Response.Write "<select class=""form-control"" id=""txtSede""  name=""txtSede"" onChange=""registrarUbigeo(this.value), generaprov2(2)"">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		IF lsDptoI&lsProvI&lsDistI = wRsDptoapli("codigo")then
			Response.Write "<option selected value=""" & wRsDptoapli("cod_sede") & "*" &wRsDptoapli("codigo") & """>"& Server.HtmlEncode(wRsDptoapli("cod_sede")&" "&wRsDptoapli("nombre")) & "</option>"
		ELSE 
			Response.Write "<option value=""" & wRsDptoapli("cod_sede") & "*" &wRsDptoapli("codigo") & """>"& Server.HtmlEncode(wRsDptoapli("cod_sede")&" "&wRsDptoapli("nombre")) & "</option>"
		END IF
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaPAIS()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getpais ")

	
	Response.Write "<select class=""form-control"" id=""cmbpais"" name=""cmbpais"" onChange=""validanac(this.value);"" >"
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


sub generaDpto3()'NAC
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCCDD2 ")

	
	Response.Write "<select class=""form-control"" id=""txtDpto3"" name=""txtDpto3""  onChange=""generaprov3();"" >"
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


sub generaDpto2()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_dpto_cerresidencia   ")



	Response.Write "<select class=""form-control""  id=""txtDpto2"" name=""txtDpto2""   onChange=""generaprov2(1), validadepa(); "" >"
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

sub generaNivel ()

	set Rs = Micone.execute(" exec dbo.getNivelFicha '"&id&"' ")
	
	response.Write "<select class=""form-control""  id=""cmbNivelInstr"" name=""cmbNivelInstr"" onChange=""valida_nivel3(this.value); genera_grado(this.value);""  >"
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

	Rs.Close
	Set Rs = Nothing

end sub

sub generaprofesion()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getProfesion ")

	
	Response.Write "<select class=""form-control""  id=""cmbProfesion"" name=""cmbProfesion""  >"
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
	Response.Write "<select class=""form-control""  disabled id=""cmbUniversidad""  name=""cmbUniversidad""  >"
else 
	Response.Write "<select class=""form-control"" style=""width:300px"" id=""cmbUniversidad""  name=""cmbUniversidad""  >"
	
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


sub generaTipoPension()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_pension_listar ")


	Response.Write "<select disabled id=""txtTipoPension""  name=""txtTipoPension"" class=""form-control"" onchange=""validaPension(this.value)"" >"
	'onchange=""validarPension(this.value)""

	Response.Write " <option selected id="" valor_defecto"" value="""">Seleccione...</option>"

	While not wRsDptoapli.EOF
	if id_tipoPension=wRsDptoapli(0) then
	Response.Write "<option selected value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if 
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


 sub generaAFP()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_AFP_listar ")

	Response.Write "<select disabled class=""form-control"" id=""txtAFP""  name=""txtAFP"" >"
	
	Response.Write " <option id="" valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if id_afp=wRsDptoapli(0) then
	Response.Write "<option selected value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub   



sub generaVIA()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getvia ")

	
	Response.Write "<select class=""form-control""  id=""cmbTipovia"" name=""cmbTipovia""  >"
	Response.Write " <option  value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if lsTipoVia<>"" then 
	if wRsDptoapli(0)=cint(lsTipoVia)  then 
		Response.Write "<option value=""" & wRsDptoapli(1) & """ SELECTED>" &wRsDptoapli(2) & "</option>"
	else 
		Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
	end if 
	else 
	Response.Write "<option value=""" & wRsDptoapli(1) & """>" &wRsDptoapli(2) & "</option>"
	end if 
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaZona()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getZONA ")

	
	Response.Write "<select class=""form-control""  id=""cmbZona"" name=""cmbZona"" >"
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
			
sub generaComision()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_comision_AFP_listar ")
	
		Response.Write "<select disabled class=""form-control"" style=""width:200px"" id=""txtComision""  name=""txtComision"" >"
	Response.Write " <option id="" valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	if id_comision=wRsDptoapli(0) then 
		Response.Write "<option selected value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	else
	Response.Write "<option value=""" & wRsDptoapli(0) & """ >"&wRsDptoapli(1) & "</option>"
	end if

		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 
											
%>

<!DOCTYPE html>
<html lang="en">
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/non-responsive.min.css" rel="stylesheet">
        <link href="css/bootstrap-universidad.min.css" rel="stylesheet">
        
        <script type="text/javascript" src="js/funciones.js?id=<%Now()%>"></script>
        
    </head>
    <body>
 <div style="position: relative;">
 <div id="contenidoTotal" style="position:bsolute;z-index:0" >
    
        <!-- Fixed navbar -->
              <div class="main-container2"> </div> 
        <div class="wrapper-main">
            <div class="page-header clearfix">
                <div class="panel panel-custom">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center etitle" > FICHA DEL POSTULANTE</h3>
                    </div> 
                    <div class="panel-body espace bgwhite">
                        <div class="col-xs-12 contrato espace h4 "> 
                      La informaci&oacute;n consignada en la presente ficha tiene caracter de Declaraci&oacute;n Jurada por lo que el postulante 
                            ser&aacute; responsable de la Informaci&oacute;n consignada y se somete al proceso de fiscalizaci&oacute;n que lleva el INEI. En caso de ocultar informaci&oacute;n y/o haber consignado informaci&oacute;n falsa ser&aacute; excluido del proceso de selecci&oacute;n.
                            En caso de haberse producido la contrataci&oacute;n deber&aacute; interrumpirse por comisi&oacute;n de falta grave.
                        </div>

                        <div class="col-xs-12 contrato espace  margintop"> 
                            <div class="col-xs-1 smalling "><span class="text-danger">(*)</span></div><div class="col-xs-11">Datos Obligatorios.  Escriba correctamente sus datos, seg&uacute;n aparecen en su DNI, cualquier problema posterior, es exclusivamente de su responsabilidad.</div>
                            <div class="col-xs-1 smalling "><span class="text-danger">(**)</span></div><div class="col-xs-11">Llenar obligatoriamente uno de ellos.</div>
                            <div class="col-xs-1 smalling "><span class="text-danger">(***)</span></div>
                            <div class="col-xs-11">El N&uacute;mero de RUC debe estar vigente y es obligatorio presenetar en el momento de la contrataci&oacute;n.</div>                              
                        </div>

                    </div>                    
                    <div class="col-xs-12 col-<em></em>xs-12 eclcabsubprincntsub_w  espace text-center">
                        USTED EST&Aacute; POSTULANDO AL CARGO DE <%generaCargo()%>
                    </div>
                </div>
            </div>

            <div class="clearfix">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">1. Lugar de Postulaci&oacute;n
                          <input type="hidden" id="txtFrm" name="txtFrm" value="">
                           <input type="hidden" id="txtFecEmi" name="txtFecEmi" value="<%=txtFecEmi%>">
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
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <input type="hidden" name="validarCap1" id="validarCap1" value="<%=validarCap1%>">
                          <input type="hidden" name="validarCap2" id="validarCap2" value="<%=validarCap2%>">
                          <input type="hidden" name="ValidarExp1" id="ValidarExp1" value="<%=ValidarExp1%>">
                          <input type="hidden" name="validarExp2" id="validarExp2" value="<%=validarExp2%>">
                          <input type="hidden" name="validarExp3" id="validarExp3" value="<%=validarExp3%>">
                          <input type="hidden" name="validarCargo1" id="validarCargo1" value="<%=validarCargo1%>">
                          <input type="hidden" name="validarCargo2" id="validarCargo2" value="<%=validarCargo2%>">
                          <input type="hidden" name="preguntasAdicionales" id="preguntasAdicionales" value="<%=preguntasAdicionales%>">
                          
                          
                          <input type="hidden" name="valPreg1" id="valPreg1" value="<%=valPreg1%>">
                          <input type="hidden" name="valPreg2" id="valPreg2" value="<%=valPreg2%>">
                          <input type="hidden" name="valPreg3" id="valPreg3" value="<%=valPreg3%>">
                          <input type="hidden" name="valPreg4" id="valPreg4" value="<%=valPreg4%>">
                          <input type="hidden" name="valPreg5" id="valPreg5" value="<%=valPreg5%>">
                          <input type="hidden" name="valPreg6" id="valPreg6" value="<%=valPreg6%>">
                          <input type="hidden" name="valPreg7" id="valPreg7" value="<%=valPreg7%>">
                          <input type="hidden" name="valPreg8" id="valPreg8" value="<%=valPreg8%>">
                          <input type="hidden" name="valPreg9" id="valPreg9" value="<%=valPreg9%>">
                          <input type="hidden" name="valPreg10" id="valPreg10" value="<%=valPreg10%>">
                          <input type="hidden" name="valPreg11" id="valPreg11" value="<%=valPreg11%>">
                          <input type="hidden" name="preguntasAdicionales" id="preguntasAdicionales" value="<%=preguntasAdicionales%>">
                          <input type="hidden" name="valPreg12" id="valPreg12" value="<%=valPreg12%>">
                       <input type="hidden" name="valPreg13" id="valPreg13" value="<%=valPreg13%>">    <input type="hidden" name="valAFP" id="valAFP" value="<%=valAFP%>">
                          
                          <input type="hidden" name="validarQuechua" id="validarQuechua" value="<%=validarQuechua%>">
                          
                          <input type="hidden" name="valRuc" id="valRuc" value="<%=valRuc%>">
                          <input type="hidden" name="validarQuechua" id="valUbigeo" value="<%=valUbigeo%>">
                          
                          <input type="hidden" name="existe" id="existe" value="<%=existe%>">
                          <input name="txtCapaAnio" type="hidden" id="txtCapaAnio" value="0">
                                    <input type="hidden" name="txtCapaMeses" id="txtCapaMeses" value="0">
                                    <input name="txtDocAnio2" type="hidden" id="txtDocAnio2" value="0">
                                    <input type="hidden" name="txtCapaAnio2" id="txtCapaAnio2 " value="0">
                          <input type="hidden" name="val_sede" id="val_sede" value="">
                          <input type="hidden" name="valCorreo" id="valCorreo" value="<%=valCorreo%>">
                          
                         <input type="hidden" name="valExpGen1" id="valExpGen1" value="<%=valExpGen1%>"> 
                          <input type="hidden" name="valExpGen2" id="valExpGen2" value="<%=valExpGen2%>">
                         <input type="hidden" name="valExpGen3" id="valExpGen3" value="<%=valExpGen3%>"> 
                          
                          
                          
                        </h3>
                    </div>
                    <div class="panel-body">
                    
                    <%IF  valUbigeo="4" THEN %>
                    
                    	    <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label>Sede Operativa <span class="text-danger">(*)</span></label>
                                <%generaSede()%>
                              <span class="panel-title">
                                
                              </span></div>
                      </div>
                        
                         <input name="txtDpto1" id="txtDpto1" type="hidden" value="<%=lsDptoI%>">
                        <input name="txtProv1" id="txtProv1" type="hidden" value="<%=lsDptoI&lsProvI%>">
                        <input name="txtDist1" id="txtDist1" type="hidden" value="<%=lsDptoI&lsProvI&lsDistI%>">
                        <input name="txtDist3" id="txtDist3" type="hidden" value="<%=lsDptoI&lsProvI&lsDistI%>">
                                        
                    <%ELSEIF valUbigeo="5" THEN%>

                        <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label>Departamento <span class="text-danger">(*)</span></label>
                                <%generaDpto()%>
                                <input type="hidden" name="txtSede " id="txtSede" value="">
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label  >Provincia <span class="text-danger">(*)</span></label>
                                <DIV  id="prov" >
                                <select class="form-control"  id="txtProv1">
                                	<option value="">Seleccione...</option>
                                </select></DIV>
                            </div>
                        </div>
                       <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label> Distrito <span class="text-danger">(*)</span></label>
                                <div id="dist">
                                <select class="form-control" id="txtDist1"  >
                                    <option  value="">Seleccione...</option>
                                </select>
                                </div>
                            </div>
                      </div>
                        
                      
                        <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label> </label>
                               <DIV  id="distcon" >
                                <input name="txtDist3" id="txtDist3" type="hidden" value="<%=lsDptoI&lsProvI&lsDistI%>">
                            </div>
                        </div>
					</div>

                        <%ELSE %>

                        <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label>Departamento <span class="text-danger">(*)</span></label>
                                <%generaDpto()%>
                                <input type="hidden" name="txtSede " id="txtSede" value="">
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label  >Provincia <span class="text-danger">(*)</span></label>
                                <DIV  id="prov" >
                                <select class="form-control"  id="txtProv1">
                                	<option value="">Seleccione...</option>
                                </select></DIV>
                            </div>
                        </div>
                       <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label> Distrito <span class="text-danger">(*)</span></label>
                                <div id="dist">
                                <select class="form-control" id="txtDist1"  >
                                    <option  value="">Seleccione...</option>
                                </select>
                                </div>
                            </div>
          </div>
                        
                      
                        <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label>Confirme Distrito <span class="text-danger">(*)</span></label>
                               <DIV  id="distcon" >
                                <select class="form-control" id="txtDist3">
                                	<option>Seleccione...</option>
                                </select></DIV>
                            </div>
                        </div>
          
                        <% END IF%> 
                       </div>
                     
                     <div id="txt_sede" style="display:none">
                     <div class="col-xs-12 col-<em></em>xs-12 eclcabsubprincntsub_w  espace text-center"  id="txtSEDES_ECE" > </div>
                </div>
                
                <br>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">2. Datos del Postulante&nbsp; &nbsp; <span class="call">(Escriba sus datos tal como figuran en su DNI)</span></h3>
                    </div>
                    <div class="panel-body">
                        <div class="col-xs-3">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple">
                                    <div class="form-group">
                                        <label >Apellido Paterno (DNI) <span class="text-danger">&nbsp;(*)</span></label>
               <% if existe="1" then 
			   		apePat=lsApePaterno 
				else
					apePat=ape_pat
				end if 	%>
                                        
                                        <input type="text" readonly class="form-control" value="<%=apePat%>" id="txtApePaterno" name="txtApePaterno" >
                                    </div>
                                    <div class="form-group">
                                        <label >Apellido Materno (DNI) <span class="text-danger">&nbsp;(*)</span></label>
                        <% if existe="1" then 
							apeMat=lsApeMaterno 
						else
							apeMat=ape_mat
						end if 	%>
                                      <input readonly type="text" class="form-control"  id="txtApeMaterno" name="txtApeMaterno" value="<%=apeMat%>" >
                                    </div>
                                    <div class="form-group">
                                        <label >Nombres (DNI)<span class="text-danger">&nbsp;(*)</span></label>
                       <% if existe="1" then 
					   		nomb=lsNombre 
						else
							nomb=nombres
end if 								%>
                                        <input readonly type="text" class="form-control"   id="txtNombre1" name="txtNombre1" value="<%=nomb%>" >
                                        <input name="txtNombre2" id="txtNombre2" type="hidden" value="">
                                    </div>
                                      <div class="form-group">
                                        <label for="DNI">DNI <span class="text-danger">&nbsp;(*)</span></label>
                                        <input readonly type="text" class="form-control"  value="<%=dni%>" id="txtDNI" name="txtDNI" placeholder="Introduce DNI">
                                    </div>
                                    <div style="display:none" class="form-group">
                                        <label>Confirme DNI <span class="text-danger">&nbsp;(*)</span></label>
                                        <input type="text" class="form-control" 
                                               placeholder="Confirme DNI">
                                    </div>
                                   <div class="form-group">
                                        <label >Sexo <span class="text-danger">&nbsp;(*)</span></label>
                                        <select class="form-control" id="cmbSexo" name="cmbSexo">
                                            <option selected="selected" value="">Seleccione...</option>
 				              <option value='F'  <%if lsSexo = "F" Then response.Write("selected") End If %>>FEMENINO</option>
 				              <option value='M'  <%if lsSexo = "M" Then response.Write("selected") End If %>>MASCULINO</option>
			              </select>

                                        </select>
                                  </div>
                                </div>
                            </div>
                        </div> 
                        <div class="col-xs-3">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple">
                                    <div class="form-group">
                                        <label >Pais de Nacimiento <span class="text-danger">&nbsp;(*)</span></label>
                                        <%generaPAIS()%>
                                    </div>
                                    <div class="form-group">
                                        <label >Departamento nacimiento <span class="text-danger">&nbsp;(*)</span></label>
                                        <%generaDpto3()%>
                                    </div>
                                    <div class="form-group">
                                        <label >Provincia de Nacimiento <span class="text-danger">&nbsp;(*)</span></label>
                                        <div id="prov3">
                                        <select id="txtProv3" class="form-control">
                                            <option>Seleccione...</option>
 											<option  value="<%=lsDptoN&lsProvN&lsNProvN%>"><%=lsNProvN%></option>
                                        </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >Distrito de Nacimiento <span class="text-danger">&nbsp;(*)</span></label>
                                        <div id="dist4">
                                        <select id="txtDist4" name="txtDist4" class="form-control">
                                            <option>Seleccione...</option>
                                            <option   value="<%=lsDptoN&lsProvN&lsDistN&lsNDistN%>"  ><%=lsNDistN%></option>
                                        </select>
                                        </div>
                                    </div>
                                     
                                                                        <div class="form-group delpmbottom ">
                                        <div><label>Fecha Nacimiento <br/>(dd/mm/aaaa)-(DNI)<span class="text-danger">&nbsp;(*)</span></label></div>
                                        <div class="text-center"><label> <input type="text" id="txtDia" class="form-control txt-n1 text-inline" onKeyPress="return fs_numeros(event)" value="<%=lsDia%>" onBlur="ValidaAnio();"  maxlength="2"  placeholder="dd"></label> /
                                            <label> <input type="text" class="form-control txt-n1 text-inline" id="txtMes"  maxlength="2"  onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio();" placeholder="mm" value="<%=lsMes%>" ></label> /
                                            <label> <input type="text" class="form-control txt-n2 text-inline" id="txtAnio"  maxlength="4" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio();" placeholder="aaaa" value="<%=lsAnio%>" ></label>
                                        </div>
                                    </div>
                                  
                                </div>
                            </div>
                        </div> 
                      <div class="col-xs-3">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple">
								<% if valRuc="0" then %>
								<input name="txtRUC" id="txtRUC" type="hidden" value="">
                                <input name="txtRUC2" id="txtRUC2" type="hidden" value="">
								
								<%else
								%>
                                    <div class="form-group">
                                    
                                    
                                        <label for="RUC">RUC <span class="text-danger">&nbsp;(***)</span></label>
                                        <input type="text" class="form-control" maxlength="11" onKeyPress="return fs_numeros(event)" value="<%=lsRUC%>" id="txtRUC" name="txtRUC" placeholder="Introduce RUC" onBlur="ValidarRUC()">
                                    </div>
                                    <div class="form-group">
                                        <label>Confirme Ruc <span class="text-danger">&nbsp;(***)</span></label>
                                        <input type="text" class="form-control" id="txtRUC2" name="txtRUC2" maxlength="11" onKeyPress="return fs_numeros(event)" value="<%=lsRUC%>" placeholder="Confirme Ruc" onBlur="ValidarRUC2()">
                                    </div>
                                   <% end if%> 
                                    <div class="form-group">
                                        <label >Estado Civil (DNI) <span class="text-danger">&nbsp;(*)</span></label>
                                        <select class="form-control"  id="txtECivil" name="txtECivil" >
                                            <option value='0' selected="selected">Seleccione...</option>
                                            <option value='1' <% if lsECivil = "1" Then response.Write("selected") End If %>>Soltero(a)</option>
                                            <option value='2' <%if lsECivil = "2" Then response.Write("selected") End If %>>Casado(a)</option>
                                            <option value='3' <%if lsECivil = "3" Then response.Write("selected") End If %>>Viudo(a)</option>
                                            <option value='4' <%if lsECivil = "4" Then response.Write("selected") End If %>>Divorciado(a)</option>
                                            <option value='5' <%if lsECivil = "5" Then response.Write("selected") End If %>>Conviviente</option>
 				            </select>
                                        </select>
                                    </div>
                                    <div class="form-group ">
                                        <label >Es Usted hijo &uacute;nico <span class="text-danger">&nbsp;(*)</span></label>
                                        <select class="form-control" id="cmbHijoUnico" name="cmbHijoUnico">
                                          <option selected value="">Seleccione...</option>
                                          <option <%if hijoUnico = "Si" Then response.Write("selected") End If %> value="1">Si</option>
                                          <option  <%if hijoUnico = "No" Then response.Write("selected") End If %> value="2">No</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label >Es jefe y/o responsable de su hogar <span class="text-danger">(*)</span></label>
                                        <select class="form-control" id="cmbJefeHogar" name="cmbJefeHogar">
                                          <option selected value="">Seleccione...</option>
                                          <option value="1" <%if jefeCasa = "Si" Then response.Write("selected") End If %>>Si</option>
                                          <option value="2" <%if jefeCasa = "No" Then response.Write("selected") End If %>>No</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                      </div> 
                        <div class="col-xs-3">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple">

                                    <div class="form-group">
                                        <label >Lengua materna que aprendi&oacute; en su ni&ntilde;ez<span class="text-danger">&nbsp;(*)</span></label>
                                        <select class="form-control" id="cmbLengMat" name="cmbLengMat">
                                        <option selected value="">Seleccione...</option>
                                              <option value="9" <%if lenguaMaterna = "CASTELLANO" Then response.Write("selected") End If %>>CASTELLANO</option>
                                              <option value="1" <%if lenguaMaterna = "AWAJUN" Then response.Write("selected") End If %>>AWAJUN</option>
                                              <option value="2" <%if lenguaMaterna = "QUECHUA" Then response.Write("selected") End If %>>QUECHUA</option>
                                              <option value="3" <%if lenguaMaterna = "AYMARA" Then response.Write("selected") End If %>>AYMARA</option>
                                              <option value="4" <%if lenguaMaterna = "SHIPIBO" Then response.Write("selected") End If %>>SHIPIBO</option>
                                              <option value="5" <%if lenguaMaterna = "OTRA LENGUA NATIVA" Then response.Write("selected") End If %>>OTRA LENGUA NATIVA</option>
                                              <option value="6" <%if lenguaMaterna = "LENGUA EXTRANJERA" Then response.Write("selected") End If %>>LENGUA EXTRANJERA</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label >Lengua originaria que actualmente domina <span class="text-danger">(*)</span></label>
                                        <select class="form-control" id="cmbLeng" name="cmbLeng">
                                             <option selected value="">Seleccione...</option>
							      <option value="9" <%if lenguaMaterna = "CASTELLANO" Then response.Write("selected") End If %>>CASTELLANO</option>
							      <option value="1" <%if lenguaMaterna = "AWAJUN" Then response.Write("selected") End If %>>AWAJUN</option>
							      <option value="2" <%if lenguaMaterna = "QUECHUA" Then response.Write("selected") End If %>>QUECHUA</option>
							      <option value="3" <%if lenguaMaterna = "AYMARA" Then response.Write("selected") End If %>>AYMARA</option>
							      <option value="4" <%if lenguaMaterna = "SHIPIBO" Then response.Write("selected") End If %>>SHIPIBO</option>
                                  <option value="5" <%if lenguaMaterna = "OTRA LENGUA NATIVA" Then response.Write("selected") End If %>>OTRA LENGUA NATIVA</option>
                                  <option value="6" <%if lenguaMaterna = "LENGUA EXTRANJERA" Then response.Write("selected") End If %>>LENGUA EXTRANJERA</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label >Otros Idiomas que domina </label>
                                            <%Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_LISTAR_IDIOMASC ")

	
	Response.Write "<select class=""form-control"" id=""cmbIdiomaC"" name=""cmbIdiomaC"" >"
	 
	
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
	Set wRsDptoapli = Nothing%>
                                       
                                    </div>
                                    <div class="form-group ">
                                        <label >Nivel </label>
                                        <select class="form-control" id="cmbNivelIdioma" name="cmbNivelIdioma">
                                            <option selected value="">Seleccione...</option>
							      <option value="E" <%if nivelIdiomaExt = "E" Then response.Write("selected") End If %>>B&aacute;sico</option>
							      <option value="L" <%if nivelIdiomaExt = "L" Then response.Write("selected") End If %>>Regular</option>
                                  <option value="A" <%if nivelIdiomaExt = "A" Then response.Write("selected") End If %>>Avanzado</option>
                                        </select>
                                    </div>

                                    <div class="form-group delpmbottom">
                                        <label >Dominio</label>
                                        <select class="form-control" id="cmbDomIdioma" name="cmbDomIdioma">
                                          <option selected value="">Seleccione...</option>
                                  <option value="1" <%if dominioIdiomaExt = "1" Then response.Write("selected") End If %>>Solo lee</option>
                                  <option value="2" <%if dominioIdiomaExt = "2" Then response.Write("selected") End If %>>Solo escribe</option>
                                  <option value="3" <%if dominioIdiomaExt = "3" Then response.Write("selected") End If %>>Lee y escribe</option>
                                  <option value="4" <%if dominioIdiomaExt = "4" Then response.Write("selected") End If %>>Traduce</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div class="col-xs-12">
                            <div class="panel panel-default-border delpmbottom">
                                <div class="panel-body simple2">
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <dl class="dl-horizontal">
                                                <dt><label>Tel&eacute;fono </label></dt>                   
                                                <dd><h6 class="margintop">(Use gui&oacute;n para los anexos Ej.5555555-5555) <span class="text-danger"><b>(**)</b></span></h6> </dd>
                                            </dl>
                                            <input type="text" class="form-control "  value="<%=lsTelefono%>" maxlength="10" id="txtTelefono" onKeyPress="return fs_numerosTel(event)" name="txtTelefono" placeholder="Introduce Tel&eacute;fono">
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >Celular Personal <span class="text-danger">(**)</span></label>
                                            <input type="text" class="form-control "   id="txtCelular" name="txtCelular" value="<%=lsCelular%>" maxlength="9" onKeyPress="return fs_numeros(event)" placeholder="Introduce  Celular Personal">
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >Oper. Celular <span class="text-danger">(*)</span></label>
                                            <select class="form-control"  id="cmbOperTel" name="cmbOperTel">
                                                 <option selected="selected" value="">Seleccione...</option>
 				              <option value="MOVISTAR" <% if lsOperCel = "MOVISTAR" then response.Write("selected") end if%>>MOVISTAR</option>
 				              <option value="CLARO" <% if lsOperCel = "CLARO" then response.Write("selected") end if%>>CLARO</option>
 				              <option value="RPM MOVISTAR" <% if lsOperCel = "RPM MOVISTAR" then response.Write("selected") end if%> >RPM MOVISTAR</option>
 				              <option value="RPC CLARO" <% if lsOperCel = "RPM CLARO" then response.Write("selected") end if%>>RPC CLARO</option>
 				              <option value="NEXTEL" <% if lsOperCel = "NEXTEL" then response.Write("selected") end if%>>NEXTEL</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-3 ">
                                        <div class="form-group delpmbottom">
                                            <label > Correo Electr&oacute;nico <% if valCorreo="2" then %><span class="text-danger">&nbsp;(*)</span> <% end IF%></label>
                                            <input type="text" class="form-control" id="txtEmail"  name="txtEmail" 
									value="<%=lsEmail%>" 
                                    onblur="acceptCorreo(this)" 
									maxlength="80"  placeholder="Introduce Correo Electr&oacute;nico">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
               <% if valAFP="0" then 
			   	num4="3"
				num5="4"
				num6="5"
			   
			   %> 
                <input name="txtSiDescuento" id="txtSiDescuento" type="hidden" value="2">
                <input name="txtTipoPension" id="txtTipoPension" type="hidden" value="0">
                <input name="txtAFP" id="txtAFP" type="hidden" value="0">
                <input name="txtFCUSSP" id="txtFCUSSP" type="hidden" value="">
                <input name="txtFecAfiliacion"  id="txtFecAfiliacion"type="hidden" value="">
                
                <input name="txtComision" id="txtComision" type="hidden" value="0">
                
                <%else
				num4="4"
				num5="5"
				num6="6"
				
				%>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">3. Afiliaci&oacute;n a Sistema de Pensi&oacute;n </h3>
                    </div>
                    <div class="panel-body">
                        <div class="col-xs-4">
                            <label >Est&aacute; afiliado a un Sistema de Pensiones?</label>
                          <select name="select" class="form-control" id="txtSiDescuento"  onChange="verSP(this.value)" >
                              <option value="">Seleccione...</option>
                              <% if id_afp="" or id_afp="0" then 
							  AF1=""
							  AF2="selected"
							  else
							  AF1="selected"
							  AF2=""
							  end if
							  
							  %>
                              
                              <option <%=AF1%> value="1">SI</option>
                              <option <%=AF2%> value="2">NO</option>
                          </select>
                        </div>                        
                        <div class="col-xs-12">
                            <div class="panel panel-default-border delpmbottom">
                                <div class="panel-body simple2">
                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label  class="alinear">Sistema Pensiones</label>
                                          <%generaTipoPension()%>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                      <div class="form-group delpmbottom">
                                        <label  class="alinear" >Si esta afiliado a una AFP, a cual?</label>
                                        <%generaAFP()%>
                                      </div>
                                  </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >N&uacute;mero de CUSSP (C&oacute;digo de Afiliado AFP)</label>
                                            <input type="text" class="form-control" disabled id="txtFCUSSP" value="<%=num_CUSSP%>" onKeyPress="return fs_alfanumerico(event)" placeholder="Introduce N&uacute;mero de CUSSP">
                                        </div>
                                    </div>
                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label  class="alinear">Fecha de Afiliaci&oacute;n</label>
                                            <input type="text" class="form-control" disabled onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha(this.value);" onBlur="verificaFechaT(this.value, this.id)" id="txtFecAfiliacion"
                                                   placeholder="Introduce Fecha Afiliaci&oacute;n" value='<%if fec_AfiliaAFP="01/01/1900" then
							  response.write""
							  else
							  response.Write(fec_AfiliaAFP)
							  end if
							  
							  %>' >
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label  class="alinear">Tipo de Comisi&oacute;n  :</label>
                                            <%generaComision()%>
                                        </div>
                                    </div>
                                  
                                </div>
                            </div>
                            <br/>
                            <div class="information">
                                <p class="bg-info text-info delpmbottom"><b>Si Usted est&aacute; afiliado a una AFP, puede consultar el n&uacute;mero de CUSSP (C&oacute;digo de Afiliado) en el siguiente enlace:</b><br/>
                                    <b><a href="http://www.sbs.gob.pe/app/spp/Afiliados/afil_existe.asp"  target="_blank"><u>http://www.sbs.gob.pe/app/spp/Afiliados/afil_existe.asp</u></a></b></p>
                            </div>                            
                        </div>
                    </div>
                </div>
                
                <% end if %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><%=num4%>. Domicilio del Postulante</h3>
                    </div>
                    <div class="panel-body">

                        <div class="col-xs-12">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple2">
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label>Tipo de V&iacute;a<span class="text-danger">&nbsp;(*)</span></label>
                                            
                                            <%generaVIA()%>
                                           
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >Nombre de V&iacute;a (Direcci&oacute;n)<span class="text-danger">&nbsp;(*)</span></label>
                                            <input type="text" class="form-control"  id="txtNomVia" onKeyPress="return fs_alfanumerico(event)" value="<%=trim(lsNomVia)%>" maxlength="80" placeholder="Introduce Nombre de V&iacute;a">
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom ">
                                            <label > N&deg;</label>
                                            <input type="text" class="form-control" id="txtNumPuerta" name="txtNumPuerta" value="<%=lsNumPuerta%>" maxlength="8" onKeyPress="return fs_alfanumerico(event)"  placeholder="Introduce N&deg;">
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label >KM</label>
                                            <input type="text" class="form-control"  id="txtNumKilometro" name="txtNumKilometro" value="<%=lsNumKilometro%>" onKeyPress="return fs_numeros(event)" maxlength="8"placeholder="Introduce KM">
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label >MZ</label>
                                            <input type="text" class="form-control"  id="txtNumManzana" name="txtNumManzana" value="<%=lsNumManzana%>" onKeyPress="return fs_alfanumerico(event)" maxlength="8" placeholder="Introduce MZ">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default-border ">
                                <div class="panel-body simple2">
                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label >Interior</label>
                                            <input type="text" class="form-control" id="txtNumInterior" name="txtNumInterior" value="<%=lsNumInterior%>" maxlength="8"  onKeyPress="return fs_alfanumerico(event)"  placeholder="Introduce Interior">
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >NRO. DEPARTAMENTO</label>
                                            <input type="text" class="form-control" id="txtdepa" name="txtdepa" value="<%=lsdepa%>" maxlength="8" onKeyPress="return fs_numeros(event)" placeholder="Introduce DPTO">
                                        </div>
                                    </div>
                                    <div class="col-xs-1">
                                        <div class="form-group delpmbottom">
                                            <label >Lote</label>
                                            <input type="text" class="form-control"  id="txtNumLote" name="txtNumLote" value="<%=lsNumLote%>" maxlength="8" onKeyPress="return fs_alfanumerico(event)" placeholder="Lote">
                                        </div>
                                    </div>
                                    <div class="col-xs-1">
                                        <div class="form-group delpmbottom">
                                            <label >Piso</label>
                                            <input type="text" class="form-control"  id="txtNumPiso" name="txtNumPiso" value="<%=lsNumPiso%>" maxlength="8" onKeyPress="return fs_numeros(event)" placeholder="Piso">
                                        </div>
                                    </div> 
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >Tipo de Zona<span class="text-danger">&nbsp;(*)</span></label>
<%generaZona()%>
                                        </div>
                                    </div> 
                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label >Nombre Zona<span class="text-danger">&nbsp;(*)</span></label>
                                           <input type="text" class="form-control" value="<%=trim(lsNomZona)%>" id="txtNomZona" name="txtNomZona" maxlength="80" onKeyPress="return fs_alfanumericoE(event)" placeholder="Introduce KM">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default-border delpmbottom">
                                <div class="panel-body simple2">
                                    <div class="col-xs-4">
                                        <div class="form-group delpmbottom">
                                            <label >Departamento Residencia<span class="text-danger">&nbsp;(*)</span></label>
                                            <%generaDpto2()%>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group delpmbottom">
                                            <label > Provincia Residencia<span class="text-danger">&nbsp;(*)</span></label>
                                            <div id="prov2">
                                            <select class="form-control"  name="txtProv2" id="txtProv2">
                                               <% if lsDptoRc ="" then %>               
                                                <option>Seleccione...</option>  
												<%else%>   
                                               <option selected  value="<%=lsDptoRc&lsProvRc&lsNomProvR%>"> <%=lsDptoRc&lsProvRc%> &nbsp;<%=lsNomProvR%></option>
                                                <%end if%>                                              
                                            </select></div>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group delpmbottom">
                                            <label >Distrito Residencia<span class="text-danger">&nbsp;(*)</span></label>
                                            <div id="dist2">
                                            <select class="form-control" name="txtDist2" id="txtDist2" >
                                                <% if lsDptoRc="" then %>        
                                                <option >Seleccione...</option>
                                      <% else%> 
                                       <option selected   value="<%=lsDptoRc&lsProvRc&lsDistRc%>"  ><%= lsDptoRc&lsProvRc&lsDistRc%> &nbsp;<%=lsNomDistR%></option>
                                       <% end if%>                                              
                                            </select></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><%=num5%>. Perfil del Postulante 
                            <span class="call">
                                (Si Ud. es seleccionado, se le solicitar&aacute; que los datos que consigne a continuaci&oacute;n sean respaldados con alg&uacute;n documento. Si no presenta los 
                                documentos ser&aacute; descalificado autom&aacute;ticamente.)
                            </span>

                        </h3>
                    </div>
                    <div class="panel-body">
                      <div class="col-xs-12">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple2">
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label for="Nivel_Instruccion">Nivel de Instrucci&oacute;n<span class="text-danger">&nbsp;(*)</span></label>
                                            <%generaNivel()%>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <input type="hidden" name="cmbTipoEstudios" id="cmbTipoEstudios" value="0">  
                                          <label >Grado Alcanzado</label>
                                            <span class="form-group">
                                            <label ><span class="text-danger">(*)</span></label>
                                            </span>
                                           
                                         <div  id="idGrado">
                                            <select class="form-control" disabled id="cmbGrado" name="cmbGrado" >
                                  <option <%IF lsGrado ="" or isnull(lsGrado) THEN RESPONSE.WRITE "SELECTED" END IF%> value="0">Seleccione...</option>
                                  <option <%IF lsGrado ="1" THEN RESPONSE.WRITE "SELECTED" END IF%> value="1" >PREGRADO (ESTUDIANTE)</option>
                                  <option <%IF lsGrado ="2" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="2" >EGRESADO</option>
								  <option <%IF lsGrado ="3" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="3" >BACHILLER</option>
								  <option <%IF lsGrado ="4" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="4" >TITULADO</option>
								  <option <%IF lsGrado ="5" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="5" >MAGISTER</option>
								  <option <%IF lsGrado ="6" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="6" >DOCTORADO</option>
								  <option <%IF lsGrado ="7" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="7" >ESTUDIOS DE MAESTRIA</option>
								  <option <%IF lsGrado ="8" THEN RESPONSE.WRITE "SELECTED" END IF%>  value="8" >ESTUDIOS DE DOCTORADO</option>

                                           </select>
                                          </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-3 text-center">
                                        <div class="form-group delpmbottom ">
                                            <div><label> Fecha de Expedici&oacute;n Grado</label><label class="h6">&nbsp;</label></div>
                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline"  id="txtDia2" <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%>   name="txtDia2" value="<%=lsDia2%>" maxlength="2" onKeyPress="return fs_numeros(event)" onBlur="ValidaDia()" placeholder="dd" disabled></label> /
                                            <label  class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline"  id="txtMes2" <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%>   name="txtMes2" value="<%=lsMes2%>" maxlength="2" onKeyPress="return fs_numeros(event)" onBlur="ValidaMes()" placeholder="mm" disabled></label> /
                                            <label  class="text-lighter"> <input type="text" class="form-control txt-n2 text-inline" <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%> id="txtAnio2" name="txtAnio2" value="<%=lsAnio2%>" maxlength="4" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2();" placeholder="aaaa" disabled ></label>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label>Registro de expedici&oacute;n de grado</label>
                                            <input type="text" class="form-control" id="txtNum_reg_grado" 
										name="txtNum_reg_grado" 
										value="<%=Num_reg_grado%>"  onKeyPress="return fs_alfanumerico(event)"
										maxlength="50"  placeholder="Introduce Registro de expedici&oacute;n">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default-border ">
                                <div class="panel-body simple2">
                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label >Per&iacute;odo alcanzado en n&uacute;meros</label>
                                            <input type="text" class="form-control" <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%> id="txtperioalc" name="txtperioalc" value="<%=lsperioAlc%>"  onKeyPress="return fs_numeros(event)" size="2" maxlength="2"  placeholder="Introduce Per&iacute;odo" >
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label  class="alinear">Tipo de Per&iacute;odo</label>
                                            <select id="cmbPeriodo" class="form-control"  <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%> onChange="validarPerido(this.value)" >

		<% if id=2754 then %>
         <option value="01"<% if lsTiPerAlc  = "1" then response.Write("selected") end if%>>CICLO</option>
         <option value="03"<% if lsTiPerAlc  = "3" then response.Write("selected") end if%>>A&Ntilde;O</option>
         <%else%>                             
                                                <option value="0" <% if lsTiPerAlc  = "0"  or lsTiPerAlc  = ""  then response.Write("selected") end if%>>Seleccione...</option>
 				              <option value="01"<% if lsTiPerAlc  = "1" then response.Write("selected") end if%>>CICLO</option>
 				              <option value="02"<% if lsTiPerAlc  = "2" then response.Write("selected") end if%>>MES</option>
 				              <option value="03"<% if lsTiPerAlc  = "3" then response.Write("selected") end if%>>A&Ntilde;O</option>
 				              <option value="04"<% if lsTiPerAlc  = "4" then response.Write("selected") end if%>>TRIMESTRE</option>
 				              <option value="05"<% if lsTiPerAlc  = "5" then response.Write("selected") end if%>>SEMESTRE</option>
 				              <!--option value="06"<%' if lsTiPerAlc  = "6" then response.Write("selected") end if%>>CUATRIMESTRE</option -->
 				              <option value="07"<% if lsTiPerAlc  = "7" then response.Write("selected") end if%>>MODULO</option>
 				              <!-- option value="08"<%' if lsTiPerAlc  = "8" then response.Write("selected") end if%>>NIVEL</option  -->
<%end if%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                          <label class="alinear">Ocupaci&oacute;n y/o Profesi&oacute;n</label>
                                            <span class="form-group">
                                            <label ><span class="text-danger">(*)</span></label>
                                            </span>
<%generaprofesion()%>
                                        </div>
                                    </div>
                                    <div class="col-xs-4 delpmbottom">
                                        <div class="form-group delpmbottom">
                                            <label class="alinear">En caso de ser educador, especifique su especialidad</label>
                                            <input type="text" class="form-control"  
                                                   placeholder="Introduce Especialidad" id="especialidad_ednom" value="<%=especialidad_ednom%>" >
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default-border ">
                                <div class="panel-body simple2">
                                    <div class="col-xs-4 delpmbottom">
                                        <div class="form-group delpmbottom">
                                            <label>Universidad<span class="text-danger">&nbsp;(**)</span></label>
                                            <%generaUniversidad()%>
                                        </div>
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="form-group delpmbottom">
                                            <label for="Centro_estudios">Centro de estudios<span class="text-danger">&nbsp;(**)</span></label>
                                            <input type="text" class="form-control" name="txtLugEst" <% if lsNivInst = "4" then response.Write("disabled") end if%>   id="txtLugEst"  value="<%=lsLugEst%>"  onKeyPress="return fs_alfanumericoE(event)" maxlength="60" placeholder="Introduce tu Centro de estudios">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="espace-bottom">
                                <table width="100%" class="table table-bordered table-det-web">
                                    <thead>
                                        <tr>
                                        

                                        
                                            <th width="496" style="width:480px;">Experiencia Total</th>
                                            <% if  id_proy<>99 and id_proy<>103 then %><th width="382">Nombre Instituci&oacute;n (Registre solo el &uacute;ltimo)</th><th width="185" style="width:115px;">Fecha &Uacute;ltimo d&iacute;a de labores</th> <% end if %>
                                            <th width="71" style="width:10px;"> A&ntilde;os
                                                <br/>Ejm. 3 a&ntilde;o(s)</th>
                                            <th width="79" style="width:10px;"> Meses
                                                <br/>Ejm. 3 a&ntilde;o(s)
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><% if experiencia_1="" or isnull(experiencia_1) then %>
                                  A&ntilde;os o meses  de experiencia en trabajos de Campo (Censo y/o Encuestas)
								  <%else%>
                                  <span class="etiqueta">
<%=experiencia_1%>
                                  </span><%end if%></td>
                                  <% if  id_proy<>99 and id_proy<>103  then %>
                                  
                                            <td ><input type="text" class="form-control" placeholder="Introduce Nombre  Instituci&oacute;n" value="<%=ExpCampoInst%>"   maxlength="500" id="txtExpCampoInst" name="txtExpCampoInst" /></td>
                                            <td>
                                                <input type="text" class="form-control " placeholder="Fecha" name="txtExpCampoFef" maxlength="10" id="txtExpCampoFef" value="<%
if 	ExpCampoFef="" or ExpCampoFef="1/1/1900" or ExpCampoFef="01/01/1900" then
response.Write("")
else 											response.write(ExpCampoFef)
end if%>" onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha(this.value);" onBlur="verificaFechaT(this.value, this.id)"/>
                                            </td>
                                            
                                            <%else %>

 <input name="txtExpCampoInst" id="txtExpCampoInst" type="hidden" value="">
 <input name="txtExpCampoFef" id="txtExpCampoFef" type="hidden" value=""> 
                                            <%end if %>
                                            <td class="space-nowrap">
                                                <label class="text-lighter"><input type="text"  id="txtExpCampoAnio" name="txtExpCampoAnio" maxlength="2" onKeyPress="return fs_numeros(event)" class="form-control txt-n1"  value="<%=lsExpCampoanio %>"  placeholder="A&ntilde;o" /></label><label>&nbsp;&nbsp;a&ntilde;o(s)</label>
                                            </td>
                                            <td class="space-nowrap">
                                                <label class="text-lighter"><input type="text"id="txtExpCampoMeses" name="txtExpCampoMeses" value="<%=lsExpCampomeses %>" maxlength="2" onBlur="valor_mes(this.value,this.id)" onKeyPress="return fs_numeros(event)"  class="form-control txt-n1" placeholder="Mes"/></label><label>&nbsp;&nbsp;mes(es)</label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><% if experiencia_2="" or isnull(experiencia_2) then %>A&ntilde;os o meses  de experiencia en manejo de grupos:<%else%><%=experiencia_2%><%end if%></td>
                                            <% if  id_proy<>99 AND  id_proy<>103  then  %>
                                          <td><input type="text" class="form-control "  placeholder="Introduce Nombre Instituci&oacute;n"  id="txtExpGrupoInst" name="txtExpGrupoInst" value="<%=ExpGrupoInst%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)"/></td>
                                            <td  class="space-nowrap">
                                                <input type="text" class="form-control " placeholder="Fecha" id="txtExpGrupoFec" value="<%
if ExpGrupoFec="" or ExpGrupoFec="1/1/1900" or ExpGrupoFec="01/01/1900" then
response.Write("")
else
response.Write(ExpGrupoFec)
end if
%>" onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha(this.value);" onBlur="verificaFechaT(this.value, this.id)"/>
                                            </td>
                                            <%else%>
 <input name="txtExpGrupoInst" id="txtExpGrupoInst" type="hidden" value="">
 <input name="txtExpGrupoFec" id="txtExpGrupoFec" type="hidden" value="">
											<% end if %>
                                            <td class="space-nowrap">
                                                <label class="text-lighter"><input type="text"id="txtExpGrupoAnio" name="txtExpGrupoAnio" value="<%=lsExpGrupoanio %>" maxlength="2" onKeyPress="return fs_numeros(event)" class="form-control txt-n1" placeholder="A&ntilde;o"/></label><label>&nbsp;&nbsp;a&ntilde;o(s)</label>
                                            </td>
                                            <td class="space-nowrap">
                                                <label class="text-lighter"><input type="text"id="txtExpGrupoMeses" name="txtExpGrupoMeses" value="<%=lsExpGrupomeses %>" maxlength="2" onBlur="valor_mes(this.value,this.id)" onKeyPress="return fs_numeros(event)" class="form-control txt-n1" placeholder="Mes"/></label><label>&nbsp;&nbsp;mes(es)</label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><% if experiencia_3="" or isnull(experiencia_3) then %>
                        <span class="etiqueta" >A&ntilde;os o meses de experiencia en actividades en general:</span>
                                    <%else%>
									<span class="etiqueta" ><%=experiencia_3%></span>
									<%end if%>
                                     <% if  id_proy<>99 and id_proy<>103  then %>
                                    <td><input type="text" class="form-control "  placeholder="Introduce Nombre Instituci&oacute;n"  id="txtExpGenInst" name="txtExpGenInst" value="<%=ExpGenInst%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)"/></td>
                                            <td  class="space-nowrap">
                                                <input type="text" class="form-control " placeholder="Fecha" / id="txtExpGenFec" value="<% if ExpGenFec ="" or ExpGenFec="1/1/1900" or ExpGenFec="01/01/1900" then
												response.write("")
												else
												response.Write(ExpGenFec)
												end if%>" onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha(this.value);" onBlur="verificaFechaT(this.value, this.id)">
                                            </td>
                                            <%else%>
 <input name="txtExpGenInst" id="txtExpGenInst" type="hidden" value="">
 <input name="txtExpGenFec" id="txtExpGenFec" type="hidden" value="">

                                            <%end if %>
                                            <td class="space-nowrap">
                                                <label class="text-lighter"><input type="text"id="txtExpGenAnio" name="txtExpGenAnio" value="<%=lsExpGen_anio %>" onBlur="valor_ano(this.value,this.id)" maxlength="2" onKeyPress="return fs_numeros(event)" class="form-control txt-n1" placeholder="A&ntilde;o"/></label><label>&nbsp;&nbsp;a&ntilde;o(s)</label>
                                            </td>
                                            <td class="space-nowrap">
                                                <label class="text-lighter"><input type="text" id="txtExpGenMeses" name="txtExpGenMeses" value="<%=lsExpGen_meses %>" onBlur="valor_mes(this.value,this.id)" maxlength="2" onKeyPress="return fs_numeros(event)"  class="form-control txt-n1" placeholder="Mes"/></label><label>&nbsp;&nbsp;mes(es)</label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>


<div class="espace-bottom">
                                                    <table class="table table-bordered table-det-web">
                                                        <thead>
 <% if validarExp1="0" and validarExp2="0" and validarExp3="0" then %>   
                    
 
 <input name="txtExpAplicacion" id="txtExpAplicacion" type="hidden" value="">
<input name="txtNombreAplicacion" id="txtNombreAplicacion" type="hidden" value="">
<input name="txtCargoAplicacion" id="txtCargoAplicacion" type="hidden" value="">
<input name="txtTiempoAplicacion" id="txtTiempoAplicacion" type="hidden" value="">
<input name="txtTiempoApli" id="txtTiempoApli" type="hidden" value="">

<input name="txtExpProcesos" id="txtExpProcesos" type="hidden" value="">
<input name="txtNombreProcesos" id="txtNombreProcesos" type="hidden" value="">
<input name="txtCargoProcesos" id="txtCargoProcesos" type="hidden" value="">
<input name="txtTiempoProcesos" id="txtTiempoProcesos" type="hidden" value="">
<input name="txtCargoProc" id="txtCargoProc" type="hidden" value="">

<input name="txtExpFormacion" id="txtExpFormacion" type="hidden" value="">
<input name="txtNombreFormacion" id="txtNombreFormacion" type="hidden" value="">
<input name="txtCargoFormacion" id="txtCargoFormacion" type="hidden" value="">
<input name="txtTiempoFormacion" id="txtTiempoFormacion" type="hidden" value="">
<input name="txtTiempoFor" id="txtTiempoFor" type="hidden" value="">
  <%else%> 
                                    <tr>
                                                                <th width="500px" >Experiencia Adicional </th><th style="width:250px;">Descripci&oacute;n</th><th style="width:250px;">Nombre de la Instituci&oacute;n</th><th style="width:250px;"> Cargo
                                                                </th>
                                                                <th style="width:200px;"> Tiempo de Duraci&oacute;n
                                                                </th>
                                                            </tr>
             <%end if %>                                           </thead>
                                                        <tbody>
           <% if validarExp1="0" then %>
<input name="txtExpAplicacion" id="txtExpAplicacion" type="hidden" value="">
<input name="txtNombreAplicacion" id="txtNombreAplicacion" type="hidden" value="">
<input name="txtCargoAplicacion" id="txtCargoAplicacion" type="hidden" value="">
<input name="txtTiempoAplicacion" id="txtTiempoAplicacion" type="hidden" value="">
<input name="txtTiempoApli" id="txtTiempoApli" type="hidden" value="">         
           
           <%else%>                                                    <tr> 
                                                                <td>Nombre de la &uacute;ltima Experiencia en operativo de Aplicaci&oacute;n de Instrumentos en campo.</td>
                                                                <td ><input type="text" class="form-control " placeholder="Introduce Descripci&oacute;n" id="txtExpAplicacion" name="txtExpAplicacion" value="<%=ExpAplicacion%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" /></td>
                                                                <td>
                                                                    <input type="text" class="form-control " placeholder="Introduce Nombre Instituci&oacute;n" id="txtNombreAplicacion" name="txtNombreAplicacion" value="<%=NombreAplicacion%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)"/>
                                                                </td>
                                                                <td  class="text-lighter">
                                                                    <input type="text" class="form-control" placeholder="Introduce Cargo" id="txtCargoAplicacion" name="txtCargoAplicacion" value="<%=CargoAplicacion%>" maxlength="100" onKeyPress="return fs_alfanumerico(event)"/>
                                                                </td>

                                                                <td class="space-nowrap">
                                                                    <label  class="text-lighter"><input type="text" class="form-control txt-n1" id="txtTiempoAplicacion" name="txtTiempoAplicacion" value="<%=TiempoAplicacion%>" maxlength="3" onKeyPress="return fs_numeros(event)"/></label>
                                                                    <label>
                                                                        <select class="form-control" name="txtTiempoApli" id="txtTiempoApli" style="width:100px">
                                          <option <% if isnull(TiempoApli) or TiempoApli="0" or TiempoApli="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                      <option <% if TiempoApli="1" then response.Write("Selected") end if%> value="1">Horas</option>
                                      <option <% if TiempoApli="2" then response.Write("Selected") end if%> value="2">Dias</option>
                                      <option <% if TiempoApli="3" then response.Write("Selected") end if%> value="3">Meses</option>
                                      <option <% if TiempoApli="4" then response.Write("Selected") end if%> value="4"> A&ntilde;os</option>                                     </select>
                                                                    </label>
                                                                </td>
                                                            </tr>

<%end if 
if validarExp2="0" then 
%>
<input name="txtExpProcesos" id="txtExpProcesos" type="hidden" value="">
<input name="txtNombreProcesos" id="txtNombreProcesos" type="hidden" value="">
<input name="txtCargoProcesos" id="txtCargoProcesos" type="hidden" value="">
<input name="txtTiempoProcesos" id="txtTiempoProcesos" type="hidden" value="">
<input name="txtCargoProc" id="txtCargoProc" type="hidden" value="">

<%else%>


                                                            <tr>
                                                                <td>&Uacute;ltima experiencia en coordinaci&oacute;n o supervisi&oacute;n de operativos de aplicación de instrumentos de campo.</td>
                                                                <td><input type="text" class="form-control " placeholder="Introduce Descripci&oacute;n" id="txtExpProcesos" name="txtExpProcesos" value="<%=ExpProcesos%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)"/></td>
                                                                <td  class="space-nowrap">
                                                                    <input type="text" class="form-control " placeholder="Introduce Nombre Instituci&oacute;n" id="txtNombreProcesos" name="txtNombreProcesos" value="<%=NombreProcesos%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)"/>
                                                                </td>
                                                                <td  class="text-lighter">
                                                                    <input type="text" class="form-control " placeholder="Introduce Cargo" id="txtCargoProcesos" name="txtCargoProcesos" value="<%=CargoProcesos%>" maxlength="100" onKeyPress="return fs_alfanumerico(event)"/>
                                                                </td>
                                                                <td class="space-nowrap">
                                                                    <label  class="text-lighter"><input type="text" class="form-control txt-n1" id="txtTiempoProcesos" name="txtTiempoProcesos" value="<%=TiempoProcesos%>" maxlength="3"  onKeyPress="return fs_numeros(event)"/></label>
                                                                    <label  class=""><select class="form-control" name="txtCargoProc" id="txtCargoProc"  style="width:100px">
                                 <option <% if isnull(CargoProc) or CargoProc="0" or CargoProc="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                       <option <% if CargoProc="1" then response.Write("Selected") end if%> value="1">Horas</option>
                                       <option <% if CargoProc="2" then response.Write("Selected") end if%> value="2">Dias</option>
                                       <option <% if CargoProc="3" then response.Write("Selected") end if%> value="3">Meses</option>
                                       <option <% if CargoProc="4" then response.Write("Selected") end if%> value="4">A&ntilde;os</option>                                    </select>
                                                                    </label>
                                                                </td>
                                                            </tr>
<%end if
if validarExp3="0" then
%>
<input name="txtExpFormacion" id="txtExpFormacion" type="hidden" value="">
<input name="txtNombreFormacion" id="txtNombreFormacion" type="hidden" value="">
<input name="txtCargoFormacion" id="txtCargoFormacion" type="hidden" value="">
<input name="txtTiempoFormacion" id="txtTiempoFormacion" type="hidden" value="">
<input name="txtTiempoFor" id="txtTiempoFor" type="hidden" value="">
<%else%>
                                                            <tr>
                                                                <td>&Uacute;ltima experiencia de aula o proyectos de Formaci&oacute;n.</td>
                                                                <td><input type="text" class="form-control " placeholder="Introduce Descripci&oacute;n" id="txtExpFormacion" name="txtExpFormacion" value="<%=ExpFormacion%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)"/></td>
                                                                <td  class="space-nowrap">
                                                                    <input type="text" class="form-control " placeholder="Introduce Nombre Instituci&oacute;n" id="txtNombreFormacion" name="txtNombreFormacion" value="<%=NombreFormacion%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)"/>
                                                                </td>
                                                                <td >
                                                                    <input type="text" class="form-control " placeholder="Introduce Cargo" id="txtCargoFormacion" name="txtCargoFormacion" value="<%=CargoFormacion%>" maxlength="100" onKeyPress="return fs_alfanumerico(event)"/>
                                                                </td>
                                                                <td class="space-nowrap">
                                                                    <label><input type="text" class="form-control txt-n1" id="txtTiempoFormacion" name="txtTiempoFormacion" value="<%=TiempoFormacion%>" maxlength="3"  onKeyPress="return fs_numeros(event)"/></label>
                                                                    <label><select class="form-control" name="txtTiempoFor" id="txtTiempoFor"  style="width:100px" >
                  <option <% if isnull(TiempoFor) or TiempoFor="0" or TiempoFor="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                       <option <% if TiempoFor="1" then response.Write("Selected") end if%> value="1">Horas</option>
                                       <option <% if TiempoFor="2" then response.Write("Selected") end if%> value="2">Dias</option>
                                       <option <% if TiempoFor="3" then response.Write("Selected") end if%> value="3">Meses</option>
                                       <option <% if TiempoFor="4" then response.Write("Selected") end if%> value="4">A&ntilde;os</option>                                  </select>
                                 </label>
                                                                </td>
                                                            </tr>
<%end if%>                                                            
                                                        </tbody>
                                                    </table>
                                                </div>
                            <div class="espace-bottom">
                                <table class="table table-bordered table-det-web">
                                    <thead>
                                        <tr>
                                            <th colspan="4"> Proyectos en el INEI</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>&iquest;Ha participado en el INEI?</td>
                                            <td >
                                                <select class="form-control" id="txtIneiProc" name="txtIneiProc" onChange="javascript:cambiarText('2',this.value,'txtProyecto');" >
							          <option value="" >...</option>
							          <option value="1"  <%if lsIneiProc ="1" then response.Write("selected") END IF%>>Si</option>
							          <option value="2"  <%if lsIneiProc ="2" then response.Write("selected") END IF%>>No</option>
                                                </select>
                                            </td>
                                            <td  class="space-nowrap">&Uacute;ltimo proyecto que particip&oacute; en INEI</td>
                                            <td>
                                                <select class="form-control" id="txtProyecto" name="txtProyecto" disabled >
  <option value="" selected="selected" disabled>Seleccione...</option>
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
							          <option value="OTROS"  <%if lsProyecto ="OTROS" then response.Write("selected") END IF%>>OTROS</option>                    </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&Uacute;ltimo a&ntilde;o que particip&oacute; en INEI</td>
                                            <td >
                                                <input type="text" class="form-control txt-n2" id="txtIneiAnio" name="txtIneiAnio" maxlength="4" value="<%=lsIneiAnio%>" placeholder="A&ntilde;o" onBlur="validar_ano(this.value)" onKeyPress="return fs_numeros(event)" disabled="true"/>
                                            </td>
                                            <td  class="space-nowrap">&Uacute;ltimo cargo que particip&oacute; en INEI</td>
                                            <td>
                                           <%Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getcargo1 ")

	
	Response.Write "<select DISABLED class=""form-control""  id=""txtCargoInei"" name=""txtCargoInei"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	if wRsDptoapli(0) = lsCargoInei then 
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
                                    </tbody>
                                </table>
                            </div>

                            <table class="table table-bordered table-det-web delpmbottom">
                                <thead>
                                <% if validarCargo1="0" and validarCargo2="0" then 
								
								else%>
                                <tr>
                                        <th colspan="3"> &Uacute;LTIMO(S)  CARGO(S) DESEMPE&Ntilde;ADO(S) DE ACUERDO A LA EXPERIENCIA SOLICITADA</th>
                                       
                                  </tr>
                                    
                                  <tr>
                                        <th>Cargo<br><br>  <%=experiencia_1%></th>
                                        <th >Nombre de la Empresa</th>
                                        <th>Tiempo de Duraci&oacute;n en meses</th>
                                  </tr>
                                    <% end if%>
                                </thead>
                                <tbody>
<%if validarCargo1="0" then %>
<input name="txtCargo1" id="txtCargo1" type="hidden" value="">
<input name="txtEmpCargo1" id="txtEmpCargo1" type="hidden" value="">
<input name="txttiempoCargo1" id="txttiempoCargo1" type="hidden" value="">

<% else %>                                
                                    <tr>
                                        <td> 
                                            <table class="table">
                                                <tr><td style="width:190px">Cargo Desempe&ntilde;ado (1) : &nbsp;</td><td  style="width:690px"><input type="text" class="form-control" placeholder="Introduce 1&deg; cargo desempe&ntilde;ado" id="txtCargo1" name="txtCargo1" value="<%=Cargo1%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)"/></td></tr>
                                            </table>
                                        <td >
                                            <input type="text" class="form-control "  placeholder="Introduce Nombre de la Empresa" id="txtEmpCargo1" name="txtEmpCargo1" value="<%=EmpCargo1%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" />
                                        </td>
                                        <td  class="space-nowrap text-center">
                                            <label class="text-lighter"><input type="text" class="form-control txt-n2" placeholder="Mes" id="txttiempoCargo1" name="txttiempoCargo1" value="<%=tiempoCargo1%>" maxlength="2" onKeyPress="return fs_numeros(event)"/></label>
                                            <label>&nbsp;&nbsp;Meses</label>
                                        </td>
                                    </tr>
                                    
<% end if

if validarCargo2="0" then

%>         

<input name="txtCargo2" id="txtCargo2" type="hidden" value="">
<input name="txtEmpCargo2" id="txtEmpCargo2" type="hidden" value="">
<input name="txttiempoCargo2" id="txttiempoCargo2" type="hidden" value="">


<%else %>                           
                                    <tr>
                                        <td><table class="table"><tr><td style="width:270px">Cargo Desempe&ntilde;ado (2) : &nbsp;</td><td style="width:690px"><input type="text" class="form-control " placeholder="Introduce 2&deg; cargo desempe&ntilde;ado" id="txtCargo2" name="txtCargo2" value="<%=Cargo2%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)"/></td></tr></table>
                                        </td>
                                        <td><span class="espace-bottom">
                                        <input type="text" class="form-control " placeholder="Introduce Nombre de la Empresa" id="txtEmpCargo2" name="txtEmpCargo2" value="<%=EmpCargo2%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)"/>
                                        </span></td>
                                        <td  class="space-nowrap text-center">
                                            <label class="text-lighter"><input type="text" class="form-control txt-n2" placeholder="Mes" id="txttiempoCargo2" name="txttiempoCargo2" value="<%=tiempoCargo2%>" maxlength="2" onKeyPress="return fs_numeros(event)"/></label>
                                            <label>&nbsp;&nbsp;Meses</label>
                                        </td>

                                    </tr>
<% end if%>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><%=num6%>. Capacitaci&oacute;n y datos compelementarios</h3>
                    </div>
                    <div class="panel-body">

                            <div class="col-xs-12">                                                               					<div class="col-xs-12">
                                                    <div class="espace-bottom">

<%if validarCap1="0"  then %>
<input name="txtCurso" id="txtCurso" type="hidden" value="">
<input name="txtlugar_capacitacion" id="txtlugar_capacitacion" type="hidden" value="">
<input name="DIcurso" id="DIcurso" type="hidden" value="">
<input name="MIcurso" id="MIcurso" type="hidden" value="">
<input name="AIcurso" id="AIcurso" type="hidden" value="">
<input name="DFcurso" id="DFcurso" type="hidden" value="">
<input name="MFcurso" id="MFcurso" type="hidden" value="">
<input name="AFcurso" id="AFcurso" type="hidden" value="">
<input name="txtHorasLectivas" id="txtHorasLectivas" type="hidden" value="">
<input name="txtTiempoHL" id="txtTiempoHL" type="hidden" value="">

<% else %>                                                        <table class="table table-bordered table-det-web">
                                                            <thead>
                                                                <tr>
                                                                    <th>&Uacute;ltima capacitaci&oacute;n Profesional</th>
                                                                    <th>Nombre de la Instituci&oacute;n o Empresa</th>
                                                                    <th>Fecha Inicio<h5>(dd/mm/aaaa)</h5></th>
                                                            <th>Fecha Fin<h5>(dd/mm/aaaa)</h5></th>
                                                            <% if id_proy<>103 then %>                                                    <th> Tiempo</th>
                                                           <% end if%>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><input type="text" class="form-control" placeholder="Ingrese &Uacute;ltima capacitaci&oacute;n" id="txtCurso" name="txtCurso" value="<%=CursoCapacitacion%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)"/></td>
                                                                    <td>
                                                                        <input type="text" class="form-control " placeholder="Ingrese Nombre de la Instituci&oacute;n" id="txtlugar_capacitacion" name="txtlugar_capacitacion" value="<%=lugar_capacitacion%>" maxlength="300" onKeyPress="return fs_alfanumerico(event)"/>
                                                                    </td>
                                                                    <td  class="space-nowrap text-center">
                                                                        <div class="form-group delpmbottom ">
    
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline"  placeholder="dd" id="DIcurso"  name="DIcurso" value="<%=diaI%>" maxlength="2" onKeyPress="return fs_numeros(event)"></label> /
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline"  placeholder="mm"  id="MIcurso"   name="MIcurso" value="<%=mesI%>" maxlength="2" onKeyPress="return fs_numeros(event)"></label> /
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n2 text-inline"  placeholder="aaaa" id="AIcurso" name="AIcurso" value="<%=anioI%>" maxlength="4" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2E(2);"></label>
                                                                        </div>
                                                                    </td>
                                                                    <td  class="space-nowrap text-center">
                                                                        <div class="form-group delpmbottom ">
    
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline"  placeholder="dd" id="DFcurso"   name="DFcurso" value="<%=diaF%>" maxlength="2"   onKeyPress="return fs_numeros(event)"></label> /
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline" placeholder="mm"  id="MFcurso" name="MFcurso" value="<%=mesF%>" maxlength="2"  onKeyPress="return fs_numeros(event)"></label> /
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n2 text-inline"  placeholder="aaaa" id="AFcurso" name="AFcurso" value="<%=anioF%>" maxlength="4"  onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2E(3);"></label>
                                                                        </div>
                                                                    </td>
                                                                     <% if id_proy<>103 then%>        
                                                             <td class="space-nowrap text-center" >
                                                              <label class="text-lighter"><input type="text" class="form-control txt-n1" id="txtHorasLectivas" name="txtHorasLectivas" value="<%=HorasLectivas%>" maxlength="4" onKeyPress="return fs_numeros(event)"/></label>
                                                                        <label><select class="form-control" name="txtTiempoHL" id="txtTiempoHL">
                                                                               <option <% if isnull(TiempoHL) or TiempoHL="0" or TiempoHL="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                       <option <% if TiempoHL="1" then response.Write("Selected") end if%> value="1">Horas</option>
                                       <option <% if TiempoHL="2" then response.Write("Selected") end if%> value="2">Dias</option>
                                       <option <% if TiempoHL="3" then response.Write("Selected") end if%> value="3">Meses</option>
                                       <option <% if TiempoHL="4" then response.Write("Selected") end if%> value="4">A&ntilde;os</option>
                                                                            </select>
                                                                        </label>
                                                                         </td><% else %>
                                                      <label class="text-lighter"><input type="hidden" id="txtHorasLectivas" name="txtHorasLectivas" value="<%=HorasLectivas%>" maxlength="4" onKeyPress="return fs_numeros(event)"/></label>
                                                                        <label><input type="hidden" id="txtTiempoHL" name="txtTiempoHL" value="<%=TiempoHL%>"/>
                                                      </label>
                                                      <% end if%>
                                                                </tr>
                                                            </tbody>
                                                        </table>
<%end if%>                                                </div>
                                                </div>
    
    <div class="col-xs-12">
                                                    <div class="espace-bottom">
                                                    
<% if validarCap2="0" then%>
<input name="txtCursoOf" id="txtCursoOf" type="hidden" value="">
<input name="txtlugar_capacitacionOf" id="txtlugar_capacitacionOf" type="hidden" value="">
<input name="DIcursoOf" id="DIcursoOf" type="hidden" value="">
<input name="MIcursoOf" id="MIcursoOf" type="hidden" value="">
<input name="AIcursoOf" id="AIcursoOf" type="hidden" value="">
<input name="DFcursoOf" id="DFcursoOf" type="hidden" value="">
<input name="MFcursoOf" id="MFcursoOf" type="hidden" value="">
<input name="AFcursoOf" id="AFcursoOf" type="hidden" value="">
<input name="txtHorasLectivasOf" id="txtHorasLectivasOf" type="hidden" value="">
<input name="txtTiempoOf" id="txtTiempoOf" type="hidden" value="">
                                        
<%else%>                                               <table class="table table-bordered table-det-web">
                                                            <thead>
                                                                <tr>
                                                                    <th>Capacitaci&oacute;n en Microsoft Office</th>
                                                                    <th>Nombre de la Instituci&oacute;n o Empresa</th>
                                                                    <th>Fecha Inicio<h5>(dd/mm/aaaa)</h5></th>
                                                            <th>Fecha Fin<h5>(dd/mm/aaaa)</h5></th>
                                                             <% if id_proy<>103 then %>                                                    <th> Tiempo</th>
                                                           <% end if%>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><input type="text" class="form-control" placeholder="Ingrese Capacitaci&oacute;n en Microsoft Office" id="txtCursoOf" name="txtCursoOf" value="<%=CursoOf%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)"/></td>
                                                                    <td>
                                                                        <input type="text" class="form-control " placeholder="Ingrese Nombre de la Instituci&oacute;n" id="txtlugar_capacitacionOf" name="txtlugar_capacitacionOf" value="<%=lugar_capacitacionOf%>" maxlength="300" onKeyPress="return fs_alfanumerico(event)"/>
                                                                    </td>
                                                                    <td  class="space-nowrap text-center">
                                                                        <div class="form-group delpmbottom ">
    
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline"  placeholder="dd" id="DIcursoOf"  name="DIcursoOf" value="<%=OfIniDia%>" maxlength="2" onKeyPress="return fs_numeros(event)"></label> /
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline"  placeholder="mm"  id="MIcursoOf"   name="MIcursoOf" value="<%=OfIniMes%>" maxlength="2"  onKeyPress="return fs_numeros(event)"></label> /
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n2 text-inline" placeholder="aaaa"  id="AIcursoOf"   name="AIcursoOf" value="<%=OfIniAni%>" maxlength="4"  onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2E(4)" ></label>
                                                                        </div>
                                                                    </td>
                                                                    <td  class="space-nowrap text-center">
                                                                        <div class="form-group delpmbottom ">
    
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline" placeholder="dd"  id="DFcursoOf"   name="DFcursoOf" value="<%=OfFinDia%>" maxlength="2" onKeyPress="return fs_numeros(event)"></label> /
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline" placeholder="mm" id="MFcursoOf" name="MFcursoOf" value="<%=OfFinMes%>" maxlength="2" onKeyPress="return fs_numeros(event)"></label> /
                                                                            <label class="text-lighter"> <input type="text" class="form-control txt-n2 text-inline" placeholder="aaaa" id="AFcursoOf" name="AFcursoOf" value="<%=OfFinAni%>" maxlength="4"onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio2E(5);"></label>
                                                                        </div>
                                                                    </td>
                                                                   <% if id_proy<>103 then %>
                                                                    <td class="space-nowrap text-center"> 
  <label class="text-lighter"><input type="text" class="form-control txt-n1" id="txtHorasLectivasOf" name="txtHorasLectivasOf" value="<%=HorasLectivasOf%>" maxlength="4" onKeyPress="return fs_numeros(event)" /></label>
                                                                        <label><select class="form-control" name="txtTiempoOf" id="txtTiempoOf">
                          <option <% if isnull(TiempoOf) or TiempoOf="0" or TiempoOf="" then response.Write("Selected") end if %> value="0">Seleccione....</option>
                                       <option <% if TiempoOf="1" then response.Write("Selected") end if%> value="1">Horas</option>
                                       <option <% if TiempoOf="2" then response.Write("Selected") end if%> value="2">Dias</option>
                                       <option <% if TiempoOf="3" then response.Write("Selected") end if%> value="3">Meses</option>
                                       <option <% if TiempoOf="4" then response.Write("Selected") end if%> value="4">A&ntilde;os</option>
                                                              </select>
                                                                        </label>
                                                                    </td>
                                                                    
<% else %>                   
                                                                    
                                                                        <label class="text-lighter"><input type="hidden" class="form-control txt-n1" id="txtHorasLectivasOf" name="txtHorasLectivasOf" value="<%=HorasLectivasOf%>" maxlength="4" onKeyPress="return fs_numeros(event)" /></label>
                                                                        <label class="text-lighter"><input type="hidden" class="form-control txt-n1" id="txtTiempoOf" name="txtTiempoOf" value="<%=TiempoOf%>" /></label>           
 <% end if%>                                 
                                                                </tr>
                                                            </tbody>
                                                        </table>
     <%end if%>
                                                    </div>
                                                </div>
                            <div class="panel panel-default-border delpmbottom">
                                <div class="panel-body simple2">
                                    <div class="col-xs-12 espace-bottom">
                                        <div>
                                            <label>Dato Complementario: &nbsp;Este dato ser&aacute; usado por Usted en los siguientes procesos de selecci&oacute;n. Es de uso exclusivo y debe mantenerlo en reserva.</label>
                                        </div>
                                        <div>
                                            Fecha de nacimiento de su Padre o madre:&nbsp;
                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline"  placeholder="dd"  id="DiaComp"  name="DiaComp" value="" maxlength="2" onKeyPress="return fs_numeros(event)"></label> /
                                            <label class="text-lighter"> <input type="text" class="form-control txt-n1 text-inline"  placeholder="mm" id="MesComp"   name="MesComp" value="" maxlength="2" onKeyPress="return fs_numeros(event)"></label> /
                                            <label class="text-lighter"> <input type="text" class="form-control txt-n2 text-inline" placeholder="aaaa" id="AnioComp" name="AnioComp" value="" maxlength="4" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio5();" /></label>
                                        </div>
                                    </div>
                                    
                                    
<% if id_proy=103 then %>                                    
<input name="cmbdisposicion" id="cmbdisposicion" type="hidden" value="1">
<%else %>
                                    <div class="col-xs-12"><label>Otros Aspectos:<span class="text-danger">&nbsp;(**)</span></label></div>
                                    <div class="col-xs-4">Disposici&oacute;n para trabajar a tiempo completo:&nbsp;</div>
                                    <select class="form-control txt-n9" name="cmbdisposicion" id="cmbdisposicion" onChange="validaDis(this.value)">
                                        <option value="0"<% if lsdisponi = "0" or lsdisponi="" then response.Write("selected") end if%>>Seleccione....</option>
 				            <option value="1" <% if lsdisponi = "1" then response.Write("selected") end if%>>S&Iacute;</option>
 				            <option value="2"  <% if lsdisponi = "2" then response.Write("selected") end if%>>NO</option>
                                    </select>
                                </div>
   <%end if%>                             
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

<% if Datos_adicionales="0" then %>
<input name="preg1" id="preg1" type="hidden" value="">
<input name="preg2" id="preg2" type="hidden" value="">
<input name="preg3" id="preg3" type="hidden" value="">
<input name="preg4" id="preg4" type="hidden" value="">
<input name="preg5" id="preg5" type="hidden" value="">
<input name="preg6" id="preg6" type="hidden" value="">
<input name="preg7" id="preg7" type="hidden" value="">
<input name="preg8" id="preg8" type="hidden" value="">
<input name="preg9" id="preg9" type="hidden" value="">
<input name="preg10" id="preg10" type="hidden" value="">
<input name="preg11" id="preg11" type="hidden" value="">
<input name="preg12" id="preg12" type="hidden" value="">
<input name="preg13" id="preg13" type="hidden" value="">


<%else%>

<% if id_proy="99" then%>
<table class="table table-bordered table-det-web">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="2">Otros Aspectos</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
<% if valPreg1="0" then%>
<input name="preg1" id="preg1" type="hidden" value="">
<%
else
%>                                                       
                                                        <tr>
                                                            <td width="92%">TIENE IMPEDIMENTO PARA SER CONTRATADO CON EL ESTADO:</td>
                                                            <td width="8%"> <select class="form-control" name="preg1" id="preg1" > 
<option value="0" <% if preg1="0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg1="SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2" <% if preg1="NO" then response.Write("selected") end if%>>NO</option>                         
</select></td>
                                                        </tr>
<% 
end if
if valPreg2="0" then%>
<input name="preg2" id="preg2" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td>TIENE ANTECEDENTES SOBRE SANCI&Oacute;N POR FALTA ADMINISTRATIVA, DISCIPLINARIA, ANTECEDENTES JUDICIALES, PENALES O DE PROCESOS DE DETERMINACI&Oacute;N DE RESPONSABILIDADES:</td>                                            
                                                            <td> <select class="form-control" name="preg2" id="preg2" >
                                                            <option value="0" <% if preg2 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg2 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2" <% if preg2 = "NO" then response.Write("selected") end if%>>NO</option>
</select></td>
                                                        </tr>

<% 
end if
if valPreg3="0" then%>
<input name="preg3" id="preg3" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td>TIENE EN LA INSTITUCI&Oacute;N, FAMILIARES HASTA EL 4to GRADO DE CONSANGUINIDAD, 2do DE AFINIDAD O POR RAZ&Oacute;N DE MATRIMONIO, CON LA FACULTAD DE DESIGNAR, NOMBRAR, CONTRATAR O INFLUENCIAR DE MANERA DIRECTA O INDIRECTA EN EL INGRESO A LABORAR AL INEI:</td>
                                                            <td> <select class="form-control" name="preg3" id="preg3" >
      <option value="0" <% if preg3 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg3 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg3 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg4="0" then%>
<input name="preg4" id="preg4" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td>ACEPTA SOLO POSTULAR EN ESTA CONVOCATORIA, DE LO CONTRARIO SE ELIMINAR&Aacute; SU POSTULACI&Oacute;N DE FORMA AUTOM&Aacute;TICA:
                                                            </td>
                                                            <td> <select class="form-control" name="preg4" id="preg4" >
                                                          <option value="0"<% if preg4 = "" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg4 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg4 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg5="0" then%>
<input name="preg5" id="preg5" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td><p>TIENE HABILIDADES PARA EL MANEJO DE EQUIPOS  INTERDISCIPLINARIOS:</p></td>
                                                            <td> <select class="form-control" name="preg5" id="preg5" >
     <option value="0"<% if preg5 = "" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg5 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg5 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg6="0" then%>
<input name="preg6" id="preg6" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>
     TIENE HABILIDADES COMUNICATIVAS Y PARA LA RESOLUCI&Oacute;N DE PROBLEMAS:</td>
                                                            <td> <select class="form-control" name="preg6" id="preg6" >
      <option value="0"<% if preg6 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg6 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg6 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg7="0" then%>
<input name="preg7" id="preg7" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>TIENE CAPACIDAD PARA TRABAJAR BAJO PRESI&Oacute;N:</td>
                                                            <td> <select class="form-control" name="preg7" id="preg7" >
      <option value="0"<% if preg7 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg7 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg7 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg8="0" then%>
<input name="preg8" id="preg8" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>TIENE CAPACIDAD PARA COORDINAR CON AUTORIDADES DE DISTINTAS INSTITUCIONES P&Uacute;BLICAS Y PRIVADAS:</td>
                                                            <td><select class="form-control" name="preg8" id="preg8" >
     <option value="0"<% if preg8 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg8 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg8 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg9="0" then%>
<input name="preg9" id="preg9" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>TIENE BUEN NIVEL DE LECTURA COMPRENSIVA Y ADECUADA DICCI&Oacute;N:</td>
                                                            <td> <select class="form-control" name="preg9" id="preg9" >
      <option value="0"<% if preg9 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg9 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg9 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg10="0" then%>
<input name="preg10" id="preg10" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>ES DOCENTE CON AULA A CARGO EN IE ESTATALES:</td>
                                                            <td> <select class="form-control" name="preg10" id="preg10" >
     <option value="0"<% if preg10 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg10 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg10 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg11="0" then%>
<input name="preg11" id="preg11" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>DISPOSICI&Oacute;N EXCLUSIVA Y A TIEMPO COMPLETO, DURANTE TODAS LAS FASES DEL OPERATIVO:</td>
                                                            <td> <select class="form-control" name="preg11" id="preg11" >
      <option value="0"<% if preg11 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg11 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg11 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg12="0" then%>
<input name="preg12" id="preg12" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>ACEPTA LA OBLIGATORIEDAD DE ASISTIR A LAS SESIONES DE CAPACITACI&Oacute;N:</td>
                                                            <td> <select class="form-control" name="preg12" id="preg12" >

      <option value="0"<% if preg12 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg12 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg12 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
                                                        
<% 
end if
if valPreg13="0" then%>
<input name="preg13" id="preg13" type="hidden" value="">
<%
else
%>                                                        <tr>
                                                            <td>ES RESIDENTE EN LA SEDE QUE LE CORRESPONDA: </td>
                                                            <td> <select class="form-control" name="preg13" id="preg13" >
      <option value="0"<% if preg13 = "" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg13 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg13 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<%end if%>
                                                    </tbody>
                          </table>
<% end if




	if id_proy="103" then%>
    
    <table class="table table-bordered table-det-web">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="2">Otros Aspectos</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <% if valPreg1="0" then%>
<input name="preg1" id="preg1" type="hidden" value="">
<%
else
%>       
    <td width="92%">&iquest;TIENE IMPEDIMENTO PARA SER CONTRATADO CON EL ESTADO?</td>
                                                            <td width="8%"> <select class="form-control" name="preg1" id="preg1" > 
<option value="0" <% if preg1="0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg1="SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2" <% if preg1="NO" then response.Write("selected") end if%>>NO</option>                         
</select></td>
                                                        </tr>
<% 
end if
if valPreg2="0" then%>
<input name="preg2" id="preg2" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td>&iquest;TIENE DISPONIBILIDAD EXCLUSIVA Y A TIEMPO COMPLETO, PARA TRABAJAR DURANTE TODAS LAS BASES DEL OPERATIVO?</td>                                            
                                                            <td> <select class="form-control" name="preg2" id="preg2" >
                                                            <option value="0" <% if preg2 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg2 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2" <% if preg2 = "NO" then response.Write("selected") end if%>>NO</option>
</select></td>
                                                        </tr>

<% 
end if
if valPreg3="0" then%>
<input name="preg3" id="preg3" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td>&iquest;TIENE HABILIDADES PARA EL MANEJO DE EQUIPOS INTERDISCIPLINARIOS?</td>
                                                            <td> <select class="form-control" name="preg3" id="preg3" >
      <option value="0" <% if preg3 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg3 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg3 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if

if valPreg4="0" then%>
<input name="preg4" id="preg4" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td>&iquest;TIENE HABILIDADES COMUNICATIVAS PARA LA RESOLUCI&Oacute;N DE PROBLEMAS?</td>
                                                            <td> <select class="form-control" name="preg4" id="preg4" >
      <option value="0" <% if preg4 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg4 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg4 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if


if valPreg5="0" then%>
<input name="preg5" id="preg5" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td>&iquest;TIENE CAPACIDAD PARA COORDINAR CON AUTORIDADES DE DISTINTAS INSTITUCIONES P&Uacute;BLICAS Y PRIVADAS?</td>
                                                            <td> <select class="form-control" name="preg5" id="preg5" >
                                                          <option value="0"<% if preg5 = "" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg5 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg5 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if

if valPreg6="0" then%>
<input name="preg6" id="preg6" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td>&iquest;TIENE CAPACIDAD PARA TRABAJAR BAJO PRESI&Oacute;N Y CON TOLERANCIA Y FRUSTRACI&Oacute;N?</td>
                                                            <td> <select class="form-control" name="preg6" id="preg6" >
                                                          <option value="0"<% if preg6 = "" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg6 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg6 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg7="0" then%>
<input name="preg7" id="preg7" type="hidden" value="">
<%
else
%> 
                                                        <tr>
                                                            <td>&iquest;ACEPTA LA OBLIGATORIEDAD DE ASISTIR A SESIONES DE CAPACITACI&Oacute;N?</td>
                                                            <td> <select class="form-control" name="preg7" id="preg7" >
     <option value="0"<% if preg7 = "" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg7 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg7 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if

if valPreg8="0" then%>
<input name="preg8" id="preg8" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>
    &iquest;TIENE BUEN NIVEL DE LECTURA COMPRENSIVA Y ADECUADA DICCI&Oacute;N?</td>
                                                            <td> <select class="form-control" name="preg8" id="preg8" >
      <option value="0"<% if preg8 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg8 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg8 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if


if valPreg9="0" then%>
<input name="preg9" id="preg9" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>
    &iquest;USTED CUENTA CON MAS DE 10 HORAS CAPACITANDO?</td>
                                                            <td> <select class="form-control" name="preg9" id="preg9" >
      <option value="0"<% if preg9 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg9 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg9 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if


if valPreg10="0" then%>
<input name="preg10" id="preg10" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>
    &iquest;RESIDE EN LA SEDE A LA QUE POSTULA?</td>
                                                            <td> <select class="form-control" name="preg10" id="preg10" >
      <option value="0"<% if preg10 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg10 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg10 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
                                                        </tr>
<% 
end if
if valPreg11="0" then%>
<input name="preg11" id="preg11" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>&iquest;TIENE CONTRATO VIGENTE COMO DOCENTE EN EL SECTOR PUBLICO?</td>
                                                            <td> <select class="form-control" name="preg11" id="preg11" >
      <option value="0"<% if preg11 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg11 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg11 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
<%end if


if valPreg12="0" then%>
<input name="preg12" id="preg12" type="hidden" value="">
<%
else
%>
                                                        <tr>
                                                            <td>&iquest;TIENE DISPONIBILIDAD PARA VIAJAR?</td>
                                                            <td> <select class="form-control" name="preg12" id="preg12" >
      <option value="0"<% if preg12 = "0" then response.Write("selected") end if%>>Seleccione....</option>
<option value="1" <% if preg12 = "SI" then response.Write("selected") end if%>>S&Iacute;</option>
<option value="2"  <% if preg12 = "NO" then response.Write("selected") end if%>>NO</option></select></td>
<%end if
%>
                                                        </tr>
                                                        

                                                    </tbody>
                          </table>         
                          
<input name="preg12" id="preg12" type="hidden" value="">
<input name="preg13" id="preg13" type="hidden" value=""> 
                          
    
                                                <%end if
												end if %>

            <div class="panel panel-default delpmbottom">
                <div class="panel-heading">
                    <h3 class="panel-title">7. Declaraci&oacute;n de Veracidad de Datos</h3>
                </div>
                <div class="panel-body">
                    <div class="col-xs-12">
                        <div class="col-xs-12  espace-bottom">
                            <div class="row contrato" >

                                <div class="col-xs-10">
                                <table width="100%" border="0">
  <tr>
    <td style="width:90%">Declaro bajo juramento que los datos consignados en la presente ficha de inscripci&oacute;n, corresponden a la verdad; los mismos que podr&aacute;n ser verificados con los documentos sustentatorios de mi Curriculum Vitae, conforme presente a la instituci&oacute;n. <br/><b><%if id_proy="103" then %>NOTA: PARA COMPLETAR SU INSCRIPCI&Oacute;N DEBER&Aacute; PRESENTAR EN LA SEDE OPERATIVA A LA QUE POSTULA SU CV DOCUMENTADO EL CU&Aacute;L TENDR&Aacute; QUE CONTENER COPIA DEL DNI, COPIA DEL GRADO DE ESTUDIO, COPIA DE LA EXPERIENCIA LABORAL Y ESTA FICHA DE INSCRIPCI&Oacute;N.<%else %>NOTA: Los datos consignados se contrastar&aacute;n con sus documentos adjuntos<%end if %></b></td>
    <td style="width:10%"><div class="col-xs-2">
                                                            <select class="form-control txt-n9"  id="cmbVeracidad" name="cmbVeracidad" onChange="validaDJ(this.value)">
                                                                <option value="0">Selecciones..</option>
                                                                <option value="1">SI</option>
                                                                <option value="2">NO</option>
                                                            </select>
                                                        </div> </td>
  </tr>
</table>

                                </div>
                            </div>
                        </div>

                    </div>

 <% if Adjuntar_cv="1" then 
 
 else %>
 <div  class="col-xs-12 espace cnt-import" >
                            <div class="col-xs-1">
                                <span class="glyphicon glyphicon-exclamation-sign glyphicon-custom"></span>
                            </div>
                            <div class="col-xs-10 text-import">
                                <b>IMPORTANTE: LOS ARCHIVOS SE DEBEN DE ENCONTRAR EN FORMATO PDF, SE RECOMIENDA 
                                    QUE NO EXCEDAN LOS 2MB PARA EVITAR PROBLEMAS DE ENV&Iacute;O. SELECCIONAR SOLO UN 
                                    ARCHIVO POR CADA ITEM, SI ENV&Iacute;A MAS DE UNO SE GUARDAR&Aacute; SOLO EL &Uacute;LTIMO.[ <a href="pdf/MANUAL_CONVERSION.pdf" target="_blank" ><u>Ver Cartilla de Ayuda</u> </a>]
                                </b>
                            </div>
                  </div>
                        
                  <div class="col-xs-12 espace-top  ">

                   <iframe width="100%" height="380px" id="archivos" style="border:none;" src="cargar_archivos.asp"></iframe>
                   
                  </div>
             <%end if %>
                </div>
            </div>
        </div>

        <div  class="col-xs-12 bg-footer espace-top espace-bottom text-center" id="button1" >
           <a class="btn btn-primary" onClick="grabarFicha(<%=existe%>)">GRABAR</a>
        </div>
    </div>    
 

</div> 

<div id="dialog" title="ALERTA">
<p id="mensaje"> </p>
</div>

        <!-- /container -->
        <script src="js/jquery-1.11.0.min.js"></script>
        <link rel="stylesheet" href="css/jquery-ui.css" />
		<script src="js/jquery-1.9.1.js"></script>
        <script src="js/jquery-ui.js"></script>
    
       
      <script >
	  
	  
$(function () {
	$("#dialog").dialog({
		autoOpen: false,
		modal: true,
		buttons: {
			"Cerrar": function () {
				$(this).dialog("close");
			}
		}
	});
});


       </script> 
<style>

	input[type="file"]{
		z-index: 999;
		line-height: 0;
		font-size: 50px;
		position: absolute;
		opacity: 0;
		filter: alpha(opacity = 0);-ms-filter: "alpha(opacity=0)";
		margin: 0;
		padding:0;
		left:0;
	}
	
</style>    

    </body> 
</html>