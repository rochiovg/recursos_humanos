 <!--#include file="Include/pd_funcion.asp"--> 
<!--#include file="conexion.asp"--> 
<%
id_proyecto=session("id_proyecto")


strUsuario=   Session("txtUsuarioValido") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR") 

Response.Expires = 0 
sub generaDpto()'LUG 
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_CCDD_CONVO_recluta")


	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto1"" name=""txtDpto1"" onChange=""generaprov();"">"
	Response.Write " <option id=""valor_defecto"" value="&lsDptoI&lsNomDptoI&">"&lsDptoI&"&nbsp;"&lsNomDptoI&"</option>"

	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaDpto5()'LUG 
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.uspGet_CCDD_CONVO_RECLUTA2")


	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDptoAC1"" name=""txtDptoAC1"" onChange=""generaprov5();"">"
	'Response.Write " <option id=""valor_defecto"" value="&lsDptoI&lsNomDptoI&">"&lsDptoI&"&nbsp;"&lsNomDptoI&"</option>"

	While not wRsDptoapli.EOF
		Response.Write "<option value=""" & wRsDptoapli("ccdd") & """>"& Server.HtmlEncode(wRsDptoapli("ccdd")&" "&wRsDptoapli("nombre")) & "</option>"
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>"
    response.Write "<span class=""alerta5"">(*)</span>"
	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub


sub generaDpto2()'RESIDENCIA
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" exec dbo.getCCDD ")
	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto2"" name=""txtDpto2"" onChange=""generaprov2();"">"
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

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbpais"" name=""cmbpais"" onChange=""validanac(this.value);"" >"
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

	
	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""txtDpto3"" name=""txtDpto3""  onChange=""generaprov3();"" >"
	Response.Write " <option id=""0"" value="""">Seleccione...</option>"
	While not wRsDptoapli.EOF
	IF wRsDptoapli(0) = lsDptoN&lsNDptoN  THEN 
		Response.Write "<option value=""" & wRsDptoapli(0) & """ SELECTED >" &wRsDptoapli(0) & "</option>"
	ELSE 
			Response.Write "<option value=""" & wRsDptoapli(0) & """>" &wRsDptoapli(0) & "</option>"
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

sub generaCargo()
			
	Response.ContentType="text/html; charset=iso-8859-1"
	set wRsDptoapli = Micone.execute(" EXEC dbo.uspget_CargoConvocatoria2 '"&lsDptoI&"' ,'"&lsProvI&"','"&lsDistI&"','' ")
	

	Response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo"" name=""cmbCargo"" onChange=""valida_nivel2(this.value);""  >"
	Response.Write " <option value=""0"">Seleccione...</option>"
	While not wRsDptoapli.EOF
	
	if wRsDptoapli(7)&wRsDptoapli(4)&wRsDptoapli(5) = lscargocombo then 
			Response.Write "<option value=""" &wRsDptoapli(7)&"*"& wRsDptoapli(4)&"*"&wRsDptoapli(5) & """ selected >" &wRsDptoapli(6) & "</option>"
	else
		Response.Write "<option value=""" & wRsDptoapli(7)&"*"&wRsDptoapli(4)&"*"&wRsDptoapli(5)  & """>"&wRsDptoapli(6)& "</option>"
	end if
		wRsDptoapli.MoveNext
	Wend
	Response.Write "</select>" 

	wRsDptoapli.Close
	Set wRsDptoapli = Nothing
	
End sub

sub generaCargo5()
			
val1=Request.Form("varDpto")
val2=Request.Form("varProv")
val3=Request.Form("varDist")
valor1=mid(val1,1,2)
valor2=mid(val2,3,2)
valor3=mid(val3,5,2)
	
	Response.ContentType="text/html; charset=iso-8859-1"
	set Rs = Micone.execute(" exec uspget_CargoConvocatoria2  '"&valor1&"' ,'"&valor2&"','"&valor3&"','' ")


	response.Write "<select class=""e_combo"" style=""width:200px"" id=""cmbCargo2"" name=""cmbCargo2""  onchange=""TraerPresupuestoConv()"">"

	While Not Rs.EOF
		response.Write "<option value=""" &Rs("id_ConvocatoriaCargo") & """>" & Server.HtmlEncode(Rs("id_ConvocatoriaCargo")&" "&Rs("detalle")) & "</option>"
		
		Rs.MoveNext
	Wend
	response.Write "</select>"
	response.Write "<span class=""alerta5""><font class='cascade4' >(*)</font></span>"
	Rs.Close
	Set Rs = Nothing
	Micone.Close
	Set Micone = Nothing
	
End sub





lsid_ConvocatoriaCargo=request.Form("id_ConvocatoriaCargo")

lsOpcion=request.Form("lsOpcion")
lsPaterno=request.Form("lsPaterno")
lsMaterno=request.Form("lsMaterno")
lsNombre=request.Form("lsNombre")
lsDNI=request.Form("lsDNI")

		
		Set RS = Server.CreateObject("ADODB.Recordset")
		RS.CursorType = adOpenKeyset 
		
		
		lsSQL = "EXEC dbo.usp_MODMosDatos '"& lsPaterno&"','"& lsMaterno&"','"& lsNombre&"','"& lsDNI&"','"& lsOpcion&"', '"&id_proyecto&"' "	
		
		
	Call getRS(RS, lsSQL)




response.ContentType="text/html; charset=iso-8859-1"
lsPaterno=request.Form("lsPaterno")
lsMaterno=request.Form("lsMaterno")
lsNombre=request.Form("lsNombre")
lsDNI=request.Form("lsDNI")

IF (lsPaterno <> "" AND  lsMaterno <> ""  AND  lsNombre <> "" AND lsDNI ="") THEN

set Rs5 = Server.Createobject("ADODB.Recordset")
	
sql5 = " Exec dbo.usp_VerFichaNombre '"&lsPaterno&"','"&lsMaterno&"','"&lsNombre&"', '"&id_proyecto&"';"



Rs5.cursorlocation=3
Rs5.Open sql5, MiCone,3,3


if Rs5.RecordCount>0 then

	
	ID_PERMC=Rs5("ID_PER")
    dniMC=Rs5("DNI")
	codigoMC=Rs5("codigo")
	ccdd_iMC=Rs5("ccdd_i")
	ccpp_iMC=Rs5("ccpp_i")
	ccdi_iMC=Rs5("ccdi_i")	
    ape_paterno=Rs5("ape_paterno")
	ape_materno=Rs5("ape_materno")
	nombreMC=Rs5("nombre")
	nombre2MC=Rs5("nombre2")	
	Activo=Rs5("Activo")
	
	fecha_RegistroCVMC=Rs5("fecha_RegistroCV")
	id_CuentaCVMC=Rs5("id_CuentaCV")   
    UsuarioAsisCapaMC=Rs5("UsuarioAsisCapa")
	UsuarioseleccionMC=Rs5("Usuarioseleccion")

	dptoMC=Rs5("dpto")
	provMC=Rs5("prov")
	distMC=Rs5("dist")
	puestoMC=Rs5("detalle")

	id_ConvocatoriaCargoMC=Rs5("id_ConvocatoriaCargo")
	rucMC=Rs5("ruc")
	reniecMC=Rs5("reniec")
	desc_CargoFuncionalMC=Rs5("desc_CargoFuncional")
	cargoperativo=Rs5("cargoper")
	
else
	
	ID_PERMC=""
    dniMC=""
	
	codigoMC=""
	ccdd_iMC=""
	ccpp_iMC=""
	ccdi_iMC=""
	
    ape_paterno=""
	ape_materno=""
	nombreMC=""	
	nombre2MC=""
	Activo=""
	
	dptoMC=""
	provMC=""
	distMC=""
	puestoMC=""
    rucMC=""
	reniecMC=""
	desc_CargoFuncionalMC=""
	cargoperativo=""
	
	
	
end if


	
Set RS5=Nothing

END IF

IF (lsDNI <> "" AND lsPaterno = "" AND  lsMaterno = ""  AND  lsNombre = "") THEN

response.ContentType="text/html; charset=iso-8859-1"


set Rs5 = Server.Createobject("ADODB.Recordset")
	

sql5 = " Exec dbo.usp_ValidarEstadoReniecDNI '"&lsDNI&"', '"&id_proyecto&"';"


response.Write(sql5)
response.End()



Rs5.cursorlocation=3
Rs5.Open sql5, MiCone,3,3


if Rs5.RecordCount>0 then

	
	ID_PERMC=Rs5("ID_PER")
    dniMC=Rs5("DNI")
	codigoMC=Rs5("codigo")
	ccdd_iMC=Rs5("ccdd_i")
	ccpp_iMC=Rs5("ccpp_i")
	ccdi_iMC=Rs5("ccdi_i")	
    ape_paterno=Rs5("ape_paterno")
	ape_materno=Rs5("ape_materno")
	nombreMC=Rs5("nombre")
	nombre2MC=Rs5("nombre2")	
	Activo=Rs5("Activo")
	
	fecha_RegistroCVMC=Rs5("fecha_RegistroCV")
	id_CuentaCVMC=Rs5("id_CuentaCV")   
    UsuarioAsisCapaMC=Rs5("UsuarioAsisCapa")
	UsuarioseleccionMC=Rs5("Usuarioseleccion")

	dptoMC=Rs5("dpto")
	provMC=Rs5("prov")
	distMC=Rs5("dist")
	puestoMC=Rs5("detalle")

	id_ConvocatoriaCargoMC=Rs5("id_ConvocatoriaCargo")
	rucMC=Rs5("ruc")
	reniecMC=Rs5("reniec")
	desc_CargoFuncionalMC=Rs5("desc_CargoFuncional")
	cargoperativo=Rs5("cargoper")
else
	ID_PERMC=""
    dniMC=""
	
	codigoMC=""
	ccdd_iMC=""
	ccpp_iMC=""
	ccdi_iMC=""
	
    ape_paterno=""
	ape_materno=""
	nombreMC=""	
	nombre2MC=""
	Activo=""
	
	dptoMC=""
	provMC=""
	distMC=""
	puestoMC=""
    rucMC=""
	reniecMC=""
    desc_CargoFuncionalMC=""
	cargoperativo=""
end if


	
Set RS5=Nothing


END IF	


%>


<%If Not RS.BOF And Not RS.EOF Then	

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

	%><head>

 <link rel="shortcut icon" href="images/favicon.ico" />

	<link rel="stylesheet" type="text/css" href="Styles/inei.css">
 <script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript" src="js/envio_ajax.js"></script>
<script type="text/javascript" src="js/valida.js"></script>



   <link rel="shortcut icon" href="images/favicon.ico" />
 <script type="text/javascript"  src="js/cliente.js"></script>
<script type="text/javascript" src="js/envio_ajax.js"></script>
<script type="text/javascript" src="js/valida.js"></script>
	<link rel="stylesheet" href="themes/base/jquery.ui.all.css">
	<script src="js/jquery-1.7.2.js"></script>
	<script src="external/jquery.bgiframe-2.1.2.js"></script>
	<script src="ui/jquery.ui.core.js"></script>
	<script src="ui/jquery.ui.widget.js"></script>
	<script src="ui/jquery.ui.mouse.js"></script>
	<script src="ui/jquery.ui.button.js"></script>
	<script src="ui/jquery.ui.draggable.js"></script>
	<script src="ui/jquery.ui.position.js"></script>
	<script src="ui/jquery.ui.resizable.js"></script>
	<script src="ui/jquery.ui.dialog.js"></script>
	<script src="ui/jquery.effects.core.js"></script>
	<link rel="stylesheet" href="css/demos.css">
    <link rel="stylesheet" type="text/css" href="Styles/inei.css">
	
	
    <link rel="stylesheet" type="text/css" href="Styles/calendar-blue.css">
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calendar-setup.js"></script>
	<script type="text/javascript" src="js/calendar-es.js"></script>
	<script type="text/javascript" src="js/sorttable.js"></script>
<script>


</script>	
</head>	
	
	

	
<link href="Styles/inei.css" rel="stylesheet" type="text/css" />


<body >
	 <form name="frmMiForm" id="frmMiForm" METHOD="POST" ACTION="pd_modificacion_ficha.asp">
	<table width='98%' height='99%' cellpadding='0' cellspacing='0' border='0' background="Imagenes/fondo_di.jpg">
  
  <div id="divNavegacion" align="center"><span class="subtitulo">Mantenimiento: Actualizar Datos del Postulante</span></div><br>
  <tr height=2>
		<td></td>
	</tr>
  <tr>
		
		 <INPUT type="hidden" id=txtidperMC name=txtidperMC value="<%=ID_PERMC%>" >
  <INPUT type="hidden" id=txtreniecMC name=txtreniecMC value="<%=reniecMC%>" >
  	  <INPUT type="hidden" id=txtstrUsuario name=txtstrUsuario value="<%=strUsuario%>" >
      <INPUT type="hidden" id=txtipusuario name=txtipusuario value="<%=ipVisitante%>"> 
		<td valign=top align=center>
 			<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
      <tr height=22>			</tr>
 			<tr height=22>
 				<td colspan=3>
                <% IF ISNULL(reniecMC) OR  reniecMC = "0"  OR  reniecMC = "3"  THEN %>  
                
                <table cellpadding="0" cellspacing="0" align="center" width="100%">
 				  <tr height="3">
 				    <td colspan="6" align="center"></td>
			      </tr>
 				  <tr height="3">
 				    <td colspan="6" align="left"><p align="center"></p>
 				      <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">
 				        <tr>
 				          <td colspan="6" background="images/13.jpg" ><span class="mensaje2">1. Lugar al que postula</span>
 				            <input type="hidden" id="txtFrm" name="txtFrm" value="" />
 				            <input name="txtid_per" type="hidden" id="txtid_per" value="<%=lsid_per%>" /></td>
			            </tr>
 				        <tr height="18">
 				          <td  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Departamento</strong>: <%=lsNomDptoI%></font></td>
 				          <td width="20%"   background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Provinicia</strong>: <%=lsNomProvI%></font></td>
 				          <td width="21%"  background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Distrito</strong>: <%=lsNomDistI%></font></td>
 				          <td width="25%"  background="images/4.jpg"><font class="etiqueta"><strong>Confirme Distrito</strong></font><font class="etiqueta"><%=lsNomDistI%></font></td>
 				          <td width="18%"  background="images/4.jpg"><font class="etiqueta"><strong>Cargo: </strong></font><font class="etiqueta"><%=puestoMC%></font></td>
			            </tr>
 				        
			          </table>
 				      <br />
 				      <span id="msj" style="display:none;" class="mensaje1" >Este DNI ya se encuentra registrado.</span> <span id="msj2" style="display:none;" class="mensaje1">El DNI tiene como m&iacute;nimo 8 n&uacute;meros..</span>
 				      <table cellpadding="0" cellspacing="0" border="0"  class="tabla3" width="100%">
 				        <tr>
 				          <td colspan="6" background="images/13.jpg"><span class="alerta4">2. Datos del postulante</span> <span ><font class="alerta5">(Escriba sus datos conforme a su DNI) </font></span></span></td>
			            </tr>
 				        <tr height="22" >
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Apellido Paterno </strong></font></td>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;Apellido Materno</strong></font></td>
 				          <td background="images/4.jpg"><span class="cabecera2"><font class="etiqueta"><strong>Primer Nombre</strong></font><font class="etiqueta"><strong></strong></font></span></td>
 				          <td width="20%" background="images/4.jpg"><span class="cabecera2"><font class="etiqueta"><strong>Segundo Nombre</strong></font><font class="etiqueta"><strong></strong></font></span></td>

			            </tr>
 				        <tr height="22" >
 				          <td height="29" align="left"><span class="etiqueta"><font class='alerta5'>
 				            <input type="text" class='e_texto' id="txtApePaternoX" name="txtApePaternoX" value="<%=ape_paterno%>" maxlength="50" style="width:220" validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml; " onKeyPress="return TextUtil.allowChars(this, event)" onKeyUp="this.value=this.value.toUpperCase();" />
 				            (*)</font></span></td>
 				          <td align="left"><span class="etiqueta"><font class='alerta5' >
 				            <input type="text" class='e_texto' id="txtApeMaternoX" name="txtApeMaternoX" value="<%=ape_materno%>" maxlength="50" style="width:220" validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml; " onKeyPress="return TextUtil.allowChars(this, event)" />
 				            (*)</font></span></td>
 				          <td align="left"><font class='alerta5' ><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' id="txtNombre1" name="txtNombre1" value="<%=nombreMC%>" maxlength="50" style="width:220" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" />
                          </font>(*)</font></td>
 				          <td align="left"><span class="etiqueta"><font class='alerta5' ><font class='cascade4' color="crimson">
 				            <input type="text" class='e_texto' id="txtNombre2" name="txtNombre2" value="<%=nombre2MC%>" maxlength="50" style="width:220" validchars="abcdefghijklmn&ntilde;opqrstuvwxyz&uuml;ABCDEFGHIJKLMN&Ntilde;OPQRSTUVWXYZ&Uuml; " onKeyPress="return TextUtil.allowChars(this, event)" />
 				            </font></font></span></td>

			            </tr>
 				        
 				        
 				        <tr>
 				          <td background="images/4.jpg"><font class="etiqueta"><strong>&nbsp;DNI</strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></td>
 				          <td width="21%" background="images/4.jpg"><font class="etiqueta"><strong>CONFIRME DNI 
 				            
 				          </strong></font></td>
 				          <td width="20%" background="images/4.jpg"><font class="etiqueta"><strong>N&ordm; RUC</strong></font></td>
 				          <td colspan="2" background="images/4.jpg"><span class="cabecera2"><font class="etiqueta"><strong>&nbsp;<font class="etiqueta"><strong>Confirme Ruc </strong></font></strong></font><font class="etiqueta"><strong>&nbsp;</strong></font></span></td>
			            </tr>
 				        <tr>
 				          <td align="left"><span class="etiqueta"><font class='alerta5' >
 				            <input type="text" class='e_texto'  style="width:100" id="txtDNI" name="txtDNI" value="<%=dniMC%>" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onBlur="Validar()" />
 				            (*) </font></span><span class="etiqueta"><font class='alerta5' >&nbsp;</font></span></td>
 				          <td align="left"><input type="text" class='e_texto' style="width:100" id="txtDNI2" name="txtDNI2" value="<%=dniMC%>" maxlength="8" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)"  onBlur="ValidarDNIC()"/>
                          <font class='alerta5' >(*)</font></td>
 				          <td align="left"><font class='alerta5' >
 				            <input type="text" class='e_texto' style="width:100" id="txtRUC" name="txtRUC" value="<%=rucMC%>" maxlength="11" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onBlur="ValidarRUC()" />
 				            (*)</font></td>
 				          <td colspan="2" align="left"><font class='alerta5' >
 				            <input type="text" class='e_texto' style="width:100" id="txtRUC2" name="txtRUC2" value="<%=rucMC%>" maxlength="11" validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" onBlur="ValidarRUC2()" />
 				          (*)</font></td>
			            </tr>
 				        
 				       	<tr height="22" >
 				                <td  height="28" colspan="5" align="CENTER" style="border-bottom:1px solid; border-bottom-color:#0F83E1">
                                </td>
			            </tr>
					   
					   <tr height="22" >
 				                <td  height="28" colspan="5" align="CENTER" style="border-bottom:1px solid; border-bottom-color:#0F83E1"><input type=hidden id="idficha" name="idficha" value="" /><input type=hidden id="txtOper" name="txtOper" value="">	
                                <input type="button" value="Actualizar "  align="center" onClick="ActualizarDatosPersona();" id="button1" name="button1"  class="boton" /></td>
			            </tr>
 				        
 				        
			          </table>
 				      <br />
 				      <span id="msj" style="display:none;" class="mensaje1" >Este DNI ya se encuentra registrado.</span> <span id="msj2" style="display:none;" class="mensaje1">El DNI tiene como m&iacute;nimo 8 n&uacute;meros..</span><br />
 				      <br /></td>
			      </tr>
			    </table>
				
				
				
		<% END IF %>
		
		
		

              
               <% IF (reniecMC="2") THEN %>
			  
			  
			  
			  
			  <INPUT type="hidden" id=txtreniecMC name=txtreniecMC value="<%=reniecMC%>" >
			  
              <div id="formulario">


    <form name="form1" id="form1" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
    <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">		<table width="770" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
      <tr height=22>
 				<td colspan=3>
 					<table cellpadding="0" cellspacing="0" border="0"  width="490" align="center">
 					<tr height=22>
					<td colspan=3 class='etiqueta'><FONT CLASS='alerta5'>LOS DATOS DE LA PERSONA YA ESTAN VALIDADOS POR EL SIGA.</font></td>

					  </tr>
					

 					<tr>
 						<td>
 							<table width="490" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
 	            <tr>
 								<th colspan=6 class="aplicacion" bgcolor="#DAE8F3">Datos Actuales Persona</th>
							<tr>
								<td width=160  class='etiqueta'>Apellido Paterno</td>
	             
	              <td width="273">
	              <input type="text" class='e_texto' id="txtApePaternoMC" name="txtApePaternoMC" value="<%=ape_paterno%>" maxlength="40" style="width:220;text-transform: uppercase;border:0;"  onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>
							  <td width="55" rowspan="2" align=right>&nbsp;</td>
							</tr>
								<tr>
								<td width=160  class='etiqueta'>Apellido Materno</td>
	             
	                            <td width="273">
	                              <input type="text" class='e_texto' id="txtApeMaternoMC" name="txtApeMaternoMC" value="<%=ape_materno%>" maxlength="40" style="width:220;text-transform: uppercase;border:0;" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>
							  </tr>
							<tr>
							<td width="160" class='etiqueta'>Primer Nombre</td>								
	                        <td width="273">
							  <input type="text" class='e_texto' id="txtNombreMC" name="txtNombreMC" value="<%=nombreMC%>" maxlength="40" style="width:220;text-transform: uppercase;border:0;" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							
						    <td width="160" class='etiqueta'>Segundo Nombre</td>								
	                        <td width="273">
							  <input type="text" class='e_texto' id="txtNombre2MC" name="txtNombre2MC" value="<%=nombre2MC%>" maxlength="40" style="width:220;text-transform: uppercase;border:0;" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							
							
							<tr>
 								<td width="160" height="25" class='etiqueta'>DNI</td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtdniMC" name="txtdniMC" value="<%=dniMC%>" maxlength="8" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							<tr>
 							 <td width="160" height="25" class='etiqueta'>Departamento </td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtdptoMC" name="txtdptoMC" value="<%=dptoMC%>" maxlength="8" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							<tr>
 							 <td width="160" height="25" class='etiqueta'>Provincia </td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtdptoMC" name="txtdptoMC" value="<%=provMC%>" maxlength="8" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							<tr>
 							 <td width="160" height="25" class='etiqueta'>Distrito </td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtdptoMC" name="txtdptoMC" value="<%=distMC%>" maxlength="8" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							
						    <tr>
 							 <td width="160" height="25" class='etiqueta'>Cargo Funcional </td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtcfMC" name="txtcfMC" value="<%=desc_CargoFuncionalMC%>" maxlength="100" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							<tr>
 							 <td width="160" height="25" class='etiqueta'>Cargo Operativo</td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtcargperMC" name="txtcargperMC" value="<%=cargoperativo%>" maxlength="100" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>
							  <td width="55" align=center>
							   <a href="pd_ActualizaDatosPer.asp" class="boton">Regresar</a>
							  	
							  </td>
							</tr>
							


							       
 							</table>
 						</td>
 					</tr>
 					</table>
 				</td>
 			</tr>
 			
	</table>              				    	    				    
	</form>
</div>
			  
			  <%END IF%>
			  
			  <% IF (reniecMC="1") THEN %>
			  
			  <INPUT type="hidden" id=txtreniecMC name=txtreniecMC value="<%=reniecMC%>" >
			  
              <div id="formulario">


    <form name="form1" id="form1" METHOD="POST" ACTION="">
	<table  width="100%"  border="0" align="center">
    <tr>
		<td valign=top align=center>
 	<div id="formulario" style="display:block">		<table width="770" cellpadding="0" cellspacing="0" border="0" bgcolor=White>
      <tr height=22>
 				<td colspan=3>
 					<table cellpadding="0" cellspacing="0" border="0"  width="490" align="center">
 					<tr height=22>
					<td colspan=3 class='etiqueta'><FONT CLASS='alerta5'>LOS DATOS DE LA PERSONA YA ESTAN VALIDADOS POR LA RENIEC.</font></td>

					  </tr>
					
					

 					<tr>
 						<td>
 							<table width="490" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#DAE8F3">
 	            <tr>
 								<th colspan=6 class="aplicacion" bgcolor="#DAE8F3">Datos Actuales Persona</th>
							<tr>
								<td width=160  class='etiqueta'>Apellido Paterno</td>
	             
	              <td width="273">
	              <input type="text" class='e_texto' id="txtApePaternoMC" name="txtApePaternoMC" value="<%=ape_paterno%>" maxlength="40" style="width:220;text-transform: uppercase;border:0;"  onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>
							  <td width="55" rowspan="2" align=right>&nbsp;</td>
							</tr>
								<tr>
								<td width=160  class='etiqueta'>Apellido Materno</td>
	             
	                            <td width="273">
	                              <input type="text" class='e_texto' id="txtApeMaternoMC" name="txtApeMaternoMC" value="<%=ape_materno%>" maxlength="40" style="width:220;text-transform: uppercase;border:0;" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>
							  </tr>
							<tr>
							<td width="160" class='etiqueta'>Primer Nombre</td>								
	                        <td width="273">
							  <input type="text" class='e_texto' id="txtNombreMC" name="txtNombreMC" value="<%=nombreMC%>" maxlength="40" style="width:220;text-transform: uppercase;border:0;" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							
						    <td width="160" class='etiqueta'>Segundo Nombre</td>								
	                        <td width="273">
							  <input type="text" class='e_texto' id="txtNombre2MC" name="txtNombre2MC" value="<%=nombre2MC%>" maxlength="40" style="width:220;text-transform: uppercase;border:0;" validchars="abcdefghijklmnñopqrstuvwxyzüABCDEFGHIJKLMNÑOPQRSTUVWXYZÜ " onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							
							
							<tr>
 								<td width="160" height="25" class='etiqueta'>DNI</td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtdniMC" name="txtdniMC" value="<%=dniMC%>" maxlength="8" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							<tr>
 							 <td width="160" height="25" class='etiqueta'>Departamento </td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtdptoMC" name="txtdptoMC" value="<%=dptoMC%>" maxlength="8" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							<tr>
 							 <td width="160" height="25" class='etiqueta'>Provincia </td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtdptoMC" name="txtdptoMC" value="<%=provMC%>" maxlength="8" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							<tr>
 							 <td width="160" height="25" class='etiqueta'>Distrito </td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtdptoMC" name="txtdptoMC" value="<%=distMC%>" maxlength="8" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							<tr>
 							 <td width="160" height="25" class='etiqueta'>Cargo Funcional </td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtcfMC" name="txtcfMC" value="<%=desc_CargoFuncionalMC%>" maxlength="100" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>

							</tr>
							<tr>
 							 <td width="160" height="25" class='etiqueta'>Cargo Operativo</td>								
	                         <td width="273">
							  <input type="text" class='e_texto' id="txtcargperMC" name="txtcargperMC" value="<%=cargoperativo%>" maxlength="100" style="width:220;border:0;"  validchars="0123456789" onKeyPress="return TextUtil.allowChars(this, event)" readonly></td>
							  <td width="55" align=center>
							   <a href="pd_ActualizaDatosPer.asp" class="boton">Regresar</a>
							  	
							  </td>
							</tr>

							       
 							</table>
 						</td>
 					</tr>
 					</table>
 				</td>
 			</tr>
 			
	</table>              				    	    				    
	</form>
</div>
			  
			  <%END IF%>	
	

	
		  
          </td>
	</tr>
	</table>
	  </form>
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
        <td colspan=4 align=center><a href="pd_ActualizaDatosPer.asp" class="boton">Regresar</a><br><table border=0 cellpadding="0" cellspacing="0" align="center" width="51%">
					<tr>
							         
			  </tr>
					</table></td>
      </tr>
      <tr height=1><td colspan=4 align=right></td></tr>
</table></td></tr></table>
	<%	End If
	
		RS.Close
		cnn.Close
		Set RS = Nothing
		Set cnn = Nothing
	%>
</body>