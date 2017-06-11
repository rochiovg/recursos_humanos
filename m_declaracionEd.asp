 <!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
<%
Response.Expires = 0 

id=request("id")
p=request("p")
dni=request("dni")


SQLContCapac = "EXEC dbo.pa_CargoConvocatoria_ficha_rep '"&id&"' ,'1' " 
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
Datos_adicionales=wRsDptoapli.fields("Datos_adicionales")

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


sub generaTipoPension1()
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.pa_tipo_pension_listar ")
	
	if po_id_TipoPension=wRsDptoapli(0) then
	response.Write ""&wRsDptoapli(1) & ""
	end if

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
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

lsOpcion="2"
lsPaterno=""
lsMaterno=""
lsNombre=""
lsDNI=request.Form("lsDNI")
lsIDProyecto=request.Form("lsIDProyecto")
		
		Set RS = Server.CreateObject("ADODB.Recordset")
		RS.CursorType = adOpenKeyset 
		
		
		lsSQL = "EXEC dbo.pa_ficha_datos_InscripcionActED '"& id&"','"& p&"','"& dni&"' "
		
		
		
		

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
	fechafincap=Rs.Fields("fechafincap")
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
	
	
	
	%>
<head>    
<script language="JavaScript1.1" src="js/cliente.js"></script>
<script language="JavaScript1.1" src="js/comun.js"></script>	
<script language="JavaScript1.1" src="js/valida.js"></script>	

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

	function vercargos(){
}

function generaprov11(){
	alert('askdfjadf')
	return false;
	}

function generaprov(){
     
    var varDpto =document.getElementById("txtDpto1").value;
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
					 vercargos()
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

function  valida_quechua (){
	
	
	var varDpto =document.getElementById("txtDpto1").value;
	var id_proyecto =document.getElementById("id_proyecto").value;
	var id_caroQ =document.getElementById("id_caroQ").value;
	
	if (id_caroQ==2){
	if (id_proyecto==2 && (varDpto=='02' || varDpto=='03' ||varDpto=='08' || varDpto=='09' || varDpto=='05')){
		
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
	
		if (id_caroQ==3){
	if (id_proyecto==2 && (varDpto=='02' || varDpto=='09' )){
		
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


	</script>
<link href="Styles/inei.css" rel="stylesheet" type="text/css" />
</head>
<body >
    <div style="width:95%;" align="center"  >
      <%if id=773 or id=774  then %>
    <div style="width:95%; background-color:#036; text-align:center; color:#FFF" class="tituloPrin">FICHA DE POSTULANTE</div>
    <div  style=" background-color:#D0ECFD; width:95%; text-align:justify;" class="titulo">El presente formulario tiene car&aacute;cter de declaraci&oacute;n jurada; por lo que en caso de resultar falsa la informaci&oacute;n proporcionada me sujeto a los alcances de lo establecido en el art&iacute;culo 411&deg; del C&oacute;digo Penal, concordante con el art&iacute;culo 32&deg; de la Ley N&deg; 27444, Ley del Procedimiento Administrativo General. Aquellos postulantes que resulten seleccionados tendr&aacute;n que presentar su CV debidamente documentado.</div>
    
    <%else%>
    
    <div style="width:95%; background-color:#036; text-align:center; color:#FFF" class="tituloPrin">FICHA DE POSTULANTE</div>
    <div  style=" background-color:#D0ECFD; width:95%; text-align:justify;" class="titulo"><span></span>La informaci&oacute;n consignada en la presenete ficha tiene caracter de Declaraci&oacute;n Jurada por lo que el postulante ser&aacute; responsable de la Informaci&oacute;n consignada y se somete al proceso de fiscalizaci&oacute;n que lleva el INEI. En caso de ocultar informaci&oacute;n y/o haber consignado informaci&oacute;n falsa ser&aacute; excluido del proceso de selecci&oacute;n.<br><br>
    En caso de haberse producido la contrataci&oacute;n deber&aacute; interrumpirse por comisi&oacute;n de falta grave.</div>
    <%end if%>
    </div><BR>
	<div id="divContenido">

	<form ENCTYPE="multipart/form-data" name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="recibir_archivo.asp">
    <input type="hidden" name="id_cc" id="id_cc" value="<%=id%>">
    <table width='100%' height='99%' cellpadding='0' cellspacing='0' border='0' background="Imagenes/fondo_di.jpg">
  <tr height=2>
		<td></td>
	</tr>
  <tr>
		<td valign=top align=center>
 			<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
      <tr height=22>			</tr>
 			<tr height=22>
 				<td colspan=3><table cellpadding="0" cellspacing="0" align="center" width="100%">
 				  <tr height="3">
 				    <td colspan="6" align="left">
 				      <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">
                        <tr height=18>
                             <td colspan="4"  class="cabecera2"><font class="etiqueta"><strong>Cargo y proyecto/oficina al que postula</strong></font></td>
					    </tr>
							<tr height=22 > 
                             <td height="28" colspan="4" align="left" nowrap id="carg" ><span class="etiqueta"><font class='titulo' style="text-align:left" >
                             <%generaCargo()%>
                            </font></span></td>
						    </tr>	
 				        <tr>
 				          <td colspan="6" background="images/13.jpg" ><span class="mensaje2">1. Lugar al que postula </span>
 				            <input type="hidden" id="txtFrm" name="txtFrm" value="" />
                             <input type=hidden id="cmbCargo" name="cmbCargo" value="<%=id_cargo%>">
                                <input type=hidden id="meta" name="meta" value="<%=meta%>">
                            <input name="txtid_per" type="hidden" id="txtid_per" value="<%=lsid_per%>" />
                            <input type="hidden" id="a1" name="a1" value="0" />
                            <input type="hidden" id="a2" name="a2" value="0" />
                            <input type="hidden" id="a3" name="a3" value="0" />
                            <input type="hidden" name="finalizado" id="finalizado" value="1" />
                          <input type="hidden" id="id_proyecto" name="id_proyecto" value="<%=p%>" />
                          <input type="hidden" id="id_caroQ" name="id_caroQ" value="<%=id_caroQ%>" />
                          <input type="hidden" name="testP" id="testP" value="<%=testP%>"></td>
			            </tr>
                        
 				        <tr height="18">
 				          <td  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Departamento</strong>: </font></td>
 				          <td width="20%" background="images/4.jpg" ><font class="etiqueta"><strong>&nbsp;Provinicia</strong>: </font></td>
 				          <td width="21%" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Distrito</strong>:</font></td>
 				          <td colspan="2" background="images/4.jpg">&nbsp;</td>
			            </tr>
                        <tr height="18">
 				          <td ><font class="etiqueta"><%=lsNomDptoI%></font></td>
 				          <td width="20%" ><font class="etiqueta"><%=lsNomProvI%></font></td>
 				          <td width="21%" ><font class="etiqueta"><%=lsNomDistI%></font></td>
 				          <td colspan="2">&nbsp;</td>
			            </tr>
			          </table>
 				     
 				      <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">
 				        <tr>
 				          <td colspan="6" background="images/13.jpg"><span class="alerta4">2. Datos del postulante</span></td>
			            </tr>
 				        <tr height="22" >
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Apellido Paterno </strong></font></td>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Apellido Materno</strong></font></td>
 				          <td colspan="2" background="images/4.jpg"><span class="cabecera2"><font class="etiqueta"><strong>Primer Nombre(DNI)</strong></font><font class="etiqueta"><strong>
 				            <input type="hidden" name="txtNombre2" id="txtNombre2"  value="" />
 				          </strong></font></span></td>
 				          <td colspan="2" width="13%" background="images/4.jpg"><font class="etiqueta"><strong>Sexo</strong></font></td>
			            </tr>
 				        <tr height="22" >
 				          <td height="29" align="left"><span class="etiqueta"><%=lsApePaterno%></span></td>
 				          <td align="left"><span class="etiqueta"><%=lsApeMaterno%></span></td>
 				          <td colspan="2" align="left"><span class="etiqueta"><%=lsNombre%></span></td>
 				          <td align="left" colspan="2"><span class="etiqueta"><%If lsSexo="F" then
						 response.Write("FEMENINO") 
						 ELSEIF lsSexo="M" THEN 
						 response.Write("MASCULINO")
						 ELSE 
						 response.Write("")
						 END IF
						 %>
 				          </span></td>
			            </tr>
 				        <tr>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>Fecha Nacimiento </strong></font></td>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>Pais de Nacimiento</strong></font></td>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>Dpto nacimiento</strong></font></td>
 				          <td width="20%" background="images/4.jpg"><font class="etiqueta"><strong>Prov de Nacimiento</strong></font></td>
 				          <td colspan="2" background="images/4.jpg"><font class="etiqueta"><strong>Dist de Nacimiento</strong></font></td>
			            </tr>
 				        <tr>
 				          <td><span class="etiqueta"><%=lsDia%>/<%=lsMes%>/<%=lsAnio%></span></td>
 				          <td ><span class="etiqueta"><%generaPAIS()%></span></td>
 				          <td ><font class="etiqueta"><%=lsNDptoN %></font></td>
 				          <td id="prov3"  ><font class="etiqueta"><%=lsNProvN%></font></td>
 				          <td id="dist4" colspan="2"  ><font class="etiqueta"><%=lsNDistN%></font></td>
			            </tr>
 				        <tr>
 				          <td colspan="2" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;DNI</strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></td>
 				          <td width="20%" background="images/4.jpg"><font class="etiqueta"><strong>N&ordm; RUC</strong></font></td>
 				          <td colspan="3" background="images/4.jpg"><span class="cabecera2"><font class="etiqueta"><strong>&nbsp;</strong></font></span></td>
			            </tr>
 				        <tr>
 				          <td colspan="2" align="left"><span class="etiqueta"><%=lsDNI%></span></td>
 				          <td align="left"><span class="etiqueta"><%=lsRUC%></span></td>
 				          <td colspan="3" align="left">&nbsp;</td>
			            </tr>
 				      <tr>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>Estado Civil (DNI) </strong></font></strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong>Es Usted hijo &uacute;nico</strong></font></td>
							 <td align="left" class="cabecera2"><font class="etiqueta"><strong>Es jefe y/o responsable de su hogar</strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong><font class="etiqueta"><strong>Lengua materna que aprendi&oacute; en su ni&ntilde;ez</strong></font>&nbsp;</strong></font></td>
							  <td colspan="2" align="left" class="cabecera2"><font class="etiqueta" id="idiomaQ" style="display:none"><strong>Dominio fluido del idioma quechua</strong></font><font class="etiqueta" id="idiomaQ1" style="display:none"><strong>Dominio fluido del idioma quechua y/o aymara</strong></font><font class="etiqueta"><strong>Lengua originaria que actualmente domina</strong></font></td>
					    </tr>
                         <tr>
							  <td height="32" align="left"><span class="etiqueta"><%

if lsECivil = "1" Then response.Write("Soltero(a)") End If
if lsECivil = "2" Then response.Write("Casado(a)") End If
if lsECivil = "3" Then response.Write("Viudo(a)") End If
if lsECivil = "4" Then response.Write("Divorciado(a)") End If
if lsECivil = "5" Then response.Write("Conviviente") End If%></span></td>
                              <td align="left"><span class="etiqueta"><%=hijoUnico%></span></td>
                              <td align="left"><span class="etiqueta"><%=jefeCasa%></span></td>
							  <td align="left">&nbsp;<span class="etiqueta"><%=lenguaMaterna%></span></td>
							  <td colspan="2" align="left"><select   id="cmbIdiomaQ" name="cmbIdiomaQ" style="width:110px; display:none" class='e_combo' onChange="validaQ(this.value)">
						        <option selected value="0">Seleccione...</option>
							      <option value="1">Si</option>
							      <option value="2">No</option>
						      </select>							    <span class="etiqueta"><%=lengua%></span></td>
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
							  <td height="32" align="left"><span class="etiqueta"><%=idiomaExtr%></span></td>
                              <td align="left"><span class="etiqueta">
                              <% if nivelIdiomaExt = "E" Then response.Write("B&aacute;sico") End If
if nivelIdiomaExt = "L" Then response.Write("Regular") End If
if nivelIdiomaExt = "A" Then response.Write("Avanzado") End If
%></span>
                              </td>
                              <td align="left"><span class="etiqueta">
                         <%     if dominioIdiomaExt = "1" Then response.Write("Solo lee") End If
if dominioIdiomaExt = "2" Then response.Write("Solo escribe") End If
if dominioIdiomaExt = "3" Then response.Write("Lee y escribe") END IF
if dominioIdiomaExt = "4" Then response.Write("Traduce") End If%></span>
                              </td>
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
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Tel&eacute;fono </strong>(Use gui&oacute;n para los anexos Ej.5555555-5555)</font></td>
 				          <td width="21%" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Celular Celular</strong></font></td>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>Oper. Celular</strong></font></td>
 				          <td colspan="3" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>&nbsp;&nbsp;Correo Electr&oacute;nico</strong></font></strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></td>
			            </tr>
 				        <tr>
 				          <td align="left" nowrap="nowrap"><span class="etiqueta"><%=lsTelefono%></span></td>
 				          <td align="left" nowrap="nowrap"><span class="etiqueta"><%=lsCelular%></span></td>
 				          <td align="left" nowrap="nowrap"><span class="etiqueta"><%=lsOperCel%></span>
			              </td>
 				          <td colspan="3" align="left" nowrap="nowrap"><span class="etiqueta"><%=lsEmail%></span></td>
			            </tr>
			          </table>
 				      <br />
 				      <span id="msj" style="display:none;" class="mensaje1" >Este DNI ya se encuentra registrado.</span> <span id="msj2" style="display:none;" class="mensaje1">El DNI tiene como m&iacute;nimo 8 n&uacute;meros..</span>
                      
                        <table  cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">							
							<tr>
           <td colspan=9 ><span class="alerta4">3. Afiliaci&oacute;n a Sistema de Pensi&oacute;n</span></td>
           
							</tr>
                      <tr  id="tr_afp4">
                      <td width="17%" height="43" class="cabecera2"><span ><font class="etiqueta"><strong>Sistema de Pensiones</strong></font></span></td>
							  <td width="20%" height="43" class="cabecera2"><font class="etiqueta"><strong>Si esta afiliado a una AFP, a cual?</strong></font></td>
							  <td width="28%" height="43" class="cabecera2"><font class="etiqueta"><strong>N&uacute;mero de CUSSP (C&oacute;digo de Afiliado AFP)</strong></font></td>
							  <td width="20%" class="cabecera2"><font class="etiqueta"><strong>Fecha de Afiliaci&oacute;n : </strong></font></td>
							  <td width="15%"  class="cabecera2"><font class="etiqueta"><strong>Tipo de Comisi&oacute;n : </strong></font></td>
							 
			          </tr>
							<tr height=22  id="tr_afp5"  >
							  <td height="29" nowrap align="left"><span class="etiqueta">
							    <%generaTipoPension()%>
							  </span><span class="etiqueta"><font class='alerta5'> </font></span></td>
							  <td height="29" nowrap align="left"><span class="etiqueta"><%generaAFP()%></span></td>
							  <td height="29" align="left"><span class="etiqueta"><%=num_CUSSP%></span></td>
                              
							  <td height="29" align="left"><span class="etiqueta"><%if fec_AfiliaAFP="01/01/1900" then
							  response.write""
							  else
							  response.Write(fec_AfiliaAFP)
							  end if
							  
							  %></span></td>
							  <td align="left"><span class="etiqueta"><%generaComision()%></span></td>
                      </tr>
                      </table>  
              
              <br>
              
              
 				      <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">
 				        <tr>
 				          <td colspan="8"   background="images/13.jpg"><span class="alerta4">4. Domicilio del Postulante</span></td>
			            </tr>
 				        <tr height="22" >
 				          <td  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Tipo de V&iacute;a </strong></font></td>
 				          <td  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Nombre de V&iacute;a (Direcci&oacute;n) </strong></font></td>
 				          <td width="12%"  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;N&ordm;</strong></font></td>
 				          <td width="15%"  background="images/4.jpg"><font class="etiqueta"><strong>KM</strong></font></td>
 				          <td width="13%"  background="images/4.jpg"><font class="etiqueta"><strong>MZ</strong></font></td>
 				          <td width="10%"  background="images/4.jpg"><font class="etiqueta"><strong>Interior</strong></font></td>
 				          <td width="13%"  background="images/4.jpg"><font class="etiqueta"><strong>DPTO</strong></font></td>
			            </tr>
 				        <tr height="22" >
 				     
 				          <td height="29" align="left" nowrap="nowrap"><span class="etiqueta"><%generaVIA()%> </span></td>
 				          <td height="29" align="left"><font class="etiqueta"><%=trim(lsNomVia)%></td>
 				          <td height="29" align="left"><font class="etiqueta"><%=lsNumPuerta%></font></td>
 				          <td align="left"><font class='etiqueta'><%=lsNumKilometro%></td>
 				          <td align="left"><font class='etiqueta'><%=lsNumManzana%></font></td>
 				          <td align="left"><font class='etiqueta'><%=lsNumInterior%></font></td>
 				          <td align="left"><font class='etiqueta'><%=lsdepa%></font></td>
			            </tr>
 				        <tr >
 				          <td width="16%"  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Lote</strong></font></td>
 				          <td width="21%"  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Piso</strong></font></td>
 				          <td colspan="2" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Tipo de Zona</strong></font></td>
 				          <td colspan="3" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;</strong></font><font class="etiqueta"><strong>&nbsp;Nombre Zona</strong></font></td>
			            </tr>
 				        <tr>
 				          <td align="left"><font class='etiqueta' color="etiqueta"><%=lsNumLote%></font></td>
 				          <td align="left"><font class='etiqueta' color="etiqueta"><%=lsNumPiso%></font></td>
 				          <td colspan="2" align="left"><font class='etiqueta' color="etiqueta"><%generaZONA()%></font></td>
 				          <td colspan="3" align="left"><font class='etiqueta'><%=trim(lsNomZona)%></font></td>
			            </tr>
 				        <tr height="22" bgcolor="#C7EAFB">
 				          <td height="30" colspan="2" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Departamento</strong>: </font></td>
 				          <td colspan="2" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Provinicia</strong>: </font></td>
 				          <td colspan="3" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Distrito</strong>: </font></td>
			            </tr>
 				        <tr height="22" >
 				          <td height="28" colspan="2" align="left"><font class="etiqueta"><%=lsNomDptoR%></font></td>
 				          <td height="28" colspan="2" align="left" id="prov2" ><font class="etiqueta"><%=lsNomProvR%></font></td>
 				          <td colspan="3" align="left" id="dist2" ><font class="etiqueta"><%=lsNomDistR%></font></td>
			            </tr>
			          </table>
 				      <br />
 				      <table cellpadding="0" cellspacing="0" border="0"  class="tablam" width="100%">
 				        <tr>
 				          <td colspan="10"  background="images/13.jpg"><span class="mensaje2">5. Perfil de postulante</span><strong><span style="color: #036; font:arial; font-size:10px;" >(Si Ud. es seleccionado , se le solicitar&aacute; que los datos que consigne a continuaci&oacute;n sean respaldados con alg&uacute;n documento. Si no presenta los documentos ser&aacute; descalificado autom&aacute;ticamente.)</span></strong></td>
			            </tr>					
<% 	if lsNivInst=3 then
		lsNivelInsM="Secundaria"
	elseif 	lsNivInst=4 then		
		lsNivelInsM="Superior"		
	elseif 	lsNivInst=5 then		
		lsNivelInsM="Superior no Universitario"			
	end if				
%>
 				        <tr bgcolor="#C7EAFB">
 				          <td width="17%" height="20" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><font class="etiqueta"><strong>Nivel de Instrucci&oacute;n: </strong></font><font class='cascade4' color="crimson"><font class='alerta5'><font class="etiqueta"><strong><font class='cascade4' color="crimson">
 				            </font><font class='cascade4' color="crimson">
 				            <input type="hidden" name="cmbTipoEstudios" id="cmbTipoEstudios" value="0" />
			              </font></strong></font></font></font></td>

 				          <td width="21%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Grado Alcanzado:</strong></font></td>
 				          <td width="7%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span><font class="etiqueta"><strong>Fecha de Expedici&oacute;n Grado</strong></font></span></td>
 				          <td width="8%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Registro de expdici&oacute;n de grado</strong></font></td>
 				          <td width="19%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Per&iacute;odo Alcanzado (en n&uacute;meros)</strong></font></td>
 				          <td width="15%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Per&iacute;odo</strong></font></td>
			            </tr>
 				        <tr height="22" >
 				          <td height="28" align="left" id="idNivel"  style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><%=lsNivelInsM%></font></td>
 				          <td  height="28" align="left" id="idGrado" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class="etiqueta"><%=ls_descGrado%></font></td>
 				          <td  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta">
						 <%if lsAnio2="1900" and lsMes2="01" and lsDia2="01" then
						 response.write("")
						 else%>
						  <%=lsDia2%>/<%=lsMes2%>/<%=lsAnio2%>
                          <%end if%>
                          </span></td>
 				          <td  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta"><%=Num_reg_grado%></span></td>
 				          <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta"><%=lsperioAlc%></span></td>
 				          <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='etiqueta'>
<% if lsTiPerAlc  = "0" then response.Write("") end if
if lsTiPerAlc  = "1" then response.Write("CICLO") end if
if lsTiPerAlc  = "2" then response.Write("MES") end if
if lsTiPerAlc  = "3" then response.Write("A&Ntilde;O") end if
if lsTiPerAlc  = "4" then response.Write("TRIMESTRE") end if
if lsTiPerAlc  = "5" then response.Write("SEMESTRE") end if
if lsTiPerAlc  = "6" then response.Write("CUATRIMESTRE") end if
if lsTiPerAlc  = "7" then response.Write("MODULO") end if
if lsTiPerAlc  = "8" then response.Write("NIVEL") end if%>
</font></td>
			            </tr>
                        
                         <% if id_caroQ =412 or id_caroQ =413  THEN %> 
                     <tr>
                     <td height="28" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Carrera o profesi&oacute;n</strong></font></td>
							  <td height="28" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Otro cupaci&oacute;n y/o Profesi&oacute;n</strong></font></td>
							  <td  height="28" colspan="3" align="left"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class="etiqueta"><strong>En caso de ser educador, especifique su especialidad</strong></font></td>
							  <td colspan="2" align="left" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class="etiqueta"><strong>Universidad</strong></font></td>
					  </tr>
							<tr height=22 >
							  <td height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1">&nbsp;<span class="etiqueta" > <% if prof_ednom=1 then
				response.Write("EDUCACI&Oacute;N")
			elseif 	prof_ednom=2 then			  
				response.Write("PSICOLO&Iacute;A")
			elseif 	prof_ednom=3 then			  
				response.Write("OTRO")
			else
				response.Write("")	
			end if		  
							  %></span></td>
							  <td height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; ">
							    <%generaprofesion()%>
							  </span></td>
							  <td  height="28" colspan="3" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta" ><%=especialidad_ednom%></span></td>
							  <td colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta"><%generaUniversidad()%>
							  </span></td>
                        </tr>
                              <%else%>
                              <tr height="22" >
                         <td   class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><font class="etiqueta"><strong>Profesi&oacute;n: </strong></font></td>
 				          <td class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><font class="etiqueta"><strong>Especialidad: </strong></font></td>
 				          <td colspan="2" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><font class="etiqueta"><strong>Universidad: </strong></font></td>
 				          <td colspan="2" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><span><font class="etiqueta"><strong>Centro de estudios</strong></font></span></td>
			            </tr>
 				        <tr height="22" >
 				          <td height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="etiqueta" style="display:block">
 				            <%generaprofesion()%>
 				          </span></td>
 				          <td  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta" style="display:block">
 				            <%=especialidad_ednom%>
 				          </span></td>
 				          <td  height="28" colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta">
 				            <%generaUniversidad()%>
 				          </span></td>
 				          <td colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta"><%=lsLugEst%></span></td>
			            </tr>
                        <%END IF%>
                      </table>

                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3" >
                      <tr>
							      <td width="274"    class="cabecera2" ><font class="etiqueta"><strong>Experiencia </strong></font></td>
							      <td width="84"    class="cabecera2" ><font class="etiqueta"><strong>Nombre Instituci&oacute;n (Registre solo el &uacute;ltimo)</strong></font></td>
							      <td width="84"    class="cabecera2" ><font class="etiqueta"><strong>Fecha Último día de labores</strong></font></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><span class="cabecera2" ><font class="etiqueta"><strong>A&ntilde;os</strong><br>
						          Ejm. 3 a&ntilde;o(s)</font></span></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>&nbsp;Meses</strong><br>6 mes(es)</font></td>
				          </tr>
                      <tr >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><span class="etiqueta">
							        <% if experiencia_1="" or isnull(experiencia_1) then %>
A&ntilde;os o meses  de experiencia en trabajos de Campo (Censo y/o Encuestas)
<%else%>
<%=experiencia_1%>
<%end if%>
							      </span></td>
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><%=ExpCampoInst%></td>
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><%=ExpCampoFef%></td>
							      <td width="97"  height="30"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span ><%=lsExpCampoanio%><font class="etiqueta">a&ntilde;o(s)</font></span></td>
							      <td width="100"   align="left" style="border-bottom:1px solid"><span class="etiqueta"><%=lsExpCampomeses%><font class="etiqueta">mes(es)</font></span></td>
				          </tr>
                                <%if id_caroQ =412 or id_caroQ =413  THEN %>
                                <%end if%>
                                
							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"> <% if experiencia_2="" or isnull(experiencia_2) then %>A&ntilde;os o meses  de experiencia en manejo de grupos:<%else%><%=experiencia_2%><%end if%></td>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><%=ExpGrupoInst%></td>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><%=ExpGrupoFec%></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span><%=lsExpGrupoanio%><font class="etiqueta">a&ntilde;o(s)</font></span></td>
							      <td height="29"  align="center" id="proy" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta"><%=lsExpGrupomeses%><font class="etiqueta">mes(es)</font></span></td>
						        </tr>
                                
							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><% if experiencia_3="" or isnull(experiencia_3) then %>
                        <span class="etiqueta" >A&ntilde;os o meses de experiencia en actividades en general:</span>
                                    <%else%>
									<span class="etiqueta" ><%=experiencia_3%></span>
								  <%end if%></td>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><%=ExpGenInst%></td>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><%=ExpGenFec%></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span><span class="etiqueta"><%=lsExpGen_anio%></span><font class="etiqueta">a&ntilde;o(s)</font></span></td>
							      <td align="left" style="border-bottom:1px solid"><span class="etiqueta"><span class="etiqueta"><%=lsExpGen_meses%></span><font class="etiqueta">mes(es)</font></span></td>
						        </tr>
				      </table>
                                <br>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3" >
							    <tr>
							      <td width="273"   class="cabecera2" ><font class="etiqueta"><strong>Experiencia Adicional</strong></font></td>
							      <td width="129" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Descripci&oacute;n</strong></font></td>
							      <td width="120"  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Nombre de la Instituci&oacute;n
							        
							      </strong></font></td>
							      <td width="109"  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Cargo</strong></font></td>
							      <td width="76"  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Tiempo de Duraci&oacute;n en meses</strong></font></td>
						        </tr>
							    
							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid">Nombre de la &uacute;ltima Experiencia en operativo de Aplicaci&oacute;n de Instrumentos en campo</td>
							      <td  align="center" style="border-bottom:1px solid"><span class="etiqueta"><%=ExpAplicacion%></span></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><%=NombreAplicacion%></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta"><%=CargoAplicacion%></span></td>
							      <td align="left" style="border-bottom:1px solid"><span class="etiqueta"><%=TiempoAplicacion%><font class='cascade4' color=crimson>
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
							        </font> </span></td>
						        </tr>
                                <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta">&Uacute;ltima experiencia en procesos de operaciones de aplicaci&oacute;n de instrumentos en campo</span></td>
							      <td  align="center"><span class="etiqueta"><%=ExpProcesos%></span></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><%=NombreProcesos%></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta"><%=CargoProcesos%></span></td>
							      <td height="29"  align="center" id="proy" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta"><%=TiempoProcesos%><font class='cascade4' color=crimson>
							        <% if CargoProc=1 then
								  response.write "horas"
								  elseif CargoProc=2 then
								  response.Write("dias")
								  elseif CargoProc=3 then
				  response.Write("meses")
				    elseif TiempoFor=4 then
				  response.Write("a&ntilde;os")			  
				  else
				  response.Write("")
				  end if %>
							      </font></span></td>
						        </tr>
                                <tr>
                               							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta">&Uacute;ltima experiencia de aula o proyectos de Formaci&oacute;n </span></td>
							      <td  align="center" style="border-bottom:1px solid"><span class="etiqueta"><%=ExpFormacion%></span></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><%=NombreFormacion%></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta"><%=CargoFormacion%></span></td>
							      <td height="29"  align="center" id="proy" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta"><%=TiempoFormacion%> <font class='cascade4' color=crimson>
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
							      </font></span></td> 
                                </tr>
                                
							    </table>

                      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3">
                                <tr>
                                  <td colspan="5"   class="cabecera2"><font class="etiqueta"><strong>&nbsp;Proyectos en el INEI</strong></font></td>
                        </tr>
                                   <tr  >
                                   
							      <td width="252"  height="30"  align="center" class="etiqueta" >&iquest;Ha participado en el INEI?</td>
                                  
                                  
							      <td width="416" height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><%if lsIneiProc ="1" then response.Write("Si") END IF
 if lsIneiProc ="2" then response.Write("No") END IF%></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta" >&iquest;&Uacute;ltimo proyecto que particip&oacute; en INEI?</span></td>
                                  
							      <td width="211" height="33" colspan="2"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><%if lsProyecto ="ECE" then response.Write("ECE") END IF
if lsProyecto ="CENAGRO" then response.Write("CENAGRO") END IF
if lsProyecto ="CENSO 1993" then response.Write("CENSO 1993") END IF
if lsProyecto ="CENSO 2005" then response.Write("CENSO 2005") END IF
if lsProyecto ="CENSO 2007" then response.Write("CENSO 2007") END IF
if lsProyecto ="PRECENSO 1999-2000" then response.Write("PRECENSO 1999-2000") END IF
if lsProyecto ="CENEC" then response.Write("CENEC") END IF
if lsProyecto ="CENSO UNIVERSITARIO" then response.Write("CENSO UNIVERSITARIO") END IF
if lsProyecto ="ENAHO" then response.Write("ENAHO") END IF
if lsProyecto ="ENDES" then response.Write("ENDES") END IF
if lsProyecto ="EDNOM" then response.Write("EDNOM") END IF
if lsProyecto ="ENNSA" then response.Write("ENNSA") END IF
if lsProyecto ="JUNTOS" then response.Write("JUNTOS") END IF
if lsProyecto ="MANUFACTURA" then response.Write("MANUFACTURA") END IF
if lsProyecto ="PROPOLI" then response.Write("PROPOLI") END IF
if lsProyecto ="RENAMU" then response.Write("RENAMU") END IF
if lsProyecto ="CENSO DE DAMNIFICADOS" then response.Write("CENSO DE DAMNIFICADOS") END IF
if lsProyecto ="REGISTRO DE VIVIENDAS Y ESTABLECIMIENTOS" then response.Write("REGISTRO DE VIVIENDAS Y ESTABLECIMIENTOS") END IF
if lsProyecto ="MINCETUR" then response.Write("MINCETUR") END IF
if lsProyecto ="CONVENIO PODER JUDICIAL" then response.Write("CONVENIO PODER JUDICIAL") END IF
if lsProyecto ="ENAPROM" then response.Write("ENAPROM") END IF
if lsProyecto ="SISFOH" then response.Write("SISFOH") END IF
if lsProyecto ="ENAPRES" then response.Write("ENAPRES") END IF
if lsProyecto ="OTROS" then response.Write("OTROS") END IF%></td></tr>
                                  <tr>
                                  <td width="252"  height="30"  align="center" class="etiqueta" >&iquest;&Uacute;ltimo a&ntilde;o que particip&oacute; en INEI?</td>
                                  
                                  
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><%=lsIneiAnio%></td>
                                  
							      <td width="277"  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid">&iquest;&Uacute;ltimo cargo que particip&oacute; en INEI?</td>
							      <td width="211" height="33" colspan="2"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><%=cargoINEI%></td>
                                  </tr>
                                  
                      </table>
       
                                  
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3">
							      <tr>
                                  <td colspan="3"   class="cabecera2"><font class="etiqueta"><strong>&Uacute;LTIMOS DOS CARGOS DESEMPE&Ntilde;ADOS </strong></font></td>
                                  <td colspan="2"   class="cabecera2"><font class="etiqueta"><strong>Nombre de la Empresa</strong></font></td>
                                  <td width="96"   class="cabecera2"><font class="etiqueta"><strong>Tiempo de Duraci&oacute;n en meses</strong></font></td>
                                  </tr>
                                  
                                  
                                  <TR>
                                  <td  height="30" colspan="3"  align="center" class="etiqueta"  >Cargo Desempe&ntilde;ado (1) :&nbsp;&nbsp;<strong><%=Cargo1%></strong></td>
                                  <td height="30" colspan="2"  align="center" ><span class="etiqueta"><%=EmpCargo1%></span></td>
                                  <td width="96"   align="left" ><span class="etiqueta"><%=tiempoCargo1%></span><font class="etiqueta">Meses</font></td>
                                  </TR>
                                  <tr>
                                  <td  height="30" colspan="3"  align="center" class="etiqueta"  >Cargo Desempe&ntilde;ado (2) :&nbsp;&nbsp;<strong><%=Cargo2%></strong></td>
                                  <td height="30" colspan="2"  align="center" ><span class="etiqueta"><%=EmpCargo2%></span></td>
                                  <td width="96"   align="left" ><span class="etiqueta"><%=tiempoCargo2%></span><font class="etiqueta">Meses</font></td>
                                  </tr>
                      </table>
<br>
 				      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3" >
                        <tr >
				          <td  height="33" colspan="6" background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><font class="etiqueta"><strong>6. Capacitaci&oacute;n</strong></font></td></tr>
                                     
                               <tr >
                                
                                <td width="410"   class="cabecera2"><font class="etiqueta"><strong>&Uacute;ltima capacitaci&oacute;n (Registre lo solicitado en la convocatoria)</strong></font></td>
							      <td width="403"   class="cabecera2"><font class="etiqueta"><strong>Nombre de la Instituci&oacute;n o Empresa</strong></font></td>
							      <td width="130" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Inicio</strong><br>(dd/mm/aaaa)</font></td>
							      <td width="120" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Fin</strong><br>(dd/mm/aaaa)</font></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>&nbsp;Tiempo</strong></font></td>
				                </tr>
                                
                                <tr >
							      <td  height="29"  align="center" class="etiqueta"  ><span class="etiqueta" ><%=CursoCapacitacion%></span></td>
							      <td  height="29"  align="center" class="etiqueta" ><%=lugar_capacitacion%></td>
							      <td  align="center" ></span><span class="etiqueta"><%=fechaInicioCap%></span></td>
							      <td height="30"  align="center" ></span><span class="etiqueta"><%=fechafincap%></span></td>
							      <td width="166"   align="left" ><font class='cascade4' color=crimson><span class="etiqueta"><%=HorasLectivas%> <% if TiempoHL=1 then
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
							      </span></font></td>
                                
                                </tr>
                        
                        <tr>
                        <td width="410"   class="cabecera2"><font class="etiqueta"><strong>Capacitaci&oacute;n en Microsoft Office 2007</strong></font></td>
							      <td width="403"   class="cabecera2"><font class="etiqueta"><strong>Nombre de la Instituci&oacute;n o Empresa</strong></font></td>
							      <td align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Inicio</strong><br>(dd/mm/aaaa)</font></td>
							      <td align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Fin</strong><br>(dd/mm/aaaa)</font></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Tiempo</strong></font></td>
				                </tr>
                                
                                <tr  >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><%=CursoOf%></td>
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><%=lugar_capacitacionOf%></td>
							      <td  align="center" style="border-bottom:1px solid"> <font class='cascade4' color=crimson><font class="alerta5">&nbsp;<span class="etiqueta"><%=FecIniCursoOf%></span></font></font></td>
							      <td height="30"  align="center" style="border-bottom:1px solid"><span class="etiqueta"><%=FecFinCursoOf%></span></td>
							      <td width="166"   align="left" style="border-bottom:1px solid"><font class='cascade4' color=crimson><span class="etiqueta"><%=HorasLectivasOf%> <% if TiempoOf=1 then
								  response.write "horas"
								  elseif TiempoOf=2 then
								  response.Write("dias")
								  elseif TiempoOf=3 then
				  response.Write("meses")
				    elseif TiempoOf=4 then
				  response.Write("a&ntilde;os")			  
				  else
				  response.Write("")
				  end if %></span></font></td>
                        </tr>
 				        <tr>
 				          <td  height="33" colspan="6"  class="cabecera2"><font class="etiqueta"><strong>Otros Aspectos </strong></font></td>
			            </tr>
 				        <tr>
 				          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Disposici&oacute;n para trabajar: 
                            <% if disp_varios = 0 then response.Write("") end if
if disp_varios = 1 then response.Write("Solo Turno ma&ntilde;ana") end if
if disp_varios = 2 then response.Write("Solo turno tarde") end if
if disp_varios = 3 then response.Write("Turno Ma&ntilde;ana o tarde") end if%>
</td>
			            </tr>
                        <tr>
                        <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Tiene IMPEDIMENTO PARA ser  CONTRATADO CON EL ESTADO: </span><span class="etiqueta"><strong><%=preg1%></strong></span></td>
			            </tr>
                                
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">TIENE ANTECEDENTES SOBRE SANCI&Oacute;N POR FALTA ADMINISTRATIVA, DISCIPLINARIA, ANTECEDENTES JUDICIALES, PENALES O DE PROCESOS DE DETERMINACI&Oacute;N DE RESPONSABILIDADES:</span><span class="etiqueta"><strong><%=preg2%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">TIENE EN LA INSTITUCI&Oacute;N, FAMILIARES HASTA EL 4&deg; GRADO DE CONSANGUINIDAD, 2&deg; DE AFINIDAD O POR RAZ&Oacute;N DE MATRIMONIO, CON LA FACULTAD DE DESIGNAR, NOMBRAR, CONTRATAR O INFLUENCIAR DE MANERA DIRECTA O INDIRECTA EN EL INGRESO A LABORAR AL INEI: </span><span class="etiqueta"><strong><%=preg3%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">ACEPTA SOLO POSTULAR EN ESTA CONVOCATORIA, DE LO CONTRARIO SE ELIMINAR&Aacute; SU POSTULACI&Oacute;N DE FORMA AUTOM&Aacute;TICA: </span><span class="etiqueta"><strong><%=preg4%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Habilidades para el manejo de equipos interdisciplinarios: </span><span class="etiqueta"><strong><%=preg5%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Habilidades comunicativas y para la resoluci&oacute;n de problemas: </span><span class="etiqueta"><strong><%=preg6%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Capacidad para trabajar bajo presi&oacute;n: </span><span class="etiqueta"><strong><%=preg7%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Capacidad para coordinar con autoridades de distintas instituciones p&uacute;blicas y privadas: </span><span class="etiqueta"><strong><%=preg8%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Buen nivel de lectura comprensiva y adecuada dicci&oacute;n: </span><span class="etiqueta"><strong><%=preg9%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">No ser docente con aula a cargo en IE estatales: </span><span class="etiqueta"><strong><%=preg10%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Disposici&oacute;n exclusiva y a tiempo completo, durante todas las fases del Operativo: </span><span class="etiqueta"><strong><%=preg11%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Obligatoriedad de asistir a las sesiones de capacitaci&oacute;n: </span><span class="etiqueta"><strong><%=preg12%></strong></span></td>
					            </tr>
                                <tr>
						          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Residente en la sede que le corresponda: </span><span class="etiqueta"><strong><%=preg13%></strong></span></td>
                        </tr>
                       
 				        <tr height="3">
 				          <td colspan="6" align="left"><div class="CLS"></div>
 				            <table cellpadding="0" cellspacing="0" border="0"  width="100%" class="tablam" style="BORDER-TOP: #0F83E1 1px solid; BORDER-LEFT: #0F83E1 1px solid;BORDER-RIGHT: #0F83E1 1px solid" >
 				              <tr>
 				                <td colspan="8" background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><span class="mensaje2">Declaraci&oacute;n de Veracidad de datos</span></td>
			                  </tr>
 				              <tr height="22" >
 				                <td width="79%"  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="etiqueta">Declaro bajo juramento que los datos consignados en la presente ficha de inscripci&oacute;n, corresponden a la verdad; los mismos que podr&aacute;n ser verificados con los documentos sustentatorios de mi Curriculum Vitae, conforme presente a la instituci&oacute;n. <font class='cascade4' color="crimson"></font></span></td>
 				                <td width="21%"  height="28" colspan="2" align="left"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta">
<% if lsvaraci = 1 then response.Write("Si") end if
if lsvaraci= 2 then response.Write("No") end if%>
</span></td>

 				              <tr height="22" >
 				                <td  height="28" colspan="3" align="CENTER" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><br><br><br>___________________________________<br>FIRMA</td>
			                  </tr>
                              <tr height="22" >
 				                <td  height="28" colspan="3" align="CENTER" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><input type=hidden id="idficha" name="idficha" value="" /><input type=hidden id="txtOper" name="txtOper" value="">	
                                <input type="button" value="Imprimir " id="button1" name="button1"  class="boton" onClick="window.print();" /></td>
			                  </tr>
                              <tr height="22" >
 				                <td  height="28" colspan="3" align="left" class="etiqueta">Num. Convocatoria: <%=num_conv%><br>
 				                Fecha Inscripci&oacute;n&nbsp;&nbsp;&nbsp;: <%=fec_reg%></td>
			                  </tr>
			                </table></td>
			            </tr>
			          </table>
			        <br /></td>
			      </tr>
			    </table>
              <%' else response.Write("<div align=center ><FONT CLASS=""mensaje5"" color=MediumBlue><b><u>"&lsPEA&" tiene contrato Activo </u></b></FONT></div>" ) END IF %>
                
              </td>
	</tr>
	</table>

	<% Else%>
	 <table width=95%  border=1 background="Imagenes/fondo_di.jpg" align="center">  
  <tr>
		<td valign=top align=center>
  <table cellpadding="1" cellspacing="1" border="0" width="99%">
 	<tr>
 		<td colspan=4 align=right></td></tr>
      <tr height=5><td colspan=4 align=right></td></tr>
      <tr height=22>
        <td colspan=4 align=center><FONT CLASS='mensaje5' color=MediumBlue><b><u>Resultado de Consulta</u></b></FONT></td>
      </tr>
      <tr height=10><td colspan=4 align=right></td></tr>
      <tr height=22>
        <td colspan=4 align=center><FONT CLASS='cascade3' color=MediumBlue>No est&aacute; registrada en el sistema por favor verifique!!!</FONT></td>
		
      </tr>
      <tr height=22>
        <td colspan=4 align=center><a href="pd_modificacion_ficha.asp" class="boton">Regresar</a><br><table border=0 cellpadding="0" cellspacing="0" align="center" width="51%">
					<tr>
							         
			  </tr>
					</table></td>
      </tr>
      <tr height=1><td colspan=4 align=right></td></tr>
</table></td></tr></table>
<form>
</body>

	<%	End If
	
		RS.Close
		cnn.Close
		Set RS = Nothing
		Set cnn = Nothing
	%>
