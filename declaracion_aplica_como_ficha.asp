<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<%

id=request("id")
p=request("p")
dni=request("dni")



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
                        <h3 class="panel-title text-center etitle" >3.2. Formato Estandarizado de Hoja de Vida para Aplicadores</h3>
                    </div> 
                                      
                    
                </div>
            </div>

          <div class="clearfix">
                

              <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">PRIMERA SECCIÓN: DATOS PERSONALES</h3>
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
                                    <div class="form-group delpmbottom ">
                                      <div><label>Fecha Nacimiento </label><br/><%=lsDia%>/<%=lsMes%>/<%=lsAnio%></div>
                                  </div>
                                  
                                </div>
                            </div>
                        </div> 
                      <div class="col-xs-3">
                            <div class="panel panel-default-border">
                                <div class="panel-body simple">
								
                                    <div class="form-group">
                                        <label >Estado Civil (DNI)</label><br>
                                        <%
if lsECivil = "1" Then response.Write("Soltero(a)") End If
if lsECivil = "2" Then response.Write("Casado(a)") End If
if lsECivil = "3" Then response.Write("Viudo(a)") End If
if lsECivil = "4" Then response.Write("Divorciado(a)") End If
if lsECivil = "5" Then response.Write("Conviviente") End If%>
                                        
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
              
                <% end if %>
                <div class="panel panel-default">
                    
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
                      <h3 class="panel-title">SEGUNDA SECCIÓN: FORMACIÓN PROFESIONAL</h3>
                    </div>
                    <div class="panel-body">
                      <div class="col-xs-12">
                        <div class="panel panel-default-border">
                          <div class="panel-body simple2">
                            <div class="col-xs-12">
                             
                              
                             
                              <div class="espace-bottom">
                                <table width="100%" class="table table-bordered table-det-web">
                                  <thead>
                                    <tr>
                                      <th width="521" style="width:480px;">Formación académica</th>
                                  <th width="165">Marque con una X</th>
                                      <th width="537" style="width:115px;">Carrera o profesión</th>
                                   
         </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>Maestria</td>
                                      
                                      <td >&nbsp;</td>
                                      <td>&nbsp;</td>
                                     
                                    </tr>
                                    <tr>
                                      <td>Licenciatura</td>
                                    <td>&nbsp;</td>
                                      <td  class="space-nowrap">&nbsp;</td>
                                     
         </tr>
                                    <tr>
                                      <td>Titulo Tecnico<td>&nbsp;</td>
                                      <td  class="space-nowrap">&nbsp;</td>
    <% end if%>                                  
    </tr>
                                    <tr>
                                      <td>Egresado Universitario                                    
                                      <td>&nbsp;</td>
                                      <td  class="space-nowrap">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td>Egresado Tecnico                                   
                                      <td>&nbsp;</td>
                                      <td  class="space-nowrap">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td>Estudiantes universitarios de los dos últimos años                                                                          
                                      <td>&nbsp;</td>
                                      <td  class="space-nowrap">&nbsp;</td>
                                    </tr>
                                    <tr>
                                      <td>Estudiantes tecnico de los dos últimos años                                                                          
                                      <td>&nbsp;</td>
                                      <td  class="space-nowrap">&nbsp;</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                              
                              
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">TERCERA SECCIÓN: EXPERIENCIA ESPECÍFICA PARA EL CARGO</h3>
                    </div>
                    <div class="panel-body">

                            <div class="col-xs-12">                                                               					<div class="col-xs-12">
                                                    <div class="espace-bottom"><table class="table table-bordered table-det-web">
                                                            <thead>
                                                                <tr>
                                                                    <th width="43%">TIPO DE EXPERIENCIA</th>
                                                                    <th width="10%">Marque Con una X</th>
                                                                    <th width="47%"><h5>Empresa o Institucion</h5></th>
                                                            

                                                            </tr>
                                                      </thead>
                                                            <tbody>
                                                                <tr>
                                                                  <td>Coordinacion o supervision</td>
                                                                    <td>&nbsp;</td>
                                                                    <td  class="space-nowrap text-center">
                                                                        
                                                                    </td>
                                                                    
                                                                </tr>
                                                                <tr>
                                                                  <td>Capacitacion</td>
                                                                  <td>&nbsp;</td>
                                                                  <td  class="space-nowrap text-center"></td>
                                                                </tr>
                                                                <tr>
                                                                  <td>Docencia</td>
                                                                  <td>&nbsp;</td>
                                                                  <td  class="space-nowrap text-center"></td>
                                                                </tr>
                                                                <tr>
                                                                  <td>Trabajo con niños/as</td>
                                                                  <td>&nbsp;</td>
                                                                  <td  class="space-nowrap text-center"></td>
                                                                </tr>
                                                                <tr>
                                                                  <td>Trabajo con jovenes</td>
                                                                  <td>&nbsp;</td>
                                                                  <td  class="space-nowrap text-center"></td>
                                                                </tr>
                                                                <tr>
                                                                  <td>Recojo de información</td>
                                                                  <td>&nbsp;</td>
                                                                  <td  class="space-nowrap text-center"></td>
                                                                </tr>
                                                                <tr>
                                                                  <td>Otros relacionados (especificar)</td>
                                                                  <td>&nbsp;</td>
                                                                  <td  class="space-nowrap text-center"></td>
                                                                </tr>
                                                            </tbody>
                              </table></div>
                                                </div>
    
    <div class="col-xs-12">
                                                    <div class="espace-bottom"></div>
                              </div>
                            
                        </div>
                    </div>
                </div>
            </div>
          <div class="panel panel-default delpmbottom">
             
                <div class="panel-body">
                    <div class="col-xs-12">
                      <div align="center">
                            
                        <table style="width:100%">
                            
                            
                            
                              <tr>
                            <TD align="center"><input type="button" value="Imprimir " id="button1" name="button1"  class="boton" onclick="window.print();" />
                            
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