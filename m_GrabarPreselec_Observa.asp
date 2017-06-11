<%@ Language=VBScript %>
<!--#include file="conexion.asp"--> 
<!--#include file="Include/pd_Funcion.asp"-->

<%

response.ContentType="text/html; charset=iso-8859-1"

idper= Request("idper")
valor= Request("valor")
ObserPres= Request("vObserPres")

lsUsuarioID = Session("id_usuario")
lsidProyecto = Session("id_proyecto")


if  lsidProyecto<>"" Then

	sql1="exec dbo.pa_ficha_update_preselec_observa '"&trim(idper)&"','"&trim(valor)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"','"&trim(ObserPres)&"' "
	
    'sql1="exec dbo.pa_ficha_update_preselec '"&trim(idper)&"','"&trim(valor)&"', '"&trim(lsUsuarioID)&"','"&trim(lsidProyecto)&"' "
		
	Call getRS(RS, sql1)

	sql2="exec dbo.pa_Ficha_mostrar_notaCV '"&(idper)&"','"&(lsidProyecto)&"' "
			
	Call getRS(RS1, sql2)
	response.write RS1("estado_pre")
			

Else

	Response.Redirect("default.asp")
	
End If
 
%>
