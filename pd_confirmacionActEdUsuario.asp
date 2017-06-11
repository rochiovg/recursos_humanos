
<%@ Language=VBScript  %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 

<%
 Response.ContentType="text/html; charset=iso-8859-1"
	lsUsuario = "Actualiza"
	nav = Request.ServerVariables("HTTP_USER_AGENT") 
	lsIdConvCargo = Request.Form("lsIdConvCargo")
	
	id_usuario=  Session("id_usuario")


	lsDptoI = Request.Form("ccdd1")	
	lsProvI = Request.Form("ccpp1")
	lsDistI = Request.Form("ccdi1")
	
	lsApePaterno = trim(UCase(Request.Form("lsApePaterno")))
	lsApeMaterno = TRIM(UCase(Request.Form("lsApeMaterno")))
	lsNombre1 = TRIM(UCase(Request.Form("lsNombre1")))
	lsNombre2 = TRIM(UCase(Request.Form("lsNombre2")))
	lsSexo = Request.Form("lsSexo")	
	lsAnio = Request.Form("lsAnio")
	lsMes = Request.Form("lsMes")
	lsDia = Request.Form("lsDia")
	lsFecNac = Request.Form("lsFecNac")
	lsEdad = Request.Form("lsEdad")
	lspais = Request.Form("lspais")
	lsDptoNc = Request.Form("lsDptoNc")
	if lsDptoNc<>"" then 
	lsDptoN = mid(lsDptoNc,1,2)
	end if
	
	lsProvNc = Request.Form("lsProvNc")
	if lsProvNc <> "" then 
	lsProvN = mid(lsProvNc,3,2)
	end if
	
	lsDistNc = Request.Form("lsDistNc")	
	if lsDistNc <>"" then 
	lsDistN = mid(lsDistNc,5,2)
	end if 
	lsDNI = Request.Form("lsDNI")
	lsRUC = Request.Form("lsRUC")	
	lsECivil = Request.Form("lsECivil")
	lsCmbLen = 	Request.Form("lsCmbLen")
	lsTelefono = Request.Form("lsTelefono")
	lsCelular = Request.Form("lsCelular")
	lsOperCel =	Request.Form("lsOperCel")
	lsEmail = ltrim(rtrim(Request.Form("lsEmail")))
	lsTipoVia = Request.Form("lsTipoVia")
	lsNomVia = ltrim(rtrim(Request.Form("lsNomVia")))
	lsNumPuerta = ltrim(rtrim(Request.Form("lsNumPuerta")))
	lsNumKilometro = ltrim(rtrim(Request.Form("lsNumKilometro")))
	lsNumManzana = ltrim(rtrim(Request.Form("lsNumManzana")))
	
	lsNumInterior = ltrim(rtrim(Request.Form("lsNumInterior")))
    lsDepa = ltrim(rtrim(Request.Form("lsDepa")))
	lsNumPiso = Request.Form("lsNumPiso")
	lsNumLote = Request.Form("lsNumLote")

	lsTipoZona = Request.Form("lsTipoZona")
	lsNomZona = ltrim(rtrim(Request.Form("lsNomZona")))
 	
	
	
	lsDptoR = Request.Form("lsDptoR")
	if len(lsDptoR)=2 then
		lsDptoR = lsDptoR
	else
		lsDptoR = Mid(lsDptoR,1,2)
	end if
	
	lsProvR = Request.Form("lsProvR")
	if len(lsProvR)=2 then
		lsProvR = lsProvR
	else
		lsProvR = Mid(lsProvR,3,2)
	end if
	
	lsDistR = Request.Form("lsDistR")
	if len(lsDistR)=2 then
		lsDistR = lsDistR
	else
		lsDistR = Mid(lsDistR,5,2)
	end if
	
	lsNivInst = Request.Form("lsNivInst")
	lsTipEst = Request.Form("lsTipEst")
	lsGrado = Request.Form("lsGrado")
	lsfec_exp= Request.Form("lsfec_exp")
	lsperioAlc = Request.Form("lsperioAlc")
	lsTiPerAlc = Request.Form("lsTiPerAlc")
	lsprofesion = Request.Form("lsprofesion")
	lsUniv = Request.Form("lsUniv")
	lsLugEst = Request.Form("lsLugEst")
	lsExpGen_anio = Request.Form("lsExpGen_anio")
	lsExpGen_meses = Request.Form("lsExpGen_meses")
	lsExpCampoanio = Request.Form("lsExpCampoanio")
	lsExpCampomeses = Request.Form("lsExpCampomeses")
	lsExpGrupoanio = Request.Form("lsExpGrupoanio")
	lsExpGrupomeses = Request.Form("lsExpGrupomeses")
	lsCapsanio = Request.Form("lsCapsanio")
	lsCapameses = Request.Form("lsCapameses")
	lsDocanio = Request.Form("lsDocanio")
	lsDocmeses = Request.Form("lsDocmeses")	
	lsIneiProc = Request.Form("lsIneiProc")
	lsProyecto = UCase(Request.Form("lsProyecto"))
	lsIneiAnio = Request.Form("lsIneiAnio")
	lsCargoInei = Request.Form("lsCargoInei")
	lsDisposicion = Request.Form("lsDisposicion")
	lsVeracidad = Request.Form("lsVeracidad")
	ipVisitante = Request.ServerVariables("REMOTE_ADDR")
	lsCargo = Request.Form("lsCargo")
	lsmeta = Request.Form("lsmeta")
	lsIdProyecto = Request.Form("lsIdProyecto")
	lsid_caroQ = Request.Form("lsid_caroQ")
	lsHijoUnico = Request.Form("lsHijoUnico")
	lsJEfeHogar = Request.Form("lsJEfeHogar")
	lsLEnguaMAt = Request.Form("lsLEnguaMAt")
	lsCurso = Request.Form("lsCurso")
	lsfec_Icap = Request.Form("lsfec_Icap")
	lsfec_Fcap = Request.Form("lsfec_Fcap")
	lsHorasLectivas = Request.Form("lsHorasLectivas")
	lsFecDatoCom= Request.Form("lsFecDatoCom")
	txtNum_reg_grado = Request.Form("txtNum_reg_grado")
	txtlugar_capacitacion = Request.Form("txtlugar_capacitacion")
	txtExpAplicacion = Request.Form("txtExpAplicacion")
	txtNombreAplicacion = Request.Form("txtNombreAplicacion")
	txtTiempoAplicacion= Request.Form("txtTiempoAplicacion")
	txtExpFormacion = Request.Form("txtExpFormacion")
	txtNombreFormacion = Request.Form("txtNombreFormacion")
	txtTiempoFormacion = Request.Form("txtTiempoFormacion")
	txtCargo1= Request.Form("txtCargo1")
	txtEmpCargo1 = Request.Form("txtEmpCargo1")
	txttiempoCargo1 = Request.Form("txttiempoCargo1")
	txtCargo2 = Request.Form("txtCargo2")
	txtEmpCargo2 = Request.Form("txtEmpCargo2")
	txttiempoCargo2= Request.Form("txttiempoCargo2")
	cmbIdiomaC = Request.Form("cmbIdiomaC")
	cmbNivelIdioma = Request.Form("cmbNivelIdioma")
	cmbDomIdioma= Request.Form("cmbDomIdioma")
	txtSiDescuento= Request.Form("txtSiDescuento")
	txtSIPension= Request.Form("txtSIPension")
	txtTipoPension= Request.Form("txtTipoPension")
	txtAFP= Request.Form("txtAFP")
	txtFCUSSP= Request.Form("txtFCUSSP")
	txtPo_AFP= Request.Form("txtPo_AFP")
	txtPo_TipoPension= Request.Form("txtPo_TipoPension")
	txtFecAfiliacion= Request.Form("txtFecAfiliacion")
	txtComision= Request.Form("txtComision")
	txtExpCampoInst= Request.Form("txtExpCampoInst")
	txtExpCampoFef= Request.Form("txtExpCampoFef")
	txtExpGrupoInst= Request.Form("txtExpGrupoInst")
	txtExpGrupoFec= Request.Form("txtExpGrupoFec")
	txtExpGenInst= Request.Form("txtExpGenInst")
	txtExpGenFec= Request.Form("txtExpGenFec")
	txtExpProcesos= Request.Form("txtExpProcesos")
	txtCargoAplicacion= Request.Form("txtCargoAplicacion")
	txtNombreProcesos= Request.Form("txtNombreProcesos")
	txtCargoProcesos= Request.Form("txtCargoProcesos")
	txtCargoFormacion= Request.Form("txtCargoFormacion")
	txtTiempoProcesos= Request.Form("txtTiempoProcesos")
	txtTiempoApli= Request.Form("txtTiempoApli")
	txtCargoProc= Request.Form("txtCargoProc")
	txtTiempoFor = Request.Form("txtTiempoFor")
	txtCursoOf = Request.Form("txtCursoOf")
	txtlugar_capacitacionOf = Request.Form("txtlugar_capacitacionOf")
	lsfec_IOf= Request.Form("lsfec_IOf")
	lsfec_FOf= Request.Form("lsfec_FOf")
	txtHorasLectivasOf = Request.Form("txtHorasLectivasOf")
	txtTiempoHL = Request.Form("txtTiempoHL")
	txtTiempoOf = Request.Form("txtTiempoOf")
	preg1 = Request.Form("preg1")
	preg2 = Request.Form("preg2")
	preg3 = Request.Form("preg3")
	preg4 = Request.Form("preg4")
	preg5 = Request.Form("preg5")
	preg6 = Request.Form("preg6")
	preg7 = Request.Form("preg7")
	preg8 = Request.Form("preg8")
	preg9 = Request.Form("preg9")
	preg10 = Request.Form("preg10")
	preg11 = Request.Form("preg11")
	preg12 = Request.Form("preg12")
	preg13 = Request.Form("preg13")
	
	
	flag_rnp = Request.Form("flag_rnp")
	fechainirnp = Request.Form("fechainirnp")
	fechafinrnp = Request.Form("fechafinrnp")
	
	
		lspcargo  = lsid_caroQ
		lsconcar = lsIdConvCargo
				

				liMaxFicha = NumFicha()
				Randomize ( ) 
				codigo = Int ( 10000 * Rnd ) 
				
				campo = right("000000000" & liMaxFicha, 8)
				lsCodigo = campo & "-" & codigo			
				NFicha = CStr(liMaxFicha)
				
				
	set Rs2 = Server.Createobject("ADODB.Recordset")

				sql="EXEC dbo.pa_actualizar_ficha  '"& lsCodigo&"','"&lsDptoI &"','"&lsProvI &"','"&lsDistI &"','"&lspcargo&"','"&lsApePaterno &"','"&lsApeMaterno&"','"&lsNombre1 &"','"&lsNombre2 &"','"&lsSexo &"','"&lsFecNac&"','"&lsEdad &"','"&lspais &"','"&lsDptoN &"','"&lsProvN &"','"&lsDistN &"','"&lsDNI &"','"&lsRUC &"','"&lsECivil &"','"&lsCmbLen &"','"&lsTelefono&"','"&lsCelular &"','"&lsOperCel&"','"&lsEmail &"','"&lsTipoVia &"','"&lsNomVia &"','"&lsNumPuerta &"','"&lsNumKilometro&"','"&lsNumManzana &"','"&lsNumInterior &"','"&lsDepa &"','"&lsNumPiso &"','"&lsNumLote &"','"&lsTipoZona &"','"&lsNomZona &"','"&lsDptoR&"','"&lsProvR &"','"&lsDistR &"','"&lsNivInst &"','"&lsTipEst &"','"&lsGrado &"','"&lsfec_exp &"','"&lsperioAlc&"','"&lsTiPerAlc &"','"&lsprofesion &"','"&lsUniv &"','"&lsLugEst &"','"&lsExpGen_anio&"','"&lsExpGen_meses &"','"&lsExpCampoanio &"','"&lsExpCampomeses&"','"&lsExpGrupoanio &"','"&lsExpGrupomeses&"','"&lsIneiProc &"','"&lsProyecto &"','"&lsIneiAnio &"','"&lsCargoInei &"','"&lsDisposicion &"','"&lsVeracidad &"','"&lsUsuario&"','"& ipVisitante&"','"&lsCapsanio&"','"& lsCapameses&"','"&lsDocanio&"','"& lsDocmeses&"'   ,'"& lsconcar&"' ,'"& lsIdProyecto&"', '"&nav&"', '"&lsHijoUnico&"', '"&lsJEfeHogar&"', '"&lsLEnguaMAt&"', '"&lsCurso&"', '"&lsfec_Icap&"', '"&lsfec_Fcap&"', '"&lsHorasLectivas&"', '"&lsFecDatoCom&"','"&txtNum_reg_grado&"' , '"&txtlugar_capacitacion&"' , '"&txtExpAplicacion&"' , '"&txtNombreAplicacion&"' , '"&txtTiempoAplicacion&"' , '"&txtExpFormacion&"' , '"&txtNombreFormacion&"' , '"&txtTiempoFormacion&"' , '"&txtCargo1&"' , '"&txtEmpCargo1&"' , '"&txttiempoCargo1&"' , '"&txtCargo2&"' , '"&txtEmpCargo2&"' , '"&txttiempoCargo2&"' , '"&cmbIdiomaC&"', '"&cmbNivelIdioma&"', '"&cmbDomIdioma&"' , '"&txtSiDescuento&"', '"&txtSIPension&"', '"&txtTipoPension&"', '"&txtAFP&"', '"&txtFCUSSP&"', '"&txtPo_AFP&"', '"&txtPo_TipoPension&"', '"&txtFecAfiliacion&"', '"&txtComision&"', '"&txtExpCampoInst&"'	, '"&txtExpCampoFef&"', '"&txtExpGrupoInst&"', '"&txtExpGrupoFec&"', '"&txtExpGenInst&"', '"&txtExpGenFec&"', '"&txtExpProcesos&"', '"&txtCargoAplicacion&"', '"&txtNombreProcesos&"', '"&txtCargoProcesos&"', '"&txtCargoFormacion&"', '"&txtTiempoProcesos&"', '"&txtTiempoApli&"', '"&txtCargoProc&"', '"&txtTiempoFor &"', '"&txtCursoOf&"', '"&txtlugar_capacitacionOf&"', '"&lsfec_IOf&"', '"&lsfec_FOf&"', '"&txtHorasLectivasOf&"', '"&txtTiempoHL&"', '"&txtTiempoOf&"', '"&preg1&"', '"&preg2&"', '"&preg3&"', '"&preg4&"', '"&preg5&"', '"&preg6&"', '"&preg7&"', '"&preg8&"', '"&preg9&"', '"&preg10&"', '"&preg11&"', '"&preg12&"', '"&preg13&"', '"&id_usuario&"', "&flag_rnp&", '"&fechainirnp&"', '"&fechafinrnp&"'"
			
			
			alert="3"
			
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
			
			Set RS2=Nothing
			Micone.close
			set Micone=nothing

			response.Write(alert)
			
			%>