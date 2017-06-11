 <!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
<%
Response.Expires = 0 

'id=request("id")
'p=request("p")
'dni=request("dni")

p=session("id_proyecto")

lsOpcion=request.Form("lsOpcion")
lsPaterno=request.Form("lsPaterno")
lsMaterno=request.Form("lsMaterno")
lsNombre=request.Form("lsNombre")
dni=request.Form("lsDNI")



consulta1 = "exec dbo.pa_ficha_obtenerCC  '"& lsPaterno&"','"& lsMaterno&"','"& lsNombre&"','"&DNI&"','"& lsOpcion&"', '"&p&"' "


	Set RsP = Server.CreateObject("ADODB.Recordset")
			RsP.cursorlocation=3
			RsP.Open consulta1, MiCone, 3,3
			
	If  Not RsP.BOF And Not RsP.EOF Then 
	
		id=RsP("id_convocatoriacargo")
	else
		id="00"
	end if		

RsP.Close
Set RsP = Nothing
	
	if id="00" then
	response.write ("No existe informaci&oacute;n, verifique los datos que ingres&oacute;")
	response.end()
	end if
	

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

sub generaDpto2()'RESIDENCIA
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCCDD ")
	
	Response.Write "<select disabled class=""e_combo"" style=""width:200px"" id=""txtDpto2"" name=""txtDpto2"" onChange=""generaprov2();"">"
	Response.Write " <option id=""valor_defecto"" value="&lsDptoRc&">"&lsDptoRc&"&nbsp;"&lsNomDptoR&"</option>"
	While not wRsDptoapli.EOF
	Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(1) & "</option>"
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

sub generaZona()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getZONA ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbZona"" name=""cmbZona"" >"
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


sub generaVIA()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getvia ")

	
	Response.Write "<select class=""e_combo"" style=""width:150px"" id=""cmbTipovia"" name=""cmbTipovia""  >"
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

	
	Response.Write "<select disabled class=""e_combo"" style=""width:200px"" id=""txtDpto3"" name=""txtDpto3""  onChange=""generaprov3();"" >"
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

	
	Response.Write "<select class=""e_combo"" style=""width:300px"" id=""cmbProfesion"" name=""cmbProfesion""  >"
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
	Response.Write "<select class=""e_combo"" style=""width:300px"" disabled id=""cmbUniversidad""  name=""cmbUniversidad""  >"
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


sub generaNivel ()

	set Rs = Micone.execute(" exec dbo.getNivelFicha '"&id&"' ")
	
	response.Write "<select class=""e_combo"" style=""width:170px"" id=""cmbNivelInstr"" name=""cmbNivelInstr"" onChange=""valida_nivel3(this.value); genera_grado(this.value);""  >"
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



lsOpcion="2"
lsPaterno=""
lsMaterno=""
lsNombre=""
lsDNI=request.Form("lsDNI")
lsIDProyecto=request.Form("lsIDProyecto")
		
		Set RS = Server.CreateObject("ADODB.Recordset")
		RS.CursorType = adOpenKeyset 
		
		
		lsSQL = "EXEC dbo.pa_ficha_datos_InscripcionAct '"& id&"','"& p&"','"& dni&"' "
		
	
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

	if p=34 then
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
	END IF 
	
	flag_rnp =Rs.Fields("flag_rnp")
	fechainirnp =Rs.Fields("fechainirnp")
	fechafinrnp =Rs.Fields("fechafinrnp")
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

	url="m6_Provincia_act.asp";  
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




function formateafecha2(fecha) { 

	var long = fecha.length; 
	var dia; 
	var mes; 
	var ano; 

	function IsNumeric2(valor) { 
		var log=valor.length; var sw="S"; 

		for (x=0; x<log; x++) { 
			v1=valor.substr(x,1); 
			v2 = parseInt(v1); 
			//Compruebo si es un valor numérico 
			if (isNaN(v2)) { sw= "N";} 
		} 
		if (sw=="S") {return true;} else {return false; } 
	
	} 

	if ((long>=2) && (primerslap==false)) { 
		dia=fecha.substr(0,2); 
			if ((IsNumeric2(dia)==true) && (dia<=31) && (dia!="00")) {
				fecha=fecha.substr(0,2)+"/"+fecha.substr(3,7); 
				primerslap=true; 
			} 
			else { fecha=""; primerslap=false;
			}
	} 
	else { 
		dia=fecha.substr(0,1); 
		if (IsNumeric2(dia)==false) {
			fecha="";
		} 
		if ((long<=2) && (primerslap=true)) {
			fecha=fecha.substr(0,1); primerslap=false; 
		} 
	} 

	if ((long>=5) && (segundoslap==false)) { 
		mes=fecha.substr(3,2); 
		if ((IsNumeric2(mes)==true) &&(mes<=12) && (mes!="00")) {
			fecha=fecha.substr(0,5)+"/"+fecha.substr(6,4); 
			segundoslap=true; 
		} 
		else { 
			fecha=fecha.substr(0,3);; segundoslap=false;
		} 
	} 

	else { 
		if ((long<=5) && (segundoslap=true)) { 
			fecha=fecha.substr(0,4); segundoslap=false; 
		} 
	} 

	if (long>=7) { 
		ano=fecha.substr(6,4); 
		if (IsNumeric2(ano)==false) { 
			fecha=fecha.substr(0,6); 
		} 
		else { 
			if (long==10){ 
				if ((ano==0) || (ano<1900) || (ano>2100)){
					fecha=fecha.substr(0,6); 
				} 
			} 
		} 
	} 
	if (long>=10) {
		fecha=fecha.substr(0,10); 
		dia=fecha.substr(0,2); 
		mes=fecha.substr(3,2); 
		ano=fecha.substr(6,4); 
		// Año no viciesto y es febrero y el dia es mayor a 28 

		if ( (ano%4 != 0) && (mes ==02) && (dia > 28) ) { 
			fecha=fecha.substr(0,2)+"/"; 
		} 
		if ( mes == 4 || mes == 6 || mes == 9 || mes == 11 ){ 
			if (dia==31) fecha=fecha.substr(0,2)+"/"; 
		}
	} 
	return (fecha); 
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


	</script>
<link href="Styles/inei.css" rel="stylesheet" type="text/css" />
</head>
<body >
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
                      <tr>
			            <td colspan="6"  class="mensaje5" ><% if lsactivo = "0" then %></td>
			            </tr>
                        <tr height=18>
                             <td colspan="4"  class="cabecera2"><font class="etiqueta"><strong>Cargo al que postula</strong></font></td>
					    </tr>
							<tr height=22 > 
                             <td height="28" colspan="4" align="left" nowrap id="carg" ><span class="etiqueta"><font class='titulo' >USTED EST&Aacute; POSTULANDO AL CARGO DE <%generaCargo()%>
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
                          <input type="hidden" name="testP" id="testP" value="<%=testP%>">
                          <input type="hidden" name="testC" id="testC" value="<%=testC%>">
                          <input type="hidden" name="MomentoP" id="MomentoP" value="<%=MomentoP%>">
                          <input type="hidden" name="MomentoC" id="MomentoC" value="<%=MomentoC%>">            <input type="hidden" name="sexo_ficha" id="sexo_ficha" value="<%=sexo_ficha%>">
                          <input type="hidden" name="quechua" id="quechua" value="<%=quechua%>">
                          <input type="hidden" name="Datos_adicionales" id="Datos_adicionales" value="<%=Datos_adicionales%>">
							  <input type="hidden" name="Adjuntar_cv" id="Adjuntar_cv" value="<%=Adjuntar_cv%>">
                              
                          </td>
			            </tr>
                        
 				        <tr height="18">
 				          <td  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Departamento</strong>: <%=lsNomDptoI%></font></td>
 				          <td width="20%"   background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Provinicia</strong>: <%=lsNomProvI%></font></td>
 				          <td width="21%"  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Distrito</strong>: <%=lsNomDistI%></font></td>
 				          <td colspan="2"  background="images/4.jpg"><font class="etiqueta"><strong>Confirme Distrito</strong></font><font class="etiqueta"><%=lsNomDistI%></font></td>
			            </tr>
 				        <tr height="22" >
 				          <td width="16%" height="28" align="left" nowrap="nowrap"><%generaDpto()%>
 				            <span class="etiqueta"><font class='alerta5' >(*)</font></span></td>
 				          <td align="left" id="prov" nowrap="nowrap"><span class="etiqueta"><font class='alerta5' >
 				            <select disabled name="txtProv1" id="txtProv1"  class='e_combo' style="width:200px;" >
 				              <option id="txtProv1_99" title="Todos" value="<%=lsDptoI&lsProvI&lsNomProvI%>" ><%=lsProvI%>&nbsp;<%=lsNomProvI%></option>
			              </select>
			              (*)</font></span></td>
 				          <td align="left" id="dist" nowrap="nowrap"><select name="txtDist1" id="txtDist1"  class='e_combo' style="width:150px;" disabled="disabled">
 				           <option id="txtDist1_99" title="Todos" value="<%=lsDptoI&lsProvI&lsDistI&lsNomDistI%>"><%=lsDistI%>&nbsp;<%=lsNomDistI%></option>
			              </select> 				            <span class="etiqueta"><font class='alerta5' >(*)</font></span></td>
 				          <td colspan="2" align="left" nowrap="nowrap" id="distcon"><span class="etiqueta"><font class='alerta5' >
  <select name="txtDist3" id="txtDist3"  class='e_combo' style="width:200px;" >
    <option id="txtDist1_" title="Todos" value="<%=lsDptoI&lsProvI&lsDistI&lsNomDistI%>"><%=lsDistI%>&nbsp;<%=lsNomDistI%></option>
  </select>
			              (*)</font></span></td>
			            </tr>
			          </table>
 				      <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">
 				        <tr>
 				          <td colspan="6" background="images/13.jpg"><span class="alerta4">2. Datos del postulante</span> <span ><font class="alerta5">(Escriba sus datos conforme a su DNI) </font></span></span></td>
			            </tr>
 				        <tr height="22" >
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Apellido Paterno </strong></font></td>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Apellido Materno</strong></font></td>
 				          <td colspan="2" background="images/4.jpg"><span class="cabecera2"><font class="etiqueta"><strong>Primer Nombre(DNI)</strong></font><font class="etiqueta"><strong>
 				            <input type="hidden" name="txtNombre2" id="txtNombre2"  value="" />
 				          </strong></font></span></td>
 				          <td colspan="2" width="13" background="images/4.jpg"><font class="etiqueta"><strong>Sexo</strong></font></td>
			            </tr>
 				        <tr height="22" >
 				          <td height="29" align="left"><span class="etiqueta"><font class='alerta5'>
 				            </font><font class="etiqueta"><font class='alerta5'>
 				            <input type="text" class='e_texto' id="txtApePaterno" name="txtApePaterno"  value="<%=lsApePaterno%>" maxlength="50" style="width:220" validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml; " onKeyPress="return TextUtil.allowChars(this, event)" onKeyUp="this.value=this.value.toUpperCase();" />
 				            </font></font><font class='alerta5'>(*)</font></span></td>
 				          <td align="left"><span class="etiqueta"><font class='alerta5' >
 				            <input type="text" class='e_texto' id="txtApeMaterno" name="txtApeMaterno" value="<%=lsApeMaterno%>" maxlength="50" style="width:220" validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml; " onKeyPress="return TextUtil.allowChars(this, event)" />
 				            (*)</font></span></td>
 				          <td colspan="2" align="left"><font class='alerta5' ><font class='cascade4' color="crimson">
 				            <input type="text"  class='e_texto' id="txtNombre1" name="txtNombre1" value="<%=lsNombre%>" maxlength="50" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" />
                          </font>(*)</font></td>
 				          <td align="left" colspan="2"><span class="etiqueta">
 				            <select id="cmbSexo" name="cmbSexo" class='e_combo2'>
 				              <option selected="selected" value="">Seleccione...</option>
 				              <option value='F'  <%if lsSexo = "F" Then response.Write("selected") End If %>>FEMENINO</option>
 				              <option value='M'  <%if lsSexo = "M" Then response.Write("selected") End If %>>MASCULINO</option>
			              </select>
 				            <font class='alerta5' >(*)</font></span></td>
			            </tr>
 				        <tr>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>Fecha Nacimiento </strong>(dd/mm/aaaa) </font></td>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>Pais de Nacimiento</strong></font></td>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>Dpto nacimiento</strong><%=lsNDptoN %></font></td>
 				          <td width="20%" background="images/4.jpg"><font class="etiqueta"><strong>Prov de Nacimiento</strong><%=lsNProvN%></font></td>
 				          <td colspan="2" background="images/4.jpg"><font class="etiqueta"><strong>Dist de Nacimiento</strong></font><font class="etiqueta"><%=lsNDistN%></font></td>
			            </tr>
 				        <tr>
 				          <td><span class="cascade5"><font color="crimson">&nbsp;</font></span> <font class='cascade4' color="crimson">
 				            <input  type="text" class='e_texto' id="txtDia"   name="txtDia" value="<%=lsDia%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onBlur="ValidaDia()" />
 				            </font><span class="cascade5"><font class="alerta5">&nbsp;/&nbsp;</font></span>
 				            <input type="text" class='e_texto' id="txtMes"   name="txtMes" value="<%=lsMes%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onBlur="ValidaMes()" />
 				            &nbsp;<span class="cascade5"><font class="alerta5">/</font></span>&nbsp;
 				            <input type="text" 
	class='e_texto' 
    id="txtAnio" 
    name="txtAnio" 
    value="<%=lsAnio%>" 
    maxlength="4" 
    style="width:40"  
    validchars="0123456789" 
    onkeypress="return TextUtil.allowChars(this, event)" onBlur="ValidaAnio()" />
 				            <span ><font class="alerta5" >(*) </font></span></td>
 				          <td ><%generaPAIS()%>
                          <span class="etiqueta"><font class='alerta5'>(*)</font></span></td>
 				          <td ><%generaDpto3()%></td>
 				          <td id="prov3"  ><select  disabled="disabled" name="txtProv3" id="txtProv3" class='e_combo' style="width:200px;" >
 				            <option  value="<%=lsDptoN&lsProvN&lsNProvN%>"><%=lsNProvN%></option>
			              </select></td>
 				          <td id="dist4" colspan="2"  ><select name="txtDist4" id="txtDist4" disabled="disabled" class='e_combo' style="width:150px;" >
 				            <option   value="<%=lsDptoN&lsProvN&lsDistN&lsNDistN%>"  ><%=lsNDistN%></option>
			              </select></td>
			            </tr>
 				        <tr>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;DNI</strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></td>
 				          <td width="21%" background="images/4.jpg"><font class="etiqueta"><strong>CONFIRME DNI 
 				            
 				          </strong></font></td>
 				          <td width="20%" background="images/4.jpg"><font class="etiqueta"><strong>N&ordm; RUC</strong></font></td>
 				          <td colspan="3" background="images/4.jpg"><span class="cabecera2"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>Confirme Ruc </strong></font></strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></span></td>
			            </tr>
 				        <tr>
 				          <td align="left"><span class="etiqueta"><font class='alerta5' >
 				            <input disabled="disabled" type="text" class='e_texto' style="width:100" id="txtDNI" name="txtDNI" value="<%=lsDNI%>" maxlength="8"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" />
 				            (*) </font></span><span class="etiqueta"><font class='alerta5' >&nbsp;</font></span></td>
 				          <td align="left"><input disabled="disabled" type="text" class='e_texto' style="width:100" id="txtDNI2" name="txtDNI2" value="<%=lsDNI%>" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)"  />
                          <font class='alerta5' >(*)</font></td>
 				          <td align="left"><font class='alerta5' >
 				            <input type="text" class='e_texto' style="width:100" id="txtRUC" name="txtRUC" value="<%=lsRUC%>" maxlength="11" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)"  />
 				            </font></td>
 				          <td colspan="3" align="left"><font class='alerta5' >
 				            <input type="text" class='e_texto' style="width:100" id="txtRUC2" name="txtRUC2" value="<%=lsRUC%>" maxlength="11" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" />
 				          </font></td>
			            </tr>
 				      <tr>
							  <td align="left" class="cabecera2"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>Estado Civil (DNI) </strong></font></strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong>Es Usted hijo &uacute;nico</strong></font></td>
							 <td align="left" class="cabecera2"><font class="etiqueta"><strong>Es jefe y/o responsable de su hogar</strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong><font class="etiqueta"><strong>Lengua materna que aprendi&oacute; en su ni&ntilde;ez</strong></font>&nbsp;</strong></font></td>
							  <td colspan="2" align="left" class="cabecera2"><font class="etiqueta"><strong>Lengua originaria que actualmente domina</strong></font></td>
					    </tr>
                         <tr>
							  <td height="32" align="left"><select id="txtECivil" name="txtECivil" class='e_combo2'>
 				            <option value='0' selected="selected">Seleccione...</option>
 				            <option value='1' <% if lsECivil = "1" Then response.Write("selected") End If %>>Soltero(a)</option>
 				            <option value='2' <%if lsECivil = "2" Then response.Write("selected") End If %>>Casado(a)</option>
 				            <option value='3' <%if lsECivil = "3" Then response.Write("selected") End If %>>Viudo(a)</option>
 				            <option value='4' <%if lsECivil = "4" Then response.Write("selected") End If %>>Divorciado(a)</option>
 				            <option value='5' <%if lsECivil = "5" Then response.Write("selected") End If %>>Conviviente</option>
 				            </select>
                              <span class="etiqueta"><span class="cascade5"><font class="alerta5">(*)</font></span></span></td>
                              <td align="left"><font class='cascade4' color=crimson>
							    <select id="cmbHijoUnico" name="cmbHijoUnico" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option <%if hijoUnico = "Si" Then response.Write("selected") End If %> value="1">Si</option>
							      <option  <%if hijoUnico = "No" Then response.Write("selected") End If %> value="2">No</option>
						      </select>
						      <font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='alerta5'>(*)</font></font></font></font></font></td>
                              <td align="left"><font class='cascade4' color=crimson>
							    <select id="cmbJefeHogar" name="cmbJefeHogar" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option value="1" <%if jefeCasa = "Si" Then response.Write("selected") End If %>>Si</option>
							      <option value="2" <%if jefeCasa = "No" Then response.Write("selected") End If %>>No</option>
						      </select>
						      <font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='alerta5'>(*)</font></font></font></font></font></td>
							  <td align="left"><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							    <select id="cmbLengMat" name="cmbLengMat" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
                                  <option value="9" <%if lenguaMaterna = "CASTELLANO" Then response.Write("selected") End If %>>CASTELLANO</option>
							      <option value="1" <%if lenguaMaterna = "AWAJUN" Then response.Write("selected") End If %>>AWAJUN</option>
							      <option value="2" <%if lenguaMaterna = "QUECHUA" Then response.Write("selected") End If %>>QUECHUA</option>
							      <option value="3" <%if lenguaMaterna = "AYMARA" Then response.Write("selected") End If %>>AYMARA</option>
							      <option value="4" <%if lenguaMaterna = "SHIPIBO" Then response.Write("selected") End If %>>SHIPIBO</option>
                                  <option value="5" <%if lenguaMaterna = "OTRA LENGUA NATIVA" Then response.Write("selected") End If %>>OTRA LENGUA NATIVA</option>
                                  <option value="6" <%if lenguaMaterna = "LENGUA EXTRANJERA" Then response.Write("selected") End If %>>LENGUA EXTRANJERA</option>
						      </select>
							  </font><font class='alerta5'>(*)</font></font></font></font></font></td>
							  <td colspan="2" align="left"><font class='cascade4' color=crimson>
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
							    <font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='cascade4' color=crimson><font class='alerta5'>(*)</font></font></font></font>							  </font></td>
					    <tr>
                      <td align="left" class="cabecera2"><font class="etiqueta"><strong>Otros Idiomas que domina</strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong>Nivel</strong></font></td>
                              <td align="left" class="cabecera2"><font class="etiqueta"><strong>Dominio</strong></font></td>
							 <td align="left" class="cabecera2"><%if quechua=1 then%>
                          <font class="etiqueta" id="idiomaQ" ><strong>Dominio fluido del idioma quechua</strong></font><font class="etiqueta" id="idiomaQ1" style="display:none"><strong>Dominio fluido del idioma quechua y/o aymara</strong></font> <%end if%></td>
                              <td align="left" class="cabecera2"> <font class="etiqueta" id="flag_rnp" ><strong>Tiene RNP </font><input style="width:20px; height:20px" type="checkbox"  <% if flag_rnp="1" then response.Write("checked") end if %> id="txtRnP" name="txtRnP" placeholder="I"  ></td>
                              <td align="left" class="cabecera2">&nbsp;</td>
                              <td align="left" class="cabecera2">&nbsp;</td>
			            </tr>
							  <tr>
							    <td height="32" align="left"><%Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.PA_LISTAR_IDIOMASC ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbIdiomaC"" name=""cmbIdiomaC"" >"
	 
	
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
							    <select id="cmbNivelIdioma" name="cmbNivelIdioma" class='e_combo' style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option value="E" <%if nivelIdiomaExt = "E" Then response.Write("selected") End If %>>B&aacute;sico</option>
							      <option value="L" <%if nivelIdiomaExt = "L" Then response.Write("selected") End If %>>Regular</option>
                                  <option value="A" <%if nivelIdiomaExt = "A" Then response.Write("selected") End If %>>Avanzado</option>
						      </select>
                              </font></td>
                              <td align="left"><font class='cascade4' color=crimson>
                                <select id="cmbDomIdioma" name="cmbDomIdioma" class='e_combo' style="width:100px">
                                  <option selected value="">Seleccione...</option>
                                  <option value="1" <%if dominioIdiomaExt = "1" Then response.Write("selected") End If %>>Solo lee</option>
                                  <option value="2" <%if dominioIdiomaExt = "2" Then response.Write("selected") End If %>>Solo escribe</option>
                                  <option value="3" <%if dominioIdiomaExt = "3" Then response.Write("selected") End If %>>Lee y escribe</option>
                                  <option value="4" <%if dominioIdiomaExt = "4" Then response.Write("selected") End If %>>Traduce</option>
                                </select>
                              </font></td>
                              <td align="left"><font class='cascade4' color=crimson>
							    <%if quechua=1 then%><select id="cmbIdiomaQ" name="cmbIdiomaQ" class='e_combo' onChange="validaQ(this.value)"  style="width:100px">
							      <option selected value="">Seleccione...</option>
							      <option value="1">Si</option>
							      <option value="2">No</option>
						      </select><%else%>
                              <input type=hidden id="cmbIdiomaQ" name="cmbIdiomaQ" value="0"><%end if%>
                              </font></td>
							  <td align="left">Fec. Inicio: <input type="text" class="form-control"  onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha2(this.value);" id="txtfechainirnp"
                                                   placeholder="Introduce Fecha Inicio" value='<%if fechainirnp="01/01/1900" then
							  response.write""
							  else
							  response.Write(fechainirnp)
							  end if
							  
							  %>' ></td>
							  <td align="left">  Fec. Fin: <input type="text" class="form-control"  onKeyPress="return fs_numeros(event)" onKeyUp="this.value=formateafecha2(this.value);"  id="txtfechafinrnp"
                                                   placeholder="Introduce Fecha fin" value='<%if fechafinrnp="01/01/1900" then
							  response.write""
							  else
							  response.Write(fechafinrnp)
							  end if
							  
							  %>' ></td>
							  </tr>
                        
                        
                        
 				        <tr>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Telefono </strong>(Use gui&oacute;n para los anexos Ej.5555555-5555)</font></td>
 				          <td width="21%" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Celular Celular</strong></font></td>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>Oper. Celular</strong></font></td>
 				          <td colspan="3" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>&nbsp;&nbsp;Correo Electr&oacute;nico</strong></font></strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></td>
			            </tr>
 				        <tr>
 				          <td align="left" nowrap="nowrap"><span class="etiqueta"><font class='alerta5' >
 				            <input type="text" class='e_texto' style="width:100" id="txtTelefono" name="txtTelefono" value="<%=lsTelefono%>" maxlength="10"  onKeyPress="return fs_numeros(event)" />
 				            (*)</font></span></td>
 				          <td align="left" nowrap="nowrap"><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' id="txtCelular" name="txtCelular" value="<%=lsCelular%>" maxlength="12" validchars="0123456789-" onKeyPress="return fs_numeros(event)"  />
 				          </font></td>
 				          <td align="left" nowrap="nowrap"><font class='cascade4' >
 				            <select id="cmbOperTel" name="cmbOperTel" class='e_combo2'>
 				              <option selected="selected" value="">Seleccione...</option>
 				              <option value="MOVISTAR" <% if lsOperCel = "MOVISTAR" then response.Write("selected") end if%>>MOVISTAR</option>
 				              <option value="CLARO" <% if lsOperCel = "CLARO" then response.Write("selected") end if%>>CLARO</option>
 				              <option value="RPM MOVISTAR" <% if lsOperCel = "RPM MOVISTAR" then response.Write("selected") end if%> >RPM MOVISTAR</option>
 				              <option value="RPM CLARO" <% if lsOperCel = "RPM CLARO" then response.Write("selected") end if%>>RPM CLARO</option>
 				              <option value="NEXTEL" <% if lsOperCel = "NEXTEL" then response.Write("selected") end if%>>NEXTEL</option>
			              </select>
                          <font class='alerta5' >(*)</font></font></td>
 				          <td colspan="3" align="left" nowrap="nowrap"><font class='cascade4' >
 				            <input 
									type="text" 
									class='e_texto' 
									id="txtEmail"  
									style="width:220;" 
									name="txtEmail" 
									value="<%=lsEmail%>" 
                                    onblur="acceptCorreo(this)" 
									maxlength="80" 
									validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml;@_.0123456789" />
                          </font><font class='alerta5' >(*)</font></td>
			            </tr>
			          </table>
 				      <br />
 				      <span id="msj" style="display:none;" class="mensaje1" >Este DNI ya se encuentra registrado.</span> <span id="msj2" style="display:none;" class="mensaje1">El DNI tiene como m&iacute;nimo 8 n&uacute;meros..</span>
 				      <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">
 				        <tr>
 				          <td colspan="8"   background="images/13.jpg"><span class="alerta4">3. Domicilio del Postulante</span></td>
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
 				     
 				          <td height="29" align="left" nowrap="nowrap"><span class="alerta5">
 				            <%generaVIA()%>
 				            <span class="etiqueta"><font class='alerta5'>(*)</font></span></span></td>
 				          <td height="29" align="left"><input type="text" class='e_texto' id="txtNomVia" name="txtNomVia" value="<%=trim(lsNomVia)%>" maxlength="80" style="width:220" validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml; " onKeyPress="return TextUtil.allowChars(this, event)" />
 				            <font class='alerta5'>(*)</font></td>
 				          <td height="29" align="left"><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' style="width:100" id="txtNumPuerta" name="txtNumPuerta" value="<%=lsNumPuerta%>" maxlength="8" validchars="0123456789abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml;" onKeyPress="return TextUtil.allowChars(this, event)" />
 				            </font></td>
 				          <td align="left"><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' style="width:100" id="txtNumKilometro" name="txtNumKilometro" value="<%=lsNumKilometro%>" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" />
 				            </font></td>
 				          <td align="left"><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' id="txtNumManzana" name="txtNumManzana" value="<%=lsNumManzana%>" maxlength="8" validchars="0123456789abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml;" onKeyPress="return TextUtil.allowChars(this, event)" />
 				            </font></td>
 				          <td align="left"><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' style="width:100" id="txtNumInterior" name="txtNumInterior" value="<%=lsNumInterior%>" maxlength="8" validchars="0123456789abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml;" onKeyPress="return TextUtil.allowChars(this, event)" />
 				            </font></td>
 				          <td align="left"><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' style="width:100" id="txtdepa" name="txtdepa" value="<%=lsdepa%>" maxlength="8" validchars="0123456789abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml;" onKeyPress="return TextUtil.allowChars(this, event)" />
 				            </font></td>
			            </tr>
 				        <tr >
 				          <td width="16%"  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Lote</strong></font></td>
 				          <td width="21%"  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Piso</strong></font></td>
 				          <td colspan="2" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Tipo de Zona</strong></font></td>
 				          <td colspan="3" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;</strong></font><font class="etiqueta"><strong>&nbsp;Nombre Zona</strong></font></td>
			            </tr>
 				        <tr>
 				          <td align="left"><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' id="txtNumLote" name="txtNumLote" value="<%=lsNumLote%>" maxlength="8" validchars="0123456789abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml;" onKeyPress="return TextUtil.allowChars(this, event)" />
 				            </font></td>
 				          <td align="left"><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' style="width:100" id="txtNumPiso" name="txtNumPiso" value="<%=lsNumPiso%>" maxlength="8"  onKeyPress="return TextUtil.allowChars(this, event)" />
 				            </font></td>
 				          <td colspan="2" align="left"><%generaZONA()%></td>
 				          <td colspan="3" align="left"><font class='cascade4' color="crimson">
 				            <input 
										type="text" 
										class='e_texto' 
                                        value="<%=trim(lsNomZona)%>"
										id="txtNomZona"  
										style="width:220" 
										name="txtNomZona" 
										maxlength="80" onKeyPress="return fs_alfanumericoE(event)" />
 				            </font></td>
			            </tr>
 				        <tr height="22" bgcolor="#C7EAFB">
 				          <td colspan="2" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Departamento</strong>: <%=lsNomDptoR%></font></td>
 				          <td colspan="2" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Provinicia</strong>: <%=lsNomProvR%></font></td>
 				          <td colspan="3" background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Distrito</strong>: <%=lsNomDistR%></font></td>
			            </tr>
 				        <tr height="22" >
 				          <td height="28" colspan="2" align="left"><%generaDpto2()%>
 				            <font class='alerta5' >(*)</font></td>
 				          <td height="28" colspan="2" align="left" id="prov2" ><span class="etiqueta"><font class='alerta5'>
 				            <select name="txtProv2" id="txtProv2"   class='e_combo' style="width:200px;" >
 				             <option id="txtProv2_99" title="Todos" value="<%=lsDptoRc&lsProvRc&lsNomProvR%>" ><%=lsProvRc%>&nbsp;<%=lsNomProvR%></option>
			              </select>
			              (*)</font></span></td>
 				          <td colspan="3" align="left" id="dist2" ><span class="etiqueta"><font class='alerta5' >
 				            <select name="txtDist2" id="txtDist2"  class='e_combo' style="width:200px;">
 				              <option id="txtDist2_99" title="Todos" value="<%=lsDptoRc&lsProvRc&lsDistRc&lsNomDistR%>" ><%=lsDistRc%>&nbsp;<%=lsNomDistR%></option>
			              </select>
			              (*)</font></span></td>
			            </tr>
			          </table>
 				      <br />
 				      <table cellpadding="0" cellspacing="0" border="0"  class="tablam" width="100%">
 				        <tr>
 				          <td colspan="11"  background="images/13.jpg"><span class="mensaje2">4. Perfil de postulante</span><strong><span style="color: #036; font:arial; font-size:10px;" >(Si Ud. es seleccionado , se le solicitar&aacute; que los datos que consigne a continuaci&oacute;n sean respaldados con alg&uacute;n documento. Si no presenta los documentos ser&aacute; descalificado autom&aacute;ticamente.)</span></strong></td>
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
 				          <td colspan="2" height="20" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><font class="etiqueta"><strong>Nivel de Instrucci&oacute;n: </strong></font><font class='cascade4' color="crimson"><font class='alerta5'><font class="etiqueta"><strong><font class='cascade4' color="crimson">
 				            </font><font class="etiqueta"><%=lsNivelInsM%></font><font class='cascade4' color="crimson">
 				            <input type="hidden" name="cmbTipoEstudios" id="cmbTipoEstudios" value="0" />
			              </font></strong></font></font></font></td>

 				          <td width="19%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Grado Alcanzado:</strong></font><font class='cascade4' color="crimson"><font class='alerta5'><font class="etiqueta"><strong><font class="etiqueta"><%=lsGradoM%></font></strong></font></font></font></td>
 				          <td width="16%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span><font class="etiqueta"><strong>Fecha de Expedici&oacute;n Grado</strong></font></span></td>
 				          <td width="14%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Registro de expdici&oacute;n de grado</strong></font></td>
 				          <td width="15%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Per&iacute;odo Alcanzado (en n&uacute;meros)</strong></font></td>
 				          <td width="16%"  class="cabecera2" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class="etiqueta"><strong>Per&iacute;odo</strong></font></td>
			            </tr>
 				        <tr height="22" >
 				          <td colspan="2" height="28" align="left" id="idNivel"  style="border-bottom:1px solid; border-bottom-color:#0F83E1"><font class='cascade4' color="crimson"><select id="cmbNivelInstr" name="cmbNivelInstr" class='e_combo2' style="width:150px" onChange="valida_nivel3(this.value)" >
 				              <option  value="0" <% if lsNivInst = "0" then response.Write("selected") end if%>>Seleccione...</option>
 				              <option value="03"<% if lsNivInst = "3" then response.Write("selected") end if%>>SECUNDARIA</option>
 				              <option value="04"<% if lsNivInst = "4" then response.Write("selected") end if%>>SUPERIOR</option>
 				              <option value="05"<% if lsNivInst = "5" then response.Write("selected") end if%>>SUPERIOR NO UNIVERSITARIA</option>
			              </select>
 				            </font></td>
 				          <td  height="28" align="left" id="idGrado" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; ">
<% 	if lsGrado=1 then
		lsGradoM="PREGRADO"
	elseif 	lsGrado=2 then		
		lsGradoM="EGRESADO"		
	elseif 	lsGrado=3 then		
		lsGradoM="BACHILLER"
	elseif 	lsGrado=4 then		
		lsGradoM="TITULADO"
	elseif 	lsGrado=5 then		
		lsGradoM="MAGISTER"
	elseif 	lsGrado=6 then		
		lsGradoM="DOCTORADO"
	elseif 	lsGrado=7 then		
		lsGradoM="ESTUDIO MAESTRIA"
	elseif 	lsGrado=8 then		
		lsGradoM="ESTUDIO DOCTORADO"			
	end if				
%>
 				          <select id="cmbGrado" name="cmbGrado" class="e_combo2" style="width:180px" <% if lsNivInst = "3" then response.Write("disabled") end if%> onChange="validar_grado(this.value)" >
 				              <option value="0"<% if lsGrado  = "0" then response.Write("selected") end if%>>Seleccione...</option>
 				              <option value="01"<% if lsGrado  = "1" then response.Write("selected") end if%>>PREGRADO</option>
 				              <option value="02"<% if lsGrado  = "2" then response.Write("selected") end if%>>EGRESADO</option>
 				              <option value="03"<% if lsGrado  = "3" then response.Write("selected") end if%>>BACHILLER</option>
 				              <option value="04"<% if lsGrado  = "4" then response.Write("selected") end if%>>TITULADO</option>
 				              <option value="05"<% if lsGrado  = "5" then response.Write("selected") end if%>>MAGISTER</option>
 				              <option value="06" <% if lsGrado  = "6" then response.Write("selected") end if%>>DOCTORADO</option>
 				              <option value="07" <% if lsGrado  = "7" then response.Write("selected") end if%>>ESTUDIOS DE MAESTRIA</option>
 				              <option value="08" <% if lsGrado  = "8" then response.Write("selected") end if%>>ESTUDIOS DE DOCTORADO</option>
			              </select></td>
 				          <td  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="cascade5"><font color="crimson">&nbsp;</font></span> <font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' id="txtDia2" <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%>   name="txtDia2" value="<%=lsDia2%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onBlur="ValidaDia()" />
 				            </font><span class="cascade5"><font class="alerta5">&nbsp;/&nbsp;</font></span><font class='cascade4' color="crimson">
 				              <input type="text" class='e_texto' id="txtMes2" <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%>   name="txtMes2" value="<%=lsMes2%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onBlur="ValidaMes()" />
 				              &nbsp;</font><span class="cascade5"><font class="alerta5">/</font></span><font class='cascade4' color="crimson">&nbsp;
 				                <input type="text" class='e_texto' <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%> id="txtAnio2" name="txtAnio2" value="<%=lsAnio2%>" maxlength="4" style="width:40" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onBlur="ValidaAnio2();" />
 				                </font></td>
 				          <td  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='alerta5' ><font class='cascade4' color=crimson>
 				            <input 
										type="text" 
										class='e_texto' 
										id="txtNum_reg_grado" 
										name="txtNum_reg_grado" 
										value="<%=Num_reg_grado%>" 
										maxlength="50" 
										style="width:100" 
										onKeyPress="return fs_numeros(event)" 
										>
 				          </font></font></td>
 				          <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta"><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' style="width:100" <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%> id="txtperioalc" name="txtperioalc" value="<%=lsperioAlc%>"  size="2" maxlength="2" validchars="0123456789;" onKeyPress="return TextUtil.allowChars(this, event)" />
 				            </font></span></td>
 				          <td align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><font class='cascade4' color="crimson">
 				            <select id="cmbPeriodo" name="cmbPeriodo" class='e_combo2' <% if lsNivInst = "3" then response.Write("disabled=""disabled""") end if%>>
 				              <option value="0" <% if lsTiPerAlc  = "0" then response.Write("selected") end if%>>Seleccione...</option>
 				              <option value="01"<% if lsTiPerAlc  = "1" then response.Write("selected") end if%>>CICLO</option>
 				              <option value="02"<% if lsTiPerAlc  = "2" then response.Write("selected") end if%>>MES</option>
 				              <option value="03"<% if lsTiPerAlc  = "3" then response.Write("selected") end if%>>A&Ntilde;O</option>
 				              <option value="04"<% if lsTiPerAlc  = "4" then response.Write("selected") end if%>>TRIMESTRE</option>
 				              <option value="05"<% if lsTiPerAlc  = "5" then response.Write("selected") end if%>>SEMESTRE</option>
 				              <option value="06"<% if lsTiPerAlc  = "6" then response.Write("selected") end if%>>CUATRIMESTRE</option>
 				              <option value="07"<% if lsTiPerAlc  = "7" then response.Write("selected") end if%>>MODULO</option>
 				              <option value="08"<% if lsTiPerAlc  = "8" then response.Write("selected") end if%>>NIVEL</option>
			              </select>
 				            </font></td>
			            </tr>
 				        <tr height="22" >
 				          <td colspan="2"   class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><font class="etiqueta"><strong>Profesi&oacute;n: </strong></font></td>
 				          <td   colspan="3" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><font class="etiqueta"><strong>Universidad: </strong></font></td>
 				          <td colspan="2" class="cabecera2"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; BORDER-RIGHT: #0F83E1 1px solid;" ><span><font class="etiqueta"><strong>Centro de estudios</strong></font></span></td>
			            </tr>
 				        <tr height="22" >
 				          <td height="28" colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="etiqueta" style="display:block">
 				            <%generaprofesion()%>
 				            <font class='alerta5' > (*)</font></span></td>
 				          <td  height="28" colspan="3" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta">
 				            <%generaUniversidad()%>
 				            </span></td>
 				          <td colspan="2" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1; "><span class="etiqueta">
 				            <input name="txtLugEst" type="text" <% if lsNivInst = "4" then response.Write("disabled") end if%>  class='e_texto' id="txtLugEst"  style="width:200" onKeyPress="return TextUtil.allowChars(this, event)" value="<%=lsLugEst%>" maxlength="60"   validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml;0 " />
 				            </span></td>
			            </tr>
			          </table>
                      
     <%if Datos_adicionales=0 then %>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3" >
							    <tr>
							      <td    class="cabecera2" ><font class="etiqueta"><strong>Experiencia </strong></font><font class="etiqueta"><strong>
							        <input type="hidden" name="txtExpFormacion" id="txtExpFormacion" value="">
							      </strong></font><font class="etiqueta"><strong>
							      <input type="hidden" name="txtExpAplicacion" id="txtExpAplicacion" value="">
							      </strong></font><font class="etiqueta"><strong>
							      <input type="hidden" name="txtNombreFormacion" id="txtNombreFormacion" value="">
							      </strong></font><font class="etiqueta"><strong>
							      <input type="hidden" name="txtNombreAplicacion" id="txtNombreAplicacion" value="">
							      </strong></font><font class="etiqueta"><strong>
							      <input type="hidden" name="txtTiempoFormacion" id="txtTiempoFormacion" value="">
							      </strong></font><font class="etiqueta"><strong>
							      <input type="hidden" name="txtTiempoAplicacion" id="txtTiempoAplicacion" value="">
							      <input type="hidden" name="txtCargo1" id="txtCargo1" value="">
							      <input type="hidden" name="txtCargo2" id="txtCargo2" value="">
							      <input type="hidden" name="txtEmpCargo1" id="txtEmpCargo1" value="">
							      <input type="hidden" name="txtEmpCargo2" id="txtEmpCargo2" value="">
							      <input type="hidden" name="txtTiempoAplicacion6" id="txtTiempoAplicacion6" value="">
							      <input type="hidden" name="txttiempoCargo1" id="txttiempoCargo1" value="">
							      <input type="hidden" name="txttiempoCargo2" id="txttiempoCargo2" value="">
					      </strong></font></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><span class="cabecera2" ><font class="etiqueta"><strong>A&ntilde;os</strong><br>
						          Ejm. 3 a&ntilde;o(s)</font></span></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>&nbsp;Meses</strong><br>6 mes(es)</font></td>
						        </tr>
							    <tr >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid">A&ntilde;os o meses de experiencia en actividades en general: </td>
							      <td width="253"  height="30"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span ><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGenAnio" name="txtExpGenAnio" value="<%=lsExpGen_anio%>" onBlur="valor_ano(this.value,this.id)" maxlength="2" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" />
						          <font class="etiqueta">a&ntilde;o(s)</font></font></span></td>
							      <td width="253"   align="left" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGenMeses" name="txtExpGenMeses" value="<%=lsExpGen_meses%>" onBlur="valor_mes(this.value,this.id)" maxlength="2" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" />
						          <font class="etiqueta">mes(es)</font></font></span></td>
						        </tr>
							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"> <% if experiencia_1="" or isnull(experiencia_1) then %>
                                  A&ntilde;os o meses  de experiencia en trabajos de Campo (Censo y/o Encuestas)<%else%><%=experiencia_1%><%end if%></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpCampoAnio" name="txtExpCampoAnio" value="<%=lsExpCampoanio%>" maxlength="2" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" />
						          <font class="etiqueta">a&ntilde;o(s)</font></font></span></td>
							      <td height="29"  align="center" id="proy" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpCampoMeses" name="txtExpCampoMeses" value="<%=lsExpCampomeses%>"maxlength="2" onBlur="valor_mes(this.value,this.id)" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" />
						          <font class="etiqueta">mes(es)</font><font class='cascade4' color=crimson>
						          <input name="txtCapaAnio" type="hidden" id="txtCapaAnio" value="0">
                                  <input type="hidden" name="txtCapaMeses" id="txtCapaMeses" value="0">
						          </font></font></span></td>
						        </tr>
							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid"><% if experiencia_2="" or isnull(experiencia_2) then %>A&ntilde;os o meses  de experiencia en manejo de grupos:<%else%><%=experiencia_2%><%end if%></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtExpGrupoAnio" name="txtExpGrupoAnio" value="<%=lsExpGrupoanio%>" maxlength="2" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" />
						          <font class="etiqueta">a&ntilde;o(s)</font></font></span></td>
							      <td align="left" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
						          <input type="text" class='e_texto'  style="width:50" id="txtExpGrupoMeses" name="txtExpGrupoMeses" value="<%=lsExpGrupomeses%>" maxlength="2" onBlur="valor_mes(this.value,this.id)" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" />
						          <font class="etiqueta">mes(es)</font>
						          <input name="txtDocAnio2" type="hidden" id="txtDocAnio" value="0">
                                  <input type="hidden" name="txtCapaAnio2 " id="txtCapaAnio2" value="0">
							      </font></span></td>
						        </tr>
				      </table>
                                <%else%>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3" >
							    <tr>
							      <td width="506"   class="cabecera2" ><font class="etiqueta"><strong>Experiencia </strong></font></td>
							      <td align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Descripci&oacute;n</strong></font></td>
							      <td width="253"  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Nombre de la Instituci&oacute;n
							        <input type="hidden" name="txtExpGenAnio" id="txtExpGenAnio" value="">
						          <input type="hidden" name="txtExpGenMeses" id="txtExpGenMeses" value="">
						          <input type="hidden" name="txtExpCampoAnio" id="txtExpCampoAnio" value="">
						          <input type="hidden" name="txtExpCampoMeses" id="txtExpCampoMeses" value="">
						          <input type="hidden" name="txtExpGrupoAnio" id="txtExpGrupoAnio" value="">
						          <input type="hidden" name="txtExpGrupoMeses" id="txtExpGrupoMeses" value="">
							      </strong></font></td>
							      <td width="253"  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Tiempo de Duraci&oacute;n en meses</strong></font></td>
						        </tr>
							    
							    <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid">Nombre de la &uacute;ltima Experiencia en operativo de Aplicaci&oacute;n de Instrumentos en campo</td>
							      <td  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtExpAplicacion" name="txtExpAplicacion" value="<%=ExpAplicacion%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
						          </font></font></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtNombreAplicacion" name="txtNombreAplicacion" value="<%=NombreAplicacion%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td align="left" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtTiempoAplicacion" name="txtTiempoAplicacion" value="<%=TiempoAplicacion%>" maxlength="3" onKeyPress="return fs_numeros(event)" >
							        <input name="txtDocAnio2" type="hidden" id="txtDocAnio" value="0">
                                    <input type="hidden" name="txtCapaAnio2" id="txtCapaAnio2 " value="0">
							      </font></span></td>
						        </tr>
                                <tr>
							      <td  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid">&Uacute;ltima experiencia de aula o proyectos de Formaci&oacute;n </td>
							      <td  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtExpFormacion" name="txtExpFormacion" value="<%=ExpFormacion%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
						          </font></font></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtNombreFormacion" name="txtNombreFormacion" value="<%=NombreFormacion%>" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td height="29"  align="center" id="proy" class="etiqueta" style="border-bottom:1px solid"><span class="etiqueta"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtTiempoFormacion" name="txtTiempoFormacion" value="<%=TiempoFormacion%>" maxlength="3"  onKeyPress="return fs_numeros(event)" >
							        <input name="txtCapaAnio" type="hidden" id="txtCapaAnio" value="0">
                                    <input type="hidden" name="txtCapaMeses" id="txtCapaMeses" value="0">
							      </font></span></td>
						        </tr>
                                
							    </table>
                                <%end if%>                 
                      
       <br>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3">
                                <tr>
                                  <td colspan="5"   class="cabecera2"><font class="etiqueta"><strong>&nbsp;Proyectos en el INEI</strong></font></td>
                        </tr>
                                   <tr  >
                                   
							      <td width="256"  height="30"  align="center" class="etiqueta" >&iquest;Ha participado en el INEI?</td>
                                  
                                  
							      <td width="199" height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><font class='cascade4' color="crimson">
							        <select id="txtIneiProc" name="txtIneiProc" class="e_combo" style="width:60" onChange="javascript:cambiarText('2',this.value,'txtProyecto')">
							          <option value="" >...</option>
							          <option value="1"  <%if lsIneiProc ="1" then response.Write("selected") END IF%>>Si</option>
							          <option value="2"  <%if lsIneiProc ="2" then response.Write("selected") END IF%>>No</option>
						          </select>
							      </font></td>
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta" >&iquest;&Uacute;ltimo proyecto que particip&oacute; en INEI?</span></td>
                                  
							      <td width="325" height="33" colspan="2"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><div id="proy">
							        <select id="txtProyecto" name="txtProyecto"  class='e_combo' >
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
						            </select>
							      </div></td></tr>
                                  <tr>
                                  <td width="256"  height="30"  align="center" class="etiqueta" >&iquest;&Uacute;ltimo a&ntilde;o que particip&oacute; en INEI?</td>
                                  
                                  
							      <td height="29"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><input type="text" class='e_texto' id="txtIneiAnio" name="txtIneiAnio" maxlength="4" value="<%=lsIneiAnio%>" style="width:40" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" /></td>
                                  
							      <td width="332"  height="29"  align="center" class="etiqueta" style="border-bottom:1px solid">&iquest;&Uacute;ltimo cargo que particip&oacute; en INEI?</td>
							      <td width="325" height="33" colspan="2"  align="center" class="etiqueta" style="border-bottom:1px solid; border-left:1px solid; border-left-color:#0F83E1;"><%Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getcargo1 ")

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtCargoInei"" name=""txtCargoInei"" >"
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
	Set wRsDptoapli = Nothing%></td>
    </tr>
                      </table>
                                       
                                        <%  if Datos_adicionales=1 then %>             
                                  
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
                                  <td  height="30" colspan="3"  align="center" class="etiqueta"  style="border-bottom:1px solid">Cargo Desempe&ntilde;ado (2) :<span class="cabecera2"><font class="etiqueta"><strong><span class="etiqueta" style="border-bottom:1px solid"><input type="text" class='e_texto'  style="width:300" id="txtCargo2" name="txtCargo2" value="<%=Cargo2%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" ></span></strong></font></span></td>
                                  <td height="30" colspan="2"  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
                                    <input type="text" class='e_texto'  style="width:300" id="txtEmpCargo2" name="txtEmpCargo2" value="<%=EmpCargo2%>"  maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
                                  </font></td>
                                  <td width="253"   align="left" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txttiempoCargo2" name="txttiempoCargo2"value="<%=tiempoCargo2%>" maxlength="2" onKeyPress="return fs_numeros(event)" >
							      </font><font class="etiqueta">Meses</font></td>
                                  </tr>
                      </table>
                                  
                                 <%end if %> 
                                  <br>
	                  <span class="etiqueta" style="border-bottom:1px solid">
	                  <select name="cmbdisposicion" id="cmbdisposicion" class="e_combo" style="width:120" onChange="validaDis(this.value)" >
 				                    <option value="0"<% if lsdisponi = 0 then response.Write("selected") end if%>>Seleccione....</option>
 				                    <option value="1" <% if lsdisponi = 1 then response.Write("selected") end if%>>S&Iacute;</option>
 				                    <option value="2"  <% if lsdisponi = 2 then response.Write("selected") end if%>>NO</option>
                      </select>
	                  </span>
	                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla3" >
 				                             <tr>
             <td  height="33" colspan="6" background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><font class="etiqueta"><strong>5. Capacitaci&oacute;n</strong></font></td></tr>
<tr>
 <td width="320"   class="cabecera2"><font class="etiqueta"><strong>&Uacute;ltima capacitaci&oacute;n (Registre lo solicitado en la convocatoria)</strong></font></td>
							      <td width="311"   class="cabecera2"><font class="etiqueta"><strong>Nombre de la Instituci&oacute;n o Empresa</strong></font></td>
							      <td width="140" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Inicio</strong><br>(dd/mm/aaaa)</font></td>
							      <td width="123" align="center"   class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>Fecha Fin</strong><br>(dd/mm/aaaa)</font></td>
							      <td  class="cabecera2" style="border-left:1px solid; border-left-color:#0F83E1;"><font class="etiqueta"><strong>&nbsp;Horas Lectivas</strong></font></td>
		                </tr>
                                
                                <tr >
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><span class="etiqueta" style="border-bottom:1px solid"><input type="text" class='e_texto'  style="width:300" id="txtCurso" name="txtCurso" value="<%=CursoCapacitacion%>" onBlur="valor_ano(this.value,this.id)" maxlength="500" onKeyPress="return fs_alfanumerico(event)" >
							      </span></td>
							      <td  height="29"  align="center" class="etiqueta"  style="border-bottom:1px solid"><font class='cascade4' color=crimson><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:300" id="txtlugar_capacitacion" name="txtlugar_capacitacion" value="<%=lugar_capacitacion%>"  maxlength="300" onKeyPress="return fs_alfanumerico(event)" >
							      </font></font></td>
							      <td  align="center" style="border-bottom:1px solid"> <font class='cascade4' color=crimson>
                                  <input type="text" class='e_texto' id="DIcurso"  name="DIcurso" value="<%=diaI%>" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)"><font class="alerta5">&nbsp;/&nbsp;</font>
                                  </font><font class='cascade4' color=crimson><input type="text" class='e_texto' id="MIcurso"   name="MIcurso" value="<%=mesI%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">&nbsp;</font><font class="alerta5">/</font>&nbsp;<font class='cascade4' color=crimson><input type="text" class='e_texto' id="AIcurso" name="AIcurso" value="<%=anioI%>" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio3();">
</font></span></td>
							      <td height="30"  align="center" style="border-bottom:1px solid"><font class='cascade4' color=crimson><input type="text" class='e_texto' id="DFcurso"   name="DFcurso" value="<%=diaF%>" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)"> </font><font class="alerta5">&nbsp;/&nbsp;</font><font class='cascade4' color=crimson><input type="text" class='e_texto' id="MFcurso" name="MFcurso" value="<%=mesF%>" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">
						          </font><font class="alerta5">&nbsp;/&nbsp;</font><font class='cascade4' color=crimson>
						          <input type="text" class='e_texto' id="AFcurso" name="AFcurso" value="<%=anioF%>" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio4();">
</font></span></td>
							      <td width="94"   align="left" style="border-bottom:1px solid"><font class='cascade4' color=crimson>
							        <input type="text" class='e_texto'  style="width:50" id="txtHorasLectivas" name="txtHorasLectivas" value="<%=HorasLectivas%>" maxlength="4" onKeyPress="return fs_numeros(event)" >
							      <span class="etiqueta">Horas</span></font></td>
                                
                                </tr>
                                <%'end if%>
                           <tr style="display:none">
                                <td colspan="6"   class="cabecera2"><font class="etiqueta"><strong>Dato Complementario: Este dato ser&aacute; usado por Usted en los siguientes procesos de selecci&oacute;n. Es de uso exclusivo y debe mantenerlo en reserva.</strong></font></td>
				        </tr>
                                
                                <tr  style="display:none">
							      <td  height="30" colspan="6"  align="center" class="etiqueta"  style="border-bottom:1px solid">Fecha de nacimiento de su Padre o madre:<font class='cascade4' >
							        <input type="text" class='e_texto' id="DiaComp"  name="DiaComp" value="" maxlength="2" style="width:20" onKeyPress="return fs_numeros(event)">
							    /							      <input type="text" class='e_texto' id="MesComp"   name="MesComp" value="" maxlength="2" style="width:20" validchars="0123456789" onKeyPress="return fs_numeros(event)">
							      /
							      <input type="text" class='e_texto' id="AnioComp" name="AnioComp" value="" maxlength="4" style="width:40" onKeyPress="return fs_numeros(event)" onBlur="ValidaAnio5();">						      </font></td>
						        </tr>
                        <tr  style="display:none">
 				          <td  height="33" colspan="6"  class="cabecera2"><font class="etiqueta"><strong>Otros Aspectos </strong></font></td>
			            </tr>
 				        <tr  style="display:none">
 				          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Disposici&oacute;n para trabajar a tiempo completo
			              <font class='alerta5' >(*)</font></td>
			            </tr>
                        <%IF id_proyecto=1 THEN%>
                                <tr  style="display:none">
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Esta dispuesta a trabajar en horarios de trabajo que incluya s&aacute;bados, domingos y feriados
							            <select name="cmbdispoSabDom" id="cmbdispoSabDom" class="e_combo" style="width:120" onChange="validadom(this.value)" >
							              <option value="0">Seleccione....</option>
							              <option value="1">S&Iacute;</option>
							              <option value="2">NO</option>
						              </select>
						           <font class='alerta5'>(*)</font></td>
					            </tr>
                                <tr  style="display:none">
							          <td  height="33" colspan="6"  align="center" class="etiqueta" style="border-bottom:1px solid">Se compromete usted adecuarse al horario de los informantes (lo que implica visitas en las noches o muy temprano) 
							            <select name="cmbdCompromiso" id="cmbdCompromiso" class="e_combo" style="width:120" onChange="validaHorario(this.value)" >
							              <option value="0">Seleccione....</option>
							              <option value="1">S&Iacute;</option>
							              <option value="2">NO</option>
						              </select>
						           <font class='alerta5'>(*)</font></td>
					            </tr>
                                <%ELSE%>
                                <input type="hidden" name="cmbdispoSabDom" id="cmbdispoSabDom" VALUE="0">
								            <input type="hidden" name="cmbdCompromiso" id="cmbdCompromiso" value="0">
                                <%END IF%>
 				        <tr height="3">
 				          <td colspan="6" align="left"><div class="CLS"></div>
 				            <table cellpadding="0" cellspacing="0" border="0"  width="100%" class="tablam" style="BORDER-TOP: #0F83E1 1px solid; BORDER-LEFT: #0F83E1 1px solid;BORDER-RIGHT: #0F83E1 1px solid" >
 				              <tr  style="display:none">
 				                <td colspan="8" background="images/1.jpg" style="border-bottom:1px solid; border-bottom-color:#0F83E1; "><span class="mensaje2">Declaraci&oacute;n de Veracidad de datos</span></td>
			                  </tr>
 				              <tr height="22"  style="display:none" >
 				                <td width="79%"  height="28" align="left" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><span class="etiqueta">Declaro bajo juramento que los datos consignados en la presente ficha de inscripci&oacute;n, corresponden a la verdad; los mismos que podr&aacute;n ser verificados con los documentos sustentatorios de mi Curriculum Vitae, conforme presente a la instituci&oacute;n. <font class='cascade4' color="crimson"></font></span></td>
 				                <td width="21%"  height="28" colspan="2" align="left"  style="border-bottom:1px solid; border-bottom-color:#0F83E1; border-left:1px solid; border-left-color:#0F83E1;"><span class="etiqueta"><font class='alerta5' >
 				                  <select id="cmbVeracidad" name="cmbVeracidad" class="e_combo" style="width:120"  >
 				                    <option  value="0">Seleccione...</option>
 				                    <option value="1" <% if lsvaraci = 1 then response.Write("selected") end if%> >SI</option>
 				                    <option value="2" <% if lsvaraci= 2 then response.Write("selected") end if%> >NO</option>
			                    </select>
 				                  (*)</font></span></td>
			                  </tr>
         <tr height="22" >
 				                <td  height="28" colspan="3" align="CENTER" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><input type=hidden id="idficha" name="idficha" value="" /><input type=hidden id="txtOper" name="txtOper" value="">	
                                <input type="button" value="Actualizar " onClick="javascript:enviarFichaActualiza(2)" id="button1" name="button1"  class="boton" /></td>
			                  </tr>
			                </table></td>
			            </tr>
			          </table>
			        <br /></td>
			      </tr>
			    </table>
              <% else response.Write("<div align=center ><FONT CLASS=""mensaje5"" color=MediumBlue><b><u>"&lsPEA&" tiene contrato Activo </u></b></FONT></div>" ) END IF %>
                
              </td>
	</tr>
	</table>

	<%Else%>
	 <table width=95% height=70%  border=1 background="Imagenes/fondo_di.jpg" align="center">  
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
	
		cnn.Close
		Set cnn = Nothing
	%>
