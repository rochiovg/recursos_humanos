<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<%

id=request("id")
p=request("p")
dni=request("dni")
id_proy = p


SQLContCapac = "EXEC dbo.pa_CargoConvocatoria_ficha '"&id&"' ,'1' " 

	set wRsDptoapli = Micone.execute(SQLContCapac)
	
	response.write(SQLContCapac)
	
	'response.write(wRsDptoapli.fields("tipo"))
	'response.write(wRsDptoapli.fields("id_Presupuesto"))
	'response.write(wRsDptoapli.fields("id_ConvocatoriaCargo"))
	
'	&"*"&wRsDptoapli.fields("id_Presupuesto")&"*"&wRsDptoapli.fields("id_ConvocatoriaCargo")
	

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
valRnP = wRsDptoapli.fields("valRnP")' PIDE RNP 1: SI 0 : NO

valRnP  = 1 


	

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
''-------------------------------------------------------------



sub generaCargo()
			
	SQLContCapac = "EXEC dbo.uspget_CargoConvocatoria_uno '"&id&"' ,'1' " 

		set wRsDptoapli = Micone.execute(SQLContCapac)

		Response.ContentType="text/html; charset=iso-8859-1"
		response.write wRsDptoapli("desc_cargoFuncional")

		wRsDptoapli.Close
		Set wRsDptoapli = Nothing
	
End sub

sub generaSede()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_genera_sede_reg '"&id&"', '" &p& "', '" &lsDptoI& "', '" &lsProvI& "' , '" &lsDistI& "' ")
	
			Response.Write wRsDptoapli("nombre")

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 


sub generaDpto()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_CCDD_CONVO_uno '"&id&"' ")

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1""  name=""txtDpto1"" onChange=""generaprov();valida_quechua() "">"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaDpto2()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_dpto_cerresidencia   ")



	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto2"" name=""txtDpto2""   onChange=""generaprov2(), validadepa(); "" >"
	Response.Write " <option id=""valor_defecto"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing

	
End sub

sub generaFuncional()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getcargo1 ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtCargoInei"" name=""txtCargoInei"" >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	if wRsDptoapli(0) = lsCargoInei then 
			Response.Write "<option value=""" &lsCargoInei& wRsDptoapli(0) & """ selected >" &wRsDptoapli(1) & "</option>"
	else
		Response.Write "<option value=""" &lsCargoInei&wRsDptoapli(0)  & """>"&wRsDptoapli(1)& "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 



sub generaPAIS()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getpaisDec '"&lspais&"' ")
	

	Response.Write ""&wRsDptoapli(2) & ""

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
End sub 

sub generaZona()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getZONADec '"&lsTipoZona&"' ")
		Response.Write ""&wRsDptoapli(2) & ""


	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub 

sub generaVIA()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getviaDec '"&lsTipoVia&"' ")
	
	If Not wRsDptoapli.BOF And Not wRsDptoapli.EOF Then 
	Response.Write ""&wRsDptoapli(2)&""
	else
	response.write ("")
	end if 

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
			
	if lsprofesion="0" then
	response.Write("")
	else 
	
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getProfesionDec '"&lsprofesion&"' ")

		Response.Write ""&wRsDptoapli(2)& ""

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	end if
End sub

sub generaUniversidad()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getUniversidadDec '"&lsUniv&"' ")
	
	

 if lsNivInst = "4" then 
		Response.Write ""&wRsDptoapli(2) & ""
 else 
		Response.Write ""
 end if 

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaTipoPension()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_pension_listar_ac '"&id_tipoPension&"' ")
	If Not wRsDptoapli.BOF And Not wRsDptoapli.EOF Then
	
	response.Write ""&wRsDptoapli(0) & ""

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	else
	response.Write("")
	end if
End sub 

sub generaAFP()
	Response.ContentType="text/html; charset=iso-8859-1"
	if id_tipoPension="19990" then
	response.write ""
	else
	
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_AFP_listar_ac '"&id_afp&"' ")
	If Not wRsDptoapli.BOF And Not wRsDptoapli.EOF Then
	
	response.Write ""&wRsDptoapli(0) & ""

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	else 
	response.Write("")
	end if
	end if
End sub 

sub generaComision()
	Response.ContentType="text/html; charset=iso-8859-1"
	if id_tipoPension="19990" then
	response.write ""
	else
	
	set wRsDptoapli = Micone.execute(" exec dbo.pa_comision_AFP_listar_ac '"&id_comision&"' ")
	If Not wRsDptoapli.BOF And Not wRsDptoapli.EOF Then
	response.Write ""&wRsDptoapli(0) & ""
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	else 
	response.Write("")
	end if 
	end if
End sub 


'------------------------------------------------
		
lsSQL = "EXEC dbo.pa_ficha_datos_InscripcionActED '"& id&"','"& p&"','"& dni&"' "


Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.Open lsSQL, Micone
	
	
If Not Rs.BOF And Not Rs.EOF Then	

	existe="1"
	lsZona=Rs.Fields("zona_res")
	lsSeccion=Rs.Fields("seccion_res")
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
	response.Write(fechaInicioCap)
	
	anioI = Mid(fechaInicioCap,7)
	mesI = Mid(fechaInicioCap,4,2)
	diaI = Mid(fechaInicioCap,1,2)
	
	fechafincap=Rs.Fields("fechafincap")
	anioF = Mid(fechafincap,7)
	mesF = Mid(fechafincap,4,2)
	diaF = Mid(fechafincap,1,2)
	
	
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
	
	
	expad_meses_1=Rs.fields("expad_meses_1_des")
	expad_meses_2=Rs.fields("expad_meses_2_des")
	expad_anio_1=Rs.fields("expad_anio_1")
	expad_anio_2=Rs.fields("expad_anio_2")
	
	
		flag_rnp=Rs.fields("flag_rnp")
	fechainirnp=Rs.fields("fechainirnp")
	fechafinrnp=Rs.fields("fechafinrnp")
	
	
	
	end if
	
	Rs.Close
	Set Rs = Nothing
		
											
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
    
    <form id="frmMiForm">
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
                            <div class="col-xs-1 smalling "><span class="text-danger">(***)</span></div><div class="col-xs-11">El N&uacute;mero de RUC es obligatorio presentar en el momento de la contrataci&oacute;n.</div>                              
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
                                    
                          
                        </h3>
                    </div>
                    <div class="panel-body">
                    
                    <%IF  valUbigeo="4" THEN %>
                    
                    	    <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label>Sede Operativa</label>
                               <br> <%generaSede()%>
                            </div>
                        </div>
                        
                        <input name="txtDpto1" id="txtDpto1" type="hidden" value="">
                        <input name="txtProv1" id="txtProv1" type="hidden" value="">
                        <input name="txtDist1" id="txtDist1" type="hidden" value="">
                        <input name="txtDist3" id="txtDist3" type="hidden" value="">
                                        
                    <%ELSE%>

                        <div class="col-xs-2">
                            <div class="form-group delpmbottom">
                                <label>Departamento </label>
                               <br><%=lsNomDptoI%>
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label>Provincia </label>
                                <DIV  id="prov" >
                                <%=lsNomProvI%></DIV>
                            </div>
                        </div>
                       <div class="col-xs-3">
                            <div class="form-group delpmbottom">
                                <label> Distrito </label>
                                <div id="dist"><%=lsNomDistI%> 
                                </div>
                            </div>
                        </div>

                       <div class="col-xs-2">
                            <div class="form-group delpmbottom">
                                <label> Zona </label>
                                <div id="zona"><%=lsZona%> 
                                </div>
                            </div>
                        </div>

                       <div class="col-xs-2">
                            <div class="form-group delpmbottom">
                                <label> Seccion </label>
                                <div id="seccion"><%=lsSeccion%> 
                                </div>
                            </div>
                        </div>
                        
                        <% END IF%>  
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">2. Datos Personales&nbsp; &nbsp; <span class="call">(Verifique sus datos tal como figuran en su DNI)</span></h3>
                    </div>
                    <div class="panel-body">
                        <div class="col-xs-3">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple">
                                    <div class="form-group">
                                        <label >Apellido Paterno (DNI) </label><br>
                                        <%=lsApePaterno%>
                                    </div>
                                    <div class="form-group">
                                        <label >Apellido Materno (DNI) </label><br>
                                        <%=lsApeMaterno%>
                                    </div>
                                    <div class="form-group">
                                        <label >Nombres (DNI)</label>
                                        <br><%=lsNombre%>
                                        <input name="txtNombre2" id="txtNombre2" type="hidden" value="">
                                    </div>
                                      <div class="form-group">
                                        <label for="DNI">DNI</label>
                                        <br><%=dni%>
                                    </div>
                                    <div style="display:none" class="form-group">
                                        <label>Confirme DNI <span class="text-danger">&nbsp;(*)</span></label>
                                        <input type="text" class="form-control" 
                                               placeholder="Confirme DNI">
                                    </div>
                                   <div class="form-group">
                                        <label >Sexo
                                        </label><br>
                                        <%If lsSexo="F" then
						 response.Write("FEMENINO") 
						 ELSEIF lsSexo="M" THEN 
						 response.Write("MASCULINO")
						 ELSE 
						 response.Write("")
						 END IF
						 %>

                                  </div>
                                </div>
                            </div>
                        </div> 
                        <div class="col-xs-3">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple">
                                    <div class="form-group">
                                        <label >Pais de Nacimiento </label><br>
                                        <%generaPAIS()%>
                                    </div>
                                    <div class="form-group">
                                        <label >Departamento nacimiento</label>
                                        <br><%=lsNDptoN %>
                                    </div>
                                    <div class="form-group">
                                        <label >Provincia de Nacimiento</label>
                                        <br><div id="prov3">
                                        <%=lsNProvN%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label >Distrito de Nacimiento </label>
                                        <br><div id="dist4">
                                        <%=lsNDistN%>
                                        </div>
                                    </div>
                                                                        <div class="form-group delpmbottom ">
                                        <div><label>Fecha Nacimiento </label><br/><%=lsDia%>/<%=lsMes%>/<%=lsAnio%></div>
                                    </div>
                                  
                                </div>
                            </div>
                        </div> 
                      <div class="col-xs-3">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple">
								<% if valRuc="0" then 
								else
								%>
                                    <div class="form-group">
                                    
                                    
                                        <label for="RUC">RUC </label><br><%=lsRUC%>
                                    </div>
                                    <div class="form-group">
                                        <label>Confirme Ruc </label><br><%=lsRUC%>
                                    </div>
                                   <% end if%> 
                                   
                                     <% if valRnP="0" then %>
  
                  <%else
								%>
                  <div class="form-group">
                    <label for="RNP">Tiene RNP : </label>
                     <% if flag_rnp="1" then response.write( "Si" ) else response.write( "No" ) end if %>
                  </div>
                  <div class="form-group">
                    <label for="FINIRNP">Fec. Inicio : </label>
                    <%if fechainirnp="01/01/1900" then
							  response.write""
							  else
							  response.Write(fechainirnp)
							  end if
							  
							  %>
                  </div>
                  <div class="form-group">
                    <label for="FFINRNP">Fec. Fin : </label>
                  <%if fechafinrnp="01/01/1900" then
							  response.write""
							  else
							  response.Write(fechafinrnp)
							  end if
							  
							  %>
                  </div>
                  <% end if%>
                  
                  
                                   <% IF id_proy <>139 then %>
                                    <div class="form-group">
                                        <label >Estado Civil (DNI)</label><br>
                                        <%
if lsECivil = "1" Then response.Write("Soltero(a)") End If
if lsECivil = "2" Then response.Write("Casado(a)") End If
if lsECivil = "3" Then response.Write("Viudo(a)") End If
if lsECivil = "4" Then response.Write("Divorciado(a)") End If
if lsECivil = "5" Then response.Write("Conviviente") End If%>
                                        
                                    </div>
                                    <div class="form-group ">
                                        <label >Es Usted hijo &uacute;nico </label>
                                        <%=hijoUnico%>
                                    </div>
                                    <div class="form-group">
                                        <label >Es jefe y/o responsable de su hogar</label>
                                        <%=jefeCasa%>
                                    </div>
                              <%end if%>  </div>
                            </div>
                        </div> 
                        
                          <% IF ID_PROY <> 139 THEN%>
            
            
                    
                        
                        <div class="col-xs-3">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple">

                                    <div class="form-group">
                                        <label >Lengua materna que aprendi&oacute; en su ni&ntilde;ez</label><br>
                                        <%=lenguaMaterna%>
                                    </div>
                                    <div class="form-group">
                                        <label >Lengua originaria que actualmente domina</label><br>
                                        <%=lengua%>
                                    </div>
                                    <div class="form-group">
                                        <label >Otros Idiomas que domina </label><br>
                                          <%=idiomaExtr%>
                                       
                                    </div>
                                    <div class="form-group ">
                                        <label >Nivel </label><br>
                                        <% if nivelIdiomaExt = "E" Then response.Write("B&aacute;sico") End If
if nivelIdiomaExt = "L" Then response.Write("Regular") End If
if nivelIdiomaExt = "A" Then response.Write("Avanzado") End If
%>
                                    </div>

                                    <div class="form-group delpmbottom">
                                        <label >Dominio</label><br>
                                        <% if dominioIdiomaExt = "1" Then response.Write("Solo lee") End If
if dominioIdiomaExt = "2" Then response.Write("Solo escribe") End If
if dominioIdiomaExt = "3" Then response.Write("Lee y escribe") END IF
if dominioIdiomaExt = "4" Then response.Write("Traduce") End If%>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        
                        
                        <%END IF%>
                        
                        
                        
                        <div class="col-xs-12">
                            <div class="panel panel-default-border delpmbottom">
                                <div class="panel-body simple2">
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <dl class="dl-horizontal">
                                                <dt><label>Tel&eacute;fono </label></dt>                   
                                                <dd><h6 class="margintop">(Use gui&oacute;n para los anexos Ej.5555555-5555) </span></h6> </dd>
                                            </dl>
                                            <%=lsTelefono%>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >Celular Personal </label><br>
                                            <%=lsCelular%>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >Oper. Celular </label><br>
                                            <%=lsOperCel%>
                                        </div>
                                    </div>
                                    <div class="col-xs-3 ">
                                        <div class="form-group delpmbottom">
                                            <label > Correo Electr&oacute;nico</label><br><%=lsEmail%>
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
                    <div class="col-xs-12">
                      <div class="panel panel-default-border delpmbottom">
                        <div class="panel-body simple2">
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
                                   <%=num_CUSSP%>
                                  </div>
                                </div>
                                <div class="col-xs-2">
                                  <div class="form-group delpmbottom">
                                    <label  class="alinear">Fecha de Afiliaci&oacute;n</label>
                                    <%if fec_AfiliaAFP="01/01/1900" then
							  response.write""
							  else
							  response.Write(fec_AfiliaAFP)
							  end if
							  
							  %>
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
                    </div>
                </div>
                </div>
                
                <% end if %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><%=num4%>. Datos de Residencia</h3>
                    </div>
                    <div class="panel-body">

                        <div class="col-xs-12">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple2">
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label>Tipo de V&iacute;a</label><br>
                                            
                                            <%generaVIA()%>
                                           
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >Nombre de V&iacute;a (Direcci&oacute;n)</label><br>
                                           <%=trim(lsNomVia)%>
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom ">
                                            <label > N&deg;</label>
                                            <br><%=lsNumPuerta%>
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label >KM</label><br>
                                            <%=lsNumKilometro%>
                                        </div>
                                    </div>

                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label >MZ</label><br>
                                            <%=lsNumManzana%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default-border ">
                                <div class="panel-body simple2">
                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label >Interior</label><br>
                                           <%=lsNumInterior%>
                                        </div>
                                    </div>
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >NRO. DEPARTAMENTO</label><br><%=lsdepa%>
                                            
                                        </div>
                                    </div>
                                    <div class="col-xs-1">
                                        <div class="form-group delpmbottom">
                                            <label >Lote</label><br>
                                            <%=lsNumLote%>
                                        </div>
                                    </div>
                                    <div class="col-xs-1">
                                        <div class="form-group delpmbottom">
                                            <label >Piso</label><br>
                                            <%=lsNumPiso%>
                                        </div>
                                    </div> 
                                    <div class="col-xs-3">
                                        <div class="form-group delpmbottom">
                                            <label >Tipo de Zona</label><br>
<%generaZona()%>
                                        </div>
                                    </div> 
                                    <div class="col-xs-2">
                                        <div class="form-group delpmbottom">
                                            <label >Nombre Zona</label><br>
                                          <%=trim(lsNomZona)%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default-border delpmbottom">
                                <div class="panel-body simple2">
                                    <div class="col-xs-4">
                                        <div class="form-group delpmbottom">
                                            <label >Departamento Residencia</label><br>
                                            <%=lsNomDptoR%>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group delpmbottom">
                                            <label > Provincia Residencia</label><br>
                                            <div id="prov2">
                                            <%=lsNomProvR%></div>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="form-group delpmbottom">
                                            <label >Distrito Residencia</label>
                                            <div id="dist2">
                                            <%=lsNomDistR%></div>
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
                            <div class="col-xs-12">
                              <div class="panel panel-default-border">
                                <div class="panel-body simple2">
                                  <div class="col-xs-3">
                                    <div class="form-group delpmbottom">
                                      <label for="Nivel_Instruccion">Nivel de Instrucci&oacute;n</label>
                                      <br>
                                      <% 	if lsNivInst=3 then
		lsNivelInsM="Secundaria"
	elseif 	lsNivInst=4 then		
		lsNivelInsM="Superior"		
	elseif 	lsNivInst=5 then		
		lsNivelInsM="Superior no Universitario"			
	end if				
%>
                                      <%=lsNivelInsM%> </div>
                                  </div>
                                  <div class="col-xs-3">
                                    <div class="form-group delpmbottom">
                                      <input type="hidden" name="cmbTipoEstudios" id="cmbTipoEstudios" value="0">
                                      <label >Grado Alcanzado</label>
                                      <div  id="idGrado">
                                        <%=ls_descGrado%>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col-xs-3 text-center">
                                    <div class="form-group delpmbottom ">
                                      <div>
                                        <label> Fecha de Expedici&oacute;n Grado</label><br><%if lsAnio2="1900" and lsMes2="01" and lsDia2="01" then
						 response.write("")
						 else%>
						  <%=lsDia2%>/<%=lsMes2%>/<%=lsAnio2%>
                          <%end if%>
                                        
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col-xs-3">
                                    <div class="form-group delpmbottom">
                                      <label>Registro de expdici&oacute;n de grado</label><br>
                                      <%=Num_reg_grado%>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="panel panel-default-border ">
                                <div class="panel-body simple2">
                                  <div class="col-xs-2">
                                    <div class="form-group delpmbottom">
                                      <label >Per&iacute;odo alcanzado en n&uacute;meros</label><br>
                                     <%=lsperioAlc%>
                                    </div>
                                  </div>
                                  <div class="col-xs-3">
                                    <div class="form-group delpmbottom">
                                      <label  class="alinear">Tipo de Per&iacute;odo</label><br>
                                     <% if lsTiPerAlc  = "0" then response.Write("") end if
if lsTiPerAlc  = "1" then response.Write("CICLO") end if
if lsTiPerAlc  = "2" then response.Write("MES") end if
if lsTiPerAlc  = "3" then response.Write("A&Ntilde;O") end if
if lsTiPerAlc  = "4" then response.Write("TRIMESTRE") end if
if lsTiPerAlc  = "5" then response.Write("SEMESTRE") end if
if lsTiPerAlc  = "6" then response.Write("CUATRIMESTRE") end if
if lsTiPerAlc  = "7" then response.Write("MODULO") end if
if lsTiPerAlc  = "8" then response.Write("NIVEL") end if%>
                                    </div>
                                  </div>
                                  <div class="col-xs-3">
                                    <div class="form-group delpmbottom">
                                      <label class="alinear">Ocupaci&oacute;n y/o Profesi&oacute;n</label>
                                      <%generaprofesion()%>
                                    </div>
                                  </div>
                                  <div class="col-xs-4 delpmbottom">
                                    <div class="form-group delpmbottom">
                                      <label class="alinear">En caso de ser educador, especifique su especialidad</label><br>
                                      <%=especialidad_ednom%>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="panel panel-default-border ">
                                <div class="panel-body simple2">
                                  <div class="col-xs-4 delpmbottom">
                                    <div class="form-group delpmbottom">
                                      <label>Universidad</label><br>
                                      <%generaUniversidad()%>
                                    </div>
                                  </div>
                                  <div class="col-xs-5">
                                    <div class="form-group delpmbottom">
                                      <label for="Centro_estudios">Centro de estudios</label><br><%=lsLugEst%>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="espace-bottom">
                              
                              
                              <%IF  id_proy=139 then %> 
                                 
                                   <table width="100%" class="table table-bordered table-det-web">
                                  <thead>
                                    <tr>
                                      
                                      
                                      <th width="496" style="width:480px;">Experiencia General</th>
                      <th width="71"  style="width:10px;" >A&ntilde;o(s)</th>
                      <th width="79"  style="width:10px;">Mes(es)</th>
                      <th width="382"> Nombre de la Instituci&oacute;n</th>
                      <th width="185" style="width:115px;"> Cargo</th>
                      
                      
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td><% if experiencia_1="" or isnull(experiencia_1) then %>
                                        A&ntilde;os o meses  de experiencia en trabajos de Campo (Censo y/o Encuestas)
                                        <%else%>
                                        <span class="etiqueta"> <%=experiencia_1%> </span>
                                        <%end if%></td>
                                      <% if p<>99 then %>
                                      <td ><span class="space-nowrap"><%=lsExpCampoanio%></span></td>
                                      <td><span class="space-nowrap"><%=lsExpCampomeses%></span></td>
                                      <%end if%>
                                      <td class="space-nowrap"><label>&nbsp;<%=ExpCampoInst%></label></td>
                                      <td class="space-nowrap"><label>
                                        <% 
									        response.Write(CargoAplicacion)
										
											%>
                                      </label></td>
                                    </tr>
                                    <tr>
                                      <td><% if experiencia_2="" or isnull(experiencia_2) then %>
                                        A&ntilde;os o meses  de experiencia en manejo de grupos:
                                        <%else%>
                                        <%=experiencia_2%>
                                        <%end if%></td>
           <% if  p<>99 then %>                           <td><span class="space-nowrap"><%=lsExpGrupoanio%></span></td>
                                      <td  class="space-nowrap"><%=lsExpGrupomeses%></td>
         <%end if%>                             <td class="space-nowrap"><label><%=ExpGrupoInst%></label></td>
                                      <td class="space-nowrap"><label class="text-lighter"></label><label>
                                        <%
									        response.Write(CargoProcesos)
									
											%>
                                      </label></td>
                                    </tr>
                                    <tr>
                                      <td><% if experiencia_3="" or isnull(experiencia_3) then %>
                                        <span class="etiqueta" >A&ntilde;os o meses de experiencia en actividades en general:</span>
                                        <%else%>
                                        <span class="etiqueta" ><%=experiencia_3%></span>
                                        <%end if%>
              <% if  p<>99 then %>                        <td><span class="space-nowrap"><span class="text-lighter"><%=lsExpGen_anio%></span></span></td>
                                      <td  class="space-nowrap"><span class="text-lighter"><%=lsExpGen_meses%></span></td>
    <% end if%>                                  <td class="space-nowrap"><label><%=ExpGenInst%></label></td>
                                      <td class="space-nowrap"><label>
                                        <% 
									        response.Write(CargoFormacion)
										
											%>
                                      </label></td>
                                    </tr>
                                  </tbody>
                                </table>
                                
                                
                                <!-----------------------EDNOMB 2016--------------------->
                                 
                                 <%else%>
                                 
                                <table width="100%" class="table table-bordered table-det-web">
                                  <thead>
                                    <tr>
                                      <th width="496" style="width:480px;">Experiencia Total</th>
      <% if  p<>99 then %>                                <th width="382">Nombre Instituci&oacute;n (Registre solo el &uacute;ltimo)</th>
                                      <th width="185" style="width:115px;">Fecha &Uacute;ltimo d&iacute;a de labores</th>
         <%end if%>                             <th width="71" style="width:10px;"> A&ntilde;os <br/>
                                        Ejm. 3 a&ntilde;o(s)</th>
                                      <th width="79" style="width:10px;"> Meses <br/>
                                        Ejm. 3 a&ntilde;o(s) </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td><% if experiencia_1="" or isnull(experiencia_1) then %>
                                        A&ntilde;os o meses  de experiencia en trabajos de Campo (Censo y/o Encuestas)
                                        <%else%>
                                        <span class="etiqueta"> <%=experiencia_1%> </span>
                                        <%end if%></td>
                                      <% if p<>99 then %>
                                      <td ><%=ExpCampoInst%></td>
                                       <td><% if ExpCampoFef="01/01/1900" then 
									  		response.Write("")
										else 
									        response.Write(ExpCampoFef)
										end if
											%></td>
                                      <%end if%>
                                      <td class="space-nowrap"><label class="text-lighter">
                                        <%=lsExpCampoanio%></label>
                                      <label>&nbsp;a&ntilde;o(s)</label></td>
                                      <td class="space-nowrap"><label class="text-lighter">
                                        <%=lsExpCampomeses%></label>
                                      <label>&nbsp;&nbsp;mes(es)</label></td>
                                    </tr>
                                    <tr>
                                      <td><% if experiencia_2="" or isnull(experiencia_2) then %>
                                        A&ntilde;os o meses  de experiencia en manejo de grupos:
                                        <%else%>
                                        <%=experiencia_2%>
                                        <%end if%></td>
           <% if  p<>99 then %>                           <td><%=ExpGrupoInst%></td>
                                      <td  class="space-nowrap"><% if ExpGrupoFec="01/01/1900" then 
									  		response.Write("")
										else 
									        response.Write(ExpGrupoFec)
										end if
											%></td>
         <%end if%>                             <td class="space-nowrap"><label class="text-lighter"><%=lsExpGrupoanio%></label><label>&nbsp;&nbsp;a&ntilde;o(s)</label></td>
                                      <td class="space-nowrap"><label class="text-lighter"></label><%=lsExpGrupomeses%><label>&nbsp;&nbsp;mes(es)</label></td>
                                    </tr>
                                    <tr>
                                      <td><% if experiencia_3="" or isnull(experiencia_3) then %>
                                        <span class="etiqueta" >A&ntilde;os o meses de experiencia en actividades en general:</span>
                                        <%else%>
                                        <span class="etiqueta" ><%=experiencia_3%></span>
                                        <%end if%>
              <% if  p<>99 then %>                        <td><%=ExpGenInst%></td>
                                      <td  class="space-nowrap"><% if ExpGenFec="01/01/1900" then 
									  		response.Write("")
										else 
									        response.Write(ExpGenFec)
										end if
											%></td>
    <% end if%>                                  <td class="space-nowrap"><span class="text-lighter"><%=lsExpGen_anio%></span>                                        <label>&nbsp;&nbsp;a&ntilde;o(s)</label></td>
                                      <td class="space-nowrap"><span class="text-lighter"><%=lsExpGen_meses%></span>                                        <label>&nbsp;&nbsp;mes(es)</label></td>
                                    </tr>
                                  </tbody>
                                </table>
                                
                                <%end if%>
                              </div>
                              <div class="espace-bottom">
                                <table class="table table-bordered table-det-web">
                                  <thead>
                                    <% if validarExp1="0" and validarExp2="0" and validarExp3="0" then %>
                                    <%else%>
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
                                  <tr>
                                     <th width="20%" style="width:60%;"><% if id_proy = 139 then%>Experiencia espec&iacute;fica en el INEI<%else%>Experiencia Adicional <%end if%></th>
                                    <% if id_proy = 139 then%><th width="26%" style="width:10%;">A&ntilde;o/Mes</th><%else%><th width="26%" style="width:10%;">Descripci&oacute;n</th><%end if%>
                                    <% if id_proy <> 139 then%><th width="10%" style="width:10%;">Nombre de la Instituci&oacute;n</th><%end if%>
                                    <% if id_proy <> 139 then%> <th width="10%" style="width:10%;"> Cargo </th><%end if%>
                                       <% if id_proy = 139 then%><th width="10%" style="width:10%;">Cargo </th> <%else%><th width="10%" style="width:10%;"> Tiempo de Duraci&oacute;n </th><%end if%>
                                  </tr>
                                  <%end if %>
                                  <tbody>
                                  <% if id_proy <> 139 then%>
                                  
                                    <% if validarExp1="0" then %>
                                  <input name="txtExpAplicacion" id="txtExpAplicacion" type="hidden" value="">
                                  <input name="txtNombreAplicacion" id="txtNombreAplicacion" type="hidden" value="">
                                  <input name="txtCargoAplicacion" id="txtCargoAplicacion" type="hidden" value="">
                                  <input name="txtTiempoAplicacion" id="txtTiempoAplicacion" type="hidden" value="">
                                  <input name="txtTiempoApli" id="txtTiempoApli" type="hidden" value="">
                                  <%else%>
                                  <tr>
                                    <td>Nombre de la &uacute;ltima Experiencia en operativo de Aplicaci&oacute;n de Instrumentos en campo.</td>
                                    <td ><%=ExpAplicacion%></td>
                                    <td><%=NombreAplicacion%></td>
                                    <td  class="text-lighter"><%=CargoAplicacion%></td>
                                    <td class="space-nowrap"><label  class="text-lighter">
                                     <%=TiempoAplicacion%>
                                    </label>
                                      <label>
                                       <% if TiempoApli=1 then
								  response.write "horas"
								  elseif TiempoApli=2 then
								  response.Write("dias")
								  elseif TiempoApli=3 then
				  response.Write("meses")
				    elseif TiempoFor=4 then
				  response.Write("a&ntilde;os")			  
				  else
				  response.Write("")
				  end if %>
                                      </label></td>
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
                                    <td><%=ExpProcesos%></td>
                                    <td  class="space-nowrap"><%=NombreProcesos%></td>
                                    <td  class="text-lighter"><%=CargoProcesos%></td>
                                    <td class="space-nowrap"><label  class="text-lighter">
                                     <%=TiempoProcesos%>
                                    </label>
                                      <label  class="">
                                       <% if CargoProc=1 then
								  response.write "horas"
								  elseif CargoProc=2 then
								  response.Write("dias")
								  elseif CargoProc=3 then
				  response.Write("meses")
				    elseif CargoProc=4 then
				  response.Write("a&ntilde;os")			  
				  else
				  response.Write("")
				  end if %>
                                      </label></td>
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
                                    <td><%=ExpFormacion%></td>
                                    <td  class="space-nowrap"><%=NombreFormacion%></td>
                                    <td ><%=CargoFormacion%></td>
                                    <td class="space-nowrap"><label  class="text-lighter">
                                      <%=TiempoFormacion%>
                                    </label>
                                      <label>
                                         <% if TiempoFor=1 then
								  response.write "horas"
								  elseif TiempoFor=2 then
								  response.Write("dias")
								  elseif TiempoFor=3 then
				  response.Write("meses")
				    elseif TiempoFor=4 then
				  response.Write("a&ntilde;os")			  
				  else
				  response.Write("")
				  end if %>
                                      </label></td>
                                  </tr>
                                  
                                  <%end if%>
                                  <%else%>
                                   <!------------SOLO 139 EDNOMB 2016----------> 
                                
                                 <% if validarExp1="0" then %>
                                  <input name="txtExpAplicacion" id="txtExpAplicacion" type="hidden" value="">
                                  <input name="txtNombreAplicacion" id="txtNombreAplicacion" type="hidden" value="">
                                  <input name="txtCargoAplicacion" id="txtCargoAplicacion" type="hidden" value="">
                                  <input name="txtTiempoAplicacion" id="txtTiempoAplicacion" type="hidden" value="">
                                  <input name="txtTiempoApli" id="txtTiempoApli" type="hidden" value="">
                                  <%else%>
                                  <tr>
                                    <td>Ultima Experiencia EDNOM.</td>
                                    <td ><label  class="text-lighter">
                                     <%=TiempoAplicacion%>/
                                    </label>
                                      <%=expad_meses_1%></td>
                                  
                                    <td class="space-nowrap">
                                    <%=ExpAplicacion%>
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
                                    <td>&Uacute;ltima experiencia en Evaluaci&oacute;n Censal de Estudiantes.</td>
                                    <td><label  class="text-lighter">
                                     <%=TiempoProcesos%>/
                                    </label>
                                    <%=expad_meses_2%></td>
                                    
                                    <td class="space-nowrap"><%=ExpProcesos%>
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
                                    <td><%=ExpFormacion%></td>
                                    <td class="space-nowrap"><label  class="text-lighter">
                                      <%=TiempoFormacion%>
                                    </label>
                                      </td>
                                  </tr>
                                  <%end if%>
                                  <%end if%>
                                </table>
                              </div>
                              <div class="espace-bottom">
                              
                               <%if id_proy <> 139 THEN%>
                                <table class="table table-bordered table-det-web">
                                  <thead>
                                    <tr>
                                      <th colspan="4"> Proyectos en el INEI</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>&iquest;Ha participado en el INEI?</td>
                                      <td ><%if lsIneiProc ="1" then response.Write("Si") END IF
 if lsIneiProc ="2" then response.Write("No") END IF%></td>
                                      <td  class="space-nowrap">&Uacute;ltimo proyecto que particip&oacute; en INEI</td>
                                      <td><%=lsProyecto%></td>
                                    </tr>
                                    <tr>
                                      <td>&Uacute;ltimo a&ntilde;o que particip&oacute; en INEI</td>
                                      <td ><%=lsIneiAnio%></td>
                                      <td  class="space-nowrap">&Uacute;ltimo cargo que particip&oacute; en INEI</td>
                                      <td><%=cargoINEI%></td>
                                    </tr>
                                  </tbody>
                                </table>
                                <%end if%>
                              </div>
                              
                              
                              <%if id_proy = 139 then %>
                              
                               <table class="table table-bordered table-det-web delpmbottom">
                                <thead>
                                  <% if validarCargo1="0" and validarCargo2="0" then 
								
								else%>
                                  <tr>
                                    <th> &Uacute;LTIMOS DOS CARGOS DESEMPE&Ntilde;ADOS</th>
                                    <th style="width:500px">Cargos</th>
                                    <th>A&ntilde;os/Meses</th>
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
                                  <td><table class="table">
                                    <tr>
                                      <td style="width:190px">Cargo Desempe&ntilde;ado (1) : &nbsp;</td>
                                      <td><%=EmpCargo1%></td>
                                    </tr>
                                  </table>
                                  <td ><%=Cargo1%></td>
                                  <td  class="space-nowrap text-center"><label class="text-lighter">
                                  
                                   <%if id_proy =  139 then %><%=expad_anio_1%> A&ntilde;os/<%end if%>
                                   
                                   
                                   <%=tiempoCargo1%>
                                  </label>
                                    <label>&nbsp;&nbsp;Meses</label></td>
                                </tr>
                                <% end if

if validarCargo2="0" then

%>
                                <input name="txtCargo2" id="txtCargo2" type="hidden" value="">
                                <input name="txtEmpCargo2" id="txtEmpCargo2" type="hidden" value="">
                                <input name="txttiempoCargo2" id="txttiempoCargo2" type="hidden" value="">
                                <%else %>
                                <tr>
                                  <td><table class="table">
                                    <tr>
                                      <td style="width:270px">Cargo Desempe&ntilde;ado (2) : &nbsp;</td>
                                      <td style="width:690px"><%=EmpCargo2%></td>
                                    </tr>
                                  </table></td>
                                  <td><%=Cargo2%></td>
                                  <td  class="space-nowrap text-center"><label class="text-lighter">
								   <%if id_proy =  139 then %><%=expad_anio_2%> A&ntilde;os/<%end if%>
								  <%=tiempoCargo2%>
                                  </label>
                                    <label>&nbsp;&nbsp;Meses</label></td>
                                </tr>
                                <% end if%>
                              </table>
                              
                              
                              <%else%>
                              <table class="table table-bordered table-det-web delpmbottom">
                                <thead>
                                  <% if validarCargo1="0" and validarCargo2="0" then 
								
								else%>
                                  <tr>
                                    <th> &Uacute;LTIMOS DOS CARGOS DESEMPE&Ntilde;ADOS</th>
                                    <th style="width:500px">Nombre de la Empresa</th>
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
                                  <td><table class="table">
                                    <tr>
                                      <td style="width:190px">Cargo Desempe&ntilde;ado (1) : &nbsp;</td>
                                      <td><%=Cargo1%></td>
                                    </tr>
                                  </table>
                                  <td ><%=EmpCargo1%></td>
                                  <td  class="space-nowrap text-center"><label class="text-lighter">
                                  
                                   <%if id_proy =  139 then %><%=expad_anio_1%> A&ntilde;os/<%end if%>
                                   
                                   
                                   <%=tiempoCargo1%>
                                  </label>
                                    <label>&nbsp;&nbsp;Meses</label></td>
                                </tr>
                                <% end if

if validarCargo2="0" then

%>
                                <input name="txtCargo2" id="txtCargo2" type="hidden" value="">
                                <input name="txtEmpCargo2" id="txtEmpCargo2" type="hidden" value="">
                                <input name="txttiempoCargo2" id="txttiempoCargo2" type="hidden" value="">
                                <%else %>
                                <tr>
                                  <td><table class="table">
                                    <tr>
                                      <td style="width:270px">Cargo Desempe&ntilde;ado (2) : &nbsp;</td>
                                      <td style="width:690px"><%=Cargo2%></td>
                                    </tr>
                                  </table></td>
                                  <td><%=EmpCargo2%></td>
                                  <td  class="space-nowrap text-center"><label class="text-lighter">
								   <%if id_proy =  139 then %><%=expad_anio_2%> A&ntilde;os/<%end if%>
								  <%=tiempoCargo2%>
                                  </label>
                                    <label>&nbsp;&nbsp;Meses</label></td>
                                </tr>
                                <% end if%>
                              </table>
                              
                              
                              <%end if%>
                              
                              
                              
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><%=num6%>. Capacitaci&oacute;n y datos complementarios</h3>
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
                                                            <% if p<>103 then%>
                                                            <th>Tiempo</th > <% end if%>

                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><%=CursoCapacitacion%></td>
                                                                    <td>
                                                                        <%=lugar_capacitacion%>
                                                                    </td>
                                                                    <td  class="space-nowrap text-center">
                                                                        <div class="form-group delpmbottom ">
                 <%=diaI%>/                                                                            <%=mesI%> /
                                                                            <%=anioI%>
                                                                        </div>
                                                                    </td>
                                                                    <td  class="space-nowrap text-center">
                                                                        <div class="form-group delpmbottom ">
    
                                                                            <%=diaF%> /
                                                                           <%=mesF%> /
                                                                            <%=anioF%>
                                                                        </div>
                                                                    </td>
                                                                    <%if p<>103 then %>
   <td class="space-nowrap text-center" >
                                                                        <label class="text-lighter"><%=HorasLectivas%>&nbsp;</label>
                                                                        <label><% if TiempoHL=1 then
								  response.write "horas"
								  elseif TiempoHL=2 then
								  response.Write("dias")
								  elseif TiempoHL=3 then
				  response.Write("meses")
				    elseif TiempoHL=4 then
				  response.Write("a&ntilde;os")			  
				 else
				  response.Write("")
				 end if %>
                                                                        </label>
                                                                    </td ><% end if%>
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
                                                            <% if p<>103 then%>
                                                            <th>Tiempo</th > <% end if%>

                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td><%=CursoOf%></td>
                                                                    <td>
                                                                        <%=lugar_capacitacionOf%>
                                                                    </td>
                                                                    <td  class="space-nowrap text-center">
                                                                        <div class="form-group delpmbottom ">
    
                                                                            <%=OfIniDia%> /
                                                                            <%=OfIniMes%> /
                                                                            <%=OfIniAni%>
                                                                        </div>
                                                                    </td>
                                                                    <td  class="space-nowrap text-center">
                                                                        <div class="form-group delpmbottom ">
    
                                                                            <%=OfFinDia%> /
                                                                            <%=OfFinMes%> /
                                                                            <%=OfFinAni%>
                                                                        </div>
                                                                    </td>
                                                                   <%if p<>103 then %>
                                                                    <td class="space-nowrap text-center">
                                                                        <%=HorasLectivasOf%>
                                                                        <label><% if TiempoOf=1 then
								  response.write "horas"
								  elseif TiempoOf=2 then
								  response.Write("dias")
								  elseif TiempoOf=3 then
				  response.Write("meses")
				    elseif TiempoOf=4 then
				  response.Write("a&ntilde;os")			  
				  else
				  response.Write("")
				  end if %>
                                                                        </label>
                                                                    </td><% end if%>
                                                                </tr>
                                                            </tbody>
                                                        </table>
     <%end if%>
                                                    </div>
                                                </div>
                            <div class="panel panel-default-border delpmbottom">
                              <div class="panel-body simple2">
                              <% if valPreg1=0 then %>
                                    <div class="col-xs-12"><label>Otros Aspectos:<span class="text-danger">&nbsp;(**)</span></label></div>
                                    <div class="col-xs-4">Disposici&oacute;n para trabajar a tiempo completo:&nbsp;</div>
                                      <% if disp_varios = 0 then response.Write("") end if
if lsdisponi = 1 then response.Write("SI") end if
if lsdisponi = 2 then response.Write("NO") end if %>

                                </div>
                                <% END IF %>
                                
                                
                                
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

<table class="table table-bordered table-det-web">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="2">Otros Aspectos</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <% if p="99" then 
													if valPreg1<>"0" then%>
                                                        <<tr>
                                                            <td width="92%"><%if id_proy = 139 then%>&iquest;Habilidad para el manejo de equipos interdisciplinarios?<%else%>TIENE IMPEDIMENTO PARA SER CONTRATADO CON EL ESTADO:<%end if%></td>
                                                            <td width="8%"> <%=preg1%>
</td>
                                                        </tr>
                                                        <% end if 
														if valPreg2<>"0" then
														%>

                                                        <tr>
                                                            <td><%if id_proy = 139 then%>&iquest;Habilidades comunicativas y para la resoluci&oacute;n de problemas ?<%else%>TIENE ANTECEDENTES SOBRE SANCIÓN POR FALTA ADMINISTRATIVA, DISCIPLINARIA, ANTECEDENTES JUDICIALES, PENALES O DE PROCESOS DE DETERMINACIÓN DE RESPONSABILIDADES:<%end if%></td>                                            
                                                            <td> <%=preg2%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg3<>"0" then
														%>
                                                        <tr>
                                                            <td><%if id_proy = 139 then%>&iquest;Capacidad para trabajar bajo presi&oacute;n?<%else%>TIENE EN LA INSTITUCIÓN, FAMILIARES HASTA EL 4to GRADO DE CONSANGUINIDAD, 2do DE AFINIDAD O POR RAZÓN DE MATRIMONIO, CON LA FACULTAD DE DESIGNAR, NOMBRAR, CONTRATAR O INFLUENCIAR DE MANERA DIRECTA O INDIRECTA EN EL INGRESO A LABORAR AL INEI:<%end if%></td>
                                                            <td> <%=preg3%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg4<>"0" then
														%>
                                                        <tr>
                                                            <td><%if id_proy = 139 then%>&iquest;Capacidad para coordinar con autoridades de distintas instituciones p&uacute;blicas y privadas?<%else%>ACEPTA SOLO POSTULAR EN ESTA CONVOCATORIA, DE LO CONTRARIO SE ELIMINARÁ SU POSTULACIÓN DE FORMA AUTOMÁTICA: <%end if%>
                                                            </td>
                                                            <td> <%=preg4%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg5<>"0" then
														%>
                                                        <tr>
                                                            <td><p><%if id_proy = 139 then%>&iquest;Disposici&oacute;n exclusiva y a tiempo completo, durante todas las fases del operativo?<%else%>TIENE HABILIDADES PARA EL MANEJO DE EQUIPOS INTERDISCIPLINARIOS:<%end if%></p></td>
                                                            <td><%=preg5%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg6<>"0" then
														%>
                                                        <tr>
                                                            <td>
     <%if id_proy = 139 then%>&iquest;Obligatoriedad de asistir a sesiones de capacitaci&oacute;n?<%else%>TIENE HABILIDADES COMUNICATIVAS Y PARA LA RESOLUCIÓN DE PROBLEMAS:<%end if%></td>
                                                            <td> <%=preg6%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg7<>"0" then
														%>
                                                        <tr>
                                                            <td>TIENE CAPACIDAD PARA TRABAJAR BAJO PRESI&Oacute;N:</td>
                                                            <td> <%=preg7%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg8<>"0" then
														%>
                                                        <tr>
                                                            <td>TIENE CAPACIDAD PARA COORDINAR CON AUTORIDADES DE DISTINTAS INSTITUCIONES P&Uacute;BLICAS Y PRIVADAS:</td>
                                                            <td><%=preg8%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg9<>"0" then
														%>
                                                        <tr>
                                                            <td>TIENE BUEN NIVEL DE LECTURA COMPRENSIVA Y ADECUADA DICCI&Oacute;N:</td>
                                                            <td> <%=preg9%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg10<>"0" then
														%>
                                                        <tr>
                                                            <td>ES DOCENTE CON AULA A CARGO EN IE ESTATALES:</td>
                                                            <td> <%=preg10%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg11<>"0" then
														%>
                                                        <tr>
                                                            <td>DISPOSICI&Oacute;N EXCLUSIVA Y A TIEMPO COMPLETO, DURANTE TODAS LAS FASES DEL OPERATIVO:</td>
                                                            <td> <%=preg11%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg12<>"0" then
														%>
                                                        <tr>
                                                            <td>ACEPTA LA OBLIGATORIEDAD DE ASISTIR A LAS SESIONES DE CAPACITACI&Oacute;N:</td>
                                                            <td> <%=preg12%></td>
                                                        </tr>
                                                         <% end if 
														if valPreg13<>"0" then
														%>
                                                        <tr>
                                                            <td>ES RESIDENTE EN LA SEDE QUE LE CORRESPONDA: </td>
                                                            <td> <%=preg13%></td>
                                                        </tr>
                                                        
                                                        
                                                        <% end if 
else 

														if valPreg1<>"0" then
														
%>
   <tr>
                                                            <td><%if id_proy = 139 then%>&iquest;Habilidad para el manejo de equipos interdisciplinarios?<%else%>&iquest; TIENE IMPEDIMENTO PARA SER CONTRATADO CON EL ESTADO?<%end if%></td>                                            
                                                            <td> <%=preg1%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg2<>"0" then
														%>
                                                        <tr>
                                                            <td><%if id_proy = 139 then%>&iquest;Habilidades comunicativas y para la resoluci&oacute;n de problemas ?<%else%>&iquest;TIENE DISPONIBILIDAD EXCLUSIVA Y A TIEMPO COMPLETO, PARA TRABAJAR DURANTE TODAS LAS BASES DEL OPERATIVO?<%end if%></td>
                                                            <td> <%=preg2%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg3<>"0" then
														%>
                                                        <tr>
                                                            <td><%if id_proy = 139 then%>&iquest;Capacidad para trabajar bajo presi&oacute;n?<%else%>&iquest; TIENE HABILIDADES PARA EL MANEJO DE EQUIPOS INTERDISCIPLINARIOS?<%end if%>
                                                            </td>
                                                            <td> <%=preg3%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg4<>"0" then
														%>
                                                        <tr>
                                                            <td><%if id_proy = 139 then%>&iquest;Capacidad para coordinar con autoridades de distintas instituciones p&uacute;blicas y privadas?<%else%>&iquest;TIENE HABILIDADES COMUNICATIVAS PARA LA RESOLUCI&Oacute;N DE PROBLEMAS?<%end if%></td>
                                                            <td><%=preg4%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg5<>"0" then
														%>
                                                        <tr>
                                                            <td>
     <%if id_proy = 139 then%>&iquest;Disposici&oacute;n exclusiva y a tiempo completo, durante todas las fases del operativo?<%else%>&iquest;TIENE CAPACIDAD PARA COORDINAR CON AUTORIDADES DE DISTINTAS INSTITUCIONES P&Uacute;BLICAS Y PRIVADAS<%end if%></td>
                                                            <td> <%=preg5%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg6<>"0" then
														%>
                                                        <tr>
                                                            <td><%if id_proy = 139 then%>&iquest;Disposici&oacute;n exclusiva y a tiempo completo, durante todas las fases del operativo?<%else%>&iquest;TIENE CAPACIDAD PARA TRABAJAR BAJO PRESI&Oacute;N Y CON TOLERANCIA Y FRUSTRACI&Oacute;N?<% end if%></td>
                                                            <td> <%=preg6%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg7<>"0" then
														%>
                                                        <tr>
                                                            <td>&iquest;ACEPTA LA OBLIGATORIEDAD DE ASISTIR A SESIONES DE CAPACITACI&Oacute;N?</td>
                                                            <td><%=preg7%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg8<>"0" then
														%>
                                                        <tr>
                                                            <td>&iquest;TIENE BUEN NIVEL DE LECTURA COMPRENSIVA Y ADECUADA DICCI&Oacute;N:</td>
                                                            <td> <%=preg8%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg9<>"0" then
														%>
                                                        <tr>
                                                            <td>&iquest;USTED CUENTA CON MAS DE 10 HORAS CAPACITANDO?</td>
                                                            <td> <%=preg9%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg10<>"0" then
														%>
                                                        <tr>
                                                            <td>&iquest;TIENE  CONTRATO VIGENTE COMO DOCENTE EN EL SECTOR PÚBLICO?</td>
                                                            <td> <%=preg10%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg11<>"0" then
														%>
                                                        <tr>
                                                            <td>&iquest;ACEPTA LA OBLIGATORIEDAD DE ASISTIR A LAS SESIONES DE CAPACITACI&Oacute;N?</td>

                                                            <td> <%=preg11%></td>
                                                        </tr>
                                                        <%  end if
														if valPreg12<>"0" then
														%>
                                                        <tr>
                                                            <td>&iquest;TIENE DISPONIBILIDAD PARA VIAJAR?</td>

                                                            <td> <%=preg12%></td>
                                                        </tr>
                                                      <%  end if  %>

<%end if%>
                                                    </tbody>
                                                </table>
                                                
                                                <%end if %>

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
    <td style="width:90%">Declaro bajo juramento que los datos consignados en la presente ficha de inscripci&oacute;n, corresponden a la verdad; los mismos que podr&aacute;n ser verificados con los documentos sustentatorios de mi Curriculum Vitae, conforme presente a la instituci&oacute;n.<br/><b><%if id_proy=139 then %>
                        NOTA: PARA OMPLETAR SU INSCRIPCI&Oacute;N DEBER&Aacute; PRESENTAR SU CV DOCUMENTADO, INCLUYENDO COPIA DEL DNI, COPIA DEL GRADO DE ESTUDIO, COPIA DE LA EXPERIENCIA LABORAL Y ESTA FICHA DE INSCRIPCI&Oacute;N.
                        <BR><BR> 
                        LUEGO  DE GUARDAR ESTA FICHA EL SISTEMA LE MOSTRAR&Aacute; LA DIRECCI&Oacute;N Y LOS PLAZOS DE ENTREGA DE DOCUMENTOS
                    
                        <%else%>
                        NOTA: Los datos consignados se contrastar&aacute;n con sus documentos adjuntos
                        <%end if%></b></td>
    <td style="width:10%"><div class="col-xs-2">
                                                           <% if lsvaraci = 1 then response.Write("Si") end if
if lsvaraci= 2 then response.Write("No") end if%>
                                                        </div> </td>
  </tr>
  
  <tr height="22" >
 				                <td  height="28" colspan="2" align="CENTER" style="border-bottom:1px solid; border-bottom-color:#0F83E1"></td>
			                  </tr>
</table>

                                </div>
                            </div>
                            <div align="center">
                            
                            <table style="width:100%">
                             <tr height="22" >
 				                <td  height="28" colspan="3" align="CENTER" ><br><br><br>___________________________________<br>FIRMA</td>
			                  </tr>
                            
                             <tr height="22" >
 				                <td  height="28" colspan="3" align="left" class="etiqueta">Num. Convocatoria: <%=num_conv%><br>
 				                Fecha Inscripci&oacute;n&nbsp;&nbsp;&nbsp;: <%=fec_reg%></td>
			                  </tr>
                              <tr>
                            <TD align="center">
                            
                            <input type=hidden id="idficha" name="idficha" value="" /><input type=hidden id="txtOper" name="txtOper" value="">	
                                <input type="button" value="Imprimir " id="button1" name="button1"  class="boton" onclick="window.print();" />
                            
                            </TD>
                            </tr>
                            </table>
                            </div>
                            
                        </div>

                    </div>

                </div>
            </div>
        </div>


    </div>    
 

</div> 

<div id="dialog" title="ALERTA">
<p id="mensaje"> </p>
</div>
</form>
    </body> 
        <!-- /container -->
        <script src="js/jquery-1.11.0.min.js"></script>
        
        <link rel="stylesheet" href="css/jquery-ui.css" />
		<script src="js/jquery-1.9.1.js"></script>
        <script src="js/jquery-ui.js"></script>
        
        <script type="text/javascript" src="js/funciones.js?id=<%now()%>"></script>
        
        <script type="text/javascript">
            // $(":file").filestyle({buttonName: "btn-primary"});

       </script>
       


</html>