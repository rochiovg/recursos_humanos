<%@ Language=VBScript %>
<!-- #include file="conexion.asp"  --> 
<!--#include file="Include/pd_funcion.asp"--> 

<%

 id_usuario=  Session("id_usuario")

 txNumConvoc=Request("txNumConvoc")
 txtIdPresupuestario=Request("txtIdPresupuestario") 
 txtIdPresupuesto=Request("txtIdPresupuesto") 
 txtfechIniConv=Request("txtfechIniConv") 
 txtfechFinConv=Request("txtfechFinConv") 
 txtDescConvoc=Request("txtDescConvoc")
 txtfechFinProceso=Request("txtfechFinProceso")
 txtestado=Request("txtestado") 
 txtusuario=Request("txtusuario") 
 txtipusuario=Request("txtipusuario") 
 
  txtObjetivo=Request("txtObjetivo") 
  txtPerfil=Request("txtPerfil") 
  txtModalidad=Request("txtModalidad") 
  'txtProceso=Request("txtProceso") 
  txtVigencia=Request("txtVigencia")
  txtNivel=Request("txtNivel")
  txtGrado=Request("txtGrado")
  txtpea=Request("txtpea")
 
  txtBonificacion=Request("txtBonificacion")
  txtCaracteristicas=Request("txtCaracteristicas")
  txtDatosComp=Request("txtDatosComp")
  'txtInscripcion=Request("txtInscripcion")
  'txtresultadosCV=Request("txtresultadosCV")
  'txtPruebaCon=Request("txtPruebaCon")
  'txtPubResultadosP=Request("txtPubResultadosP")
  'txtEntrevistaPer=Request("txtEntrevistaPer")
  'txtResultFinal=Request("txtResultFinal")
  txtExperiencia1=Request("txtExperiencia1")
  txtExperiencia2=Request("txtExperiencia2")
  'txtFechasPub =Request("txtFechasPub") 
  'txtEvCurricular =Request("txtEvCurricular")
  cmbComptencias =Request("cmbComptencias")
  cmbConocimientos=Request("cmbConocimientos")
  cmbMomentoComp=Request("cmbMomentoComp")
  cmbMomentoCono=Request("cmbMomentoCono")
  Activar_competencia=Request("Activar_competencia")
  Activar_conocimiento=Request("Activar_conocimiento")
  cronograma_a=Request("cronograma_a")
  txtExperiencia3=Request("txtExperiencia3")
  txtExperiencia4=Request("txtExperiencia4")
  txtExperiencia5=Request("txtExperiencia5")
 
	response.ContentType="text/html; charset=iso-8859-1"
	
  	set Rs1 = Server.Createobject("ADODB.Recordset")
	
	sql1= " Exec dbo.usp_ValidarConvocCargo '"&txNumConvoc&"','"&txtIdPresupuestario&"','"&txtIdPresupuesto&"';"
	
	Rs1.cursorlocation=3
	Rs1.Open sql1, MiCone,3,3
	

	if Rs1.RecordCount>0 then
	contsuma = 1
	else
    contsuma =0	 
    end if
	
IF contsuma = 0 THEN 
	

	
	set Rs2 = Server.Createobject("ADODB.Recordset")
	

	sql= " Exec dbo.pa_convocatotiacargo_guardar '"&txNumConvoc&"','"&txtIdPresupuestario&"','"&txtIdPresupuesto&"','"&txtfechFinProceso&"','"&txtusuario&"','"&txtipusuario&"' ,'"&txtObjetivo&"','"&txtPerfil&"','"&txtModalidad&"', '"&txtVigencia&"','"&txtNivel&"','"&txtGrado&"','"&txtpea&"','"&txtBonificacion&"' ,'"&txtCaracteristicas&"' ,'"&txtDatosComp&"' ,'"&txtExperiencia1&"' ,'"&txtExperiencia2&"', '"& cmbComptencias&"',  '"&cmbConocimientos&"',  '"&cmbMomentoComp&"',  '"&cmbMomentoCono&"', '"& Activar_competencia&"', '"&Activar_conocimiento&"', '"&cronograma_a&"', '"&id_usuario&"', '"&txtExperiencia3&"', '"&txtExperiencia4&"', '"&txtExperiencia5&"' "
	
	Rs2.cursorlocation=3
	Rs2.Open sql, MiCone,3,3
	
    Set Rs2= Nothing
	
ELSE
Response.write "1"

END IF

set Micone=nothing


%>
