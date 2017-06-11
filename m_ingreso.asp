
<%@ Language=VBScript %>

<!-- #include file="Conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 
<% 

Response.ContentType="text/html; charset=iso-8859-1"
Server.ScriptTimeout = 30000 


lsTipo = Request.Form("lsTipo")
'----------------------------------------------------------------------

if lsTipo="9" then ' Actualizacion de la RPM

lsid=  Request.Form("lsdni")
lsVal = Request.Form("lsvalor")
id_Proyecto=Session("id_proyecto")

 
	lsSQL = "EXEC dbo.usp_Update_rpm '" & lsid & "','" & lsVal & "', '"&id_Proyecto&"' " 
	evento="<input name=""txt"&lsid&""" validchars=""0123456789"" onKeyPress=""return TextUtil.allowChars(this, event)"" class=""etiqueta""  type=""text"" id=""txt"&lsid&""" value="""&lsVal&"""  onblur=""grabar_rpm('"&lsid&"',this.value)"" size=""12"" />"

response.Write(evento)
response.Write(lsSQL)

  Call getRS(RS, lsSQL)
end if




'----------------------------------------------------------------------

if lsTipo="11A" then ' INGRESAR LOCALES DE CAPA

depa=  MID(Request.Form("depa"),1,2)
prov=  MID(Request.Form("prov"),3,2)
dist = MID(Request.Form("dist"),5,2)
local = ucase(trim(Request.Form("local")))
dire=  ucase(trim(Request.Form("dire")))
refe=  ucase(trim(Request.Form("refe")))
aula = Request.Form("aulas")
PEA = Request.Form("PEA")
PEA_aula = Request.Form("PEA_aula")
ult = Request.Form("ult")
hora = Request.Form("hora")
fecha = Request.Form("fecha")
idProyecto=Session("id_proyecto")
ubigeo=depa&prov&dist
 	lsvarNomDpto = len(Request.Form("depa")) '6
	nombredpto=mid(Request.Form("depa"),3,lsvarNomDpto-2)
	lsvarNomProv = len(Request.Form("prov")) '6
	nombreprov=mid(Request.Form("prov"),5,lsvarNomProv-4)
	lsvarNomDist = len(Request.Form("dist")) '6
	nombredist=mid(Request.Form("dist"),7,lsvarNomDist-6)

	lsSQL = "EXEC usp_insert_localCap '"& depa &"', '"& prov &"','"& dist &"','"& local &"','"& dire &"','"& refe &"','"& aula &"','"& PEA &"','"& hora &"','"& fecha &"', '"&idProyecto&"'"
	

Call getRS(RS, lsSQL)

	'Set RS = RS.NextRecordSet()
	'id_tb = RS("nuevo_id")

	'for k=0 to (cint(aula)-1)
	'SQL2 = "exec dbo.usp_insert_AulalocalCap '"& id_tb &"' ,'"&(k+1) &"','"& depa &"', '"& prov &"','"& dist &"', '" & PEA_aula & "' "
	'Call getRS(RS2, SQL2)
'	next 
'

'lsSQL3 = "EXEC uspUdp_AulaLocalCap '"& id_tb &"', '" & ult & "' "	
'Call getRS(RS3, lsSQL3)

end if

if lsTipo="11B" then ' Actualizar Ficha

valor = Request.Form("id")
cant = Request.Form("cant")
idProyecto=Session("id_proyecto")

			
	lsSQL = "EXEC dbo.pa_registrar_pea_aulas_nac '" & valor & "','" & cant & "','" & idProyecto & "'"


  Call getRS(RS, lsSQL)

end if

'---------------------------------------------------------

if lsTipo="20" then ' INGRESAR VERIFICAR DATOS

lsDNI = Request.Form("dni")
idProyecto=Session("id_proyecto")



		SQL1="exec dbo.uspGet_DatosContratadosActivos   '99', '99', '98', '3', '','' ,'"&lsDNI&"', '"&idProyecto&"'"
		
		Call getRS(RS, SQL1)

 If Not RS.BOF And Not RS.EOF Then 
 
 		SQL2="exec dbo.uspGet_DatosALTAS  '"&RS("ID_PER")&"'"
		
		Call getRS(RS2, SQL2)

		 If Not RS2.BOF And Not RS2.EOF Then 
		 		 respuesta="-"&"*"&"-"&"<input type='hidden' name='txtccdd_r' id='txtccdd_r' /><input type='hidden' name='txtccpp_r' id='txtccpp_r' /><input type='hidden' name='txtccdi_r' id='txtccdi_r' />"

		else
		
				 respuesta=rs("nombre")&"*"&rs("cargo")&"<input type='hidden' name='txtccdd_r' id='txtccdd_r' value='"&rs("ccdd_i")&"' /><input type='hidden' name='txtccpp_r' id='txtccpp_r' value='"&rs("ccpp_i")&"' /><input type='hidden' name='txtccdi_r' id='txtccdi_r'  value='"&rs("ccdi_i")&"' /><input type='hidden' name='txtid_puesto_r' id='txtid_puesto_r'  value='"&rs("id_puesto")&"' /><input type='hidden' name='txtid_per_Ing' id='txtid_per_Ing'  value='"&rs("id_PER")&"' />"

		 END IF 
 else 
 respuesta="-"&"*"&"-"&"<input type='hidden' name='txtccdd_r' id='txtccdd_r' /><input type='hidden' name='txtccpp_r' id='txtccpp_r' /><input type='hidden' name='txtccdi_r' id='txtccdi_r' />"
end if	


response.Write(respuesta)

end if

'------------------------------------------------------

if lsTipo="21" then ' INGRESAR VERIFICAR DATOS

lsDNI=Request.Form("lsDNI")
lsUsuario=Request.Form("lsUsuario")
id_usuario=Session("id_usuario")
id_Proyecto=Session("id_proyecto")

SQL2 = "exec dbo.usp_ing_eliminar '"& lsDNI &"' ,'"& id_usuario &"' ,'"&id_Proyecto&"'  "	
Call getRS(RS, SQL2)


SQL1 = "exec dbo.usp_eliminar '"& lsDNI &"' , '"&id_Proyecto&"'"	
Call getRS(RS1, SQL1)



response.Write("Se liber&oacute; con &eacute;xito a la persona")


end if

'------------------------------------------------------

if lsTipo="22" then ' INGRESAR VERIFICAR DATOS

lsIniTitu=trim(Request.Form("lsIniTitu"))
lsFinTitu=trim(Request.Form("lsFinTitu"))
lsJust=Request.Form("lsJust")
lsid_PER_sale=Request.Form("lsid_PER_sale")
lsIniRe=trim(Request.Form("lsIniRe"))
lsId_per_Ing=Request.Form("lsId_per_Ing")
lsIp=Request.Form("lsIp")
lsUsu=Request.Form("lsUsu")
lsid_Contrato=Request.Form("lsid_Contrato")
lsccdd_r =Request.Form("lsccdd_r")
lsccpp_r =Request.Form("lsccpp_r")
lsccdi_r =Request.Form("lsccdi_r")
lsid_puesto_r =Request.Form("lsid_puesto_r")
lspagoPeriodo =Request.Form("lspagoPeriodo") 
lsFinCon =Request.Form("lsFinCon") 
lstxt_ruta =Request.Form("lstxt_ruta") 
idProyecto=Session("id_proyecto")

SQL="exec dbo.uspGet_DatosContratadosActivos   '99', '99', '98', '2', '"&lsid_Contrato&"','','', '"&idProyecto&"' "

Call getRS(RS, SQL)
If Not RS.BOF And Not RS.EOF Then
	SQL2="exec dbo.uspGet_DatosContratoVerificacion  '"&lsId_per_Ing&"','"&lsIniRe&"', '"&idProyecto&"' "
	
	Call getRS(RS2, SQL2)
	If Not RS2.BOF And Not RS2.EOF Then
		response.write("Fecha de INICIO de Contrato se cruza con fecha FIN de Contrato Anterior del Proyecto" & RS2("DES_META"))
		Response.End()
	else   
		SQL1 = "exec dbo.usp_insert_AlBa '"& lsIniTitu &"','"& lsFinTitu &"','"& lsJust &"','"& lsid_PER_sale &"','"& lsIniRe &"','"& lsId_per_Ing &"','"& lsUsu &"','"& lsIp &"','"& lsid_Contrato &"','"& lsccdd_r &"','"& lsccpp_r &"','"& lsccdi_r &"','"& lsid_puesto_r &"','"& lspagoPeriodo &"','"& lsFinCon &"','"& lstxt_ruta &"', '"&idProyecto&"'"			
		
		Call getRS(RS1, SQL1)
		response.Write("Ingresado con &eacute;xito")
	end if
else 
	response.Write("Ya ha sido registrado")
end if


end if


'-------------------------------------------------------------------------------


if lsTipo="25" then 
dnic=Request.Form("dni")
varccddTot=Request.Form("ccdd")
varccppTot=Request.Form("ccpp")
varccdiTot=Request.Form("ccdi")

ccdd = Mid(varccddTot,1,2)
ccpp = Mid(varccppTot,3,2)
ccdi = Mid(varccdiTot,1,6)


if ccdi="999999" then 
ubigeo=varccppTot
else 
ubigeo=varccdiTot
end if

idProyecto=Session("id_proyecto")

lsSQL = "EXEC dbo.uspEce_VerificaDNIB '" & dnic & "', '"&idProyecto&"' "	
Call getRS(RS, lsSQL)

 If Not RS.BOF And Not RS.EOF Then 
 
 if rs("cenviocontra")>=2  then 
 
  dnirR="El proceso de evaluaci&oacute;n curricular ha finalizado"
  
  else
  
 if ubigeo=rs("ubigeo") then 
 
   
 if  rs("aprobo_automatica")=2 or rs("aprobo_automatica")=0 then 
 	if idProyecto=103 then 
 	dnirR="<span class=titulo>"&rs("completo")&"<br/> Cargo: "&rs("cargo")&"<br/>Sede : "&rs("sedeOperativa")&"<br/> Solo puede Evaluar los cargos de Aplicador</span><br/>  "
	else
	dnirR="<span class=titulo>"&rs("completo")&"<br/> Cargo: "&rs("cargo")&"<br/>Sede : "&rs("sedeOperativa")&"<br/> No Aprobo la Preselcci&oacute;n autom&aacute;tica</span><br/>  "
	end if
 
 else
 
 		if rs("bandaprob")=2   then
 			dnirR="<span class=titulo>"&rs("completo")&"<br/> Cargo: "&rs("cargo")&"<br/>Sede : "&rs("sedeOperativa")&"<br/> Ya fu&eacute; evaluado. No Aprob&oacute; la Evaluaci&oacute;n Curricular</span><br/><br/><INPUT type=""button"" style=""font-family:Arial; font-size:10pt;""   value=""Cambiar a Aprobado"" onClick=""javascript:grabar(1)"" id=button2 name=button2>&nbsp;&nbsp;<INPUT type=""button"" style=""font-family:Arial; font-size:10pt;""   value=""Cambiar a Desaprobado"" onClick=""javascript:grabar(2)"" id=button3 name=button3>  "
		elseif  rs("bandaprob")=1 then
			dnirR="<span class=titulo>"&rs("completo")&"<br/> Cargo: "&rs("cargo")&"<br/>Sede : "&rs("sedeOperativa")&"<br/> Ya fu&eacute; evaluado. Aprob&oacute; la Evaluaci&oacute;n Curricular</span><br/> <br/><INPUT type=""button"" style=""font-family:Arial; font-size:10pt;""   value=""Cambiar a Aprobado"" onClick=""javascript:grabar(1)"" id=button2 name=button2>&nbsp;&nbsp;<INPUT type=""button"" style=""font-family:Arial; font-size:10pt;""   value=""Cambiar a Desaprobado"" onClick=""javascript:grabar(2)"" id=button3 name=button3> "
 		else 
		dnirR="<span class=titulo>"&rs("completo")&"<br/> Cargo: "&rs("cargo")&"</span><br/><br/><INPUT type=""button"" style=""font-family:Arial; font-size:10pt;""   value=""Cambiar a Aprobado"" onClick=""javascript:grabar(1)"" id=button2 name=button2>&nbsp;&nbsp;<INPUT type=""button"" style=""font-family:Arial; font-size:10pt;""   value=""Cambiar a Desaprobado"" onClick=""javascript:grabar(2)"" id=button3 name=button3> "
	
 	end if 
 end if
 
 else
 dnirR="<span class=titulo>"&rs("completo")&"<br/> Cargo: "&rs("cargo")&"<br/>Sede : "&rs("sedeOperativa")&"<br/>  Esta postulando a otra sede</span><br/>  "
 
 end if
 
 end if
 
 

	else 
	  dnirR="No se encuentra registrado en el Sistema"
 end if	

response.Write(dnirR)	  
 
end if


'-------------------------------------------------------------------------------

if lsTipo="26" then 
dnic=Request.Form("dni")
valor=Request.Form("valor")
idProyecto=Session("id_proyecto")
id_usuario=Session("id_usuario")


lsSQL = "EXEC dbo.uspUpdAprob '" & dnic & "','" & valor & "', '"&idProyecto&"' , '"&id_usuario&"' "	
Call getRS(RS, lsSQL)


response.Write("Estado Actualizado ")	  
 
end if

'-------------------------------------------------------------------------------

if lsTipo="30" then ' INGRESAR META CAPA

id_Contratos=  Request.Form("id_Contratos")
lsVal=  Request.Form("valor")
lsusuario = Request.Form("usuario")
id_proyecto = Request.Form("id_proyecto")

lsSQL = " EXEC usp_posible_baja '" & id_Contratos & "','" & lsVal & "','" & lsusuario & "' ,'" & id_proyecto & "'"

  Call getRS(RS, lsSQL)

end if

'-------------------------------------------------------------------------------

if lsTipo="32" then
 
lscod=Request.Form("cod")
valor=Request.Form("valor")

id_usuario=Session("id_usuario")

lsSQL = "EXEC dbo.uspEliminar_Asignacion '" & id_usuario & "','" & lscod & "'"	

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open lsSQL, MiCone, 3,3

		Set RsP = Nothing
		
 
end if


'-------------------------------------------------------------------------------


if lstipo="36" then 

	codigo=Request.Form("codigo")
	tipo=Request.Form("tipo")
	lsussuario=Request.Form("usuario")
	lsip=Request.ServerVariables("REMOTE_ADDR")
	idProyecto=Session("id_proyecto")
	
	
		if Request.Form("tipo")="1" then 
			
			slq1=" exec dbo.uspGET_altas_tmp '"&codigo&"', '"&idProyecto&"' "

			Call getRS(RS, slq1)
					LSID_PER_SALE	=RS("ID_PER_SALE")
					Nom_sale = RS("SALE")
			TipoProceso=RS("tipoProceso")
			
			  If Not RS.BOF And Not RS.EOF Then
			
		
					LSID_PER_ING	=RS("ID_PER_ING")
							LSid_ConvocatoriaCargo	=RS("id_ConvocatoriaCargo")
							LSfec_finT	=RS("fec_finT")
							LSid_Presupuesto	=RS("id_Presupuesto")
							LSccdd_i	=RS("ccdd_i")
							LSccpp_i	=RS("ccpp_i")
							LSccdi_i	=RS("ccdi_i")
							LSCODI_DEPE_TDE	=RS("CODI_DEPE_TDE")
							LSCODI_SEDE_SED	=RS("CODI_SEDE_SED")
							LSid_contratos	=RS("id_contratos")
							LSperiodoCompleto	=RS("periodoCompleto")
							LSfecha_INILabor	=RS("fec_iniR")
							LSfecha_FinLabor	=RS("fec_FinR")
							LSid_ruta	=  RS("id_ruta")
							lSresolucion= RS("resolucion")
							lSfec_resol= RS("fecha_Resolucion")
							lSdoc_ref= RS("doc_ref")
							lSjustif=RS("id_justificacionbaja")

					if (RS("id_per_ing")<>"0") then 
							
			
							'' inserta el oficio de contratacion
					LSQL3="exec usp_insert_ofContrata_AB '"&RS("id_ConvocatoriaCargo")&"','1','"&LSfecha_INILabor&"','"&LSfecha_FinLabor&"','"&lsussuario&"','"&lsip&"','"&lSresolucion&"','"&lSfec_resol&"'"
					
					
							Call getRS(RS3, LSQL3)
							
							Set RS3 = RS3.NextRecordSet()
							id_OFCCONTRA = RS3("nuevo_ofc")
					
					'' crea el codigo de envio de datos
							LSQOFC="exec uspIns_ProcesoContrato '"&lsussuario&"','"&lsip&"'"
		
							Call getRS(RSOFC, LSQOFC)
							
							id_cenvdatos = RSOFC("cenvdatos")
						
					
							LSQLINSCONT =" exec   uspIns_ContratosAB  '"&id_cenvdatos&"', '"&id_OFCCONTRA&"' , '"&LSID_PER_ING&"', '"&LSid_Presupuesto&"', '"&LSccdd_i&"','"&LSccpp_i&"','"&LSccdi_i&"', '"&LSCODI_DEPE_TDE&"', '"&LSCODI_SEDE_SED&"', '"&LSid_contratos&"', '"&LSperiodoCompleto&"', '"&lsussuario&"','"&LSfecha_FinLabor&"', '"&lsIP&"', '"&idProyecto&"'"
						
		
							Call getRS(RS11, LSQLINSCONT)
								Set RS11 = RS11.NextRecordSet()
							LS_ID_CONTRATO_NUEVO = RS11("ID_CONTRATO_NUEVO")
							
							
							LSQL4="exec usp_UPD_ACTIVOFICHA '"&LSID_PER_ING&"', '"&idProyecto&"'"
							Call getRS(RS4, LSQL4)

							LSQL9= "usp_e_ing  '"&LSID_PER_ING&"','"&LSid_Presupuesto&"','"&LSid_ConvocatoriaCargo&"','"&LSccdd_i&"','"&LSccpp_i&"','"&LSccdi_i&"','"&idProyecto&"'"
							Call getRS(RS9, LSQL9)
							

							LSQLENVI="exec uspUp_envio_datos_Final_AB '"& id_cenvdatos &"','"& Nom_sale &"', '"&LSID_PER_ING&"', '"&lSdoc_ref&"','"&idProyecto&"' "
							
							if LSid_ruta <> "0" then 
							lsSQL15= " uspUPD_asignacion '"&LSID_PER_SALE&"' ,'"&LSID_PER_ING&"','"&LSid_ruta&"','"&LSid_contratos&"','"&LS_ID_CONTRATO_NUEVO&"','"&idProyecto&"' "
							
							Call getRS(RS15, lsSQL15)
							end if 
							
							Call getRS(RS6, LSQLENVI)

					end if 

								if  TipoProceso = "1" then
										
											  LSQL7="exec usp_e_sale '"&LSperiodoCompleto&"','"&LSfec_finT&"','"&LSid_contratos&"','"&LSID_PER_SALE&"','"&idProyecto&"', '"&lSjustif&"'"
											
											  Call getRS(RS7, LSQL7)
								end if 										
		
			  end if
		
	
		 end if

		LSQL8=" exec usp_act_proceso '"&tipo&"' , '"&codigo&"','"&lsussuario&"' "	
	   Call getRS(RS8, LSQL8)
	
	
end if 

'-----------------------------------------------------------------------------------------

if lsTipo="40" then 


lsDniRe=Request.Form("lsDniRe")
lsIniRe=trim(Request.Form("lsIniRe"))

lsccdd_r=Request.Form("lsccdd_r")
lsccpp_r=trim(Request.Form("lsccpp_r"))
lsccdi_r=Request.Form("lsccdi_r")
lsid_puesto_r=trim(Request.Form("lsid_puesto_r"))
lsIp=Request.Form("lsIp")
lsUsu=Request.Form("lsUsu")
lsCod=Request.Form("lsCod")
idProyecto=Session("id_proyecto")

SQL="exec uspGet_mostra_alta_cod '"&lsCod&"', '"&idProyecto&"' "
Call getRS(RS, SQL)


SQL2="exec dbo.uspGet_DatosContratoVerificacion  '"&lsDniRe&"','"&lsIniRe&"', '"&idProyecto&"' "

	Call getRS(RS2, SQL2)
	If Not RS2.BOF And Not RS2.EOF Then
		response.write("Fecha de INICIO de Contrato se cruza con fecha FIN de Contrato Anterior del Proyecto" & RS2("DES_META"))
		Response.End()
	else  

		SQL1 = "exec dbo.usp_insert_ALTA '"&  RS("fechaIni") &"','"& RS("fechaFin") &"','"&  RS("id_justificacionbaja") &"','"& RS("id_Per_sale") &_
		"','"& lsIniRe &"','"& lsDniRe &"','"& lsUsu &"','"& lsIp &"','"& RS("id_contratos") &"','"& lsccdd_r &"','"& lsccpp_r &"','"& lsccdi_r &_
		"',		'"& lsid_puesto_r &"','"& RS("periodoCompleto") &"','"&  RS("id_ruta") &"' ,'"& lsCod &"', '"&idProyecto&"'"	

	Call getRS(RS2, SQL1)
		
	response.Write("Ingresado con &eacute;xito")

	end if
end if



'---------------------------------------------------------------------------------------

if lsTipo="41" then 


lsNombre=Request.Form("cmbCargo")
lsnPeriodo =Request.Form("lsnPeriodo")
lstperiodo =Request.Form("lstperiodo")
lsArmadas =Request.Form("lsArmadas")
lsNArmadas =Request.Form("lsNArmadas")
lsCPea =Request.Form("lsCPea")
lsSede =Request.Form("lsSede")
lsDepen =Request.Form("lsDepen")
lsUsuario =Request.Form("lsUsuario")


id_Proyecto=Session("id_proyecto")

SQL1 = "exec dbo.usp_insert_cargoCabe '"& lsNombre &"','"& lsnPeriodo &"','"& lstperiodo &"','"& lsArmadas &"','"& lsCPea &"','"& lsSede &"','"& lsDepen &"' ,'"& lsUsuario &"', '"&lsNArmadas&"' "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open SQL1, MiCone, 3,3
		
		Set RsP = Nothing

end if
'--------------------------------------------------------------------------------------
if lsTipo="43" then 


lsSolicito =UCASE(Request.Form("nsolicitid"))
lsfsolicito =Request.Form("fsolicitud")
lsIdUsuario =Request.Form("lsIdUsuario")
ArrayChek =Request.Form("ArrayChek")

noficio =UCASE(Request.Form("lsOficio"))
fnoficio =Request.Form("lsFoficio")

id_Proyecto=Session("id_proyecto")


bArrayChek=split(ArrayChek,",")

for i=0 to  Ubound(bArrayChek)
SQL1 = "exec dbo.usp_upcargoCabe'"& noficio &"' ,'"& fnoficio &"','"& lsIdUsuario &"','"& lsSolicito &"','"& lsfsolicito &"','"& bArrayChek(i) &"'"

Call getRS(RS, SQL1)
next 

end if

'---------------------------------------------------------------------------
if lsTipo="44" then 

lsproyecto =Request.Form("lsproyecto")
lsftto =Request.Form("lsftto")

lsFuncional =Request.Form("lsFuncional")
lsSiga =Request.Form("lsSiga")
lsnPerido=Request.Form("lsnPerido")
lsPeriodo =Request.Form("lsPeriodo")
lsCant =Request.Form("lsCant")
lsUsuario =Request.Form("lsUsuario")
lstcont =Request.Form("lstcont")
lsAct =Request.Form("lsAct")
lsnivel =Request.Form("lsnivel")

sql2 = "exec dbo.getPresupuesto_key '"& lsproyecto &"', '"& lsftto &"','"& lsFuncional &"' , '"& lsSiga &"', '"& lsAct &"'  , '"& lsnivel &"'"	

Call getRS(RS, sql2)

	entra="NO"
	If Not RS.BOF And Not RS.EOF Then entra="SI"
		
		if entra="NO" then 
		SQL1 = "exec dbo.ins_presupuesto '"& lsproyecto &"','"& lsftto &"','"& lsFuncional &"' ,'"& lsSiga &"','"& lsCant &"','"& lsnPerido &"','"& lsPeriodo &"','"& lstcont &"' ,'"& lsUsuario &"','"& lsAct &"','"& lsnivel &"'"	
		
		Call getRS(RS1, SQL1)
		end  if
		
		if entra="SI" then 
		response.Write("El cargo presupuestado ya existe")
		response.End()
		end if 
end if
'-----------------------------------------------------------



if lsTipo="47" then 


lsvalor =Request.Form("datos")

SQL1 = "exec dbo.getPresupuesto '"& lsvalor &"'  "	
Call getRS(RS, SQL1)

response.Write("<input name=""txtvalmax"" type=""hidden"" id=""txtvalmax"" value="""&rs("totalPEA_P")&"""><input name=""cmbperiodo"" type=""hidden"" id=""cmbperiodo"" value="""&rs("tipoPeriodo_P")&"""><input name=""txttsueldo"" type=""hidden"" id=""txttsueldo"" value="""&rs("sueldo")&"""><input name=""txtnPermax"" type=""hidden"" id=""txtnPermax"" value="""&rs("nPeriodo_P")&"""><input name=""txttipoperiodo"" type=""hidden"" id=""txttipoperiodo"" value="""&rs("dttipoPeriodo")&"""> <font class='alerta5'>(*)</font>")

end if


' --------------------------------------------------------
if lsTipo="52" then ' Ingreso de la Nota de CV


lsid_per=Request.form("id_per")
lsband=Request.form("band")
lsUsu=Request.Form("usuario")

 
	lsSQL = "EXEC dbo.usp_Ins_VeriCVRO '" & lsUsu & "','" & lsid_per & "','"&lsband&"' " 
	evento="<input name=""txt"&lsid&""" validchars=""0123456789"" onKeyPress=""return TextUtil.allowChars(this, event)"" class=""etiqueta""  type=""text"" id=""txt"&lsid&""" value="""&lsVal&"""  onblur=""grabar_NotaCV('"&lsid&"', this.value,'"&lsUsu&"','"&lsid_per&"','"&lsband&"')"" size=""8"" />"
	

response.Write(evento)
  Call getRS(RS, lsSQL)
end if

'---------------------------------------------------------------------------------

if lsTipo="53" then 


lsid=  Request.Form("lsid_presDet")
lsVal = Request.Form("lsvalor")
lsCampo=Request.Form("lsCampo")
lsdiv=Request.form("lsdiv")
lsId_pres=Request.form("lsId_presupuesto")



	evento="<input name=""txtp"&lsid&""" validchars=""0123456789."" onKeyPress=""return TextUtil.allowChars(this, event)"" class=""etiqueta""  type=""text"" id=""txtp"&lsid&""" value="""&lsVal&""" onblur=""grabar_ModPres('"&lsid&"', this.value,'"&lsVal&"','"&lsCampo&"','"&lsdiv&"','"&lsId_pres&"')"" size=""4"" />"

response.Write(evento)
end if 



if lsTipo="54" then 


lsid=  Request.Form("lsId_presupueto")
lsVal = Request.Form("lsvalor")
lsCampo=Request.Form("lsCampo")
id_usuario=  Session("id_usuario")

lsSQL =" exec PA_PRESUPUESTO_DETALLE_ACT '"&lsid&"' ,'"&lsCampo&"','"&lsVal&"', '"&id_usuario&"' "

  Call getRS(RS, lsSQL)
  
  response.Write(lsid)

end if 



'-----------------------------------------------------------------------
if lsTipo="56" then ' 
lsIdPresupuesto=  Request.Form("lsIdPresupuesto")
lsIdConvocatoriaCargo= Request.Form("lsIdConvocatoriaCargo")
id_proyecto= Request.Form("id_proyecto")

	lsSQL = "EXEC dbo.usp_PEAaContratar '" & lsIdPresupuesto & "' ,'"&lsIdConvocatoriaCargo&"' ,'"&id_proyecto&"'" 
	
    Call getRS(RS, lsSQL)
	PEA = RS("seleccionado")
    response.write(PEA)
	response.write(" &nbsp;&nbsp;")

	response.Write("<img alt=""Ver PEA Contratada"" border=""0"" height=16 width=16 src=""images/PEA1.ico""   onClick=""javascript:ver_PEA('"&lsIdPresupuesto&"','"&lsIdConvocatoriaCargo&"')"" >")
	
	response.Write("<img alt=""Exporta PEA Contratada"" border=""0"" height=16 width=16 src=""images/page_excel.png""   onClick=""javascript:ver_PEA_exportar('"&lsIdPresupuesto&"','"&lsIdConvocatoriaCargo&"')"" >")
	
	lsSQL2 = "EXEC dbo.usp_PEAaContratar_min '" & lsIdPresupuesto & "' ,'"&lsIdConvocatoriaCargo&"' ,'"&id_proyecto&"'" 
	
    Call getRS(RS2, lsSQL2)
	
	response.Write("<input type='hidden' name='txtTotalPea' id='txtTotalPea' value='"&RS2("seleccionado")&"' />&nbsp;&nbsp;<input type='hidden' name='txtno_Afiliado' id='txtno_Afiliado' value='"&RS2("no_Afiliado")&"' />")
end if

'---------------------------------------------------------------------------------


if lsTipo="57" then  

lsIdpresupuesto=Request.Form("lsIdpresupuesto")
lsidCcpresupuestario=Request.Form("lsidCcpresupuestario")
lsNumConvocatoria=Request.Form("lsNumConvocatoria")
lsIdConvCargo=Request.Form("lsIdConvCargo")
lstotalPea=Request.Form("lstotalPea")
lsFechaContrato=Request.Form("lsFechaContrato")
lsFechainicio=Request.Form("lsFechainicio")
lsFechaFin=Request.Form("lsFechaFin")
lsIdCuenta=Request.Form("lsIdCuenta")
lsIpRegistro=Request.Form("lsIpRegistro")
lsObservacion=Request.Form("lsObservacion")
lsProyecto=Request.Form("lsProyecto")
lsFecIniCap=Request.Form("lsFecIniCap")
lsFecFinCap=Request.Form("lsFecFinCap")


	lsSQL = "EXEC dbo.uspGet_Insert_OficioContDetalle '" & lsIdpresupuesto & "' ,'"&lsidCcpresupuestario&"','"&lsNumConvocatoria&"','"&lsIdConvCargo&"','"&lstotalPea&"','"&lsFechaContrato&"','"&lsFechainicio&"','"&lsFechaFin&"','"&lsIdCuenta&"','"&lsIpRegistro&"','"&lsObservacion&"','"&lsProyecto&"','"&lsFecIniCap&"','"&lsFecFinCap&"'"
  	response.write(lsSQL)
	
  
    Call getRS(RS, lsSQL)
	call modContratos(lsProyecto)
end if


'---------------------------------------------------------------------------------

if lsTipo="58" then 

noficio =Request.Form("lsOficio")
fnoficio =Request.Form("lsFoficio")
lsIdUsuario =Request.Form("lsIdUsuario") 
lsIpRegistro =Request.Form("lsIpRegistro")
id_proyecto =Request.Form("id_proyecto")
cenvdatos=Request.Form("cenvdatos")
ArrayChek =Request.Form("ArrayChek")

bArrayChek=split(ArrayChek,",")
for i=0 to  Ubound(bArrayChek)
SQL1 = "exec dbo.uspGet_Insert_OficioCont_Numero'"& noficio &"' ,'"& fnoficio &"','"& lsIdUsuario &"','"& lsIpRegistro &"','"& id_proyecto &"','"& cenvdatos &"','"& bArrayChek(i) &"'"

Call getRS(RS, SQL1)
next 
call modContratos(id_proyecto)                                             
end if


'----------------------------------------------------------------------------------

if lsTipo="59" then 
lsidper=Request.Form("lsidper")
lsvalor=Request.Form("lsvalor")

id_proyecto=Session("id_proyecto")

lsSQL = "EXEC dbo.uspUpd_contrato '" & lsidper & "','" & lsvalor & "', '"&id_proyecto&"'"	


Call getRS(RS, lsSQL)


end if

'----------------------------------------------------------------------------------

if lsTipo="68" then 

	lsid=  Request.Form("lsid_cc")
	lsVal = Request.Form("lsvalor")
	lsCampo=Request.Form("lsCampo")


	evento="<textarea name='txtp"&lsCampo&"'  class=p  id='txtp"&lsCampo&"'  onblur=""grabar_ModPres('"&lsid&"',this.value,'"&lsCampo&"');""  cols=120 rows=15  >"&lsVal&"</textarea>"


	response.Write(evento)
	
end if 

'--------------------------------------------------------------------------

if lsTipo="69" then 

	lsid=  Request.Form("lsId_cc")
	lsVal = Request.Form("lsvalor")
	lsCampo=Request.Form("lsCampo")
	
	lsSQL =" exec uspUpd_ccObjetivo "&lsid&" ,'"&lsCampo&"','"&lsVal&"'"
	Call getRS(RS, lsSQL)
	
	lsSQL1 =" exec uspGet_ccObjetivo "&lsid&", '"&lsCampo&"' "
	Call getRS(RS1, lsSQL1)

	objetivo = RS1(lsCampo)
	response.write(objetivo)
end if 

'-------------------------------------------------------------------------


if lsTipo="70" then 

lsid=Request.Form("Id_ConvocatoriaCargo")
usuario=Request.Form("usuario")

lsSQL = "EXEC dbo.spu_PublicarConvCargo "&lsid&","&usuario&" "	

Call getRS(RS, lsSQL)

end if

'-----------------------------------------------------------------------------
if lsTipo="71" then 

lsid=Request.Form("Id_ConvocatoriaCargo")

lsSQL = "EXEC dbo.spu_VerConvCargo "&lsid&" "	
Call getRS(RS, lsSQL)
num=RS(0)
response.write(num)

end if


'---------------------------------------------------------------------------

if lsTipo="72" then

txtUbigeos=Request.Form("txtUbigeos")
id=Request.Form("id")
txtIdPresupuesto=Request.Form("txtIdPresupuesto")

bArrayChek=split(txtUbigeos,",")

for i=0 to  Ubound(bArrayChek)
SQL1 = "exec dbo.usp_ins_UbigeoCargo '"& id &"','"& txtIdPresupuesto &"','"& bArrayChek(i) &"'"
Call getRS(RS, SQL1)
next 

end if

'--------------------------------------------------------------------------------

if lsTipo="73" then

prov=Request.Form("prov")
valor=Request.Form("valor")
indicador=Request.Form("indicador")

SQL1 = "exec dbo.usp_ins_Ubigeoprov '"& prov &"','"& valor &"','"& indicador &"' "
Call getRS(RS, SQL1)

end if
'--------------------------------------------------------------------------------


if lsTipo="74" then

Dep=Request.Form("Dep")
valor=Request.Form("valor")
indicador=Request.Form("indicador")

SQL1 = "exec dbo.usp_ins_UbigeoDep '"& Dep &"','"& valor &"','"& indicador &"' "


Call getRS(RS, SQL1)

end if

'--------------------------------------------------------------------------------


if lsTipo="75" then

Dist=Request.Form("Dist")
valor=Request.Form("valor")
indicador=Request.Form("indicador")

SQL1 = "exec dbo.usp_ins_UbigeoDist '"& Dist &"','"& valor &"','"& indicador &"' "
Call getRS(RS, SQL1)

end if'-------------------------------------------------------------------------------


if lsTipo="76" then

SQL1 = "exec dbo.uspUdp_Ubigeo  "
Call getRS(RS, SQL1)

end if


'------------------------------------------------------------------------



if lsTipo="78" then

valor   = Request.Form("valor")
usuario = Request.Form("usuario")
id_cc   = Request.Form("id_cc")
id_pres = Request.Form("id_pres")
id_proy = Request.Form("id_proyecto")


SQL1 = "exec dbo.InsertarResultados '"& valor &"','"& usuario &"' , '"&id_cc&"', '"&id_pres&"' , '"&id_proy&"'"
'response.write(SQL1)

Call getRS(RS, SQL1)

end if


' --------------------------------------------
if lsTipo="79" then 

lsid=  Request.Form("id_cc")
lsVal = Request.Form("valor")


 
	lsSQL = "EXEC dbo.usp_Update_publicacion '" & lsid & "','" & lsVal & "'" 
	
	
	evento="<input name=""txt"&lsid&""" id=""txt"&lsid&""" type=""text"" size=""50""   value="""&lsVal&""" onKeyPress=""return TextUtil.allowChars(this, event)"" class=""etiqueta""    onblur=""grabar_Observacion('"&lsid&"',this.value)""  />"

	
response.Write(evento)
  Call getRS(RS, lsSQL)
end if

'----------------------------------------------------------------

if lsTipo="83" then 

oficio=  Request.Form("oficio")
fecha=  Request.Form("fecha")
Freg=  Request.Form("Freg")
Fexec=  Request.Form("Fexec")
cenvdatos=  Request.Form("cenvdatos")
idProyecto=Session("id_proyecto")

	lsSQL = "EXEC dbo.upd_OfContratacionAB '"&oficio& "','"&fecha& "','"&Freg& "','"&Fexec& "','"&cenvdatos& "' ,'"&idProyecto& "' " 

	Call getRS(RS, lsSQL)
	
end if

'-----------------------------------------------------------------------------------

if lsTipo="87" then

id=Request.Form("id")
local=Request.Form("local")
direccion=Request.Form("direccion")
referencia=Request.Form("referencia")
hora=Request.Form("hora")
aulas=Request.Form("aulas")
cantPEA=Request.Form("cantPEA")
fecha=Request.Form("fecha")
PEA_aula=Request.Form("PEA_aula")
ult=Request.Form("ult")
indic=Request.Form("indic")

lsSQL1 = "EXEC dbo.pa_actualzar_aula '"&id& "','"&local& "','"&direccion& "', '"&referencia&"', '"&hora&"', '"&aulas&"', '"&cantPEA&"','"&fecha&"', '"&PEA_aula&"'  " 

	Call getRS(RS1, lsSQL1)
	
	
end if



if lsTipo="88" then 

TipoGasto=Request.Form("TipoGasto")
desembolso=Request.Form("desembolso")
envio=Request.Form("envio")
inicio=Request.Form("inicio")
fin=Request.Form("fin")

id_Proyecto=Session("id_proyecto")

	lsSQL1 = "EXEC dbo.uspGet_EstadoGO '"&TipoGasto& "','"&desembolso& "','"&envio& "', '"&id_Proyecto&"' " 

	Call getRS(RS1, lsSQL1)
	
	If RS1.BOF And RS1.EOF Then 
	
	
		lsSQL3 = "EXEC dbo.pa_GastosOperativos_insertar '"&TipoGasto& "','"&desembolso& "','"&envio& "','"&inicio& "','"&fin&"', '"&id_Proyecto&"'  "
		
	response.write(lsSQL3 )		
	
	
		Call getRS(RS3, lsSQL3)
'		Set RS3 = RS3.NextRecordSet()
'		id_GO = RS3("id_gastoOp")

	
'		lsSQL = "EXEC dbo.upd_GastosOperativos '"&TipoGasto& "','"&desembolso& "','"&envio& "','"&inicio& "','"&fin&"', '"&id_GO&"', '"&id_Proyecto&"' " 
		response.Write("1")
		

		
		'Call getRS(RS, lsSQL)
		
		'sSQL1 = "EXEC dbo.uspget_VerificaGO '"&TipoGasto& "','"&desembolso& "','"&envio& "' " 
		
						
						
			'Call getRS(RS1, lsSQL1)
			'If Not RS1.BOF And Not RS1.EOF Then 
			'	response.Write("1")
			'else
			'	lsSQL2 = "EXEC dbo.usp_VEliminaGO '"&TipoGasto& "','"&desembolso& "','"&envio& "' " 
			'	Call getRS(RS2, lsSQL2)
			'	response.Write("0")
			'end if
	else 
	
		id_GO=RS1("id_GOperativos")
		
		
		if estado <> "1" then'SOLO SI ESTADO NO ESTA CERRADO
				lsSQL = "EXEC dbo.upd_GastosOperativos '"&TipoGasto& "','"&desembolso& "','"&envio& "','"&inicio& "','"&fin&"', '"&id_GO&"', '"&id_Proyecto&"' " 
		
		
			Call getRS(RS, lsSQL)
			response.Write("3")

		else
			response.Write("2")
					
		end if
			

	end if
	
end if




if lsTipo="8A" then 

TipoGasto=Request.Form("TipoGasto")
desembolso=Request.Form("desembolso")
envio=Request.Form("envio")
inicio=Request.Form("inicio")
fin=Request.Form("fin")

id_Proyecto=Session("id_proyecto")
mes=Request.Form("mes")

	lsSQL1 = "EXEC dbo.uspGet_EstadoGO_nvo '"&TipoGasto& "','"&desembolso& "','"&envio& "', '"&id_Proyecto& "', '"&mes&"' " 
	
	

	Call getRS(RS1, lsSQL1)
	
	If RS1.BOF And RS1.EOF Then 
	
	
		lsSQL3 = "EXEC dbo.pa_GastosOperativos_insertar_nvo '"&TipoGasto& "','"&desembolso& "','"&envio& "','"&inicio& "','"&fin&"', '"&id_Proyecto& "', '"&mes&"' " 
		

	
		Call getRS(RS3, lsSQL3)
'		Set RS3 = RS3.NextRecordSet()
'		id_GO = RS3("id_gastoOp")

	
'		lsSQL = "EXEC dbo.upd_GastosOperativos '"&TipoGasto& "','"&desembolso& "','"&envio& "','"&inicio& "','"&fin&"', '"&id_GO&"', '"&id_Proyecto&"' " 
		response.Write("1")
		

		
		'Call getRS(RS, lsSQL)
		
		'sSQL1 = "EXEC dbo.uspget_VerificaGO '"&TipoGasto& "','"&desembolso& "','"&envio& "' " 
		
						
						
			'Call getRS(RS1, lsSQL1)
			'If Not RS1.BOF And Not RS1.EOF Then 
			'	response.Write("1")
			'else
			'	lsSQL2 = "EXEC dbo.usp_VEliminaGO '"&TipoGasto& "','"&desembolso& "','"&envio& "' " 
			'	Call getRS(RS2, lsSQL2)
			'	response.Write("0")
			'end if
	else 
	
		id_GO=RS1("id_GOperativos")
		
		
		if estado <> "1" then'SOLO SI ESTADO NO ESTA CERRADO
				lsSQL = "EXEC dbo.upd_GastosOperativos_nvo '"&TipoGasto& "','"&desembolso& "','"&envio& "','"&inicio& "','"&fin&"', '"&id_GO&"', '"&id_Proyecto& "', '"&mes&"' " 
		 	response.write(lsSQL)
			
				
		
			Call getRS(RS, lsSQL)
			response.Write("3")

		else
			response.Write("2")
					
		end if
			

	end if
	
end if





'-----------------------------------------------------------------------

if lsTipo="89" then 

'TipoGasto=Request.Form("TipoGasto")
'desembolso=Request.Form("desembolso")
'envio=Request.Form("envio")
'id_Proyecto=Session("id_proyecto")
'mes=Request.Form("mes")


'	lsSQL1 = "EXEC dbo.uspGet_EstadoGO_nvo '"&TipoGasto& "','"&desembolso& "','"&envio& "', '"&id_Proyecto& "', '"&mes&"' " 
	
	
	TipoGasto=Request.Form("TipoGasto")
	desembolso=Request.Form("desembolso")
	envio=Request.Form("envio")

	id_Proyecto=Session("id_proyecto")
	mes=Request.Form("mes")

	lsSQL1 = "EXEC dbo.uspGet_EstadoGO_nvo '"&TipoGasto& "','"&desembolso& "','"&envio& "', '"&id_Proyecto& "', '"&mes&"' " 


	
	Call getRS(RS, lsSQL1)
	
	If Not RS.BOF And Not RS.EOF Then 
	estado=RS("estado")
	id_go=RS("id_GOperativos")
		if estado=0 then
			lsSQL1 = "EXEC dbo.uspUdp_GO "&id_go& ", " &id_Proyecto
			
			
			Call getRS(RS1, lsSQL1)
			response.write("0")
		else
			response.write("1")
		end if
	else
		response.Write("2")
	end if	
	
end if

'---------------------------------------------------------------------------

if lsTipo="90" then 

TipoGasto=Request.Form("TipoGasto")
desembolso=Request.Form("desembolso")
envio=Request.Form("envio")
id_Proyecto=Session("id_proyecto")

	lsSQL = "EXEC dbo.uspGet_EstadoGO '"&TipoGasto& "','"&desembolso& "','"&envio& "', '"&id_Proyecto&"' " 

	Call getRS(RS, lsSQL)
	
	If Not RS.BOF And Not RS.EOF Then 
	estado=RS("estado")
	id_go=RS("id_GOperativos")
		if estado=0 then
			lsSQL1 = "EXEC dbo.uspUpd_EstadoGO '"&id_go& "' " 
			Call getRS(RS1, lsSQL1)
			response.write("0")
		else
			response.write("1")
		end if
	else
	response.Write("2")
	end if	
	
end if





'--------------------------------------------------------------------

if lsTipo="92" then 

id_per1=Request.Form("id_per1")
id_Contratos1=Request.Form("id_Contratos1")
id_Asignacion1=Request.Form("id_Asignacion1")

id_per2=Request.Form("id_per2")
id_Contratos2=Request.Form("id_Contratos2")
id_Asignacion2=Request.Form("id_Asignacion2")
tipo=Request.Form("tipo")

lsSQL = "EXEC dbo.usUpd_cambioRutas'" & id_per1 & "','" & id_Contratos1 & "','" & id_Asignacion1 & "','" & id_per2 & "','" & id_Contratos2 & "','" & id_Asignacion2 & "', '"&tipo&"'"	

Call getRS(RS, lsSQL)

end if

'-----------------------------------------------------------------------------------


if lsTipo="94" then ' 


id_per=  Request.Form("id_per")
id_contratos=  Request.Form("id_contratos")
periodo = Request.Form("periodo")
valor = Request.Form("valor")
num = Request.Form("num")
usuario = Request.Form("usuario")
proyecto = Request.Form("proyecto")

lsSQL = " EXEC usp_actualizar_recibo '" & id_per & "','" & id_contratos & "','" & periodo & "' ,'" & valor & "','" & num & "','" & usuario & "','" & proyecto & "'"

  Call getRS(RS, lsSQL)
  
  if num=1 then 
  
evento="<input name=""txt"&id_contratos&""" validchars=""0123456789"" onKeyPress=""return TextUtil.allowChars(this, event)"" class=""etiqueta""  type=""text"" id=""txt"&id_contratos&""" value="""&valor&"""  onblur=""guardarRecibo('"&id_per&"','"&id_contratos&"','"&PERIODOPLA&"',this.value,'"&num&"','"&usuario&"','"&proyecto&"')"" size=""5"" maxlength=""4"" />"
elseif num=2  then
evento="<input name=""txt1"&id_contratos&""" validchars=""0123456789"" onKeyPress=""return TextUtil.allowChars(this, event)"" class=""etiqueta""  type=""text"" id=""txt1"&id_contratos&""" value="""&valor&"""  onblur=""guardarRecibo('"&id_per&"','"&id_contratos&"','"&PERIODOPLA&"',this.value,'"&num&"','"&usuario&"','"&proyecto&"')"" size=""10"" maxlength=""7"" />"
elseif num=3 then
evento="<input name=""txtF"&id_contratos&""" value="""&valor&""" validchars=""0123456789/"" onKeyPress=""return TextUtil.allowChars(this, event)"" class=""etiqueta""  type=""text"" id=""txtF"&id_contratos&"""  onKeyUp=""this.value=formateafecha(this.value);""  onblur=""guardarRecibo('"&id_per&"','"&id_contratos&"','"&PERIODOPLA&"',this.value,'"&num&"','"&usuario&"','"&proyecto&"')"" size=""10"" maxlength=""10"" />"

end if
response.Write(evento)


end if	

'--------------------------------------------------------------

if lsTipo="97" then 


lsCargo=Request.Form("lsCargo")
id_proyecto=Request.Form("id_proyecto")

	lsSQL2 = "EXEC dbo.get_Verifica_pase_planilla '"&lsCargo& "', '"&id_proyecto& "' " 
	

	Call getRS(RS2, lsSQL2)
	
	if RS2(0)>1 then
	response.Write("1")
	elseif RS2(0)=0 then
		lsSQL = "EXEC dbo.get_pase_planilla '"&lsCargo& "', '"&id_proyecto& "' "
		Call getRS(RS, lsSQL)
	end if
	
end if

'------------------------------------------------------------------

if lsTipo="98" then ' 


id_per=  Request.Form("id_per")
id_contratos=  Request.Form("id_contratos")
periodo = Request.Form("periodo")
valor = Request.Form("valor")
num = Request.Form("num")
usuario = Request.Form("usuario")
id_Proyecto=Session("id_proyecto")

lsSQL = " EXEC usp_actualizar_conf_detalle '" & id_per & "','" & id_contratos & "','" & periodo & "' ,'" & valor & "','" & num & "','" & usuario & "', '"&id_proyecto&"' "

  Call getRS(RS, lsSQL)
  
  if num=4 then 
  
evento="<input name=""txtP"&id_contratos&""" value="""&valor&""" validchars=""abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"" onKeyPress=""return TextUtil.allowChars(this, event)"" class=""etiqueta""  type=""text"" id=""txtP"&id_contratos&"""   onblur=""guardarPeriodo('"&id_per&"','"&id_contratos&"','"&PERIODOPLA&"',this.value,'"&num&"','"&usuario&"')"" size=""15"" maxlength=""15"" />"


elseif num=5  then
evento="<input name=""txtI"&id_contratos&""" value="""&valor&""" validchars=""0123456789/"" onKeyPress=""return TextUtil.allowChars(this, event)"" onKeyUp=""this.value=formateafecha(this.value);"" class=""etiqueta""  type=""text"" id=""txtI"&id_contratos&"""   onblur=""guardarPeriodo('"&id_per&"','"&id_contratos&"','"&PERIODOPLA&"',this.value,'"&num&"','"&usuario&"')"" size=""10"" maxlength=""10"" />"

elseif num=6 then
evento="<input name=""txtF"&id_contratos&""" value="""&valor&""" validchars=""0123456789/"" onKeyPress=""return TextUtil.allowChars(this, event)"" onKeyUp=""this.value=formateafecha(this.value);"" class=""etiqueta""  type=""text"" id=""txtF"&id_contratos&"""   onblur=""guardarPeriodo('"&id_per&"','"&id_contratos&"','"&PERIODOPLA&"',this.value,'"&num&"','"&usuario&"')"" size=""10"" maxlength=""10"" />"

end if
response.Write(evento)


end if	

'-------------------------------------------------------------------- 

if lsTipo="99" then 

'--------------INSERTA NUEVOS PROYECTOS


annio_meta = Request.Form("annio_meta")
codi_meta = Request.Form("codi_meta")
cod_proyecto = Request.Form("cod_proyecto")
codi_depe_tde = Request.Form("codi_depe_tde")
codi_depe_apro= Request.Form("codi_depe_apro")
desc_proyecto = Request.Form("desc_proyecto")
fase_meta = Request.Form("fase_meta")
usuario = Request.Form("usuario")



		lsSQL = "EXEC dbo.PA_PROYECTO_INSERTAR '"&annio_meta& "','"&codi_meta& "','"&cod_proyecto& "','"&codi_depe_tde& "','"&codi_depe_apro& "','"&desc_proyecto& "','"&fase_meta& "', '"&usuario& "' " 
	
		
		Call getRS(RS, lsSQL)
	
	call modMetas()
	
end if

'--------------------------------------------------------------

if lsTipo="100" then 

varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
valor=Request.Form("valor")
vmin=Request.Form("vmin")
vmax=Request.Form("vmax")
vcantidad=Request.Form("vcantidad")
id_proyecto=Request.Form("lproyecto")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

lscargo=Mid(plsCargo,2)

	SQL1 = "EXEC dbo.pa_ficha_calificacionAutoUP '" & lsCargo & "', '" & varccdd & "', '" & varccpp & "', '" & varccdi & "' , '" & id_proyecto & "', '" & valor & "', '" & vmin & "' , '" & vmax & "' , '" & vcantidad & "'" 
	

Call getRS(RS, SQL1)
	
end if 



'------------------------------------------------------------------------


if lsTipo="101" then ' Actualizar Ficha

dni=request.Form("dni")
pp=request.Form("pp")
ta=request.Form("ta")
pr=request.Form("pr")
vo=request.Form("vo")
inf=request.Form("inf")
mo=request.Form("mo")
qqf=request.Form("qqf")
qqsf=request.Form("qqsf")
id_proyecto=request.Form("id_proyecto")	
id_usuario=request.Form("id_usuario")	
ipVisitante=request.Form("ipVisitante")
obs=request.Form("obs")
				
	lsSQL = "EXEC dbo.pa_ficha_actualizaEntrevistaAlt '" & dni & "','" & pp & "','" & ta & "','" & pr & "','" & vo & "','" & inf & "','" & mo & "','" & qqf & "','" & qqsf & "','" & id_proyecto & "','" & id_usuario & "' ,'" & ipVisitante & "' ,'" & obs & "'"
	

  Call getRS(RS, lsSQL)

end if

'--------------------------------------------------------------

if lsTipo="102" then ' Actualizar Ficha

var1=request.Form("var1")
var2=request.Form("var2")
var3=request.Form("var3")
var4=request.Form("var4")
var5=request.Form("var5")
var6=request.Form("var6")
var7=request.Form("var7")
var8=request.Form("var8")
var9=request.Form("var9")	
var10=request.Form("var10")	
var11=request.Form("var11")
var12=request.Form("var12")
var13=request.Form("var13")
var14=request.Form("var14")
var151=request.Form("var151")
var16=request.Form("var16")
var171=request.Form("var171")
var18=request.Form("var18")
var191=request.Form("var191")
var20=request.Form("var20")
var211=request.Form("var211")
var22=request.Form("var22")
var231=request.Form("var231")
var24=request.Form("var24")
var251=request.Form("var251")
var26=request.Form("var26")
var271=request.Form("var271")
var28=request.Form("var28")
var291=request.Form("var291")
var30=request.Form("var30")
var311=request.Form("var311")
var32=request.Form("var32")
var33=request.Form("var33")

var152=request.Form("var152")
var172=request.Form("var172")
var192=request.Form("var192")
var212=request.Form("var212")
var232=request.Form("var232")
var252=request.Form("var252")
var272=request.Form("var272")
var292=request.Form("var292")
var312=request.Form("var312")

txtcci1=request.Form("txtcci1")
txtccf1=request.Form("txtccf1")
txtcapp1=request.Form("txtcapp1")
txtcci2=request.Form("txtcci2")
txtccf2=request.Form("txtccf2")
txtcapp2=request.Form("txtcapp2")
txtcci3=request.Form("txtcci3")
txtccf3=request.Form("txtccf3")
txtcapp3=request.Form("txtcapp3")


id_proyecto=request.Form("id_proyecto")
id_presupuesto=request.Form("id_presupuesto")
id_Conv=request.Form("id_Conv")

				
	lsSQL = "EXEC dbo.pa_AlgoritmoCV_insertar '" & var1 & "','" & var2 & "','" & var3 & "','" & var4 & "','" & var5 & "','" & var6 & "','" & var7 & "','" & var8 & "','" & var9 & "','" & var10 & "' ,'" & var11 & "','" & var12 & "','" & var13 & "','" & var14 & "','" & var151 & "','" & var16 & "','" & var171 & "','" & var18 & "','" & var191 & "','" & var20 & "', '" & var211 & "','" & var22 & "','" & var231 & "','" & var24 & "','" & var251 & "','" & var26 & "','" & var271 & "','" & var28 & "','" & var291 & "','" & var30 & "' ,'" & var311 & "','" & var32 & "','" & var33 & "','" & var152 & "','" & var172 & "','" & var192 & "','" & var212 & "','" & var232 & "','" & var252 & "','" & var272 & "','" & var292 & "','" & var312 & "','" & id_proyecto & "','" & id_presupuesto & "','" & id_Conv & "' ,'" & txtcci1 & "' ,'" & txtccf1 & "','" & txtcapp1 & "','" & txtcci2 & "','" & txtccf2 & "','" & txtcapp2 & "','" & txtcci3 & "','" & txtccf3 & "','" & txtcapp3 & "'"

  Call getRS(RS, lsSQL)

end if  

'------------------------------------------------------------------
if lsTipo="103" then

codigo=Request.Form("codigo")
valor=Request.Form("valor")
indicador=Request.Form("indicador")

SQL1 = "exec dbo.pa_Profesion_Agreagar '"& codigo &"','"& valor &"','"& indicador &"' "

Call getRS(RS, SQL1)

end if

'---------------------------------------------------------------------
if lsTipo="104" then

SQL1 = "exec dbo.pa_Profesion_Limpiar  "

Call getRS(RS, SQL1)

end if

'---------------------------------------------------------------------

if lsTipo="105" then

lsid=  Request.Form("id")
lsVal=  Request.Form("valor")
lsdiv = Request.Form("div")

lsSQL = " EXEC pd_ubigeoCargo_actualiza_pea '" & lsid & "','" & lsVal & "' "

  Call getRS(RS, lsSQL)
  
evento="<input name="""&lsid&""" validchars=""0123456789"" onKeyPress=""return TextUtil.allowChars(this, event)"" class=""etiqueta""  type=""text"" id="""&lsid&""" value="""&lsVal&"""  onblur=""guardar('"&lsdiv&"','"&lsid&"',this.value)"" size=""5"" maxlength=""5"" />"

response.Write(evento)

end if
'------------------------------------------------------------------------

if lsTipo="106" then ' INGRESAR META CAPA

lsid_per=  Request.Form("id_per")
lsVal=  Request.Form("valor")
lsusuario = Request.Form("usuario")
lsIndic= Request.Form("indic")

idProyecto=Session("id_proyecto")

lsSQL = " EXEC pa_ficha_ActAsistenciaCap '" & lsid_per & "','" & lsVal & "','" & lsusuario & "' ,'" & lsIndic & "' ,'" & idProyecto & "'"

  Call getRS(RS, lsSQL)

end if

'------------------------------------------------------------------------
if lsTipo="107" then ' INGRESAR META CAPA

id=  Request.Form("id")
ccdd=  Request.Form("ccdd")
ccpp = Request.Form("ccpp")
ccdi= Request.Form("ccdi")
pea= Request.Form("pea")
tipo=Request.Form("tipo")
usuario = Session("id_usuario")

lsSQL = " EXEC pa_ubigeocargo_modificar'" & id & "','" & ccdd & "','" & ccpp & "' ,'" & ccdi & "','" & pea & "','"&tipo&"' ,'"&usuario&"' "

  Call getRS(RS, lsSQL)

end if

'------------------------------------------------------------------------

if lsTipo="108" then ' INGRESAR META CAPA

id_cc=  Request.Form("id_cc")
flag=  Request.Form("flag")

lsSQL = " EXEC pa_convocatoriacargo_ActivarTest'" & id_cc & "', '"&flag&"'  "

  Call getRS(RS, lsSQL)

end if

'------------------------------------------------------------------------
if lsTipo="109" then ' INGRESAR META CAPA

id_cc=  Request.Form("Id_ConvocatoriaCargo")

lsSQL = " EXEC pa_convocatoriacargo_eliminar'" & id_cc & "'  "

  Call getRS(RS, lsSQL)
  response.Write("2")

end if
'------------------------------------------------------------------------
if lsTipo="110" then ' INGRESAR META CAPA

id_cc=  Request.Form("Id_ConvocatoriaCargo")
valor=  Request.Form("valor")

lsSQL = " EXEC pa_convocatoriacargo_ActEstado'" & id_cc & "', '"&valor&"'  "

  Call getRS(RS, lsSQL)
  response.Write("2")

end if
'------------------------------------------------------------------------

if lsTipo="111" then 

txtcant =Request.Form("txtcant")
codi_carg =Request.Form("codi_carg")
desc_carg =Request.Form("desc_carg")
codi_meta =Request.Form("codi_meta")
desc_meta=Request.Form("desc_meta")
cmbComptencias =Request.Form("cmbComptencias")

usuario = Session("id_usuario")

sql2 = "exec dbo.PA_PROCESOCAS_VERIFICA_INSERT '"& txtcant &"', '"& codi_carg &"','"& codi_meta &"' "	


Call getRS(RS, sql2)

	entra="NO"
	If Not RS.BOF And Not RS.EOF Then entra="SI"
		
		if entra="NO" then 
		SQL1 = "exec dbo.PA_PROCESOCAS_INSERT '"& txtcant &"','"& codi_carg &"','"& desc_carg &"' ,'"& codi_meta &"','"& desc_meta &"','"& cmbComptencias &"','"& usuario &"' "	
		Call getRS(RS1, SQL1)
		end  if
		
		if entra="SI" then 
		response.Write("2")
		response.End()
		end if 

end if

'------------------------------------------------------------------------

if lsTipo="112" then ' INGRESAR META CAPA

dni=  Request.Form("dni")
ape_pat=  Request.Form("ape_pat")
ape_mat=  Request.Form("ape_mat")
nombres=  Request.Form("nombres")
fec_nac=  Request.Form("fec_nac")
sexo=  Request.Form("sexo")
num_proc=  Request.Form("num_proc")
cargo=  Request.Form("cargo")
test_P=  Request.Form("test")
ODEI=  Request.Form("ODEI")

usuario = Session("id_usuario")
ipVisitante = Request.ServerVariables("REMOTE_ADDR")

lsSQL = " EXEC PA_FICHA_1_INSERT '"&dni&"', '"&ape_pat&"', '"&ape_mat&"' , '"&nombres&"' , '"&fec_nac&"', '"&sexo&"', '"&num_proc&"', '"&cargo&"', '"&test_P&"', '"&usuario&"', '"&ipVisitante&"', '"&ODEI&"' "

  Call getRS(RS, lsSQL)

end if


'------------------------------------------------------------------------


if lsTipo="113" then ' INGRESAR META CAPA

total_pea=  Request.Form("total_pea")
n_periodo=  Request.Form("n_periodo")
periodo=  Request.Form("periodo")
id_presupuesto=  Request.Form("id_presupuesto")
sueldo=  Request.Form("sueldo")
usuario= Session("id_usuario")
armadas=Request.Form("armadas")


idProyecto=Session("id_proyecto")


'lsSQL = " EXEC PA_PRESUPUESTO_DET_INSERT '"&id_presupuesto&"', '"&total_pea&"', '"&n_periodo&"' , '"&periodo&"' ,'"&sueldo&"' ,'"&usuario&"' "


'f  idProyecto = 206 or idProyecto = 211 then 
	lsSQL = " EXEC PA_PRESUPUESTO_DET_INSERT '"&id_presupuesto&"', '"&total_pea&"', '"&n_periodo&"' , '"&periodo&"' ,'"&sueldo&"' ,'"&usuario&"' ,"&armadas&" "
'end if 


response.write(lsSQL)

  Call getRS(RS, lsSQL)

end if



'----------------------------------------------------------------------------------

if lsTipo="114" then 
lsidper=Request.Form("lsidper")
lsvalor=Request.Form("lsvalor")

id_proyecto=Session("id_proyecto")

lsSQL = "EXEC dbo.pa_ficha_bloqContrato '" & lsidper & "','" & lsvalor & "', '"&id_proyecto&"'"	


Call getRS(RS, lsSQL)

end if


'----------------------------------------------------------------------------------

if lsTipo="115" then 

num_convocatoria = Request.Form("num_convocatoria")
txtfechFinM = Request.Form("txtfechFinM")
txtHoraFinM = Request.Form("txtHoraFinM")
txtfechFinPS = Request.Form("txtfechFinPS")

id_usuario=Session("id_usuario")

	sql1 = "EXEC dbo.pa_convocatoria_ampliar '" & num_convocatoria & "', '" & txtfechFinM & "', '" & txtHoraFinM & "', '" & txtfechFinPS & "','" & id_usuario & "' " 
	
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		response.write "1"
		
		Set RsP = Nothing

end if

'----------------------------------------------------------------------------------

if lsTipo="116" then 

num_convocatoria = Request.Form("num_convocatoria")
id_ConvocatoriaCargo = Request.Form("id_ConvocatoriaCargo")
id_proyecto = Request.Form("id_proyecto")
txtNumComunicado = Request.Form("txtNumComunicado")
txtComunicado = Request.Form("txtComunicado")

id_usuario=Session("id_usuario")

sql1 = "EXEC dbo.pa_comunicado_convocatoria_inserta '" & num_convocatoria & "', '" & id_ConvocatoriaCargo & "', '" & id_proyecto & "','" & txtNumComunicado & "' ,'" & txtComunicado & "' ,'" & id_usuario & "' " 
	
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		response.write "1"
		
		Set RsP = Nothing

end if


' --------------------------------------------------------------------------------------------------------------------------------
if lsTipo="117" then 

valor = Request.Form("valor")
id = Request.Form("id")
id_usuario=Session("id_usuario")

sql1 = "EXEC dbo.pa_comunicadoConv_update_estado '" & valor & "', '" & id & "' , '" & id_usuario & "'" 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		Set RsP = Nothing

end if

' --------------------------------------------------------------------------------------------------------------------------------
if lsTipo="118" then 

num_comunicado = Request.Form("num_comunicado")
comunicado = Request.Form("comunicado")
id = Request.Form("id")
id_usuario=Session("id_usuario")

comunicado=Replace(comunicado,CHR(13),"<br>")

sql1 = "EXEC dbo.pa_comunicadoConv_update_contenido '" & num_comunicado & "', '" & comunicado & "' , '" & id & "'  , '" & id_usuario & "' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		Set RsP = Nothing

end if

' --------------------------------------------------------------------------------------------------------------------------------
if lsTipo="119" then 

id_presupuesto = Request.Form("id_presupuesto")
id_usuario = Request.Form("id_usuario")
ip_usuario = Request.Form("ip_usuario")
valor_act = Request.Form("valor_act")
flag = Request.Form("flag")

val="0"

sql1 = "EXEC dbo.pa_presupuesto_verifica '" & id_presupuesto & "' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		certificado=RsP(1)
		convocado=RsP(2)
		
		Set RsP = Nothing

		if flag=1 and convocado>=1 THEN
		 response.Write("2")
		 response.end()
		end if
		
		if flag=2 and certificado>=1 THEN
		 response.Write("3")
		 response.end()
		end if
		
	sql2 = "EXEC dbo.pa_presupuesto_actualiza '" & id_presupuesto & "', '" & id_usuario & "', '" & ip_usuario & "', '" & valor_act & "', '" & flag & "'" 

		Set RsP2 = Server.CreateObject("ADODB.Recordset")
		RsP2.cursorlocation=3
		RsP2.Open sql2, MiCone, 3,3	
		
		response.Write("1")
		
		Set RsP2 = Nothing

end if


' --------------------------------------------------------------------------------------------------------------------------------
if lsTipo="120" then 

id_ccp = Request.Form("id_ccp")
id_usuario = Request.Form("id_usuario")
ip_usuario = Request.Form("ip_usuario")
valor_act = Request.Form("valor_act")
flag = Request.Form("flag")

id_Proyecto=Session("id_proyecto")

val="0"

'sql1 = "EXEC dbo.pa_presupuesto_verifica '" & id_ccp & "' " 

'response.Write(sql1)
'response.End()

		'Set RsP = Server.CreateObject("ADODB.Recordset")
		'RsP.cursorlocation=3
		'RsP.Open sql1, MiCone, 3,3
		
		tipo_ofc=1
		
		'Set RsP = Nothing

		
	sql2 = "EXEC dbo.pa_ccpresupuestario_actualiza '" & id_ccp & "', '" & id_usuario & "', '" & ip_usuario & "', '" & valor_act & "', '" & flag & "', '" & tipo_ofc & "' ,'" & id_proyecto & "'  " 
	

		Set RsP2 = Server.CreateObject("ADODB.Recordset")
		RsP2.cursorlocation=3
		RsP2.Open sql2, MiCone, 3,3	
		
		response.Write("1")
		
		Set RsP2 = Nothing

end if


'--------------------------------------------------------------------------------------------------------------------------------
if lsTipo="121" then 


of_solicitud = Request.Form("of_solicitud")
fsolicitudSR = Request.Form("fsolicitudSR")
of_rebaja = Request.Form("of_rebaja")
fechaRebaja = Request.Form("fechaRebaja")
PEA_REBAJA = Request.Form("PEA_REBAJA")
hmonto_rebaja = Request.Form("hmonto_rebaja")
ID_CCP = Request.Form("ID_CCP")
id_usuario = Request.Form("id_usuario")
ipVisitante = Request.Form("ipVisitante")
ID_PRESUPUESTO = Request.Form("ID_PRESUPUESTO")

id_Proyecto=Session("id_proyecto")

sql1 = "EXEC dbo.PA_CCPRESUPUESTARIO_REBAJA_INSERTAR '" & of_solicitud & "' ,'" & fsolicitudSR & "' ,'" & of_rebaja & "' ,'" & fechaRebaja & "' ,'" & PEA_REBAJA & "' ,'" & hmonto_rebaja & "' ,'" & ID_CCP & "' ,'" & id_usuario & "' ,'" & ipVisitante & "' , '" & ID_PRESUPUESTO & "' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		Set RsP = Nothing

end if


if lsTipo="122" then 

texto = Request.Form("texto")
id = Request.Form("id")

id_Proyecto=Session("id_proyecto")
id_usuario=Session("id_usuario")

sql1 = "EXEC dbo.PA_COMUNICADO_ARCHIVO '" & texto & "' ,'" & id & "' ,'" & id_proyecto & "' ,'" & id_usuario & "'  " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		
		Set RsP = Nothing


end if

if lsTipo="123" then 

txtCapacitacion = Request.Form("txtCapacitacion")
lsFechainicio = Request.Form("lsFechainicio")
lsFechaFin = Request.Form("lsFechaFin")
id_proyecto = Request.Form("id_proyecto")

id_usuario=Session("id_usuario")

sql1 = "EXEC dbo.PA_capacitacionPea_insertar '" & txtCapacitacion & "' ,'" & lsFechainicio & "' ,'" & lsFechaFin & "' ,'" & id_proyecto & "' ,'" & id_usuario & "' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		
		Set RsP = Nothing


end if

if lsTipo="124" then 

varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsConvCar=Request.Form("lsConvCar")
VALOR=Request.Form("VALOR")

id_proyecto=session("id_proyecto") 
id_rol=Session("txtTipoUsuarioValido")
id_usuario=Session("id_usuario")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

cargo = Mid(plsCargo,2)


sql1 = "EXEC dbo.pa_v_ranking_x_experiencia_actualizar_ '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsConvCar & "', '"&id_proyecto&"' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		
		Set RsP = Nothing


end if


if lsTipo="125" then 

varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsConvCar=Request.Form("lsConvCar")
lsCierre=Request.Form("lsCierre")
indic=Request.Form("indic")
VALOR=Request.Form("VALOR")

id_proyecto=session("id_proyecto") 
id_rol=Session("txtTipoUsuarioValido")
id_usuario=Session("id_usuario")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

cargo = Mid(plsCargo,2)


sql1 = "EXEC dbo.pa_cierre_procesos '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsConvCar & "', '" & lsCierre & "', '" & indic & "', '"&id_proyecto&"' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		
		Set RsP = Nothing


end if



if lsTipo="126" then 

varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsConvCar=Request.Form("lsConvCar")
lsCierre=Request.Form("lsCierre")
indic=Request.Form("indic")
VALOR=Request.Form("VALOR")

id_proyecto=session("id_proyecto") 
id_rol=Session("txtTipoUsuarioValido")
id_usuario=Session("id_usuario")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)


sql1 = "EXEC dbo.pa_v_ranking_x_experiencia_actualizar_selec '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsConvCar & "', '"&id_proyecto&"' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		
		Set RsP = Nothing


end if


if lsTipo="127" then 

	lsConvCar=Request.Form("lsConvCar")
	id_proyecto=session("id_proyecto")
	varccddTot = Request.Form("lsDPTO")
	varccppTot = Request.Form("lsPROV")
	varccdiTot = Request.Form("lsDIST")
	
	varccdd = Mid(varccddTot,1,2)
	varccpp = Mid(varccppTot,3,2)
	varccdi = Mid(varccdiTot,5,2)
	
	if id_proyecto<>156 then
		sql1 = "EXEC dbo.pa_v_ranking_x_experiencia_select_actualizar_nacional '" & lsConvCar & "', '"&id_proyecto&"' " 
		lsSQL
		'response.write(sql1)		response.End()

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3		
		
		Set RsP = Nothing
		
   else
     if lsConvCar=6447 then   '-- CL - ACL CONVACAR	 

		sql1 = "EXEC dbo.pa_v_ranking_x_ednom162_nivel_2_selec_cl_acl '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsConvCar & "', 'N' " 
		
		'response.Write(sql1)		response.End()

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3		
		
		Set RsP = Nothing
 
     elseif lsConvCar=6446 then    '- -- INFORMATICO LOCAL CONVACAR
	 
		sql1 = "EXEC dbo.pa_v_ranking_x_ednom162_nivel_2_selec_inf '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsConvCar & "', 'N' " 
		
		'response.Write(sql1)		response.End()

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3		
		
		Set RsP = Nothing	  
	  end if
   end if    
   
end if


if lsTipo="128" then 

id_proyecto=session("id_proyecto")

if idProyecto="103" then
	lsSQL = "EXEC dbo.pa_registrar_pea_aulas_nac_ece "
	else
sql1 = "EXEC dbo.pa_registrar_pea_aulas_nac " 

end if

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		Set RsP = Nothing


end if

if lsTipo="129" then 

sql1 = "EXEC dbo.pa_eliminar_aulas_preseleccion " 


		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		
		Set RsP = Nothing


end if

if lsTipo="130" then 

sql1 = "EXEC dbo.pa_registrar_aulas " 


		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		
		Set RsP = Nothing


end if


if lsTipo="131" then 

	'id_proyecto=session("id_proyecto") 
	'id_usuario=Session("id_usuario")
	lsCargo=Request.Form("Cargo")
	
	'sql1 = "EXEC dbo.PA_LISTAR_SEDES_RANKIN  "
	sql1 = "EXEC dbo.pa_v_ranking_CV_censo_auto  '"& lsCargo &"'"
	Set RsP = Server.CreateObject("ADODB.Recordset")
	RsP.cursorlocation=3
	RsP.Open sql1, MiCone, 3,3
	
	'Do While Not RsP.EOF
	'	sql12 = "EXEC dbo.pa_v_ranking_x_experiencia_actualizar_selec '"&RsP(0)&"','"&RsP(1)&"','"&RsP(2)&"','2756','"&id_proyecto&"','"&id_usuario&"' " 
	
	'	Set RsP2 = Server.CreateObject("ADODB.Recordset")
	'	RsP2.cursorlocation=3
	'	RsP2.Open sql12, MiCone, 3,3
	'	Set RsP2 = Nothing

	'	RsP.MoveNext
	'Loop	
				
	Set RsP = Nothing
	
	'ccdd=Request.Form("ccdd")
	'ccpp=Request.Form("ccpp")
	'ccpp = Mid(ccpp,4,2)
	'ccdi=Request.Form("ccdi")
	'ccdi = Mid(ccdi,6,2)
	'cargo=Request.Form("cargo")
	'id_proyecto=session("id_proyecto") 
	'id_usuario=Session("id_usuario")
	'convo=Request.Form("convo")

	' ------------------------------- NIVEL 2 --------------EDNOM 2016
	'sql1 = "EXEC dbo.pa_v_ranking_x_ednom162_nivel_3_selec_apli_or '"&ccdd&"','"&ccpp&"','"&ccdi&"','6552', 'N'"
	'sql2 = "EXEC dbo.pa_v_ranking_x_ednom162_nivel_2_selec_opeinf '"&ccdd&"','"&ccpp&"','"&ccdi&"','6553', 'N'"
	
	'Set RsP = Server.CreateObject("ADODB.Recordset")
	'RsP.cursorlocation=3
	'MiCone.commandtimeout = 10000
	'RsP.Open sql1, MiCone, 3,3
	'Set RsP = Nothing
	
	'Set RsP2 = Server.CreateObject("ADODB.Recordset")
	'RsP2.cursorlocation=3
	'MiCone.commandtimeout = 10000
	'RsP2.Open sql2, MiCone, 3,3
	'Set RsP2 = Nothing
end if


if lsTipo="132" then 


ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp") 
ccdi=Request.Form("ccdi")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")

sql1 = "EXEC dbo.pa_v_ranking_x_experiencia_actualizar_selec '"&ccdd&"','"&ccpp&"','"&ccdi&"','2756','"&id_proyecto&"','"&id_usuario&"' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing

end if


if lsTipo="133" then 

varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
plsCargo = Request.Form("lsCargo")
lsUsuario=Request.Form("lsUsuario")
lsConvCar=Request.Form("lsConvCar")
lsCierre=Request.Form("lsCierre")
indic=Request.Form("indic")
VALOR=Request.Form("VALOR")

id_proyecto=session("id_proyecto") 
id_rol=Session("txtTipoUsuarioValido")
id_usuario=Session("id_usuario")



varccdd = varccddTot
cantvarccppTot=len(varccppTot)
varccpp = Mid(varccppTot,4,2)
cantvarccdiTot=len(varccdiTot)
varccdi = Mid(varccdiTot,6,2)
cargo = Mid(plsCargo,2)



sql1 = "EXEC dbo.pa_cierre_procesos '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsConvCar & "', '" & lsCierre & "', '" & indic & "', '"&id_proyecto&"' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		
		Set RsP = Nothing


end if


if lsTipo="134" then 


ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp") 
ccdi=Request.Form("ccdi")
cargo=Request.Form("cargo")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")
convo=Request.Form("convo")

'------------------------------------NIVEL II Primera convocatoria
'sql1 = "EXEC dbo.pa_v_ranking_nacional_ece '"&ccdd&"','"&ccpp&"','"&ccdi&"','3394','"&id_proyecto&"','"&id_usuario&"' " 

sql1 = "EXEC dbo.pa_v_ranking_nacional_ece '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&convo&"','"&id_proyecto&"','"&id_usuario&"' " 
RESPONSE.WRITE(sql1)
response.End()
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing

end if


if lsTipo="135" then 


ape_nom=UCase(Request.Form("ape_nom"))
dni=Request.Form("dni") 
proy=UCase(Request.Form("proy"))
annio=Request.Form("annio") 
obs=UCase(Request.Form("obs"))
responsable=UCase(Request.Form("responsable"))

nav = Request.ServerVariables("HTTP_USER_AGENT") 
ipVisitante = Request.ServerVariables("REMOTE_ADDR")

id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")
		

sql1 = "EXEC dbo.pa_guardar_observados '"&ape_nom&"','"&dni&"','"&proy&"','"&annio&"','"&obs&"','"&responsable&"','"&nav&"','"&ipVisitante&"','"&id_proyecto&"','"&id_usuario&"' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing

end if

if lsTipo="136" then 

dni=Request.Form("dni") 
flag=Request.Form("flag") 
id_proyecto=session("id_proyecto") 

sql1 = "EXEC dbo.pa_observados_verifica_dni '"&dni&"', '"&flag&"','"&id_proyecto&"' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3

	response.Write(RsP("existe"))


		Set RsP = Nothing

end if


if lsTipo="137" then 

ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp") 
ccdi=Request.Form("ccdi")
cargo=Request.Form("cargo")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")

if cargo=1616 then
	 tip=1 
else
	tip=2
end if

Set RsP = Server.CreateObject("ADODB.Recordset")
RsP.cursorlocation=3

		
sql1 = "EXEC pa_v_ranking_x_final_ece  '', '', '', 3394, 103, 2, 'T'"

'sql1 = "EXEC dbo.pa_v_ranking_x_final_ece '', '', '','"&cargo&"','"&id_proyecto&"', '"& tip &"' , 'T' " 

RsP.Open sql1, MiCone, 3,3

		
		

Set RsP1 = Server.CreateObject("ADODB.Recordset")
RsP1.cursorlocation=3

sql2 = "EXEC pa_v_ranking_x_final_ece  '', '', '', 3394, 103, 1, 'T'"

'sql1 = "EXEC dbo.pa_v_ranking_x_final_ece '', '', '','"&cargo&"','"&id_proyecto&"', '"& tip &"' , 'T' " 


'		Set RsP = Server.CreateObject("ADODB.Recordset")
'		RsP.cursorlocation=3
		RsP1.Open sql2, MiCone, 3,3		

	response.Write(RsP("ok"))


		Set RsP = Nothing

end if



if lsTipo="137" then 

ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp") 
ccdi=Request.Form("ccdi")
cargo=Request.Form("cargo")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")

if cargo=1616 then
	 tip=1 
else
	tip=2
end if

Set RsP = Server.CreateObject("ADODB.Recordset")
RsP.cursorlocation=3

		
sql1 = "EXEC pa_v_ranking_x_final_ece  '', '', '', 3394, 103, 2, 'T'"

'sql1 = "EXEC dbo.pa_v_ranking_x_final_ece '', '', '','"&cargo&"','"&id_proyecto&"', '"& tip &"' , 'T' " 

RsP.Open sql1, MiCone, 3,3

		
		

Set RsP1 = Server.CreateObject("ADODB.Recordset")
RsP1.cursorlocation=3

sql2 = "EXEC pa_v_ranking_x_final_ece  '', '', '', 3394, 103, 1, 'T'"

'sql1 = "EXEC dbo.pa_v_ranking_x_final_ece '', '', '','"&cargo&"','"&id_proyecto&"', '"& tip &"' , 'T' " 


'		Set RsP = Server.CreateObject("ADODB.Recordset")
'		RsP.cursorlocation=3
		RsP1.Open sql2, MiCone, 3,3		

	response.Write(RsP("ok"))


		Set RsP = Nothing

end if


if lsTipo="138" then 


ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp")
ccpp = Mid(ccpp,4,2)
 
ccdi=Request.Form("ccdi")
ccdi = Mid(ccdi,6,2)

cargo=Request.Form("cargo")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")
convo=Request.Form("convo")

'------------------------------------NIVEL II Primera convocatoria
'sql1 = "EXEC dbo.pa_v_ranking_nacional_ece '"&ccdd&"','"&ccpp&"','"&ccdi&"','3394','"&id_proyecto&"','"&id_usuario&"' " 


sql1 = "EXEC dbo.pa_v_ranking_x_final_ece_seleccion_apli '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&convo&"','"&id_proyecto&"', 'D', '" &cargo&"'"



		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing

end if



if lsTipo="139" then 


ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp")
ccpp = Mid(ccpp,4,2)
 
ccdi=Request.Form("ccdi")
ccdi = Mid(ccdi,6,2)

cargo=Request.Form("cargo")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")
convo=Request.Form("convo")

'------------------------------------NIVEL II Primera convocatoria
'sql1 = "EXEC dbo.pa_v_ranking_nacional_ece '"&ccdd&"','"&ccpp&"','"&ccdi&"','3394','"&id_proyecto&"','"&id_usuario&"' " 


sql1 = "EXEC dbo.pa_v_ranking_x_final_ece_seleccion_apli '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&convo&"','"&id_proyecto&"', 'N', '" &cargo&"'"


		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing

end if


if lsTipo="140" then 


ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp")
ccpp = Mid(ccpp,4,2)
 
ccdi=Request.Form("ccdi")
ccdi = Mid(ccdi,6,2)

cargo=Request.Form("cargo")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")
convo=Request.Form("convo")

'------------------------------------NIVEL II Primera convocatoria
'sql1 = "EXEC dbo.pa_v_ranking_nacional_ece '"&ccdd&"','"&ccpp&"','"&ccdi&"','3394','"&id_proyecto&"','"&id_usuario&"' " 


sql1 = "EXEC dbo.pa_v_ranking_x_final_ece_preselec_apli_fin '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&convo&"','"&id_proyecto&"', 'S', '" &cargo&"'"


		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing

end if


if lsTipo="141" then 


ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp")
ccpp = Mid(ccpp,4,2)
 
ccdi=Request.Form("ccdi")
ccdi = Mid(ccdi,6,2)

cargo=Request.Form("cargo")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")
convo=Request.Form("convo")

'------------------------------------NIVEL II Primera convocatoria
'sql1 = "EXEC dbo.pa_v_ranking_nacional_ece '"&ccdd&"','"&ccpp&"','"&ccdi&"','3394','"&id_proyecto&"','"&id_usuario&"' " 


sql1 = "EXEC dbo.pa_v_ranking_x_final_ece_preselec_apli_fin '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&convo&"','"&id_proyecto&"', 'N', '" &cargo&"'"


		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing

end if


if lsTipo="142" then 

cargo=Request.Form("lsCargo")
'------------COMENTADO
	
			'if cargo=1616 then 
			'SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria '', '', '' ,'N', '"&cargo&"' , '0' "
			'else 
			'SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria_EIB '', '', '' ,'N', '"&cargo&"' , '0' "
			'end if
			
			'----------------------procesa solo lo faltante
			if cargo=1616 then 
			SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria '', '', '' ,'N', '"&cargo&"' , '1' "
			else 
			SQL1 = "exec dbo.pa_ece_asigna_rutas_d1_primaria_EIB '', '', '' ,'N', '"&cargo&"' , '1' "
			end if
		

	Set RSCuad = Server.CreateObject("ADODB.Recordset")
	MiCone.commandtimeout = 10000
	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3
	
	
	Set RSCuad = Nothing

end if 


if lsTipo="143" then 

			SQL1 = "exec dbo.pa_ece_pase_siga '', '', '' ,'N' "
			
	Set RSCuad = Server.CreateObject("ADODB.Recordset")
	MiCone.commandtimeout = 10000
	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3
	
	Set RSCuad = Nothing

end if 


if lsTipo="144" then 

idreg1=Request.Form("idreg1")
id_per1=Request.Form("id_per1")
dni1=Request.Form("dni1")
ape_pat1=Request.Form("ape_pat1")
ape_mat1=Request.Form("ape_mat1")
nombres1=Request.Form("nombres1")

idreg2=Request.Form("idreg2")
id_per2=Request.Form("id_per2")
dni2=Request.Form("dni2")
ape_pat2=Request.Form("ape_pat2")
ape_mat2=Request.Form("ape_mat2")
nombres2=Request.Form("nombres2")

motivo=Request.Form("motivo")

id_usuario=Session("id_usuario")

			SQL1 = "exec dbo.pa_cambio_rutas_ece '"&idreg1&"', '"&id_per1&"', '"&dni1&"' ,'"&ape_pat1&"','"&ape_mat1&"','"&nombres1&"', '"&idreg2&"', '"&id_per2&"', '"&dni2&"' ,'"&ape_pat2&"','"&ape_mat2&"','"&nombres2&"','"&motivo&"', '"&id_usuario&"' "
			

	Set RSCuad = Server.CreateObject("ADODB.Recordset")
	MiCone.commandtimeout = 10000
	RSCuad.cursorlocation = 3
	RSCuad.Open SQL1, MiCone, 3, 3
	
	response.write("1")
	
	
	Set RSCuad = Nothing

end if 


if lsTipo="145" then 


ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp")
ccpp = Mid(ccpp,4,2)
 
ccdi=Request.Form("ccdi")
ccdi = Mid(ccdi,6,2)

cargo=Request.Form("cargo")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")
convo=Request.Form("convo")


' ------------------------------- NIVEL 2 --------------EDNOM 2016
sql1 = "EXEC dbo.pa_v_ranking_x_ednom_nivel_2_bandaprob '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&convo&"', 'N'"
response.write(sql1)


		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3

		Set RsP = Nothing

end if



if lsTipo="146" then 
lsidper=Request.Form("lsidper")
lsvalor=Request.Form("lsvalor")
lsIdPresupuesto=Request.Form("lsIdPresupuesto")
lsIdConvocatoriaCargo=Request.Form("lsIdConvocatoriaCargo")

id_proyecto=Session("id_proyecto")


lsSQL = "EXEC dbo.usp_act_VerPEAaContratar '" & lsIdPresupuesto & "','" & lsIdConvocatoriaCargo & "', '"&id_proyecto&"', '"&lsvalor&"'"		


Call getRS(RS, lsSQL)


end if

'----------------------------------------------------------------------------------
if lsTipo="147" then ' ELIMINAR CCPRESUPUESTARIO

id_cc=  Request.Form("Id_ccpresupuestario")

lsSQL = " EXEC pa_CCPRESUPUESTARIO_eliminar'" & id_cc & "'  "

  Call getRS(RS, lsSQL)
  response.Write("2")

end if
'------------------



if lsTipo="148" then ' Insertar nuevo registro de algoritmo de formación academica

nivel =Request("nivel")
grado =Request("grado")
id_cc =Request("id_cc")
test_psico =Request("test_psico")
mom_psico =Request("mom_psico")
test_cono =Request("test_cono")
mom_cono =Request("mom_cono")
id_usuario=Session("id_usuario")


     Datos_adicionales = Request("Datos_adicionales")  
  Adjuntar_cv= Request("Adjuntar_cv")  
  
 ver_tambo=Request("ver_tambo")  
  valProvNac=Request("valProvNac")  
  valDistNac=Request("valDistNac")  
  valDptoNac=Request("valDptoNac")  
  
  
  
  valHijoUnico=Request("valHijoUnico")  
  valJefeHogar=Request("valJefeHogar")  
  valLengMat=Request("valLengMat")  
  valLeng=Request("valLeng")  
  valIdiomaC=Request("valIdiomaC")  
  valNivelIdioma=Request("valNivelIdioma")  
  valDomIdioma=Request("valDomIdioma")  
  valOperTel=Request("valOperTel")  
  valFecExpGrado = Request("valFecExpGrado")  
  valRegGrado = Request("valRegGrado")  
  valperioalc =Request("valperioalc")  
  valPeriodo = Request("valPeriodo")  
  
  
  valUniversidad = Request("valUniversidad")  
  valCentro = Request("valCentro")  
  valTipZona = Request("valTipZona")  
  valNomZona = Request("valNomZona")  
  
  valExpNomInst = Request("valExpNomInst")  
  valExpTiempoAnio = Request("valExpTiempoAnio")  
  valExpTiempoMeses = Request("valExpTiempoMeses")  
  valProyectosInei = Request("valProyectosInei")  
   
  valInstitucion = Request("valInstitucion")  
  valFechaNac = Request("valFechaNac")  
  valEdad = Request("valEdad")
  

  valZonaRes = Request("valZonaRes")  
  valSeccionRes = Request("valSeccionRes")  
  valGeoreferenciacion = Request("valGeoreferenciacion")
  
  valRNP = Request("valRNP")
  
  
'sql1 = "EXEC dbo.pa_convocatoriacargo_actualizar_ng'"& nivel &"', '"& grado &"', '"& id_cc &"', '"& test_psico &"', '"& mom_psico &"', '"& test_cono &"', '"& mom_cono &"', '"& id_usuario &"' "


sql1 = "EXEC dbo.pa_convocatoriacargo_actualizar_ng'"& nivel &"', '"& grado &"', '"& id_cc &"', '"& test_psico &"', '"& mom_psico &"', '"& test_cono &"', '"& mom_cono &"', '"& id_usuario &"', '"&Datos_adicionales&"', '"&Adjuntar_cv&"', '"&ver_tambo&"', '"&valProvNac&"', '"&valDistNac&"', '"&valDptoNac&"', '"&valHijoUnico&"', '"&valJefeHogar&"', '"&valLengMat&"', '"&valLeng&"', '"&valIdiomaC&"', '"&valNivelIdioma&"', '"&valDomIdioma&"', '"&valOperTel&"', '"&valFecExpGrado&"', '"&valRegGrado&"', '"&valperioalc&"', '"&valPeriodo&"', '"&valUniversidad&"', '"&valCentro&"', '"&valTipZona&"', '"&valNomZona&"', '"&valExpNomInst&"', '"&valExpTiempoAnio&"', '"&valExpTiempoMeses&"', '"&valProyectosInei&"', '"&valInstitucion&"', '"&valFechaNac&"', '"&valEdad&"', '"&valZonaRes&"', '"&valSeccionRes&"', '"&valGeoreferenciacion&"', '"&valRNP&"'"



		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3


		Set RsP = Nothing
end if

'----------------------------------------------------------------------------------

if lsTipo="149" then 

	lsid=  Request.Form("lsid_cc")
	lsVal = Request.Form("lsvalor")
	lsCampo=Request.Form("lsCampo")

	evento="<textarea name='txtp"&lsCampo&lsid&"'  class=p  id='txtp"&lsCampo&"'  onblur=""grabar_ModPresCron('"&lsid&"',this.value,'"&lsCampo&"');""  cols=60 rows=7  >"&lsVal&"</textarea>"

	response.Write(evento)
	
end if 

'--------------------------------------------------------------------------

if lsTipo="150" then 

	lsid=  Request.Form("lsId_cc")
	lsVal = Request.Form("lsvalor")
	lsCampo=Request.Form("lsCampo")
	
	id_usuario=Session("id_usuario")
	
	lsSQL =" exec pa_convocatoria_cronograma_actualiza "&lsid&" ,'"&lsCampo&"','"&lsVal&"', '"&id_usuario&"' "
	Call getRS(RS, lsSQL)
	
	lsSQL1 =" exec pa_convocatoria_cronograma_ver_campo "&lsid&", '"&lsCampo&"' "
	Call getRS(RS1, lsSQL1)

	objetivo = RS1(lsCampo)
	response.write(objetivo)
end if 

'-------------------------------------------------------------------------

if lsTipo="151" then 

	id_usuario=Session("id_usuario")
	id=  Request.Form("id")
	estado = Request.Form("estado")

	
	lsSQL =" exec pa_convocatoria_cronograma_actualiza_estado "&id&" ,'"&estado&"','"&id_usuario&"'"

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open lsSQL, MiCone, 3,3

		Set RsP = Nothing
		
end if 

'-------------------------------------------------------------------------

if lsTipo="152" then 

	id_usuario=Session("id_usuario")
	id_proceso=  Request.Form("id_proceso")
	id_cronograma = Request.Form("id_cronograma")

	
	lsSQL =" exec pa_convocatoria_cronograma_actualiza_cc "&id_proceso&" ,'"&id_cronograma&"','"&id_usuario&"'"

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open lsSQL, MiCone, 3,3

		Set RsP = Nothing
		
end if 

'-------------------------------------------------------------------------

if lsTipo="153" then 

	id_usuario=Session("id_usuario")
	proceso_id=  Request.Form("proceso_id")
	detalle = Request.Form("detalle")
	fec_ini = Request.Form("fec_ini")
	fec_fin = Request.Form("fec_fin")
	nota = Request.Form("nota")
	id_cc = Request.Form("id_cc")

	
	lsSQL =" exec pa_convocatoria_cronograma_insertar "&proceso_id&" ,'"&detalle&"','"&fec_ini&"','"&fec_fin&"','"&nota&"','"&id_cc&"','"&id_usuario&"' "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open lsSQL, MiCone, 3,3

		Set RsP = Nothing
		
end if 

'-------------------------------------------------------------------------

if lsTipo="154" then 

	id=  Request.Form("id")
	id_proy = Request.Form("id_proy")

	
	lsSQL =" exec uspGet_gastosOperativos_eliminar_reg "&id&" , "&id_proy&" "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open lsSQL, MiCone, 3,3

		Set RsP = Nothing
		
		response.write("1")
		
		
end if 

'-------------------------------------------------------------------------
if lsTipo="155" then 

id_presupuesto = Request.Form("id_presupuesto")

val="0"

sql1 = "EXEC dbo.pa_presupuesto_verifica '" & id_presupuesto & "' " 

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		certificado=RsP(1)
		convocado=RsP(2)
		
		Set RsP = Nothing
		
		if convocado>=1 THEN
		 response.Write("2")
		 response.end()
		end if
		
		if certificado>=1 THEN
		 response.Write("3")
		 response.end()
		end if
		
	sql2 = "EXEC dbo.pa_presupuesto_borrar '" & id_presupuesto & "'" 

		Set RsP2 = Server.CreateObject("ADODB.Recordset")
		RsP2.cursorlocation=3
		RsP2.Open sql2, MiCone, 3,3	
		
		response.Write("1")
		
		Set RsP2 = Nothing
		
end if

'-------------------------------------------------------------------------
if lsTipo="156" then 


ccdd=Request.Form("ccdd")
ccpp=Request.Form("ccpp")
ccpp = Mid(ccpp,4,2)
 
ccdi=Request.Form("ccdi")
ccdi = Mid(ccdi,6,2)

cargo=Request.Form("cargo")
id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")
convo=Request.Form("convo")


' ------------------------------- NIVEL 2 --------------EDNOM 2016
sql1 = "EXEC dbo.pa_v_ranking_x_ednom162_nivel_3_aprobcv '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&"6552"&"', 'N'"
sql2 = "EXEC dbo.pa_v_ranking_x_ednom162_nivel_3_aprobcv '"&ccdd&"','"&ccpp&"','"&ccdi&"','"&"6553"&"', 'N'"
sql3 = "EXEC dbo.pa_registrar_aulas_X_PROY_ednom2_n3 156, 6552"

response.Write(sql1)
response.Write(sql2)
response.Write(sql3)



		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP.Open sql1, MiCone, 3,3
		Set RsP = Nothing
		
		
		
		Set RsP1 = Server.CreateObject("ADODB.Recordset")
		RsP1.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP1.Open sql2, MiCone, 3,3
		Set RsP1 = Nothing
		
		
		Set RsP2 = Server.CreateObject("ADODB.Recordset")
		RsP2.cursorlocation=3
		MiCone.commandtimeout = 10000
		RsP2.Open sql3, MiCone, 3,3
		Set RsP2= Nothing
		
		
		

end if


if lsTipo="157" then 

varccddTot = Request.Form("lsDPTO")
varccppTot = Request.Form("lsPROV")
varccdiTot = Request.Form("lsDIST")
lsCierre=Request.Form("lsCierre")


id_proyecto=session("id_proyecto") 
id_rol=Session("txtTipoUsuarioValido")
id_usuario=Session("id_usuario")

cantvarccddTot=len(varccddTot)
nomccdd = Mid(varccddTot,3,cantvarccddTot-2)
varccdd = Mid(varccddTot,1,2)

cantvarccppTot=len(varccppTot)
nomccpp = Mid(varccppTot,5,cantvarccppTot-4)
varccpp = Mid(varccppTot,3,2)

cantvarccdiTot=len(varccdiTot)
nomccdi = Mid(varccdiTot,7,cantvarccdiTot-6)
varccdi = Mid(varccdiTot,5,2)

cargo = Mid(plsCargo,2)


sql1 = "EXEC dbo.pa_cierre_procesos_preseleccionEdnom '" & varccdd & "', '" & varccpp & "', '" & varccdi & "', '" & lsCierre & "', '"&id_proyecto&"' " 


		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		
		Set RsP = Nothing


end if


'-------------------------------------------------------------------------
if lsTipo="158" then 
''--RANKIN SUPERVISOR NACIONAL
	ccdd=Request.Form("ccdd")
	ccdd = Mid(ccdd,1,2) 
	ccpp=Request.Form("ccpp")
	ccpp = Mid(ccpp,3,2) 
	ccdi=Request.Form("ccdi")
	ccdi = Mid(ccdi,5,2)		

	sql = "EXEC pa_v_ranking_x_ece16_nivel_3_selec_asistente_L2 '"&ccdd&"','"&ccpp&"','"&ccdi&"', 6744, 'N' " 

    response.Write(sql)		
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql, MiCone, 3,3			
		Set RsP = Nothing		

	sql1 = "EXEC pa_v_ranking_x_ece16_nivel_3_selec_asistente_ecemc '"&ccdd&"','"&ccpp&"','"&ccdi&"', 6744, 'N' " 
        
	response.Write(sql1)				      
		Set RsP1 = Server.CreateObject("ADODB.Recordset")
		RsP1.cursorlocation=3
		RsP1.Open sql1, MiCone, 3,3			
		Set RsP1 = Nothing		

end if 


'-------------------------------------------------------------------------
if lsTipo="159" then 
'--RANKIN SUPERVISOR NACIONAL BILINGUE
	ccdd=Request.Form("ccdd")
	ccdd = Mid(ccdd,1,2) 
	ccpp=Request.Form("ccpp")
	ccpp = Mid(ccpp,3,2) 
	ccdi=Request.Form("ccdi")
	ccdi = Mid(ccdi,5,2)	

	sql = "EXEC pa_v_ranking_x_ece16_nivel_3_selec_asistente_super_bi '"&ccdd&"','"&ccpp&"','"&ccdi&"', 6745, 'N' "         
    response.Write(sql)		
		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql, MiCone, 3,3			
		Set RsP = Nothing	
end if 


'-------------------------------------------------------------------------


if lsTipo="167" then ' INGRESAR META CAPA

id_cc=  Request.Form("Id_ConvocatoriaCargo")

lsSQL = " EXEC pa_convocatoriacargo_AsignaUbigeo '" & id_cc & "'  "

  Call getRS(RS, lsSQL)
  response.Write("2")

end if


'----------------------------------------------------------------------------------

if lsTipo="168" then 

	lsid=  Request.Form("lsid_cc")
	lsVal = Request.Form("lsvalor")
	lsCampo=Request.Form("lsCampo")


	evento="<textarea name='txtp"&lsCampo&"'  class=p  id='txtp"&lsCampo&"'  onblur=""grabar_ModPres('"&lsid&"',this.value,'"&lsCampo&"');""  cols=120 rows=15  >"&lsVal&"</textarea>"


	response.Write(evento)
	
end if 

'--------------------------------------------------------------------------

if lsTipo="169" then 

	lsid=  Request.Form("lsId_cc")
	lsVal = Request.Form("lsvalor")
	lsCampo=Request.Form("lsCampo")
	
	lsSQL =" exec uspUpd_ccObjetivo_tdr "&lsid&" ,'"&lsCampo&"','"&lsVal&"'"
	Call getRS(RS, lsSQL)
	
	lsSQL1 =" exec uspGet_ccObjetivo_tdr "&lsid&", '"&lsCampo&"' "
	Call getRS(RS1, lsSQL1)

	objetivo = RS1(lsCampo)
	response.write(objetivo)
end if 

'-------------------------------------------------------------------------



if lsTipo="170" then 

	id_armada=  Request.Form("id_armada")

	lsid=  Request.Form("lsid_cc")
	lsVal = Request.Form("lsvalor")
	lsCampo=Request.Form("lsCampo")
origen=Request.Form("origen")

	evento="<textarea name='txtp"&lsCampo&"'  class=p  id='txtp"&lsCampo&"'  onblur=""grabar_ModPres_armada("&id_armada&",'"&lsid&"',this.value,'"&lsCampo&"',"&origen&");""  cols=120 rows=15  >"&lsVal&"</textarea>"


	response.Write(evento)
	
end if 

'--------------------------------------------------------------------------

if lsTipo="171" then 
	id_armada=  Request.Form("id_armada")

	lsid=  Request.Form("lsId_cc")
	lsVal = Request.Form("lsvalor")
	lsCampo=Request.Form("lsCampo")
	
	lsSQL =" exec uspUpd_ccObjetivo_tdr_prod "&lsid&" ,'"&lsCampo&"','"&lsVal&"',"&id_armada
	Call getRS(RS, lsSQL)
	
	lsSQL1 =" exec uspGet_ccObjetivo_tdr_prod "&lsid&", '"&lsCampo&"',"&id_armada
	Call getRS(RS1, lsSQL1)

	objetivo = RS1(lsCampo)
	response.write(objetivo)
end if 

'-------------------------------------------------------------------------




if lsTipo="172" then 


lsvalor =Request.Form("datos")
	
SQL1 = "exec dbo.getPresupuesto_nvo '"& lsvalor &"'  "	

Call getRS(RS, SQL1)

response.Write("<input name=""txtvalmax"" type=""hidden"" id=""txtvalmax"" value="""&rs("totalPEA_P")&"""><input name=""cmbperiodo"" type=""hidden"" id=""cmbperiodo"" value="""&rs("tipoPeriodo_P")&"""><input name=""txttsueldo"" type=""hidden"" id=""txttsueldo"" value="""&rs("sueldo")&"""><input name=""txtnPermax"" type=""hidden"" id=""txtnPermax"" value="""&rs("nPeriodo_P")&"""><input name=""txttipoperiodo"" type=""hidden"" id=""txttipoperiodo"" value="""&rs("dttipoPeriodo")&"""> <font class='alerta5'>(*)</font>")

end if



if lsTipo="173" then 


id_proyecto=session("id_proyecto") 
id_usuario=Session("id_usuario")
lsid=  Request.Form("cmbCargo")
ls_cadena = ""


sql1 = "EXEC dbo.getPresupuesto_nvo_armadas  "&lsid

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open sql1, MiCone, 3,3
		
		i  =  0
		Do While Not RsP.EOF
			i = i +1

			ls_cadena = ls_cadena+ "<tr>" &"<td class='etiqueta' > Armada N&deg;&nbsp;"&i&" </td>" &"<td colspan='3'><input type='text'  disabled value = "&RsP("montoarmada")&" name='n"&i&"' id='n"&i&"' onkeypress='return TextUtil.allowChars(this, event)'  validchars='1234567890.'>(.)decimal</td>" &"</tr>"
							

			RsP.MoveNext
		Loop	
				
Set RsP = Nothing
	
	response.write(ls_cadena)
end if




if lsTipo="174" then 


lsNombre=Request.Form("cmbCargo")
lsnPeriodo =Request.Form("lsnPeriodo")
lstperiodo =Request.Form("lstperiodo")
lsArmadas =Request.Form("lsArmadas")
lsNArmadas =Request.Form("lsNArmadas")
lsCPea =Request.Form("lsCPea")
lsSede =Request.Form("lsSede")
lsDepen =Request.Form("lsDepen")
lsUsuario =Request.Form("lsUsuario")


id_Proyecto=Session("id_proyecto")

SQL1 = "exec dbo.usp_insert_cargoCabe_nvo '"& lsNombre &"','"& lsnPeriodo &"','"& lstperiodo &"','"& lsArmadas &"','"& lsCPea &"','"& lsSede &"','"& lsDepen &"' ,'"& lsUsuario &"', '"&lsNArmadas&"' "

		Set RsP = Server.CreateObject("ADODB.Recordset")
		RsP.cursorlocation=3
		RsP.Open SQL1, MiCone, 3,3
		
		Set RsP = Nothing
		
		
		
		

end if


if lsTipo="175" then 


lsid=  Request.Form("lsId_presupueto")
lsVal = Request.Form("lsvalor")
lsCampo=Request.Form("lsCampo")
id_usuario=  Session("id_usuario")

lsSQL =" exec PA_PRESUPUESTO_DETALLE_ACT_NVO '"&lsid&"' ,'"&lsCampo&"','"&lsVal&"', '"&id_usuario&"' "

  Call getRS(RS, lsSQL)
  
  response.Write(lsid)

end if 


if lsTipo="176" then 

oficio=  Request.Form("oficio")
fecha=  Request.Form("fecha")
Freg=  Request.Form("Freg")
Fexec=  Request.Form("Fexec")
cenvdatos=  Request.Form("cenvdatos")
idProyecto=Session("id_proyecto")

	lsSQL = "EXEC dbo.upd_OfContratacionAB_nvo '"&oficio& "','"&fecha& "','"&Freg& "','"&Fexec& "','"&cenvdatos& "' ,'"&idProyecto& "' " 

	Call getRS(RS, lsSQL)
	
end if



if lsTipo="177" then 
lsidper=Request.Form("lsidper")
lsvalor=Request.Form("lsvalor")

id_proyecto=Session("id_proyecto")

lsSQL = "EXEC dbo.uspUpd_contrato_nvo '" & lsidper & "','" & lsvalor & "', '"&id_proyecto&"'"	


Call getRS(RS, lsSQL)


end if


'ACTUALIZACIÓN DE FIRMAS DE CONTRATO
'====================================

if lsTipo="178" then 
CODI_EMPL_PER=Request.Form("CODI_EMPL_PER")
FECH_INIC_CNT=Request.Form("FECH_INIC_CNT")
FECH_RESO_CNT=Request.Form("FECH_RESO_CNT")

id_proyecto=Session("id_proyecto")

lsSQL = "EXEC SP_UPDATE_IMPRESION_CONT '" & CODI_EMPL_PER & "','" & FECH_INIC_CNT & "', '"&FECH_RESO_CNT&"'"

response.write(lsSQL)

Call getRS(RS, lsSQL)

end if
%>








