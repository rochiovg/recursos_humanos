<%@ Language=VBScript  %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_funcion.asp"--> 

<%
	 Response.ContentType="text/html; charset=iso-8859-1"
	lsUsuario = "Internet"
	nav = Request.ServerVariables("HTTP_USER_AGENT") 
	lsIdConvCargo = Request.Form("lsIdConvCargo")
	
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
	'	mcargo=split(lsCargo,"*")
	
		
	lsmeta = Request.Form("lsmeta")
	lsIdProyecto = Request.Form("lsIdProyecto")
	lsIdiomaQ = Request.Form("lsIdiomaQ")
	lsdispoSabDom = Request.Form("lsdispoSabDom")
	lsCompromiso = Request.Form("lsCompromiso")
	lsid_caroQ = Request.Form("lsid_caroQ")
	
	lsHijoUnico = Request.Form("lsHijoUnico")
	lsJEfeHogar = Request.Form("lsJEfeHogar")
	lsLEnguaMAt = Request.Form("lsLEnguaMAt")
	
	
	lsCurso = Request.Form("lsCurso")
	lsfec_Icap = Request.Form("lsfec_Icap")
	lsfec_Fcap = Request.Form("lsfec_Fcap")
	lsHorasLectivas = Request.Form("lsHorasLectivas")
	lsFecDatoCom= Request.Form("lsFecDatoCom")
	
		lspcargo  = lsid_caroQ
		lsconcar = lsIdConvCargo
				

				liMaxFicha = NumFicha()		
		
				Randomize ( ) 
				codigo = Int ( 10000 * Rnd ) 
				
				campo = right("000000000" & liMaxFicha, 8)
				lsCodigo = campo & "-" & codigo			
				NFicha = CStr(liMaxFicha)
				
				
				
				
	set Rs2 = Server.Createobject("ADODB.Recordset")

				sql="EXEC dbo.pa_ficha_act_contratacionDirecta  '"& lsCodigo&"','"&lsDptoI &"','"&lsProvI &"','"&lsDistI &"','"&lspcargo&"','"&lsApePaterno &"','"&lsApeMaterno&"','"&lsNombre1 &"','"&lsNombre2 &"','"&lsSexo &"','"&lsFecNac&"','"&lsEdad &"','"&lspais &"','"&lsDptoN &"','"&lsProvN &"','"&lsDistN &"','"&lsDNI &"','"&lsRUC &"','"&lsECivil &"','"&lsCmbLen &"','"&lsTelefono&"','"&lsCelular &"','"&lsOperCel&"','"&lsEmail &"','"&lsTipoVia &"','"&lsNomVia &"','"&lsNumPuerta &"','"&lsNumKilometro&"','"&lsNumManzana &"','"&lsNumInterior &"','"&lsDepa &"','"&lsNumPiso &"','"&lsNumLote &"','"&lsTipoZona &"','"&lsNomZona &"','"&lsDptoR&"','"&lsProvR &"','"&lsDistR &"','"&lsNivInst &"','"&lsTipEst &"','"&lsGrado &"','"&lsfec_exp &"','"&lsperioAlc&"','"&lsTiPerAlc &"','"&lsprofesion &"','"&lsUniv &"','"&lsLugEst &"','"&lsExpGen_anio&"','"&lsExpGen_meses &"','"&lsExpCampoanio &"','"&lsExpCampomeses&"','"&lsExpGrupoanio &"','"&lsExpGrupomeses&"','"&lsIneiProc &"','"&lsProyecto &"','"&lsIneiAnio &"','"&lsCargoInei &"','"&lsDisposicion &"','"&lsVeracidad &"','"&lsUsuario&"','"& ipVisitante&"','"&lsCapsanio&"','"& lsCapameses&"','"&lsDocanio&"','"& lsDocmeses&"'   ,'"& lsconcar&"' ,'"& lsIdProyecto&"','"& lsIdiomaQ&"','"& lsdispoSabDom&"','"& lsCompromiso&"', '"&nav&"', '"&lsHijoUnico&"', '"&lsJEfeHogar&"', '"&lsLEnguaMAt&"', '"&lsCurso&"', '"&lsfec_Icap&"', '"&lsfec_Fcap&"', '"&lsHorasLectivas&"', '"&lsFecDatoCom&"'"
				
		
			alert="3"
			
            Rs2.cursorlocation=3
            Rs2.Open sql, MiCone,3,3
			
			Set RS2=Nothing
			Micone.close
			set Micone=nothing

			response.Write(alert)
			
			%>